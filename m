Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E30CAC587
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 13:39:59 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.60])
 by mx.groups.io with SMTP id smtpd.web11.9775.1757857192260300378
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 06:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NwnUC56v;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NwnUC56v;
 spf=pass (domain: arm.com, ip: 40.107.162.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vFx+F6lmd+acbadUtev5OsuDcPHltvKd3V+vHziqtm96uUJYQb+xr/LbrOz0HQN8w1A3rUxd4fGN5/7EXO7PO1Vv+rFZmSpW7ncSLWJ1fNi/yktvFAat8WPZ0Pc80lOZwX3J8JDIN3f45HtsZ4tXBf+cIAKEO8reSfxu7117hsWXKIXVATtwKG1MOUvn1h9SAj8sC+LSVsjKYzzSKYS3KryjsUSO1MEoHCfWK6zU4q3oGybDXPWEAQvSUveLUzXWAjwTm0aaCwf4d1XFNkZINqknkEgf995iVi43/ZHwMltoRc6lM2VdxCwaeW6LnHLtjdksGRS0tFnj7nL1JCXUgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6/9qeVMgxXFtEjeWGyHiVY19QD40nBJ12i3QrJQbXs=;
 b=w1cI02waFnsqR+FRx3ZMFVAusFHTEfQYJLeVySpE8KHYcJq3wAk5IjJM8VgRAE8JDuOR547b7e07bk0duX1IUaj0DvvcNHo5TwMBNzK++SHRVjDhQArviq4di47RMxImjcHEaDDHTTsCP7BTGR93Ldnjl/b5md/QWVfRjnJuBpjx+VlI+mkIYLo+uWfNOs9dZproI4Isb0//G7LdPjfQAYj3lSXwRgKaTSgT8gncevlIccaURJF6a09Ni+Tna4jCLmbIihMo+SfEBBctv5lIA4fVFJLzRZwnmfwZQqKGy1XYgGczMRmcnHfGcjFAAYxtax9JSn/rNOLaMOQ+s3ZxUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6/9qeVMgxXFtEjeWGyHiVY19QD40nBJ12i3QrJQbXs=;
 b=NwnUC56v0nsjDotf7kTWGxHWzJOpk8Z/NBoypvVh1T1lbuDVh85TDYk7jeVUOU3CQw+Icyzfuk2KJ2R2vfa5BMq91DpAYQ+9BwOjvCYB/xn/zMmsMYwDSWDRQF/I4Oom62AqasOwdvVLT/DS/lbevZyI3fB+ZUHU648pyzg3RqI=
Received: from DB9PR06CA0005.eurprd06.prod.outlook.com (2603:10a6:10:1db::10)
 by VE1PR08MB5805.eurprd08.prod.outlook.com (2603:10a6:800:1aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sun, 14 Sep
 2025 13:39:46 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::db) by DB9PR06CA0005.outlook.office365.com
 (2603:10a6:10:1db::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Sun,
 14 Sep 2025 13:39:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Sun, 14 Sep 2025 13:39:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FiQyfBm8ZUkLGf3GcNsR7WgodX8wLRlipUgy0Rh0wQG5X8N3sPmrgBibdsXIbLWW3v/fb1Nn5Ly6FYpl2ykIczh3y86G+UMPdXqk+hQGV5JVm439dXbwz+lES16ajHsSzfV6ODkVlBgn5xapAt2F7Q0Y3v+PiNtBwLXKl47LGhpyujUsuOVdG7P6kdUQq8cZWuHNtzShA8aH9433UF2OEx/rXIb/I3MhWs7rLBj2sMs5+j2aToNZFcoZ+3YV79qg/D07pdxkdZ39onK+HNeWyAAA3GYKOBoXv2j5UJtfw1C55/Eo0KcIFE7b1JomqQlJlFTprilEUxPaUpgT7AGnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6/9qeVMgxXFtEjeWGyHiVY19QD40nBJ12i3QrJQbXs=;
 b=Jw8KBx2OFzKGW5Y9og5jJZ1EhmG+cnu7K2AknDi8dU0EReqfaFpiADKJRs5QJrcyQmNMEj5k1x9I0LZl9Yave28rl8w7ErUqgQapkGoNH3tidU0uqg0YJbcd+O8bzAkdu2P6RdvSCVD6EL4ioAwSEfBMUcUXZJbKXz7nDnNCINxxUNxWVXEzvvlkgd5/1pVie4wTPwcbBwMHPv6lUABC8vqaaucseWyZ/1pNbA+Q+um0Bcz/CAcxhovZ2KCG7g49wJS/o36t5yRfHXoAuXYfZanxlAmcLB4Ss+7bAIduEb+k0BsUVVfR137ylZNbyZKA4tAJ0C8HoI4k/g8VGqYl3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6/9qeVMgxXFtEjeWGyHiVY19QD40nBJ12i3QrJQbXs=;
 b=NwnUC56v0nsjDotf7kTWGxHWzJOpk8Z/NBoypvVh1T1lbuDVh85TDYk7jeVUOU3CQw+Icyzfuk2KJ2R2vfa5BMq91DpAYQ+9BwOjvCYB/xn/zMmsMYwDSWDRQF/I4Oom62AqasOwdvVLT/DS/lbevZyI3fB+ZUHU648pyzg3RqI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sun, 14 Sep
 2025 13:39:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Sun, 14 Sep 2025
 13:39:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gawk: disable persistent memory by default due
 to licensing
Thread-Topic: [OE-core] [PATCH] gawk: disable persistent memory by default due
 to licensing
Thread-Index: AQHcJCDwx4uVCQ/S9EqUj+t6BKxP3LSSsZmA
Date: Sun, 14 Sep 2025 13:39:12 +0000
Message-ID: <B3399C0E-3C12-456F-8394-C429A872AA21@arm.com>
References: <20250912200740.2873851-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250912200740.2873851-1-Randy.MacLeod@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6217:EE_|DB1PEPF00050A01:EE_|VE1PR08MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bec181-a505-429e-a9b4-08ddf3942a46
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MGd2RUdkSW5iVkpvYTJZdVR4TkNkaFU1c2VhNUswREVkWEpwYzhCRDM4Ly9z?=
 =?utf-8?B?YVU3dGQ2aVFPUUtqYXhKSVg1SCtYQ3Eza1Jmc3Q2dFJQV1AzbXdhK3VubUx0?=
 =?utf-8?B?RWs1TWx5RE5PR1hjY1ZBUkE0bWtZZ1pJU0k5aGxGMmU4WE1PN3hoNk1RdldZ?=
 =?utf-8?B?SVI3SFlSVHJoZVM1UFZhNDY0dFdKWkVCeUl0V2MyNlV0TmlvSmxkRXBWTjN4?=
 =?utf-8?B?RVRPbE1haDlVWjZPWWhjVlZWbXBhWmxLVHZKOHVOMjdJcVdDRmZnWTB6SDN2?=
 =?utf-8?B?NHBvR1loRjZkS1hQSGwzSmY2VCs1M3QzdERXZ0p4WGkzN0ZLZWc1cmszVVNx?=
 =?utf-8?B?Q21wWmEyT3BJSDhZYzZmcnJRYUd5YnlHbVF4V3MzN1I0Rkx3ajlZUEJmTDlm?=
 =?utf-8?B?eVJOYmFmVzZRbjFpeFlxR0g5OE56Q2xQZ3haOW56eDF3MVJiSCtUN0c0K254?=
 =?utf-8?B?SU5CR2Zpd0pwOU9sYjhiaXZzcWNZQ0hVcStVQlVmRSt0YkJva01rem4rNzNp?=
 =?utf-8?B?RFgrbS9tc09ycG5kczV3SVBaMEhSNFV4OHZVR2x2elJHdDN2bmpuYkd5NnVi?=
 =?utf-8?B?RXZaUmRTK256aFZxZG8ya0hlazBJcjVXMnd4d0g4aEJDSi94Wml3K0YxcTNp?=
 =?utf-8?B?Y0J1Qkt3YWV1NzlWYWszaWd5OGx1MS9ua0pVZmVuQ29MaWl5MURldWZ5R0xS?=
 =?utf-8?B?azFrVFBwSTJiaERDSld6aGpLaWJocVNvck5mZVNad0s3THJsRVpuc0R5QXZL?=
 =?utf-8?B?TGNWdWxtSWd1NlpPQW1qY0ZnQmlCL21LaWxNMHNHdFN3eHVvaFRzN3V2bVlt?=
 =?utf-8?B?RTNLS004M2diSTNzbVh6VFRnaUhpSjMyempuNW1IcE5uZ2s0RUsvRGhDbm9W?=
 =?utf-8?B?ZFFFRnozNEhWWElNTVIzOEd5TXhyWHJ1QzJvbThJUlZMeldxQVZ1SkNiMC9p?=
 =?utf-8?B?WVR0eEZveEo2KytnZ2szU1JhT0ZFalpVbHNqVjVBaDJNTk5oSUc2UnlENXh3?=
 =?utf-8?B?UUY3VEwzUzd2dWhUTW5nQ1p6ZXhqaG9LSjAvVkVIR1AxNm1hOHBsbUVvejlE?=
 =?utf-8?B?VXJZM3pTbmg2QTRqM1dDR1FKSlVoZE9uUC8rN3RXVnJZd3dSQTNFaXk0WVZT?=
 =?utf-8?B?NEZlWmtHRnUxSjdsU1F5MDFDbjlENXZCNVNKTCt3WXhNNUdJUHBqVHhoMVAv?=
 =?utf-8?B?OUlxV1g4SE8zTW9MUHQ0UEhKYW5tWTFSc1VMUlplRnN0VTRhQUdMeGp4VEtJ?=
 =?utf-8?B?UnFxN1paUkozSXB5NTQwbFlLRkVFd2RPWk1FQnkzN1d4aWluNTVMRTg5OEk4?=
 =?utf-8?B?bTNVUUgvN2VGZFZuTWFKTG44bjd3WFQ4ak5jU2FMOEdCRG1JR1JpMG1KZmEw?=
 =?utf-8?B?QXdlN2FFZ2QrbWJ4ODlsVmRaV0dZVnhHMElZazNUMS9SemZ1eU1YN0tQMVJ1?=
 =?utf-8?B?eHozZm02dmdHaUcvYkRaNDVMdDYwMEJCUlhkSFphWHhUbzlZRlNVYmJGZkVD?=
 =?utf-8?B?N2RSNGNjL3VkZUxDcjhSNUlsdWg2WGhaYU9xQjl3WlFxV20wRHpySnkyUmNm?=
 =?utf-8?B?eFpGNUtGSFJYZ1lMV2VwL1VjdGlkWXgyeFhGRUlWNGhHWEQ3YnJtL0lKZ1E5?=
 =?utf-8?B?azArTFR0RXhXRU1wU2xhaG1IZmRwSUQ0V2k1OW9JSzh0YTdpc2JrWTczaWZ0?=
 =?utf-8?B?V2JWZnJTS1hHUk9UU09SQXAydmhDMk5JNUZSbkFibXhYK2tIY1Z5K3o1YUk2?=
 =?utf-8?B?eUxEaVJ5anJLN0FRd09EODFRVkwvQjl0VnJ3Tnc1Q3JONXRIQ0ZBL1hZZjRy?=
 =?utf-8?B?TVJ0Rk8ybFJoNWpYbXVDaG5ycTZNZm9ZdGVqLzdsUGZya3RKSHNZc1RZUERx?=
 =?utf-8?B?NjZ2aGpXOW9FZWVHcEU3dTNoQlFhaGNIU2VoZytKRys0cEVYcXJjTHBBcDVB?=
 =?utf-8?B?SnBBTS8wSk9pSHNZRlVwNGRkcVZYSTVYSkx0ZThROCtlT29RWTduOEQ5UDM0?=
 =?utf-8?Q?2VY8PjIg42FZqlTEhv/5W58xRB3M9w=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4F74773E30662C42BCAB729BB273645D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	05fc9f63-6869-4720-d892-08ddf394170c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700013|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVBqYVFWUW93K0Z4a2RRcHhaazFXcTd3QTFCZWovRDZ2RElvaWRQTVB4cmdZ?=
 =?utf-8?B?MzlXVHhTaVlmbFpqL09WamRxdmlqSjNuV2E5UXY3RXlVQVVJeGxOUXRqSjl6?=
 =?utf-8?B?eWV2enoxc2xBSWljVkhTVXZYWDhFUUFGMkxKRHp6S3B4bFNZRFJuZGpvL09r?=
 =?utf-8?B?Z1d0RmNQNUVOMzk0S0l5WlZMOHVPRms4K1hET3dHSmVXYjAxVzB4aVNRbzhV?=
 =?utf-8?B?ZXVESmFWRWVEM0FkNzk5Qk9yNStBV2x2WE9ueEhaZnR3SGJ4T3JXTXFPUE5Y?=
 =?utf-8?B?Ulpzd1kxem5xTUs4Y3gzVDdIbnB3SVhnZ3p5NlViQ3NGYnhldjRucldySE5H?=
 =?utf-8?B?N3NqN2lJUHdseHY3TmtvU2kxRkNPQzVDbzcxRUdoNzdZOHdDVC8vZU40TS9G?=
 =?utf-8?B?ZFF5YU94RHR1Wm13NmZBWFF3SFgwMTJFZ05qTjUwTjlUa3RmTDB1bm1RazFw?=
 =?utf-8?B?bm1CRVU2Qm5oY3lPKytvREN0NmFTeWh6TFRFOU1xeXNrNnJ6Mi9BS3M0N05H?=
 =?utf-8?B?NjB5ZE0xWk8wcC9PRVRCZ1RWYmYrR3NFUDJieEVsSk80Z2V3NDhUTS9OWDlE?=
 =?utf-8?B?bW1wOWttVk10MFdrVWIyQU9wMXBHSmVUZnZTei9VaUxNdGszSlY5WFFXLzN1?=
 =?utf-8?B?dHp3bEhUUTJEZ2RFUnViMDdKcFF6RmM2RGhvTHcvNDVmWDk5MUJvN1ZNc3VK?=
 =?utf-8?B?U1lWbTYzRFdYUDVCakJHQmZ4R2c1RDhqa0ZNSkdNcnZzSjNYWEh1Wk10S3Nk?=
 =?utf-8?B?aXhUV2JCbUZpbE5wdExOL1I1UlRRTW03aFFFRlFYSGE2VnJhdHRXN3M0djFX?=
 =?utf-8?B?NDlaOGJaQks5WkZPUnltUmdJZ1FQckFCZ0ZDV0F4Vm1DWk9HZENxMnpjZG9v?=
 =?utf-8?B?Njl4NXpOV3p5dTRnYUs2NFZPL1FROEwvQ29IalpPV0NSU2VBRFZVakhUeG9y?=
 =?utf-8?B?V2NVeXdxckdXTWpRaTdvT3l3Mm12NDNkUkduZ1hLWkdsODQzak10bG1JM2dl?=
 =?utf-8?B?YmF5Q1BTa2lRWTVxZmVKNmU5c01lYmEvWVY0a2pNa1lFWlZRUGRNb1lYd2E4?=
 =?utf-8?B?b2k3QmovRVNVMWdleTg0Sm14Mnl0SFN0cTMxUVNLbSt2TnkyYkVjZ3RiRktV?=
 =?utf-8?B?SVNlUDkrc0ZqamUwYlIxOXhZeDFxVFJOV3RBUnhVVVNMZVM0Vy9kaTlCOTBB?=
 =?utf-8?B?Rk1KUTAzaFI1YUNKN0tyN01sOVJHdW1lVVhXcVhKdE9NWFV2dm02akNlYXJu?=
 =?utf-8?B?TGtRZTFVUFQwaVVQcmVNREIzVTRzbWxoTGpNRmFWTHp0Ny95TUhYM3ZoeFFH?=
 =?utf-8?B?cS96eGV2d1ZnczNETHc5cE1NaXk4Nks2RktZTGwyOEk5U2t0b1g0MElGOUc4?=
 =?utf-8?B?QTZGeDludUtuWCtoeUFoVkJSR3dYSmRvWGFEbTkyTlBEVkd3Q3lGbGtFQW1E?=
 =?utf-8?B?Y0ttQjNDWDc3TGMrSlFVNmJyODBMaUtSQ1dNblBFZ0xIYUZFdmdtamthODlL?=
 =?utf-8?B?Mlk3eXc4TjUzbkcvNi9hYXZXY1JEM1JEaGlNNUFlYU5jOS9qMEhwSWxMSENa?=
 =?utf-8?B?Mi9Ec2k2bC9UQk54UU5JOHpDblFjTjBzSHQ2USs3TWd4eno4NHEwREFTaWk4?=
 =?utf-8?B?NThSNU0zUjI3c2NIK2FPZHN6dU9lRW05cTRrYXJPK2lHWHdRQmxpVy9MUmcy?=
 =?utf-8?B?NXdpanduRmVEWmR6RUlOS0NQNHAvSCtXU0JUakpnd1ZicEgrMEhHL25Famdt?=
 =?utf-8?B?bjUwTkw4YjFyZmFHV1BlQlNsQ3V4YjU4b2E3cnpvb3R1T2gzVFRoUG5uTVVY?=
 =?utf-8?B?K2dnelRFaXlTckdRMFRPSnlZSXdDbklzOS9GempRbloyM1dnUm5XOHJUSVpa?=
 =?utf-8?B?VEtKaVNJV2s4V0hXNUNOa3FEWmJKck1GM2h1SEJmQ3c2cUE2bzVxRUVZSGdM?=
 =?utf-8?B?bVF3S0FNbkdqZlpqZE1nRURqT0dCRCtZVnc5UlkxckZqYnJwMFVMSUdZS1Qy?=
 =?utf-8?B?QTAzMS82TjI3dG10M211V0p6TUR2M3Y4aHROOHdIcmJPNWRLR3ZjeVVQSW9M?=
 =?utf-8?B?ekJaVG41UXJUc1IwQWtrTjZNSlBsQ243ZzNqZz09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2025 13:39:44.5967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bec181-a505-429e-a9b4-08ddf3942a46
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 13:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223357

T24gMTIgU2VwIDIwMjUsIGF0IDIxOjA3LCBSYW5keSBNYWNMZW9kIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxyYW5keS5tYWNsZW9kPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYW5keSBNYWNMZW9kIDxSYW5keS5NYWNMZW9kQHdp
bmRyaXZlci5jb20+DQo+IA0KPiBJbiBnYXdrLTUuMiwgYSBmZWF0dXJlIHRoYXQgYWxsb3dzIGdh
d2sgdG8gcHJlc2VydmUgbWVtb3J5IGJldHdlZW4gcnVuczoNCj4gICBodHRwczovL3d3dy5nbnUu
b3JnL3NvZnR3YXJlL2dhd2svbWFudWFsL2h0bWxfbm9kZS9QZXJzaXN0ZW50LU1lbW9yeS5odG1s
DQo+IHdhcyBhZGRlZC4gVGhlIGZpbGVzIHRoYXQgaW1wbGVtZW50IHRoaXMsIHN1cHBvcnQvcG1h
LltjaF0sIGFyZSBsaWNlbnNlZA0KPiB1bmRlciB0aGUgQUdQTCB3aGljaCBzb21lIGVudGl0aWVz
IHBlcmZlciB0byBhdm9pZC4gRm9yY2UgcGVvcGxlIHRvIGtub3dpbmdseQ0KPiBvcHQgaW50byB1
c2luZyB0aGlzIGZlYXR1cmUgYW5kIGxpY2Vuc2UuDQo+IA0KPiBBbHNvIGFkZCBBR1BMIHRvIHRo
ZSBsaWNlbnNlIHRvIHRoZSBzdW1tYXJ5Lg0KDQpJZiBkaXNhYmxpbmcgdGhhdCBvcHRpb24gbWVh
bnMgdGhlcmXigJlzIG5vIEFHUEwgY29kZSBpbiBiaW5hcnksIHRoZW4gTElDRU5TRToke1BOfSBj
b3VsZCBiZSBjb25zdHJ1Y3RlZCBiYXNlZCBvbiB0aGUgdmFsdWUgb2YgUEFDS0FHRUNPTkZJRy4N
Cg0KUm9zcw==

