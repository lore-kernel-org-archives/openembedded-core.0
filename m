Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDA5C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 13:42:39 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.24694.1719927751753165580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 06:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rc5BX5ap;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Rc5BX5ap;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jrgCgT2lmyZP5VclRYxzcTi/4WrvQJZ4RSA5+PtN7J+uHkdVBkeCNXLTnwrv2jT12+9iRO2xuY/ytUDA6pDj9Jg/S991sMO9nL3thIxieBlBJhKyIwwDD30gZpk8oq+43XGkNlci7Vj2f719t2mA8OI2JssPti/mQaUwPxKPvUmJ1PAU1jMb0l1iJw0U+uevFpZQIic5jg2qj3LMIr2w2KxLLS/PBNVVP8fJwSPH2k5AnauciETfZiNbwFePZyeY7MmgBObk9HAb7mLCYg47ZnKOeEOD/Cr2UMbrJwhdf69B1dCoMxqBBgvsYsBs70fsWXNDfwFU9jjh4vmbi5MH0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMXm/bIkOXQLpoVMAn/qCXjvMZXDR2ftzm8bFczJ2B0=;
 b=HYhuABLr0XV/Eh/xLyqxU0kXnWo5xiu3pf3c9Xy+qLxNom5PrIc9SpR7ihinYekDStOFvXgxcLhbTmrjY4tB2ENiwYE2b0AgAb3YKsZvGLqoSwGXgQcL0wIajgvMHcW4Zb1XVhlYKSU0fEdthHniitynG1FMQPw9AQ9KRAILVSxUFMINXodsMwHfC3mKpJAzbQv5dr81xM1H9sQn2svbBxXP7LZfvC5Gu7O5qoxwYaMO0jhBQN/qoa/Soj2iEpH6zOqgV+R8coLCkh6ImeSWgg+GKUYdaydR31Df6kJD4Kb25yuRg3QoP5qLOMzH6u8MFzWfHsLvcIDpw3az78Z3kw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMXm/bIkOXQLpoVMAn/qCXjvMZXDR2ftzm8bFczJ2B0=;
 b=Rc5BX5apWJmZc6V+qXX8bJndv/9kOSSUHgYgNe1+1gd3Q2EFMjj19FIKyRfTqohVYN8Swg+5lC0A97YhOqQT1SqnCDUH2UqOMW+pxe4SZ+QwGx6NXaU+enz/VGm+/0UGfW2meFBi6Nuvjts6Fgz7eFXBFnKWKnxeUhLbJvkIF9g=
