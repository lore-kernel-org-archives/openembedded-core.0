Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3A6EE36AC
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 17:06:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50200.1770915988983456807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 09:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=COvLiusj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=COvLiusj;
 spf=pass (domain: arm.com, ip: 52.101.84.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S99mKG0uDDd173FEiAyWCZ5umqzmQYCb3UOWKPiZW6fBByPruDEPYBMPiNWx28TpRKcp/pndbxC14Cs6crPujmqWFkc3QJ/pP4tOlDM8wmYbE967aElXh7pe9X86RfeV9ihJk1WfAQYUhjBvS7SZi0S8FxlgCis+c27653mltWx4rBKpr5JA4ZF96iw3N22j9WebMhVsjGmPsrpOLWyQMoyy9UWawVr+NbGg4BxSGn07khoP1dKpAoggD02eelZ+gqaDwlVev0EaH6GEKMD6NUC770ZdHDW8l6wyaGAW3YsGl8sbuiaqilyeyr6LwmMPdkGSA6p9xFcFESqz71q8EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmGWW4zVe1f2kHZGRJ3yntUGi087eyuD/oS0O9fewkQ=;
 b=wDBJxQ1wZ8Vcc4zK71xNUPi614hciAzzOcuIFGYTT20sFyh2Z727ybR/Eu4icRAVjqqPv8te7djx0bGc7qyqvmuPptqQsdnRE/G1R73pDRaBLFOdA59MNKHOntvJ8vcT0G8GMVQ6PAORd3T1vws64ts0PqR+71+ZyB14dVFdiUyJUU+/5KtaNBCUyE6hOixFPrtlBiZ35Z782mvl6Tb3PdBE1alLmHPr8E8eUAZtg6TOHTwvzx6dEWaKcqgy5iIoeBWXQ2X9gmhfqdKYCEqJTYoBkjE1/ckiJEzYUcWHYUB1Z5wCIJs+qR6SNPv9pTjpRJHOvrzd+Cx73eI+msNWeQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmGWW4zVe1f2kHZGRJ3yntUGi087eyuD/oS0O9fewkQ=;
 b=COvLiusjqt/5LLpwmyx8aeE5rzGQDajTJinQmXUMDwh7Ijv4pzYz4quwqFwVubp6vUlw0mxiA53GUE5mUSUvwrXUjRkSG0QGFwrmGsjcPFvJZdL8dLRlG1+H3DP3DM3WPOzm/FhQicRdoh2mwocUmtoMko/Ah6SCXlV3YT9yWK8=
Received: from AS4P190CA0043.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::14)
 by DB9PR08MB7843.eurprd08.prod.outlook.com (2603:10a6:10:39e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 17:06:22 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::70) by AS4P190CA0043.outlook.office365.com
 (2603:10a6:20b:5d1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 17:06:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8
 via Frontend Transport; Thu, 12 Feb 2026 17:06:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6DxxdU+9mhxyq/fPLpyUK3mUzv8BVWsZR8lUZICtcJwer0XZ2rNCtwO+85hXcneLDkBPbPU5CaN9rjE7M9Iuhqm9vAJdSbcfhn5vQCFncOdyJ4ghDhbwPxD0hZAQp8x30NA21NU/EURkJXHIXixBBoxRHbS7MIJL5RXr9oqDNB91Brv7cpV45089PAGUBss+ZpxGYLtoct7fC/aPQa6XSVNgn7EpSt+cNdXGFui5ShdJjuTR9A+TFzsfl9PWCsWxEax7mCnZo1tHebLCbA/JvUGeSkXMuQM4kMFgMq6Y3kPjnfpli6q2tSoVr8Fzo37r8ju5dNIrZrpX1WKyGcA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmGWW4zVe1f2kHZGRJ3yntUGi087eyuD/oS0O9fewkQ=;
 b=aHMuZk6ZwbWnMbRfKZaMtJKY9pxLSCsunzNSqCOjhEHqZKyj8qmcNVy+ffZSZ3X1u6fOddEqv2AyEiZHaZmPxT443BIoGMxjwlHZAWra+XHjdSW6GLU9HkgYuqK0wlUD8OdL25JwF4EfwH0y5c48kQaZeNvCxfzIQV3sw6K/G1mHp4yWjTc0igqqY9T30lYeMF73jRwpQ6hf9QeSPmd9V/C9vaBTG9P39+sF/PsRCmz9Eq7rEpuVLs4sjDEx5JfHzCb6uF5YOgNz+75iHl1TX/ohnVLe/mAADoFBTA9RcP7x4ktN9gR3rDTpKMNsfTyWkHbuyYHMWtWJrXqEMFRiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmGWW4zVe1f2kHZGRJ3yntUGi087eyuD/oS0O9fewkQ=;
 b=COvLiusjqt/5LLpwmyx8aeE5rzGQDajTJinQmXUMDwh7Ijv4pzYz4quwqFwVubp6vUlw0mxiA53GUE5mUSUvwrXUjRkSG0QGFwrmGsjcPFvJZdL8dLRlG1+H3DP3DM3WPOzm/FhQicRdoh2mwocUmtoMko/Ah6SCXlV3YT9yWK8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11437.eurprd08.prod.outlook.com (2603:10a6:102:511::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 17:05:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Thu, 12 Feb 2026
 17:05:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "SunilKumar.Dora@windriver.com" <SunilKumar.Dora@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>, "Sundeep.Kokkonda@windriver.com"
	<Sundeep.Kokkonda@windriver.com>, "alex@linutronix.de" <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic linking with llvm
Thread-Topic: [OE-core] [PATCH] rust: Enable dynamic linking with llvm
Thread-Index: AQHcnD/N7dMdc0pTPEa1DZt5d5D1z7V/SvsA
Date: Thu, 12 Feb 2026 17:05:19 +0000
Message-ID: <D0F37E52-3E1F-4477-932A-02BEDB07AE2A@arm.com>
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11437:EE_|AM4PEPF00027A6C:EE_|DB9PR08MB7843:EE_
X-MS-Office365-Filtering-Correlation-Id: 976dcd9d-da3e-47b0-0946-08de6a590be2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WitudWdjaTBZc2lhKzNTRVZQdFdZQW5JQkhaRWdPRlhSRnBWaUswajZNb3pC?=
 =?utf-8?B?Ukc2d0IxUU9NUzdWR01vL1BGWmFJZVFPSDNPRHZTTTNUR1Y3ZWo3SGRvcHFk?=
 =?utf-8?B?cG5FT1g4TmdtQnVJc0RodC9NQmtHcVZpUVFVUVF3MnlGRi9DbHdnMFNDTUcw?=
 =?utf-8?B?cnltWmhzREt3QWU1SlNsazd3NkhjUnNRbmZsWlJLSTcyUUFBTjVpR1FDSHhE?=
 =?utf-8?B?QXIzQ0lQZlRDTUQyNDg2bElTTFN2blZvdlVGc3ZqV052cjZ5TmpvalFrd0Iw?=
 =?utf-8?B?UkxuREQ4dGh0SWkwYW9SYWJjekRVRlRGT2RLWHhLTFV5WFJnYmdNUVZpWFNN?=
 =?utf-8?B?SE8wZmdKRXNmbGRaWmxvWGFaeUpuZ0FmZjZ5YWU0bGo5ZmRrNWFCbjVUVUp0?=
 =?utf-8?B?c3l2ZUN3M1IxQ25rYWlaTW8rejVETUg2TEpNeGtQSGpDeXcvWFJYdEFGMzU5?=
 =?utf-8?B?MDM0WktWVUhMRkhNMlpTMExYMnhOLzcvMWIvOEdnYjQzcFhRYnNaNTRvdXVC?=
 =?utf-8?B?UWpFY1hLeTdIZWJRTDZUWGhXamp0TnRKdFlUcm85QlkrbFp2OWRka2RaaXVR?=
 =?utf-8?B?Yk5NbHdNTytLK3ltRC9ZeEc5Z2tvTitub1ZBREpYQW16aXBpUkhnaFo0SDhL?=
 =?utf-8?B?V2x0dTFCV2Q0aFN0Tm1RZUNmK2cvSTZmSCtXdWFzeXdHZkRoTU5Vak9YSFRP?=
 =?utf-8?B?aFF1UTh1aUNHdXpVMnY3eWdaUC91NHhNSElyUVlWc2JOODYvbHZkVG9EZFgw?=
 =?utf-8?B?b3R5RFYzVXVVV0VOU3NrUXJtc2FpWDVINWF0bXA0WkhBOWZQYy8rRFJxajdu?=
 =?utf-8?B?TjEreHh6STBBTjRNRUxLa2pETHppR2d1b2gxcnd5QzBwVXVnbWdWbnpKRmRB?=
 =?utf-8?B?LzJXQW9qd3RoS1A2dnRBTmVOWXFkMkgvd1RKb0pZYm9CTlRFV3VGWUZXZkpW?=
 =?utf-8?B?ZTVzai9GQTRrRnlSUmVkaGRYYVJEQkFnUFNpMTlra0ZMRGVqV1JaUGNndW1J?=
 =?utf-8?B?czY0NUROZm9mTjUydDRVRUIyYzRHYnA4VTg4R20yektIYUt0VjlucFNMUlZC?=
 =?utf-8?B?N0FxMTBLQXhhcjZnT1hmakdpU0czVnJqTyt4eXIwbVBaL0hOajZBV2p4enNN?=
 =?utf-8?B?Q1A4eHJPaTlQaEo0WWhmS1pHY0lMemRQbSszMW50b3JhSWVEVzdWTExlTzVT?=
 =?utf-8?B?NVB2Ym11c2ozaG1JdFByQzA1a29xMyt6ZjNiMWNvdFRaZURGdFFON28wdHZD?=
 =?utf-8?B?ZHZubFhXemZlUlNla1lPS2ZuMW4xNG1Kc0RhRExLK2VUdFNqcFZpVUlEeXJH?=
 =?utf-8?B?REowTzJTdXlNMnk2enNjZUtSbEtSYSsva2tOTzI3TFhndjN3eGpYTDZWalZX?=
 =?utf-8?B?bE1PVGFPazFTb0ZtZUhpcDR5T1Z5WW84b1Ava1hxWi8rNmZ2SWxGTEhwa21V?=
 =?utf-8?B?TlU3RGNiV2wrWTYya1I2NHY5QTBiRFoxdk14eWR4OEZwNnN1eXFFZ0w2YzJ3?=
 =?utf-8?B?ekc0MWdJS0o3L3F4VXZ5aVZIUEdXK2dxVG1PNkE4S0g5TlVhUE1ZOHA0dVJU?=
 =?utf-8?B?OFVCT3QybllMc08rRVk1SDEvVVFZengycnFoMjJ2NDFpSkdpYzlQQ0ZzemI4?=
 =?utf-8?B?RHMwNUMrdEpyL1U3cEJXMGtEL0R5cTh0OW9YQy9vWm5Ed0J2N1h5N1FMSk9l?=
 =?utf-8?B?ZHNoOXBNdk5GTUFMdGphV2IxaVdhdGZuNURZWWQ0Qnltb0pwMUhiWjZobDls?=
 =?utf-8?B?a3ZUS216WFR6SDlOR3JUK0tIWmVkYWROUFlkWEdRWFlta29UelF4VWJhcjlr?=
 =?utf-8?B?a0NLRVdtK1ptZ21td21TZW94ZUl1Vk9OTWxUM2FzODg2WE5xS3daUDdQLzNt?=
 =?utf-8?B?Ui84T2JuSG44SzQ1amZIMVd3R2lrZTlBV3kzbldVZGRUaDlNRUh2dHBWeGRj?=
 =?utf-8?B?aGpvdC9POE1xU244ckNiY2xnR0VYeWtTYkd5a1ozM1JUTzVMRktPb2FzYmF4?=
 =?utf-8?B?RXVtYVF0aks4VkxuSnBpYXBKWGFpSEZBRXBIQnNaREdianRGYnlEekVOa2Uv?=
 =?utf-8?B?RktubTFRekJPcVRGNG9SUDgveGlXZ3paMmQ5cmRYOENYNGFLQWJFaVFrUXhR?=
 =?utf-8?B?RVJJbXlDZU5hZWNzMlBHVXlIc0hmd2hSN2plcjMvNzFxdkRNMmVsZjV1N2J4?=
 =?utf-8?Q?lIaYveYBnUfqpVp9VPhjWtg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <61C4F6DCB953914C9371A0B368CDD8AC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11437
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4f335d89-e840-4267-a502-08de6a58e697
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|14060799003|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVVNNTdFT2VmTjJLQnl1RFpzYnJyS3hjclFRVjhHbWR1NGlUTVovQnZRY1hH?=
 =?utf-8?B?RW5DWU1Sazd6UkxwdUZNdzRRNUQ1N3VpUU95Skk2SFYxT0Rld2dwcTZZUEI3?=
 =?utf-8?B?Q1hVYWoycFo0SnJxT2dISHczZ3UxRmNYN1J6OUFCMjl5eHhWdHVzejJkSmtK?=
 =?utf-8?B?ZGxzeHhENm82cWhNMTBVRVFXb1Q0Vm9iTWRDQXdGRlR2U1Rmd3JtSnhMcmRO?=
 =?utf-8?B?SXdXZXZlVHc0QUNNbzdRNjV4d21sTHlhUjYzb1puTmgyTmRVRWN3SVNiNTB4?=
 =?utf-8?B?QklPem9VRzRhbDVZNzBQaGppRjdiMndFTUc0ODQzV1o4Tm1BZjNxV0JxeGtq?=
 =?utf-8?B?Q1NydWUxNEdoVkdHOWl2Ui9PZTFySUpLYndld3htUHd5VnBzaytYc1lVNThL?=
 =?utf-8?B?bVlUeGd5bVdQUzlXWjFtY0hJdW16U2pZTGYxL0RaaFJCNGI0VVNQcjYwRDRt?=
 =?utf-8?B?Mm5DR1htN0FUcmhveGlFdWdSSUhWL1VwS3NlOGk1akVHQVBEWDBPTFE4blFS?=
 =?utf-8?B?TGkzL3NFeHFrRFc5anowblhodXR6cStKZnM5VUhiaTZyU3Z3SWxHMHpvQWpU?=
 =?utf-8?B?RVhLLzdTT2tpYldnN0dFRDZsa1hHUmF2TXBQa1dnLzhNRTNNK2RIbFFUaUhi?=
 =?utf-8?B?d3hqa1VHd3RpL2xMeHBLazNxd2o0d05aVGR2Y0MzWW5IOVpiaGRRS2VWUUkz?=
 =?utf-8?B?bVU5NHhnR3ZGdHNkYjdhM1hPR3ZzRGNueTNpSTZaTjJ0SkwxTDlzS1JXc3FV?=
 =?utf-8?B?WWVPSmRzQ3l6VktwMzRac29oa3RreThGN2M2YVNxY2UvdXVqcWlmYzFWRkgy?=
 =?utf-8?B?UXhzRlJna1JGZFdUYmh6R0docXBoSWFrZC9qUXVXNzd6VW5XYWpJWEhhNlZx?=
 =?utf-8?B?MjVQakd4SFJ3TUZrUStMQVRTMjAvSk1jenlBNEswOTFwVmk3ZEdnMll2eU1i?=
 =?utf-8?B?OFA2RVEvanp6d1hnWi8yK3NjbGkxdFQyMlA5aDJ3UnZSUGF6dlZycHlDNWRr?=
 =?utf-8?B?NmRYNmowaWx1M25HbVhZNzBIaGllR053SEtlNWxBUG9HUzd6dkhyQkM0ODdj?=
 =?utf-8?B?V0Z1enVVSGdGeTZDQ1pMcjZ4Myt1UW0vL3dmZ1NDSGRZQksybnFKSGlRNmNr?=
 =?utf-8?B?N1dKTG41SnZtVTF6SDhrakFmWVBHcUZobmZwTVBqc0RUUjVmcEE3NGlPNGVw?=
 =?utf-8?B?Y2dqQUFXcSsrSnoyR2pvaitxcnRGcFdleW90eGhQK29iek4xU2ROQXIvajlZ?=
 =?utf-8?B?N0xmOE5RU24zbVBkdjh4S3QxcmszbVZMdjdDdk11eWg5Z3duYXJrTnJLWjE2?=
 =?utf-8?B?ZzRrRjFGR2NZWUNLNTFHZk5tbUtYbllpK2p3eHZBZktKb0xQVFNvRHZQWHlI?=
 =?utf-8?B?U2pYdHE3K3UwN245SUxDK3B4bjYrRnNPZ3oyTE4wNzJYaGljb2lnd2VaRVMw?=
 =?utf-8?B?L0lDdktudGpBYXhqeHF3d3YvQUM4MXlyNTV4RGtVcHVrUGE0VGpqOGZIR1dP?=
 =?utf-8?B?QXFZWVB2c1AvSXFhTzFXWGRxbitNWC83L0JUN1I5aWFGclNvQ2NBM29rVkxW?=
 =?utf-8?B?Ty8wenVGamZTUHlmc0Z6bks1VlZQNkJUZ2JQdmZvclNNL3ZpZ09Jdml2YWtE?=
 =?utf-8?B?WkVqNVBXQTFmNVJnbjAybVoxT0FYeURnQ1JwZHoyajZDUTU1NFp0OGFUMWlH?=
 =?utf-8?B?aVhldW16V3N4Nk1VbUpQWWRWRi93ZzZGNlhrRHpYNW5sbkZ1ajJ1bzVIMkxx?=
 =?utf-8?B?QXoxQnRDbEVaNlRCMEdsTW0zYnc1V3JJMW9HYWF4aGE4SlhIa0ZYYXhpUk1k?=
 =?utf-8?B?WEFRVXl2Z3VaUW5UdVJ2Vm1mNFpkVUtKMkphNG5HSkRtU2VqYjdsYWd4Qm5G?=
 =?utf-8?B?Z2VMbnVmUmkzaXo2L0NLVHJPY0FEdHVueU1uN2pvazZVY3N5cjFoU09EWFpV?=
 =?utf-8?B?SWxiR1NZWWFIT0NCcHJzTzN1VWR6c0Y5OTdlQ0hBMVFnelRZVlNiQ1dGZWhr?=
 =?utf-8?B?WGJjY05jYVR1THZTZ3c4cFRydFkxaTZpZ0xPN1BBV244TnZxaDFCOUJjMGFC?=
 =?utf-8?B?WTY5OWdBYU4rdERldysrVlh3M3R5TFdHRkZUTjRYdyszRDlEOXIvOEhSU3R5?=
 =?utf-8?B?c1YyUStHSGhUUzdIMDl4NlVuSWEwZzBZSHJ2TUFNaHlzN1duUE5NamNqSG9l?=
 =?utf-8?B?Q1hDY0Q5RFlqU1pQd3pZZytwYjBZRGN4ditURVVFT3NwQ3picmxDaFJEbGJ6?=
 =?utf-8?B?VzRVc0tOcTlYd0dZN08vb2R4TllRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(14060799003)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/t2r1t0RhARFdHZiBcrHhSD56z6tUsBfBHLrNi9oHZpCorDbSoG/4Kci3RqtsKTAOgREPTmlDN1kolfzlk2QaauYK5eRoqSvVIspGRr4T9wQzfuxQSlNNwLDz0vGvt1fULkqhGwi0PqXgUL1ziOXI3QtarPSNUqgM7tSgysjFCG87ZcOv9fHYFtdbetDHpL31NahRW6uGVn+LH11W52zUWpM0jwueCN4NtJHUidqJB0l1etUcI9+yVNTqjy3QpYCIdTmg+egLpsJtzOxfoFg20/ymQyaXjIrX65sRdfVVu0POXEgGmnDtikVOVdn5DX6nu6y68CeWSV2IlsAMVbp61GOrk9flevZtx2hF/+9UEnRCdEcxWGUyCL9cEUrK+hnMAN2QQbTQ0QU76PV8KUGo2WHB5jWUPKbxSnrtTgEtgt1il2EKJ0CrOtSrktr6y4U
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:06:21.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 976dcd9d-da3e-47b0-0946-08de6a590be2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7843
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 17:06:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231051

T24gMTIgRmViIDIwMjYsIGF0IDE2OjUwLCBEb3JhLCBTdW5pbCBLdW1hciB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8U3VuaWxLdW1hci5Eb3JhPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBTdW5pbCBEb3JhIDxzdW5pbGt1bWFyLmRv
cmFAd2luZHJpdmVyLmNvbT4NCj4gDQo+IFlPQ1RPICMxNjA1OA0KPiANCj4gV2hlbiBsbHZtLW5h
dGl2ZSBpcyBidWlsdCB3aXRoIGEgbmV3ZXIgdG9vbGNoYWluIChlLmcuIEdDQyAxNSkgYW5kDQo+
IHJldXNlZCBvbiBhIHN5c3RlbSB3aXRoIGFuIG9sZGVyIGxpbmtlciwgcnVzdGMgZW1pdCBzZWdm
YXVsdCBhdCBydW50aW1lLg0KPiANCj4gVGhpcyBpc3N1ZSBvY2N1cnMgYmVjYXVzZSBydXN0Yywg
d2hpY2ggaXMgc3RhdGljYWxseSBsaW5rZWQgd2l0aCBMTFZNIGxpYnJhcmllcywNCj4gd2FzIGJ1
aWx0IG9uIG9uZSBtYWNoaW5lIHVzaW5nIGEgbmV3ZXIgdG9vbGNoYWluIGFuZCB0aGVuIGV4ZWN1
dGVkIG9uIGFub3RoZXIgbWFjaGluZQ0KPiB0aGF0IGhhcyBhbiBvbGRlciBsaW5rZXIuIFRvIHBy
ZXZlbnQgY3Jhc2gsIExMVk0gbm93IGxpbmtlZCB3aXRoIHJ1c3RjIGR5bmFtaWNhbGx5Lg0KPiAN
Cg0KV2hhdOKAmXMgdGhlIGltcGFjdCBvbiB0aGUgbmF0aXZlIHN5c3Jvb3QgYW5kIHRhcmdldCBw
YWNrYWdlcyB3aGVuIHdlIGxpbmsgcnVzdCBhZ2FpbnN0IGFsbCBvZiBsaWJMTFZNLnNvIGR5bmFt
aWNhbGx5IHZzIHN0YXRpY2FsbHkgbGlua2luZyB0aGUgcGllY2VzIHRoYXQgYXJlIHVzZWQ/DQoN
ClJvc3M=

