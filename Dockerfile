FROM node:lts-bullseye-slim

RUN apt-get update -y && apt-get install curl -y \
  && apt-get clean && rm -f /var/lib/apt/lists/*_* 

WORKDIR "/usr/app"

RUN curl -LJO https://github.com/pgaskin/kepubify/releases/download/v4.0.4/kepubify-linux-64bit \
  && mv kepubify-linux-64bit /usr/bin/kepubify \
  && chmod +x /usr/bin/kepubify

COPY package.json .

RUN npm i --quiet

COPY . .

# RUN mkdir -p /usr/app/uploads

# set runner ENV
ENV NODE_ENV="production"