--Week 5 - Wednesday Questions
--
--1. List all customers who live in Texas (use JOINs)

--
--2. Get all payments above $6.99 with the Customer’s full name

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
SELECT customer_id FROM payment
WHERE amount > 6.99);

--
--3. Show all customer names who have made payments over $175 (use subqueries)

SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
SELECT customer_id FROM payment
WHERE amount > 175);

--
--4. List all customers that live in Argentina (use the city table)
--

select * from city
where country_id = 6

--5. Which film category has the most movies in it?

SELECT category_id, name
FROM category
WHERE category_id IN(
SELECT category_id FROM film_category
ORDER BY COUNT(*) DESC
LIMIT 1);

--
--6. What film had the most actors in it?

SELECT film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(*) DESC
LIMIT 1

--
--7. Which actor has been in the least movies?

SELECT actor_id
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(*) 
LIMIT 1

--
--8. Which country has the most cities?

SELECT country_id
FROM city
WHERE country_id IN(
SELECT country_id FROM country
group by country_id 
ORDER BY COUNT(*) DESC
LIMIT 1);
--
--9. List the actors who have been in more than 3 films but less than 6.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN(
SELECT actor_id FROM film_actor
group by actor_id 
having COUNT(*) between 3 and 6
)