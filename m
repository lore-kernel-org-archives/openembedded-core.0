Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC96C77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 16:50:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.web10.318.1750697448427283124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 09:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Meg2WnoS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Meg2WnoS;
 spf=pass (domain: arm.com, ip: 52.101.65.5, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NayimEL2xKL9R3l9Y1zUzlBWF7v4xGca4Nf7wsZzttdKCQS2AonvW04k77qZ+pTxuH6bBzud8b2OTv+nDDcwfOx22UpbLmJvLflU7WcOzGAC8tIYtzze0v3BjpwG6Z5AJKswZ9MloSK2Yby9optOZkcEtWytJnNnq/v83t4184bS+ZuKzMm/SrSXJoVQiOerBYPIPKbMi8/ckt/GTx4rS1t2KrYtnaJ1jSAT+nxH0mfgTmFrD4cj8yOC9+G9+FIK/2iPeHEFzkf9fSzqUcTye+Xr/4Rjq3Dc9PyGtMzGy+02p/RP6WPk5sZT5LgSZwGkafEPiYQdtXrnDrsbQRnDfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyjQBeaQC49+pkgDvYFwvychFKD9YW6XZJky39QKJQ8=;
 b=gOpD2gSS2Bj3Zbf7Adzr4LK+pjxdMeMb30BcPWQ8Hkd9+7xM1W+yc9rrRfs4uGxbW2CWu4PunAHMnAqJW8vOGOhC03v8Rs2iszIrPiELXoCucwGEf/XIVj7rK9VS9pNQ6RM5ekzhahUcoHV9CW+9QjHuw06K0FY5vqteBwYiHbybGVgSHjbdD+jjkOygWrJ6L/h1m8YkWo9zGIskb4WQi0u8xXz56QoenG2/ybkLiW0YxS/YgBdq0V5mbhCO6BIcI5kWTSrvBxLAcVxTncxKzcEz/AT9+7B8Xyy9BRUgbW3d8cx9Ch9TPT3Yovt6WlrjSzFfA5j1iLRVpUsYHc0d8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyjQBeaQC49+pkgDvYFwvychFKD9YW6XZJky39QKJQ8=;
 b=Meg2WnoS0XYNr8bErGfFmTpAAwp/EX/LE4KXSTl1g/WcT+Ck/OwVp50rhm1jpcfmSWcvdJiG42uunWI5g2HJFgrTE9rzFqYyTCmjacvXbT4U9muyT1KGXgIDamxCWbtRsEIv5PRtUZ2hn1jsHRRtwtggzP4HGYxPQVJ4aOaSq1U=
Received: from DUZPR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::18) by DBAPR08MB5558.eurprd08.prod.outlook.com
 (2603:10a6:10:1b3::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 16:50:44 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::95) by DUZPR01CA0068.outlook.office365.com
 (2603:10a6:10:3c2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 16:50:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14 via
 Frontend Transport; Mon, 23 Jun 2025 16:50:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+r/yuYxhbYcGOMjG+a1FoXZM9qBW01tKpW+DQFTwRn3w/2hcKLdu+6UwyL687d5jc6OOImibAnf8L15Fc8dVyXGWTVn1xUr4k5w5bIVG8+vdeRQCVo3kWiG5HO7g6GkBg724NCKcz2LusXmqkJuJLpaLzfnkuXQSGimYvAnSgh/QOGkNT8X7NK/TX5tA6DmNYWGZTpVl+fM3xKlvS+aiZEIdbeT51+4aeXhgwjVPwu6k0qxqT2NOhCD41ACsrfInF8y3VmrxvuofhswXeKZ8tlfFfTx19OyU3mhR3u2QD5JNQ4jc5tyquVBu8mJsjHfyut3zMgxQuSN+JQn3FoknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PyjQBeaQC49+pkgDvYFwvychFKD9YW6XZJky39QKJQ8=;
 b=ZlxC7CFAH9JvWxTJaFFQC6kpPq3mNWKKt6NJT2JRLZe3v337IiDjWTQs/NriX9xxpNJPQSXfHT8GMl6TvYJxCK5yZO4RhZdo7i9xitalgRV+xA71tCyh17E0Gt3mYfl81GBqkUQ7JDiNJkQyvbC+3dHCs17FAHdY54FBS5DyfElsUvmjj/izJ6K0s0G2pAu2c6NWHa27pYHlcx9JQq6gsPhpSUwrlSmi7W/MU+2yPc6Rx0PS3vyBaSp4eOw/5Bx8yLLscZdVGfCyx+FkBqgvTsk8eA63gh/blhRPQbyR/9YgSeRzQvdlTYTXYSc0/dSh60PhkOp4LwDQ2zMohau4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PyjQBeaQC49+pkgDvYFwvychFKD9YW6XZJky39QKJQ8=;
 b=Meg2WnoS0XYNr8bErGfFmTpAAwp/EX/LE4KXSTl1g/WcT+Ck/OwVp50rhm1jpcfmSWcvdJiG42uunWI5g2HJFgrTE9rzFqYyTCmjacvXbT4U9muyT1KGXgIDamxCWbtRsEIv5PRtUZ2hn1jsHRRtwtggzP4HGYxPQVJ4aOaSq1U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB9011.eurprd08.prod.outlook.com (2603:10a6:10:431::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Mon, 23 Jun
 2025 16:50:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 16:50:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dixitparmar19@gmail.com" <dixitparmar19@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] meta/meta-selftest: add selftest-hello-mod
 recipe
Thread-Topic: [OE-core] [PATCH v3] meta/meta-selftest: add selftest-hello-mod
 recipe
Thread-Index: AQHb4n6TaTv9hM0o0kWhCBD4QjiF7bQQ+LuA
Date: Mon, 23 Jun 2025 16:50:11 +0000
Message-ID: <A36DC5A7-62C8-4208-B5AF-72F16019A6D0@arm.com>
References: <20250621073137.47743-1-dixitparmar19@gmail.com>
In-Reply-To: <20250621073137.47743-1-dixitparmar19@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB9011:EE_|DU6PEPF0000A7DD:EE_|DBAPR08MB5558:EE_
X-MS-Office365-Filtering-Correlation-Id: a028a80f-2339-4825-6d4c-08ddb2761856
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?djkyT2toQUlFNE5sdG9HTTFsa2Y4czlMT3NUZ0VDSi9UT29USlNpcDJXaGNI?=
 =?utf-8?B?UFhPcTUxaWJnM09na041ZERFeENqbWIvUWtWTHpGWVBycW4waHU4U2gzZTEv?=
 =?utf-8?B?aUhXbE5xMmRNT25Gbys2djNIT2QyY1pXUmFGWW9aNHNHazZBVXdFNlExbEpM?=
 =?utf-8?B?U25WQnhOc3JDaWR4bFZJcE9ocjU1dmNnMEF4ZEQzU1hWZEpYL2hpdi9lMHJz?=
 =?utf-8?B?RnRTL0hTcnZ3QU5ZUEkrRzR0eTdWcDVyYk50YXg4elVUVncwYUpuZGVwckpQ?=
 =?utf-8?B?bWVYVUZ4aTQyTjY0di85OE5TZVl6TFE0eDVLUWtkVHU3S3M3Z2hUNzZtWlhI?=
 =?utf-8?B?Nkl6clJrdTV6eGMybHJoQjVsc0U1bnVpY3JDNTN0KzlJZlBXa0oxSGQ2bUJx?=
 =?utf-8?B?Z29YOVVzYXEzcUgyakd6VUgrb0lENlNUT2xVNkx0ZUdDZEFYS2h0b21vYlYr?=
 =?utf-8?B?L0R6Y3lkbXRVdHJBVjk0eDV2bE9ubTRkUzJDU3pOY1huNGEweTBWTHg1aHdJ?=
 =?utf-8?B?WU9lT2l3VnVHV0ZNRkdGSFNyNE9xKzYreHErWmJEbjQwQXdLaGhUdUErd3Bv?=
 =?utf-8?B?RmozMmljQlZKL2Nsa0Y2UXBrbVNDd3JkZU5QdXVxZ3lJT3NNQWhyb1BURWFJ?=
 =?utf-8?B?d2F0d0VpUVFVaWJmU1ZwaURsWmkyWXZFNGxlVG1HU3JMMldnb2ljWStUdS9S?=
 =?utf-8?B?dWN1eDBzN0p2NjdFMms2eEJBQ0h6d1JhL1lrY1JnL2djOTBLdndnOXBzbzlX?=
 =?utf-8?B?dGpwTzFwTVdEenI1V3czcFFQM3dDYVUzL3k2dkovUkFRRGxJTzE1RldRa2RF?=
 =?utf-8?B?dlRuY3lLd3hqN2srajc5NGlVSmVieVpQMlJhTFFhMXIyOWRZVGRJanBiSVJP?=
 =?utf-8?B?TE1jVERzdlQ5bUNvTE1pY2JtSkMra1I0V3lBV2t2T1JMUEttV3ByeHMwRVVt?=
 =?utf-8?B?T29WSGlJYldJQnlFb2kvcWFWTElvYzY1RkxkdFZXMDNCQnkzZjZKQTROajZz?=
 =?utf-8?B?QzIwV1llcDVpVmloLy9PWjh3MFlDRE1KN3kwNXRwZ1U3cTVKaHJlQkZicWM2?=
 =?utf-8?B?MzRmOWI5SzRoVitraHlVaGVJbFdaRHQyUDVUd2toM3AyRkpoUDNDZ2dzUDdU?=
 =?utf-8?B?cVFWV2hvSkRZUlViMFJUUFlJT2JnVzB6QTE2UXNnNzluSnU2RVNOaWtSMkZF?=
 =?utf-8?B?VWVqOThPUUdXMnNWQlFRWjQrL2dGTFdid3FjSnNaa1REL05zeEJwRDVhVkox?=
 =?utf-8?B?Z09ySlR6QVNZZ2JucFc0Y216aFl0NjhYdzdvcU4rNHNrdjBublpkVmVkeC9q?=
 =?utf-8?B?eVFaamczRkpzRkdCc0paRUtkUitKVWpFWS83b0FTeFBzM3BIbU4xbGdaT1ky?=
 =?utf-8?B?Y1JDaUFFRGhDZEhEVFNQN2lzdWJtSmw2RWgrODhoMi9FOVpuYlZ0MHE2VDBt?=
 =?utf-8?B?SnV6OFBvRzFVRXpod0tNTXdpSkpEOFhhRTE0UFZINXhpenNGdXRGWit4N1dO?=
 =?utf-8?B?eXR6UmR0VXUrWEFycndUWlh0Q2VZQlQ0RnRMK0xrSHJ0TGlHNE93cjFZY1Jt?=
 =?utf-8?B?dGZIS05VL1UzNUs3TjBmOTBKR0phYTZWb0ppNy9VbU1DSnRUeE5iS0luL09w?=
 =?utf-8?B?aENudkR2T3FxNHMwN1hpWnMvSkJWdm5lVTR6RlVQTWU2MlJnWGI3NFgxLzQ4?=
 =?utf-8?B?Q1hXalNNZ1FHYk5TWEtUTTNJd1l2UnRJTW1FWHpEeTRCRWpaVmltK3Q4TnBS?=
 =?utf-8?B?enhGNUtnd0V6M1Job0lya2tXdEhkTE5ZbmVoUkgwMmJZWlFoQWV2dm8wQ0N1?=
 =?utf-8?B?dDhMalJEbXB6NGIzMno0SXdIb2VDVWJPWWFyZnFGNUhUMmFGcmJURmFRdkN6?=
 =?utf-8?B?M2puUGlYRkNOb2x1Y0RDbFJpcG5KQ3BXeVVoQUhpdWdONmdINFdRUDBpT2Mr?=
 =?utf-8?Q?7Ixr4jB9rLI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEA770F6E98EE84FAC81AC060EB376E2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9011
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06d1adac-5875-4791-3fc0-08ddb27604e7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|36860700013|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkdPc1ljNG5tcGVBMU5CZEtsakVtZ3FteW5uS2FrTmR0bFlKZVJIazlwT0FY?=
 =?utf-8?B?YmVhbU5NeGV1aC9zTnlXOXpNSmtCLzgwOE03eVJDbEJEVkVtVWlIRHI5KzZk?=
 =?utf-8?B?NWt0cytEREI2cDdXMVRjWXNpSUYxZ2xjYkpDOGtkR04reEY4eTZDSk9nZ2tJ?=
 =?utf-8?B?OTdJQUFpS00rdDBEbk56eWlsb0hlTTJIYUg4ZnJua1R3WHcvTVNrSEtKZ0Rh?=
 =?utf-8?B?NTNVNHZTeVdtYjhHdXdmYTFMNlF6M1U3V1lsdENXaWdLR0ZYamxKaWpGK0Fp?=
 =?utf-8?B?djI2Q2czaDAwQ21MajBvVXg1MTQrYjRlVzRySWxNUFNTcWZ4UzUxWksrRU1p?=
 =?utf-8?B?YThQeDc3eURXQkpINnlrTjFTeGFiYk5BbEsreElmaFVmdUorRmRtTHd6S1Yr?=
 =?utf-8?B?OVFNVDB1MEU5OWdXZXJPcktaRWFOSHkwSXoxdm4wY0ZXTFNvNU0zZVFkZHo5?=
 =?utf-8?B?cWZUakxjMWpxd3N0N3FYRDUxSjZRNEtqQ1NQemFiQVg0S2FUd2JRR1pFb1Zm?=
 =?utf-8?B?aitGYjdjMGVJVVQ1cm5LSHBVQk1TT0NZcXRhdnlUMFNqVWs1UXp1UFovcUFn?=
 =?utf-8?B?ZGpTQ0NiNFBZSFFJUUJUZG5Sa2dHenR4bHZCSmNWV09GTkFNRmdjcnh5dSsr?=
 =?utf-8?B?TGwwalIyY1ZZN09hS0lEUXZUYStDaDdaS0NML3h2ZmtkTUczNzRmblB4Q0V1?=
 =?utf-8?B?ZHpxd3RXVDYyMGZMZnY0bUwxRlNhNHRKMWhCR1hOc0pIZnhzdTJNeHJRcDNG?=
 =?utf-8?B?ZVY2RytvL21wQmdsc2wzUGJLT3ZQeUMvZjB2TmI1WE5tTEtJUVBybzAvQ1NO?=
 =?utf-8?B?eDRnUElRYXdwMFB1MG5BbUh5WDRya2dtdXFaclJMR2JKU01JcExxb3hzWUgw?=
 =?utf-8?B?WFBNNjdxUzRLaW43S09FaWlLNTJsNHlkZTRqeUswQjE5VXNWMGFBVFBoekpH?=
 =?utf-8?B?S2h2VFdsbWlPWkZROHJNTEFKd1haQ2VDUVFZVEkySHBQeWI5ZlV0NHhMQVhW?=
 =?utf-8?B?bk96akNGbEZPVHZzR0J4VkRtU2VjQkY2UlBHM0UzdHJHN0xjOUJqOTJ4WE4y?=
 =?utf-8?B?TDdpei94VUVkbUh3bm9ZZllFbzFISGtsSnVrU3BlVU9PaDFRSHM0TjNWV1pJ?=
 =?utf-8?B?cnhEWkxHLy84WllaamRsaG1rdXBBQitYR3I0UmNWVytwbVpBbTA2aE9QN2Jz?=
 =?utf-8?B?S3RiWkJPWWNaMFdGTXgwR0RLby8rcmNCRDFEYnBZSmtMa05JNXljdVhJVHIz?=
 =?utf-8?B?WlNmWHB2Tm4zSmswVmljeTV6WmthVXBJditmN1RUeG4xNndYcmJjY0swSlZq?=
 =?utf-8?B?SzhuNk5EK1VqSXBMOC9KemNFYmdBbkpsZU5qMGVwOTZDbldvQXhLNDJXVmVH?=
 =?utf-8?B?RldwdlZBRUJpK0lPTG5kV1gzaVNEdnpMWG51MGphWUdJbE9WYlFKMjlKbXBt?=
 =?utf-8?B?aGJNcG1vZHNDMGV6d1VrU3I5cEJzTXFxbXpWYXdYb1Vwc0JSZ2JCVXl0d1pS?=
 =?utf-8?B?NkJFOHJCWER6dDNMdkQyeGlIRU11c0hxYS9hN2l1YVU3Q2hKOUJ0WWZNWVRs?=
 =?utf-8?B?R2ZqcVJ2NllXWEtJUjk0OGYyWndBQzEyME42V3hEMVNLeXVDZ1dxU1RyOWl5?=
 =?utf-8?B?WmF4Qm9LY2NqNnViaE1hVFNnc3VvYXorTzBkRmMrS1VYeTdsSkZ0RXluZFpY?=
 =?utf-8?B?UHIxYlN6Ulh0QUxSVEw4czVxczdNSG5xNWVEYnZDWEJRSFRaNWcvSmh3cHBG?=
 =?utf-8?B?UGZ1MHpic05NZVQ1Uy9QamwvNjBRMUFmTDd0L2FseFpUYnI1NzVmL3U1L3E3?=
 =?utf-8?B?SkdSNUVOUm5paE5WWXdxOW1pVnFNemRmZXZ0N2pKejdHdjZ3dE04aUtEU1hH?=
 =?utf-8?B?U0hxYktRWkRwUGZzb2RXd0JkK0RwMGM1dUNFT25UeXJhR2FjRlFXNURidEdE?=
 =?utf-8?B?bXRrOG5OMzlCcmxsajFvUERKcDIyWmk2dlZ6MXpYUWFTdEtsN1p2cHVNb3Zj?=
 =?utf-8?B?U2pEUEplQjlBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:50:44.0222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a028a80f-2339-4825-6d4c-08ddb2761856
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5558
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 16:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219216

T24gMjEgSnVuIDIwMjUsIGF0IDA4OjMxLCBEaXhpdCBQYXJtYXIgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGRpeGl0cGFybWFyMTk9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gS2VybmVsIG1vZHVsZSBzcGVjaWZpYyBvZSB0ZXN0IGNhc2VzIHJlcXVp
cmVzIGEgdGVzdCBrZXJuZWwNCj4gbW9kdWxlIHBhY2thZ2UgdG8gd29yayB3aXRoLiBBZGRlZCBz
ZWxmdGVzdC1oZWxsby1tb2QNCj4gZGVyaXZlZCBmcm9tIG1ldGEtc2tlbGV0b24vcmVjaXBlcy1r
ZXJuZWwvaGVsbG8tbW9kLg0KDQpJcyB0aGVyZSBtZWFudCB0byBiZSBhbiBhY3R1YWwgdGVzdCBj
YXNlIHRvIGZvbGxvdyB0aGlzIHVwPw0KDQpUaGVyZeKAmXMgYWxyZWFkeSBhIGtlcm5lbCBtb2R1
bGUgaW4gb2VxYSB1bmRlciBtZXRhL2xpYi9vZXFhL3J1bnRpbWUvZmlsZXMvaGVsbG9tb2QuYywg
SeKAmXZlIHByZXZpb3VzbHkgdHJpZWQgYWRkaW5nIG1vcmUgdGVzdCBjYXNlcyBhcm91bmQgdGhl
bSAoZm9yIFNES3Mgbm90IHNlbGZ0ZXN0IHRob3VnaCk6DQoNCmh0dHBzOi8vZ2l0LnlvY3RvcHJv
amVjdC5vcmcvcG9reS1jb250cmliL2xvZy8/aD1yb3NzL21vZHVsZQ0KDQpNYXliZSBpbnN0ZWFk
IG9mIGR1cGxpY2F0aW5nIHRoZSBrZXJuZWwgbW9kdWxlIG1vcmUgd2UgbW92ZSB0aGUgc291cmNl
IGFuZCBNYWtlZmlsZSBpbnRvIG1ldGEvbGliL29lcWEvZmlsZXMva21vZHVsZS8gYW5kIHRoZW4g
dGhlIHRlc3RzIGNhbiBlYXNpbHkgdXNlIHRoZW0sIGFuZCB0aGUgcmVjaXBlIGNvdWxkIHNldCBT
UkNfVVJJIHRvICR7Q09SRUJBU0V9L2xpYi9vZXFhL2ZpbGVzL2ttb2R1bGUvaGVsbG9tb2QuYy4N
Cg0KQ2hlZXJzLA0KUm9zcw==

