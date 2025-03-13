Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102BBC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:26:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.19])
 by mx.groups.io with SMTP id smtpd.web10.13448.1741868770446903983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kuc5jQPg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kuc5jQPg;
 spf=pass (domain: arm.com, ip: 40.107.159.19, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QsxiLTEM64dg6eztMVFVTv9FXdXaAbjqwGhx1BYHElC090bbjHN02sI68aoCqWWaA86XjCIMzqK3QK7lrfEhPY7NkrpTP4sS0di7F01JRS5BnsGZG/95XafnRSxjWjXqGeWi/Tz/djcA0/FnrjiDAeb8JpE/FzYO5Y8Ww+xVPvsRVgcLj8esABxCW5+YB77V7WfmbrobEUog2GTvPiwmire6y11QrHj67+Hh9cnDs1XknhlAGtQrEn1KTqDj1zORwJTjHaGu4qQAtXGSGD1L+UFBIq2MglPnZlEvT7xOCOXInbYXc06Wl2r1qRHOVee4qzfNTP7I6994LThaLJKoEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OODCOkSmJVc4aPy6eIqOVnOZ1ms2NfbysvCRHvhKAvA=;
 b=fwA82BN2OJJoFVRefJjvUzFPcTUJgMPIOSJuza7/lnQ533SSS2c28YV1FBUm4BNtPckpcZ+rRvIQZ4PQffAvyiOU8dD3nVf0q5GwFROFtLFdzNsmkQidfNVYJ8+jFepxP91n3HAsA1fAByPqzgHjMGXovkmNBURopERS4P55C6dg6FcanZZsFBMLI23eAK5CNlZWXaY12HRCH/EGuaAPNmvl3s6/VmFIZGKJShRXaebWEJiNpZxQFFlB1yRxho9HfPSSe2rcBhqjn5IirwIIf2fbxEKq9maMnA2rcNrIKMJBOlen8CBPkh0Ui5BNCLeZcMCCVOT9bD8c3xrMsC4LqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OODCOkSmJVc4aPy6eIqOVnOZ1ms2NfbysvCRHvhKAvA=;
 b=kuc5jQPgcZAjz5+Kg+nFB9JJTwFriYUsCqRb494AcQRcFfjDRMfg7bm0icckPsz+jN++GdaKkSr7RSzbhS/5IuKVtA0E6VNF/ntIs8dw+OYqZpb85RZMS5OyZWK/3qAPJxKyzwz9jv09PUg9kiI8ZNqrjzQITIkZX4KDMlQ0pYk=
Received: from AS4P190CA0059.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::26)
 by AM8PR08MB6483.eurprd08.prod.outlook.com (2603:10a6:20b:315::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 12:26:05 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::9) by AS4P190CA0059.outlook.office365.com
 (2603:10a6:20b:656::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Thu,
 13 Mar 2025 12:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 12:26:05 +0000
Received: ("Tessian outbound 68993334049c:v585"); Thu, 13 Mar 2025 12:26:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01cb647e97d44e3f
X-TessianGatewayMetadata: bXt/lv9FQtLE9xwxIuSVpqq98cBc0fIinbFyR0LraYTkANwN8E09CgaNpuB380IJg0asp6U7wCvQRJHosXDRAeZr9fcm2MqhJngLf4QEFVDvcqBlFBcDCEogbwuf6bkdpJ7j4hIS8FFKWufmAXvzz3xS41Gk2wdr4074MRMXyMU=
X-CR-MTA-TID: 64aa7808
Received: from Le73e18ef5bad.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3337C86-C160-4B84-807F-65398C2BF592.1;
	Thu, 13 Mar 2025 12:25:58 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le73e18ef5bad.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 13 Mar 2025 12:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Igt7jptQIeTtQXb8STRM/RbBDa7E8k4h3Grqkd+vBTlY4yoZOtZfcyrB6lkjc+dWvxOP+yttGQWZUkFNGU+zqNVTTzyfXQsW6CD1bFiJP6hqGigEpLFpriX2wFme7bt2LRBawABt7v5CgeTrP4PJJIAJyWYF/YEKeE4FwUCVLe2rYhKdAhvnXmyod3Ivjl6b2iI7XrdAT+KkrYsVNOJ56l35TKUHml19WgCG3J/+p9kR3n0TPrsYdaYgWTFZeMDKp+p1FTzu0sChrdop2ajcvuhJCbzFI1xgxJTVnVXWnnB0ySR/He08AxjlPYe/fsLCgJFcPoIBmcGL2d20hyZ2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OODCOkSmJVc4aPy6eIqOVnOZ1ms2NfbysvCRHvhKAvA=;
 b=lry4J2b73Re4FtX1phtWDizmeU+/pQWB1mHSdkXGpwSZgYIwgbgo0hHL10zZIIMSQa3i1AEBJEOhz8gLzcco6CCPm6qPFIN0mAI7bsNuO3ZF4SzgdtYVvee5Lj793/iHF+a4oLuI86n4Y5EiVV6YMZYZJmhBZncD8nSEBZKnqXy+x7icYJuWgY+RkUMTr2vvMXh00IzABN0liQ+KFgo3MIGEqaEPablZupwwKVdjmaQ9w6nKZK5e6KZKvqxklRA5Cp8WXyO0zrt1kdCu6E+rwHfu3fcYzLYddTcERMqKCIiOcEhrTA9cpwgSxWKGNU8z70C982f0qbTgpQgD2XzCMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OODCOkSmJVc4aPy6eIqOVnOZ1ms2NfbysvCRHvhKAvA=;
 b=kuc5jQPgcZAjz5+Kg+nFB9JJTwFriYUsCqRb494AcQRcFfjDRMfg7bm0icckPsz+jN++GdaKkSr7RSzbhS/5IuKVtA0E6VNF/ntIs8dw+OYqZpb85RZMS5OyZWK/3qAPJxKyzwz9jv09PUg9kiI8ZNqrjzQITIkZX4KDMlQ0pYk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10499.eurprd08.prod.outlook.com (2603:10a6:150:152::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 12:25:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 12:25:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kiernan@gmail.com" <alex.kiernan@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH OE-Core v2 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
Thread-Topic: [OE-core] [PATCH OE-Core v2 2/4] scdoc: Upgrade 1.11.2 -> 1.11.3
Thread-Index: AQHbk/YwT7/6KqnF4EmaP3GzEyFYl7Nw/imA
Date: Thu, 13 Mar 2025 12:25:56 +0000
Message-ID: <E977DE92-CCAE-4406-A567-09FAA1F1B25E@arm.com>
References: <20250313-upgrade-kmod-v2-0-2103ca9a26ad@gmail.com>
 <20250313-upgrade-kmod-v2-2-2103ca9a26ad@gmail.com>
In-Reply-To: <20250313-upgrade-kmod-v2-2-2103ca9a26ad@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10499:EE_|AMS0EPF000001AD:EE_|AM8PR08MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: f742121d-70ab-49f8-d513-08dd622a3997
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eDFKUFZwRitTUnNJSlVTQ1kxdnVObmRGL01xRUVnS3JZTHJEOUROaXdTZmN3?=
 =?utf-8?B?cVRCaTJINldQZkFPNGxYV0tXOVl2b0Z6VVlxM1JjMDRjRzRKS0h0cVR0M1JJ?=
 =?utf-8?B?SkdsSFhwZDA1QXhhb2trQXVSZTdRQ2hjTVZLOWo2OHJGYjQ5b0VXSjBkVVIv?=
 =?utf-8?B?Vm5WWGIrV2E1WU82b2FOSGtuK04rL3FtQ1BBYXQ4bVVQamtHOGNjbTlqWDFH?=
 =?utf-8?B?OXdyWlowVTRhbHdlK243WTVRR0dPTk9aQUdmMXZ0MDliWUNwbENCV1RXUm1Q?=
 =?utf-8?B?TEpYVXFFSjFyNWtMT1ppMzE3a2lmVDA4VWVmeU1qQ1pFejNPa004bTBXdnJC?=
 =?utf-8?B?ZDltWFdJYVA5OTNQcjJsaU1BZ2wvUndYUmJJSmkvd05VZ25yK0lLeUZUbnZW?=
 =?utf-8?B?RENoaU9GTXA3bk9ISklKMFY5YWRSY0dqdFN4NS84ckt6L2FuU0o2KzcvTFNz?=
 =?utf-8?B?WlF5aytXQWI3YzhpeDVhT0xaSEV2MGdPaTN1NjZySVJkazhLNlZiVWFBcm13?=
 =?utf-8?B?blExOUxHZVJWNVVlSEcrR2FYVk9pL0w0TnpSTHlCOU8vbnN1dkluTHVnU0g4?=
 =?utf-8?B?WkV5ZnZwTmtxU1pBMlJpbTdsQVZWZEcvUExibjJMSnBhUERJZDdvbWUvTzhl?=
 =?utf-8?B?UDFCUGszZThSWTFVTVVjbHNWSitHZUN5czY1RzFvaVlrS0ZTUUg3ckVwMjVq?=
 =?utf-8?B?a0xNMlo4WVM5dmRRSkVwcVNUU0dQZlVPSldldjBFelJlZTZPdWcxWkdFVU40?=
 =?utf-8?B?MVFoeEg3K251RE1BQTVqaHFGL1Zmb3FWTlpvVG1wNThzSlh6SUZPYkRuYUY0?=
 =?utf-8?B?S0ZoQ0NrSDNqNWpKcmdIM3BIeGtoSjJaaXVpdFlaR2hlQmRuQ0VIQUdOV3E0?=
 =?utf-8?B?dXlXRXZYaDhSbGI2R21MQzZWTm1KY1ZiSUpVenNpMC9VQmtsNmozdHQ3aFVo?=
 =?utf-8?B?clJQWWRkMzliWklYcDZoYVE0VFFsSkVqczloNGxmZmNTWGpXRWs1dll2YXlG?=
 =?utf-8?B?MEx4Tm9SYmovakRPdTZORmZOWkZ3V0FmMGIwQWxiMzM1OFAxVUNVQVk4Tmtl?=
 =?utf-8?B?dmRYb0N5WnVHc2puMWUzOHFpSHI0dFdBbFVpZkVqQThlY1RpNnBHL1YvUHY3?=
 =?utf-8?B?WkZhTzlZQmlUcWhTQTRBTGRhUVFQdmVhY0YyS0x6cGpWamRZUVIyZEs4MzJz?=
 =?utf-8?B?MDlZRks0WE9Eai9zRXFDV3p4NW43a0hSQVZyd1VQSUtWa2tNVGNTeVlnamd1?=
 =?utf-8?B?bHE3eEh1eWFrWklrL25wTDJuYXlIbENhMWJ5YkJ2QmZuZkJHMUd6bnF1cjJh?=
 =?utf-8?B?YTRla3owRW1mTUN2cHhzSTNpWWNqWmF2NnJDOVRLWlNUNVZCeEVBTitDZWZE?=
 =?utf-8?B?T0JMZmV5QTRuWDFYK1FJdjc0M2tNelFDY0VuUVFGQTdmVjA1ZnNjbERCZFJi?=
 =?utf-8?B?blRxUjlQMjdDb0VmQjVQYjlwWXFXclo0YUkyOWRRSXBDeTFhYUt6OUFLa1dJ?=
 =?utf-8?B?RXFmNzdpUDNKZUFVZ3BTVU02V3pqVzJDNVkyNEpQWlpRMC9Jd2tZRm9HcFRX?=
 =?utf-8?B?Qm9hVXFMdUhvOGtjUG4vWGVjTjRPbXovR1h6UHhoV3d5eHM1VGpUOWpLNS9F?=
 =?utf-8?B?dTMvbWdFMXVtYkJEOUIrS3NpakZ6allYQTNtc2tLd2I2dDNyOUYwbUVxbnJo?=
 =?utf-8?B?U1l1V1J2TDZnd3lrc0ZaL1A1TjFYbGtUb1hxVi9qVkVNQk1WSlMvZGQ4SnYx?=
 =?utf-8?B?L09QcWdBN25Rc01xQ0t3ZzJDMVBLSVdwa0txNUY1QW9pRlpnTEdnZmVEczBU?=
 =?utf-8?B?U3JzeTRsZTJIQnMzQWUyM0k5c3pYRUE2aGo0blE5aXlMWGErK2FNZ09ZVG8x?=
 =?utf-8?B?NGNSdVF0OXZKT05saENEQ2FiTGZJaC82eWY2Z0cyNFhqTGpXY29NZlNhSHN3?=
 =?utf-8?Q?iaszuJF5hvr8XK/VWINutKBXsZgOygs1?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <998EEEAB4795CF4692BE47C9C35E3E46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cda340a3-cdaf-4c76-bee4-08dd622a345e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R3ZxeGdadm5ZZGQxc1RTQ0k5RHN6NHptanphVU5PZ1BBK2ZYOUVIeFBpYjV4?=
 =?utf-8?B?Ryt0T3JwTkhLYWpyRk9mM2ZwYmZXQWZ1amhPOHlRYWVVU2FCelhobXVad0Jj?=
 =?utf-8?B?bFUxSVZSc3l3bjViK0syd1U5bjVyOThMdG9wMHZxR25wRHUyQmZxODAyc0s3?=
 =?utf-8?B?Rk5HcmVKeXFBc0lzaGVuYjBKcGlwYjRTU2dPQWxObzFuR3ExbWpMeGFSSlVO?=
 =?utf-8?B?alFoaFlOOEJ0NVhGbk5xcThGZVhkZUJsSHphcWZRemw3V05JYlJGNnY0ZkVM?=
 =?utf-8?B?MVlOdmZFYW95Z2VOWVpmMjMrZUEvT3daL0ROTm84VjVmeVFQNEZMcnZIVllq?=
 =?utf-8?B?ZUxTR1ZPK1pBN1doMW5JNWdDMk5XMWVLWTNYTmxtaFFKR3FTWExua0o0aytq?=
 =?utf-8?B?dWcxaFhlVDM5dnRxTVdiVEZaUUV3SGlpbER0ZkJpOUNyTitHTTFZVXlUOXFW?=
 =?utf-8?B?VVBHMjcyU2ZuTEVkQk1XM2NuUzNhb0tkVDdaV1h5eU1GVGdPS1A2RnIzN2Jh?=
 =?utf-8?B?NWRBU3REOUQ0SFhNWTV1UnV0L2crOSsvU0thQU9xNWdJTE90SldXSkxjbkRo?=
 =?utf-8?B?RWJPRSttUCtBOXhPV3JTc0lRczd0c21DanphUVhPRW1JZkhTbm5ZK2xxa1dD?=
 =?utf-8?B?WmswKzZrWE04WlFXbmN6ZWJxYldLTlVjbkhLU3Q1dVAvdjRYU0hzNlRNSlZE?=
 =?utf-8?B?dUJES0wwRVBOZ1U2Y3dBYnZBRmh3alNpRnBVbkVnc0k5eDRoSXJZSVl1UDBM?=
 =?utf-8?B?UnZUaEgxbGFaZmtLQ0srRkY5RnJqUXVaSzRCQ016a0I1M1BscVMyNFZXTnM4?=
 =?utf-8?B?QVAwaEZZV1JFbEcxRkR6bDcweFZpeTZVM2pJR3hTYjNlRnlQYjlyS1VXUFlW?=
 =?utf-8?B?MS90bC9Fa3B5ZlMwckxFeVJjL3ZNWW9pSjVnN0lpL1Z0UDFBNUV2RU1CTUFl?=
 =?utf-8?B?U3VXTVhidXpocUhTaDJuRGJ4MTdaTG5KMDFVZmw5eitsR2xXaDRnSmx6dzhU?=
 =?utf-8?B?UGl6RGRMSkFIVmhaZ2RRSnFrVTRVWGNQdHA5RStzZDZDVUlyM3JCRmgxOWo3?=
 =?utf-8?B?OVZjUVdlTHczbVZQRkx3d3JpQ3BnS21ndjIvTEhldXg0eUhCWnFkeXcwOXRG?=
 =?utf-8?B?Vk5SOTVzaTgwZ0FEMEtHdllGSTZSY1Q3SEhLb2JuSmt4MjFwTHNScUJqWFRt?=
 =?utf-8?B?ZmdqcU5Gc3dHZDFuWUd0WWQ1SnRFeVlWLzBPRVlWSXJJUXpsQVpwMi8zSitu?=
 =?utf-8?B?aWJWN2xzU3BIWnIzbzE1amNPYVpYdzhZTGRibFhVOTNVZmVRWmoyb24velNR?=
 =?utf-8?B?d01wcnRNVzZ5dTZvc09KMDZiTXBPS2xYemcxaTlMbU1JK2lyZzMyVFlrSjNw?=
 =?utf-8?B?bmxwWno5aFNISzFhTFRLb0lyZGsySUwxUEZlZFBqNlc2Z3pCQ01aVktNbnBB?=
 =?utf-8?B?V3oxaDNkWmZyV0NBdlkycHVmRWNNeWNhN0V6elM5QXM4ZEErMXU2WlBCMnlZ?=
 =?utf-8?B?cDBjQ3BYNWd1bUN2Z3dZcUNScjNXdUZ2dUF2bGhsSUFhYWd3MFRPTjA5Nkh5?=
 =?utf-8?B?R3FrYXZac0hmZkxWYkdSVFhMZjBtQTN4cFIrbWQ5bUdnakVqdTBTWkFheHl3?=
 =?utf-8?B?ZStxL0tnVS9FM1YzUDZqeWtMV2pJQUh6ZTh1UHJLQ2ZYL1lQbE0xNWJEZ1lE?=
 =?utf-8?B?ZG9jZkZSbGVXcmNNNWFGQU8xL1h6cHl3MWdQN3VSbURBaTQ1M3JLdTU0QmZi?=
 =?utf-8?B?a1UwMkxyaEZzNDRWa1FYK20zTVJmM1NJNkNlMVNSY29PQjAzOG9VblpwRWlT?=
 =?utf-8?B?WUhBcFhCSXd2SlJCUW1HbFpRVGtlMHRUL1hpaWNBMUhBN2pWRnVoRW1rQjB1?=
 =?utf-8?B?TlBUL3MybTAvV1psOFVMaFplbnZ1Q3doQmt0VDlheUR3a0hqK2JXTk9Rc3gz?=
 =?utf-8?B?dm1pRDdCYmYwYk1rdjRkNzlIa1AxbFo2TkR4cFNxMzlWR3pBL2VZSWJTdDdk?=
 =?utf-8?Q?2EQPj9WtBpgE/pIr3dSz77fJxEOQ6I=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:26:05.0409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f742121d-70ab-49f8-d513-08dd622a3997
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 12:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212767

T24gMTMgTWFyIDIwMjUsIGF0IDA4OjU4LCBBbGV4IEtpZXJuYW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGFsZXgua2llcm5hbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcA0KDQpBcyB0aGlzIHJlY2lwZSBk
b2VzbuKAmXQgYWN0dWFsbHkgdXNlIGF1dG90b29scywgdGhpcyBpcyBqdXN0IG1pc2xlYWRpbmcu
DQoNClBsZWFzZSBlbW92ZSB0aGlzIGluaGVyaXQgYW5kIGp1c3QgaW1wbGVtZW50IGRvX2luc3Rh
bGwgaW5zdGVhZDoNCg0KZG9faW5zdGFsbCgpIHsNCiAgb2VfcnVubWFrZSAnREVTVERJUj0ke0R9
JyBpbnN0YWxsIA0KfQ0KDQo+ICtQViAuPSAiK2dpdOKAnQ0KDQpUaGlzIGlzIG9ubHkgbmVlZGVk
IGlmIHRoZSBTSEEgZG9lc27igJl0IG1hdGNoIHVwIHdpdGggYSByZWxlYXNlLCBhbmQgeW91ciBw
YXRjaCBjbGVhcmx5IHN0YXRlcyDigJx1cGdyYWRlIHRvIDEuMTEuM+KAnS4gIEJ1dCBpbiBnaXQ6
DQoNCmNvbW1pdCAwNTI4YmNiOTkzY2FjNmM0MTJhY2QzYWUyZTA5NTM5ZTk5NGMwYTU5ICh0YWc6
IDEuMTEuMykNCmNvbW1pdCAyOTMwNmQ4ZGRlNjUwZjVhYzJiY2MwNjdmM2MxZDNiY2ZjYWM3YTFk
IChIRUFEIC0+IG1hc3Rlciwgb3JpZ2luL21hc3Rlciwgb3JpZ2luL0hFQUQpDQoNCklmIHdl4oCZ
cmUgYWRkaW5nIGEgZ2l0IHNuYXBzaG90IG9mIGVmZmVjdGl2ZWx5IGFuIGFyYml0cmFyeSBnaXQg
Y29tbWl0IChqdXN0IHRoZSBjdXJyZW50IG1hc3RlciksIHBsZWFzZSBtYWtlIHRoYXQgb2J2aW91
cy4gIEnigJlkIHByZWZlciB0byBzdGljayB3aXRoIGEgcmVsZWFzZSBhbmQgYXBwbHkgcGF0Y2hl
cyB1bmxlc3MgdGhlcmXigJlzIGEgZ29vZCByZWFzb24gdG8gdXNlIGFyYml0cmFyeSBjb21taXRz
IChsaWtlLCB0aGVyZSB3b3VsZCBiZSB0ZW5zIG9mIHBhdGNoZXMpLg0KDQo+SE9NRVBBR0UgPSAi
aHR0cHM6Ly9naXRodWIuY29tL2RkZXZhdWx0L3NjZG9jIg0KPkJVR1RSQUNLRVIgPSAiaHR0cHM6
Ly9naXRodWIuY29tL2RkZXZhdWx0L3NjZG9jL2lzc3VlcyINCg0KQm90aCBvZiB0aGVzZSBhcmUg
d3Jvbmcgbm93IHRoYXQgdGhlIHJlcG9zaXRvcnkgaXNu4oCZdCBvbiBnaXRodWIgYW55bW9yZSwg
cGxlYXNlIHVwZGF0ZS4NCg0KPiArUkVDSVBFX01BSU5UQUlORVI6cG4tc2Nkb2MgPSAiVW5hc3Np
Z25lZCA8dW5hc3NpZ25lZEB5b2N0b3Byb2plY3Qub3JnPuKAnQ0KDQpJZiB5b3XigJlyZSBhZGRp
bmcgaXQsIHBsZWFzZSBjb25zaWRlciBiZWluZyB0aGUgbWFpbnRhaW5lci4gIEl04oCZcyBhIHRy
aXZpYWwgdG9vbCBzbyB0aGUgYnVyZGVuIHNob3VsZG4ndCBiZSB0b28gbXVjaCBlZmZvcnQuDQoN
ClJvc3M=

