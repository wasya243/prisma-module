#!/bin/sh

echo "⏳ Waiting for PostgreSQL to be ready..."

until nc -z -v -w30 postgres 5432

do
  echo "🔁 Waiting for database connection..."
  sleep 2
done

echo "✅ PostgreSQL is up - running Prisma commands..."

npx prisma db pull

npx prisma generate

echo "✅ Prisma Client generated successfully!"