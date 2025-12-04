Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B935BD2444A
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 17:06:57 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49155.1764868015460900203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 09:06:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nvqjJPxv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=nvqjJPxv;
 spf=pass (domain: arm.com, ip: 40.107.162.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IF2oEEOnqyxUJO1Eb48PaoFzcAjCuQM5OxJvRdjvWsluRUQk9zG3ubAIPf4Ic8ecVOW4KxCQq0dG7Q8UJyJvL/A3CJPZUciQYyqtP4Oo1MXFxivx5UvubLXuejMuZHkt1mh6uQe/lZHMpteM+yjx79TY+H8oUnHDud1iQ/SBiQvYiLr9xATtwb8fNr9o2dN0QCjo7nSKTdo3uvPpae7ypXGfMnb/Tl8cCnH/UuWwOXOqQIQDMFVsF+Cw2nwn1WN+ilAOCHT43dskJm1riMXF8bmEC8jI4Y96vUlDmoxfPvRWsByiIGYJp6maPN60ankuqKU7U0dM3EANcc6obpaNzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JvYCcrg/jS6nvIQ/3744VkX555diMfBIDp/RSHLof4=;
 b=QXjEaE+i4zhhaXLHfqrSkg/3R/tyaTzhZB1gKK6ZhkF2cJTOum3i/PPSKdO3lec7VAO/clmfraxWV8wrf9qYut5fokV3Kvkq/kpPdQi9OoeirA+T2GbE/AbLUwLDR/nwN46/Oz9Va7jOtzhhKDrEwrhLSdxHj701JbFtW/Ojr2C8FRoO5CF5py/UFqBc+SFiITnuj+3tKE1hZDT/TeDMvfAZR69cHYK6EAcbKFlG7lKA6A3s+SLeVfdvnRbawD9ZMhb/UBB3Fak3sH5u5oiov4fYRZAcEFsMoksgHGfXDHsrXG00O7jK/ZPvJFlrao2H0ZmyXxukSyzTFydbrMjZPw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JvYCcrg/jS6nvIQ/3744VkX555diMfBIDp/RSHLof4=;
 b=nvqjJPxv9XuXXL+6FUEqUtpi5RpS/TKfAWG2mRRxipcNDlsyGEyb2k8RFCEElWBnwCNw7fknaFqLirZTg5I4h3wq6PBxM8WIab/eqdTiWo5b+WhRXuPgsHpYoKIkPAHU+EjGchXrGS1fjpJaau88ufHPllSv95cLXk3Spv4RcNM=
Received: from DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) by AS8PR08MB8684.eurprd08.prod.outlook.com
 (2603:10a6:20b:562::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 17:06:46 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::76) by DUZPR01CA0056.outlook.office365.com
 (2603:10a6:10:469::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.10 via Frontend Transport; Thu,
 4 Dec 2025 17:06:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Thu, 4 Dec 2025 17:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXg1fYU9NZC1eKmvzboyeg+my9WJOJKHdhZ9MsYkeEBHLFIsLa9S7Xc7YdTXRX2ikCwY2JDLjuWB4pez4AV6tQwGAzYbiDvWcQVPLKmgi/J2KMJMYp4cgyBU0fbL7yEbSYezSxzjWA2Ou6dmL5CnMjR9gwZL3nK14rAMquQxFYjfZvSsNZqEo6a/lW0Vzjox2zrhDz8tsCinOv7TkPGlzFHEfY+/EPq+OpGEDb8t+NeLvf5pGKXS62jV8u7vAEfXa47+pQjcx0yp9Ue2pyEQC/XLxluHWSadYovwCLl6lqtqIwyziG2m0itTH4EQDUcG50/UJhDisHFJl9MDDXeZCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9JvYCcrg/jS6nvIQ/3744VkX555diMfBIDp/RSHLof4=;
 b=K0VvcVX73GYve/2KLOWXMC1VFnr9umTJ0e2lRGOdVtCumA4t2OE6/F6EsQ+dlXIeP4SM4ibNipSSLwcjxN9xyF2mpdgDaInGHgvAqnINA9pjhN0efO3fd0iKuj75IenB8EpoG806ntSBIV/wDwJVGmUJI2E1H463b2gqsc0ato9esEHiW4QsyGYwxMq1zVg2pT7/zpTmeY46XmdVKscTwFNw+//7wPzrAQ1omem6RW6VOWlzKavyzR2FWrMwoxbLhU7iAsBtZ2crCFLEK02eBthKteXMCT3dvqd4SAwGZx2y8kXojBVWt6RJyVCKM993S4s1lN5DC3vc/6krv84hdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9JvYCcrg/jS6nvIQ/3744VkX555diMfBIDp/RSHLof4=;
 b=nvqjJPxv9XuXXL+6FUEqUtpi5RpS/TKfAWG2mRRxipcNDlsyGEyb2k8RFCEElWBnwCNw7fknaFqLirZTg5I4h3wq6PBxM8WIab/eqdTiWo5b+WhRXuPgsHpYoKIkPAHU+EjGchXrGS1fjpJaau88ufHPllSv95cLXk3Spv4RcNM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8635.eurprd08.prod.outlook.com (2603:10a6:20b:563::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 17:05:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 17:05:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Thread-Topic: [OE-core][PATCH] libpng: upgrade 1.6.50 -> 1.6.51
Thread-Index: AQHcX8ggZry0OQl7NkuZHnG9VLUiYLURwNUA
Date: Thu, 4 Dec 2025 17:05:42 +0000
Message-ID: <7215BEBA-C123-4930-8A4F-A86723B660FB@arm.com>
References: <20251127180259.3347636-1-peter.marko@siemens.com>
In-Reply-To: <20251127180259.3347636-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8635:EE_|DU6PEPF0000A7DD:EE_|AS8PR08MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0eb2d2-47d8-4122-2bba-08de33578106
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?ec9YEILLcx4FCZ2ed1x4h5qXrfH4bzs5E9stNVcNkoPKUHImEC+oQK5YW6ml?=
 =?us-ascii?Q?YpcnkvcAUMAZxFBgMrsvO6LRou/WYGQSCgTwLkaYoHGpT2Gs+pDCixP8GY8a?=
 =?us-ascii?Q?Tu/GGbRZjvxXM0WDeE+WK9BxHWvkopIz74qU0TTsoV9QJVZfG/HvtrWUdfsu?=
 =?us-ascii?Q?5nArc4sAS5SiDT4ebYt5jwT6MPdt4wghLpTnXqV7rbkVA822srmMvrd3JWxd?=
 =?us-ascii?Q?Fn9923eVjiiBcKPQzVh4KpMXvR4w9/levcaQTSNLVoDxJ9eqbhgiJSHuv0SF?=
 =?us-ascii?Q?rrpujl6MIjrVXpfao4jJJmXcaLGrxoVJWcUqkRzl/Uf6OEn4kQu5VdZ6adTV?=
 =?us-ascii?Q?J9/xnbqlqLuP/Poj0rfILqHsI8voM4F+Yxv4X1gC5pNlvHxfdPaO4C+8n/Oi?=
 =?us-ascii?Q?rYsBD0SxT91ixNXFvbUaOICvfGPMfd4jcYL7tY5tOVzLClWKHtzMdQg8TMTj?=
 =?us-ascii?Q?9yCYCqQ/VFxRO0FgyXdEwDxtpjVR3PXQqcq6a8VuO7VKC9P2TZReeH4epMrN?=
 =?us-ascii?Q?iN26mRiS+EjnpwSeMyDVy/G7W4QtqBShaypERkAzOmQ9f9iOCPg0rhKC8TQs?=
 =?us-ascii?Q?94GUMX1Ilq6RrOyAOAGhPIjekQSN8fy3FrgWHKlgowhd6H18ExT+5tVLtkYE?=
 =?us-ascii?Q?7ZyirEmOcF4NGi3N1YnOAQQEkWgcVy6IZPErxGMVbDhi9+GtYzjMoXbaH5mS?=
 =?us-ascii?Q?HRhbDvbT29RdsGkKzgk/Y3Gtkjw5XzjKdVCpHA/0/mNWtaq1cH2X+ngI1ywh?=
 =?us-ascii?Q?xt9l0Mr1X2h/lMYyQ6BY8HIz/EPdJquvkpAJb99LneaW/s2jBAFmmyUHAaai?=
 =?us-ascii?Q?j+H8+hibwog3qyDvHhPfi91xCkUgEceS2YS8UWG+FYlEpMAHA1hJQKRHeZ/C?=
 =?us-ascii?Q?GpbtLeHwV++5G2DHdqpQuU/WBzxesACPcUj+g8Urg690f/0Fao96+YOTZ0SD?=
 =?us-ascii?Q?VQtUcEETSiPs7zQ0cst5lw3inMbAvp8LikjNMccCE0dnKOZLc7RzsiT3t1OV?=
 =?us-ascii?Q?fvBLh5+kqoQnzTsyfmFPfJ233htzQSiLmPUqNkSuyfMcDkOvYYLoTJfsXveS?=
 =?us-ascii?Q?NxoFfpAiumfUTXjxfGESikPUEUZgsH97Bx3GPAFaxoxDd7N3HhBGuJMFyDHK?=
 =?us-ascii?Q?26PU4O2C+GHeUyDRs0IZCkbr9XjkgfqA7T9U9wq7T1952MDd8zZS3Kbo7pFg?=
 =?us-ascii?Q?YydA0GVRPIEXUY9GJpsJFTPSjxbL/pdyeWvsgaauJka0HAdUPrhDPzT0dXzi?=
 =?us-ascii?Q?938k/F5sHaHcc3UQNOF22hggNhYaVX/6iQkKYpYiAoYd3sq+CgiNaa/hUTOi?=
 =?us-ascii?Q?ZLtFcVBgVmXdf4cEtUdJc5cjCLFhrpXS0XuBySDYk/ICQm0aIBdw/4HlniRK?=
 =?us-ascii?Q?rzaiaFNs1NXElaVB3wjiYHDZCi+pt/hyzhqebDeGtu+j58DNlvnrLTOvnxeV?=
 =?us-ascii?Q?abVAf90jX31DNp+MiMjvuzyHzECDEQMFPpVehLSNW/H2xRYproY7Gg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <46676FFBC3714C4BA2C40144AF5BF497@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8635
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f020454-24b7-4cc5-28a9-08de33575bb6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|30052699003|4022899009|1800799024|82310400026|36860700013|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qGp0fXLSVm6jCiODsgcSGlb56w2gezeiglVsXqIV+qpeuie72nUXHORaytbX?=
 =?us-ascii?Q?bGm6KmCCosDew6e9z/nSuqzA1Igngkerm0ujSzpPHiGtEo0Mbm5ieIDEt0c0?=
 =?us-ascii?Q?i6J8ShPXmzK9ooSp5T0Dd9xfbBaaOi4dMfE4uprPrOM/keTS4BqVwkdIUQVX?=
 =?us-ascii?Q?ijPKIlifC3CMtkdzm5BWKYLzco0aSaQKIKsxshW4cybt6851+jKkMLcixj4o?=
 =?us-ascii?Q?ZBAoHz4cT02o6pzyPNBAHYkwKLGaaYVJoU3o2kHW9bk3tRL1va3/oSSRauKU?=
 =?us-ascii?Q?D6JKp80ue1ft6dX+c6fdBTgEqvy8RuRohrY/9iqy1HuPFSeVoUpK7yB+27ID?=
 =?us-ascii?Q?DjMQIDTrNEyXM9nCKStabNn+sFjV6vbdET4dBbggoF7RwzzDm0urGy4DLnNT?=
 =?us-ascii?Q?TmCgmNSJ2xCXyYNnsiwx7BvCCeMXvZbKDYI5Zl0xomNwUY2q4lGRp6BK4qiV?=
 =?us-ascii?Q?jyPCHHQ8WgUBmjA3La+Jq1DVBcNpbM7TCR+HK9VAEmkSxiX2pYtHqZ8kZNf+?=
 =?us-ascii?Q?Yi0v4ADYw9lW/8y+9j5/aXQWtmlna4imnRAd9zOrPajFdK67HEPk2bZaAq0s?=
 =?us-ascii?Q?nYB9TkumNQrfOdZpzsFhvwd/WCd8ZBs75TlB+1Ia/v/x803JD0y4MEj7pDJB?=
 =?us-ascii?Q?jomZXsnYTb4eeyDk3frgNxnlrcIVSL0WpdUQZxdivUNjSjsbWRfTvJb+7ffu?=
 =?us-ascii?Q?YQNWyCtXp3f/MlAdDrLEvacTMJ44rZSes7cbGs+GYd2t+vz5gqaZ8weHMMlw?=
 =?us-ascii?Q?fQCxlme+KSjmml7H0PXCNsJUua+14nSgMQMGEbhB4u4OFRmgHaUh0QhIc3Uy?=
 =?us-ascii?Q?8QEsdBYEb0Ug86xS4duEWk98I1TBIQnvEy2/zrAKc6XJyKoShIxKE6bKcF9L?=
 =?us-ascii?Q?ctiZNwayug4bX5evAoyqXfprA8wMn/Te0PbeW3CNYVmJouGYqyXGR8oQvp0/?=
 =?us-ascii?Q?gm3WDSa4wLgBRZEOCo5le5rCBNp/EG52k2lCJ0yjzTWXThvHyrJHkqaYpvl0?=
 =?us-ascii?Q?XeAV/9I1/6GeMOWINj52lpTaGZonREDc8y+Z2zn3qFlGfDyhlLwH1Eq0isHi?=
 =?us-ascii?Q?AI8n9iw8tkFQ5+hp/90Tmq7iCXHSzdS6YBBH3VAjqSlGiBdzWQPL0WBShGXa?=
 =?us-ascii?Q?ZNK0VYpTbJgActqLmacU8ZqtUXaY1Uo8sH6XFTtSqDTsIFfvPTgpA5evjHDT?=
 =?us-ascii?Q?XRePavDV9jf1wnk3kwkMKg1vYwJga5et0opwe66rUVQixee5DnkS5O5IMAiu?=
 =?us-ascii?Q?rAC+vtLbxgPEQk4izPKh/O8Ihbb3q5khd5KAUoO8g1QcSXRVps8KuUV6TdZV?=
 =?us-ascii?Q?oADjvN0wB+/HELfixNcWmbRylDKntiNInVEnJFYubTvMamP2f074Xzb0ZRzh?=
 =?us-ascii?Q?chn8MRQSmbohe/Wl+YdxHuBlz5MVerkbM7Y2ZMvF/UGk8XcJtrbDBYm+EqXc?=
 =?us-ascii?Q?rGjcXAepV+TWWwoLtVuIo7RI+HFvW2lavBeKWlIQT/YBU9Pe9Ly2uX6uN4YD?=
 =?us-ascii?Q?OqfpzoGfohbTKlGOXxUd/3n0SYdiUEZaDb3p?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(30052699003)(4022899009)(1800799024)(82310400026)(36860700013)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 17:06:45.2535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0eb2d2-47d8-4122-2bba-08de33578106
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8684
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 17:06:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227307

Hi Peter,

The URLs all change, can you explain what happened?

Cheers,
Ross

> On 27 Nov 2025, at 18:02, Peter Marko via lists.openembedded.org <peter.m=
arko=3Dsiemens.com@lists.openembedded.org> wrote:
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Handles CVE-2025-64505, CVE-2025-64506, CVE-2025-64720 and CVE-2025-65018
>=20
> Relase notes [1]:
> Version 1.6.51 [November 21, 2025]
>  Fixed CVE-2025-64505 (moderate severity):
>    Heap buffer overflow in `png_do_quantize` via malformed palette index.
>    (Reported by Samsung; analyzed by Fabio Gritti.)
>  Fixed CVE-2025-64506 (moderate severity):
>    Heap buffer over-read in `png_write_image_8bit` with 8-bit input and
>    `convert_to_8bit` enabled.
>    (Reported by Samsung and <weijinjinnihao@users.noreply.github.com>;
>    analyzed by Fabio Gritti.)
>  Fixed CVE-2025-64720 (high severity):
>    Buffer overflow in `png_image_read_composite` via incorrect palette
>    premultiplication.
>    (Reported by Samsung; analyzed by John Bowler.)
>  Fixed CVE-2025-65018 (high severity):
>    Heap buffer overflow in `png_combine_row` triggered via
>    `png_image_finish_read`.
>    (Reported by <yosiimich@users.noreply.github.com>.)
>  Fixed a memory leak in `png_set_quantize`.
>    (Reported by Samsung; analyzed by Fabio Gritti.)
>  Removed the experimental and incomplete ERROR_NUMBERS code.
>    (Contributed by Tobias Stoeckmann.)
>  Improved the RISC-V vector extension support; required RVV 1.0 or newer.
>    (Contributed by Filip Wasil.)
>  Added GitHub Actions workflows for automated testing.
>  Performed various refactorings and cleanups.
>=20
> [1] https://github.com/pnggroup/libpng/blob/v1.6.51/CHANGES#L6281C1-L6305=
C47
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> .../libpng/{libpng_1.6.50.bb =3D> libpng_1.6.51.bb}           | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-multimedia/libpng/{libpng_1.6.50.bb =3D> libpng_1.6.5=
1.bb} (89%)
>=20
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb b/meta/recip=
es-multimedia/libpng/libpng_1.6.51.bb
> similarity index 89%
> rename from meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> rename to meta/recipes-multimedia/libpng/libpng_1.6.51.bb
> index aa2dc99f10..8cfb914917 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.50.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.51.bb
> @@ -10,13 +10,13 @@ DEPENDS =3D "zlib"
>=20
> LIBV =3D "16"
>=20
> -SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.=
xz \
>            file://run-ptest \
> "
>=20
> -SRC_URI[sha256sum] =3D "4df396518620a7aa3651443e87d1b2862e4e88cad135a8b9=
3423e01706232307"
> +SRC_URI[sha256sum] =3D "a050a892d3b4a7bb010c3a95c7301e49656d72a64f1fc709=
a90b8aded192bed2"
>=20
> -MIRRORS +=3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOUR=
CEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
> +MIRRORS +=3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_=
MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/=
${BPN}${LIBV}/older-releases/"
>=20
> UPSTREAM_CHECK_URI =3D "http://libpng.org/pub/png/libpng.html"
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226855): https://lists.openembedded.org/g/openembedde=
d-core/message/226855
> Mute This Topic: https://lists.openembedded.org/mt/116504477/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


