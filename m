Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD17C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 20:04:39 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.35])
 by mx.groups.io with SMTP id smtpd.web10.2346.1748549069564302165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 13:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QMT0PxoY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QMT0PxoY;
 spf=pass (domain: arm.com, ip: 52.101.71.35, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KcADoVks5SxGn3mk3LwiI4QimmxYHX4C8PFzxoloGno3V8ZpJWo4mX2KdSeLkCC+EFx06THIWBuy8JjXjgd/CZTHQ7LQtkL0sTLOwzLkY1eol7VqadWyFldaT5EEjLgH3g/1sU/zsgg5gBQMEQBVGTkvbQEKW6Kax+ySw1O/9FV5r9YB2McjCfJf64tkO/dtoM3q209RFzPKJpJ2VC5+/fnGgXoWs03jL+yne2s8B309v8i8IgzpZxiqhC6qPGp8blupMA1DZlzbZsUb7LqwmjoKzeE9oN+HcmbmRfIwVnTo9WnZtWO7LpaOzp3S6V3zG6roLFHxu/k2pQS1MPGWDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0wdHzfGCl6HYDYM2f9sPSBeJXj2X7qMttU4CTekkVc=;
 b=ai3GaXUhvEHso55/q+Ao//4WDuhC/NlUoelSwd5onNQSms/EKbQy153/6kBHe3succgkbtbsBHXA26vRHM6zXBQO9MSK8VyoiycF2jHBUQqQc8UQrixcF9OpsPc4JgceNhKG7ff7/bSmmL3nCW3+C2aqm3pPq5H3eTNFCjvrO3t3noBMF7ZJjDQ+Bm+C80sZGf/xlHylhIUNgppapjL/N/jOnwxbAUDwMXd87E3nE08To3TkgAsLSVHPp/SvDGWb86uX/0OKL83Pzabw0DjvMcUOl8orC9SB8tLYdW779AOfWdCakLIrObb6UkzQec+RymrNSjaiWpuD99EIH+ubXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0wdHzfGCl6HYDYM2f9sPSBeJXj2X7qMttU4CTekkVc=;
 b=QMT0PxoYl9BcCF0NEacis+SQFWl6j0TDDinkb3nIj1jJ5xvBOb07YeEVd6SquEMA6w7nczviTal7XzmBuVGfaQCYXMbHubsQSfyWsdHvd+lfgjhKxu9RketGizh1tOUV+UFBnHBo/2BigumSFoWqL6ktphpmOjwXSarAUu0Rsgg=
Received: from AS4PR10CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::14)
 by GV1PR08MB11027.eurprd08.prod.outlook.com (2603:10a6:150:1f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Thu, 29 May
 2025 20:04:22 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::d5) by AS4PR10CA0011.outlook.office365.com
 (2603:10a6:20b:5dc::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Thu,
 29 May 2025 20:04:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 20:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwUVzexpTb7dOgkNnW+MP6PXxTnz8ZhY5AxxHRzp91rda5yPhtB1wsrfo9lQmSH+qNJfyegg5H98qwHInkE76zagMW02oovPWaYDuVzKsSp4wPtzMdoGja/7WsUvAtil1lyo+N6puiqodWPNhCzkWMTpS6CxCNN5sJItcX5gveWTFemsxAAW7RPrH0+bQderGgOVLZsKBdgeI47wT/L2LTMHFf/XkXLzxNFHADRtVi/pPLZklKb5vV2Cql8MQ1jgu8581Czma4CgqPXmh98Ni30brltYpvZcFptaPkuMA1eP9NGK69ckJZqGcizrUp79oU8QcJkcPQpY0SE8Ofa4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0wdHzfGCl6HYDYM2f9sPSBeJXj2X7qMttU4CTekkVc=;
 b=iLDWV8h1FtNe8PXqS71aAkyPnrFvtQFudHYrHtqNbxqq5y5s9zvN/tck6o/lQIn2TWH6ICFilNk7ufnRNU1rcqzkyH9CW54qQARhmhbNy5Tl4oRBJ5fGrqwskqqpPlqwh1ARU1kTtxktlLVOhUjG6vBK7f7Gnjp3Wt3Iu+MpzywAxTjNyDarD/oUuOnDoarjohY8PnMJkv3jevkAgFbK+pu0zz+OIeY8qmmm7jLj4p1uzgeTbLbdhoTHEIvoC0A2cOrTl2Ce8uCbpJEohkCZIZLoxllYcCLC11nD4yrHcgF9PF7TweT7TtGOz9nYVd4QKWmQlVHRelsIO+qQp2LCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0wdHzfGCl6HYDYM2f9sPSBeJXj2X7qMttU4CTekkVc=;
 b=QMT0PxoYl9BcCF0NEacis+SQFWl6j0TDDinkb3nIj1jJ5xvBOb07YeEVd6SquEMA6w7nczviTal7XzmBuVGfaQCYXMbHubsQSfyWsdHvd+lfgjhKxu9RketGizh1tOUV+UFBnHBo/2BigumSFoWqL6ktphpmOjwXSarAUu0Rsgg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7498.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 20:03:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 20:03:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, "koen.kooi@oss.qualcomm.com"
	<koen.kooi@oss.qualcomm.com>, "eichest@gmail.com" <eichest@gmail.com>, Stefan
 Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
Thread-Topic: [OE-core] [PATCH] systemd: Allow overriding PNI name policies
Thread-Index: AQHbqThrnqIr45jFlEWDNLvLYzmy2bOja9SAgADovgCARgKGgA==
Date: Thu, 29 May 2025 20:03:49 +0000
Message-ID: <930EFAE5-0AC3-4458-BA40-898F7759FB23@arm.com>
References: <20250409101545.5936-1-eichest@gmail.com>
 <CAJdd5Ga7-Swcb8Zej8dpuLP5AzuBHiTmFVSatL33Biwjhym+rA@mail.gmail.com>
 <A1955164-126F-4B34-B796-B2CD3E530AF7@oss.qualcomm.com>
In-Reply-To: <A1955164-126F-4B34-B796-B2CD3E530AF7@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7498:EE_|AM4PEPF00027A68:EE_|GV1PR08MB11027:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec0c2e3-3a3a-4072-95d2-08dd9eec00c4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?L1JOYXdiTlJBa0VqbVFueGdFM1V3a3lZRXpBdzFJTGV4ME41ZTZkWnorOTh6?=
 =?utf-8?B?MGt1VVNmblQ4Zy9keDREMUpFK1dSOS9lWXliWTA2V1pXYnBJQkdmMHovTnVI?=
 =?utf-8?B?eU0wdytKc3JDTFFTMkcrckUyWlhOd29nZEhwY0tnZUVkdTh3RGRtSkw3K1hk?=
 =?utf-8?B?V2tMcEJLSU0rNVB1ZnZScEZQWW1JdC84ajhuMGhDdVlpWGRQemJzNVpoeDlN?=
 =?utf-8?B?aHRGVkJmUEs1R0xYaWpPMmNpT1hZVWUrYnk3dkJqRFpQejFnR0ttRWtSU09K?=
 =?utf-8?B?RzdVR0tBOTNSeFR0R1h4cFBwc2p1WHgwL20wOFJNaUE2K294Z2xkcDg0Q0lV?=
 =?utf-8?B?c1J5b0wzYVIxWkFYdC8xR2dCZWNNMU1PS1V2Zi9SQnBGY2JiSm9Nb2RyRURX?=
 =?utf-8?B?MnhPYlZYdGlCekpQbGtnYkFBeitxNG1VQ0ljRWR1Tk92NGdIRDdOZU5EQ0h5?=
 =?utf-8?B?Vys0bGFESW9ZdVRQVWM4THZGU1hhdmdLVWQ3RGIrazBwWlJUbGd4UVlqajlG?=
 =?utf-8?B?ZjRRNWdwWTVJenZBM0M2emxLSldudUdYSVo1cFdpSGtaaFdqR0JLZnY2bG5S?=
 =?utf-8?B?ckJHZml4RStyTFdITU5YRlZmdmpKYzd6NXp5OFZBbVdQSHMyNkc0OHFJUEF2?=
 =?utf-8?B?OEs1QlNkVEVrNTB4c2Q1WmZhRUgyOTVidDJMdy9qUU01RHFKNkUyZ2pMa1VS?=
 =?utf-8?B?ZGFoczFubU16Zk5nQ0FOcmgzblh3c0E2RWVHUEhrN2hmSUYrOEw3b0svZnFO?=
 =?utf-8?B?cXhwb1pYQ2lKZUwyZnE1K1ZJUTFCMVFTbk10OHNhOFNsQW1YeTBqM0czWHJZ?=
 =?utf-8?B?RkJCaG9Oam53Tmx5ZWV5SkFQQVIrbUE5V2RSZkxNcGUrZ2ZzdFVxNEZjdThn?=
 =?utf-8?B?NEdJVW1LQ1RqS0cvc3J6NDliT05kd3VoaUpzTW90dXdQekZZWVF6OGtGN3dL?=
 =?utf-8?B?cTlBbkpyblFtaENYQmxmVDNOSWN3ZWJ5TllUemo0aUF2N0txcVV5Y3hqOTZD?=
 =?utf-8?B?V2VKRGJLeHoxRTlnTWN0SUxlVGdnR204R2dwNTVTZzJEeFZGbzcvaXp1OXJJ?=
 =?utf-8?B?VFFwd21ySHY3RUxqNjJRa3BGMFNIVXRDcmpBY3FrMmFBNlR6T1pJMXl4VmpK?=
 =?utf-8?B?Ui9QSmZaeUtHRlA1TUhYTWI4N29BTmEvdmo1cVBMck5ZUjZScWR4bjZYTUw4?=
 =?utf-8?B?T1VDbG1GSXJ6eE42Y3RlMnBwcitsMkxERUhLZFZCRllLa2RoWG5JWmlQQW0r?=
 =?utf-8?B?cHJJOW1OSml2TWt4SG9GQVQzam9QNWMyWE9oMUdFQUdVVk5XTFAzT2N4QmRT?=
 =?utf-8?B?MC9XS2NETXlTeFR3azR6dXNhbjVTVUo4ODJDM1hIN1FnMFFGVWd0V3VscUEr?=
 =?utf-8?B?QXFDQ2d2dlZRYWdET1F2dTdESmduUkZUSHdVRDIyQzRyTi9rOWkvODBWWlIw?=
 =?utf-8?B?ZmpTMXZoTUFQTnZMOSt1NUVsaXFVbmgySjUybnNRTkpuVExscjh0aHM3cGZm?=
 =?utf-8?B?OFpnNUIya0wyN3NXU2FMR0xPNUU5WkdGNWNWWi9uWmZsRXpzMzA1My9GajJw?=
 =?utf-8?B?MHp2MTdXYXRVdXNmVERnekpJRGRHRHdoYUo4VFQzOUF0ODk5M0hBenVHd3Rt?=
 =?utf-8?B?cFcvYXpId2g4eExEdDUxUjFCN1RzdXJHeEE1WXdlamhjT1JKdXV0VGZmM1ps?=
 =?utf-8?B?alJ6emZIUnplenV5YUhZWnlMUFdvRzBDc01xSExmRThoanM1ZFA3NE1DQmJn?=
 =?utf-8?B?aDdVczl5ZU56cEt1ZmRmeWczVzM3V01zLzc0YnVnWll0OS9yT2NuWXNMRThi?=
 =?utf-8?B?OU55b0NRSmlFZjM0YlhuZ0lrQ3o3SFUxWkxaYWxBenpMM0txaWtEb05iZU5v?=
 =?utf-8?B?T0NrNlVlNURESlhqaG9ZK25Pakt5RmpYVkg0NUtMQU0vUjcyMWtzTW1CNDFU?=
 =?utf-8?B?SU5MVVFyMlBIem4xMUx6Q3B1YW91UkNuaDZOWm9FRVFnVlZPMTVrNFlHR1Ni?=
 =?utf-8?Q?4VRDgYI83+vhu2QQvHOZq1Qq5EijMo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFCE05D46872E8498DC7807E6842A1EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	73eb1f24-d207-45b1-ecea-08dd9eebeda6
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RGdRZGRkcHQ3cDdCMzZFOTNhRnRHZE1rdnIvQ1NpMWp0VjU2QWRGRXVPWGxP?=
 =?utf-8?B?RFJwRkJJYXB0ejV3V0JDSGpGbW1WSnRZZXMzSHlla0RPcU1qaTJNRUVGVHhR?=
 =?utf-8?B?SFh4cnVuRDArZXJaQUFJRnBBcm1qRVFtNnduUFZ5SkE5bU9yOUtsSVBvVmFw?=
 =?utf-8?B?NzF6M1E1WENJS202U3p4a0NZRVNKQ3lDUjkxWkJiTFhZRUJ1MS9CNHZ2dHpx?=
 =?utf-8?B?ZElFSmltMFYzU2VBVWhWZHVMMk8xL2Y0RGl4VG91RmpXMDluNzRzK0NhaUZT?=
 =?utf-8?B?MysvL0k0NE1KakRVeklmNHlWWlJSeFFheGtFYUZOa1BQSGFrNXlzSURTQ2U1?=
 =?utf-8?B?UGV5N2g3OW5YSE5nWmxpVk1Nd2gzeFNVV2xyOGhSOG9GcHZGQmQzT04xTzBZ?=
 =?utf-8?B?YmRFL1U4T1R4MjRlbUNMRzcyOVUvL1lEaHA2aUhNaXFNYUF1V0xyOHpDMzNR?=
 =?utf-8?B?Z1VITGc3cnpZU1V3YWtQM2wwZWF5SmNmWVNjY0RaSThRdzYya1lxTEpISWM3?=
 =?utf-8?B?bnFUQUpBL1lMMDVBNDF3WHN3ZDZaR3F6cG8vem5pUjh6R0dnaUw3Y1hSdHdl?=
 =?utf-8?B?V2piaGRQZDJiZHhHbk52MU5ZUkdQdnNZNE5QUkx3SHBnNWR2NGlVK25oSlNB?=
 =?utf-8?B?bVlSdEkyMnY0R3RodEIyRXVielE5TmtiZy9tMm90OS9LNjNmeS85ZW5KOWJy?=
 =?utf-8?B?VTVSd1NSRXR1dU5jckRKNVpzdTQ1eVVyUGk3bCtXaDd3Um5yWTQzNDNhZnlp?=
 =?utf-8?B?YzFjM1J3NFJDeDQ2Y1l2VFhqY0pEU0kxUnVMYnozSHQ4clZYZnA4OXVFdFRH?=
 =?utf-8?B?dGxtYXI2Sk01emt5SHRNNGpCQVBVeGRQUzg1S3hGcG1SMTlDVGwvVFhGNWlk?=
 =?utf-8?B?L1ZBcTdVbTBFWjJSR2NyaGZlemR4dkRpL3J1Yk91UDhjdG1QczBTQytKRHd6?=
 =?utf-8?B?czRoWjJkMjVSdHE3R2t3d2w0a3EzRXJESWd4RzdYWDVwWG0xdjJydVYxbTJP?=
 =?utf-8?B?Wm9iMWJOMTBMSkE5ODdRWGcvdUljUks4L1Y0cmZ4M3lhbGhEOE5qT1FKUDc1?=
 =?utf-8?B?WEhhUFJ6Qks5M2VqQjZ2WUZNK1UyT0VLOG9XL3hZcGdPK3NYa05Rc0sxeW5q?=
 =?utf-8?B?ZzJrNkJSbFNPTDl3RUNNV3N1NkZUMFBpdlgyeUwwaGhGTlFoRVgrSG05eEp1?=
 =?utf-8?B?c2JYb21HWmlxMDMvekYvMXZjaWovNDdNcGprUkwyeXo0Zy9yamgvVnQyRWFL?=
 =?utf-8?B?a1pBUHN0SXdEc2g5WURHV001QkJDdmhqTWRHcXkycGdaNDVpQVBRem9XSGxJ?=
 =?utf-8?B?WnR3emUyb3ZsSGNPaC95RWZ0SDlCVGJjQjR0dzljYWlzQXVjczl5R2Qvc2Iw?=
 =?utf-8?B?dGFSYXZDRTlGQmRTbHo0dnlZeU5iTjdBcm81eGQ5SUdPb2dNOVlLMHpvRjN2?=
 =?utf-8?B?VTMwR3QvaXNpYmRVcTlFY3g3ZzRCTkFKaHJURHpGazFCeFp2SzZ2QzZ4VERQ?=
 =?utf-8?B?LzU5cnNrVi9JUVQ1eXBldzNqckRzN2JSUk95RWdva1F3WW9hbXRwdHZiSGx3?=
 =?utf-8?B?Z1BxRllnUXJCampNWklDNnlaTDNxYTRNVkJPSmNNSDNERW5rblk3SlNFMGg4?=
 =?utf-8?B?VitHQUV3UlRoN2MzdVp1RkRyNWVpYXBKNkJvTHZQOWRqZS9kQTJZblR5TkM1?=
 =?utf-8?B?MGVWRHIwalgwMzZZaTVKQnA1UGsyM3ZrQ3NDYVkxdGwxeHVRZFkraFpncHZy?=
 =?utf-8?B?QmhDejZZZWpsbmZxRG1pcGZyZ2Y1QmsvOG5HeGpTK1R3eVpuT09WQnh0Q0Vx?=
 =?utf-8?B?d0NhOUhMZXBQQThqWC8rZlVNVzlRak96MWx0N3JCVGJsSU41SDZVVjFJTVNk?=
 =?utf-8?B?b2hsbnlndy9Qdk9rOHZVUzZ2aDZpRVZFS2xraTNRVTJteHFnVDdJMDN6TWlT?=
 =?utf-8?B?NHRNdFI0U3k2VjdxZkJQMlZlUlQ4SEd3U0pkNUE3SUFhZ3dYRjZySUlJM1U3?=
 =?utf-8?B?YXM3QkJxUk8vRVhrcjQ0SFBXeW5DczhqTytMSjJwTW5vZThPYUJsUVZUaFg2?=
 =?utf-8?Q?dZP1Rr?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:04:21.7980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec0c2e3-3a3a-4072-95d2-08dd9eec00c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 20:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217433

T24gMTUgQXByIDIwMjUsIGF0IDA3OjU2LCBLb2VuIEtvb2kgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPGtvZW4ua29vaT1vc3MucXVhbGNvbW0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gPiBJdCdzIHZlcnkgZGlmZmljdWx0IHRvIGNvbmZpZ3VyZWQgc3lzdGVt
ZCBpbiBhIHdheSB0aGF0IGlzIGFjY2VwdGFibGUNCj4gPiB0byBldmVyeW9uZSwgYW5kIEknbSBu
b3Qgc3VyZSBhZGRpbmcgdmFyaWFibGUgImtub2JzIiBmb3IgZXZlcnkNCj4gPiBwb3NzaWJsZSBj
b25maWd1cmF0aW9uIG9wdGlvbiBpcyBmZWFzaWJsZSBmb3Igc3lzdGVtZC4NCg0KTXkgMmMgaXMg
dGhhdCBJIGFncmVlIHdpdGggSm9zaC4NCg0KSSB0aGluayB0aGF0IHdlIG5lZWQgc29tZSBoZWxw
ZXIgY2xhc3NlcyB0byBtYWtlIGl0IHNpbXBsZSB0byBjb25maWd1cmUgc3lzdGVtZCBhdCBhIGhp
Z2hlciBsZXZlbCBpbiBhIHNlcGFyYXRlIHJlY2lwZSwgYnkgZHJvcHBpbmcgaW4gY29uZmlndXJh
dGlvbiBmcmFnbWVudHMgYW5kIGxpbmtzIGFzIG5lZWRlZC4gVGhpcyBzZXBhcmF0ZSByZWNpcGUg
Y291bGQgYmUgbWFjaGluZS1zcGVjaWZpYywgdW5saWtlIHRoZSBzeXN0ZW1kIHJlY2lwZSBpdHNl
bGYuICBXZSBjb3VsZCB0aGVuIHJlbW92ZSB0aGUgUE5JIGxvZ2ljIGZyb20gc3lzdGVtZCBpdHNl
bGYgKGFuZCBhbnkgb3RoZXIgaGFsZi1hdHRlbXB0cyBhdCBjb25maWd1cmF0aW9uIHRvbykuDQoN
Cj4gRm9yIG1lLCB0aGUgaXNzdWUgaXMgdGhhdCBPRS1jb3JlIGFkZHMgdGhlIE1BQyBuYW1pbmcg
ZmVhdHVyZSB0aGF0IHVwc3RyZWFtIGhhcyBkaXNhYmxlZCBieSBkZWZhdWx0LCB3aGljaCBnaXZl
cyBtZSB1bnByZWRpY3RhYmxlIG5hbWVzIGZvciB2YXJpb3VzIG9uLVNvQyBuZXR3b3JrIGludGVy
ZmFjZXNbMV0uIEhhdmluZyBhIHdheSwgc3VwcG9ydGVkIGJ5IE9FLWNvcmUsIHRvIGRpc2FibGUg
dGhlIGFkZGl0aW9uIHRoYXQgcmVzdWx0cyBpbiBwcmVkaWN0YWJsZSBuYW1lcyBub3QgYmVpbmcg
cHJlZGljdGFibGUgd291bGQgYmUgZ3JlYXQuIEl0IHdvdWxkIG1ha2UgUE5JIGZ1bmN0aW9uIGFz
IGludGVuZGVkIDopDQoNCkFtdXNpbmdseSwgdGhlIG1hYyBuYW1pbmcgd2FzIGFkZGVkIGZvciBz
b21lIFNvQ3MgdGhhdCBkb27igJl0IGhhdmUgYW55dGhpbmcgZWxzZSAob2UtY29yZSA0YTdiNDJm
YyBhbmQgMzdiZDhlOGQpLiAgSXTigJlzIGFsbW9zdCBsaWtlIHRoaXMgaXMgYSBtYWNoaW5lLXNw
ZWNpZmljIGNvbmZpZ3VyYXRpb24gdGhhdCBzaG91bGRu4oCZdCBiZSBwYXJ0IG9mIHRoZSBjb3Jl
IHN5c3RlbWQgcmVjaXBlIGF0IGFsbOKApg0KDQpJ4oCZbSBtb3JlIHRoYW4gaGFsZiB0ZW1wdGVk
IHRvIHJldmVydCB0aGUgYnVsayBvZiB0aGUgUE5JIHBvbGljeSBwYXRjaGVzIChsZWF2aW5nIGp1
c3QgdGhlIG9uL29mZiB0b2dnbGUsIHdpdGhvdXQgYWx0ZXJpbmcgdGhlIGJlaGF2aW91ciBvdGhl
cndpc2UpLCBhbmQgaWYgc29tZW9uZSB3YW50cyB0byBvdmVycmlkZSB0aGVtIG9uIGEgcGVyLW1h
Y2hpbmUgYmFzaXMgdGhlbiB0aGV5IGNhbiwgdXNpbmcgYSBwZXItbWFjaGluZSByZWNpcGUgdGhh
dCB3cml0ZXMgYSBkcm9wIGZpbGUgdG8gL3Vzci9saWIvc3lzdGVtZC9uZXR3b3JrLzk5LWRlZmF1
bHQubGluay5kL3BuaS5jb25mLiANCg0KUm9zcw==

