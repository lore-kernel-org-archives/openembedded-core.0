Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29818CA0FF0
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 09:40:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.25])
 by mx.groups.io with SMTP id smtpd.web10.47497.1756719630817856614
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 02:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=R3OdtvLF;
 spf=pass (domain: cherry.de, ip: 52.101.65.25, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVQRDPWptx9kfgVCCu86r5iDW4lckRbJV9CXfzhAfEcPGto0ovQTwCw1GddihLidzawQtrFRioEwHhkIMgfVzzfcHD2X/MYmPoZcYFnRgsmNVq/sp+OG6CYYPVRjThN9Hf9OKUJcuk7biYb1x6VicfiSzNZ5GDR1jIHHz7HQHJ+5CIlFQgU6ZWzufX670O1wRVFxZNe9FYM7UtAeWPE/C63iDDZoSio21V+kkOl9g2xlMd1/rF4l4Ec3b6pqe/QMOyexJfnU1HjApmal71U2ZD7N0L/C50B7YXvppM8HQvSwk0wiFlpkR07md0+3glVH8lZBLCE8gEO9aDew6pzJYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqBlQa5AIhbEnsAeAxXp7vTsRo4J9HzaIrwhf89ABWg=;
 b=EtvxaSWX8wceGNFQKEdTiGYQ6ejkdMwCfAyt0PZhrHCaAs+XfoN+KUxOpLQgZ+y6Ou07HTjKf1ojX1zB8gEh5ynY1ypkXnj2htL6AxBBaIsmSl9/SiDq7tC+eYL15lwBSr/LotxqRo3/rubRv/3PrODsxUl//plSx70upnKQIv4Nr7f/aqkRINQLhO/zEp06QMluJPtLPgug2ldLJcM2bYTvy45rDlmbaoSbBvzCBjGrYj7TK9vP7xL9SFUoETGUL+u3Cx1fl32UcbPFlt+pEk0x7DMwneYyXtZpMmT9gqGaIGz3NYCtMoT6/8Z7Jh8aEUFaZlLH6GdnRYuQnW5a3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqBlQa5AIhbEnsAeAxXp7vTsRo4J9HzaIrwhf89ABWg=;
 b=R3OdtvLFfVGtdt1u23pv+54/ILWht7hnc71QLekfSUSkT6nuzfBcUGFqhcmyOIYVHMB63I5KKhygVBM7OiiI2OI2fVJ+2iv9dMz89FV4GqPcy1WRrKPYX2ApavXMUs4FtP45lYxw0Gi8PQg6JjkyQ25CtXHtpYMKgDzh+RKa4Vg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 1 Sep
 2025 09:40:24 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 09:40:22 +0000
Message-ID: <065c6f4c-8091-4465-a7d7-8b3272f940e5@cherry.de>
Date: Mon, 1 Sep 2025 11:40:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3: Address failing ptests on musl
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250822183352.2811555-1-raj.khem@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250822183352.2811555-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0028.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: c938c19a-3de6-4a35-c114-08dde93b920f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YjdLZmhsTGlDYURFckc0TGVnZHdDYVlhZ3pwTjJUd1hUemVTVEUyVmpmRnNy?=
 =?utf-8?B?ZHR4VGovRmV3bW9NWFRUUlpQSFh0SlVKcEUxaGhGa1c0TkJ6ZGxYYlhnelVj?=
 =?utf-8?B?bUNGWXVsVGNvRHgxMHJXUjh2YmlNM2IvYmVVODNjTWVYRXgvaU9xQU1LVFlS?=
 =?utf-8?B?dUYrcFM3WDVYOUpnZjVKcE00dDkwK3lPd0NvdjhWd2hkNlJCcjJjZjBibE5R?=
 =?utf-8?B?UWU2Wk95Z3RPSStJUmhnUFFmTlB5TjVHS2tEZWJ2UTRHYVBMMmZoclJXNDhH?=
 =?utf-8?B?WnBrM2ZSNGJ6eldPdUVqVXpyVWdKNDhVSThFdUUvdWhxOXFhY1dGSFdMdDla?=
 =?utf-8?B?aFp4dWhyaDRJejZyM2MyNHlybWRKdVovcE1kaU9FNEtJWjNUb1VRd3M4Znp4?=
 =?utf-8?B?em11YVZoaWoraVUwOGZBMDE1Mi9BRHRja0VVZ3ZGcTErOW5lVUtHcUhQc2VB?=
 =?utf-8?B?a3owZ1lrU3V2SGdhWGxCbUMxUlZxWTY4OHdiN1BYQ1FSWkRDdlFBOVY5UzVn?=
 =?utf-8?B?dEhsbjI0d3ExTHVOZUs5YkhHYXduVzBDRVFIS0xqMXJDUm9qczVkelA3dUl3?=
 =?utf-8?B?V0NNdmdncStBYld1MjlMaUZrV2QrajRRcncrcUlmQ2Y1YWRWbmJLT2hsQytO?=
 =?utf-8?B?SEh1Wm5lVTlNUDcxdVpUTkJpdjNQVEFiMVhwMFZRU2ZCN2RNWWJ4YVVBRVdT?=
 =?utf-8?B?MGovR2ZOUWFnOTN6eE56bXJoNjY3RTkrL3JsWE5rbk5SdlRlc2pnOFNLbDVV?=
 =?utf-8?B?SWUrNTlqVzh5aFo1RlRGMUZFeGpteHdNak9tUThxWXFKd3J5OWkvd3YwU0Q0?=
 =?utf-8?B?MlQyMzBGWko0QTZubUJCYXZyU0tzSnJUTlM1aDArZ2VHUWFYdDAvVUh1R080?=
 =?utf-8?B?UkNjYmlBeGdLYURuMC9MSjF5MEdqVnplVW4vQlJkMXdhbGwvOWNwMk5wUUFh?=
 =?utf-8?B?YlZ0NXFQODVTMGJ0MVdaZ0Z1dlc4ZWNxMzkvaEVRUUFIQUxpQlViWmVSM2ty?=
 =?utf-8?B?eUF2U2ZDWEVpRWJRdVRjc0M3RCswUlVNaW0wZktHSFArQVJmUmF6VHoyNjZm?=
 =?utf-8?B?ZE1IeC82c214R0lkWEVFQytmRjROelc3RnZwbmlpcVE3cGxsb1FMV24zc2FW?=
 =?utf-8?B?aEgzakxCOUwxMEtWdFM0cVRhOFpXUjN6TG4rQTFndXAySTNSakcxNGFCMlhz?=
 =?utf-8?B?aEJaTm1rRDJjSzB4L1o4VEZ2bzVPUzBvaVZ5bG5KUHFuSWYvWmZ1Qk9ZVExq?=
 =?utf-8?B?Nm1PLzQySnpQVlN0Tm1iS2UyaTl5aVRFL0JsVGFNRi9xMFpKZEorMk5najFR?=
 =?utf-8?B?WjY1MDF2RFhGSHd0Z0lzNHpKN1hrZnZLUFVyaW4rdEZ6Uk02dTZ0MHhEcyt3?=
 =?utf-8?B?UkJKcVpnY1RQODlReHZiYWIwcVVKdHdwVDFlZ0d5QVZGTlNhNGRCWUh2emww?=
 =?utf-8?B?dDk4TDB5RWVTSjJCZThRendHK09GSlZRRGtMOEhvdmZYcVJlU0w1ZUl1ZXZm?=
 =?utf-8?B?UEVhK1NaM1RITXZMQjNCSVdTdDFSNmh3dlhXLy9LWkU0T0QwUjdYeGl3RE83?=
 =?utf-8?B?L1dBd2REOU9pRE5vZXJuNW1WWmFzRFp3UG43ZEdZanhjdE16WFlxUTVBazVu?=
 =?utf-8?B?SE1xNHJJdzg0bHJUUGZVS1RtVGhvRGNSNUlqeEpzTHBxSFNkeTRiRVNWS1VY?=
 =?utf-8?B?bXlDVGhOYi9WYUNRR094aGViZ08ycFlEcU5Fc2p1NDFLUWxPVFBpWmRMejFk?=
 =?utf-8?B?SURudFhFRktCbHFaMko4b3ErRlVaMENjSEFXVHpvNG9oL3ZELzdEWi9uYXN5?=
 =?utf-8?B?N3dKdGs3UStSTk4wVWZVNzVZbmZEVTl1dkJYbHJhU1JKM0RpVDYrM29pTUZp?=
 =?utf-8?B?NlN0RnRDcnZFZlMxZWsvZTZocW5Pdnc5TkVVMnc4cHZXN3AwbTdSV3M4Zmd1?=
 =?utf-8?Q?qYm15B7kScU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UFVXWUVnZXVHa1doK25FalJDOEtHbEFrYTk5WXdnV3UvR3YxbEN6TjJBZlh0?=
 =?utf-8?B?SytTRnNGaFNmMWVqUXZXbmlOSkNmSE96eVlsS2kram1zVmpya1hBMkc1bFBS?=
 =?utf-8?B?djRyYVNJMEdwZFJweTRraVczWTVVT0dVMG1JZFVjVWUwTjF6RGdzK0VBU3Zz?=
 =?utf-8?B?dWtaWUplYzYrLzhiWG5uWGozMmtJUHRHZTUwVTAzVG1wVE0wMWRpRzNFVy8r?=
 =?utf-8?B?eXdERzQ1R01lSmx2VGZwT200UXdjSTBIODNHQXE3dFg2MGUwbGtySUtINW0v?=
 =?utf-8?B?WCs4M0NmR3R3K2pscmZaVzNlWEUwYjNhdUJORlI1a2dUUHhkeUY4Q0gxazBk?=
 =?utf-8?B?eWtoYlA0Y3JobXNvZzVna0NiaDlzaW5jM0ZWYkpoazh4RU4vUXVnRDZYWitB?=
 =?utf-8?B?L3ZTSWhTZ3dndlduMSt5azZldjRFNXVkWks2YTlVcWJWY2t0NVRsMmpudGtQ?=
 =?utf-8?B?UWY1MW1iT1RxVkVGMklPbFRlVWxvWVpySlpUamxBTDIwWFFwcGR6R2RNWWRa?=
 =?utf-8?B?YUlUTlF5YjkwaFh6LzRYZnlvR3ljNm41K0NDbFhRcWdOWW1vZ05mNDllTm9E?=
 =?utf-8?B?TzNoMk5yeVFrMVJPZHg2VmJzMSs2M2FDT1RneGYrRml2NHlDN0pkdlRWUDIz?=
 =?utf-8?B?SmxaZzBCRDZUa2VTa0FvWXh4bE5RLy95TFNLTm9MaExWSEFFTUEvaHFNWXNP?=
 =?utf-8?B?VEcxTFVPSXZMWTdXSkJ2aXJnQUwydDMzNHdZR2ptY2RLcW9PaVBsMHVSTkl3?=
 =?utf-8?B?Zm5SK291VWFPcW5GVkpGNWFLeGt1UzRjalUzazcxclBINnRONUFNTUZoN2lu?=
 =?utf-8?B?bXo0YktvVVBRS3FnQVJvQ2tCWmExRU83aUhxSDhwaUowWk8rS3F3RmdFdnNo?=
 =?utf-8?B?NU5QQlZVRmZrRkVFV0h2S1ZRVC8rQ1FKVENCTnJ1ZVRSNWQ4SHdXU2crRGpu?=
 =?utf-8?B?R0hUZnBIbXU3M3UvaCtmdXY5YytLbFNvZzBLSmN0RjdnQVhKR1hWeXZnTSts?=
 =?utf-8?B?d29VakxtTTlGYytxY252Y0Y5RkFITldnQjZUT0Uzc1B0QlRyZ2VKK0pGcXVQ?=
 =?utf-8?B?SEdaTnIrSVpjWGZKK2RndkIxdUZPZGpuaTJvNzRtTGgwanJFb0UyT3ZnK0ht?=
 =?utf-8?B?aWhDQURPZE1FOTVZbnF3bGR2UVFzQTdseFQ0U0VVTm9KaUx6SHFBWm1hTnpR?=
 =?utf-8?B?Z0lSbnhnc1c1azlzNzd3SnJIWFFYNTRsMndjRW1Rd3hwdm5Fc3g5RExUQm5E?=
 =?utf-8?B?MjA0VUhCU3BTc2NPTVpOeVpUWWI4UlkwbjJOK3E0UUdsWnh6QSt6Z1NkbHV5?=
 =?utf-8?B?ei94MkViZnJKUzJvSDJ2allhYmtzSko0RmhaT3VDV0FrVnMrR3NRS1hISXVJ?=
 =?utf-8?B?V2ZqOHpUZ2xqcHJXdm5HWXJpZjVPUTcyY2E5OHNoMWNhbkJ5NGEzQ0lBcWd0?=
 =?utf-8?B?VmM5c1Yvd0piMnVBTmpUVkFFczJtU09adXJqT0JzK3lRSFJkbCt0M2NPa0NK?=
 =?utf-8?B?RzFzZi80c3E1emZZWmVrdUZ1VENkcUtRYzJVY1A3bEtBN0l4bDBDOEJuVHY0?=
 =?utf-8?B?R3dzSXJ1VDFZT25uWk9Xa1BDZ011RUUvczlwSmJQRDNzdWpnNXJwNjh4eGNQ?=
 =?utf-8?B?NGt0dzUrUzdRaWdpSVQ5cW1JWmU0TFlqbDY3MzlPY1A2SDZBQnRkalRqMkNs?=
 =?utf-8?B?VWx4RHFqZ1FFQUpUczBrS1V2dTNjOEFRdmZuK29rbGx1ODVFUUJtTXZEd3cv?=
 =?utf-8?B?RmpHaW85b3hzM2VVYzhROWdnNmtTTUFjTEsyZEFuN2JMQk0yc09JSHpTVjE1?=
 =?utf-8?B?OWk4QzRMZzNrLzM5bGhSM3FYdlA0R2psQXNXcUZxZVR5ZW9QSUZaWDlSZkMx?=
 =?utf-8?B?Q3Nra2VhZU5IdVBaNXBuN09ZcUFqYWZXQUdROXlhRTZuUHVZdmFsSnR0b2pW?=
 =?utf-8?B?clN2NnN3UEkwNHZyNE5SaVRCWHQ4TGJvQnhrUnFONGxPYmQzMi9xcjhvbFdk?=
 =?utf-8?B?Um9WZjAvSHNENTFneGNIeUhXM0Y3MHgyNFJhczZJaXdXV05RTTBOdks1L3Av?=
 =?utf-8?B?ZGVtNHR0d1pUTGNoQ2tYTDdlRVdaSkczRXlnMlBmUHZ5SG5jcXhuazJoTXhM?=
 =?utf-8?B?U1J4VXhCWGdLQWQrMjk4aDEvUno5Z3EvMjdTcDNhSnZUYUxEY0dGS0toMHlh?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c938c19a-3de6-4a35-c114-08dde93b920f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 09:40:22.2241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Pyz7Wuvua1SGfTIyBg1lenX1lKSelWLK4x5+kqdmaM9OYyVOHNYSLtIwXpLc9+bt0mmc9P34dpWPuxxHH4f57b5UXqiZc2dPtS/DdPUx8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222650

Hi Khem,

On 8/22/25 8:33 PM, Khem Raj via lists.openembedded.org wrote:
> Take a partial patch to disable portion of test_makedev, its also applied
> in alpine. NODEV does not exist on musl
> 
> Add test_null_dlsym to ignore list on musl, it needs GNU ifunc support
> and musl does not implement GNU ifuncs
> 
> fixes
> Failed ptests:
> {'python3': ['test_null_dlsym', 'test_makedev', 'python3']}
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../python3/test_posix_nodev_disable.patch       | 16 ++++++++++++++++
>   meta/recipes-devtools/python/python3_3.13.7.bb   |  6 ++++--
>   2 files changed, 20 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
> 
> diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
> new file mode 100644
> index 00000000000..85767e1e898
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
> @@ -0,0 +1,16 @@
> +Disable part of test_posix.test_makedev that depends on the NODEV
> +macro being defined (missing on musl).
> +
> +Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]

Uh? This is merged already (for a year) so should be Backport instead 
with the commit log.

Additionally...

> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/Lib/test/test_posix.py
> ++++ b/Lib/test/test_posix.py
> +@@ -757,7 +757,7 @@ class PosixTester(unittest.TestCase):
> +             self.assertRaises((ValueError, OverflowError), posix.makedev, x, minor)
> +             self.assertRaises((ValueError, OverflowError), posix.makedev, major, x)
> +
> +-        if sys.platform == 'linux':
> ++        if False:

This change isn't in the linked Pull Request, so this is all very 
misleading.

Cheers,
Quentin

