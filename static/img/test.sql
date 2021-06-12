-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 07, 2021 at 11:39 AM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertising`
--

CREATE TABLE `advertising` (
  `id` int UNSIGNED NOT NULL,
  `integration` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'unitSlot or autoFit',
  `is_responsive` tinyint(1) DEFAULT '0',
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `provider_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Translated in the languages files',
  `tracking_code_large` mediumtext COLLATE utf8_unicode_ci,
  `tracking_code_medium` mediumtext COLLATE utf8_unicode_ci,
  `tracking_code_small` mediumtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advertising`
--

INSERT INTO `advertising` (`id`, `integration`, `is_responsive`, `slug`, `provider_name`, `description`, `tracking_code_large`, `tracking_code_medium`, `tracking_code_small`, `active`) VALUES
(1, 'unitSlot', 0, 'top', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 1),
(2, 'unitSlot', 0, 'bottom', 'Google AdSense', 'advertising_unitSlot_hint', '', '', '', 1),
(3, 'autoFit', 1, 'auto', 'Google AdSense', 'advertising_autoFit_hint', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `blacklist`
--

CREATE TABLE `blacklist` (
  `id` bigint UNSIGNED NOT NULL,
  `type` enum('domain','email','ip','word') COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon_class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `type` enum('classified','job-offer','job-search','not-salable') COLLATE utf8_unicode_ci DEFAULT 'classified' COMMENT 'Only select this for parent categories',
  `is_for_permanent` tinyint(1) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `translation_lang`, `translation_of`, `parent_id`, `name`, `slug`, `description`, `picture`, `icon_class`, `lft`, `rgt`, `depth`, `type`, `is_for_permanent`, `active`) VALUES
(1, 'en', 1, NULL, 'Automobiles', 'automobiles', NULL, 'app/categories/skin-blue/car.png', 'fa fa-car', 1, 10, 0, 'classified', 0, 1),
(2, 'en', 2, 1, 'Cars', 'cars', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 2, 3, 1, 'classified', 0, 1),
(3, 'en', 3, 1, 'Buses & Minibus', 'buses-and-minibus', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 3, 4, 1, 'classified', 0, 1),
(4, 'en', 4, 1, 'Heavy Equipment', 'heavy-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 4, 5, 1, 'classified', 0, 1),
(5, 'en', 5, 1, 'Motorcycles & Scooters', 'motorcycles-and-scooters', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 5, 6, 1, 'classified', 0, 1),
(6, 'en', 6, 1, 'Trucks & Trailers', 'trucks-and-trailers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 6, 7, 1, 'classified', 0, 1),
(7, 'en', 7, 1, 'Vehicle Parts & Accessories', 'car-parts-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 7, 8, 1, 'classified', 0, 1),
(8, 'en', 8, 1, 'Watercraft & Boats', 'watercraft-and-boats', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 8, 9, 1, 'classified', 0, 1),
(9, 'en', 9, NULL, 'Phones & Tablets', 'phones-and-tablets', NULL, 'app/categories/skin-blue/mobile-alt.png', 'icon-laptop', 11, 17, 0, 'classified', 0, 1),
(10, 'en', 10, 9, 'Mobile Phones', 'mobile-phones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 12, 13, 1, 'classified', 0, 1),
(11, 'en', 11, 9, 'Accessories for Mobile Phones & Tablets', 'mobile-phones-tablets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 13, 14, 1, 'classified', 0, 1),
(12, 'en', 12, 9, 'Smart Watches & Trackers', 'smart-watches-and-trackers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 14, 15, 1, 'classified', 0, 1),
(13, 'en', 13, 9, 'Tablets', 'tablets', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 15, 16, 1, 'classified', 0, 1),
(14, 'en', 14, NULL, 'Electronics', 'electronics', NULL, 'app/categories/skin-blue/fa-laptop.png', 'icon-theatre', 18, 35, 0, 'classified', 0, 1),
(15, 'en', 15, 14, 'Accessories & Supplies for Electronics', 'accessories-supplies for Electronics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 19, 20, 1, 'classified', 0, 1),
(16, 'en', 16, 14, 'Laptops & Computers', 'laptops-and-computers', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 20, 21, 1, 'classified', 0, 1),
(17, 'en', 17, 14, 'TV & DVD Equipment', 'tv-dvd-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 21, 22, 1, 'classified', 0, 1),
(18, 'en', 18, 14, 'Audio & Music Equipment', 'audio-music-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 22, 23, 1, 'classified', 0, 1),
(19, 'en', 19, 14, 'Computer Accessories', 'computer-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 23, 24, 1, 'classified', 0, 1),
(20, 'en', 20, 14, 'Computer Hardware', 'computer-hardware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 24, 25, 1, 'classified', 0, 1),
(21, 'en', 21, 14, 'Computer Monitors', 'computer-monitors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 25, 26, 1, 'classified', 0, 1),
(22, 'en', 22, 14, 'Headphones', 'headphones', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 26, 27, 1, 'classified', 0, 1),
(23, 'en', 23, 14, 'Networking Products', 'networking-products', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 27, 28, 1, 'classified', 0, 1),
(24, 'en', 24, 14, 'Photo & Video Cameras', 'photo-video-cameras', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 28, 29, 1, 'classified', 0, 1),
(25, 'en', 25, 14, 'Printers & Scanners', 'printers-and-scanners', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 29, 30, 1, 'classified', 0, 1),
(26, 'en', 26, 14, 'Security & Surveillance', 'security-and-surveillance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 30, 31, 1, 'classified', 0, 1),
(27, 'en', 27, 14, 'Software', 'software', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 31, 32, 1, 'classified', 0, 1),
(28, 'en', 28, 14, 'Video Games', 'video-games', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 32, 33, 1, 'classified', 0, 1),
(29, 'en', 29, 14, 'Game Consoles', 'video-game-consoles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 33, 34, 1, 'classified', 0, 1),
(30, 'en', 30, NULL, 'Furniture & Appliances', 'furniture-appliances', NULL, 'app/categories/skin-blue/couch.png', 'icon-basket-1', 36, 44, 0, 'classified', 0, 1),
(31, 'en', 31, 30, 'Furniture - Tableware', 'furniture-tableware', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 37, 38, 1, 'classified', 0, 1),
(32, 'en', 32, 30, 'Antiques - Art - Decoration', 'antiques-art-decoration', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 38, 39, 1, 'classified', 0, 1),
(33, 'en', 33, 30, 'Appliances', 'appliances', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 39, 40, 1, 'classified', 0, 1),
(34, 'en', 34, 30, 'Garden', 'garden', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 40, 41, 1, 'classified', 0, 1),
(35, 'en', 35, 30, 'Toys - Games - Figurines', 'toys-games-figurines', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 41, 42, 1, 'classified', 0, 1),
(36, 'en', 36, 30, 'Wine & Gourmet - Recipes', 'wine-gourmet-recipes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 42, 43, 1, 'classified', 0, 1),
(37, 'en', 37, NULL, 'Real estate', 'real-estate', NULL, 'app/categories/skin-blue/fa-home.png', 'icon-home', 45, 55, 0, 'classified', 0, 1),
(38, 'en', 38, 37, 'Houses & Apartments For Rent', 'houses-apartments-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 46, 47, 1, 'classified', 0, 1),
(39, 'en', 39, 37, 'Houses & Apartments For Sale', 'houses-apartments-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 47, 48, 1, 'classified', 0, 1),
(40, 'en', 40, 37, 'Land & Plots for Rent', 'land-and-plots-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 48, 49, 1, 'classified', 0, 1),
(41, 'en', 41, 37, 'Land & Plots For Sale', 'land-and-plots-for-sale', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 49, 50, 1, 'classified', 0, 1),
(42, 'en', 42, 37, 'Commercial Property For Rent', 'commercial-property-for-rent', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 50, 51, 1, 'classified', 0, 1),
(43, 'en', 43, 37, 'Commercial Property For Sale', 'commercial-properties', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 51, 52, 1, 'classified', 0, 1),
(44, 'en', 44, 37, 'Event centres, Venues and Workstations', 'event-centers-and-venues', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 52, 53, 1, 'classified', 0, 1),
(45, 'en', 45, 37, 'Short Rental', 'temporary-and-vacation-rentals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 53, 54, 1, 'classified', 0, 1),
(46, 'en', 46, NULL, 'Animals & Pets', 'animals-and-pets', NULL, 'app/categories/skin-blue/paw.png', 'icon-guidedog', 56, 65, 0, 'classified', 0, 1),
(47, 'en', 47, 46, 'Birds', 'birds', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 57, 58, 1, 'classified', 0, 1),
(48, 'en', 48, 46, 'Cats & Kittens', 'cats-and-kittens', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 58, 59, 1, 'classified', 0, 1),
(49, 'en', 49, 46, 'Dogs', 'dogs-and-puppies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 59, 60, 1, 'classified', 0, 1),
(50, 'en', 50, 46, 'Fish', 'fish', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 60, 61, 1, 'classified', 0, 1),
(51, 'en', 51, 46, 'Pet\'s Accessories', 'pets-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 61, 62, 1, 'classified', 0, 1),
(52, 'en', 52, 46, 'Reptiles', 'reptiles', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 62, 63, 1, 'classified', 0, 1),
(53, 'en', 53, 46, 'Other Animals', 'other-animals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 63, 64, 1, 'classified', 0, 1),
(54, 'en', 54, NULL, 'Fashion', 'fashion', NULL, 'app/categories/skin-blue/tshirt.png', 'icon-heart', 66, 75, 0, 'classified', 0, 1),
(55, 'en', 55, 54, 'Bags', 'bags', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 67, 68, 1, 'classified', 0, 1),
(56, 'en', 56, 54, 'Clothing', 'clothing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 68, 69, 1, 'classified', 0, 1),
(57, 'en', 57, 54, 'Clothing Accessories', 'clothing-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 69, 70, 1, 'classified', 0, 1),
(58, 'en', 58, 54, 'Jewelry', 'jewelry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 70, 71, 1, 'classified', 0, 1),
(59, 'en', 59, 54, 'Shoes', 'shoes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 71, 72, 1, 'classified', 0, 1),
(60, 'en', 60, 54, 'Watches', 'watches', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 72, 73, 1, 'classified', 0, 1),
(61, 'en', 61, 54, 'Wedding Wear & Accessories', 'wedding-wear-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 73, 74, 1, 'classified', 0, 1),
(62, 'en', 62, NULL, 'Beauty & Well being', 'beauty-well-being', NULL, 'app/categories/skin-blue/spa.png', 'icon-search', 76, 88, 0, 'classified', 0, 1),
(63, 'en', 63, 62, 'Bath & Body', 'bath-and-body', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 77, 78, 1, 'classified', 0, 1),
(64, 'en', 64, 62, 'Fragrance', 'fragrance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 78, 79, 1, 'classified', 0, 1),
(65, 'en', 65, 62, 'Hair Beauty', 'hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 79, 80, 1, 'classified', 0, 1),
(66, 'en', 66, 62, 'Makeup', 'makeup', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 80, 81, 1, 'classified', 0, 1),
(67, 'en', 67, 62, 'Sexual Wellness', 'sexual-wellness', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 81, 82, 1, 'classified', 0, 1),
(68, 'en', 68, 62, 'Skin Care', 'skin-care', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 82, 83, 1, 'classified', 0, 1),
(69, 'en', 69, 62, 'Tobacco Accessories', 'tobacco-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 83, 84, 1, 'classified', 0, 1),
(70, 'en', 70, 62, 'Tools & Accessories', 'tools-and-accessories', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 84, 85, 1, 'classified', 0, 1),
(71, 'en', 71, 62, 'Vitamins & Supplements', 'vitamins-and-supplements', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 85, 86, 1, 'classified', 0, 1),
(72, 'en', 72, 62, 'Pro Massage', 'pro-massage', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 86, 87, 1, 'classified', 0, 1),
(73, 'en', 73, NULL, 'Jobs', 'jobs', NULL, 'app/categories/skin-blue/mfglabs-users.png', 'icon-megaphone-1', 89, 114, 0, 'job-offer', 0, 1),
(74, 'en', 74, 73, 'Agriculture - Environment', 'agriculture-environment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 90, 91, 1, 'job-offer', 0, 1),
(75, 'en', 75, 73, 'Assistantship - Secretariat - Helpdesk', 'assistantship-secretariat-helpdesk', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 91, 92, 1, 'job-offer', 0, 1),
(76, 'en', 76, 73, 'Automotive - Mechanic', 'automotive-mechanic', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 92, 93, 1, 'job-offer', 0, 1),
(77, 'en', 77, 73, 'BTP - Construction - Building', 'btp-construction-building', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 93, 94, 1, 'job-offer', 0, 1),
(78, 'en', 78, 73, 'Trade - Business Services', 'trade-business-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 94, 95, 1, 'job-offer', 0, 1),
(79, 'en', 79, 73, 'Commercial - Sale Jobs', 'commercial-sale-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 95, 96, 1, 'job-offer', 0, 1),
(80, 'en', 80, 73, 'Accounting - Management - Finance', 'accounting-management-finance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 96, 97, 1, 'job-offer', 0, 1),
(81, 'en', 81, 73, 'Steering - Manager', 'steering-manager', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 97, 98, 1, 'job-offer', 0, 1),
(82, 'en', 82, 73, 'Aesthetics - Hair - Beauty', 'aesthetics-hair-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 98, 99, 1, 'job-offer', 0, 1),
(83, 'en', 83, 73, 'Public Service Jobs', 'public-service-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 99, 100, 1, 'job-offer', 0, 1),
(84, 'en', 84, 73, 'Real Estate Jobs', 'real-estate-jobs', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 100, 101, 1, 'job-offer', 0, 1),
(85, 'en', 85, 73, 'Independent - Freelance - Telecommuting', 'independent-freelance-telecommuting', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 101, 102, 1, 'job-offer', 0, 1),
(86, 'en', 86, 73, 'Computers - Internet - Telecommunications', 'computers-internet-telecommunications', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 102, 103, 1, 'job-offer', 0, 1),
(87, 'en', 87, 73, 'Industry, Production & engineering', 'industry-production-engineering', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 103, 104, 1, 'job-offer', 0, 1),
(88, 'en', 88, 73, 'Marketing - Communication', 'marketing-communication', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 104, 105, 1, 'job-offer', 0, 1),
(89, 'en', 89, 73, 'Babysitting - Nanny Work', 'babysitting-nanny-work', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 105, 106, 1, 'job-offer', 0, 1),
(90, 'en', 90, 73, 'HR - Training - Education', 'hr-training-education', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 106, 107, 1, 'job-offer', 0, 1),
(91, 'en', 91, 73, 'Medical - Healthcare - Social', 'medical-healthcare-social', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 107, 108, 1, 'job-offer', 0, 1),
(92, 'en', 92, 73, 'Security - Guarding', 'security-guarding', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 108, 109, 1, 'job-offer', 0, 1),
(93, 'en', 93, 73, 'Household Services - Housekeeping', 'household-services-housekeeping', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 109, 110, 1, 'job-offer', 0, 1),
(94, 'en', 94, 73, 'Tourism - Hotels - Restaurants - Leisure', 'tourism-hotels-restaurants-leisure', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 110, 111, 1, 'job-offer', 0, 1),
(95, 'en', 95, 73, 'Transportation - Logistics', 'transportation-logistics', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 111, 112, 1, 'job-offer', 0, 1),
(96, 'en', 96, 73, 'Others Jobs Offer', 'others-jobs-offer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 112, 113, 1, 'job-offer', 0, 1),
(97, 'en', 97, NULL, 'Services', 'services', NULL, 'app/categories/skin-blue/ion-clipboard.png', 'fa fa-briefcase', 115, 133, 0, 'classified', 0, 1),
(98, 'en', 98, 97, 'Casting, Model, Photographer', 'casting-model-photographer', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 116, 117, 1, 'classified', 0, 1),
(99, 'en', 99, 97, 'Carpooling', 'carpooling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 117, 118, 1, 'classified', 0, 1),
(100, 'en', 100, 97, 'Moving, Furniture Guard', 'moving-furniture-guard', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 118, 119, 1, 'classified', 0, 1),
(101, 'en', 101, 97, 'Destocking - Commercial', 'destocking-commercial', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 119, 120, 1, 'classified', 0, 1),
(102, 'en', 102, 97, 'Industrial Equipment', 'industrial-equipment', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 120, 121, 1, 'classified', 0, 1),
(103, 'en', 103, 97, 'Aesthetics, Hairstyling', 'aesthetics-hairstyling', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 121, 122, 1, 'classified', 0, 1),
(104, 'en', 104, 97, 'Materials and Equipment Pro', 'materials-and-equipment-pro', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 122, 123, 1, 'classified', 0, 1),
(105, 'en', 105, 97, 'Event Organization Services', 'event-organization-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 123, 124, 1, 'classified', 0, 1),
(106, 'en', 106, 97, 'Service Provision', 'service-provision', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 124, 125, 1, 'classified', 0, 1),
(107, 'en', 107, 97, 'Health, Beauty', 'health-beauty', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 125, 126, 1, 'classified', 0, 1),
(108, 'en', 108, 97, 'Artisan, Troubleshooting, Handyman', 'artisan-troubleshooting-handyman', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 126, 127, 1, 'classified', 0, 1),
(109, 'en', 109, 97, 'Computing Services', 'computing-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 127, 128, 1, 'classified', 0, 1),
(110, 'en', 110, 97, 'Tourism and Travel Services', 'tourism-and-travel-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 128, 129, 1, 'classified', 0, 1),
(111, 'en', 111, 97, 'Translation, Writing', 'translation-writing', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 129, 130, 1, 'classified', 0, 1),
(112, 'en', 112, 97, 'Construction - Renovation - Carpentry', 'construction-renovation-carpentry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 130, 131, 1, 'classified', 0, 1),
(113, 'en', 113, 97, 'Other services', 'other-services', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 131, 132, 1, 'classified', 0, 1),
(114, 'en', 114, NULL, 'Learning', 'learning', NULL, 'app/categories/skin-blue/fa-graduation-cap.png', 'icon-book-open', 134, 143, 0, 'classified', 0, 1),
(115, 'en', 115, 114, 'Language Classes', 'language-classes', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 135, 136, 1, 'classified', 0, 1),
(116, 'en', 116, 114, 'Computer Courses', 'computer-courses', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 136, 137, 1, 'classified', 0, 1),
(117, 'en', 117, 114, 'Tutoring, Private Lessons', 'tutoring-private-lessons', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 137, 138, 1, 'classified', 0, 1),
(118, 'en', 118, 114, 'Vocational Training', 'vocational-training', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 138, 139, 1, 'classified', 0, 1),
(119, 'en', 119, 114, 'Maths, Physics, Chemistry', 'maths-physics-chemistry', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 139, 140, 1, 'classified', 0, 1),
(120, 'en', 120, 114, 'Music, Theatre, Dance', 'music-theatre-dance', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 140, 141, 1, 'classified', 0, 1),
(121, 'en', 121, 114, 'School support', 'school-support', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 141, 142, 1, 'classified', 0, 1),
(122, 'en', 122, NULL, 'Local Events', 'local-events', NULL, 'app/categories/skin-blue/calendar-alt.png', 'icon-megaphone-1', 144, 158, 0, 'classified', 0, 1),
(123, 'en', 123, 122, 'Concerts & Festivals', 'concerts-and-festivals', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 145, 146, 1, 'classified', 0, 1),
(124, 'en', 124, 122, 'Networking & Meetups', 'networking-and-meetups', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 146, 147, 1, 'classified', 0, 1),
(125, 'en', 125, 122, 'Sports & Outdoors', 'sports-and-outdoors', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 147, 148, 1, 'classified', 0, 1),
(126, 'en', 126, 122, 'Trade Shows & Conventions', 'trade-shows-conventions', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 148, 149, 1, 'classified', 0, 1),
(127, 'en', 127, 122, 'Training & Seminars', 'training-and-seminars', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 149, 150, 1, 'classified', 0, 1),
(128, 'en', 128, 122, 'Ceremonies', 'ceremonies', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 150, 151, 1, 'classified', 0, 1),
(129, 'en', 129, 122, 'Conferences', 'conferences', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 151, 152, 1, 'classified', 0, 1),
(130, 'en', 130, 122, 'Weddings', 'weddings', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 152, 153, 1, 'classified', 0, 1),
(131, 'en', 131, 122, 'Birthdays', 'birthdays', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 153, 154, 1, 'classified', 0, 1),
(132, 'en', 132, 122, 'Family Events', 'family-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 154, 155, 1, 'classified', 0, 1),
(133, 'en', 133, 122, 'Nightlife', 'nightlife', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 155, 156, 1, 'classified', 0, 1),
(134, 'en', 134, 122, 'All others events', 'all-others-events', NULL, 'app/default/categories/fa-folder-skin-blue.png', NULL, 156, 157, 1, 'classified', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_field`
--

CREATE TABLE `category_field` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `field_id` int UNSIGNED DEFAULT NULL,
  `disabled_in_subcategories` tinyint UNSIGNED DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_field`
--

INSERT INTO `category_field` (`id`, `category_id`, `field_id`, `disabled_in_subcategories`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 1, 0, NULL, 2, 3, 1),
(2, 1, 2, 0, NULL, 4, 5, 1),
(3, 1, 3, 0, NULL, 6, 7, 1),
(4, 1, 4, 0, NULL, 14, 15, 1),
(5, 1, 5, 0, NULL, 8, 9, 1),
(6, 1, 6, 0, NULL, 16, 17, 1),
(7, 1, 7, 0, NULL, 10, 11, 1),
(8, 1, 8, 0, NULL, 12, 13, 1),
(9, 9, 14, 0, NULL, 4, 5, 1),
(10, 9, 15, 0, NULL, 2, 3, 1),
(11, 14, 16, 0, NULL, 4, 5, 1),
(12, 14, 17, 0, NULL, 2, 3, 1),
(13, 30, 8, 0, NULL, NULL, NULL, NULL),
(14, 37, 9, 0, NULL, 2, 3, 1),
(15, 37, 10, 0, NULL, 4, 5, 1),
(16, 37, 11, 0, NULL, 8, 9, 1),
(17, 37, 12, 0, NULL, 10, 11, 1),
(18, 37, 13, 0, NULL, 6, 7, 1),
(19, 54, 8, 0, NULL, NULL, NULL, NULL),
(20, 73, 18, 0, NULL, NULL, NULL, NULL),
(21, 73, 19, 0, NULL, NULL, NULL, NULL),
(22, 73, 20, 0, NULL, NULL, NULL, NULL),
(23, 122, 21, 0, NULL, NULL, NULL, NULL),
(24, 122, 22, 0, NULL, NULL, NULL, NULL),
(25, 122, 23, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `latitude` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `feature_class` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin2_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `population` bigint DEFAULT NULL,
  `time_zone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `country_code`, `name`, `asciiname`, `longitude`, `latitude`, `feature_class`, `feature_code`, `subadmin1_code`, `subadmin2_code`, `population`, `time_zone`, `active`, `created_at`, `updated_at`) VALUES
