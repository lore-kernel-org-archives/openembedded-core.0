Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5120CA1015
	for <webhook@archiver.kernel.org>; Fri,  5 Sep 2025 09:13:05 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.32])
 by mx.groups.io with SMTP id smtpd.web11.17015.1757063575633577583
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Sep 2025 02:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XR1QgIT+;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XR1QgIT+;
 spf=pass (domain: arm.com, ip: 52.101.84.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zD5ykGOQYr0bZC6N2fB5PIFC+8E5Rv9IcPw9WxEujQKm6GIMZ+4/UKk4ZoHq1X6B3jMoeTemeAeL21wr317qDtBwW54p0HCOMrRqFKphbobpv4etITr1KZrREPlCdXspGufPIqJZIKUwL+Njov9gOelRS/nf3N1BVQV3r3tWBU7hVzeVOH+lDduvs7IJDskSGKDtr2MTP+2zTgFii+SMlCASfFK3TZ+gEq1ndo5e+8aevQERh8pE6f8CUjt3SX1t9NfdS+iTobeVmvE0QnDBLB76fupTmFi3yVxrL2ImktNnOCsHCTtO0S2oKpzei485QuvTutX04W0M7dwFuSu5eQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+MmEnalA9gy1/M54dMksF26coWJfm0+6qxKDGPumPs=;
 b=RRS893MeDlNO+YAJNMqZOuv8JNmox5bjVP8ov0sHjnEDWrPx/v9/fIXEPBf9UxE0QhIvI9VKCKWVxCJY0yCI9XT7eN4nhuwSFcV76Dy8431/TFS6lT0niMibRwLrdB4WZAWJ6cgsPCe7dgG2y0cZ0uoY5vlh2xLkpldCpMRRxvhwbIFiFQ23ob1+Q8CvBEvMVG2iFFl8VEpUPcpd3+GOG1piv9qiYDREBSSJT9i2sCSPjRU3HB9vycTB+63wPLExrh8FYbhfnFHFUl/Ydsk16fqDTo9fOrkCrU7qoUTOYyMn9bpl2qcPjb9ZlKeuIcsYlD3m8d8sswwBGuGTUSj0Zg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+MmEnalA9gy1/M54dMksF26coWJfm0+6qxKDGPumPs=;
 b=XR1QgIT+FPEGQXSnSI2GUPV8pXwonKVRs/735j7Mvt00MW0YsR6K9Uwmv2vBXfvLsxpb8YWEGJWHphyJz7krrctpC2xPJDQRvaimPEBt8qUBOLywiu9oXzwb/ARreCzmtJjApDZh1hSKmirpJk6RQulEOSoKo9Hm3TM58f+0D5I=
Received: from AM8P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::28)
 by AM8PR08MB6562.eurprd08.prod.outlook.com (2603:10a6:20b:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Fri, 5 Sep
 2025 09:12:52 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::5a) by AM8P189CA0023.outlook.office365.com
 (2603:10a6:20b:218::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.19 via Frontend Transport; Fri,
 5 Sep 2025 09:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Fri, 5 Sep 2025 09:12:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRK2cK4AyQm2sU/sE8XXLDrik3My2fqiU1Xa0b7sgpVyeCr7tFlTQHpbHw956ahMK9aTwjo/JobinPnqZhv8RY1/lNDGXzcibKZ5xNXrviUrTRnL3jZGzspuh6B83aKfIEjo1MzYkFcEG6PL0gpZhMlllQise7i8o1SDkJYIVWI7ODNLkTyVHSxYoME7af1VV3WjRIP91dwTF67VvD8kUQLer1W680MLkPfegAQAIiaqezKsUOCinBDufFm52CGSBTffNcPy6R/tCawUMzAgbqHO/eiZHamcCxSR9N/OUtm+VQrVrOOl+cY17yHyiBxkPFlhP9hn2hLYbr5YAy+xGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+MmEnalA9gy1/M54dMksF26coWJfm0+6qxKDGPumPs=;
 b=e1k3qwlj5Wy8VukLQlGwEUApsnf5KlZ2qckfcDPZpPNLM7utvlHYumtbv6TLN8eTQCUt9h5P6ZoViZsHA3KDPSUccJE/QWbXu6fIdyjgAOqnoBlqnGnycvGChiYTjV+cL6X1SPjWSKcPVEMT0+IruzifKjfNuqXIyxSEwB7DCMlRRvcjOkd8+1jBIOMR42Wl0mq6agZQEyxPIOVv68dDPcEfkAVLwOjcsKZAg/9D4TmlPoXAU4gG9dtbYS6Ehm30xMLYJlc4oav7/xnaBhlvk5/wV4RcszhzPauWV4lrgEwChaWgnatuGTcH1AlbE2NejYn7IbEaagtu1S+3utbZ4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+MmEnalA9gy1/M54dMksF26coWJfm0+6qxKDGPumPs=;
 b=XR1QgIT+FPEGQXSnSI2GUPV8pXwonKVRs/735j7Mvt00MW0YsR6K9Uwmv2vBXfvLsxpb8YWEGJWHphyJz7krrctpC2xPJDQRvaimPEBt8qUBOLywiu9oXzwb/ARreCzmtJjApDZh1hSKmirpJk6RQulEOSoKo9Hm3TM58f+0D5I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6082.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 09:12:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 09:12:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] nativesdk-sdk-provides-dummy: allow pkgconfig
 to be installed into SDKs