Received: from DU2PR04CA0290.eurprd04.prod.outlook.com (2603:10a6:10:28c::25)
 by AM7PR08MB5303.eurprd08.prod.outlook.com (2603:10a6:20b:102::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Tue, 2 Jul
 2024 13:42:27 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::14) by DU2PR04CA0290.outlook.office365.com
 (2603:10a6:10:28c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32 via Frontend
 Transport; Tue, 2 Jul 2024 13:42:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7741.18
 via Frontend Transport; Tue, 2 Jul 2024 13:42:26 +0000
Received: ("Tessian outbound f0ed4ebc29ad:v359"); Tue, 02 Jul 2024 13:42:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 304293b26f0467e3
X-CR-MTA-TID: 64aa7808
Received: from 8891c8844a38.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5BD77B38-644F-4899-AB57-2BD416EDEF3D.1;
	Tue, 02 Jul 2024 13:42:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8891c8844a38.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 02 Jul 2024 13:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THPZlxlfpZg28GKU1970cyyKfXFPVg9shurPABXRon7ckeFf3T2L60bzFMS/dsqlkYFPCf2dRsX5wHqbsmCYQ38400KhO7BWEn5jyOpIioMgPtNAK9SFvdc75Nfcg9dME3BaeQRiHB3YIO+1bV8ZWLcLmpLaw4tlKq8TKN4d2HkxzFpEUe8L3HVIz6tcm2lkCY+xOD1bAycMPEx0Ew1CEh46D/6XsVmziDAekzHgYWhoNzHtd3+MxXTzn5WmfCMNLMO88sIvyUY7gki92cdDIrcihulxzXOQ9RlXvDIZTVmei6hCLmIUXwhjBoogUdS/rlV9xgSzXvKlebSoYyN6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMXm/bIkOXQLpoVMAn/qCXjvMZXDR2ftzm8bFczJ2B0=;
 b=DrNOmg2T40bKzdnEH0ik3G8YSer+yfHLINA/eAY043nojRQ/hnPvaHUQ93YLk6zsn9X634LeFlV4XXKR1/oGPb9c9ywgJ/PL6MkbRARGHXkMumYCcNmGav4rvCeocBnOhgnSUDdXhlnrVCuh2AsQTXtfpiTM+9sFlGIZf/U7i3LTVbTG784QH9F4J2cr9avnItJzKpiSQiYSjOSfqjknqz5vFhQs/01l/qGBbg4rpQSWsVCxqDYcKNKD8EDh3Nqn+p4mTVpmpdExYUa9EWFqqZxN57K/dfmA2koOoN2OmktBFfyUENZAAukRId5NIpmTxE57MhK3c+CFPxninnzePw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMXm/bIkOXQLpoVMAn/qCXjvMZXDR2ftzm8bFczJ2B0=;
 b=Rc5BX5apWJmZc6V+qXX8bJndv/9kOSSUHgYgNe1+1gd3Q2EFMjj19FIKyRfTqohVYN8Swg+5lC0A97YhOqQT1SqnCDUH2UqOMW+pxe4SZ+QwGx6NXaU+enz/VGm+/0UGfW2meFBi6Nuvjts6Fgz7eFXBFnKWKnxeUhLbJvkIF9g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6656.eurprd08.prod.outlook.com (2603:10a6:102:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Tue, 2 Jul
 2024 13:42:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.038; Tue, 2 Jul 2024
 13:42:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "kweihmann@outlook.com" <kweihmann@outlook.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-docutils: fix interpreter lines
Thread-Topic: [OE-core] [PATCH] python3-docutils: fix interpreter lines
Thread-Index: AQHays98MaRWDO27XUeso6CMddIWbrHjdaQA
Date: Tue, 2 Jul 2024 13:42:18 +0000
Message-ID: <545DB6DD-7816-4373-BFD5-753972A1F197@arm.com>
References: 
 <GV1PR07MB91203857CFAC6393A256F929A8D22@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: 
 <GV1PR07MB91203857CFAC6393A256F929A8D22@GV1PR07MB9120.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6656:EE_|DU2PEPF00028D0F:EE_|AM7PR08MB5303:EE_
X-MS-Office365-Filtering-Correlation-Id: b75b8381-62b9-45a0-51da-08dc9a9ccf8e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SE9lcHhhazJsT04vU1dlSHArTzZaMjJUQlh6M3pxSVF2VnpoNE5vdEEzV0F6?=
 =?utf-8?B?REFrbDFjK0lMWjk5bm9lckc1M0w3WWhrVnE1TGplT0cxNG9aclR5QmdGdHVj?=
 =?utf-8?B?cG16eU03LzdjNHVUL3VTbkZuSW1pNFVza05yeGFmUzlQRVFnYWRRb1F1YUI1?=
 =?utf-8?B?ZkdZWmw3T3ByREV6cGdtZXMwcG1GbCtkOUIxSDlqZnJmbHNrVk1IcXFML0Mz?=
 =?utf-8?B?M1pvSEg5a3FuSWx6bStOTlZVeFB6Nm9DZWlaRGhRSlYwWVNmc3pXYVVPdEtW?=
 =?utf-8?B?ODlwcW1vcG9iWkMvcDNrTURGYmgvWTVBWjR1NHdrSDBKR3IrWllxNCt6aWNZ?=
 =?utf-8?B?WE1Cajgxc0JpVVhTTUNUZTNIWEYvM3IvcmlVNG1GZFFWdWVhMDErMEdwMDFS?=
 =?utf-8?B?dmFnSDd6TWhNOStnTktIR1d2VHRDWkNSRy9vZE9KeWRvajhXbUNpY0J2Z1lZ?=
 =?utf-8?B?MGtNREg0R1BLQ3FGS1pldzZBb05NYWRDOXByb2VNS3RpbWxrTUszZlFOVFN2?=
 =?utf-8?B?ZnJ2R1NuQm9TZGRldFJtU21yRDdoZzVFN3JpMXlWZVhvb1R0eXg2MXl4ZTYv?=
 =?utf-8?B?VTh5cGZjeFdpcTVyZUltS2F6ZkQyUmJPb3hpejlzL0JRL0pQNjR6VjhoOUxF?=
 =?utf-8?B?L1Y1NWVMTkxCa05Dc3RFQ2JONzV2ZldXWUw1aXUyWmpVVWxJYml6K0VQOXZK?=
 =?utf-8?B?ZThtUUxvQTk2SjJ4L2VuaVZMZHE2dmNPTTZyMk5TaEwxdWFnRWpFUks0OXBE?=
 =?utf-8?B?Vm1KWmNsT1FDT3pMU3FjdzVNNk0xa2pQNnNvTTkvMHdBVzdFMVFVU1I2R3Uv?=
 =?utf-8?B?MWRML0ZWNStvb0RNcFVYM0loNDBGUzVVa3RpNlp6MTZQa1k2UHdiMTdNNDIr?=
 =?utf-8?B?ZStzY1NmUStZMFYxUWdJVHlWRFJGYUcxREdaN2o2WTFlMVFOSWxhUnNYMzJi?=
 =?utf-8?B?elE0a0tDWmhRTlFjd05XU2E3V3Vhd05TSWEwYldHQmI5YlhwRTZnR1NYcVhp?=
 =?utf-8?B?Ujd2VkNRbW5ES0k2N0lySnVTbzc2WEJoZ0dmb1lEbCtDRkZUTkxzSnFTSENI?=
 =?utf-8?B?VllqTXRENHR6NThsaE50Z0ltYmpSZ1ZpbzBxMklmc1Nqdk0rcGYzYklHVkQ2?=
 =?utf-8?B?MU1pS0sxQVROWkhJeEJJczJYVy9RS0J2Nmd3dVBlc211QzFVc3VEeHEyT3BK?=
 =?utf-8?B?Ym1HeDN2ZXI0NDQ4ZFlKM1dla0I0dG9KQ2ZKY1lRR3ZKWVdMMWxBR0hFK3hL?=
 =?utf-8?B?VG5XVHgvK2ZrcGtvM28zbEZ3aTFCR0pkWXNBQjg3N2s0RTVDcHllYU1teGp0?=
 =?utf-8?B?OC85bmV4YUJraWpmUzczbVMyaHBoNUUxSFNacHdSdHRZRDYrNTV2UHNTVDBP?=
 =?utf-8?B?UVd0NzZKUXRGVHl5bkc5UXJoank3ankwWXJHRTV3azFQMExRR2x0TVRJL2Zu?=
 =?utf-8?B?MWxvS0syY2s3eGlsU0VVb2ZFUFR1RmpPbnpjdEVYQ1RXOWhkbnp3R1ZIemJO?=
 =?utf-8?B?bXhDdUN3NGNkZWNNSUl6TnBla0RCdGFaV1dqNVIyTmNoU25QcWlkcnFBZnlK?=
 =?utf-8?B?SGhXVks5R0VXK2lEekhHSkJkUlFVY2FaU0twMTZuQTZiQmtKSXp6bDBnZUtu?=
 =?utf-8?B?bk1mc1gxaU5XRmFTc05NZWZRMjFqVUpRcHNjc0l3cWNwOCtvT2tqUkVlR2pW?=
 =?utf-8?B?K3NiSFRoRmNBNWJyMGs1RVpTVDJ1M2FUUzlubUZsNXV0K0IyNnY4N3ZtZmpm?=
 =?utf-8?B?bDNvQjg0amRiQWhiVTVLVVFaWmluWVhESU4rTy9PL0ZUVnEzRG9GRUZNanQx?=
 =?utf-8?Q?XihxlV9kVs6Q4ohMgPSTKt1naTlbzodskMa6s=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AADE51854E05294EA8BA0CAB55AA3F62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6656
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f44ae3d2-87f2-4873-91b1-08dc9a9ccaf2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1dlbVhOKzZrci81VVg3OURodENRSHVPdkw1M1dNUFY5WVZMU1lZcHNXVVVr?=
 =?utf-8?B?UURoZ0J0c2QwMXczSHlWc0h3a1NCZk5wYzYxRHZtWWVxN0JoeUJEa0l0TlRr?=
 =?utf-8?B?OUJ4YXBSUm5aZEVuem1aUWY1ZHY1dnhJM3FLVXkxeHY2MmlGYm9MVHNhcE1L?=
 =?utf-8?B?TnVaVXJjVXA0OTh5RVZlMU1jVTJ2S0ptZU1JRUZNTWZoTzJQVFZ0Q2o5SUtU?=
 =?utf-8?B?Z0hpbGd0WW1ud0g5QVNuY2RKYXMyTEpwU0NpZ1lacGE1dnk1bmo5bTJwM2dv?=
 =?utf-8?B?VTE2UFVFZUd4R3lPQTRPbDFsMUtDclEzVkE0Sk8xS2hpSHMvZ3lQT3dsU0Za?=
 =?utf-8?B?OGZBZS9mTCtHWm9TbmhLT0dIUFZZZkpzUDNiWkhKbUNQZU56aHZOQys4KzZQ?=
 =?utf-8?B?QjFCQmwrNUJnTS9iTFpzaUxwWTEzTDJZTlUyV1l4Q0g2T0F6SDdjelBTTVJa?=
 =?utf-8?B?SDZINlpoL2gyZGNlaWZTdWZHQmRlTTB2L29aYUFMdE5zMmpZWDhEK1FRWC9Y?=
 =?utf-8?B?OWR3eDAzM05sbC95MG5CSjRlUmdKWDNKR0ZEWlVzR0VUMjZ2TEhTVnBQUmxy?=
 =?utf-8?B?NS9rRWQ0cStZakQ5aGd5L25ObGNTVTBmNFU3b05WRXJXbmFUQUZrNjhKNEJM?=
 =?utf-8?B?T2NtclRTaWdCYWpoMmJtQmRHdEJpUmczQXRMSjBnZXN4dmM0aVc0ZHIzaUJM?=
 =?utf-8?B?bytHeXF3YmxSRm9SYy9QUGdwd0E0OHhqRjR5b1hLR0luRnRVL0NSZHpRTWJW?=
 =?utf-8?B?Z1N6UFJZbGYvaHQ1VFZJSVV4dUw1Wm93WVdWNStxZy9GS1BSNzQxR1gzWUx5?=
 =?utf-8?B?NDNGWEkvdUxCcW0zRFJRWjFPaTluNmxLbUx3SHNJSEtYQmpKQWZhcjBJMTV2?=
 =?utf-8?B?MGs0dFo4aExqNG5QazJkSk1SUFBadFUzRS9jRFp4WU9mL2Ywei9SbUhFd2Zw?=
 =?utf-8?B?UlA1U2FqLzJWSFFHTjdYTSt0d1NiNXNqYk1kL0VkOXd2Q0QzQ0hsK25Kb1p2?=
 =?utf-8?B?UVZQbmtEb0FGQndsc3NLSE5HNXpNVUxsYmhBQnVBejI4V2tSSVFobEdTbm9F?=
 =?utf-8?B?MS9DK3RML0huTUU3TlM0dFRaL29hNVczVVN2VVJ0eEVOc1EzY1o5MkZWNFFC?=
 =?utf-8?B?YUlEU3dsbTBaNXdWZThrZ1RuaEhIRjY4TUdLUWRkWXhXTDdvaEtXSU96M0U3?=
 =?utf-8?B?RHlwdFdydEZ4elhPVXB4elRrYjVuM3h6SThTaWhSQ1FnbllvZ3d2ZCtyVXpN?=
 =?utf-8?B?S0Z0LzRDK2p0clltVkZ6OFU5SGNQRWF6L1FPeHZ6SFF5aHhnL1ZNamlyT2dV?=
 =?utf-8?B?NjRLM2loVEJKVUlkK0E3dk5iOUpBak5MMzUyQkNObTdJRExYL2VCMy9Sc04w?=
 =?utf-8?B?SEpqMlFPRGx0QkZ2eGN5UU5vbGkvcmVlTGF0QzIrc3B2czR0c0M3bXQrSFA0?=
 =?utf-8?B?Y04yUFo2L1BSUVJiOTU0ZGNhb1dvTUxuMXkzaElJK0RZSzhZcWRwSHkxMEFp?=
 =?utf-8?B?c3BzVk1TMnhjSjNKa0IxWjRPeWkrSmhxbzBrTDVEcGM4TXNNY1psVjZYeHQv?=
 =?utf-8?B?Njl6Smkwcy8xM2MxSjk3ejNzSTJPekQxaVBKRXBkakY4Qlh3MEovNmZ4ejJj?=
 =?utf-8?B?K3hGQ29leTg2NkN0VllyY1krTXpiRGZpRzIvc29pV2ZGaDVYS0RKMVpXQW5Y?=
 =?utf-8?B?SEdUT2FOdXZVaHhaVW5qOXIvYUZOZ2NBdE1UdlR0T3FJYWF6akY2UzA2SGE1?=
 =?utf-8?B?M04zRUdWNkVKS2JmYUsxNTZkd0RWMWJjTU5RTmpnZ1hWMjhuQXFlNEk2d2hR?=
 =?utf-8?B?T09ZWDBteGs2Qlh0OWtwSmRwUitBTVg4RmJxekIyWE4vTnRYRVc4R1pNYy9S?=
 =?utf-8?Q?sxyGB7PcuysFR?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 13:42:26.7398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b75b8381-62b9-45a0-51da-08dc9a9ccf8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 13:42:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201424

T24gMzAgSnVuIDIwMjQsIGF0IDEwOjI1LCBLb25yYWQgV2VpaG1hbm4gdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGt3ZWlobWFubj1vdXRsb29rLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IHdoZW4gY29tcGlsaW5nIGEgbm9uIG5hdGl2ZSB2YXJpYW50LCBsYXRl
c3QgdXBkYXRlDQo+IGludHJvZHVjZWQgcGFja2FnZS1xYSBlcnJvcnMgbGlrZQ0KPiANCj4gRVJS
T1I6IFFBIElzc3VlOiAuLi4vZG9jdXRpbHMvdXRpbHMvc21hcnRxdW90ZXMucHkgY29udGFpbmVk
IGluIHBhY2thZ2UNCj4gbmF0aXZlc2RrLXB5dGhvbjMtZG9jdXRpbHMgcmVxdWlyZXMgL3Vzci9i
aW4vcHl0aG9uMywgYnV0IG5vIHByb3ZpZGVycw0KPiBmb3VuZCBpbiBSREVQRU5EUzpuYXRpdmVz
ZGstcHl0aG9uMy1kb2N1dGlscz8gW2ZpbGUtcmRlcHNdDQo+IA0KPiBGaXggdGhhdCBieSBwYXRj
aGluZyB0aGUgaW50ZXJwcmV0ZXIgbGluZXMgYWZ0ZXIgaW5zdGFsbA0KDQpUaGlzIGlzIGEgZ2Vu
dWluZSBwcm9ibGVtIHdpdGggdGhlIHVwc3RyZWFtIHNvdXJjZSwgSSBmaWxlZCBodHRwczovL3Nv
dXJjZWZvcmdlLm5ldC9wL2RvY3V0aWxzL2J1Z3MvNDkxLy4gIEnigJlkIHByZWZlciB0byBzZWUg
YSBwYXRjaCBpbnN0ZWFkIG9mIGEgc2VkLCBhcyB0aGUgcGF0Y2ggY2FuIGJlIHJlbW92ZWQgd2hl
biBpdCBpcyBubyBsb25nZXIgbmVlZGVkLCB3aGVyZWFzIHRoZSBzZWQgd2lsbCByZW1haW4gdGhl
cmUgZm9yZXZlci4NCg0KUm9zcw==