(1, 'EG', 'Zefta', 'Zefta', 31.24, 30.71, 'P', 'PPL', 'EG.05', NULL, 92667, 'Africa/Cairo', 1, '2018-03-25 23:00:00', '2018-03-25 23:00:00'),
(2, 'EG', 'Toukh', 'Toukh', 31.20, 30.35, 'P', 'PPL', 'EG.12', NULL, 67599, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(3, 'EG', 'Tanda', 'Tanda', 31.00, 30.79, 'P', 'PPLA', 'EG.05', NULL, 404901, 'Africa/Cairo', 1, '2013-07-05 23:00:00', '2013-07-05 23:00:00'),
(4, 'EG', 'Ţāmiyah', 'Tamiyah', 30.96, 29.48, 'P', 'PPL', 'EG.04', NULL, 46866, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(5, 'EG', 'Ţalkhā', 'Talkha', 31.38, 31.05, 'P', 'PPL', 'EG.01', NULL, 157737, 'Africa/Cairo', 1, '2013-06-04 23:00:00', '2013-06-04 23:00:00'),
(6, 'EG', 'Talā', 'Tala', 30.94, 30.68, 'P', 'PPL', 'EG.09', NULL, 51498, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(7, 'EG', 'Ţahţā', 'Tahta', 31.50, 26.77, 'P', 'PPL', 'EG.24', NULL, 90591, 'Africa/Cairo', 1, '2019-10-09 23:00:00', '2019-10-09 23:00:00'),
(8, 'EG', 'Sumusţā as Sulţānī', 'Sumusta as Sultani', 30.85, 28.92, 'P', 'PPL', 'EG.18', NULL, 37260, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(9, 'EG', 'Sohag', 'Sohag', 31.69, 26.56, 'P', 'PPLA', 'EG.24', NULL, 209419, 'Africa/Cairo', 1, '2016-01-27 23:00:00', '2016-01-27 23:00:00'),
(10, 'EG', 'Siwa Oasis', 'Siwa Oasis', 25.52, 29.20, 'P', 'PPL', 'EG.22', NULL, 7000, 'Africa/Cairo', 1, '2014-08-18 23:00:00', '2014-08-18 23:00:00'),
(11, 'EG', 'Sīdī Sālim', 'Sidi Salim', 30.79, 31.27, 'P', 'PPL', 'EG.21', NULL, 47998, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(12, 'EG', 'Shirbīn', 'Shirbin', 31.52, 31.20, 'P', 'PPL', 'EG.01', NULL, 54676, 'Africa/Cairo', 1, '2017-02-07 23:00:00', '2017-02-07 23:00:00'),
(13, 'EG', 'Shibīn al Qanāṭir', 'Shibin al Qanatir', 31.32, 30.31, 'P', 'PPL', 'EG.12', NULL, 56872, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(14, 'EG', 'Shibīn al Kawm', 'Shibin al Kawm', 31.01, 30.55, 'P', 'PPLA', 'EG.09', NULL, 186345, 'Africa/Cairo', 1, '2013-08-03 23:00:00', '2013-08-03 23:00:00'),
(15, 'EG', 'Sharm el-Sheikh', 'Sharm el-Sheikh', 34.33, 27.92, 'P', 'PPL', 'EG.26', NULL, 12000, 'Africa/Cairo', 1, '2014-01-10 23:00:00', '2014-01-10 23:00:00'),
(16, 'EG', 'Samannūd', 'Samannud', 31.24, 30.96, 'P', 'PPL', 'EG.05', NULL, 54980, 'Africa/Cairo', 1, '2013-07-05 23:00:00', '2013-07-05 23:00:00'),
(17, 'EG', 'Samālūţ', 'Samalut', 30.71, 28.31, 'P', 'PPL', 'EG.10', NULL, 90465, 'Africa/Cairo', 1, '2020-03-08 23:00:00', '2020-03-08 23:00:00'),
(18, 'EG', 'Rosetta', 'Rosetta', 30.42, 31.40, 'P', 'PPL', 'EG.03', NULL, 64481, 'Africa/Cairo', 1, '2019-03-31 23:00:00', '2019-03-31 23:00:00'),
(19, 'EG', 'Ras Gharib', 'Ras Gharib', 33.08, 28.36, 'P', 'PPL', 'EG.02', NULL, 32000, 'Africa/Cairo', 1, '2015-08-05 23:00:00', '2015-08-05 23:00:00'),
(20, 'EG', 'Quwaysinā', 'Quwaysina', 31.16, 30.56, 'P', 'PPL', 'EG.09', NULL, 42708, 'Africa/Cairo', 1, '2012-02-27 23:00:00', '2012-02-27 23:00:00'),
(21, 'EG', 'Quţūr', 'Qutur', 30.96, 30.97, 'P', 'PPL', 'EG.05', NULL, 23842, 'Africa/Cairo', 1, '2017-07-13 23:00:00', '2017-07-13 23:00:00'),
(22, 'EG', 'Kousa', 'Kousa', 32.76, 25.92, 'P', 'PPL', 'EG.23', NULL, 60181, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(23, 'EG', 'Qinā', 'Qina', 32.73, 26.16, 'P', 'PPLA', 'EG.23', NULL, 235362, 'Africa/Cairo', 1, '2019-02-27 23:00:00', '2019-02-27 23:00:00'),
(24, 'EG', 'Qalyūb', 'Qalyub', 31.21, 30.18, 'P', 'PPL', 'EG.12', NULL, 100495, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(25, 'EG', 'Naja\' Ḥammādī', 'Naja\' Hammadi', 32.24, 26.05, 'P', 'PPL', 'EG.23', NULL, 41184, 'Africa/Cairo', 1, '2017-07-09 23:00:00', '2017-07-09 23:00:00'),
(26, 'EG', 'Minyat an Naşr', 'Minyat an Nasr', 31.64, 31.13, 'P', 'PPL', 'EG.01', NULL, 56951, 'Africa/Cairo', 1, '2013-07-05 23:00:00', '2013-07-05 23:00:00'),
(27, 'EG', 'Munūf', 'Munuf', 30.93, 30.47, 'P', 'PPL', 'EG.09', NULL, 83651, 'Africa/Cairo', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(28, 'EG', 'Maţāy', 'Matay', 30.78, 28.42, 'P', 'PPL', 'EG.10', NULL, 45215, 'Africa/Cairo', 1, '2020-04-07 23:00:00', '2020-04-07 23:00:00'),
(29, 'EG', 'Mashtūl as Sūq', 'Mashtul as Suq', 31.38, 30.36, 'P', 'PPL', 'EG.14', NULL, 45798, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(30, 'EG', 'Mersa Matruh', 'Mersa Matruh', 27.24, 31.35, 'P', 'PPLA', 'EG.22', NULL, 62042, 'Africa/Cairo', 1, '2014-05-27 23:00:00', '2014-05-27 23:00:00'),
(31, 'EG', 'Marsa Alam', 'Marsa Alam', 34.89, 25.06, 'P', 'PPL', 'EG.02', NULL, 10000, 'Africa/Cairo', 1, '2014-07-15 23:00:00', '2014-07-15 23:00:00'),
(32, 'EG', 'Manfalūţ', 'Manfalut', 30.97, 27.31, 'P', 'PPL', 'EG.17', NULL, 78744, 'Africa/Cairo', 1, '2019-12-03 23:00:00', '2019-12-03 23:00:00'),
(33, 'EG', 'Mallawī', 'Mallawi', 30.84, 27.73, 'P', 'PPL', 'EG.10', NULL, 142504, 'Africa/Cairo', 1, '2020-01-08 23:00:00', '2020-01-08 23:00:00'),
(34, 'EG', 'Madīnat Sittah Uktūbar', 'Madinat Sittah Uktubar', 31.05, 29.82, 'P', 'PPL', 'EG.08', NULL, 41930, 'Africa/Cairo', 1, '2019-12-18 23:00:00', '2019-12-18 23:00:00'),
(35, 'EG', 'Kawm Umbū', 'Kawm Umbu', 32.95, 24.48, 'P', 'PPL', 'EG.16', NULL, 59787, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(36, 'EG', 'Kawm Ḩamādah', 'Kawm Hamadah', 30.70, 30.76, 'P', 'PPL', 'EG.03', NULL, 36751, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(37, 'EG', 'Kafr Şaqr', 'Kafr Saqr', 31.63, 30.79, 'P', 'PPL', 'EG.14', NULL, 34967, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(38, 'EG', 'Kafr az Zayyāt', 'Kafr az Zayyat', 30.82, 30.82, 'P', 'PPL', 'EG.05', NULL, 73725, 'Africa/Cairo', 1, '2017-07-11 23:00:00', '2017-07-11 23:00:00'),
(39, 'EG', 'Kafr ash Shaykh', 'Kafr ash Shaykh', 30.94, 31.11, 'P', 'PPLA', 'EG.21', NULL, 143970, 'Africa/Cairo', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(40, 'EG', 'Kafr ad Dawwār', 'Kafr ad Dawwar', 30.13, 31.13, 'P', 'PPL', 'EG.03', NULL, 267370, 'Africa/Cairo', 1, '2015-08-06 23:00:00', '2015-08-06 23:00:00'),
(41, 'EG', 'Juhaynah', 'Juhaynah', 31.50, 26.67, 'P', 'PPL', 'EG.24', NULL, 47821, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(42, 'EG', 'Jirjā', 'Jirja', 31.89, 26.34, 'P', 'PPL', 'EG.24', NULL, 128250, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(43, 'EG', '‘Izbat al Burj', '`Izbat al Burj', 31.84, 31.51, 'P', 'PPL', 'EG.01', NULL, 37953, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(44, 'EG', 'Iţsā', 'Itsa', 30.79, 29.24, 'P', 'PPL', 'EG.04', NULL, 45269, 'Africa/Cairo', 1, '2018-12-04 23:00:00', '2018-12-04 23:00:00'),
(45, 'EG', 'Isnā', 'Isna', 32.55, 25.29, 'P', 'PPL', 'EG.23', NULL, 69335, 'Africa/Cairo', 1, '2017-10-16 23:00:00', '2017-10-16 23:00:00'),
(46, 'EG', 'Idkū', 'Idku', 30.30, 31.31, 'P', 'PPLA2', 'EG.03', 'EG.03.10430542', 210678, 'Africa/Cairo', 1, '2018-04-20 23:00:00', '2018-04-20 23:00:00'),
(47, 'EG', 'Idfū', 'Idfu', 32.88, 24.98, 'P', 'PPL', 'EG.16', NULL, 133000, 'Africa/Cairo', 1, '2015-08-05 23:00:00', '2015-08-05 23:00:00'),
(48, 'EG', 'Ibshawāy', 'Ibshaway', 30.68, 29.36, 'P', 'PPL', 'EG.04', NULL, 51173, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(49, 'EG', 'Ḩalwān', 'Halwan', 31.30, 29.84, 'P', 'PPL', 'EG.11', NULL, 230000, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(50, 'EG', 'Hihyā', 'Hihya', 31.59, 30.67, 'P', 'PPL', 'EG.14', NULL, 43432, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(51, 'EG', 'Ḩawsh ‘Īsá', 'Hawsh `Isa', 30.29, 30.91, 'P', 'PPL', 'EG.03', NULL, 85352, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(52, 'EG', 'Fuwwah', 'Fuwwah', 30.55, 31.20, 'P', 'PPL', 'EG.21', NULL, 63310, 'Africa/Cairo', 1, '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(53, 'EG', 'Farshūţ', 'Farshut', 32.16, 26.05, 'P', 'PPL', 'EG.23', NULL, 53851, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(54, 'EG', 'Fāraskūr', 'Faraskur', 31.72, 31.33, 'P', 'PPL', 'EG.20', NULL, 58284, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(55, 'EG', 'Fāqūs', 'Faqus', 31.80, 30.73, 'P', 'PPL', 'EG.14', NULL, 62821, 'Africa/Cairo', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(56, 'EG', 'Damietta', 'Damietta', 31.81, 31.42, 'P', 'PPLA', 'EG.20', NULL, 76839, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(57, 'EG', 'Diyarb Najm', 'Diyarb Najm', 31.44, 30.75, 'P', 'PPL', 'EG.14', NULL, 51841, 'Africa/Cairo', 1, '2013-07-05 23:00:00', '2013-07-05 23:00:00'),
(58, 'EG', 'Disūq', 'Disuq', 30.65, 31.13, 'P', 'PPL', 'EG.21', NULL, 102037, 'Africa/Cairo', 1, '2015-09-05 23:00:00', '2015-09-05 23:00:00'),
(59, 'EG', 'Dishnā', 'Dishna', 32.48, 26.12, 'P', 'PPL', 'EG.23', NULL, 54197, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(60, 'EG', 'Dikirnis', 'Dikirnis', 31.59, 31.09, 'P', 'PPL', 'EG.01', NULL, 137542, 'Africa/Cairo', 1, '2013-07-05 23:00:00', '2013-07-05 23:00:00'),
(61, 'EG', 'Dahab', 'Dahab', 34.49, 28.48, 'P', 'PPL', 'EG.26', NULL, 8000, 'Africa/Cairo', 1, '2017-11-23 23:00:00', '2017-11-23 23:00:00'),
(62, 'EG', 'Dayrūţ', 'Dayrut', 30.81, 27.56, 'P', 'PPL', 'EG.17', NULL, 67788, 'Africa/Cairo', 1, '2020-01-08 23:00:00', '2020-01-08 23:00:00'),
(63, 'EG', 'Dayr Mawās', 'Dayr Mawas', 30.85, 27.64, 'P', 'PPL', 'EG.10', NULL, 40609, 'Africa/Cairo', 1, '2020-01-08 23:00:00', '2020-01-08 23:00:00'),
(64, 'EG', 'Damanhūr', 'Damanhur', 30.47, 31.03, 'P', 'PPLA', 'EG.03', NULL, 227943, 'Africa/Cairo', 1, '2014-03-07 23:00:00', '2014-03-07 23:00:00'),
(65, 'EG', 'Būsh', 'Bush', 31.13, 29.15, 'P', 'PPL', 'EG.18', NULL, 86608, 'Africa/Cairo', 1, '2011-04-18 23:00:00', '2011-04-18 23:00:00'),
(66, 'EG', 'Port Said', 'Port Said', 32.30, 31.27, 'P', 'PPLA', 'EG.19', NULL, 538378, 'Africa/Cairo', 1, '2019-10-27 23:00:00', '2019-10-27 23:00:00'),
(67, 'EG', 'Safaga', 'Safaga', 33.94, 26.75, 'P', 'PPL', 'EG.02', NULL, 32944, 'Africa/Cairo', 1, '2017-04-20 23:00:00', '2017-04-20 23:00:00'),
(68, 'EG', 'Bilqās', 'Bilqas', 31.36, 31.21, 'P', 'PPL', 'EG.01', NULL, 103596, 'Africa/Cairo', 1, '2013-06-04 23:00:00', '2013-06-04 23:00:00'),
(69, 'EG', 'Bilbays', 'Bilbays', 31.56, 30.42, 'P', 'PPL', 'EG.14', NULL, 129211, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(70, 'EG', 'Basyūn', 'Basyun', 30.81, 30.94, 'P', 'PPL', 'EG.05', NULL, 55523, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(71, 'EG', 'Banī Suwayf', 'Bani Suwayf', 31.10, 29.07, 'P', 'PPLA', 'EG.18', NULL, 189624, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(72, 'EG', 'Banī Mazār', 'Bani Mazar', 30.81, 28.49, 'P', 'PPL', 'EG.10', NULL, 58153, 'Africa/Cairo', 1, '2020-04-07 23:00:00', '2020-04-07 23:00:00'),
(73, 'EG', 'Banhā', 'Banha', 31.18, 30.46, 'P', 'PPLA', 'EG.12', NULL, 167029, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(74, 'EG', 'Zagazig', 'Zagazig', 31.50, 30.59, 'P', 'PPLA', 'EG.14', NULL, 285097, 'Africa/Cairo', 1, '2013-04-20 23:00:00', '2013-04-20 23:00:00'),
(75, 'EG', 'Awsīm', 'Awsim', 31.14, 30.12, 'P', 'PPL', 'EG.08', NULL, 63862, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(76, 'EG', 'El-Tor', 'El-Tor', 33.62, 28.24, 'P', 'PPLA', 'EG.26', NULL, 14972, 'Africa/Cairo', 1, '2017-04-10 23:00:00', '2017-04-10 23:00:00'),
(77, 'EG', 'At Tall al Kabīr', 'At Tall al Kabir', 31.79, 30.54, 'P', 'PPL', 'EG.14', NULL, 51569, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(78, 'EG', 'Asyūţ', 'Asyut', 31.18, 27.18, 'P', 'PPLA', 'EG.17', NULL, 420585, 'Africa/Cairo', 1, '2016-01-27 23:00:00', '2016-01-27 23:00:00'),
(79, 'EG', 'Aswan', 'Aswan', 32.90, 24.09, 'P', 'PPLA', 'EG.16', NULL, 241261, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(80, 'EG', 'Suez', 'Suez', 32.53, 29.97, 'P', 'PPLA', 'EG.15', NULL, 488125, 'Africa/Cairo', 1, '2013-11-30 23:00:00', '2013-11-30 23:00:00'),
(81, 'EG', 'Aş Şaff', 'As Saff', 31.28, 29.56, 'P', 'PPL', 'EG.08', NULL, 38213, 'Africa/Cairo', 1, '2017-07-15 23:00:00', '2017-07-15 23:00:00'),
(82, 'EG', 'Ash Shuhadā’', 'Ash Shuhada\'', 30.90, 30.60, 'P', 'PPL', 'EG.09', NULL, 48060, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(83, 'EG', 'Ashmūn', 'Ashmun', 30.98, 30.30, 'P', 'PPL', 'EG.09', NULL, 82507, 'Africa/Cairo', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(84, 'EG', 'Al Wāsiţah', 'Al Wasitah', 31.21, 29.34, 'P', 'PPL', 'EG.04', NULL, 37453, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(85, 'EG', 'Luxor', 'Luxor', 32.64, 25.70, 'P', 'PPLA', 'EG.28', NULL, 422407, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(86, 'EG', 'Al Qūşīyah', 'Al Qusiyah', 30.82, 27.44, 'P', 'PPL', 'EG.17', NULL, 68394, 'Africa/Cairo', 1, '2019-12-03 23:00:00', '2019-12-03 23:00:00'),
(87, 'EG', 'Al Quşayr', 'Al Qusayr', 34.28, 26.11, 'P', 'PPL', 'EG.02', NULL, 24653, 'Africa/Cairo', 1, '2019-10-09 23:00:00', '2019-10-09 23:00:00'),
(88, 'EG', 'Al Qurayn', 'Al Qurayn', 31.74, 30.62, 'P', 'PPL', 'EG.14', NULL, 61730, 'Africa/Cairo', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(89, 'EG', 'Al Qanāyāt', 'Al Qanayat', 31.46, 30.62, 'P', 'PPL', 'EG.14', NULL, 42912, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(90, 'EG', 'Al Qanāţir al Khayrīyah', 'Al Qanatir al Khayriyah', 31.14, 30.19, 'P', 'PPL', 'EG.12', NULL, 56302, 'Africa/Cairo', 1, '2018-04-12 23:00:00', '2018-04-12 23:00:00'),
(91, 'EG', 'Cairo', 'Cairo', 31.25, 30.06, 'P', 'PPLC', 'EG.11', NULL, 7734614, 'Africa/Cairo', 1, '2015-06-02 23:00:00', '2015-06-02 23:00:00'),
(92, 'EG', 'Al Minyā', 'Al Minya', 30.76, 28.09, 'P', 'PPLA', 'EG.10', NULL, 227150, 'Africa/Cairo', 1, '2020-03-08 23:00:00', '2020-03-08 23:00:00'),
(93, 'EG', 'Al Maţarīyah', 'Al Matariyah', 32.03, 31.18, 'P', 'PPL', 'EG.01', NULL, 99357, 'Africa/Cairo', 1, '2017-02-07 23:00:00', '2017-02-07 23:00:00'),
(94, 'EG', 'Al Manzalah', 'Al Manzalah', 31.94, 31.16, 'P', 'PPL', 'EG.01', NULL, 67486, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(95, 'EG', 'Al Manşūrah', 'Al Mansurah', 31.38, 31.04, 'P', 'PPLA', 'EG.01', NULL, 420195, 'Africa/Cairo', 1, '2013-06-04 23:00:00', '2013-06-04 23:00:00'),
(96, 'EG', 'Al Manshāh', 'Al Manshah', 31.80, 26.48, 'P', 'PPL', 'EG.24', NULL, 61134, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(97, 'EG', 'Al Maḩallah al Kubrá', 'Al Mahallah al Kubra', 31.17, 30.97, 'P', 'PPL', 'EG.05', NULL, 431052, 'Africa/Cairo', 1, '2014-06-04 23:00:00', '2014-06-04 23:00:00'),
(98, 'EG', 'Al Khārijah', 'Al Kharijah', 30.55, 25.45, 'P', 'PPLA', 'EG.13', NULL, 67700, 'Africa/Cairo', 1, '2017-04-10 23:00:00', '2017-04-10 23:00:00'),
(99, 'EG', 'Al Khānkah', 'Al Khankah', 31.37, 30.21, 'P', 'PPL', 'EG.12', NULL, 62434, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(100, 'EG', 'Giza', 'Giza', 31.21, 30.01, 'P', 'PPLA', 'EG.08', NULL, 2443203, 'Africa/Cairo', 1, '2019-10-09 23:00:00', '2019-10-09 23:00:00'),
(101, 'EG', 'Al Jammālīyah', 'Al Jammaliyah', 31.86, 31.18, 'P', 'PPL', 'EG.01', NULL, 68381, 'Africa/Cairo', 1, '2017-05-07 23:00:00', '2017-05-07 23:00:00'),
(102, 'EG', 'Ismailia', 'Ismailia', 32.27, 30.60, 'P', 'PPLA', 'EG.07', NULL, 284813, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(103, 'EG', 'Alexandria', 'Alexandria', 29.92, 31.20, 'P', 'PPLA', 'EG.06', NULL, 3811516, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(104, 'EG', 'Al Ibrāhīmīyah', 'Al Ibrahimiyah', 31.56, 30.72, 'P', 'PPL', 'EG.14', NULL, 34638, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(105, 'EG', 'Al Ḩawāmidīyah', 'Al Hawamidiyah', 31.25, 29.90, 'P', 'PPL', 'EG.08', NULL, 106841, 'Africa/Cairo', 1, '2018-04-05 23:00:00', '2018-04-05 23:00:00'),
(106, 'EG', 'Al Ḩāmūl', 'Al Hamul', 31.15, 31.31, 'P', 'PPL', 'EG.21', NULL, 45798, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(107, 'EG', 'Hurghada', 'Hurghada', 33.81, 27.26, 'P', 'PPLA', 'EG.02', NULL, 95622, 'Africa/Cairo', 1, '2019-09-04 23:00:00', '2019-09-04 23:00:00'),
(108, 'EG', 'Al Fayyūm', 'Al Fayyum', 30.84, 29.31, 'P', 'PPLA', 'EG.04', NULL, 306393, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(109, 'EG', 'Al Fashn', 'Al Fashn', 30.90, 28.82, 'P', 'PPL', 'EG.18', NULL, 63793, 'Africa/Cairo', 1, '2020-04-07 23:00:00', '2020-04-07 23:00:00'),
(110, 'EG', 'Al Bawīţī', 'Al Bawiti', 28.87, 28.35, 'P', 'PPL', 'EG.08', NULL, 20000, 'Africa/Cairo', 1, '2017-07-10 23:00:00', '2017-07-10 23:00:00'),
(111, 'EG', 'Al Balyanā', 'Al Balyana', 32.00, 26.24, 'P', 'PPL', 'EG.24', NULL, 48801, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(112, 'EG', 'Al Bājūr', 'Al Bajur', 31.04, 30.43, 'P', 'PPL', 'EG.09', NULL, 36633, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(113, 'EG', 'Al Badārī', 'Al Badari', 31.42, 26.99, 'P', 'PPL', 'EG.17', NULL, 44132, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(114, 'EG', 'Al ‘Ayyāţ', 'Al `Ayyat', 31.26, 29.62, 'P', 'PPL', 'EG.08', NULL, 34796, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(115, 'EG', 'Arish', 'Arish', 33.80, 31.13, 'P', 'PPLA', 'EG.27', NULL, 128855, 'Africa/Cairo', 1, '2017-11-09 23:00:00', '2017-11-09 23:00:00'),
(116, 'EG', 'Al ‘Alamayn', 'Al `Alamayn', 28.95, 30.83, 'P', 'PPL', 'EG.22', NULL, 7400, 'Africa/Cairo', 1, '2013-11-30 23:00:00', '2013-11-30 23:00:00'),
(117, 'EG', 'Akhmīm', 'Akhmim', 31.75, 26.56, 'P', 'PPL', 'EG.24', NULL, 99446, 'Africa/Cairo', 1, '2020-01-08 23:00:00', '2020-01-08 23:00:00'),
(118, 'EG', 'Ajā', 'Aja', 31.29, 30.94, 'P', 'PPL', 'EG.01', NULL, 34692, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(119, 'EG', 'Ad Dilinjāt', 'Ad Dilinjat', 30.54, 30.83, 'P', 'PPL', 'EG.03', NULL, 40386, 'Africa/Cairo', 1, '2019-01-09 23:00:00', '2019-01-09 23:00:00'),
(120, 'EG', 'Abū Tīj', 'Abu Tij', 31.32, 27.05, 'P', 'PPL', 'EG.17', NULL, 71257, 'Africa/Cairo', 1, '2019-12-03 23:00:00', '2019-12-03 23:00:00'),
(121, 'EG', 'Abū Qurqāş', 'Abu Qurqas', 30.84, 27.93, 'P', 'PPL', 'EG.10', NULL, 61182, 'Africa/Cairo', 1, '2020-01-08 23:00:00', '2020-01-08 23:00:00'),
(122, 'EG', 'Abū Kabīr', 'Abu Kabir', 31.67, 30.73, 'P', 'PPL', 'EG.14', NULL, 100684, 'Africa/Cairo', 1, '2012-01-18 23:00:00', '2012-01-18 23:00:00'),
(123, 'EG', 'Abū al Maţāmīr', 'Abu al Matamir', 30.17, 30.91, 'P', 'PPL', 'EG.03', NULL, 41302, 'Africa/Cairo', 1, '2018-03-14 23:00:00', '2018-03-14 23:00:00'),
(124, 'EG', 'Abnūb', 'Abnub', 31.15, 27.27, 'P', 'PPL', 'EG.17', NULL, 68749, 'Africa/Cairo', 1, '2019-12-03 23:00:00', '2019-12-03 23:00:00'),
(125, 'EG', 'Az Zarqā', 'Az Zarqa', 31.64, 31.21, 'P', 'PPL', 'EG.20', NULL, 40010, 'Africa/Cairo', 1, '2013-07-06 23:00:00', '2013-07-06 23:00:00'),
(126, 'EG', 'El Gouna', 'El Gouna', 33.68, 27.39, 'P', 'PPL', 'EG.02', NULL, 15000, 'Africa/Cairo', 1, '2016-09-22 23:00:00', '2016-09-22 23:00:00'),
(127, 'EG', 'Ain Sukhna', 'Ain Sukhna', 32.32, 29.60, 'P', 'PPL', 'EG.15', NULL, 45552, 'Africa/Cairo', 1, '2016-09-19 23:00:00', '2016-09-19 23:00:00'),
(128, 'EG', 'New Cairo', 'New Cairo', 31.47, 30.03, 'P', 'PPL', 'EG.11', NULL, 200000, 'Africa/Cairo', 1, '2017-12-05 23:00:00', '2017-12-05 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `continents`
--

CREATE TABLE `continents` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `continents`
--

INSERT INTO `continents` (`id`, `code`, `name`, `active`) VALUES
(1, 'AF', 'Africa', 1),
(2, 'AN', 'Antarctica', 1),
(3, 'AS', 'Asia', 1),
(4, 'EU', 'Europe', 1),
(5, 'NA', 'North America', 1),
(6, 'OC', 'Oceania', 1),
(7, 'SA', 'South America', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int UNSIGNED NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `iso3` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iso_numeric` int UNSIGNED DEFAULT NULL,
  `fips` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `asciiname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `capital` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int UNSIGNED DEFAULT NULL,
  `population` int UNSIGNED DEFAULT NULL,
  `continent_code` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tld` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code_regex` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `languages` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `neighbours` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `equivalent_fips_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `background_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_type` enum('0','1','2') COLLATE utf8_unicode_ci DEFAULT '0',
  `admin_field_active` tinyint UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(1, 'AD', 'AND', 20, 'AN', 'Andorra', 'Andorra', 'Andorra la Vella', 468, 84000, 'EU', '.ad', 'EUR', '376', 'AD###', '^(?:AD)*(d{3})$', 'ca', 'ES,FR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(2, 'AE', 'ARE', 784, 'AE', 'al-Imārāt', 'United Arab Emirates', 'Abu Dhabi', 82880, 4975593, 'AS', '.ae', 'AED', '971', '', '', 'ar-AE,fa,en,hi,ur', 'SA,OM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(3, 'AF', 'AFG', 4, 'AF', 'Afġānistān', 'Afghanistan', 'Kabul', 647500, 29121286, 'AS', '.af', 'AFN', '93', '', '', 'fa-AF,ps,uz-AF,tk', 'TM,CN,IR,TJ,PK,UZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(4, 'AG', 'ATG', 28, 'AC', 'Antigua and Barbuda', 'Antigua and Barbuda', 'St. John\'s', 443, 86754, 'NA', '.ag', 'XCD', '+1-268', '', '', 'en-AG', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(5, 'AI', 'AIA', 660, 'AV', 'Anguilla', 'Anguilla', 'The Valley', 102, 13254, 'NA', '.ai', 'XCD', '+1-264', '', '', 'en-AI', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(6, 'AL', 'ALB', 8, 'AL', 'Shqipëria', 'Albania', 'Tirana', 28748, 2986952, 'EU', '.al', 'ALL', '355', '', '', 'sq,el', 'MK,GR,ME,RS,XK', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(7, 'AM', 'ARM', 51, 'AM', 'Hayastan', 'Armenia', 'Yerevan', 29800, 2968000, 'AS', '.am', 'AMD', '374', '######', '^(d{6})$', 'hy', 'GE,IR,AZ,TR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(8, 'AN', 'ANT', 530, 'NT', 'Netherlands Antilles', 'Netherlands Antilles', 'Willemstad', 960, 136197, 'NA', '.an', 'ANG', '599', '', '', 'nl-AN,en,es', 'GP', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(9, 'AO', 'AGO', 24, 'AO', 'Angola', 'Angola', 'Luanda', 1246700, 13068161, 'AF', '.ao', 'AOA', '244', '', '', 'pt-AO', 'CD,NA,ZM,CG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(10, 'AQ', 'ATA', 10, 'AY', 'Antarctica', 'Antarctica', '', 14000000, 0, 'AN', '.aq', '', '', '', '', '', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(11, 'AR', 'ARG', 32, 'AR', 'Argentina', 'Argentina', 'Buenos Aires', 2766890, 41343201, 'SA', '.ar', 'ARS', '54', '@####@@@', '^([A-Z]d{4}[A-Z]{3})$', 'es-AR,en,it,de,fr,gn', 'CL,BO,UY,PY,BR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(12, 'AS', 'ASM', 16, 'AQ', 'American Samoa', 'American Samoa', 'Pago Pago', 199, 57881, 'OC', '.as', 'USD', '+1-684', '', '', 'en-AS,sm,to', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(13, 'AT', 'AUT', 40, 'AU', 'Österreich', 'Austria', 'Vienna', 83858, 8205000, 'EU', '.at', 'EUR', '43', '####', '^(d{4})$', 'de-AT,hr,hu,sl', 'CH,DE,HU,SK,CZ,IT,SI,LI', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(14, 'AU', 'AUS', 36, 'AS', 'Australia', 'Australia', 'Canberra', 7686850, 21515754, 'OC', '.au', 'AUD', '61', '####', '^(d{4})$', 'en-AU', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(15, 'AW', 'ABW', 533, 'AA', 'Aruba', 'Aruba', 'Oranjestad', 193, 71566, 'NA', '.aw', 'AWG', '297', '', '', 'nl-AW,es,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(16, 'AX', 'ALA', 248, '', 'Aland Islands', 'Aland Islands', 'Mariehamn', 1580, 26711, 'EU', '.ax', 'EUR', '+358-18', '#####', '^(?:FI)*(d{5})$', 'sv-AX', '', 'FI', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(17, 'AZ', 'AZE', 31, 'AJ', 'Azərbaycan', 'Azerbaijan', 'Baku', 86600, 8303512, 'AS', '.az', 'AZN', '994', 'AZ ####', '^(?:AZ)*(d{4})$', 'az,ru,hy', 'GE,IR,AM,TR,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(18, 'BA', 'BIH', 70, 'BK', 'Bosna i Hercegovina', 'Bosnia and Herzegovina', 'Sarajevo', 51129, 4590000, 'EU', '.ba', 'BAM', '387', '#####', '^(d{5})$', 'bs,hr-BA,sr-BA', 'HR,ME,RS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(19, 'BB', 'BRB', 52, 'BB', 'Barbados', 'Barbados', 'Bridgetown', 431, 285653, 'NA', '.bb', 'BBD', '+1-246', 'BB#####', '^(?:BB)*(d{5})$', 'en-BB', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(20, 'BD', 'BGD', 50, 'BG', 'Bāṅlādēś', 'Bangladesh', 'Dhaka', 144000, 156118464, 'AS', '.bd', 'BDT', '880', '####', '^(d{4})$', 'bn-BD,en', 'MM,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(21, 'BE', 'BEL', 56, 'BE', 'Belgique', 'Belgium', 'Brussels', 30510, 10403000, 'EU', '.be', 'EUR', '32', '####', '^(d{4})$', 'nl-BE,fr-BE,de-BE', 'DE,NL,LU,FR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(22, 'BF', 'BFA', 854, 'UV', 'Burkina Faso', 'Burkina Faso', 'Ouagadougou', 274200, 16241811, 'AF', '.bf', 'XOF', '226', '', '', 'fr-BF', 'NE,BJ,GH,CI,TG,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(23, 'BG', 'BGR', 100, 'BU', 'Bŭlgarija', 'Bulgaria', 'Sofia', 110910, 7148785, 'EU', '.bg', 'BGN', '359', '####', '^(d{4})$', 'bg,tr-BG,rom', 'MK,GR,RO,TR,RS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(24, 'BH', 'BHR', 48, 'BA', 'al-Baḥrayn', 'Bahrain', 'Manama', 665, 738004, 'AS', '.bh', 'BHD', '973', '####|###', '^(d{3}d?)$', 'ar-BH,en,fa,ur', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(25, 'BI', 'BDI', 108, 'BY', 'Burundi', 'Burundi', 'Bujumbura', 27830, 9863117, 'AF', '.bi', 'BIF', '257', '', '', 'fr-BI,rn', 'TZ,CD,RW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(26, 'BJ', 'BEN', 204, 'BN', 'Bénin', 'Benin', 'Porto-Novo', 112620, 9056010, 'AF', '.bj', 'XOF', '+229', '', '', 'fr-BJ', 'NE,TG,BF,NG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(27, 'BL', 'BLM', 652, 'TB', 'Saint Barthelemy', 'Saint Barthelemy', 'Gustavia', 21, 8450, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(28, 'BM', 'BMU', 60, 'BD', 'Bermuda', 'Bermuda', 'Hamilton', 53, 65365, 'NA', '.bm', 'BMD', '+1-441', '@@ ##', '^([A-Z]{2}d{2})$', 'en-BM,pt', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(29, 'BN', 'BRN', 96, 'BX', 'Brunei Darussalam', 'Brunei', 'Bandar Seri Begawan', 5770, 395027, 'AS', '.bn', 'BND', '673', '@@####', '^([A-Z]{2}d{4})$', 'ms-BN,en-BN', 'MY', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(30, 'BO', 'BOL', 68, 'BL', 'Bolivia', 'Bolivia', 'Sucre', 1098580, 9947418, 'SA', '.bo', 'BOB', '591', '', '', 'es-BO,qu,ay', 'PE,CL,PY,BR,AR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(31, 'BQ', 'BES', 535, '', 'Bonaire, Saint Eustatius and Saba ', 'Bonaire, Saint Eustatius and Saba ', '', 328, 18012, 'NA', '.bq', 'USD', '599', '', '', 'nl,pap,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(32, 'BR', 'BRA', 76, 'BR', 'Brasil', 'Brazil', 'Brasilia', 8511965, 201103330, 'SA', '.br', 'BRL', '55', '#####-###', '^(d{8})$', 'pt-BR,es,en,fr', 'SR,PE,BO,UY,GY,PY,GF,VE,CO,AR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(33, 'BS', 'BHS', 44, 'BF', 'Bahamas', 'Bahamas', 'Nassau', 13940, 301790, 'NA', '.bs', 'BSD', '+1-242', '', '', 'en-BS', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(34, 'BT', 'BTN', 64, 'BT', 'Druk-yul', 'Bhutan', 'Thimphu', 47000, 699847, 'AS', '.bt', 'BTN', '975', '', '', 'dz', 'CN,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(35, 'BV', 'BVT', 74, 'BV', 'Bouvet Island', 'Bouvet Island', '', 49, 0, 'AN', '.bv', 'NOK', '', '', '', '', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(36, 'BW', 'BWA', 72, 'BC', 'Botswana', 'Botswana', 'Gaborone', 600370, 2029307, 'AF', '.bw', 'BWP', '267', '', '', 'en-BW,tn-BW', 'ZW,ZA,NA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(37, 'BY', 'BLR', 112, 'BO', 'Biełaruś', 'Belarus', 'Minsk', 207600, 9685000, 'EU', '.by', 'BYR', '375', '######', '^(d{6})$', 'be,ru', 'PL,LT,UA,RU,LV', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(38, 'BZ', 'BLZ', 84, 'BH', 'Belize', 'Belize', 'Belmopan', 22966, 314522, 'NA', '.bz', 'BZD', '501', '', '', 'en-BZ,es', 'GT,MX', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(39, 'CA', 'CAN', 124, 'CA', 'Canada', 'Canada', 'Ottawa', 9984670, 33679000, 'NA', '.ca', 'CAD', '1', '@#@ #@#', '^([ABCEGHJKLMNPRSTVXY]d[ABCEGHJKLMNPRSTVWXYZ]) ?(d[ABCEGHJKLMNPRSTVWXYZ]d)$ ', 'en-CA,fr-CA,iu', 'US', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(40, 'CC', 'CCK', 166, 'CK', 'Cocos Islands', 'Cocos Islands', 'West Island', 14, 628, 'AS', '.cc', 'AUD', '61', '', '', 'ms-CC,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(41, 'CD', 'COD', 180, 'CG', 'RDC', 'Democratic Republic of the Congo', 'Kinshasa', 2345410, 70916439, 'AF', '.cd', 'CDF', '243', '', '', 'fr-CD,ln,kg', 'TZ,CF,SS,RW,ZM,BI,UG,CG,AO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(42, 'CF', 'CAF', 140, 'CT', 'Centrafrique', 'Central African Republic', 'Bangui', 622984, 4844927, 'AF', '.cf', 'XAF', '236', '', '', 'fr-CF,sg,ln,kg', 'TD,SD,CD,SS,CM,CG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(43, 'CG', 'COG', 178, 'CF', 'Congo', 'Republic of the Congo', 'Brazzaville', 342000, 3039126, 'AF', '.cg', 'XAF', '242', '', '', 'fr-CG,kg,ln-CG', 'CF,GA,CD,CM,AO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(44, 'CH', 'CHE', 756, 'SZ', 'Switzerland', 'Switzerland', 'Berne', 41290, 7581000, 'EU', '.ch', 'CHF', '41', '####', '^(d{4})$', 'de-CH,fr-CH,it-CH,rm', 'DE,IT,LI,FR,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(45, 'CI', 'CIV', 384, 'IV', 'Côte d\'Ivoire', 'Ivory Coast', 'Yamoussoukro', 322460, 21058798, 'AF', '.ci', 'XOF', '225', '', '', 'fr-CI', 'LR,GH,GN,BF,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(46, 'CK', 'COK', 184, 'CW', 'Cook Islands', 'Cook Islands', 'Avarua', 240, 21388, 'OC', '.ck', 'NZD', '682', '', '', 'en-CK,mi', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(47, 'CL', 'CHL', 152, 'CI', 'Chile', 'Chile', 'Santiago', 756950, 16746491, 'SA', '.cl', 'CLP', '56', '#######', '^(d{7})$', 'es-CL', 'PE,BO,AR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(48, 'CM', 'CMR', 120, 'CM', 'Cameroun', 'Cameroon', 'Yaounde', 475440, 19294149, 'AF', '.cm', 'XAF', '237', '', '', 'fr-CM,en-CM', 'TD,CF,GA,GQ,CG,NG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(49, 'CN', 'CHN', 156, 'CH', 'Zhōngguó', 'China', 'Beijing', 9596960, 1330044000, 'AS', '.cn', 'CNY', '86', '######', '^(d{6})$', 'zh-CN,yue,wuu,dta,ug,za', 'LA,BT,TJ,KZ,MN,AF,NP,MM,KG,PK,KP,RU,VN,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(50, 'CO', 'COL', 170, 'CO', 'Colombia', 'Colombia', 'Bogota', 1138910, 47790000, 'SA', '.co', 'COP', '57', '', '', 'es-CO', 'EC,PE,PA,BR,VE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(51, 'CR', 'CRI', 188, 'CS', 'Costa Rica', 'Costa Rica', 'San Jose', 51100, 4516220, 'NA', '.cr', 'CRC', '506', '####', '^(d{4})$', 'es-CR,en', 'PA,NI', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(52, 'CS', 'SCG', 891, 'YI', 'Serbia and Montenegro', 'Serbia and Montenegro', 'Belgrade', 102350, 10829175, 'EU', '.cs', 'RSD', '381', '#####', '^(d{5})$', 'cu,hu,sq,sr', 'AL,HU,MK,RO,HR,BA,BG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(53, 'CU', 'CUB', 192, 'CU', 'Cuba', 'Cuba', 'Havana', 110860, 11423000, 'NA', '.cu', 'CUP', '53', 'CP #####', '^(?:CP)*(d{5})$', 'es-CU', 'US', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(54, 'CV', 'CPV', 132, 'CV', 'Cabo Verde', 'Cape Verde', 'Praia', 4033, 508659, 'AF', '.cv', 'CVE', '238', '####', '^(d{4})$', 'pt-CV', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(55, 'CW', 'CUW', 531, 'UC', 'Curacao', 'Curacao', ' Willemstad', 444, 141766, 'NA', '.cw', 'ANG', '599', '', '', 'nl,pap', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(56, 'CX', 'CXR', 162, 'KT', 'Christmas Island', 'Christmas Island', 'Flying Fish Cove', 135, 1500, 'AS', '.cx', 'AUD', '61', '####', '^(d{4})$', 'en,zh,ms-CC', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(57, 'CY', 'CYP', 196, 'CY', 'Kýpros (Kıbrıs)', 'Cyprus', 'Nicosia', 9250, 1102677, 'EU', '.cy', 'EUR', '357', '####', '^(d{4})$', 'el-CY,tr-CY,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(58, 'CZ', 'CZE', 203, 'EZ', 'Česko', 'Czech Republic', 'Prague', 78866, 10476000, 'EU', '.cz', 'CZK', '420', '### ##', '^(d{5})$', 'cs,sk', 'PL,DE,SK,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(59, 'DE', 'DEU', 276, 'GM', 'Deutschland', 'Germany', 'Berlin', 357021, 81802257, 'EU', '.de', 'EUR', '49', '#####', '^(d{5})$', 'de', 'CH,PL,NL,DK,BE,CZ,LU,FR,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(60, 'DJ', 'DJI', 262, 'DJ', 'Djibouti', 'Djibouti', 'Djibouti', 23000, 740528, 'AF', '.dj', 'DJF', '253', '', '', 'fr-DJ,ar,so-DJ,aa', 'ER,ET,SO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(61, 'DK', 'DNK', 208, 'DA', 'Danmark', 'Denmark', 'Copenhagen', 43094, 5484000, 'EU', '.dk', 'DKK', '45', '####', '^(d{4})$', 'da-DK,en,fo,de-DK', 'DE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(62, 'DM', 'DMA', 212, 'DO', 'Dominica', 'Dominica', 'Roseau', 754, 72813, 'NA', '.dm', 'XCD', '+1-767', '', '', 'en-DM', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(63, 'DO', 'DOM', 214, 'DR', 'República Dominicana', 'Dominican Republic', 'Santo Domingo', 48730, 9823821, 'NA', '.do', 'DOP', '+809/829/849', '#####', '^(d{5})$', 'es-DO', 'HT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(64, 'DZ', 'DZA', 12, 'AG', 'Algérie', 'Algeria', 'Algiers', 2381740, 34586184, 'AF', '.dz', 'DZD', '213', '#####', '^(d{5})$', 'ar-DZ,fr', 'NE,EH,LY,MR,TN,MA,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(65, 'EC', 'ECU', 218, 'EC', 'Ecuador', 'Ecuador', 'Quito', 283560, 14790608, 'SA', '.ec', 'USD', '593', '@####@', '^([a-zA-Z]d{4}[a-zA-Z])$', 'es-EC', 'PE,CO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(66, 'EE', 'EST', 233, 'EN', 'Eesti', 'Estonia', 'Tallinn', 45226, 1291170, 'EU', '.ee', 'EUR', '372', '#####', '^(d{5})$', 'et,ru', 'RU,LV', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(67, 'EG', 'EGY', 818, 'EG', 'Egypt', 'Egypt', 'Cairo', 1001450, 80471869, 'AF', '.eg', 'EGP', '20', '#####', '^(d{5})$', 'ar-EG,en,fr', 'LY,SD,IL,PS', '', NULL, '0', 0, 1, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(68, 'EH', 'ESH', 732, 'WI', 'aṣ-Ṣaḥrāwīyâ al-ʿArabīyâ', 'Western Sahara', 'El-Aaiun', 266000, 273008, 'AF', '.eh', 'MAD', '212', '', '', 'ar,mey', 'DZ,MR,MA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(69, 'ER', 'ERI', 232, 'ER', 'Ertrā', 'Eritrea', 'Asmara', 121320, 5792984, 'AF', '.er', 'ERN', '291', '', '', 'aa-ER,ar,tig,kun,ti-ER', 'ET,SD,DJ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(70, 'ES', 'ESP', 724, 'SP', 'España', 'Spain', 'Madrid', 504782, 46505963, 'EU', '.es', 'EUR', '34', '#####', '^(d{5})$', 'es-ES,ca,gl,eu,oc', 'AD,PT,GI,FR,MA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(71, 'ET', 'ETH', 231, 'ET', 'Ityoṗya', 'Ethiopia', 'Addis Ababa', 1127127, 88013491, 'AF', '.et', 'ETB', '251', '####', '^(d{4})$', 'am,en-ET,om-ET,ti-ET,so-ET,sid', 'ER,KE,SD,SS,SO,DJ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(72, 'FI', 'FIN', 246, 'FI', 'Suomi (Finland)', 'Finland', 'Helsinki', 337030, 5244000, 'EU', '.fi', 'EUR', '358', '#####', '^(?:FI)*(d{5})$', 'fi-FI,sv-FI,smn', 'NO,RU,SE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(73, 'FJ', 'FJI', 242, 'FJ', 'Viti', 'Fiji', 'Suva', 18270, 875983, 'OC', '.fj', 'FJD', '679', '', '', 'en-FJ,fj', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(74, 'FK', 'FLK', 238, 'FK', 'Falkland Islands', 'Falkland Islands', 'Stanley', 12173, 2638, 'SA', '.fk', 'FKP', '500', '', '', 'en-FK', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(75, 'FM', 'FSM', 583, 'FM', 'Micronesia', 'Micronesia', 'Palikir', 702, 107708, 'OC', '.fm', 'USD', '691', '#####', '^(d{5})$', 'en-FM,chk,pon,yap,kos,uli,woe,nkr,kpg', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(76, 'FO', 'FRO', 234, 'FO', 'Føroyar', 'Faroe Islands', 'Torshavn', 1399, 48228, 'EU', '.fo', 'DKK', '298', 'FO-###', '^(?:FO)*(d{3})$', 'fo,da-FO', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(77, 'FR', 'FRA', 250, 'FR', 'France', 'France', 'Paris', 547030, 64768389, 'EU', '.fr', 'EUR', '33', '#####', '^(d{5})$', 'fr-FR,frp,br,co,ca,eu,oc', 'CH,DE,BE,LU,IT,AD,MC,ES', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(78, 'GA', 'GAB', 266, 'GB', 'Gabon', 'Gabon', 'Libreville', 267667, 1545255, 'AF', '.ga', 'XAF', '241', '', '', 'fr-GA', 'CM,GQ,CG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(79, 'GD', 'GRD', 308, 'GJ', 'Grenada', 'Grenada', 'St. George\'s', 344, 107818, 'NA', '.gd', 'XCD', '+1-473', '', '', 'en-GD', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(80, 'GE', 'GEO', 268, 'GG', 'Sak\'art\'velo', 'Georgia', 'Tbilisi', 69700, 4630000, 'AS', '.ge', 'GEL', '995', '####', '^(d{4})$', 'ka,ru,hy,az', 'AM,AZ,TR,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(81, 'GF', 'GUF', 254, 'FG', 'Guyane', 'French Guiana', 'Cayenne', 91000, 195506, 'SA', '.gf', 'EUR', '594', '#####', '^((97|98)3d{2})$', 'fr-GF', 'SR,BR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(82, 'GG', 'GGY', 831, 'GK', 'Guernsey', 'Guernsey', 'St Peter Port', 78, 65228, 'EU', '.gg', 'GBP', '+44-1481', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,fr', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(83, 'GH', 'GHA', 288, 'GH', 'Ghana', 'Ghana', 'Accra', 239460, 24339838, 'AF', '.gh', 'GHS', '233', '', '', 'en-GH,ak,ee,tw', 'CI,TG,BF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(84, 'GI', 'GIB', 292, 'GI', 'Gibraltar', 'Gibraltar', 'Gibraltar', 7, 27884, 'EU', '.gi', 'GIP', '350', '', '', 'en-GI,es,it,pt', 'ES', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(85, 'GL', 'GRL', 304, 'GL', 'Grønland', 'Greenland', 'Nuuk', 2166086, 56375, 'NA', '.gl', 'DKK', '299', '####', '^(d{4})$', 'kl,da-GL,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(86, 'GM', 'GMB', 270, 'GA', 'Gambia', 'Gambia', 'Banjul', 11300, 1593256, 'AF', '.gm', 'GMD', '220', '', '', 'en-GM,mnk,wof,wo,ff', 'SN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(87, 'GN', 'GIN', 324, 'GV', 'Guinée', 'Guinea', 'Conakry', 245857, 10324025, 'AF', '.gn', 'GNF', '224', '', '', 'fr-GN', 'LR,SN,SL,CI,GW,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(88, 'GP', 'GLP', 312, 'GP', 'Guadeloupe', 'Guadeloupe', 'Basse-Terre', 1780, 443000, 'NA', '.gp', 'EUR', '590', '#####', '^((97|98)d{3})$', 'fr-GP', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(89, 'GQ', 'GNQ', 226, 'EK', 'Guinée Equatoriale', 'Equatorial Guinea', 'Malabo', 28051, 1014999, 'AF', '.gq', 'XAF', '240', '', '', 'es-GQ,fr', 'GA,CM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(90, 'GR', 'GRC', 300, 'GR', 'Elláda', 'Greece', 'Athens', 131940, 11000000, 'EU', '.gr', 'EUR', '30', '### ##', '^(d{5})$', 'el-GR,en,fr', 'AL,MK,TR,BG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(91, 'GS', 'SGS', 239, 'SX', 'South Georgia and the South Sandwich Islands', 'South Georgia and the South Sandwich Islands', 'Grytviken', 3903, 30, 'AN', '.gs', 'GBP', '', '', '', 'en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(92, 'GT', 'GTM', 320, 'GT', 'Guatemala', 'Guatemala', 'Guatemala City', 108890, 13550440, 'NA', '.gt', 'GTQ', '502', '#####', '^(d{5})$', 'es-GT', 'MX,HN,BZ,SV', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(93, 'GU', 'GUM', 316, 'GQ', 'Guam', 'Guam', 'Hagatna', 549, 159358, 'OC', '.gu', 'USD', '+1-671', '969##', '^(969d{2})$', 'en-GU,ch-GU', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(94, 'GW', 'GNB', 624, 'PU', 'Guiné-Bissau', 'Guinea-Bissau', 'Bissau', 36120, 1565126, 'AF', '.gw', 'XOF', '245', '####', '^(d{4})$', 'pt-GW,pov', 'SN,GN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(95, 'GY', 'GUY', 328, 'GY', 'Guyana', 'Guyana', 'Georgetown', 214970, 748486, 'SA', '.gy', 'GYD', '592', '', '', 'en-GY', 'SR,BR,VE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(96, 'HK', 'HKG', 344, 'HK', 'Hèunggóng', 'Hong Kong', 'Hong Kong', 1092, 6898686, 'AS', '.hk', 'HKD', '852', '', '', 'zh-HK,yue,zh,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(97, 'HM', 'HMD', 334, 'HM', 'Heard Island and McDonald Islands', 'Heard Island and McDonald Islands', '', 412, 0, 'AN', '.hm', 'AUD', ' ', '', '', '', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(98, 'HN', 'HND', 340, 'HO', 'Honduras', 'Honduras', 'Tegucigalpa', 112090, 7989415, 'NA', '.hn', 'HNL', '504', '@@####', '^([A-Z]{2}d{4})$', 'es-HN', 'GT,NI,SV', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(99, 'HR', 'HRV', 191, 'HR', 'Hrvatska', 'Croatia', 'Zagreb', 56542, 4491000, 'EU', '.hr', 'HRK', '385', '#####', '^(?:HR)*(d{5})$', 'hr-HR,sr', 'HU,SI,BA,ME,RS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(100, 'HT', 'HTI', 332, 'HA', 'Haïti', 'Haiti', 'Port-au-Prince', 27750, 9648924, 'NA', '.ht', 'HTG', '509', 'HT####', '^(?:HT)*(d{4})$', 'ht,fr-HT', 'DO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(101, 'HU', 'HUN', 348, 'HU', 'Magyarország', 'Hungary', 'Budapest', 93030, 9982000, 'EU', '.hu', 'HUF', '36', '####', '^(d{4})$', 'hu-HU', 'SK,SI,RO,UA,HR,AT,RS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(102, 'ID', 'IDN', 360, 'ID', 'Indonesia', 'Indonesia', 'Jakarta', 1919440, 242968342, 'AS', '.id', 'IDR', '62', '#####', '^(d{5})$', 'id,en,nl,jv', 'PG,TL,MY', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(103, 'IE', 'IRL', 372, 'EI', 'Ireland', 'Ireland', 'Dublin', 70280, 4622917, 'EU', '.ie', 'EUR', '353', '', '', 'en-IE,ga-IE', 'GB', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(104, 'IL', 'ISR', 376, 'IS', 'Yiśrā\'ēl', 'Israel', 'Jerusalem', 20770, 7353985, 'AS', '.il', 'ILS', '972', '#####', '^(d{5})$', 'he,ar-IL,en-IL,', 'SY,JO,LB,EG,PS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(105, 'IM', 'IMN', 833, 'IM', 'Isle of Man', 'Isle of Man', 'Douglas, Isle of Man', 572, 75049, 'EU', '.im', 'GBP', '+44-1624', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,gv', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(106, 'IN', 'IND', 356, 'IN', 'Bhārat', 'India', 'New Delhi', 3287590, 1173108018, 'AS', '.in', 'INR', '91', '######', '^(d{6})$', 'en-IN,hi,bn,te,mr,ta,ur,gu,kn,ml,or,pa,as,bh,sat,k', 'CN,NP,MM,BT,PK,BD', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(107, 'IO', 'IOT', 86, 'IO', 'British Indian Ocean Territory', 'British Indian Ocean Territory', 'Diego Garcia', 60, 4000, 'AS', '.io', 'USD', '246', '', '', 'en-IO', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(108, 'IQ', 'IRQ', 368, 'IZ', 'al-ʿIrāq', 'Iraq', 'Baghdad', 437072, 29671605, 'AS', '.iq', 'IQD', '964', '#####', '^(d{5})$', 'ar-IQ,ku,hy', 'SY,SA,IR,JO,TR,KW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(109, 'IR', 'IRN', 364, 'IR', 'Īrān', 'Iran', 'Tehran', 1648000, 76923300, 'AS', '.ir', 'IRR', '98', '##########', '^(d{10})$', 'fa-IR,ku', 'TM,AF,IQ,AM,PK,AZ,TR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(110, 'IS', 'ISL', 352, 'IC', 'Ísland', 'Iceland', 'Reykjavik', 103000, 308910, 'EU', '.is', 'ISK', '354', '###', '^(d{3})$', 'is,en,de,da,sv,no', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(111, 'IT', 'ITA', 380, 'IT', 'Italia', 'Italy', 'Rome', 301230, 60340328, 'EU', '.it', 'EUR', '39', '#####', '^(d{5})$', 'it-IT,en,de-IT,fr-IT,sc,ca,co,sl', 'CH,VA,SI,SM,FR,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(112, 'JE', 'JEY', 832, 'JE', 'Jersey', 'Jersey', 'Saint Helier', 116, 90812, 'EU', '.je', 'GBP', '+44-1534', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en,pt', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(113, 'JM', 'JAM', 388, 'JM', 'Jamaica', 'Jamaica', 'Kingston', 10991, 2847232, 'NA', '.jm', 'JMD', '+1-876', '', '', 'en-JM', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(114, 'JO', 'JOR', 400, 'JO', 'al-Urdun', 'Jordan', 'Amman', 92300, 6407085, 'AS', '.jo', 'JOD', '962', '#####', '^(d{5})$', 'ar-JO,en', 'SY,SA,IQ,IL,PS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(115, 'JP', 'JPN', 392, 'JA', 'Nihon', 'Japan', 'Tokyo', 377835, 127288000, 'AS', '.jp', 'JPY', '81', '###-####', '^(d{7})$', 'ja', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(116, 'KE', 'KEN', 404, 'KE', 'Kenya', 'Kenya', 'Nairobi', 582650, 40046566, 'AF', '.ke', 'KES', '254', '#####', '^(d{5})$', 'en-KE,sw-KE', 'ET,TZ,SS,SO,UG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(117, 'KG', 'KGZ', 417, 'KG', 'Kyrgyzstan', 'Kyrgyzstan', 'Bishkek', 198500, 5508626, 'AS', '.kg', 'KGS', '996', '######', '^(d{6})$', 'ky,uz,ru', 'CN,TJ,UZ,KZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(118, 'KH', 'KHM', 116, 'CB', 'Kambucā', 'Cambodia', 'Phnom Penh', 181040, 14453680, 'AS', '.kh', 'KHR', '855', '#####', '^(d{5})$', 'km,fr,en', 'LA,TH,VN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(119, 'KI', 'KIR', 296, 'KR', 'Kiribati', 'Kiribati', 'Tarawa', 811, 92533, 'OC', '.ki', 'AUD', '686', '', '', 'en-KI,gil', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(120, 'KM', 'COM', 174, 'CN', 'Comores', 'Comoros', 'Moroni', 2170, 773407, 'AF', '.km', 'KMF', '269', '', '', 'ar,fr-KM', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(121, 'KN', 'KNA', 659, 'SC', 'Saint Kitts and Nevis', 'Saint Kitts and Nevis', 'Basseterre', 261, 51134, 'NA', '.kn', 'XCD', '+1-869', '', '', 'en-KN', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(122, 'KP', 'PRK', 408, 'KN', 'Joseon', 'North Korea', 'Pyongyang', 120540, 22912177, 'AS', '.kp', 'KPW', '850', '###-###', '^(d{6})$', 'ko-KP', 'CN,KR,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(123, 'KR', 'KOR', 410, 'KS', 'Hanguk', 'South Korea', 'Seoul', 98480, 48422644, 'AS', '.kr', 'KRW', '82', 'SEOUL ###-###', '^(?:SEOUL)*(d{6})$', 'ko-KR,en', 'KP', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(124, 'KW', 'KWT', 414, 'KU', 'al-Kuwayt', 'Kuwait', 'Kuwait City', 17820, 2789132, 'AS', '.kw', 'KWD', '965', '#####', '^(d{5})$', 'ar-KW,en', 'SA,IQ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(125, 'KY', 'CYM', 136, 'CJ', 'Cayman Islands', 'Cayman Islands', 'George Town', 262, 44270, 'NA', '.ky', 'KYD', '+1-345', '', '', 'en-KY', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(126, 'KZ', 'KAZ', 398, 'KZ', 'Ķazaķstan', 'Kazakhstan', 'Astana', 2717300, 15340000, 'AS', '.kz', 'KZT', '7', '######', '^(d{6})$', 'kk,ru', 'TM,CN,KG,UZ,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(127, 'LA', 'LAO', 418, 'LA', 'Lāw', 'Laos', 'Vientiane', 236800, 6368162, 'AS', '.la', 'LAK', '856', '#####', '^(d{5})$', 'lo,fr,en', 'CN,MM,KH,TH,VN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(128, 'LB', 'LBN', 422, 'LE', 'Lubnān', 'Lebanon', 'Beirut', 10400, 4125247, 'AS', '.lb', 'LBP', '961', '#### ####|####', '^(d{4}(d{4})?)$', 'ar-LB,fr-LB,en,hy', 'SY,IL', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(129, 'LC', 'LCA', 662, 'ST', 'Saint Lucia', 'Saint Lucia', 'Castries', 616, 160922, 'NA', '.lc', 'XCD', '+1-758', '', '', 'en-LC', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(130, 'LI', 'LIE', 438, 'LS', 'Liechtenstein', 'Liechtenstein', 'Vaduz', 160, 35000, 'EU', '.li', 'CHF', '423', '####', '^(d{4})$', 'de-LI', 'CH,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(131, 'LK', 'LKA', 144, 'CE', 'Šrī Laṁkā', 'Sri Lanka', 'Colombo', 65610, 21513990, 'AS', '.lk', 'LKR', '94', '#####', '^(d{5})$', 'si,ta,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(132, 'LR', 'LBR', 430, 'LI', 'Liberia', 'Liberia', 'Monrovia', 111370, 3685076, 'AF', '.lr', 'LRD', '231', '####', '^(d{4})$', 'en-LR', 'SL,CI,GN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(133, 'LS', 'LSO', 426, 'LT', 'Lesotho', 'Lesotho', 'Maseru', 30355, 1919552, 'AF', '.ls', 'LSL', '266', '###', '^(d{3})$', 'en-LS,st,zu,xh', 'ZA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(134, 'LT', 'LTU', 440, 'LH', 'Lietuva', 'Lithuania', 'Vilnius', 65200, 2944459, 'EU', '.lt', 'EUR', '370', 'LT-#####', '^(?:LT)*(d{5})$', 'lt,ru,pl', 'PL,BY,RU,LV', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(135, 'LU', 'LUX', 442, 'LU', 'Lëtzebuerg', 'Luxembourg', 'Luxembourg', 2586, 497538, 'EU', '.lu', 'EUR', '352', 'L-####', '^(d{4})$', 'lb,de-LU,fr-LU', 'DE,BE,FR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(136, 'LV', 'LVA', 428, 'LG', 'Latvija', 'Latvia', 'Riga', 64589, 2217969, 'EU', '.lv', 'EUR', '371', 'LV-####', '^(?:LV)*(d{4})$', 'lv,ru,lt', 'LT,EE,BY,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(137, 'LY', 'LBY', 434, 'LY', 'Lībiyā', 'Libya', 'Tripolis', 1759540, 6461454, 'AF', '.ly', 'LYD', '218', '', '', 'ar-LY,it,en', 'TD,NE,DZ,SD,TN,EG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(138, 'MA', 'MAR', 504, 'MO', 'Maroc', 'Morocco', 'Rabat', 446550, 31627428, 'AF', '.ma', 'MAD', '212', '#####', '^(d{5})$', 'ar-MA,fr', 'DZ,EH,ES', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(139, 'MC', 'MCO', 492, 'MN', 'Monaco', 'Monaco', 'Monaco', 2, 32965, 'EU', '.mc', 'EUR', '377', '#####', '^(d{5})$', 'fr-MC,en,it', 'FR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(140, 'MD', 'MDA', 498, 'MD', 'Moldova', 'Moldova', 'Chisinau', 33843, 4324000, 'EU', '.md', 'MDL', '373', 'MD-####', '^(?:MD)*(d{4})$', 'ro,ru,gag,tr', 'RO,UA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(141, 'ME', 'MNE', 499, 'MJ', 'Crna Gora', 'Montenegro', 'Podgorica', 14026, 666730, 'EU', '.me', 'EUR', '382', '#####', '^(d{5})$', 'sr,hu,bs,sq,hr,rom', 'AL,HR,BA,RS,XK', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(142, 'MF', 'MAF', 663, 'RN', 'Saint Martin', 'Saint Martin', 'Marigot', 53, 35925, 'NA', '.gp', 'EUR', '590', '### ###', '', 'fr', 'SX', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(143, 'MG', 'MDG', 450, 'MA', 'Madagascar', 'Madagascar', 'Antananarivo', 587040, 21281844, 'AF', '.mg', 'MGA', '261', '###', '^(d{3})$', 'fr-MG,mg', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(144, 'MH', 'MHL', 584, 'RM', 'Marshall Islands', 'Marshall Islands', 'Majuro', 181, 65859, 'OC', '.mh', 'USD', '692', '', '', 'mh,en-MH', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(145, 'MK', 'MKD', 807, 'MK', 'Makedonija', 'Macedonia', 'Skopje', 25333, 2062294, 'EU', '.mk', 'MKD', '389', '####', '^(d{4})$', 'mk,sq,tr,rmm,sr', 'AL,GR,BG,RS,XK', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(146, 'ML', 'MLI', 466, 'ML', 'Mali', 'Mali', 'Bamako', 1240000, 13796354, 'AF', '.ml', 'XOF', '223', '', '', 'fr-ML,bm', 'SN,NE,DZ,CI,GN,MR,BF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(147, 'MM', 'MMR', 104, 'BM', 'Mẏanmā', 'Myanmar', 'Nay Pyi Taw', 678500, 53414374, 'AS', '.mm', 'MMK', '95', '#####', '^(d{5})$', 'my', 'CN,LA,TH,BD,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(148, 'MN', 'MNG', 496, 'MG', 'Mongol Uls', 'Mongolia', 'Ulan Bator', 1565000, 3086918, 'AS', '.mn', 'MNT', '976', '######', '^(d{6})$', 'mn,ru', 'CN,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(149, 'MO', 'MAC', 446, 'MC', 'Ngoumún', 'Macao', 'Macao', 254, 449198, 'AS', '.mo', 'MOP', '853', '', '', 'zh,zh-MO,pt', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(150, 'MP', 'MNP', 580, 'CQ', 'Northern Mariana Islands', 'Northern Mariana Islands', 'Saipan', 477, 53883, 'OC', '.mp', 'USD', '+1-670', '', '', 'fil,tl,zh,ch-MP,en-MP', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(151, 'MQ', 'MTQ', 474, 'MB', 'Martinique', 'Martinique', 'Fort-de-France', 1100, 432900, 'NA', '.mq', 'EUR', '596', '#####', '^(d{5})$', 'fr-MQ', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(152, 'MR', 'MRT', 478, 'MR', 'Mauritanie', 'Mauritania', 'Nouakchott', 1030700, 3205060, 'AF', '.mr', 'MRO', '222', '', '', 'ar-MR,fuc,snk,fr,mey,wo', 'SN,DZ,EH,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(153, 'MS', 'MSR', 500, 'MH', 'Montserrat', 'Montserrat', 'Plymouth', 102, 9341, 'NA', '.ms', 'XCD', '+1-664', '', '', 'en-MS', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(154, 'MT', 'MLT', 470, 'MT', 'Malta', 'Malta', 'Valletta', 316, 403000, 'EU', '.mt', 'EUR', '356', '@@@ ###|@@@ ##', '^([A-Z]{3}d{2}d?)$', 'mt,en-MT', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(155, 'MU', 'MUS', 480, 'MP', 'Mauritius', 'Mauritius', 'Port Louis', 2040, 1294104, 'AF', '.mu', 'MUR', '230', '', '', 'en-MU,bho,fr', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(156, 'MV', 'MDV', 462, 'MV', 'Dhivehi', 'Maldives', 'Male', 300, 395650, 'AS', '.mv', 'MVR', '960', '#####', '^(d{5})$', 'dv,en', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(157, 'MW', 'MWI', 454, 'MI', 'Malawi', 'Malawi', 'Lilongwe', 118480, 15447500, 'AF', '.mw', 'MWK', '265', '', '', 'ny,yao,tum,swk', 'TZ,MZ,ZM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(158, 'MX', 'MEX', 484, 'MX', 'México', 'Mexico', 'Mexico City', 1972550, 112468855, 'NA', '.mx', 'MXN', '52', '#####', '^(d{5})$', 'es-MX', 'GT,US,BZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(159, 'MY', 'MYS', 458, 'MY', 'Malaysia', 'Malaysia', 'Kuala Lumpur', 329750, 28274729, 'AS', '.my', 'MYR', '60', '#####', '^(d{5})$', 'ms-MY,en,zh,ta,te,ml,pa,th', 'BN,TH,ID', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(160, 'MZ', 'MOZ', 508, 'MZ', 'Moçambique', 'Mozambique', 'Maputo', 801590, 22061451, 'AF', '.mz', 'MZN', '258', '####', '^(d{4})$', 'pt-MZ,vmw', 'ZW,TZ,SZ,ZA,ZM,MW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(161, 'NA', 'NAM', 516, 'WA', 'Namibia', 'Namibia', 'Windhoek', 825418, 2128471, 'AF', '.na', 'NAD', '264', '', '', 'en-NA,af,de,hz,naq', 'ZA,BW,ZM,AO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(162, 'NC', 'NCL', 540, 'NC', 'Nouvelle Calédonie', 'New Caledonia', 'Noumea', 19060, 216494, 'OC', '.nc', 'XPF', '687', '#####', '^(d{5})$', 'fr-NC', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(163, 'NE', 'NER', 562, 'NG', 'Niger', 'Niger', 'Niamey', 1267000, 15878271, 'AF', '.ne', 'XOF', '227', '####', '^(d{4})$', 'fr-NE,ha,kr,dje', 'TD,BJ,DZ,LY,BF,NG,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(164, 'NF', 'NFK', 574, 'NF', 'Norfolk Island', 'Norfolk Island', 'Kingston', 35, 1828, 'OC', '.nf', 'AUD', '672', '####', '^(d{4})$', 'en-NF', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(165, 'NG', 'NGA', 566, 'NI', 'Nigeria', 'Nigeria', 'Abuja', 923768, 154000000, 'AF', '.ng', 'NGN', '234', '######', '^(d{6})$', 'en-NG,ha,yo,ig,ff', 'TD,NE,BJ,CM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(166, 'NI', 'NIC', 558, 'NU', 'Nicaragua', 'Nicaragua', 'Managua', 129494, 5995928, 'NA', '.ni', 'NIO', '505', '###-###-#', '^(d{7})$', 'es-NI,en', 'CR,HN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(167, 'NL', 'NLD', 528, 'NL', 'Nederland', 'Netherlands', 'Amsterdam', 41526, 16645000, 'EU', '.nl', 'EUR', '31', '#### @@', '^(d{4}[A-Z]{2})$', 'nl-NL,fy-NL', 'DE,BE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(168, 'NO', 'NOR', 578, 'NO', 'Norge (Noreg)', 'Norway', 'Oslo', 324220, 5009150, 'EU', '.no', 'NOK', '47', '####', '^(d{4})$', 'no,nb,nn,se,fi', 'FI,RU,SE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(169, 'NP', 'NPL', 524, 'NP', 'Nēpāl', 'Nepal', 'Kathmandu', 140800, 28951852, 'AS', '.np', 'NPR', '977', '#####', '^(d{5})$', 'ne,en', 'CN,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(170, 'NR', 'NRU', 520, 'NR', 'Naoero', 'Nauru', 'Yaren', 21, 10065, 'OC', '.nr', 'AUD', '674', '', '', 'na,en-NR', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(171, 'NU', 'NIU', 570, 'NE', 'Niue', 'Niue', 'Alofi', 260, 2166, 'OC', '.nu', 'NZD', '683', '', '', 'niu,en-NU', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(172, 'NZ', 'NZL', 554, 'NZ', 'New Zealand', 'New Zealand', 'Wellington', 268680, 4252277, 'OC', '.nz', 'NZD', '64', '####', '^(d{4})$', 'en-NZ,mi', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(173, 'OM', 'OMN', 512, 'MU', 'ʿUmān', 'Oman', 'Muscat', 212460, 2967717, 'AS', '.om', 'OMR', '968', '###', '^(d{3})$', 'ar-OM,en,bal,ur', 'SA,YE,AE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(174, 'PA', 'PAN', 591, 'PM', 'Panamá', 'Panama', 'Panama City', 78200, 3410676, 'NA', '.pa', 'PAB', '507', '', '', 'es-PA,en', 'CR,CO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(175, 'PE', 'PER', 604, 'PE', 'Perú', 'Peru', 'Lima', 1285220, 29907003, 'SA', '.pe', 'PEN', '51', '', '', 'es-PE,qu,ay', 'EC,CL,BO,BR,CO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(176, 'PF', 'PYF', 258, 'FP', 'Polinésie Française', 'French Polynesia', 'Papeete', 4167, 270485, 'OC', '.pf', 'XPF', '689', '#####', '^((97|98)7d{2})$', 'fr-PF,ty', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(177, 'PG', 'PNG', 598, 'PP', 'Papua New Guinea', 'Papua New Guinea', 'Port Moresby', 462840, 6064515, 'OC', '.pg', 'PGK', '675', '###', '^(d{3})$', 'en-PG,ho,meu,tpi', 'ID', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(178, 'PH', 'PHL', 608, 'RP', 'Pilipinas', 'Philippines', 'Manila', 300000, 99900177, 'AS', '.ph', 'PHP', '63', '####', '^(d{4})$', 'tl,en-PH,fil', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(179, 'PK', 'PAK', 586, 'PK', 'Pākistān', 'Pakistan', 'Islamabad', 803940, 184404791, 'AS', '.pk', 'PKR', '92', '#####', '^(d{5})$', 'ur-PK,en-PK,pa,sd,ps,brh', 'CN,AF,IR,IN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(180, 'PL', 'POL', 616, 'PL', 'Polska', 'Poland', 'Warsaw', 312685, 38500000, 'EU', '.pl', 'PLN', '48', '##-###', '^(d{5})$', 'pl', 'DE,LT,SK,CZ,BY,UA,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(181, 'PM', 'SPM', 666, 'SB', 'Saint Pierre and Miquelon', 'Saint Pierre and Miquelon', 'Saint-Pierre', 242, 7012, 'NA', '.pm', 'EUR', '508', '#####', '^(97500)$', 'fr-PM', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(182, 'PN', 'PCN', 612, 'PC', 'Pitcairn', 'Pitcairn', 'Adamstown', 47, 46, 'OC', '.pn', 'NZD', '870', '', '', 'en-PN', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(183, 'PR', 'PRI', 630, 'RQ', 'Puerto Rico', 'Puerto Rico', 'San Juan', 9104, 3916632, 'NA', '.pr', 'USD', '+1-787/1-939', '#####-####', '^(d{9})$', 'en-PR,es-PR', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(184, 'PS', 'PSE', 275, 'WE', 'Filasṭīn', 'Palestinian Territory', 'East Jerusalem', 5970, 3800000, 'AS', '.ps', 'ILS', '970', '', '', 'ar-PS', 'JO,IL,EG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(185, 'PT', 'PRT', 620, 'PO', 'Portugal', 'Portugal', 'Lisbon', 92391, 10676000, 'EU', '.pt', 'EUR', '351', '####-###', '^(d{7})$', 'pt-PT,mwl', 'ES', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(186, 'PW', 'PLW', 585, 'PS', 'Palau', 'Palau', 'Melekeok', 458, 19907, 'OC', '.pw', 'USD', '680', '96940', '^(96940)$', 'pau,sov,en-PW,tox,ja,fil,zh', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(187, 'PY', 'PRY', 600, 'PA', 'Paraguay', 'Paraguay', 'Asuncion', 406750, 6375830, 'SA', '.py', 'PYG', '595', '####', '^(d{4})$', 'es-PY,gn', 'BO,BR,AR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(188, 'QA', 'QAT', 634, 'QA', 'Qaṭar', 'Qatar', 'Doha', 11437, 840926, 'AS', '.qa', 'QAR', '974', '', '', 'ar-QA,en', 'SA', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(189, 'RE', 'REU', 638, 'RE', 'Réunion', 'Reunion', 'Saint-Denis', 2517, 776948, 'AF', '.re', 'EUR', '262', '#####', '^((97|98)(4|7|8)d{2})$', 'fr-RE', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(190, 'RO', 'ROU', 642, 'RO', 'România', 'Romania', 'Bucharest', 237500, 21959278, 'EU', '.ro', 'RON', '40', '######', '^(d{6})$', 'ro,hu,rom', 'MD,HU,UA,BG,RS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(191, 'RS', 'SRB', 688, 'RI', 'Srbija', 'Serbia', 'Belgrade', 88361, 7344847, 'EU', '.rs', 'RSD', '381', '######', '^(d{6})$', 'sr,hu,bs,rom', 'AL,HU,MK,RO,HR,BA,BG,ME,XK', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(192, 'RU', 'RUS', 643, 'RS', 'Rossija', 'Russia', 'Moscow', 17100000, 140702000, 'EU', '.ru', 'RUB', '7', '######', '^(d{6})$', 'ru,tt,xal,cau,ady,kv,ce,tyv,cv,udm,tut,mns,bua,myv', 'GE,CN,BY,UA,KZ,LV,PL,EE,LT,FI,MN,NO,AZ,KP', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(193, 'RW', 'RWA', 646, 'RW', 'Rwanda', 'Rwanda', 'Kigali', 26338, 11055976, 'AF', '.rw', 'RWF', '250', '', '', 'rw,en-RW,fr-RW,sw', 'TZ,CD,BI,UG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(194, 'SA', 'SAU', 682, 'SA', 'as-Saʿūdīyâ', 'Saudi Arabia', 'Riyadh', 1960582, 25731776, 'AS', '.sa', 'SAR', '966', '#####', '^(d{5})$', 'ar-SA', 'QA,OM,IQ,YE,JO,AE,KW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(195, 'SB', 'SLB', 90, 'BP', 'Solomon Islands', 'Solomon Islands', 'Honiara', 28450, 559198, 'OC', '.sb', 'SBD', '677', '', '', 'en-SB,tpi', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(196, 'SC', 'SYC', 690, 'SE', 'Seychelles', 'Seychelles', 'Victoria', 455, 88340, 'AF', '.sc', 'SCR', '248', '', '', 'en-SC,fr-SC', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(197, 'SD', 'SDN', 729, 'SU', 'Sudan', 'Sudan', 'Khartoum', 1861484, 35000000, 'AF', '.sd', 'SDG', '249', '#####', '^(d{5})$', 'ar-SD,en,fia', 'SS,TD,EG,ET,ER,LY,CF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(198, 'SE', 'SWE', 752, 'SW', 'Sverige', 'Sweden', 'Stockholm', 449964, 9555893, 'EU', '.se', 'SEK', '46', '### ##', '^(?:SE)*(d{5})$', 'sv-SE,se,sma,fi-SE', 'NO,FI', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(199, 'SG', 'SGP', 702, 'SN', 'xīnjiāpō', 'Singapore', 'Singapur', 693, 4701069, 'AS', '.sg', 'SGD', '65', '######', '^(d{6})$', 'cmn,en-SG,ms-SG,ta-SG,zh-SG', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(200, 'SH', 'SHN', 654, 'SH', 'Saint Helena', 'Saint Helena', 'Jamestown', 410, 7460, 'AF', '.sh', 'SHP', '290', 'STHL 1ZZ', '^(STHL1ZZ)$', 'en-SH', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(201, 'SI', 'SVN', 705, 'SI', 'Slovenija', 'Slovenia', 'Ljubljana', 20273, 2007000, 'EU', '.si', 'EUR', '386', '####', '^(?:SI)*(d{4})$', 'sl,sh', 'HU,IT,HR,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(202, 'SJ', 'SJM', 744, 'SV', 'Svalbard and Jan Mayen', 'Svalbard and Jan Mayen', 'Longyearbyen', 62049, 2550, 'EU', '.sj', 'NOK', '47', '', '', 'no,ru', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(203, 'SK', 'SVK', 703, 'LO', 'Slovensko', 'Slovakia', 'Bratislava', 48845, 5455000, 'EU', '.sk', 'EUR', '421', '### ##', '^(d{5})$', 'sk,hu', 'PL,HU,CZ,UA,AT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(204, 'SL', 'SLE', 694, 'SL', 'Sierra Leone', 'Sierra Leone', 'Freetown', 71740, 5245695, 'AF', '.sl', 'SLL', '232', '', '', 'en-SL,men,tem', 'LR,GN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(205, 'SM', 'SMR', 674, 'SM', 'San Marino', 'San Marino', 'San Marino', 61, 31477, 'EU', '.sm', 'EUR', '378', '4789#', '^(4789d)$', 'it-SM', 'IT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(206, 'SN', 'SEN', 686, 'SG', 'Sénégal', 'Senegal', 'Dakar', 196190, 12323252, 'AF', '.sn', 'XOF', '221', '#####', '^(d{5})$', 'fr-SN,wo,fuc,mnk', 'GN,MR,GW,GM,ML', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(207, 'SO', 'SOM', 706, 'SO', 'Soomaaliya', 'Somalia', 'Mogadishu', 637657, 10112453, 'AF', '.so', 'SOS', '252', '@@  #####', '^([A-Z]{2}d{5})$', 'so-SO,ar-SO,it,en-SO', 'ET,KE,DJ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(208, 'SR', 'SUR', 740, 'NS', 'Suriname', 'Suriname', 'Paramaribo', 163270, 492829, 'SA', '.sr', 'SRD', '597', '', '', 'nl-SR,en,srn,hns,jv', 'GY,BR,GF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(209, 'SS', 'SSD', 728, 'OD', 'South Sudan', 'South Sudan', 'Juba', 644329, 8260490, 'AF', '', 'SSP', '211', '', '', 'en', 'CD,CF,ET,KE,SD,UG,', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(210, 'ST', 'STP', 678, 'TP', 'São Tomé e Príncipe', 'Sao Tome and Principe', 'Sao Tome', 1001, 175808, 'AF', '.st', 'STD', '239', '', '', 'pt-ST', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(211, 'SV', 'SLV', 222, 'ES', 'El Salvador', 'El Salvador', 'San Salvador', 21040, 6052064, 'NA', '.sv', 'USD', '503', 'CP ####', '^(?:CP)*(d{4})$', 'es-SV', 'GT,HN', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(212, 'SX', 'SXM', 534, 'NN', 'Sint Maarten', 'Sint Maarten', 'Philipsburg', 21, 37429, 'NA', '.sx', 'ANG', '599', '', '', 'nl,en', 'MF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(213, 'SY', 'SYR', 760, 'SY', 'Sūrīyâ', 'Syria', 'Damascus', 185180, 22198110, 'AS', '.sy', 'SYP', '963', '', '', 'ar-SY,ku,hy,arc,fr,en', 'IQ,JO,IL,TR,LB', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(214, 'SZ', 'SWZ', 748, 'WZ', 'Swaziland', 'Swaziland', 'Mbabane', 17363, 1354051, 'AF', '.sz', 'SZL', '268', '@###', '^([A-Z]d{3})$', 'en-SZ,ss-SZ', 'ZA,MZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(215, 'TC', 'TCA', 796, 'TK', 'Turks and Caicos Islands', 'Turks and Caicos Islands', 'Cockburn Town', 430, 20556, 'NA', '.tc', 'USD', '+1-649', 'TKCA 1ZZ', '^(TKCA 1ZZ)$', 'en-TC', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(216, 'TD', 'TCD', 148, 'CD', 'Tchad', 'Chad', 'N\'Djamena', 1284000, 10543464, 'AF', '.td', 'XAF', '235', '', '', 'fr-TD,ar-TD,sre', 'NE,LY,CF,SD,CM,NG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(217, 'TF', 'ATF', 260, 'FS', 'French Southern Territories', 'French Southern Territories', 'Port-aux-Francais', 7829, 140, 'AN', '.tf', 'EUR', '', '', '', 'fr', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(218, 'TG', 'TGO', 768, 'TO', 'Togo', 'Togo', 'Lome', 56785, 6587239, 'AF', '.tg', 'XOF', '228', '', '', 'fr-TG,ee,hna,kbp,dag,ha', 'BJ,GH,BF', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(219, 'TH', 'THA', 764, 'TH', 'Prathēt tai', 'Thailand', 'Bangkok', 514000, 67089500, 'AS', '.th', 'THB', '66', '#####', '^(d{5})$', 'th,en', 'LA,MM,KH,MY', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(220, 'TJ', 'TJK', 762, 'TI', 'Tojikiston', 'Tajikistan', 'Dushanbe', 143100, 7487489, 'AS', '.tj', 'TJS', '992', '######', '^(d{6})$', 'tg,ru', 'CN,AF,KG,UZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(221, 'TK', 'TKL', 772, 'TL', 'Tokelau', 'Tokelau', '', 10, 1466, 'OC', '.tk', 'NZD', '690', '', '', 'tkl,en-TK', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(222, 'TL', 'TLS', 626, 'TT', 'Timór Lorosa\'e', 'East Timor', 'Dili', 15007, 1154625, 'OC', '.tl', 'USD', '670', '', '', 'tet,pt-TL,id,en', 'ID', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18');
INSERT INTO `countries` (`id`, `code`, `iso3`, `iso_numeric`, `fips`, `name`, `asciiname`, `capital`, `area`, `population`, `continent_code`, `tld`, `currency_code`, `phone`, `postal_code_format`, `postal_code_regex`, `languages`, `neighbours`, `equivalent_fips_code`, `background_image`, `admin_type`, `admin_field_active`, `active`, `created_at`, `updated_at`) VALUES
(223, 'TM', 'TKM', 795, 'TX', 'Turkmenistan', 'Turkmenistan', 'Ashgabat', 488100, 4940916, 'AS', '.tm', 'TMT', '993', '######', '^(d{6})$', 'tk,ru,uz', 'AF,IR,UZ,KZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(224, 'TN', 'TUN', 788, 'TS', 'Tunisie', 'Tunisia', 'Tunis', 163610, 10589025, 'AF', '.tn', 'TND', '216', '####', '^(d{4})$', 'ar-TN,fr', 'DZ,LY', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(225, 'TO', 'TON', 776, 'TN', 'Tonga', 'Tonga', 'Nuku\'alofa', 748, 122580, 'OC', '.to', 'TOP', '676', '', '', 'to,en-TO', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(226, 'TR', 'TUR', 792, 'TU', 'Türkiye', 'Turkey', 'Ankara', 780580, 77804122, 'AS', '.tr', 'TRY', '90', '#####', '^(d{5})$', 'tr-TR,ku,diq,az,av', 'SY,GE,IQ,IR,GR,AM,AZ,BG', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(227, 'TT', 'TTO', 780, 'TD', 'Trinidad and Tobago', 'Trinidad and Tobago', 'Port of Spain', 5128, 1228691, 'NA', '.tt', 'TTD', '+1-868', '', '', 'en-TT,hns,fr,es,zh', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(228, 'TV', 'TUV', 798, 'TV', 'Tuvalu', 'Tuvalu', 'Funafuti', 26, 10472, 'OC', '.tv', 'AUD', '688', '', '', 'tvl,en,sm,gil', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(229, 'TW', 'TWN', 158, 'TW', 'T\'ai2-wan1', 'Taiwan', 'Taipei', 35980, 22894384, 'AS', '.tw', 'TWD', '886', '#####', '^(d{5})$', 'zh-TW,zh,nan,hak', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(230, 'TZ', 'TZA', 834, 'TZ', 'Tanzania', 'Tanzania', 'Dodoma', 945087, 41892895, 'AF', '.tz', 'TZS', '255', '', '', 'sw-TZ,en,ar', 'MZ,KE,CD,RW,ZM,BI,UG,MW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(231, 'UA', 'UKR', 804, 'UP', 'Ukrajina', 'Ukraine', 'Kiev', 603700, 45415596, 'EU', '.ua', 'UAH', '380', '#####', '^(d{5})$', 'uk,ru-UA,rom,pl,hu', 'PL,MD,HU,SK,BY,RO,RU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(232, 'UG', 'UGA', 800, 'UG', 'Uganda', 'Uganda', 'Kampala', 236040, 33398682, 'AF', '.ug', 'UGX', '256', '', '', 'en-UG,lg,sw,ar', 'TZ,KE,SS,CD,RW', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(233, 'UK', 'GBR', 826, 'UK', 'United Kingdom', 'United Kingdom', 'London', 244820, 62348447, 'EU', '.uk', 'GBP', '44', '@# #@@|@## #@@|@@# #@@|@@## #@@|@#@ #@@|@@#@ #@@|G', '^(([A-Z]d{2}[A-Z]{2})|([A-Z]d{3}[A-Z]{2})|([A-Z]{2}d{2}[A-Z]{2})|([A-Z]{2}d{3}[A-Z]{2})|([A-Z]d[A-Z]d[A-Z]{2})|([A-Z]{2}d[A-Z]d[A-Z]{2})|(GIR0AA))$', 'en-GB,cy-GB,gd', 'IE', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(234, 'UM', 'UMI', 581, '', 'United States Minor Outlying Islands', 'United States Minor Outlying Islands', '', 0, 0, 'OC', '.um', 'USD', '1', '', '', 'en-UM', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(235, 'US', 'USA', 840, 'US', 'USA', 'United States', 'Washington', 9629091, 310232863, 'NA', '.us', 'USD', '1', '#####-####', '^d{5}(-d{4})?$', 'en-US,es-US,haw,fr', 'CA,MX,CU', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(236, 'UY', 'URY', 858, 'UY', 'Uruguay', 'Uruguay', 'Montevideo', 176220, 3477000, 'SA', '.uy', 'UYU', '598', '#####', '^(d{5})$', 'es-UY', 'BR,AR', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(237, 'UZ', 'UZB', 860, 'UZ', 'O\'zbekiston', 'Uzbekistan', 'Tashkent', 447400, 27865738, 'AS', '.uz', 'UZS', '998', '######', '^(d{6})$', 'uz,ru,tg', 'TM,AF,KG,TJ,KZ', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(238, 'VA', 'VAT', 336, 'VT', 'Vaticanum', 'Vatican', 'Vatican City', 0, 921, 'EU', '.va', 'EUR', '379', '#####', '^(d{5})$', 'la,it,fr', 'IT', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(239, 'VC', 'VCT', 670, 'VC', 'Saint Vincent and the Grenadines', 'Saint Vincent and the Grenadines', 'Kingstown', 389, 104217, 'NA', '.vc', 'XCD', '+1-784', '', '', 'en-VC,fr', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(240, 'VE', 'VEN', 862, 'VE', 'Venezuela', 'Venezuela', 'Caracas', 912050, 27223228, 'SA', '.ve', 'VEF', '58', '####', '^(d{4})$', 'es-VE', 'GY,BR,CO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(241, 'VG', 'VGB', 92, 'VI', 'British Virgin Islands', 'British Virgin Islands', 'Road Town', 153, 21730, 'NA', '.vg', 'USD', '+1-284', '', '', 'en-VG', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(242, 'VI', 'VIR', 850, 'VQ', 'U.S. Virgin Islands', 'U.S. Virgin Islands', 'Charlotte Amalie', 352, 108708, 'NA', '.vi', 'USD', '+1-340', '#####-####', '^d{5}(-d{4})?$', 'en-VI', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(243, 'VN', 'VNM', 704, 'VM', 'Việt Nam', 'Vietnam', 'Hanoi', 329560, 89571130, 'AS', '.vn', 'VND', '84', '######', '^(d{6})$', 'vi,en,fr,zh,km', 'CN,LA,KH', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(244, 'VU', 'VUT', 548, 'NH', 'Vanuatu', 'Vanuatu', 'Port Vila', 12200, 221552, 'OC', '.vu', 'VUV', '678', '', '', 'bi,en-VU,fr-VU', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(245, 'WF', 'WLF', 876, 'WF', 'Wallis and Futuna', 'Wallis and Futuna', 'Mata Utu', 274, 16025, 'OC', '.wf', 'XPF', '681', '#####', '^(986d{2})$', 'wls,fud,fr-WF', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(246, 'WS', 'WSM', 882, 'WS', 'Samoa', 'Samoa', 'Apia', 2944, 192001, 'OC', '.ws', 'WST', '685', '', '', 'sm,en-WS', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(247, 'XK', 'XKX', 0, 'KV', 'Kosovo', 'Kosovo', 'Pristina', 10908, 1800000, 'EU', '', 'EUR', '', '', '', 'sq,sr', 'RS,AL,MK,ME', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(248, 'YE', 'YEM', 887, 'YM', 'al-Yaman', 'Yemen', 'Sanaa', 527970, 23495361, 'AS', '.ye', 'YER', '967', '', '', 'ar-YE', 'SA,OM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(249, 'YT', 'MYT', 175, 'MF', 'Mayotte', 'Mayotte', 'Mamoudzou', 374, 159042, 'AF', '.yt', 'EUR', '262', '#####', '^(d{5})$', 'fr-YT', '', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(250, 'ZA', 'ZAF', 710, 'SF', 'South Africa', 'South Africa', 'Pretoria', 1219912, 49000000, 'AF', '.za', 'ZAR', '27', '####', '^(d{4})$', 'zu,xh,af,nso,en-ZA,tn,st,ts,ss,ve,nr', 'ZW,SZ,MZ,BW,NA,LS', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(251, 'ZM', 'ZMB', 894, 'ZA', 'Zambia', 'Zambia', 'Lusaka', 752614, 13460305, 'AF', '.zm', 'ZMW', '260', '#####', '^(d{5})$', 'en-ZM,bem,loz,lun,lue,ny,toi', 'ZW,TZ,MZ,CD,NA,MW,AO', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(252, 'ZW', 'ZWE', 716, 'ZI', 'Zimbabwe', 'Zimbabwe', 'Harare', 390580, 11651858, 'AF', '.zw', 'ZWL', '263', '', '', 'en-ZW,sn,nr,nd', 'ZA,MZ,BW,ZM', '', NULL, '0', 0, 0, '2021-01-07 11:37:18', '2021-01-07 11:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `html_entity` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_arial` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `font_code2000` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_decimal` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unicode_hex` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_left` tinyint UNSIGNED DEFAULT '0',
  `decimal_places` int UNSIGNED DEFAULT '0' COMMENT 'Currency Decimal Places - ISO 4217',
  `decimal_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `thousand_separator` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `html_entity`, `font_arial`, `font_code2000`, `unicode_decimal`, `unicode_hex`, `in_left`, `decimal_places`, `decimal_separator`, `thousand_separator`, `created_at`, `updated_at`) VALUES
(1, 'AED', 'United Arab Emirates Dirham', '&#1583;.&#1573;', 'د.إ', 'د.إ', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(2, 'AFN', 'Afghanistan Afghani', '&#65;&#102;', '؋', '؋', '1547', '60b', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(3, 'ALL', 'Albania Lek', '&#76;&#101;&#107;', 'Lek', 'Lek', '76, 1', '4c, 6', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(4, 'AMD', 'Armenia Dram', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(5, 'ANG', 'Netherlands Antilles Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(6, 'AOA', 'Angola Kwanza', '&#75;&#122;', 'Kz', 'Kz', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(7, 'ARS', 'Argentina Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(8, 'AUD', 'Australia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(9, 'AWG', 'Aruba Guilder', '&#402;', 'ƒ', 'ƒ', '402', '192', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(10, 'AZN', 'Azerbaijan New Manat', '&#1084;&#1072;&#1085;', 'ман', 'ман', '1084,', '43c, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(11, 'BAM', 'Bosnia and Herzegovina Convertible Marka', '&#75;&#77;', 'KM', 'KM', '75, 7', '4b, 4', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(12, 'BBD', 'Barbados Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(13, 'BDT', 'Bangladesh Taka', '&#2547;', '৳', '৳', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(14, 'BGN', 'Bulgaria Lev', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(15, 'BHD', 'Bahrain Dinar', '.&#1583;.&#1576;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(16, 'BIF', 'Burundi Franc', '&#70;&#66;&#117;', 'FBu', 'FBu', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(17, 'BMD', 'Bermuda Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(18, 'BND', 'Brunei Darussalam Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(19, 'BOB', 'Bolivia Boliviano', '&#36;&#98;', '$b', '$b', '36, 9', '24, 6', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(20, 'BRL', 'Brazil Real', '&#82;&#36;', 'R$', 'R$', '82, 3', '52, 2', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(21, 'BSD', 'Bahamas Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(22, 'BTN', 'Bhutan Ngultrum', '&#78;&#117;&#46;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(23, 'BWP', 'Botswana Pula', '&#80;', 'P', 'P', '80', '50', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(24, 'BYR', 'Belarus Ruble', '&#112;&#46;', 'p.', 'p.', '112, ', '70, 2', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(25, 'BZD', 'Belize Dollar', '&#66;&#90;&#36;', 'BZ$', 'BZ$', '66, 9', '42, 5', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(26, 'CAD', 'Canada Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(27, 'CDF', 'Congo/Kinshasa Franc', '&#70;&#67;', 'Fr', 'Fr', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(28, 'CHF', 'Switzerland Franc', '&#67;&#72;&#70;', 'Fr', 'Fr', '67, 7', '43, 4', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(29, 'CLP', 'Chile Peso', '&#36;', '$', '$', '36', '24', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(30, 'CNY', 'China Yuan Renminbi', '&#165;', '¥', '¥', '165', 'a5', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(31, 'COP', 'Colombia Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(32, 'CRC', 'Costa Rica Colon', '&#8353;', '₡', '₡', '8353', '20a1', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(33, 'CUC', 'Cuba Convertible Peso', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(34, 'CUP', 'Cuba Peso', '&#8396;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(35, 'CVE', 'Cape Verde Escudo', '&#x24;', '$', '$', NULL, NULL, 1, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(36, 'CZK', 'Czech Republic Koruna', '&#75;&#269;', 'Kč', 'Kč', '75, 2', '4b, 1', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(37, 'DJF', 'Djibouti Franc', '&#70;&#100;&#106;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(38, 'DKK', 'Denmark Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(39, 'DOP', 'Dominican Republic Peso', '&#82;&#68;&#36;', 'RD$', 'RD$', '82, 6', '52, 4', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(40, 'DZD', 'Algeria Dinar', '&#1583;&#1580;', 'DA', 'DA', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(41, 'EEK', 'Estonia Kroon', NULL, 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(42, 'EGP', 'Egypt Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(43, 'ERN', 'Eritrea Nakfa', '&#x4E;&#x66;&#x6B;', 'Nfk', 'Nfk', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(44, 'ETB', 'Ethiopia Birr', '&#66;&#114;', 'Br', 'Br', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(45, 'EUR', 'Euro Member Countries', '€', '€', '€', '8364', '20ac', 0, 2, ',', ' ', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(46, 'FJD', 'Fiji Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(47, 'FKP', 'Falkland Islands (Malvinas) Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(48, 'GBP', 'United Kingdom Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(49, 'GEL', 'Georgia Lari', '&#4314;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(50, 'GGP', 'Guernsey Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(51, 'GHC', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', '162', 'a2', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(52, 'GHS', 'Ghana Cedi', '&#x47;&#x48;&#xA2;', 'GH¢', 'GH¢', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(53, 'GIP', 'Gibraltar Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(54, 'GMD', 'Gambia Dalasi', '&#68;', 'D', 'D', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(55, 'GNF', 'Guinea Franc', '&#70;&#71;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(56, 'GTQ', 'Guatemala Quetzal', '&#81;', 'Q', 'Q', '81', '51', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(57, 'GYD', 'Guyana Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(58, 'HKD', 'Hong Kong Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(59, 'HNL', 'Honduras Lempira', '&#76;', 'L', 'L', '76', '4c', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(60, 'HRK', 'Croatia Kuna', '&#107;&#110;', 'kn', 'kn', '107, ', '6b, 6', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(61, 'HTG', 'Haiti Gourde', '&#71;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(62, 'HUF', 'Hungary Forint', '&#70;&#116;', 'Ft', 'Ft', '70, 1', '46, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(63, 'IDR', 'Indonesia Rupiah', '&#82;&#112;', 'Rp', 'Rp', '82, 1', '52, 7', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(64, 'ILS', 'Israel Shekel', '&#8362;', '₪', '₪', '8362', '20aa', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(65, 'IMP', 'Isle of Man Pound', NULL, '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(66, 'INR', 'India Rupee', '&#8377;', '₨', '₨', '', '', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(67, 'IQD', 'Iraq Dinar', '&#1593;.&#1583;', 'د.ع;', 'د.ع;', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(68, 'IRR', 'Iran Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(69, 'ISK', 'Iceland Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(70, 'JEP', 'Jersey Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(71, 'JMD', 'Jamaica Dollar', '&#74;&#36;', 'J$', 'J$', '74, 3', '4a, 2', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(72, 'JOD', 'Jordan Dinar', '&#74;&#68;', NULL, NULL, NULL, NULL, 0, 3, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(73, 'JPY', 'Japan Yen', '&#165;', '¥', '¥', '165', 'a5', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(74, 'KES', 'Kenya Shilling', '&#x4B;&#x53;&#x68;', 'KSh', 'KSh', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(75, 'KGS', 'Kyrgyzstan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(76, 'KHR', 'Cambodia Riel', '&#6107;', '៛', '៛', '6107', '17db', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(77, 'KMF', 'Comoros Franc', '&#67;&#70;', 'Fr', 'Fr', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(78, 'KPW', 'Korea (North) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(79, 'KRW', 'Korea (South) Won', '&#8361;', '₩', '₩', '8361', '20a9', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(80, 'KWD', 'Kuwait Dinar', '&#1583;.&#1603;', 'د.ك', 'د.ك', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(81, 'KYD', 'Cayman Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(82, 'KZT', 'Kazakhstan Tenge', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(83, 'LAK', 'Laos Kip', '&#8365;', '₭', '₭', '8365', '20ad', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(84, 'LBP', 'Lebanon Pound', '&#163;', '£', '£', '163', 'a3', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(85, 'LKR', 'Sri Lanka Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(86, 'LRD', 'Liberia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(87, 'LSL', 'Lesotho Loti', '&#76;', 'M', 'M', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(88, 'LTL', 'Lithuania Litas', '&#76;&#116;', 'Lt', 'Lt', '76, 1', '4c, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(89, 'LVL', 'Latvia Lat', '&#76;&#115;', 'Ls', 'Ls', '76, 1', '4c, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(90, 'LYD', 'Libya Dinar', '&#1604;.&#1583;', 'DL', 'DL', NULL, NULL, 0, 3, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(91, 'MAD', 'Morocco Dirham', '&#1583;.&#1605;.', 'Dhs', 'Dhs', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(92, 'MDL', 'Moldova Leu', '&#76;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(93, 'MGA', 'Madagascar Ariary', '&#65;&#114;', 'Ar', 'Ar', NULL, NULL, 0, 5, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(94, 'MKD', 'Macedonia Denar', '&#1076;&#1077;&#1085;', 'ден', 'ден', '1076,', '434, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(95, 'MMK', 'Myanmar (Burma) Kyat', '&#75;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(96, 'MNT', 'Mongolia Tughrik', '&#8366;', '₮', '₮', '8366', '20ae', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(97, 'MOP', 'Macau Pataca', '&#77;&#79;&#80;&#36;', NULL, NULL, NULL, NULL, 0, 1, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(98, 'MRO', 'Mauritania Ouguiya', '&#85;&#77;', 'UM', 'UM', NULL, NULL, 0, 5, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(99, 'MUR', 'Mauritius Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(100, 'MVR', 'Maldives (Maldive Islands) Rufiyaa', '.&#1923;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(101, 'MWK', 'Malawi Kwacha', '&#77;&#75;', 'MK', 'MK', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(102, 'MXN', 'Mexico Peso', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(103, 'MYR', 'Malaysia Ringgit', '&#82;&#77;', 'RM', 'RM', '82, 7', '52, 4', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(104, 'MZN', 'Mozambique Metical', '&#77;&#84;', 'MT', 'MT', '77, 8', '4d, 5', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(105, 'NAD', 'Namibia Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(106, 'NGN', 'Nigeria Naira', '&#8358;', '₦', '₦', '8358', '20a6', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(107, 'NIO', 'Nicaragua Cordoba', '&#67;&#36;', 'C$', 'C$', '67, 3', '43, 2', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(108, 'NOK', 'Norway Krone', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(109, 'NPR', 'Nepal Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(110, 'NZD', 'New Zealand Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(111, 'OMR', 'Oman Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 3, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(112, 'PAB', 'Panama Balboa', '&#66;&#47;&#46;', 'B/.', 'B/.', '66, 4', '42, 2', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(113, 'PEN', 'Peru Nuevo Sol', '&#83;&#47;&#46;', 'S/.', 'S/.', '83, 4', '53, 2', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(114, 'PGK', 'Papua New Guinea Kina', '&#75;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(115, 'PHP', 'Philippines Peso', '&#8369;', '₱', '₱', '8369', '20b1', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(116, 'PKR', 'Pakistan Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(117, 'PLN', 'Poland Zloty', '&#122;&#322;', 'zł', 'zł', '122, ', '7a, 1', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(118, 'PYG', 'Paraguay Guarani', '&#71;&#115;', 'Gs', 'Gs', '71, 1', '47, 7', 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(119, 'QAR', 'Qatar Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(120, 'RON', 'Romania New Leu', '&#108;&#101;&#105;', 'lei', 'lei', '108, ', '6c, 6', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(121, 'RSD', 'Serbia Dinar', '&#1044;&#1080;&#1085;&#46;', 'Дин.', 'Дин.', '1044,', '414, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(122, 'RUB', 'Russia Ruble', '&#8381;', '₽', '₽', '8381,', '20BD', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(123, 'RWF', 'Rwanda Franc', '&#1585;.&#1587;', 'FRw', 'FRw', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(124, 'SAR', 'Saudi Arabia Riyal', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(125, 'SBD', 'Solomon Islands Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(126, 'SCR', 'Seychelles Rupee', '&#8360;', '₨', '₨', '8360', '20a8', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(127, 'SDG', 'Sudan Pound', '&#163;', 'DS', 'DS', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(128, 'SEK', 'Sweden Krona', '&#107;&#114;', 'kr', 'kr', '107, ', '6b, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(129, 'SGD', 'Singapore Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(130, 'SHP', 'Saint Helena Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(131, 'SLL', 'Sierra Leone Leone', '&#76;&#101;', 'Le', 'Le', NULL, NULL, 1, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(132, 'SOS', 'Somalia Shilling', '&#83;', 'S', 'S', '83', '53', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(133, 'SPL', 'Seborga Luigino', NULL, NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(134, 'SRD', 'Suriname Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(135, 'SSP', 'South Sudanese Pound', '&#xA3;', '£', '£', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(136, 'STD', 'São Tomé and Príncipe Dobra', '&#68;&#98;', 'Db', 'Db', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(137, 'SVC', 'El Salvador Colon', '&#36;', '$', '$', '36', '24', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(138, 'SYP', 'Syria Pound', '&#163;', '£', '£', '163', 'a3', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(139, 'SZL', 'Swaziland Lilangeni', '&#76;', 'E', 'E', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(140, 'THB', 'Thailand Baht', '&#3647;', '฿', '฿', '3647', 'e3f', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(141, 'TJS', 'Tajikistan Somoni', '&#84;&#74;&#83;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(142, 'TMT', 'Turkmenistan Manat', '&#109;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(143, 'TND', 'Tunisia Dinar', '&#1583;.&#1578;', 'DT', 'DT', NULL, NULL, 1, 3, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(144, 'TOP', 'Tonga Pa\'anga', '&#84;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(145, 'TRL', 'Turkey Lira', NULL, '₤', '₤', '8356', '20a4', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(146, 'TRY', 'Turkey Lira', '&#x20BA;', '₺', '₺', '', '', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(147, 'TTD', 'Trinidad and Tobago Dollar', '&#36;', 'TT$', 'TT$', '84, 8', '54, 5', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(148, 'TVD', 'Tuvalu Dollar', NULL, '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(149, 'TWD', 'Taiwan New Dollar', '&#78;&#84;&#36;', 'NT$', 'NT$', '78, 8', '4e, 5', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(150, 'TZS', 'Tanzania Shilling', '&#x54;&#x53;&#x68;', 'TSh', 'TSh', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(151, 'UAH', 'Ukraine Hryvnia', '&#8372;', '₴', '₴', '8372', '20b4', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(152, 'UGX', 'Uganda Shilling', '&#85;&#83;&#104;', 'USh', 'USh', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(153, 'USD', 'United States Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(154, 'UYU', 'Uruguay Peso', '&#36;&#85;', '$U', '$U', '36, 8', '24, 5', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(155, 'UZS', 'Uzbekistan Som', '&#1083;&#1074;', 'лв', 'лв', '1083,', '43b, ', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(156, 'VEF', 'Venezuela Bolivar', '&#66;&#115;', 'Bs', 'Bs', '66, 1', '42, 7', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(157, 'VND', 'Viet Nam Dong', '&#8363;', '₫', '₫', '8363', '20ab', 1, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(158, 'VUV', 'Vanuatu Vatu', '&#86;&#84;', NULL, NULL, NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(159, 'WST', 'Samoa Tala', '&#87;&#83;&#36;', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(160, 'XAF', 'Communauté Financière Africaine (BEAC) CFA Franc B', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(161, 'XCD', 'East Caribbean Dollar', '&#36;', '$', '$', '36', '24', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(162, 'XDR', 'International Monetary Fund (IMF) Special Drawing ', '', NULL, NULL, NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(163, 'XOF', 'Communauté Financière Africaine (BCEAO) Franc', '&#70;&#67;&#70;&#65;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(164, 'XPF', 'Comptoirs Français du Pacifique (CFP) Franc', '&#70;', 'F', 'F', NULL, NULL, 0, 0, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(165, 'YER', 'Yemen Rial', '&#65020;', '﷼', '﷼', '65020', 'fdfc', 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(166, 'ZAR', 'South Africa Rand', '&#82;', 'R', 'R', '82', '52', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(167, 'ZMW', 'Zambia Kwacha', NULL, 'ZK', 'ZK', NULL, NULL, 0, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(168, 'ZWD', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(169, 'ZWL', 'Zimbabwe Dollar', NULL, 'Z$', 'Z$', '90, 3', '5a, 2', 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16'),
(170, 'XBT', 'Bitcoin', '฿', '฿', '฿', NULL, NULL, 1, 2, '.', ',', '2021-01-07 11:37:16', '2021-01-07 11:37:16');

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int UNSIGNED NOT NULL,
  `belongs_to` enum('posts','users') COLLATE utf8_unicode_ci NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `max` int UNSIGNED DEFAULT '255',
  `default` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint UNSIGNED DEFAULT NULL,
  `use_as_filter` tinyint(1) DEFAULT '0',
  `help` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`id`, `belongs_to`, `translation_lang`, `translation_of`, `name`, `type`, `max`, `default`, `required`, `use_as_filter`, `help`, `active`) VALUES
(1, 'posts', 'en', 1, 'Car Brand', 'select', NULL, NULL, 1, 1, NULL, 1),
(2, 'posts', 'en', 2, 'Car Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(3, 'posts', 'en', 3, 'Year of registration', 'number', NULL, NULL, 0, 0, NULL, 1),
(4, 'posts', 'en', 4, 'Mileage', 'text', NULL, NULL, 0, 0, NULL, 1),
(5, 'posts', 'en', 5, 'Fuel Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(6, 'posts', 'en', 6, 'Features', 'checkbox_multiple', NULL, NULL, 0, 1, NULL, 1),
(7, 'posts', 'en', 7, 'Transmission', 'radio', NULL, NULL, 0, 1, NULL, 1),
(8, 'posts', 'en', 8, 'Condition', 'select', NULL, NULL, 0, 1, NULL, 1),
(9, 'posts', 'en', 9, 'Size', 'number', 50, NULL, 1, 1, NULL, 1),
(10, 'posts', 'en', 10, 'Rooms', 'select', NULL, NULL, 1, 1, NULL, 1),
(11, 'posts', 'en', 11, 'Building Type', 'select', NULL, NULL, 0, 1, NULL, 1),
(12, 'posts', 'en', 12, 'Parking', 'checkbox', NULL, NULL, 0, 1, NULL, 1),
(13, 'posts', 'en', 13, 'Furnished', 'radio', NULL, NULL, 0, 1, NULL, 1),
(14, 'posts', 'en', 14, 'Mobile Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(15, 'posts', 'en', 15, 'Mobile Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(16, 'posts', 'en', 16, 'Electronic Brand', 'select', NULL, NULL, 0, 1, NULL, 1),
(17, 'posts', 'en', 17, 'Model', 'text', NULL, NULL, 0, 0, NULL, 1),
(18, 'posts', 'en', 18, 'Start Date', 'date', 50, NULL, 0, 1, NULL, 1),
(19, 'posts', 'en', 19, 'Company', 'text', 100, NULL, 1, 0, NULL, 1),
(20, 'posts', 'en', 20, 'Work Type', 'select', NULL, NULL, 1, 1, NULL, 1),
(21, 'posts', 'en', 21, 'Start date', 'date', 50, NULL, 1, 1, NULL, 1),
(22, 'posts', 'en', 22, 'End date', 'date', 50, NULL, 1, 1, NULL, 1),
(23, 'posts', 'en', 23, 'Event Address', 'text', 200, NULL, 1, 0, NULL, 1),
(24, 'posts', 'en', 24, 'Website', 'url', 100, NULL, 0, 0, NULL, 1),
(25, 'posts', 'en', 25, 'Video', 'video', 100, NULL, 0, 0, NULL, 1),
(26, 'posts', 'en', 26, 'Date Range', 'date_range', 100, NULL, 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `fields_options`
--

CREATE TABLE `fields_options` (
  `id` int UNSIGNED NOT NULL,
  `field_id` int UNSIGNED DEFAULT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fields_options`
--

INSERT INTO `fields_options` (`id`, `field_id`, `translation_lang`, `translation_of`, `value`, `parent_id`, `lft`, `rgt`, `depth`) VALUES
(1, 1, 'en', 1, 'Toyota', NULL, 1, 2, NULL),
(2, 1, 'en', 2, 'BMW', NULL, 3, 4, NULL),
(3, 1, 'en', 3, 'Mercedes', NULL, 5, 6, NULL),
(4, 1, 'en', 4, 'Chevrolet', NULL, 7, 8, NULL),
(5, 1, 'en', 5, 'Cadillac', NULL, 9, 10, NULL),
(6, 1, 'en', 6, 'Buick', NULL, 11, 12, NULL),
(7, 1, 'en', 7, 'GMC', NULL, 13, 14, NULL),
(8, 1, 'en', 8, 'Ford', NULL, 15, 16, NULL),
(9, 1, 'en', 9, 'Chrysler', NULL, 17, 18, NULL),
(10, 1, 'en', 10, 'Dodge', NULL, 19, 20, NULL),
(11, 1, 'en', 11, 'Jeep', NULL, 21, 22, NULL),
(12, 1, 'en', 12, 'Tesla', NULL, 23, 24, NULL),
(13, 1, 'en', 13, 'Lexus', NULL, 25, 26, NULL),
(14, 1, 'en', 14, 'Suzuki', NULL, 27, 28, NULL),
(15, 1, 'en', 15, 'Mazda', NULL, 29, 30, NULL),
(16, 1, 'en', 16, 'Honda', NULL, 31, 32, NULL),
(17, 1, 'en', 17, 'Acura', NULL, 33, 34, NULL),
(18, 1, 'en', 18, 'Mitsubishi', NULL, 35, 36, NULL),
(19, 1, 'en', 19, 'Nissan', NULL, 37, 38, NULL),
(20, 1, 'en', 20, 'Infiniti', NULL, 39, 40, NULL),
(21, 1, 'en', 21, 'Audi', NULL, 41, 42, NULL),
(22, 1, 'en', 22, 'Volkswagen', NULL, 43, 44, NULL),
(23, 1, 'en', 23, 'Porsche', NULL, 45, 46, NULL),
(24, 1, 'en', 24, 'Opel', NULL, 47, 48, NULL),
(25, 1, 'en', 25, 'Jaguar', NULL, 49, 50, NULL),
(26, 1, 'en', 26, 'Land Rover', NULL, 51, 52, NULL),
(27, 1, 'en', 27, 'Mini', NULL, 53, 54, NULL),
(28, 1, 'en', 28, 'Aston Martin', NULL, 55, 56, NULL),
(29, 1, 'en', 29, 'Bentley', NULL, 57, 58, NULL),
(30, 1, 'en', 30, 'Rolls Royce', NULL, 59, 60, NULL),
(31, 1, 'en', 31, 'McLaren', NULL, 61, 62, NULL),
(32, 1, 'en', 32, 'Fiat', NULL, 63, 64, NULL),
(33, 1, 'en', 33, 'Alfa Romeo', NULL, 65, 66, NULL),
(34, 1, 'en', 34, 'Maserati', NULL, 67, 68, NULL),
(35, 1, 'en', 35, 'Ferrari', NULL, 69, 70, NULL),
(36, 1, 'en', 36, 'Lamborghini', NULL, 71, 72, NULL),
(37, 1, 'en', 37, 'Pagani', NULL, 73, 74, NULL),
(38, 1, 'en', 38, 'Lancia', NULL, 75, 76, NULL),
(39, 1, 'en', 39, 'Renault', NULL, 77, 78, NULL),
(40, 1, 'en', 40, 'Peugeot', NULL, 79, 80, NULL),
(41, 1, 'en', 41, 'Citroen', NULL, 81, 82, NULL),
(42, 1, 'en', 42, 'Bugatti', NULL, 83, 84, NULL),
(43, 1, 'en', 43, 'Tata', NULL, 85, 86, NULL),
(44, 1, 'en', 44, 'Hyundai', NULL, 87, 88, NULL),
(45, 1, 'en', 45, 'Kia', NULL, 89, 90, NULL),
(46, 1, 'en', 46, 'Daewoo', NULL, 91, 92, NULL),
(47, 1, 'en', 47, 'Volvo', NULL, 93, 94, NULL),
(48, 1, 'en', 48, 'Saab', NULL, 95, 96, NULL),
(49, 1, 'en', 49, 'Lada', NULL, 97, 98, NULL),
(50, 1, 'en', 50, 'Volga', NULL, 99, 100, NULL),
(51, 1, 'en', 51, 'Zil', NULL, 101, 102, NULL),
(52, 1, 'en', 52, 'GAZ', NULL, 103, 104, NULL),
(53, 1, 'en', 53, 'Geely', NULL, 105, 106, NULL),
(54, 1, 'en', 54, 'Chery', NULL, 107, 108, NULL),
(55, 1, 'en', 55, 'Hongqi', NULL, 109, 110, NULL),
(56, 1, 'en', 56, 'Other', NULL, 111, 112, NULL),
(57, 5, 'en', 57, 'Essence', NULL, 113, 114, NULL),
(58, 5, 'en', 58, 'Diesel', NULL, 115, 116, NULL),
(59, 6, 'en', 59, 'Air Conditioner', NULL, 117, 118, NULL),
(60, 6, 'en', 60, 'GPS', NULL, 119, 120, NULL),
(61, 6, 'en', 61, 'Security System', NULL, 121, 122, NULL),
(62, 6, 'en', 62, 'Spare Tire', NULL, 123, 124, NULL),
(63, 7, 'en', 63, 'Automatic', NULL, 125, 126, NULL),
(64, 7, 'en', 64, 'Manual', NULL, 127, 128, NULL),
(65, 8, 'en', 65, 'New', NULL, 129, 130, NULL),
(66, 8, 'en', 66, 'Used', NULL, 131, 132, NULL),
(67, 10, 'en', 67, '0', NULL, 133, 134, 1),
(68, 10, 'en', 68, '1', NULL, 135, 136, 1),
(69, 10, 'en', 69, '2', NULL, 137, 138, 1),
(70, 10, 'en', 70, '3', NULL, 139, 140, 1),
(71, 10, 'en', 71, '4', NULL, 141, 142, 1),
(72, 10, 'en', 72, '5', NULL, 143, 144, 1),
(73, 10, 'en', 73, '6', NULL, 145, 146, 1),
(74, 10, 'en', 74, '7', NULL, 147, 148, 1),
(75, 10, 'en', 75, '8', NULL, 149, 150, 1),
(76, 10, 'en', 76, '9', NULL, 151, 152, 1),
(77, 10, 'en', 77, '10', NULL, 153, 154, 1),
(78, 10, 'en', 78, '> 10', NULL, 155, 156, 1),
(79, 11, 'en', 79, 'Apartment', NULL, 157, 158, NULL),
(80, 11, 'en', 80, 'House', NULL, 159, 160, NULL),
(81, 11, 'en', 81, 'Office', NULL, 161, 162, NULL),
(82, 11, 'en', 82, 'Store', NULL, 163, 164, NULL),
(83, 11, 'en', 83, 'Plot of land', NULL, 165, 166, NULL),
(84, 13, 'en', 84, 'Yes', NULL, 167, 168, NULL),
(85, 13, 'en', 85, 'No', NULL, 169, 170, NULL),
(86, 14, 'en', 86, 'Huawei', NULL, 171, 172, NULL),
(87, 14, 'en', 87, 'Sony', NULL, 173, 174, NULL),
(88, 14, 'en', 88, 'LG', NULL, 175, 176, NULL),
(89, 14, 'en', 89, 'Samsung', NULL, 177, 178, NULL),
(90, 14, 'en', 90, 'Nokia', NULL, 179, 180, NULL),
(91, 14, 'en', 91, 'Alcatel-Lucent', NULL, 181, 182, NULL),
(92, 14, 'en', 92, 'Siemens', NULL, 183, 184, NULL),
(93, 14, 'en', 93, 'BlackBerry', NULL, 185, 186, NULL),
(94, 14, 'en', 94, 'Apple', NULL, 187, 188, NULL),
(95, 14, 'en', 95, 'Google', NULL, 189, 190, NULL),
(96, 14, 'en', 96, 'Microsoft', NULL, 191, 192, NULL),
(97, 14, 'en', 97, 'Motorola', NULL, 193, 194, NULL),
(98, 14, 'en', 98, 'Other', NULL, 195, 196, NULL),
(99, 16, 'en', 99, 'Huawei', NULL, 197, 198, NULL),
(100, 16, 'en', 100, 'Lenovo', NULL, 199, 200, NULL),
(101, 16, 'en', 101, 'TP-Link', NULL, 201, 202, NULL),
(102, 16, 'en', 102, 'Xiaomi', NULL, 203, 204, NULL),
(103, 16, 'en', 103, 'Canon', NULL, 205, 206, NULL),
(104, 16, 'en', 104, 'Casio', NULL, 207, 208, NULL),
(105, 16, 'en', 105, 'Epson', NULL, 209, 210, NULL),
(106, 16, 'en', 106, 'Fuji', NULL, 211, 212, NULL),
(107, 16, 'en', 107, 'Funai', NULL, 213, 214, NULL),
(108, 16, 'en', 108, 'JVC', NULL, 215, 216, NULL),
(109, 16, 'en', 109, 'Nikon', NULL, 217, 218, NULL),
(110, 16, 'en', 110, 'Nintendo', NULL, 219, 220, NULL),
(111, 16, 'en', 111, 'Olympus', NULL, 221, 222, NULL),
(112, 16, 'en', 112, 'Panasonic', NULL, 223, 224, NULL),
(113, 16, 'en', 113, 'Pentax', NULL, 225, 226, NULL),
(114, 16, 'en', 114, 'Pioneer', NULL, 227, 228, NULL),
(115, 16, 'en', 115, 'Sega', NULL, 229, 230, NULL),
(116, 16, 'en', 116, 'Sharp', NULL, 231, 232, NULL),
(117, 16, 'en', 117, 'Sony', NULL, 233, 234, NULL),
(118, 16, 'en', 118, 'Toshiba', NULL, 235, 236, NULL),
(119, 16, 'en', 119, 'Daewoo', NULL, 237, 238, NULL),
(120, 16, 'en', 120, 'LG', NULL, 239, 240, NULL),
(121, 16, 'en', 121, 'Samsung', NULL, 241, 242, NULL),
(122, 16, 'en', 122, 'Acer', NULL, 243, 244, NULL),
(123, 16, 'en', 123, 'Asus', NULL, 245, 246, NULL),
(124, 16, 'en', 124, 'D-Link', NULL, 247, 248, NULL),
(125, 16, 'en', 125, 'Gigabyte', NULL, 249, 250, NULL),
(126, 16, 'en', 126, 'Beko', NULL, 251, 252, NULL),
(127, 16, 'en', 127, 'Nokia', NULL, 253, 254, NULL),
(128, 16, 'en', 128, 'Alcatel-Lucent', NULL, 255, 256, NULL),
(129, 16, 'en', 129, 'Bosch', NULL, 257, 258, NULL),
(130, 16, 'en', 130, 'Siemens', NULL, 259, 260, NULL),
(131, 16, 'en', 131, 'Sennheiser', NULL, 261, 262, NULL),
(132, 16, 'en', 132, 'Telefunken', NULL, 263, 264, NULL),
(133, 16, 'en', 133, 'Philips', NULL, 265, 266, NULL),
(134, 16, 'en', 134, 'Electrolux', NULL, 267, 268, NULL),
(135, 16, 'en', 135, 'Russell Hobbs', NULL, 269, 270, NULL),
(136, 16, 'en', 136, 'BlackBerry', NULL, 271, 272, NULL),
(137, 16, 'en', 137, 'Thomson', NULL, 273, 274, NULL),
(138, 16, 'en', 138, 'Amazon', NULL, 275, 276, NULL),
(139, 16, 'en', 139, 'Apple', NULL, 277, 278, NULL),
(140, 16, 'en', 140, 'Bose', NULL, 279, 280, NULL),
(141, 16, 'en', 141, 'Cisco Systems', NULL, 281, 282, NULL),
(142, 16, 'en', 142, 'Dell', NULL, 283, 284, NULL),
(143, 16, 'en', 143, 'Gateway', NULL, 285, 286, NULL),
(144, 16, 'en', 144, 'Google', NULL, 287, 288, NULL),
(145, 16, 'en', 145, 'Hewlett-Packard', NULL, 289, 290, NULL),
(146, 16, 'en', 146, 'IBM', NULL, 291, 292, NULL),
(147, 16, 'en', 147, 'Intel', NULL, 293, 294, NULL),
(148, 16, 'en', 148, 'Microsoft', NULL, 295, 296, NULL),
(149, 16, 'en', 149, 'Motorola', NULL, 297, 298, NULL),
(150, 16, 'en', 150, 'NVIDIA', NULL, 299, 300, NULL),
(151, 16, 'en', 151, 'Packard Bell', NULL, 301, 302, NULL),
(152, 16, 'en', 152, 'Qualcomm', NULL, 303, 304, NULL),
(153, 16, 'en', 153, 'Seagate', NULL, 305, 306, NULL),
(154, 16, 'en', 154, 'Sun Microsystems', NULL, 307, 308, NULL),
(155, 16, 'en', 155, 'Vizio', NULL, 309, 310, NULL),
(156, 16, 'en', 156, 'Western Digital', NULL, 311, 312, NULL),
(157, 16, 'en', 157, 'Xerox', NULL, 313, 314, NULL),
(158, 16, 'en', 158, 'Other', NULL, 315, 316, NULL),
(159, 20, 'en', 159, 'Full-time', NULL, 317, 318, NULL),
(160, 20, 'en', 160, 'Part-time', NULL, 319, 320, NULL),
(161, 20, 'en', 161, 'Temporary', NULL, 321, 322, NULL),
(162, 20, 'en', 162, 'Internship', NULL, 323, 324, NULL),
(163, 20, 'en', 163, 'Permanent', NULL, 325, 326, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Mr'),
(2, 'en', 2, 'Mrs');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int UNSIGNED NOT NULL,
  `method` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `view` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `field` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `active` tinyint UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `method`, `name`, `value`, `view`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'getSearchForm', 'Search Form Area', NULL, 'home.inc.search', NULL, NULL, 0, 1, 1, 1),
(2, 'getLocations', 'Locations & Country Map', NULL, 'home.inc.locations', NULL, NULL, 2, 3, 1, 1),
(3, 'getSponsoredPosts', 'Sponsored Ads', NULL, 'home.inc.featured', NULL, NULL, 4, 5, 1, 1),
(4, 'getCategories', 'Categories', NULL, 'home.inc.categories', NULL, NULL, 6, 7, 1, 1),
(5, 'getLatestPosts', 'Latest Ads', NULL, 'home.inc.latest', NULL, NULL, 8, 9, 1, 1),
(6, 'getStats', 'Mini Stats', NULL, 'home.inc.stats', NULL, NULL, 10, 11, 1, 1),
(7, 'getTopAdvertising', 'Advertising #1', NULL, 'layouts.inc.advertising.top', NULL, NULL, 12, 13, 1, 0),
(8, 'getBottomAdvertising', 'Advertising #2', NULL, 'layouts.inc.advertising.bottom', NULL, NULL, 14, 15, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int UNSIGNED NOT NULL,
  `abbr` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `native` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flag` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `app_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `script` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8_unicode_ci DEFAULT 'ltr',
  `russian_pluralization` tinyint UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `default` tinyint(1) DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `abbr`, `locale`, `name`, `native`, `flag`, `app_name`, `script`, `direction`, `russian_pluralization`, `active`, `default`, `parent_id`, `lft`, `rgt`, `depth`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'en', 'en_US', 'English', 'English', NULL, 'english', 'Latn', 'ltr', 0, 1, 1, NULL, 2, 3, 1, NULL, '2021-01-07 11:37:15', '2021-01-07 11:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `from_user_id` bigint UNSIGNED DEFAULT NULL,
  `from_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_user_id` bigint UNSIGNED DEFAULT NULL,
  `to_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` mediumtext COLLATE utf8_unicode_ci,
  `message` mediumtext COLLATE utf8_unicode_ci,
  `filename` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint UNSIGNED DEFAULT '0',
  `deleted_by` int UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `page` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `translation_lang`, `translation_of`, `page`, `title`, `description`, `keywords`, `active`) VALUES
(1, 'en', 1, 'home', '{app_name} - Geo Classified Ads CMS', 'Sell and Buy products and services on {app_name} in Minutes {country}. Free ads in {country}. Looking for a product or service - {country}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(2, 'en', 2, 'register', 'Sign Up - {app_name}', 'Sign Up on {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(3, 'en', 3, 'login', 'Login - {app_name}', 'Log in to {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(4, 'en', 4, 'create', 'Post Free Ads', 'Post Free Ads - {country}.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(5, 'en', 5, 'countries', 'Free Local Classified Ads in the World', 'Welcome to {app_name} : 100% Free Ads Classified. Sell and buy near you. Simple, fast and efficient.', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(6, 'en', 6, 'contact', 'Contact Us - {app_name}', 'Contact Us - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(7, 'en', 7, 'sitemap', 'Sitemap {app_name} - {country}', 'Sitemap {app_name} - {country}. 100% Free Ads Classified', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(8, 'en', 8, 'password', 'Lost your password? - {app_name}', 'Lost your password? - {app_name}', '{app_name}, {country}, free ads, classified, ads, script, app, premium ads', 1),
(9, 'en', 9, 'pricing', 'Pricing - {app_name}', 'Pricing - {app_name}', '{app_name}, {country}, pricing, free ads, classified, ads, script, app, premium ads', 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_10_12_160714_create_languages_table', 1),
(2, '2020_10_12_160715_create_advertising_table', 1),
(3, '2020_10_12_160715_create_blacklist_table', 1),
(4, '2020_10_12_160715_create_cache_table', 1),
(5, '2020_10_12_160715_create_categories_table', 1),
(6, '2020_10_12_160715_create_continents_table', 1),
(7, '2020_10_12_160715_create_currencies_table', 1),
(8, '2020_10_12_160715_create_fields_table', 1),
(9, '2020_10_12_160715_create_gender_table', 1),
(10, '2020_10_12_160715_create_home_sections_table', 1),
(11, '2020_10_12_160715_create_meta_tags_table', 1),
(12, '2020_10_12_160715_create_packages_table', 1),
(13, '2020_10_12_160715_create_pages_table', 1),
(14, '2020_10_12_160715_create_password_resets_table', 1),
(15, '2020_10_12_160715_create_payment_methods_table', 1),
(16, '2020_10_12_160715_create_permission_tables', 1),
(17, '2020_10_12_160715_create_post_types_table', 1),
(18, '2020_10_12_160715_create_report_types_table', 1),
(19, '2020_10_12_160715_create_sessions_table', 1),
(20, '2020_10_12_160715_create_settings_table', 1),
(21, '2020_10_12_160715_create_user_types_table', 1),
(22, '2020_10_12_160716_create_category_field_table', 1),
(23, '2020_10_12_160716_create_countries_table', 1),
(24, '2020_10_12_160716_create_fields_options_table', 1),
(25, '2020_10_12_160716_create_subadmin1_table', 1),
(26, '2020_10_12_160716_create_subadmin2_table', 1),
(27, '2020_10_12_160716_create_time_zones_table', 1),
(28, '2020_10_12_160716_create_users_table', 1),
(29, '2020_10_12_160717_create_cities_table', 1),
(30, '2020_10_12_160717_create_posts_table', 1),
(31, '2020_10_12_160717_create_saved_posts_table', 1),
(32, '2020_10_12_160717_create_saved_search_table', 1),
(33, '2020_10_12_160718_create_messages_table', 1),
(34, '2020_10_12_160718_create_payments_table', 1),
(35, '2020_10_12_160718_create_pictures_table', 1),
(36, '2020_10_12_160718_create_post_values_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `short_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'In country language',
  `ribbon` enum('red','orange','green') COLLATE utf8_unicode_ci DEFAULT NULL,
  `has_badge` tinyint UNSIGNED DEFAULT '0',
  `price` decimal(10,2) UNSIGNED DEFAULT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `promo_duration` int DEFAULT '30' COMMENT 'In days',
  `duration` int UNSIGNED DEFAULT '30' COMMENT 'In days',
  `pictures_limit` int DEFAULT '5',
  `description` text COLLATE utf8_unicode_ci COMMENT 'In country language',
  `facebook_ads_duration` int UNSIGNED DEFAULT '0',
  `google_ads_duration` int UNSIGNED DEFAULT '0',
  `twitter_ads_duration` int UNSIGNED DEFAULT '0',
  `linkedin_ads_duration` int UNSIGNED DEFAULT '0',
  `recommended` tinyint(1) DEFAULT '0',
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `active` tinyint UNSIGNED DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `translation_lang`, `translation_of`, `name`, `short_name`, `ribbon`, `has_badge`, `price`, `currency_code`, `promo_duration`, `duration`, `pictures_limit`, `description`, `facebook_ads_duration`, `google_ads_duration`, `twitter_ads_duration`, `linkedin_ads_duration`, `recommended`, `parent_id`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Regular List', 'Free', 'red', 1, '0.00', 'USD', NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, NULL, 2, 3, 0, 1),
(2, 'en', 2, 'Top page Ad', 'Premium', 'orange', 1, '7.50', 'USD', 7, 60, 10, 'Featured on the homepage\nFeatured in the category', 0, 0, 0, 0, 1, NULL, 4, 5, 0, 1),
(3, 'en', 3, 'Top page Ad+', 'Premium+', 'green', 1, '9.00', 'USD', 30, 120, 15, 'Featured on the homepage\nFeatured in the category', 0, 0, 0, 0, 0, NULL, 6, 7, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `type` enum('standard','terms','privacy','tips') COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `external_link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `name_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_blank` tinyint UNSIGNED DEFAULT '0',
  `excluded_from_footer` tinyint UNSIGNED DEFAULT '0',
  `active` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `translation_lang`, `translation_of`, `parent_id`, `type`, `name`, `slug`, `title`, `picture`, `content`, `external_link`, `lft`, `rgt`, `depth`, `name_color`, `title_color`, `target_blank`, `excluded_from_footer`, `active`, `created_at`, `updated_at`) VALUES
(1, 'en', 1, NULL, 'terms', 'Terms', 'terms', 'Terms & Conditions', NULL, '<h4><b>Definitions</b></h4><p>Each of the terms mentioned below have in these Conditions of Sale LaraClassified Service (hereinafter the \"Conditions\") the following meanings:</p><ol><li>Announcement&nbsp;: refers to all the elements and data (visual, textual, sound, photographs, drawings), presented by an Advertiser editorial under his sole responsibility, in order to buy, rent or sell a product or service and broadcast on the Website and Mobile Site.</li><li>Advertiser&nbsp;: means any natural or legal person, a major, established in France, holds an account and having submitted an announcement, from it, on the Website. Any Advertiser must be connected to the Personal Account for deposit and or manage its ads. Ad first deposit automatically entails the establishment of a Personal Account to the Advertiser.</li><li>Personal Account&nbsp;: refers to the free space than any Advertiser must create and which it should connect from the Website to disseminate, manage and view its ads.</li><li>LaraClassified&nbsp;: means the company that publishes and operates the Website and Mobile Site {YourCompany}, registered at the Trade and Companies Register of {YourCity} under the number {YourCompany Registration Number} whose registered office is at {YourCompany Address}.</li><li>Customer Service&nbsp;: LaraClassified means the department to which the Advertiser may obtain further information. This service can be contacted via email by clicking the link on the Website and Mobile Site.</li><li>LaraClassified Service&nbsp;: LaraClassified means the services made available to Users and Advertisers on the Website and Mobile Site.</li><li>Website&nbsp;: means the website operated by LaraClassified accessed mainly from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access the Service via internet LaraClassified.</li><li>Mobile Site&nbsp;: is the mobile site operated by LaraClassified accessible from the URL <a href=\"https://bedigit.com\">https://bedigit.com</a> and allowing Users and Advertisers to access via their mobile phone service {YourSiteName}.</li><li>User&nbsp;: any visitor with access to LaraClassified Service via the Website and Mobile Site and Consultant Service LaraClassified accessible from different media.</li></ol><h4><b>Subject</b></h4><p>These Terms and Conditions Of Use establish the contractual conditions applicable to any subscription by an Advertiser connected to its Personal Account from the Website and Mobile Site.<br></p><h4><b>Acceptance</b></h4><p>Any use of the website by an Advertiser is full acceptance of the current Terms.<br></p><h4><b>Responsibility</b></h4><p>Responsibility for LaraClassified can not be held liable for non-performance or improper performance of due control, either because of the Advertiser, or a case of major force.<br></p><h4><b>Modification of these terms</b></h4><p>LaraClassified reserves the right, at any time, to modify all or part of the Terms and Conditions.</p><p>Advertisers are advised to consult the Terms to be aware of the changes.</p><h4><b>Miscellaneous</b></h4><p>If part of the Terms should be illegal, invalid or unenforceable for any reason whatsoever, the provisions in question would be deemed unwritten, without questioning the validity of the remaining provisions will continue to apply between Advertisers and LaraClassified.</p><p>Any complaints should be addressed to Customer Service LaraClassified.</p>', NULL, 6, 7, 1, NULL, NULL, 0, 0, 1, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(2, 'en', 2, NULL, 'privacy', 'Privacy', 'privacy', 'Privacy', NULL, '<p>Your privacy is an important part of our relationship with you. Protecting your privacy is only part of our mission to provide a secure web environment. When using our site, including our services, your information will remain strictly confidential. Contributions made on our blog or on our forum are open to public view; so please do not post any personal information in your dealings with others. We accept no liability for those actions because it is your sole responsibility to adequate and safe post content on our site. We will not share, rent or share your information with third parties.</p><p>When you visit our site, we collect technical information about your computer and how you access our website and analyze this information such as Internet Protocol (IP) address of your computer, the operating system used by your computer, the browser (eg, Chrome, Firefox, Internet Explorer or other) your computer uses, the name of your Internet service provider (ISP), the Uniform Resource Locator (URL) of the website from which you come and the URL to which you go next and certain operating metrics such as the number of times you use our website. This general information can be used to help us better understand how our site is viewed and used. We may share this general information about our site with our business partners or the general public. For example, we may share the information on the number of daily unique visitors to our site with potential corporate partners or use them for advertising purposes. This information does contain any of your personal data that can be used to contact you or identify you.</p><p>When we place links or banners to other sites of our website, please note that we do not control this kind of content or practices or privacy policies of those sites. We do not endorse or assume no responsibility for the privacy policies or information collection practices of any other website other than managed sites LaraClassified.</p><p>We use the highest security standard available to protect your identifiable information in transit to us. All data stored on our servers are protected by a secure firewall for the unauthorized use or activity can not take place. Although we make every effort to protect your personal information against loss, misuse or alteration by third parties, you should be aware that there is always a risk that low-intentioned manage to find a way to thwart our security system or that Internet transmissions could be intercepted.</p><p>We reserve the right, without notice, to change, modify, add or remove portions of our Privacy Policy at any time and from time to time. These changes will be posted publicly on our website. When you visit our website, you accept all the terms of our privacy policy. Your continued use of this website constitutes your continued agreement to these terms. If you do not agree with the terms of our privacy policy, you should cease using our website.</p>', NULL, 8, 9, 1, NULL, NULL, 0, 0, 1, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(3, 'en', 3, NULL, 'standard', 'Anti-Scam', 'anti-scam', 'Anti-Scam', NULL, '<p><b>Protect yourself against Internet fraud!</b></p><p>The vast majority of ads are posted by honest people and trust. So you can do excellent business. Despite this, it is important to follow a few common sense rules following to prevent any attempt to scam.</p><p><b>Our advices</b></p><ul><li>Doing business with people you can meet in person.</li><li>Never send money by Western Union, MoneyGram or other anonymous payment systems.</li><li>Never send money or products abroad.</li><li>Do not accept checks.</li><li>Ask about the person you\'re dealing with another confirming source name, address and telephone number.</li><li>Keep copies of all correspondence (emails, ads, letters, etc.) and details of the person.</li><li>If a deal seems too good to be true, there is every chance that this is the case. Refrain.</li></ul><p><b>Recognize attempted scam</b></p><ul><li>The majority of scams have one or more of these characteristics:</li><li>The person is abroad or traveling abroad.</li><li>The person refuses to meet you in person.</li><li>Payment is made through Western Union, Money Gram or check.</li><li>The messages are in broken language (English or French or ...).</li><li>The texts seem to be copied and pasted.</li><li>The deal seems to be too good to be true.</li></ul>', NULL, 4, 5, 1, NULL, NULL, 0, 0, 1, '2021-01-07 11:37:18', '2021-01-07 11:37:18'),
(4, 'en', 4, NULL, 'standard', 'FAQ', 'faq', 'Frequently Asked Questions', NULL, '<p><b>How do I place an ad?</b></p><p>It\'s very easy to place an ad: click on the button \"Post free Ads\" above right.</p><p><b>What does it cost to advertise?</b></p><p>The publication is 100% free throughout the website.</p><p><b>If I post an ad, will I also get more spam e-mails?</b></p><p>Absolutely not because your email address is not visible on the website.</p><p><b>How long will my ad remain on the website?</b></p><p>In general, an ad is automatically deactivated from the website after 3 months. You will receive an email a week before D-Day and another on the day of deactivation. You have the ability to put them online in the following month by logging into your account on the site. After this delay, your ad will be automatically removed permanently from the website.</p><p><b>I sold my item. How do I delete my ad?</b></p><p>Once your product is sold or leased, log in to your account to remove your ad.</p>', NULL, 2, 3, 1, NULL, NULL, 0, 0, 1, '2021-01-07 11:37:18', '2021-01-07 11:37:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `package_id` int UNSIGNED DEFAULT NULL,
  `payment_method_id` int UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Transaction''s ID at the Provider',
  `amount` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `active` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `has_ccbox` tinyint UNSIGNED DEFAULT '0',
  `is_compatible_api` tinyint(1) DEFAULT '0',
  `countries` mediumtext COLLATE utf8_unicode_ci COMMENT 'Countries codes separated by comma.',
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `parent_id` int UNSIGNED DEFAULT '0',
  `active` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `display_name`, `description`, `has_ccbox`, `is_compatible_api`, `countries`, `lft`, `rgt`, `depth`, `parent_id`, `active`) VALUES
(1, 'paypal', 'Paypal', 'Payment with Paypal', 0, 0, '', 0, 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'permission-list', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(2, 'permission-create', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(3, 'permission-update', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(4, 'permission-delete', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(5, 'role-list', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(6, 'role-create', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(7, 'role-update', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(8, 'role-delete', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20'),
(9, 'dashboard-access', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int UNSIGNED NOT NULL DEFAULT '0',
  `active` tinyint UNSIGNED DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `post_type_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(17,2) UNSIGNED DEFAULT NULL,
  `negotiable` tinyint(1) DEFAULT '0',
  `contact_name` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint(1) DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` bigint UNSIGNED DEFAULT NULL,
  `lon` double(8,2) DEFAULT NULL COMMENT 'longitude in decimal degrees (wgs84)',
  `lat` double(8,2) DEFAULT NULL COMMENT 'latitude in decimal degrees (wgs84)',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visits` int UNSIGNED DEFAULT '0',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tmp_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint UNSIGNED DEFAULT '0',
  `verified_phone` tinyint UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `is_permanent` tinyint(1) DEFAULT '0',
  `reviewed` tinyint(1) DEFAULT '0',
  `featured` tinyint UNSIGNED DEFAULT '0',
  `archived` tinyint(1) DEFAULT '0',
  `archived_at` timestamp NULL DEFAULT NULL,
  `archived_manually` tinyint UNSIGNED DEFAULT '0',
  `deletion_mail_sent_at` timestamp NULL DEFAULT NULL,
  `fb_profile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `active` tinyint UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_types`
--

INSERT INTO `post_types` (`id`, `translation_lang`, `translation_of`, `name`, `lft`, `rgt`, `depth`, `active`) VALUES
(1, 'en', 1, 'Private individual', NULL, NULL, NULL, 1),
(2, 'en', 2, 'Professional', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_values`
--

CREATE TABLE `post_values` (
  `id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `field_id` int UNSIGNED DEFAULT NULL,
  `option_id` int UNSIGNED DEFAULT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_types`
--

CREATE TABLE `report_types` (
  `id` int UNSIGNED NOT NULL,
  `translation_lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `translation_of` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `report_types`
--

INSERT INTO `report_types` (`id`, `translation_lang`, `translation_of`, `name`) VALUES
(1, 'en', 1, 'Fraud'),
(2, 'en', 2, 'Duplicate'),
(3, 'en', 3, 'Spam'),
(4, 'en', 4, 'Wrong category'),
(5, 'en', 5, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', '2021-01-07 11:37:20', '2021-01-07 11:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `saved_posts`
--

CREATE TABLE `saved_posts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `post_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `saved_search`
--

CREATE TABLE `saved_search` (
  `id` bigint UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `keyword` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'To show',
  `query` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` int UNSIGNED DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payload` mediumtext COLLATE utf8_unicode_ci,
  `last_activity` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `ip_address` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_agent` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `description` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field` mediumtext COLLATE utf8_unicode_ci,
  `parent_id` int UNSIGNED DEFAULT NULL,
  `lft` int UNSIGNED DEFAULT NULL,
  `rgt` int UNSIGNED DEFAULT NULL,
  `depth` int UNSIGNED DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `name`, `value`, `description`, `field`, `parent_id`, `lft`, `rgt`, `depth`, `active`, `created_at`, `updated_at`) VALUES
(1, 'app', 'Application', '{\"purchase_code\":\"4e6c751a-8d91-2a01-8c64-02698d5abe43\",\"name\":\"Bimmersouq\",\"slogan\":\"bmw marketplace in egypt\",\"email\":\"info@bimmersouq.com\"}', 'Application Setup', NULL, NULL, 2, 3, 1, 1, NULL, NULL),
(2, 'style', 'Style', NULL, 'Style Customization', NULL, NULL, 4, 5, 1, 1, NULL, NULL),
(3, 'listing', 'Listing & Search', NULL, 'Listing & Search Options', NULL, NULL, 6, 7, 1, 1, NULL, NULL),
(4, 'single', 'Ads (Form & Single Page)', NULL, 'Ads (Form & Single Page) Options', NULL, NULL, 8, 9, 1, 1, NULL, NULL),
(5, 'mail', 'Mail', '{\"email_sender\":\"info@bimmersouq.com\",\"driver\":\"sendmail\",\"sendmail_path\":\"\\/usr\\/sbin\\/sendmail -bs\"}', 'Mail Sending Configuration', NULL, NULL, 10, 11, 1, 1, NULL, NULL),
(6, 'sms', 'SMS', NULL, 'SMS Sending Configuration', NULL, NULL, 12, 13, 1, 1, NULL, NULL),
(7, 'upload', 'Upload', NULL, 'Upload Settings', NULL, NULL, 14, 15, 1, 1, NULL, NULL),
(8, 'geo_location', 'Geo Location', '{\"default_country_code\":\"EG\"}', 'Geo Location Configuration', NULL, NULL, 16, 17, 1, 1, NULL, NULL),
(9, 'security', 'Security', NULL, 'Security Options', NULL, NULL, 18, 19, 1, 1, NULL, NULL),
(10, 'social_auth', 'Social Login', NULL, 'Social Network Login', NULL, NULL, 20, 21, 1, 1, NULL, NULL),
(11, 'social_link', 'Social Network', NULL, 'Social Network Profiles', NULL, NULL, 22, 23, 1, 1, NULL, NULL),
(12, 'optimization', 'Optimization', NULL, 'Optimization Tools', NULL, NULL, 24, 25, 1, 1, NULL, NULL),
(13, 'seo', 'SEO', NULL, 'SEO Tools', NULL, NULL, 26, 27, 1, 1, NULL, NULL),
(14, 'other', 'Others', NULL, 'Other Options', NULL, NULL, 28, 29, 1, 1, NULL, NULL),
(15, 'cron', 'Cron', NULL, 'Cron Job', NULL, NULL, 30, 31, 1, 1, NULL, NULL),
(16, 'footer', 'Footer', NULL, 'Pages Footer', NULL, NULL, 32, 33, 1, 1, NULL, NULL),
(17, 'backup', 'Backup', NULL, 'Backup Configuration', NULL, NULL, 34, 35, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin1`
--

CREATE TABLE `subadmin1` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin1`
--

INSERT INTO `subadmin1` (`id`, `code`, `country_code`, `name`, `asciiname`, `active`, `created_at`, `updated_at`) VALUES
(1, 'EG.24', 'EG', 'Sohag', 'Sohag', 1, NULL, NULL),
(2, 'EG.27', 'EG', 'North Sinai', 'North Sinai', 1, NULL, NULL),
(3, 'EG.23', 'EG', 'Qena', 'Qena', 1, NULL, NULL),
(4, 'EG.22', 'EG', 'Matruh', 'Matruh', 1, NULL, NULL),
(5, 'EG.21', 'EG', 'Kafr el-Sheikh', 'Kafr el-Sheikh', 1, NULL, NULL),
(6, 'EG.26', 'EG', 'South Sinai', 'South Sinai', 1, NULL, NULL),
(7, 'EG.20', 'EG', 'Damietta', 'Damietta', 1, NULL, NULL),
(8, 'EG.19', 'EG', 'Port Said', 'Port Said', 1, NULL, NULL),
(9, 'EG.18', 'EG', 'Beni Suweif', 'Beni Suweif', 1, NULL, NULL),
(10, 'EG.17', 'EG', 'Asyut', 'Asyut', 1, NULL, NULL),
(11, 'EG.16', 'EG', 'Aswan', 'Aswan', 1, NULL, NULL),
(12, 'EG.15', 'EG', 'Suez', 'Suez', 1, NULL, NULL),
(13, 'EG.14', 'EG', 'Sharqia', 'Sharqia', 1, NULL, NULL),
(14, 'EG.13', 'EG', 'New Valley', 'New Valley', 1, NULL, NULL),
(15, 'EG.12', 'EG', 'Qalyubia', 'Qalyubia', 1, NULL, NULL),
(16, 'EG.11', 'EG', 'Cairo', 'Cairo', 1, NULL, NULL),
(17, 'EG.10', 'EG', 'Minya', 'Minya', 1, NULL, NULL),
(18, 'EG.09', 'EG', 'Monufia', 'Monufia', 1, NULL, NULL),
(19, 'EG.08', 'EG', 'Giza', 'Giza', 1, NULL, NULL),
(20, 'EG.07', 'EG', 'Ismailia', 'Ismailia', 1, NULL, NULL),
(21, 'EG.06', 'EG', 'Alexandria', 'Alexandria', 1, NULL, NULL),
(22, 'EG.05', 'EG', 'Gharbia', 'Gharbia', 1, NULL, NULL),
(23, 'EG.04', 'EG', 'Faiyum', 'Faiyum', 1, NULL, NULL),
(24, 'EG.03', 'EG', 'Beheira', 'Beheira', 1, NULL, NULL),
(25, 'EG.02', 'EG', 'Red Sea', 'Red Sea', 1, NULL, NULL),
(26, 'EG.01', 'EG', 'Dakahlia', 'Dakahlia', 1, NULL, NULL),
(27, 'EG.28', 'EG', 'Luxor', 'Luxor', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subadmin2`
--

CREATE TABLE `subadmin2` (
  `id` int UNSIGNED NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subadmin1_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `asciiname` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subadmin2`
--

INSERT INTO `subadmin2` (`id`, `code`, `country_code`, `subadmin1_code`, `name`, `asciiname`, `active`, `created_at`, `updated_at`) VALUES
(1, 'EG.09.345955', 'EG', 'EG.09', 'Markaz al Bājūr', 'Markaz al Bajur', 1, NULL, NULL),
(2, 'EG.05.346029', 'EG', 'EG.05', 'Markaz Ziftá', 'Markaz Zifta', 1, NULL, NULL),
(3, 'EG.16.346518', 'EG', 'EG.16', 'Markaz ‘Unaybah', 'Markaz `Unaybah', 1, NULL, NULL),
(4, 'EG.05.347496', 'EG', 'EG.05', 'Markaz Ţanţā', 'Markaz Tanta', 1, NULL, NULL),
(5, 'EG.04.347541', 'EG', 'EG.04', 'Markaz Ţāmiyah', 'Markaz Tamiyah', 1, NULL, NULL),
(6, 'EG.18.347750', 'EG', 'EG.18', 'Markaz Sumusţā al Waqf', 'Markaz Sumusta al Waqf', 1, NULL, NULL),
(7, 'EG.24.347795', 'EG', 'EG.24', 'Markaz Sūhāj', 'Markaz Suhaj', 1, NULL, NULL),
(8, 'EG.21.348095', 'EG', 'EG.21', 'Markaz Sīdī Sālim', 'Markaz Sidi Salim', 1, NULL, NULL),
(9, 'EG.10.349716', 'EG', 'EG.10', 'Markaz Samālūţ', 'Markaz Samalut', 1, NULL, NULL),
(10, 'EG.03.350200', 'EG', 'EG.03', 'Markaz Rashīd', 'Markaz Rashid', 1, NULL, NULL),
(11, 'EG.09.350368', 'EG', 'EG.09', 'Markaz Quwaysinā', 'Markaz Quwaysina', 1, NULL, NULL),
(12, 'EG.05.350373', 'EG', 'EG.05', 'Markaz Quţūr', 'Markaz Qutur', 1, NULL, NULL),
(13, 'EG.23.350547', 'EG', 'EG.23', 'Markaz Qinā', 'Markaz Qina', 1, NULL, NULL),
(14, 'EG.07.350768', 'EG', 'EG.07', 'Markaz al Qanţarah Gharb', 'Markaz al Qantarah Gharb', 1, NULL, NULL),
(15, 'EG.12.350787', 'EG', 'EG.12', 'Markaz Qalyūb', 'Markaz Qalyub', 1, NULL, NULL),
(16, 'EG.21.350795', 'EG', 'EG.21', 'Markaz Qallīn', 'Markaz Qallin', 1, NULL, NULL),
(17, 'EG.23.351433', 'EG', 'EG.23', 'Markaz Naj‘ Ḩammādī', 'Markaz Naj\' Hammadi', 1, NULL, NULL),
(18, 'EG.01.352180', 'EG', 'EG.01', 'Markaz Mīt Ghamr', 'Markaz Mit Ghamr', 1, NULL, NULL),
(19, 'EG.14.352351', 'EG', 'EG.14', 'Markaz Minyā al Qamḩ', 'Markaz Minya al Qamh', 1, NULL, NULL),
(20, 'EG.22.352605', 'EG', 'EG.22', 'Markaz Maţrūḩ', 'Markaz Matruh', 1, NULL, NULL),
(21, 'EG.10.352626', 'EG', 'EG.10', 'Markaz Maţāy', 'Markaz Matay', 1, NULL, NULL),
(22, 'EG.06.352720', 'EG', 'EG.06', 'Markaz Maryūţ', 'Markaz Maryut', 1, NULL, NULL),
(23, 'EG.10.352950', 'EG', 'EG.10', 'Markaz Mallawī', 'Markaz Mallawi', 1, NULL, NULL),
(24, 'EG.21.354501', 'EG', 'EG.21', 'Markaz Kafr ash Shaykh', 'Markaz Kafr ash Shaykh', 1, NULL, NULL),
(25, 'EG.03.354773', 'EG', 'EG.03', 'Markaz Kafr ad Dawwār', 'Markaz Kafr ad Dawwar', 1, NULL, NULL),
(26, 'EG.24.355025', 'EG', 'EG.24', 'Markaz Jirjā', 'Markaz Jirja', 1, NULL, NULL),
(27, 'EG.03.355416', 'EG', 'EG.03', 'Markaz Ītāy al Bārūd', 'Markaz Itay al Barud', 1, NULL, NULL),
(28, 'EG.04.355419', 'EG', 'EG.04', 'Markaz Iţsā', 'Markaz Itsa', 1, NULL, NULL),
(29, 'EG.23.355447', 'EG', 'EG.23', 'Markaz Isnā', 'Markaz Isna', 1, NULL, NULL),
(30, 'EG.08.355547', 'EG', 'EG.08', 'Markaz Imbābah', 'Markaz Imbabah', 1, NULL, NULL),
(31, 'EG.18.355594', 'EG', 'EG.18', 'Markaz Ihnāsiyā al Madīnah', 'Markaz Ihnasiya al Madinah', 1, NULL, NULL),
(32, 'EG.16.355633', 'EG', 'EG.16', 'Markaz Idfū', 'Markaz Idfu', 1, NULL, NULL),
(33, 'EG.04.355647', 'EG', 'EG.04', 'Markaz Ibshawāy', 'Markaz Ibshaway', 1, NULL, NULL),
(34, 'EG.14.355938', 'EG', 'EG.14', 'Markaz Hihyā', 'Markaz Hihya', 1, NULL, NULL),
(35, 'EG.03.355999', 'EG', 'EG.03', 'Markaz Ḩawsh ‘Īsá', 'Markaz Hawsh `Isa', 1, NULL, NULL),
(36, 'EG.21.356805', 'EG', 'EG.21', 'Markaz Fuwwah', 'Markaz Fuwwah', 1, NULL, NULL),
(37, 'EG.20.356943', 'EG', 'EG.20', 'Markaz Fāriskūr', 'Markaz Fariskur', 1, NULL, NULL),
(38, 'EG.14.358094', 'EG', 'EG.14', 'Markaz Diyarb Najm', 'Markaz Diyarb Najm', 1, NULL, NULL),
(39, 'EG.21.358107', 'EG', 'EG.21', 'Markaz Disūq', 'Markaz Disuq', 1, NULL, NULL),
(40, 'EG.23.358114', 'EG', 'EG.23', 'Markaz Dishnā', 'Markaz Dishna', 1, NULL, NULL),
(41, 'EG.01.358171', 'EG', 'EG.01', 'Markaz Dikirnis', 'Markaz Dikirnis', 1, NULL, NULL),
(42, 'EG.17.358267', 'EG', 'EG.17', 'Markaz Dayrūţ', 'Markaz Dayrut', 1, NULL, NULL),
(43, 'EG.10.358273', 'EG', 'EG.10', 'Markaz Dayr Mawās', 'Markaz Dayr Mawas', 1, NULL, NULL),
(44, 'EG.03.358446', 'EG', 'EG.03', 'Markaz Damanhūr', 'Markaz Damanhur', 1, NULL, NULL),
(45, 'EG.18.358599', 'EG', 'EG.18', 'Markaz Būsh', 'Markaz Bush', 1, NULL, NULL),
(46, 'EG.21.358725', 'EG', 'EG.21', 'Markaz Biyalā', 'Markaz Biyala', 1, NULL, NULL),
(47, 'EG.01.358824', 'EG', 'EG.01', 'Markaz Bilqās', 'Markaz Bilqas', 1, NULL, NULL),
(48, 'EG.14.358838', 'EG', 'EG.14', 'Markaz Bilbays', 'Markaz Bilbays', 1, NULL, NULL),
(49, 'EG.18.358869', 'EG', 'EG.18', 'Markaz Bibā', 'Markaz Biba', 1, NULL, NULL),
(50, 'EG.05.358969', 'EG', 'EG.05', 'Markaz Basyūn', 'Markaz Basyun', 1, NULL, NULL),
(51, 'EG.18.359172', 'EG', 'EG.18', 'Markaz Banī Suwayf', 'Markaz Bani Suwayf', 1, NULL, NULL),
(52, 'EG.10.359211', 'EG', 'EG.10', 'Markaz Banī Mazār', 'Markaz Bani Mazar', 1, NULL, NULL),
(53, 'EG.12.359279', 'EG', 'EG.12', 'Markaz Banhā', 'Markaz Banha', 1, NULL, NULL),
(54, 'EG.14.359494', 'EG', 'EG.14', 'Markaz az Zaqāzīq', 'Markaz az Zaqaziq', 1, NULL, NULL),
(55, 'EG.24.359588', 'EG', 'EG.24', 'Markaz Awlād Ţawq Sharq', 'Markaz Awlad Tawq Sharq', 1, NULL, NULL),
(56, 'EG.17.359782', 'EG', 'EG.17', 'Markaz Asyūţ', 'Markaz Asyut', 1, NULL, NULL),
(57, 'EG.16.359788', 'EG', 'EG.16', 'Markaz Aswān', 'Markaz Aswan', 1, NULL, NULL),
(58, 'EG.05.359850', 'EG', 'EG.05', 'Markaz as Sanţah', 'Markaz as Santah', 1, NULL, NULL),
(59, 'EG.11.359901', 'EG', 'EG.11', 'Markaz aş Şaff', 'Markaz as Saff', 1, NULL, NULL),
(60, 'EG.09.359954', 'EG', 'EG.09', 'Markaz ash Shuhadā’', 'Markaz ash Shuhada\'', 1, NULL, NULL),
(61, 'EG.09.360047', 'EG', 'EG.09', 'Markaz Ashmūn', 'Markaz Ashmun', 1, NULL, NULL),
(62, 'EG.23.360166', 'EG', 'EG.23', 'Markaz Armant', 'Markaz Armant', 1, NULL, NULL),
(63, 'EG.18.360466', 'EG', 'EG.18', 'Markaz al Wāsiţá', 'Markaz al Wasita', 1, NULL, NULL),
(64, 'EG.13.360478', 'EG', 'EG.13', 'Markaz al Wāḩāt al Khārijah', 'Markaz al Wahat al Kharijah', 1, NULL, NULL),
(65, 'EG.08.360479', 'EG', 'EG.08', 'Markaz al Wāḩāt al Baḩrīyah', 'Markaz al Wahat al Bahriyah', 1, NULL, NULL),
(66, 'EG.13.360480', 'EG', 'EG.13', 'Markaz al Wāḩāt ad Dākhilah', 'Markaz al Wahat ad Dakhilah', 1, NULL, NULL),
(67, 'EG.28.360503', 'EG', 'EG.28', 'Markaz al Uqşur', 'Markaz al Uqsur', 1, NULL, NULL),
(68, 'EG.17.360527', 'EG', 'EG.17', 'Markaz al Qūşīyah', 'Markaz al Qusiyah', 1, NULL, NULL),
(69, 'EG.10.360687', 'EG', 'EG.10', 'Markaz al Minyā', 'Markaz al Minya', 1, NULL, NULL),
(70, 'EG.24.360699', 'EG', 'EG.24', 'Markaz al Munsha’ah', 'Markaz al Munsha\'ah', 1, NULL, NULL),
(71, 'EG.24.360749', 'EG', 'EG.24', 'Markaz al Marāghah', 'Markaz al Maraghah', 1, NULL, NULL),
(72, 'EG.01.360756', 'EG', 'EG.01', 'Markaz al Manzilah', 'Markaz al Manzilah', 1, NULL, NULL),
(73, 'EG.01.360763', 'EG', 'EG.01', 'Markaz al Manşūrah', 'Markaz al Mansurah', 1, NULL, NULL),
(74, 'EG.03.360821', 'EG', 'EG.03', 'Markaz al Maḩmūdīyah', 'Markaz al Mahmudiyah', 1, NULL, NULL),
(75, 'EG.05.360830', 'EG', 'EG.05', 'Markaz al Maḩallah al Kubrá', 'Markaz al Mahallah al Kubra', 1, NULL, NULL),
(76, 'EG.11.360929', 'EG', 'EG.11', 'Markaz al Khānkah', 'Markaz al Khankah', 1, NULL, NULL),
(77, 'EG.08.360996', 'EG', 'EG.08', 'Markaz al Jīzah', 'Markaz al Jizah', 1, NULL, NULL),
(78, 'EG.10.361099', 'EG', 'EG.10', 'Markaz al ‘Idwah', 'Markaz al `Idwah', 1, NULL, NULL),
(79, 'EG.14.361127', 'EG', 'EG.14', 'Markaz al Ḩusaynīyah', 'Markaz al Husayniyah', 1, NULL, NULL),
(80, 'EG.04.361322', 'EG', 'EG.04', 'Markaz al Fayyūm', 'Markaz al Fayyum', 1, NULL, NULL),
(81, 'EG.18.361330', 'EG', 'EG.18', 'Markaz al Fashn', 'Markaz al Fashn', 1, NULL, NULL),
(82, 'EG.21.361358', 'EG', 'EG.21', 'Markaz al Burullus', 'Markaz al Burullus', 1, NULL, NULL),
(83, 'EG.24.361436', 'EG', 'EG.24', 'Markaz al Balyanā', 'Markaz al Balyana', 1, NULL, NULL),
(84, 'EG.08.361474', 'EG', 'EG.08', 'Markaz al Badrashayn', 'Markaz al Badrashayn', 1, NULL, NULL),
(85, 'EG.17.361479', 'EG', 'EG.17', 'Markaz al Badārī', 'Markaz al Badari', 1, NULL, NULL),
(86, 'EG.08.361497', 'EG', 'EG.08', 'Markaz al ‘Ayyāţ', 'Markaz al `Ayyat', 1, NULL, NULL),
(87, 'EG.24.361660', 'EG', 'EG.24', 'Markaz Akhmīm', 'Markaz Akhmim', 1, NULL, NULL),
(88, 'EG.01.361701', 'EG', 'EG.01', 'Markaz Ajā', 'Markaz Aja', 1, NULL, NULL),
(89, 'EG.03.361828', 'EG', 'EG.03', 'Markaz ad Dilinjāt', 'Markaz ad Dilinjat', 1, NULL, NULL),
(90, 'EG.23.361994', 'EG', 'EG.23', 'Markaz Abū Tisht', 'Markaz Abu Tisht', 1, NULL, NULL),
(91, 'EG.17.362003', 'EG', 'EG.17', 'Markaz Abū Tīj', 'Markaz Abu Tij', 1, NULL, NULL),
(92, 'EG.10.362276', 'EG', 'EG.10', 'Markaz Qurqāş', 'Markaz Qurqas', 1, NULL, NULL),
(93, 'EG.14.362484', 'EG', 'EG.14', 'Markaz Abū Kabīr', 'Markaz Abu Kabir', 1, NULL, NULL),
(94, 'EG.03.362550', 'EG', 'EG.03', 'Markaz Abū Ḩummuş', 'Markaz Abu Hummus', 1, NULL, NULL),
(95, 'EG.14.362612', 'EG', 'EG.14', 'Markaz Abū Ḩammād', 'Markaz Abu Hammad', 1, NULL, NULL),
(96, 'EG.03.362880', 'EG', 'EG.03', 'Markaz Abū al Maţāmīr', 'Markaz Abu al Matamir', 1, NULL, NULL),
(97, 'EG.12.7732632', 'EG', 'EG.12', 'Mostorod', 'Mostorod', 1, NULL, NULL),
(98, 'EG.21.7772238', 'EG', 'EG.21', 'Markaz al Ḩāmūl', 'Markaz al Hamul', 1, NULL, NULL),
(99, 'EG.14.7910679', 'EG', 'EG.14', 'Bahr El Bakar', 'Bahr El Bakar', 1, NULL, NULL),
(100, 'EG.01.7910872', 'EG', 'EG.01', 'Bahr El Bakr', 'Bahr El Bakr', 1, NULL, NULL),
(101, 'EG.11.7910874', 'EG', 'EG.11', 'Mostafa El Serwy', 'Mostafa El Serwy', 1, NULL, NULL),
(102, 'EG.01.7910974', 'EG', 'EG.01', 'Mit Yazid', 'Mit Yazid', 1, NULL, NULL),
(103, 'EG.21.7911002', 'EG', 'EG.21', 'Kafr El Sheikh', 'Kafr El Sheikh', 1, NULL, NULL),
(104, 'EG.12.8061368', 'EG', 'EG.12', 'Markaz Kafr Shukr', 'Markaz Kafr Shukr', 1, NULL, NULL),
(105, 'EG.08.8146219', 'EG', 'EG.08', 'Markaz Awsīm', 'Markaz Awsim', 1, NULL, NULL),
(106, 'EG.01.8559274', 'EG', 'EG.01', 'Markaz Minyat An Naşr', 'Markaz Minyat An Nasr', 1, NULL, NULL),
(107, 'EG.20.8559275', 'EG', 'EG.20', 'Markaz az Zarqā', 'Markaz az Zarqa', 1, NULL, NULL),
(108, 'EG.05.8561528', 'EG', 'EG.05', 'Markaz Sammanūd', 'Markaz Sammanud', 1, NULL, NULL),
(109, 'EG.20.8594167', 'EG', 'EG.20', 'Markaz Kafr Sa‘d', 'Markaz Kafr Sa`d', 1, NULL, NULL),
(110, 'EG.27.8601177', 'EG', 'EG.27', 'Markaz al ‘Arīsh', 'Markaz al `Arish', 1, NULL, NULL),
(111, 'EG.27.8601178', 'EG', 'EG.27', 'Markaz ash Shaykh Zuwayd', 'Markaz ash Shaykh Zuwayd', 1, NULL, NULL),
(112, 'EG.27.8601179', 'EG', 'EG.27', 'Markaz Rafaḩ', 'Markaz Rafah', 1, NULL, NULL),
(113, 'EG.27.8601180', 'EG', 'EG.27', 'Markaz Bi’r al ‘Abd', 'Markaz Bi\'r al `Abd', 1, NULL, NULL),
(114, 'EG.08.9179486', 'EG', 'EG.08', 'Walikale', 'Walikale', 1, NULL, NULL),
(115, 'EG.26.10371116', 'EG', 'EG.26', 'Markaz Aţfīḩ', 'Markaz Atfih', 1, NULL, NULL),
(116, 'EG.09.10371118', 'EG', 'EG.09', 'Markaz Birkat as Sab‘', 'Markaz Birkat as Sab`', 1, NULL, NULL),
(117, 'EG.24.10371119', 'EG', 'EG.24', 'Markaz Juhaynah al Gharbīyah', 'Markaz Juhaynah al Gharbiyah', 1, NULL, NULL),
(118, 'EG.24.10371120', 'EG', 'EG.24', 'Markaz Dār as Salām', 'Markaz Dar as Salam', 1, NULL, NULL),
(119, 'EG.21.10371122', 'EG', 'EG.21', 'Markaz ar Riyāḑ', 'Markaz ar Riyad', 1, NULL, NULL),
(120, 'EG.21.10371123', 'EG', 'EG.21', 'Markaz Muţūbas', 'Markaz Mutubas', 1, NULL, NULL),
(121, 'EG.17.10371124', 'EG', 'EG.17', 'Markaz al Fatḩ', 'Markaz al Fath', 1, NULL, NULL),
(122, 'EG.17.10371125', 'EG', 'EG.17', 'Markaz al Ghanāyim', 'Markaz al Ghanayim', 1, NULL, NULL),
(123, 'EG.17.10371126', 'EG', 'EG.17', 'Markaz as Sāḩil', 'Markaz as Sahil', 1, NULL, NULL),
(124, 'EG.18.10371146', 'EG', 'EG.18', 'Markaz Nāşir', 'Markaz Nasir', 1, NULL, NULL),
(125, 'EG.14.10371147', 'EG', 'EG.14', 'Markaz at Tall al Kabīr', 'Markaz at Tall al Kabir', 1, NULL, NULL),
(126, 'EG.07.10371148', 'EG', 'EG.07', 'Markaz al Ismā‘īlīyah', 'Markaz al Isma`iliyah', 1, NULL, NULL),
(127, 'EG.07.10371149', 'EG', 'EG.07', 'Markaz al Qanţarah Sharq', 'Markaz al Qantarah Sharq', 1, NULL, NULL),
(128, 'EG.07.10371150', 'EG', 'EG.07', 'Markaz Fāyid', 'Markaz Fayid', 1, NULL, NULL),
(129, 'EG.03.10430542', 'EG', 'EG.03', 'Markaz Idkū', 'Markaz Idku', 1, NULL, NULL),
(130, 'EG.03.10645705', 'EG', 'EG.03', 'Markaz ar Raḩmānīyah', 'Markaz ar Rahmaniyah', 1, NULL, NULL),
(131, 'EG.11.11204016', 'EG', 'EG.11', 'Al Marj', 'Al Marj', 1, NULL, NULL),
(132, 'EG.06.11205726', 'EG', 'EG.06', 'Al Muntazah', 'Al Muntazah', 1, NULL, NULL),
(133, 'EG.13.12060332', 'EG', 'EG.13', 'Shurtah al-Farafirah', 'Shurtah al-Farafirah', 1, NULL, NULL),
(134, 'EG.13.12060333', 'EG', 'EG.13', 'Baris Shurtah', 'Baris Shurtah', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `time_zones`
--

CREATE TABLE `time_zones` (
  `id` int UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_zone_id` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gmt` double DEFAULT NULL,
  `dst` double DEFAULT NULL,
  `raw` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `time_zones`
--

INSERT INTO `time_zones` (`id`, `country_code`, `time_zone_id`, `gmt`, `dst`, `raw`) VALUES
(1, 'CI', 'Africa/Abidjan', 0, 0, 0),
(2, 'GH', 'Africa/Accra', 0, 0, 0),
(3, 'ET', 'Africa/Addis_Ababa', 3, 3, 3),
(4, 'DZ', 'Africa/Algiers', 1, 1, 1),
(5, 'ER', 'Africa/Asmara', 3, 3, 3),
(6, 'ML', 'Africa/Bamako', 0, 0, 0),
(7, 'CF', 'Africa/Bangui', 1, 1, 1),
(8, 'GM', 'Africa/Banjul', 0, 0, 0),
(9, 'GW', 'Africa/Bissau', 0, 0, 0),
(10, 'MW', 'Africa/Blantyre', 2, 2, 2),
(11, 'CG', 'Africa/Brazzaville', 1, 1, 1),
(12, 'BI', 'Africa/Bujumbura', 2, 2, 2),
(13, 'EG', 'Africa/Cairo', 2, 2, 2),
(14, 'MA', 'Africa/Casablanca', 0, 1, 0),
(15, 'ES', 'Africa/Ceuta', 1, 2, 1),
(16, 'GN', 'Africa/Conakry', 0, 0, 0),
(17, 'SN', 'Africa/Dakar', 0, 0, 0),
(18, 'TZ', 'Africa/Dar_es_Salaam', 3, 3, 3),
(19, 'DJ', 'Africa/Djibouti', 3, 3, 3),
(20, 'CM', 'Africa/Douala', 1, 1, 1),
(21, 'EH', 'Africa/El_Aaiun', 0, 1, 0),
(22, 'SL', 'Africa/Freetown', 0, 0, 0),
(23, 'BW', 'Africa/Gaborone', 2, 2, 2),
(24, 'ZW', 'Africa/Harare', 2, 2, 2),
(25, 'ZA', 'Africa/Johannesburg', 2, 2, 2),
(26, 'SS', 'Africa/Juba', 3, 3, 3),
(27, 'UG', 'Africa/Kampala', 3, 3, 3),
(28, 'SD', 'Africa/Khartoum', 3, 3, 3),
(29, 'RW', 'Africa/Kigali', 2, 2, 2),
(30, 'CD', 'Africa/Kinshasa', 1, 1, 1),
(31, 'NG', 'Africa/Lagos', 1, 1, 1),
(32, 'GA', 'Africa/Libreville', 1, 1, 1),
(33, 'TG', 'Africa/Lome', 0, 0, 0),
(34, 'AO', 'Africa/Luanda', 1, 1, 1),
(35, 'CD', 'Africa/Lubumbashi', 2, 2, 2),
(36, 'ZM', 'Africa/Lusaka', 2, 2, 2),
(37, 'GQ', 'Africa/Malabo', 1, 1, 1),
(38, 'MZ', 'Africa/Maputo', 2, 2, 2),
(39, 'LS', 'Africa/Maseru', 2, 2, 2),
(40, 'SZ', 'Africa/Mbabane', 2, 2, 2),
(41, 'SO', 'Africa/Mogadishu', 3, 3, 3),
(42, 'LR', 'Africa/Monrovia', 0, 0, 0),
(43, 'KE', 'Africa/Nairobi', 3, 3, 3),
(44, 'TD', 'Africa/Ndjamena', 1, 1, 1),
(45, 'NE', 'Africa/Niamey', 1, 1, 1),
(46, 'MR', 'Africa/Nouakchott', 0, 0, 0),
(47, 'BF', 'Africa/Ouagadougou', 0, 0, 0),
(48, 'BJ', 'Africa/Porto-Novo', 1, 1, 1),
(49, 'ST', 'Africa/Sao_Tome', 0, 0, 0),
(50, 'LY', 'Africa/Tripoli', 2, 2, 2),
(51, 'TN', 'Africa/Tunis', 1, 1, 1),
(52, 'NA', 'Africa/Windhoek', 2, 1, 1),
(53, 'US', 'America/Adak', -10, -9, -10),
(54, 'US', 'America/Anchorage', -9, -8, -9),
(55, 'AI', 'America/Anguilla', -4, -4, -4),
(56, 'AG', 'America/Antigua', -4, -4, -4),
(57, 'BR', 'America/Araguaina', -3, -3, -3),
(58, 'AR', 'America/Argentina/Buenos_Aires', -3, -3, -3),
(59, 'AR', 'America/Argentina/Catamarca', -3, -3, -3),
(60, 'AR', 'America/Argentina/Cordoba', -3, -3, -3),
(61, 'AR', 'America/Argentina/Jujuy', -3, -3, -3),
(62, 'AR', 'America/Argentina/La_Rioja', -3, -3, -3),
(63, 'AR', 'America/Argentina/Mendoza', -3, -3, -3),
(64, 'AR', 'America/Argentina/Rio_Gallegos', -3, -3, -3),
(65, 'AR', 'America/Argentina/Salta', -3, -3, -3),
(66, 'AR', 'America/Argentina/San_Juan', -3, -3, -3),
(67, 'AR', 'America/Argentina/San_Luis', -3, -3, -3),
(68, 'AR', 'America/Argentina/Tucuman', -3, -3, -3),
(69, 'AR', 'America/Argentina/Ushuaia', -3, -3, -3),
(70, 'AW', 'America/Aruba', -4, -4, -4),
(71, 'PY', 'America/Asuncion', -3, -4, -4),
(72, 'CA', 'America/Atikokan', -5, -5, -5),
(73, 'BR', 'America/Bahia', -3, -3, -3),
(74, 'MX', 'America/Bahia_Banderas', -6, -5, -6),
(75, 'BB', 'America/Barbados', -4, -4, -4),
(76, 'BR', 'America/Belem', -3, -3, -3),
(77, 'BZ', 'America/Belize', -6, -6, -6),
(78, 'CA', 'America/Blanc-Sablon', -4, -4, -4),
(79, 'BR', 'America/Boa_Vista', -4, -4, -4),
(80, 'CO', 'America/Bogota', -5, -5, -5),
(81, 'US', 'America/Boise', -7, -6, -7),
(82, 'CA', 'America/Cambridge_Bay', -7, -6, -7),
(83, 'BR', 'America/Campo_Grande', -3, -4, -4),
(84, 'MX', 'America/Cancun', -5, -5, -5),
(85, 'VE', 'America/Caracas', -4, -4, -4),
(86, 'GF', 'America/Cayenne', -3, -3, -3),
(87, 'KY', 'America/Cayman', -5, -5, -5),
(88, 'US', 'America/Chicago', -6, -5, -6),
(89, 'MX', 'America/Chihuahua', -7, -6, -7),
(90, 'CR', 'America/Costa_Rica', -6, -6, -6),
(91, 'CA', 'America/Creston', -7, -7, -7),
(92, 'BR', 'America/Cuiaba', -3, -4, -4),
(93, 'CW', 'America/Curacao', -4, -4, -4),
(94, 'GL', 'America/Danmarkshavn', 0, 0, 0),
(95, 'CA', 'America/Dawson', -8, -7, -8),
(96, 'CA', 'America/Dawson_Creek', -7, -7, -7),
(97, 'US', 'America/Denver', -7, -6, -7),
(98, 'US', 'America/Detroit', -5, -4, -5),
(99, 'DM', 'America/Dominica', -4, -4, -4),
(100, 'CA', 'America/Edmonton', -7, -6, -7),
(101, 'BR', 'America/Eirunepe', -5, -5, -5),
(102, 'SV', 'America/El_Salvador', -6, -6, -6),
(103, 'CA', 'America/Fort_Nelson', -7, -7, -7),
(104, 'BR', 'America/Fortaleza', -3, -3, -3),
(105, 'CA', 'America/Glace_Bay', -4, -3, -4),
(106, 'GL', 'America/Godthab', -3, -2, -3),
(107, 'CA', 'America/Goose_Bay', -4, -3, -4),
(108, 'TC', 'America/Grand_Turk', -4, -4, -4),
(109, 'GD', 'America/Grenada', -4, -4, -4),
(110, 'GP', 'America/Guadeloupe', -4, -4, -4),
(111, 'GT', 'America/Guatemala', -6, -6, -6),
(112, 'EC', 'America/Guayaquil', -5, -5, -5),
(113, 'GY', 'America/Guyana', -4, -4, -4),
(114, 'CA', 'America/Halifax', -4, -3, -4),
(115, 'CU', 'America/Havana', -5, -4, -5),
(116, 'MX', 'America/Hermosillo', -7, -7, -7),
(117, 'US', 'America/Indiana/Indianapolis', -5, -4, -5),
(118, 'US', 'America/Indiana/Knox', -6, -5, -6),
(119, 'US', 'America/Indiana/Marengo', -5, -4, -5),
(120, 'US', 'America/Indiana/Petersburg', -5, -4, -5),
(121, 'US', 'America/Indiana/Tell_City', -6, -5, -6),
(122, 'US', 'America/Indiana/Vevay', -5, -4, -5),
(123, 'US', 'America/Indiana/Vincennes', -5, -4, -5),
(124, 'US', 'America/Indiana/Winamac', -5, -4, -5),
(125, 'CA', 'America/Inuvik', -7, -6, -7),
(126, 'CA', 'America/Iqaluit', -5, -4, -5),
(127, 'JM', 'America/Jamaica', -5, -5, -5),
(128, 'US', 'America/Juneau', -9, -8, -9),
(129, 'US', 'America/Kentucky/Louisville', -5, -4, -5),
(130, 'US', 'America/Kentucky/Monticello', -5, -4, -5),
(131, 'BQ', 'America/Kralendijk', -4, -4, -4),
(132, 'BO', 'America/La_Paz', -4, -4, -4),
(133, 'PE', 'America/Lima', -5, -5, -5),
(134, 'US', 'America/Los_Angeles', -8, -7, -8),
(135, 'SX', 'America/Lower_Princes', -4, -4, -4),
(136, 'BR', 'America/Maceio', -3, -3, -3),
(137, 'NI', 'America/Managua', -6, -6, -6),
(138, 'BR', 'America/Manaus', -4, -4, -4),
(139, 'MF', 'America/Marigot', -4, -4, -4),
(140, 'MQ', 'America/Martinique', -4, -4, -4),
(141, 'MX', 'America/Matamoros', -6, -5, -6),
(142, 'MX', 'America/Mazatlan', -7, -6, -7),
(143, 'US', 'America/Menominee', -6, -5, -6),
(144, 'MX', 'America/Merida', -6, -5, -6),
(145, 'US', 'America/Metlakatla', -9, -8, -9),
(146, 'MX', 'America/Mexico_City', -6, -5, -6),
(147, 'PM', 'America/Miquelon', -3, -2, -3),
(148, 'CA', 'America/Moncton', -4, -3, -4),
(149, 'MX', 'America/Monterrey', -6, -5, -6),
(150, 'UY', 'America/Montevideo', -3, -3, -3),
(151, 'MS', 'America/Montserrat', -4, -4, -4),
(152, 'BS', 'America/Nassau', -5, -4, -5),
(153, 'US', 'America/New_York', -5, -4, -5),
(154, 'CA', 'America/Nipigon', -5, -4, -5),
(155, 'US', 'America/Nome', -9, -8, -9),
(156, 'BR', 'America/Noronha', -2, -2, -2),
(157, 'US', 'America/North_Dakota/Beulah', -6, -5, -6),
(158, 'US', 'America/North_Dakota/Center', -6, -5, -6),
(159, 'US', 'America/North_Dakota/New_Salem', -6, -5, -6),
(160, 'MX', 'America/Ojinaga', -7, -6, -7),
(161, 'PA', 'America/Panama', -5, -5, -5),
(162, 'CA', 'America/Pangnirtung', -5, -4, -5),
(163, 'SR', 'America/Paramaribo', -3, -3, -3),
(164, 'US', 'America/Phoenix', -7, -7, -7),
(165, 'HT', 'America/Port-au-Prince', -5, -4, -5),
(166, 'TT', 'America/Port_of_Spain', -4, -4, -4),
(167, 'BR', 'America/Porto_Velho', -4, -4, -4),
(168, 'PR', 'America/Puerto_Rico', -4, -4, -4),
(169, 'CL', 'America/Punta_Arenas', -3, -3, -3),
(170, 'CA', 'America/Rainy_River', -6, -5, -6),
(171, 'CA', 'America/Rankin_Inlet', -6, -5, -6),
(172, 'BR', 'America/Recife', -3, -3, -3),
(173, 'CA', 'America/Regina', -6, -6, -6),
(174, 'CA', 'America/Resolute', -6, -5, -6),
(175, 'BR', 'America/Rio_Branco', -5, -5, -5),
(176, 'BR', 'America/Santarem', -3, -3, -3),
(177, 'CL', 'America/Santiago', -3, -4, -4),
(178, 'DO', 'America/Santo_Domingo', -4, -4, -4),
(179, 'BR', 'America/Sao_Paulo', -2, -3, -3),
(180, 'GL', 'America/Scoresbysund', -1, 0, -1),
(181, 'US', 'America/Sitka', -9, -8, -9),
(182, 'BL', 'America/St_Barthelemy', -4, -4, -4),
(183, 'CA', 'America/St_Johns', -3.5, -2.5, -3.5),
(184, 'KN', 'America/St_Kitts', -4, -4, -4),
(185, 'LC', 'America/St_Lucia', -4, -4, -4),
(186, 'VI', 'America/St_Thomas', -4, -4, -4),
(187, 'VC', 'America/St_Vincent', -4, -4, -4),
(188, 'CA', 'America/Swift_Current', -6, -6, -6),
(189, 'HN', 'America/Tegucigalpa', -6, -6, -6),
(190, 'GL', 'America/Thule', -4, -3, -4),
(191, 'CA', 'America/Thunder_Bay', -5, -4, -5),
(192, 'MX', 'America/Tijuana', -8, -7, -8),
(193, 'CA', 'America/Toronto', -5, -4, -5),
(194, 'VG', 'America/Tortola', -4, -4, -4),
(195, 'CA', 'America/Vancouver', -8, -7, -8),
(196, 'CA', 'America/Whitehorse', -8, -7, -8),
(197, 'CA', 'America/Winnipeg', -6, -5, -6),
(198, 'US', 'America/Yakutat', -9, -8, -9),
(199, 'CA', 'America/Yellowknife', -7, -6, -7),
(200, 'AQ', 'Antarctica/Casey', 11, 11, 11),
(201, 'AQ', 'Antarctica/Davis', 7, 7, 7),
(202, 'AQ', 'Antarctica/DumontDUrville', 10, 10, 10),
(203, 'AU', 'Antarctica/Macquarie', 11, 11, 11),
(204, 'AQ', 'Antarctica/Mawson', 5, 5, 5),
(205, 'AQ', 'Antarctica/McMurdo', 13, 12, 12),
(206, 'AQ', 'Antarctica/Palmer', -3, -3, -3),
(207, 'AQ', 'Antarctica/Rothera', -3, -3, -3),
(208, 'AQ', 'Antarctica/Syowa', 3, 3, 3),
(209, 'AQ', 'Antarctica/Troll', 0, 2, 0),
(210, 'AQ', 'Antarctica/Vostok', 6, 6, 6),
(211, 'SJ', 'Arctic/Longyearbyen', 1, 2, 1),
(212, 'YE', 'Asia/Aden', 3, 3, 3),
(213, 'KZ', 'Asia/Almaty', 6, 6, 6),
(214, 'JO', 'Asia/Amman', 2, 3, 2),
(215, 'RU', 'Asia/Anadyr', 12, 12, 12),
(216, 'KZ', 'Asia/Aqtau', 5, 5, 5),
(217, 'KZ', 'Asia/Aqtobe', 5, 5, 5),
(218, 'TM', 'Asia/Ashgabat', 5, 5, 5),
(219, 'KZ', 'Asia/Atyrau', 5, 5, 5),
(220, 'IQ', 'Asia/Baghdad', 3, 3, 3),
(221, 'BH', 'Asia/Bahrain', 3, 3, 3),
(222, 'AZ', 'Asia/Baku', 4, 4, 4),
(223, 'TH', 'Asia/Bangkok', 7, 7, 7),
(224, 'RU', 'Asia/Barnaul', 7, 7, 7),
(225, 'LB', 'Asia/Beirut', 2, 3, 2),
(226, 'KG', 'Asia/Bishkek', 6, 6, 6),
(227, 'BN', 'Asia/Brunei', 8, 8, 8),
(228, 'RU', 'Asia/Chita', 9, 9, 9),
(229, 'MN', 'Asia/Choibalsan', 8, 8, 8),
(230, 'LK', 'Asia/Colombo', 5.5, 5.5, 5.5),
(231, 'SY', 'Asia/Damascus', 2, 3, 2),
(232, 'BD', 'Asia/Dhaka', 6, 6, 6),
(233, 'TL', 'Asia/Dili', 9, 9, 9),
(234, 'AE', 'Asia/Dubai', 4, 4, 4),
(235, 'TJ', 'Asia/Dushanbe', 5, 5, 5),
(236, 'CY', 'Asia/Famagusta', 3, 3, 3),
(237, 'PS', 'Asia/Gaza', 2, 3, 2),
(238, 'PS', 'Asia/Hebron', 2, 3, 2),
(239, 'VN', 'Asia/Ho_Chi_Minh', 7, 7, 7),
(240, 'HK', 'Asia/Hong_Kong', 8, 8, 8),
(241, 'MN', 'Asia/Hovd', 7, 7, 7),
(242, 'RU', 'Asia/Irkutsk', 8, 8, 8),
(243, 'ID', 'Asia/Jakarta', 7, 7, 7),
(244, 'ID', 'Asia/Jayapura', 9, 9, 9),
(245, 'IL', 'Asia/Jerusalem', 2, 3, 2),
(246, 'AF', 'Asia/Kabul', 4.5, 4.5, 4.5),
(247, 'RU', 'Asia/Kamchatka', 12, 12, 12),
(248, 'PK', 'Asia/Karachi', 5, 5, 5),
(249, 'NP', 'Asia/Kathmandu', 5.75, 5.75, 5.75),
(250, 'RU', 'Asia/Khandyga', 9, 9, 9),
(251, 'IN', 'Asia/Kolkata', 5.5, 5.5, 5.5),
(252, 'RU', 'Asia/Krasnoyarsk', 7, 7, 7),
(253, 'MY', 'Asia/Kuala_Lumpur', 8, 8, 8),
(254, 'MY', 'Asia/Kuching', 8, 8, 8),
(255, 'KW', 'Asia/Kuwait', 3, 3, 3),
(256, 'MO', 'Asia/Macau', 8, 8, 8),
(257, 'RU', 'Asia/Magadan', 11, 11, 11),
(258, 'ID', 'Asia/Makassar', 8, 8, 8),
(259, 'PH', 'Asia/Manila', 8, 8, 8),
(260, 'OM', 'Asia/Muscat', 4, 4, 4),
(261, 'CY', 'Asia/Nicosia', 2, 3, 2),
(262, 'RU', 'Asia/Novokuznetsk', 7, 7, 7),
(263, 'RU', 'Asia/Novosibirsk', 7, 7, 7),
(264, 'RU', 'Asia/Omsk', 6, 6, 6),
(265, 'KZ', 'Asia/Oral', 5, 5, 5),
(266, 'KH', 'Asia/Phnom_Penh', 7, 7, 7),
(267, 'ID', 'Asia/Pontianak', 7, 7, 7),
(268, 'KP', 'Asia/Pyongyang', 8.5, 8.5, 8.5),
(269, 'QA', 'Asia/Qatar', 3, 3, 3),
(270, 'KZ', 'Asia/Qyzylorda', 6, 6, 6),
(271, 'SA', 'Asia/Riyadh', 3, 3, 3),
(272, 'RU', 'Asia/Sakhalin', 11, 11, 11),
(273, 'UZ', 'Asia/Samarkand', 5, 5, 5),
(274, 'KR', 'Asia/Seoul', 9, 9, 9),
(275, 'CN', 'Asia/Shanghai', 8, 8, 8),
(276, 'SG', 'Asia/Singapore', 8, 8, 8),
(277, 'RU', 'Asia/Srednekolymsk', 11, 11, 11),
(278, 'TW', 'Asia/Taipei', 8, 8, 8),
(279, 'UZ', 'Asia/Tashkent', 5, 5, 5),
(280, 'GE', 'Asia/Tbilisi', 4, 4, 4),
(281, 'IR', 'Asia/Tehran', 3.5, 4.5, 3.5),
(282, 'BT', 'Asia/Thimphu', 6, 6, 6),
(283, 'JP', 'Asia/Tokyo', 9, 9, 9),
(284, 'RU', 'Asia/Tomsk', 7, 7, 7),
(285, 'MN', 'Asia/Ulaanbaatar', 8, 8, 8),
(286, 'CN', 'Asia/Urumqi', 6, 6, 6),
(287, 'RU', 'Asia/Ust-Nera', 10, 10, 10),
(288, 'LA', 'Asia/Vientiane', 7, 7, 7),
(289, 'RU', 'Asia/Vladivostok', 10, 10, 10),
(290, 'RU', 'Asia/Yakutsk', 9, 9, 9),
(291, 'MM', 'Asia/Yangon', 6.5, 6.5, 6.5),
(292, 'RU', 'Asia/Yekaterinburg', 5, 5, 5),
(293, 'AM', 'Asia/Yerevan', 4, 4, 4),
(294, 'PT', 'Atlantic/Azores', -1, 0, -1),
(295, 'BM', 'Atlantic/Bermuda', -4, -3, -4),
(296, 'ES', 'Atlantic/Canary', 0, 1, 0),
(297, 'CV', 'Atlantic/Cape_Verde', -1, -1, -1),
(298, 'FO', 'Atlantic/Faroe', 0, 1, 0),
(299, 'PT', 'Atlantic/Madeira', 0, 1, 0),
(300, 'IS', 'Atlantic/Reykjavik', 0, 0, 0),
(301, 'GS', 'Atlantic/South_Georgia', -2, -2, -2),
(302, 'SH', 'Atlantic/St_Helena', 0, 0, 0),
(303, 'FK', 'Atlantic/Stanley', -3, -3, -3),
(304, 'AU', 'Australia/Adelaide', 10.5, 9.5, 9.5),
(305, 'AU', 'Australia/Brisbane', 10, 10, 10),
(306, 'AU', 'Australia/Broken_Hill', 10.5, 9.5, 9.5),
(307, 'AU', 'Australia/Currie', 11, 10, 10),
(308, 'AU', 'Australia/Darwin', 9.5, 9.5, 9.5),
(309, 'AU', 'Australia/Eucla', 8.75, 8.75, 8.75),
(310, 'AU', 'Australia/Hobart', 11, 10, 10),
(311, 'AU', 'Australia/Lindeman', 10, 10, 10),
(312, 'AU', 'Australia/Lord_Howe', 11, 10.5, 10.5),
(313, 'AU', 'Australia/Melbourne', 11, 10, 10),
(314, 'AU', 'Australia/Perth', 8, 8, 8),
(315, 'AU', 'Australia/Sydney', 11, 10, 10),
(316, 'NL', 'Europe/Amsterdam', 1, 2, 1),
(317, 'AD', 'Europe/Andorra', 1, 2, 1),
(318, 'RU', 'Europe/Astrakhan', 4, 4, 4),
(319, 'GR', 'Europe/Athens', 2, 3, 2),
(320, 'RS', 'Europe/Belgrade', 1, 2, 1),
(321, 'DE', 'Europe/Berlin', 1, 2, 1),
(322, 'SK', 'Europe/Bratislava', 1, 2, 1),
(323, 'BE', 'Europe/Brussels', 1, 2, 1),
(324, 'RO', 'Europe/Bucharest', 2, 3, 2),
(325, 'HU', 'Europe/Budapest', 1, 2, 1),
(326, 'DE', 'Europe/Busingen', 1, 2, 1),
(327, 'MD', 'Europe/Chisinau', 2, 3, 2),
(328, 'DK', 'Europe/Copenhagen', 1, 2, 1),
(329, 'IE', 'Europe/Dublin', 0, 1, 0),
(330, 'GI', 'Europe/Gibraltar', 1, 2, 1),
(331, 'GG', 'Europe/Guernsey', 0, 1, 0),
(332, 'FI', 'Europe/Helsinki', 2, 3, 2),
(333, 'IM', 'Europe/Isle_of_Man', 0, 1, 0),
(334, 'TR', 'Europe/Istanbul', 3, 3, 3),
(335, 'JE', 'Europe/Jersey', 0, 1, 0),
(336, 'RU', 'Europe/Kaliningrad', 2, 2, 2),
(337, 'UA', 'Europe/Kiev', 2, 3, 2),
(338, 'RU', 'Europe/Kirov', 3, 3, 3),
(339, 'PT', 'Europe/Lisbon', 0, 1, 0),
(340, 'SI', 'Europe/Ljubljana', 1, 2, 1),
(341, 'UK', 'Europe/London', 0, 1, 0),
(342, 'LU', 'Europe/Luxembourg', 1, 2, 1),
(343, 'ES', 'Europe/Madrid', 1, 2, 1),
(344, 'MT', 'Europe/Malta', 1, 2, 1),
(345, 'AX', 'Europe/Mariehamn', 2, 3, 2),
(346, 'BY', 'Europe/Minsk', 3, 3, 3),
(347, 'MC', 'Europe/Monaco', 1, 2, 1),
(348, 'RU', 'Europe/Moscow', 3, 3, 3),
(349, 'NO', 'Europe/Oslo', 1, 2, 1),
(350, 'FR', 'Europe/Paris', 1, 2, 1),
(351, 'ME', 'Europe/Podgorica', 1, 2, 1),
(352, 'CZ', 'Europe/Prague', 1, 2, 1),
(353, 'LV', 'Europe/Riga', 2, 3, 2),
(354, 'IT', 'Europe/Rome', 1, 2, 1),
(355, 'RU', 'Europe/Samara', 4, 4, 4),
(356, 'SM', 'Europe/San_Marino', 1, 2, 1),
(357, 'BA', 'Europe/Sarajevo', 1, 2, 1),
(358, 'RU', 'Europe/Saratov', 4, 4, 4),
(359, 'RU', 'Europe/Simferopol', 3, 3, 3),
(360, 'MK', 'Europe/Skopje', 1, 2, 1),
(361, 'BG', 'Europe/Sofia', 2, 3, 2),
(362, 'SE', 'Europe/Stockholm', 1, 2, 1),
(363, 'EE', 'Europe/Tallinn', 2, 3, 2),
(364, 'AL', 'Europe/Tirane', 1, 2, 1),
(365, 'RU', 'Europe/Ulyanovsk', 4, 4, 4),
(366, 'UA', 'Europe/Uzhgorod', 2, 3, 2),
(367, 'LI', 'Europe/Vaduz', 1, 2, 1),
(368, 'VA', 'Europe/Vatican', 1, 2, 1),
(369, 'AT', 'Europe/Vienna', 1, 2, 1),
(370, 'LT', 'Europe/Vilnius', 2, 3, 2),
(371, 'RU', 'Europe/Volgograd', 3, 3, 3),
(372, 'PL', 'Europe/Warsaw', 1, 2, 1),
(373, 'HR', 'Europe/Zagreb', 1, 2, 1),
(374, 'UA', 'Europe/Zaporozhye', 2, 3, 2),
(375, 'CH', 'Europe/Zurich', 1, 2, 1),
(376, 'MG', 'Indian/Antananarivo', 3, 3, 3),
(377, 'IO', 'Indian/Chagos', 6, 6, 6),
(378, 'CX', 'Indian/Christmas', 7, 7, 7),
(379, 'CC', 'Indian/Cocos', 6.5, 6.5, 6.5),
(380, 'KM', 'Indian/Comoro', 3, 3, 3),
(381, 'TF', 'Indian/Kerguelen', 5, 5, 5),
(382, 'SC', 'Indian/Mahe', 4, 4, 4),
(383, 'MV', 'Indian/Maldives', 5, 5, 5),
(384, 'MU', 'Indian/Mauritius', 4, 4, 4),
(385, 'YT', 'Indian/Mayotte', 3, 3, 3),
(386, 'RE', 'Indian/Reunion', 4, 4, 4),
(387, 'WS', 'Pacific/Apia', 14, 13, 13),
(388, 'NZ', 'Pacific/Auckland', 13, 12, 12),
(389, 'PG', 'Pacific/Bougainville', 11, 11, 11),
(390, 'NZ', 'Pacific/Chatham', 13.75, 12.75, 12.75),
(391, 'FM', 'Pacific/Chuuk', 10, 10, 10),
(392, 'CL', 'Pacific/Easter', -5, -6, -6),
(393, 'VU', 'Pacific/Efate', 11, 11, 11),
(394, 'KI', 'Pacific/Enderbury', 13, 13, 13),
(395, 'TK', 'Pacific/Fakaofo', 13, 13, 13),
(396, 'FJ', 'Pacific/Fiji', 13, 12, 12),
(397, 'TV', 'Pacific/Funafuti', 12, 12, 12),
(398, 'EC', 'Pacific/Galapagos', -6, -6, -6),
(399, 'PF', 'Pacific/Gambier', -9, -9, -9),
(400, 'SB', 'Pacific/Guadalcanal', 11, 11, 11),
(401, 'GU', 'Pacific/Guam', 10, 10, 10),
(402, 'US', 'Pacific/Honolulu', -10, -10, -10),
(403, 'KI', 'Pacific/Kiritimati', 14, 14, 14),
(404, 'FM', 'Pacific/Kosrae', 11, 11, 11),
(405, 'MH', 'Pacific/Kwajalein', 12, 12, 12),
(406, 'MH', 'Pacific/Majuro', 12, 12, 12),
(407, 'PF', 'Pacific/Marquesas', -9.5, -9.5, -9.5),
(408, 'UM', 'Pacific/Midway', -11, -11, -11),
(409, 'NR', 'Pacific/Nauru', 12, 12, 12),
(410, 'NU', 'Pacific/Niue', -11, -11, -11),
(411, 'NF', 'Pacific/Norfolk', 11, 11, 11),
(412, 'NC', 'Pacific/Noumea', 11, 11, 11),
(413, 'AS', 'Pacific/Pago_Pago', -11, -11, -11),
(414, 'PW', 'Pacific/Palau', 9, 9, 9),
(415, 'PN', 'Pacific/Pitcairn', -8, -8, -8),
(416, 'FM', 'Pacific/Pohnpei', 11, 11, 11),
(417, 'PG', 'Pacific/Port_Moresby', 10, 10, 10),
(418, 'CK', 'Pacific/Rarotonga', -10, -10, -10),
(419, 'MP', 'Pacific/Saipan', 10, 10, 10),
(420, 'PF', 'Pacific/Tahiti', -10, -10, -10),
(421, 'KI', 'Pacific/Tarawa', 12, 12, 12),
(422, 'TO', 'Pacific/Tongatapu', 14, 13, 13),
(423, 'UM', 'Pacific/Wake', 12, 12, 12),
(424, 'WF', 'Pacific/Wallis', 12, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `country_code` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type_id` tinyint UNSIGNED DEFAULT NULL,
  `gender_id` int UNSIGNED DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_hidden` tinyint UNSIGNED DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_admin` tinyint UNSIGNED DEFAULT '0',
  `can_be_impersonated` tinyint UNSIGNED DEFAULT '1',
  `disable_comments` tinyint UNSIGNED DEFAULT '0',
  `ip_addr` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'facebook, google, twitter, linkedin, ...',
  `provider_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Provider User ID',
  `email_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_token` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified_email` tinyint UNSIGNED DEFAULT '1',
  `verified_phone` tinyint UNSIGNED DEFAULT '1',
  `accept_terms` tinyint(1) DEFAULT '0',
  `accept_marketing_offers` tinyint(1) DEFAULT '0',
  `blocked` tinyint UNSIGNED DEFAULT '0',
  `closed` tinyint UNSIGNED DEFAULT '0',
  `last_login_at` datetime DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `country_code`, `language_code`, `user_type_id`, `gender_id`, `name`, `photo`, `about`, `phone`, `phone_hidden`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `can_be_impersonated`, `disable_comments`, `ip_addr`, `provider`, `provider_id`, `email_token`, `phone_token`, `verified_email`, `verified_phone`, `accept_terms`, `accept_marketing_offers`, `blocked`, `closed`, `last_login_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'EG', NULL, 1, 1, 'samer', NULL, 'Administrator', NULL, 0, NULL, 'info@bimmersouq.com', NULL, '$2y$10$UhFrhN8Ak5W.2mn1Z.BJ8eZy2WqIHOFYo9IjuTZv9jmThKFEf9CGW', NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, NULL, NULL, '2021-01-07 11:37:20', '2021-01-07 11:37:20');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` tinyint UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint UNSIGNED DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `active`) VALUES
(1, 'Professional', 1),
(2, 'Individual', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertising`
--
ALTER TABLE `advertising`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `advertising_slug_unique` (`slug`),
  ADD KEY `advertising_active_index` (`active`);

--
-- Indexes for table `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blacklist_type_entry_index` (`type`,`entry`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_translation_lang_index` (`translation_lang`),
  ADD KEY `categories_translation_of_index` (`translation_of`),
  ADD KEY `categories_parent_id_index` (`parent_id`),
  ADD KEY `categories_slug_index` (`slug`),
  ADD KEY `categories_lft_translation_lang_index` (`lft`,`translation_lang`),
  ADD KEY `categories_rgt_translation_lang_index` (`rgt`,`translation_lang`),
  ADD KEY `categories_depth_translation_lang_index` (`depth`,`translation_lang`);

--
-- Indexes for table `category_field`
--
ALTER TABLE `category_field`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_field_category_id_field_id_unique` (`category_id`,`field_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_code_index` (`country_code`),
  ADD KEY `cities_name_index` (`name`),
  ADD KEY `cities_subadmin1_code_index` (`subadmin1_code`),
  ADD KEY `cities_subadmin2_code_index` (`subadmin2_code`),
  ADD KEY `cities_active_index` (`active`);

--
-- Indexes for table `continents`
--
ALTER TABLE `continents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `continents_code_unique` (`code`),
  ADD KEY `continents_active_index` (`active`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`),
  ADD KEY `countries_active_index` (`active`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currencies_code_unique` (`code`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_translation_lang_index` (`translation_lang`),
  ADD KEY `fields_translation_of_index` (`translation_of`),
  ADD KEY `fields_belongs_to_index` (`belongs_to`);

--
-- Indexes for table `fields_options`
--
ALTER TABLE `fields_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fields_options_field_id_index` (`field_id`),
  ADD KEY `fields_options_translation_lang_index` (`translation_lang`),
  ADD KEY `fields_options_translation_of_index` (`translation_of`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gender_translation_lang_index` (`translation_lang`),
  ADD KEY `gender_translation_of_index` (`translation_of`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_sections_method_unique` (`method`),
  ADD KEY `home_sections_active_index` (`active`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_abbr_unique` (`abbr`),
  ADD KEY `languages_active_index` (`active`),
  ADD KEY `languages_default_index` (`default`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_post_id_index` (`post_id`),
  ADD KEY `messages_parent_id_index` (`parent_id`),
  ADD KEY `messages_from_user_id_index` (`from_user_id`),
  ADD KEY `messages_to_user_id_index` (`to_user_id`),
  ADD KEY `messages_deleted_by_index` (`deleted_by`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `meta_tags_translation_lang_index` (`translation_lang`),
  ADD KEY `meta_tags_translation_of_index` (`translation_of`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_active_index` (`active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_translation_lang_index` (`translation_lang`),
  ADD KEY `pages_translation_of_index` (`translation_of`),
  ADD KEY `pages_parent_id_index` (`parent_id`),
  ADD KEY `pages_active_index` (`active`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_package_id_index` (`package_id`),
  ADD KEY `payments_payment_method_id_index` (`payment_method_id`),
  ADD KEY `payments_post_id_index` (`post_id`),
  ADD KEY `payments_active_index` (`active`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_methods_has_ccbox_index` (`has_ccbox`),
  ADD KEY `payment_methods_active_index` (`active`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pictures_post_id_index` (`post_id`),
  ADD KEY `pictures_active_index` (`active`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_lon_lat_index` (`lon`,`lat`),
  ADD KEY `posts_country_code_index` (`country_code`),
  ADD KEY `posts_user_id_index` (`user_id`),
  ADD KEY `posts_category_id_index` (`category_id`),
  ADD KEY `posts_title_index` (`title`),
  ADD KEY `posts_address_index` (`address`),
  ADD KEY `posts_city_id_index` (`city_id`),
  ADD KEY `posts_reviewed_index` (`reviewed`),
  ADD KEY `posts_featured_index` (`featured`),
  ADD KEY `posts_post_type_id_index` (`post_type_id`),
  ADD KEY `posts_contact_name_index` (`contact_name`),
  ADD KEY `posts_verified_email_index` (`verified_email`),
  ADD KEY `posts_verified_phone_index` (`verified_phone`),
  ADD KEY `posts_archived_index` (`archived`),
  ADD KEY `posts_tags_index` (`tags`),
  ADD KEY `posts_is_permanent_index` (`is_permanent`);

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_types_translation_lang_index` (`translation_lang`),
  ADD KEY `post_types_translation_of_index` (`translation_of`),
  ADD KEY `post_types_active_index` (`active`);

--
-- Indexes for table `post_values`
--
ALTER TABLE `post_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_values_post_id_index` (`post_id`),
  ADD KEY `post_values_field_id_index` (`field_id`),
  ADD KEY `post_values_option_id_index` (`option_id`);

--
-- Indexes for table `report_types`
--
ALTER TABLE `report_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_types_translation_lang_index` (`translation_lang`),
  ADD KEY `report_types_translation_of_index` (`translation_of`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `saved_posts`
--
ALTER TABLE `saved_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_posts_user_id_index` (`user_id`),
  ADD KEY `saved_posts_post_id_index` (`post_id`);

--
-- Indexes for table `saved_search`
--
ALTER TABLE `saved_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `saved_search_user_id_index` (`user_id`),
  ADD KEY `saved_search_country_code_index` (`country_code`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_active_index` (`active`);

--
-- Indexes for table `subadmin1`
--
ALTER TABLE `subadmin1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin1_code_unique` (`code`),
  ADD KEY `subadmin1_name_index` (`name`),
  ADD KEY `subadmin1_active_index` (`active`),
  ADD KEY `subadmin1_country_code_index` (`country_code`);

--
-- Indexes for table `subadmin2`
--
ALTER TABLE `subadmin2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subadmin2_code_unique` (`code`),
  ADD KEY `subadmin2_name_index` (`name`),
  ADD KEY `subadmin2_active_index` (`active`),
  ADD KEY `subadmin2_country_code_index` (`country_code`),
  ADD KEY `subadmin2_subadmin1_code_index` (`subadmin1_code`);

--
-- Indexes for table `time_zones`
--
ALTER TABLE `time_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_zones_time_zone_id_unique` (`time_zone_id`),
  ADD KEY `time_zones_country_code_index` (`country_code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_country_code_index` (`country_code`),
  ADD KEY `users_user_type_id_index` (`user_type_id`),
  ADD KEY `users_gender_id_index` (`gender_id`),
  ADD KEY `users_verified_email_index` (`verified_email`),
  ADD KEY `users_verified_phone_index` (`verified_phone`),
  ADD KEY `users_username_index` (`username`),
  ADD KEY `users_phone_index` (`phone`),
  ADD KEY `users_email_index` (`email`),
  ADD KEY `users_is_admin_index` (`is_admin`),
  ADD KEY `users_can_be_impersonated_index` (`can_be_impersonated`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_types_active_index` (`active`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertising`
--
ALTER TABLE `advertising`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blacklist`
--
ALTER TABLE `blacklist`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `category_field`
--
ALTER TABLE `category_field`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `continents`
--
ALTER TABLE `continents`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `fields_options`
--
ALTER TABLE `fields_options`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_values`
--
ALTER TABLE `post_values`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_types`
--
ALTER TABLE `report_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `saved_posts`
--
ALTER TABLE `saved_posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `saved_search`
--
ALTER TABLE `saved_search`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `subadmin1`
--
ALTER TABLE `subadmin1`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `subadmin2`
--
ALTER TABLE `subadmin2`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `time_zones`
--
ALTER TABLE `time_zones`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