Thread-Topic: [OE-core] [PATCH] nativesdk-sdk-provides-dummy: allow pkgconfig
 to be installed into SDKs
Thread-Index: AQHcHPIdKkyNHSYdB0+bO494xC/V3LSEUGoA
Date: Fri, 5 Sep 2025 09:12:18 +0000
Message-ID: <28C2EE67-1728-4D33-9467-7ECB9859769A@arm.com>
References: <20250903164459.2758128-1-ross.burton@arm.com>
In-Reply-To: <20250903164459.2758128-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB6082:EE_|AMS0EPF000001B2:EE_|AM8PR08MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f33700-dde9-40fa-9414-08ddec5c6347
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|4022899009|376014|10070799003|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?K0MzNG9YYnBYamhmcnV3SC9HejNtU3lncnZ0UDdKL2lNS3hHcVhSdVVha3Y1?=
 =?utf-8?B?KytUYVp0aTZIejBQZjA4Rk1sbm1jZlhOYVBSU2xTclA4WHZKRFB1R0VycVN5?=
 =?utf-8?B?cFk4RE40ZVlTZkVkU2VRWlo4c3JXTzhZc1E5aW5NR29OTDhGaHNZR21uSndi?=
 =?utf-8?B?NllnSmk4RVRwMUNHU0ZQdEpOSzlTRkd0Y3hBNjJnU2V5a29vN25BWnZ5L20x?=
 =?utf-8?B?Q1FEU0h0RERITmhqelRERXdjWEc0anlmblVEa01IVDBObFNyb2c4NmpKb1Z2?=
 =?utf-8?B?MkFmSGtDRjV6ZURmZXhkK2lZdVBQTlkrYi8xTnN3SnVWNS9Wc0tYaU1rcWlU?=
 =?utf-8?B?L0RkUGl0aHl4eEE4eUZLTmsrZHlDRGp6QkJDT3JSMmRZbGNtRlp3RU8vNlpr?=
 =?utf-8?B?Ym9TOVFINlVING5RRE9ycTdTek03WXBNL1JQTlJOQnNLZURnM3k2Nmh1MzFw?=
 =?utf-8?B?YVl2ZzFzNVhMZHJaRGZ6d0I1YUVEYzJvd0ZUQ1hEUm44alhyUUlhM21qK1g0?=
 =?utf-8?B?UXhLZHZqeUZXTXlEQzJqNlVIVWU0Qm5sTi9lcGI1YXBld3RHOE12Qnl0Z1Jw?=
 =?utf-8?B?eHQ3bVMvdWNoL2I5QWkzQktEUWN4SVNYUzdxYnZ0YVY1N0piTDRiNjRWVlox?=
 =?utf-8?B?THViR3lGZjUvQ25pUGFLUDE0b3NkS3BESUt3MHpUZ0FZWWVtRkZINHdWRkdr?=
 =?utf-8?B?VEo0WXBoVWVzVFhnMDJHZnEvOXp1YVQ2cS9naGFlck1WZENJSktwTHJCMzlN?=
 =?utf-8?B?RjdTT1IxRkY3dDkzdll0MmlRL0Q5MnBNQW1mWTZOZlp2Wmp6bVdvK3VIOFpF?=
 =?utf-8?B?OGdpRTcybjEySDhZejlHWlJsamprbDlzOG9LWG5DamdXZWIxZHRaV2hOY28v?=
 =?utf-8?B?MmxhMjBTejBPUVVJOFpDeEVsTWZ2UmFXU205SHdEMXllUVY2V3lDelhPb2tT?=
 =?utf-8?B?SmdsS3JlNDdOZitqTlM3ODBSbEErYktLdFY5bG1ZNFU3a3J6cWZyTk8xYUda?=
 =?utf-8?B?UWV4WmZhcUNZL0xJOGFVZllVNlBDbnpDZ2tIM1pXTXFhODZFNDRya01adzMv?=
 =?utf-8?B?ZndIOFAxNWVqUk5Yc1FhaFV2dmQwZk9uOTdWeWFrL1RjTmkvekxkbzAvekFi?=
 =?utf-8?B?NW8wclZ1QndvS3lYcUcyUDdtZFpKb2FRSHZoUGVDb0JNQmhQZnZnOHl5bFgy?=
 =?utf-8?B?ZEdYV3Q1MWlEbE5BV2pSR1VGSkJvanJFcHVSNXBjWWhYclZqUXlJNitZWnhP?=
 =?utf-8?B?d1FIekYwelhQaG1GUHZWcmdIRkx0L1R6VmZob2hXNmZiSk16ZGFHWVJFbnBI?=
 =?utf-8?B?Q2FtRFBvUHNCa1FvelZ5L09DSTI1ck1yNEpnYzUxdGdTSVo1a1NNM0t4T3cz?=
 =?utf-8?B?UzhrczEzSEx1aGdMSGp5cFY2S0xCdnYyTW9ReDdPWXg4NkhrZS9qZUcyYTNu?=
 =?utf-8?B?OEVTNkVPRmlVSEVyNldGamkxUFB4L2pQaTBuQzhIWFg3d2pJZFhVMmRxMTFS?=
 =?utf-8?B?bjFTMGwrRWpwckZiMXlZZjQwT0F3S0oyRkU4aS9wS2U3bnZPdjJDb0dkZDNQ?=
 =?utf-8?B?NnBTYlNaQUlpVWRZemRmV1dzRUFMaHNwNlRTbGN2WTg5K2x4SnQ4cDBTWURl?=
 =?utf-8?B?ZkxIemFLUldZRGlEcERudEpEWE5zMmJXUmdndmM1QWlOL0NvRzJybU1uR3Q1?=
 =?utf-8?B?VllOZ2o4bCtCNzd2aUF4WnlIT2dlbmMrVWlLM3hSeWg4M0hpYVE0eUdaV1Fh?=
 =?utf-8?B?b0hnV2dmY2x5dVVnR0xLbXdncWJPU25XLzBHWVJLdTBMWVdaTTRHNlhKZ2la?=
 =?utf-8?B?VWVNZTF0N0ZKMkkvUTFzZUxoMXBCaVJ2amlZRnJvVzI2cUt2M0dnYUZlSGlt?=
 =?utf-8?B?bVRFNTJ0U3ptck5tZGFTVTZDRlNUaDZVdHF3YTROOUpRT3dKdi9jU3NKaEN3?=
 =?utf-8?Q?MorV7OT6beSwl9+nK9vbNjG10I3AoCJi?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(10070799003)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C33DA198B70B96419BE4A690874BA667@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6082
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e5fb20ff-94da-4c4d-70be-08ddec5c5042
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|35042699022|1800799024|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ty9IbmhsSXJDMzZJVC9yTGVwRnJ1eFdMRm1PaW1sZGljSVNGM1Q1SHRBUlYr?=
 =?utf-8?B?REcwQVVJbEpzWFJRMFA0VWJ3Q1A0dE1vRnoyZnZqbEJKVGRmZU5KRWo5UXh1?=
 =?utf-8?B?TjdreXZvclV3dmFiUnIwYk9wWkU1UnBTOTdpV0ZNclVDb2t3bDhENFRrWld5?=
 =?utf-8?B?NXNRSUR2ZGtwTXVSd29GeFoxTW0zWGMwYnk0bDZiVi81alAvVkFWY3NocGJh?=
 =?utf-8?B?QlJ4cXlpSERsWUJIQjFXYytlQVFyUzY5YnczUVJMZWkyUVppMVlkdElIYzRj?=
 =?utf-8?B?SVZxM25Sd0kvUzJNRVFlYWNlOEV6dEtEUzZrbG9YRWxXUUs1U2VxbzhuNitI?=
 =?utf-8?B?RGpYd2g0THlLblBOUExFbUU1UktjR3BoL0JuaHFEMklSdVk0ME1QZ1BJRW9i?=
 =?utf-8?B?S25EOFI5aHgvdmVwcTlZUkVzR3dZWjhXcDJ2U3BoZHpNRHNIWjFZOUdIRzM4?=
 =?utf-8?B?US9uc08vajFWdU5KR203Y1pOR0xyUVBzcDExSjkrd0Zid08yWFM4Zkl3eGxU?=
 =?utf-8?B?YUVOUHdOYms5Y0QvMWRYT3NZV1dFM0xjeGtSS1BCeE9LVU4wWVhPVk53VFJa?=
 =?utf-8?B?Szh6S1lLNkNzaDJpeW9qTnBubVdJdUVmUXhKcWFuK1ZUVmlwRnhPdTJWRWx3?=
 =?utf-8?B?R1RjRFF4NkMwbnljMHppRURnWWRCeXpmenlVNU1ObzQxQkFRSStRV1lIM1p1?=
 =?utf-8?B?ODJhVWxCNUlKaTcvM3NNYUlpSG5QcFU5VGRTMGs0VW9pN3hyVEdyU2F2emRp?=
 =?utf-8?B?c3RuRXEvN3RJYjlYbEFsOWtBZEdXcUk0cjFFd09OdFBSSmxudVpUTkR3eW9X?=
 =?utf-8?B?dG1ieUtDRmRtR1U2OTZMRG0zT1hmM2JLRHZ2MEdUM1k3SnVuK3lrRGlnVkVt?=
 =?utf-8?B?UlE0ZFFSbENsS05HVVhUQXJaNG4rbk8zU01aU2gxcU9GOXN0amgyQ21RQzM3?=
 =?utf-8?B?anNIeFN2cFhNZHMyVnNYYWgxVmM3SGV1OWtBTkZDNlBYL1M1eGc1VFlaa0Vy?=
 =?utf-8?B?SXhNRFVaaU1JaThxRnllWFNTM29pb3NTUkhSQjNkaXJtSFh5M2Z3cjJQb3Ir?=
 =?utf-8?B?ODNpOEJZVUNsZ0FBVW1TWHVxaVE3NnlMQ28xSXo0RFVIUVRXeXVDYmsxMklr?=
 =?utf-8?B?MkkzVmFFUnZtTTVOREF4NzVlMVVQSUowLzkvcjNhMFRBN0JrNUl6M2NDQm9S?=
 =?utf-8?B?UXd3ZU0zQVBRV1dUWGN3cnZrU0lFMlpGTGJNODVlWFdubkpvbld4SnRRZ2dl?=
 =?utf-8?B?aWV4TVc0MFJjRytDWXFqbHJ5MmVCaGRyVVE2NTBONnFpaTBBUnVTRzV2NWR4?=
 =?utf-8?B?ZFIrYjgxd0E4by9QQU0zYzhzYkwwSlNuY2tVSVBtYjRyQnBjUGpDR1NYalhH?=
 =?utf-8?B?WG55emNFS05IS3VkMHVja1lpeGxFdHRKb1dOSzNRS1RSOUwyY3ROVUZPUld6?=
 =?utf-8?B?YUhoQ2ErRjlHMVBOVHJKQkR5Nmw5QU5wNU4zRUN1a2oreUFadXV1aXgrUFNx?=
 =?utf-8?B?TWpBZGY5dXdPOXc3MW9rZ0tPUGRNdkFscS9wZVgyMFkvVVZhZ1VBZ3ZvRGhp?=
 =?utf-8?B?VjJLNlV5OUpNR2E1Vk5tazNPZU5jU0tqdzhHVUxuUXRqRjMrRDJkY1ZBcEQ1?=
 =?utf-8?B?NGhSS2dKYXBDRi8wYktqMGtMbmdTMUZVK0xBYm5aVW1vcUNJK2RtRS83U0t6?=
 =?utf-8?B?ZVRoYVJlQzliWjduU29jTjdWeDFZR1VZMGZ0QkNwdjR5Wmo4WFN6VnF0SC9j?=
 =?utf-8?B?U2J3S3ZiNXJpNDAwZFRHeGxpdnVvSkdCN2VtY3J3d2RsQjhFbzMvK0RoRDF6?=
 =?utf-8?B?cTV5VHJsQXA4M0MwaWZRdGN4ZDJOWmh6NHVLR3ZvWVdMOGRZZ0Z2YWtjY2lt?=
 =?utf-8?B?TTJESnBremxEVThxY2NLVC9qSzdaMXRtdEZxNlJGcUpySCtVaU9kTlFEZDdp?=
 =?utf-8?B?bk94eDVObXowSXJIOC9oVnZrekxXS1V2dUYzc3VGRlJyOUZSMXlNMjFpZ1hi?=
 =?utf-8?Q?mrlsQ9T0aPB5QF4uvFk9kJ7d5cTiD4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(4022899009)(35042699022)(1800799024)(14060799003)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 09:12:50.2900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f33700-dde9-40fa-9414-08ddec5c6347
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6562
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Sep 2025 09:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222980

