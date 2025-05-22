Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A107BC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:37:59 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.32])
 by mx.groups.io with SMTP id smtpd.web10.22722.1747917472451523513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:37:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aStup7t1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aStup7t1;
 spf=pass (domain: arm.com, ip: 52.101.84.32, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gf02K/Y5M1Ufin/R0+DaV7+9+Np7nuG25jskNyrM4znSfQnFgFxLt9PJGWYTWZaHLoYpz9Wj0k/boEhIGZ2MLsgepF8tzLE8O7l2bl2pOQ7TK/gY331+VbAYf0ji72kp10yJVh/Bu+yTBI24Zu1bhHCRUgC9rLLg/YWch0QXLMvuuOkpeBVoeijpgC+ndOfBvwy937uyd38b6WX/nNYQ2m57GxBtFH3PK73EsDZ9/2RYYHGhutKgxY0UTl5f8whXn3fXFLM0E6GXtojg2EyNT8KK/VbzKABT3VXdYpBcQnqhlpPEmttt3S+FzAE9ONjcPmw7u1OqSD3JSeAikZ8oEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXetpDiOlHoR+xx9uH+D3HYpNF3yz8WBDfbuXLvnV3A=;
 b=ZhOB2M6y0qS8bh0EKIAOZtZ11LHDJYz3Vy59A6Iz1SUZr0kdlTwmTOHBvE6nc7iK8ygR8yxAS15UJ1FWDTC7AKM4p5+3RXlOKRANNwiBRSRXe46mdQN1oHQplqWwWaKQTrRISC5HcItA86/X+hXq9iHsYCL0oYQrI45HXEn01Ieui5JUju1NxZ9GwMwlz85HDXvgD7kbr05GqK6tv6ibBgduOVBu/EeLKfVPP9Cei9D8Q0akm2wnSKmDcbbeKf9j8uJ3uIVRyJNQMNGYgX2sEIVxGMPy9w41hqt+GMmNT8bR5OvytYOX/fcQwIvbLKzyJMMwK4tGALldh8156T6JAg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXetpDiOlHoR+xx9uH+D3HYpNF3yz8WBDfbuXLvnV3A=;
 b=aStup7t1hcvZ7JH9AHwDR4qNzQ1iI9CzsJedcMsgnkICFJHJkJi0v0hgY/XPBDeSCLHsWSZDeL7cbAwFs95mapG9Wamo1mmlnxHAnKagu04LInpDrfaAVWJNNj0xNEIpsWs+dvFeVkIsIt/WltQF5driPcUh0F6ABDGuXOdLYa8=
Received: from DUZP191CA0054.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::27)
 by AS4PR08MB7831.eurprd08.prod.outlook.com (2603:10a6:20b:51b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 22 May
 2025 12:37:49 +0000
Received: from DB5PEPF00014B91.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::1a) by DUZP191CA0054.outlook.office365.com
 (2603:10a6:10:4fa::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Thu,
 22 May 2025 12:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B91.mail.protection.outlook.com (10.167.8.229) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 12:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SNYflnuVxkrAFdTKcibjCwP9gJVXZ2oZL3JRi8YN03NcIcUMdOzNxlz/xylJcFQ2+wa3K9TtAcsBEJObrDvbTOAQxUxTqyBafdjyl/K3cus6IGlFb53qD8gOg5QjRPPxLq1xGKpyEto1uSZ7J1mDim0F2Bxc1SQvZQDXzRMzTw9a3kN7SYNOcgD9giLUdQJuyMX0oCgu735hLvp11BBJAPDfESYrAKGR6+ve91FOs0y2Ebpb7g1Hys9rxSaFs7OsLkmfUIinUhdmlGTDkobpRSOq/+KYgeh1dx+AOTnZ9hMj/hI7E0eoC9XUrc9+ai+SSp+4zeN/OgdMBcYyx5h2kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pXetpDiOlHoR+xx9uH+D3HYpNF3yz8WBDfbuXLvnV3A=;
 b=n9cEEYzKoG7b1Wyd9IMGMcbK7bbU6SqfAOaQ9Olt9cjOBhl4FXbRecIYyjB7EwvbEGRablY/vgIa4/mdQbi0TRnlLjv6ySjxNo0OGYfCuk/75rpzA4r6c2PJcjiGkuqi46ct2827s2DE7ZjopzAK5GdalpAqgCWsvMjw+TkTQNkgaMGdHpQeYkOaI00XvwvTMKEk+jkN5RV633zNu5YT0xTNqN0ORKCMMaAjwwhI/XMb/of7r+6Jgy3c/sH4+crVXGSG9E1sY3KG+RVHfOUWyx17iilfkpasIy4es03au2hoc+Ej85aQLwL1lGeQ/63AL7UXmqjUt/swcdYl9hDPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pXetpDiOlHoR+xx9uH+D3HYpNF3yz8WBDfbuXLvnV3A=;
 b=aStup7t1hcvZ7JH9AHwDR4qNzQ1iI9CzsJedcMsgnkICFJHJkJi0v0hgY/XPBDeSCLHsWSZDeL7cbAwFs95mapG9Wamo1mmlnxHAnKagu04LInpDrfaAVWJNNj0xNEIpsWs+dvFeVkIsIt/WltQF5driPcUh0F6ABDGuXOdLYa8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5767.eurprd08.prod.outlook.com (2603:10a6:10:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 12:37:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 12:37:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] rust: remove file-native DEPENDS
Thread-Topic: [OE-core] [PATCH 3/3] rust: remove file-native DEPENDS
Thread-Index: AQHbyoS3PoEnqanv8kaqpQyTFUk+V7PelemAgAABgIA=
Date: Thu, 22 May 2025 12:37:15 +0000
Message-ID: <446C99E1-B5AB-4660-AEE7-C93456DD65D1@arm.com>
References: <20250521191449.1486927-1-ross.burton@arm.com>
 <20250521191449.1486927-3-ross.burton@arm.com>
 <5bae0922-e589-4b92-bb8c-258b0fcf405a@cherry.de>
In-Reply-To: <5bae0922-e589-4b92-bb8c-258b0fcf405a@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5767:EE_|DB5PEPF00014B91:EE_|AS4PR08MB7831:EE_
X-MS-Office365-Filtering-Correlation-Id: 73682448-fc76-469a-1efa-08dd992d763e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WlBFbld6cVlBOWd4QTVSbFN0TGNHRk1SMEk3aTNlUWpyTitZK0FITHluWXNR?=
 =?utf-8?B?Z21aLzVmbE9IeVdrWlI3VHZWRlg4NGJzbmtUbXlFR1pZSm55cGRna1N4eFdZ?=
 =?utf-8?B?L2xveUtJSlpjUU1TNE0yK2ZVSEsxeEFSTVVHeDNqd0Q2V0VRWmpYQ2c2dWFE?=
 =?utf-8?B?cGcxQlpINGZKSUtUVCs4VTRuTURhd3JWT1dSd1poK09DMEtNbG5oeDlvUVpE?=
 =?utf-8?B?UlN1dk9oNUFxWUpIYTNkQW1Lc2lETVNFNi9lUFlHRVlOVzNURTZDZG1WMzZk?=
 =?utf-8?B?Y0VndWVCajBLbFlacm02TEZPNEI1OUlxYUdVSWZXVGI4YTBDMTZkWDVmMnVT?=
 =?utf-8?B?bStHMUdoMm5WQ011TFNGb09iaGFyLzhnaytCYVFrTm1USUdjR1Y2YnRCdFNU?=
 =?utf-8?B?TzkrTFA0UzRUY01JdTIraUYrdkdNN1lremFXTXpzY3c2TFViRm1RMHkwSzdm?=
 =?utf-8?B?RWxXbnUvbTF6dStoQVRjSzRpQStaRTU3T1hDYTVLU1hEVzJXUXpLc1BHdlZ1?=
 =?utf-8?B?OUo5NVMyNjJWZnM5aWRtTkxiS21hd2taTlNOeEc3cjdRZ1cxQjlTNFJtYnlD?=
 =?utf-8?B?UGh2M2pJbFUxV0kxNGxOeWJUZDQ1Tk5yT2phYkViQzMzU3ZZRkxDNkJDYktL?=
 =?utf-8?B?N2EzWUU3N0doN2pBeXRGaUJrcEpFZXlFRWxoWmV0dGlUdFlFTHpYVFV5dkJQ?=
 =?utf-8?B?QnYrMllyQnI1Ykc4RzlVZDlGT2ZtK1JWRk0yb2FmS251Wi82WXc5RERYTWhE?=
 =?utf-8?B?OFFWSU1SV3E5TXVEbXRzQzY3NTlQaEJMa2p3NWdMMGpsVUVGODNUZ1BjT1hB?=
 =?utf-8?B?aWF1UlFPd25qQWFlWExtbTBxUmVyaCt1UVN3T0pRWGhQOE9sQmtlOFRKczJ6?=
 =?utf-8?B?ek45R0ttOTN5d2FncWVMT3Y3a3hudFRSM3VKZmkyUk82ZnE3QWxjV0F1eXJs?=
 =?utf-8?B?ZUFRVjZNU25qUnlGWG82ckhZMGVyeFAvdDY2VHlCbGNYV3p5eTdGT0MyVTRI?=
 =?utf-8?B?bWx5dGxzRzV6dk10L05IVnc4QWtDR1crS25IdXVpY29kdnhwS1Z4MW5Vd3Bo?=
 =?utf-8?B?R1luMW1ndUdNKzNnVE40T2dTWkxqaDExaUF4WUpOV0paY3loTG9PbFcvMDJI?=
 =?utf-8?B?N1ZtWG5hTkJnNGVKOUxkL2ZqcDN6bGdnQ3FqZnVoS08wZkpOVk40RkZrODFL?=
 =?utf-8?B?YWJXenFZQjZaajg3Rmw5djhkMjlmdnE4VWRHV0ZqWHY5cWdYKzZyMzVicVlt?=
 =?utf-8?B?d0xjUHNabEoyWHh0T2Z4c3BzK1hJb1lGYU9CTHVXWVJhVDdZc0FYdW1VMWxZ?=
 =?utf-8?B?cTgxY2w2cjRoZkk5a3BOZEl1eS81SnZ0WDk3d3N5WG5mcEtsSXlMeVdJYWNN?=
 =?utf-8?B?Slk4c3hPcG9FWWltWHNQWlFyR1o4cUp1M28yUFFGZ0ZRWTV0TWJXeXZrZU9n?=
 =?utf-8?B?bnB4eitaYzlYeFJFV2JLd1lSZlNtK0pvTFAvUHgwNmdPMnYzd2p1MzVTcDBY?=
 =?utf-8?B?aGZLOEhNR0NWSkpoMC9zK2piZzVjbGdBZkhjTEc1VmJtY1NLdHZ3bGVHcXFB?=
 =?utf-8?B?YzgzMUZaM3Q3UE15UXFLd0FiSFRSVlZFbzMvQ2tHWmRCeEJMem13N0loOXVk?=
 =?utf-8?B?R3doK1J3WTJ2VURUbEF4NC9MaVAwQ0F3OTRyVyttY0tqeUZZd0FQWjVUYS9K?=
 =?utf-8?B?am1ZUDRrZ3ZISHhQb1lFeHptUHF0VjEvVURIMGtwZVlsQ3NjYUtEMHhpdHZJ?=
 =?utf-8?B?ZXp4QnVOL0F5cVFIcm1XM3h3ZUpRRkxaNHpURDNtajZoajRJOFNvMGJtM0or?=
 =?utf-8?B?c0FtRE5URDNjemVtdUFnWWVwZVJWcUFraHNlVEdZb2ZOTEJsa1M1NUhLZ2du?=
 =?utf-8?B?WlVxV1BsanA4eExDeHBoc0NvZ3lzN2FvVVdEeGZtRERwWGNCSFNMdElRMVBX?=
 =?utf-8?B?SGlkWXF2K1lacm1SSThzZkYwMzdXbTFCYkQ5WUhZQWdDendIaDVOT0Rha0hj?=
 =?utf-8?B?ZHdOTFlqWjVBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1085380FD7E84143B61BFA0BFB0D6F46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5767
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d58dacf7-2abb-476c-6b1d-08dd992d625b
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3Nlcy9PamZDc2JzNEJzWC91bit1MHVtMXN3Y3NpRTF0QUJEVTRxMWZDUy9H?=
 =?utf-8?B?cFk4MS8rZnkxY3J1eEM3YnhOOTYyNWd2c0x4K0pnL00xbFN0N2hlMEdXbmVE?=
 =?utf-8?B?enlmSEJKRlZVekVnTi83ZjlyTHkrd2RxeWdFWTRVOG1KanpCUXU3T1NUajhp?=
 =?utf-8?B?S3F3NWZpVVBqMGNORG1YZmIxbUNWZVc4dlVuM1Nmc2lDTkNXSVZ6S3JUK3Zi?=
 =?utf-8?B?RGFkLzJEYnpVOFh2SnFTL1pRamFEMHdvb0hYamVXOGJpYVdiZllBeHVubWti?=
 =?utf-8?B?dGd4eG1wSzVwd0g2RXZYOWpIOWdUdGdWUzY4Mm9UeXEycUIyNzFoYXhHazJC?=
 =?utf-8?B?SlVMSjhsVGh5Rlo1NVpYMWlqSitVREwxdDhIVFJYQ0hMV2NGYXhHOFNSWDc4?=
 =?utf-8?B?VFR0Z3czQUxDY1J6VmFoMTZoMzd5Z0FVSU5LaEVJRlVvb0pzNVZPWEZuK0w1?=
 =?utf-8?B?WngvMUVramc4dzFucjFQeUJJSURpWFBMSUcyWFYvZzlTbzJoY1k0anVobFc3?=
 =?utf-8?B?ejFrVnY3RTlMYmpQL2U4SWEzQTZLREYyQnNRYlpQSWtoVGphcnRZbjNDVXJ5?=
 =?utf-8?B?bkZvZm93b3FFd0RnOXlPcm9CVHdWcGg0SUwrU01UUDZ0dU5PRXN5eWZ2d05m?=
 =?utf-8?B?Mmx2RGJmRjkycEhScmc0UlNOMnN2d2NwSzA0VmtwaitpcFBMdU5LdmRCZ1hV?=
 =?utf-8?B?ZzZzS2t5bFFwN0pDamV4TDZkc21HZmxiRDNVNlZDU3hWdjdzZ2JqWW91TkJX?=
 =?utf-8?B?TVNjVVJVdGt6YndlN0g5OHB6QVhRNEdjV1BWdXdvU0l6anV0SHFvYkl4djl1?=
 =?utf-8?B?SzFVV2ZNMXZMVWtKOC9SUTJscW50UXBFaHdWaHZTRjBNaVFObUhqbFJTMEJJ?=
 =?utf-8?B?c1BnYkxWU3ZrQkRmWmx6UENRUS9XbDNEZVZ3N1hYdCtkLzJUYzBNSWd1WVFE?=
 =?utf-8?B?WEEvc0dQb1plUDNFK0V4NUxPMUtEb2tZOUlOUlhrbDJ2TFNWWURHRmJuM0g4?=
 =?utf-8?B?cFdmUmhOOUptR3Vxek8ydWhYOU1UUkQwZDlZdXIva29GZHVYTUFTc253cTdn?=
 =?utf-8?B?NG5aU3J2dlMxR25FMXNheDNLS01kdGtpQkVpWDZjZ2xOd1NNb3RHV2F5TzMy?=
 =?utf-8?B?bG84cWlneUI2eWFGUGsxeVUxYm1UN0x2QUM3Wk9UOVpEMmdGOUtWTFNGS2d4?=
 =?utf-8?B?a2lHUktTTkNZbS9NZ21pQmIrMEFZbk1hMEl4VDJ6YzB3c3RDbVdNSG5PTThS?=
 =?utf-8?B?Q1d3RlZhSU14MklJQVg0UTh5M3JTZ09neGdvcHZOUG4rOTI1TVkwaTk2QUtG?=
 =?utf-8?B?Z3R0VXZpd2wwYXRQZ2d3b3pjQitEbUFPT2FtYjgva0d2VC9zNXI1Ly9mNFBR?=
 =?utf-8?B?UUUrYnF5YS9qaWVOa1k3ZG9uUHVYaFZXMDJpa3dLVDF3K003RFkrRzBmemQ3?=
 =?utf-8?B?ODMrNW1YRjJKNHRUSEY3WmFYS0syM05ZRTZoR1QrRi9GWlp4Y3RsRjdFZ09Y?=
 =?utf-8?B?WStnTnRSNnM4enliZklLVUVSa2RPNkNUWGxudE52WkVZRmlIbUdKSHJxTW85?=
 =?utf-8?B?alRQY2hOdHl0U3Vyb1l1Z2pDTURjNDMxT3Y3YXJURDBSZ29FeFpjMS94WklS?=
 =?utf-8?B?Y1NHVHBBL1haWDJJaXlWckdHOEpTWmUyMzlPdTYxSzBrdWFXVjd4SDhHUzdi?=
 =?utf-8?B?bE13anZmOS9BdnZhVW1KSFh6MTE0RVpoYVJKTThrSWQ2cUdlL0phc3p0NlNC?=
 =?utf-8?B?dWp0Ry81OFA2cXYrcHZQUUJpR041ZDY3S0NRUGZTNWdLLzk2S09VaTJ5ZGdi?=
 =?utf-8?B?YzVBRzNTZ1NiSzJPZXdTeDhSUyszc3dwTDd4STg3M3BTR1BMbkk3aEg3N2g3?=
 =?utf-8?B?VDBVNVhXWWdmTmF6S2prRHFFVmRWYThzazhSaVk0Z0t2S2N6ZVA1TnV0MExt?=
 =?utf-8?B?TXNkUnpsais3SlpmZ1lza1Q5Sk8xTUJjZ0E3OG9QZUpscjZ3dXd0cEJWeU1h?=
 =?utf-8?B?L0hNc1BWR1lZMFA4TjduOUFTQzk2blVYTHhTTU15TGdkbHNVRDF3TE1vRk96?=
 =?utf-8?Q?i/vU7S?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 12:37:49.2399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73682448-fc76-469a-1efa-08dd992d763e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B91.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217099

T24gMjIgTWF5IDIwMjUsIGF0IDEzOjMxLCBRdWVudGluIFNjaHVseiA8cXVlbnRpbi5zY2h1bHpA
Y2hlcnJ5LmRlPiB3cm90ZToNCj4gQWxzbyBub3Qgc3VyZSBpdCdzIGEgYmlnIGlzc3VlIGlmIG1p
c3Npbmcgc2luY2UgZmlsZSBpcyBhIGRlcGVuZGVuY3kgb2YgT0UvQml0QmFrZSBhY2NvcmRpbmcg
dG8gdGhlIEFTU1VNRV9QUk9WSURFRCB2YXJpYWJsZSBpbiBtZXRhL2NvbmYvYml0YmFrZS5jb25m
PyBTbyBiZWluZyB0aGVyZSBvciBub3Qgc2hvdWxkbid0IGNoYW5nZSBhbnl0aGluZz8NCg0KSGEs
IEnigJlkIG5vdCBub3RpY2VkIHRoYXQuICBZZXMsIHRoaXMgbGl0ZXJhbGx5IGRvZXNu4oCZdCBj
aGFuZ2UgYW55dGhpbmcgYXMgdGhlIGRlcGVuZGVuY3kgbmV2ZXIgaGFkIGFueSBpbXBhY3QuDQoN
ClJvc3M=