Rm9yZ290IHRvIHNheTogdGhpcyBzb2x2ZXMgdGhlIHByb2JsZW0gd2hlcmUgbm9uZSBvZiB0aGUg
dGVzdHNkayBydW5zIHdlcmUgYWN0dWFsbHkgcnVubmluZyB0aGUgZ3RrMyB0ZXN0cywgYXMgdGhl
eSB3ZXJlIHNraXBwaW5nIGFzIHBrZ2NvbmZpZyB3YXNu4oCZdCBhdmFpbGFibGUuDQoNClJvc3MN
Cg0KPiBPbiAzIFNlcCAyMDI1LCBhdCAxNzo0NCwgUm9zcyBCdXJ0b24gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHJvc3MuYnVydG9uPWFybS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBUaGlzIHJlY2lwZSBpcyBhIGR1bW15IHByb3ZpZGVyIG9mIHBrZ2NvbmZp
ZywgYnV0IHdlIHdhbnQgb3VyIFNES3MgdG8NCj4gc2hpcCBhIHBrZ2NvbmZpZyBiaW5hcnkgaWYg
cmVxdWVzdGVkIGFzIG90aGVyd2lzZSB0aGF0J3MgYSBob3N0IHRvb2wNCj4gdGhhdCB3b3VsZCBi
ZSByZXF1aXJlZCB0byB1c2UgdGhlIFNESy4gT24gTGludXggdGhhdCdzIGVhc2lseSBzb2x2ZWQs
DQo+IGJ1dCBtZXRhLW1pbmd3L21ldGEtZGFyd2luIFNES3MgY2FuJ3QgcmVhbGx5IGFzc3VtZSB0
aGF0IHBrZ2NvbmZpZyB3aWxsDQo+IGJlIHByZXNlbnQgb24gdGhlIGhvc3QuDQo+IA0KPiBUaGlz
IGJlaGF2aW91ciBkYXRlcyBiYWNrIHRvIDIwMTQgd2hlbiBjb25zdHJ1Y3Rpb24gb2YgU0RLcyB3
aXRoIFJQTQ0KPiBwYWNrYWdlcyB3YXMgYWRkZWRbMV0gYW5kIG5vdGFibHkgdGhlIHNhbWUgYmVo
YXZpb3VyIGRpZG4ndCBleGlzdCBmb3INCj4gaXBrZy1iYXNlZCBTREtzLg0KPiANCj4gWzFdIG9l
LWNvcmUgNDE3YjI3Y2U1YzEgKCJsaWIvb2Uvc2RrLnB5OiBzdXBwb3J0IFJwbVJvb3RmcyIpDQo+
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0N
Cj4gbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2RrLXByb3ZpZGVzLWR1bW15LmJi
IHwgNCArLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL25hdGl2ZXNkay1z
ZGstcHJvdmlkZXMtZHVtbXkuYmIgYi9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL25hdGl2ZXNkay1z
ZGstcHJvdmlkZXMtZHVtbXkuYmINCj4gaW5kZXggMWQ3MWYzNzNhNGUuLjk2Y2FmOTY4ZWVmIDEw
MDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9tZXRhL25hdGl2ZXNkay1zZGstcHJvdmlk
ZXMtZHVtbXkuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvbWV0YS9uYXRpdmVzZGstc2Rr
LXByb3ZpZGVzLWR1bW15LmJiDQo+IEBAIC0xLDggKzEsNiBAQA0KPiBEVU1NWUFSQ0ggPSAic2Rr
LXByb3ZpZGVzLWR1bW15LSR7U0RLUEtHU1VGRklYfSINCj4gDQo+IC1EVU1NWVBST1ZJREVTX1BB
Q0tBR0VTID0gIlwNCj4gLSAgICBwa2djb25maWcgXA0KPiAtIg0KPiArRFVNTVlQUk9WSURFU19Q
QUNLQUdFUyA9ICIiDQo+IA0KPiBEVU1NWVBST1ZJREVTID0gIlwNCj4gICAgIC9iaW4vc2ggXA0K
PiAtLSANCj4gMi40My4wDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcv
UmVwbHkgT25saW5lICgjMjIyODc3KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMjI4NzcNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE1MDQ4NjYyLzY4NzU4ODgNCj4gR3JvdXAg
T3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiANCg0K

