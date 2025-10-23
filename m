Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C771BCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:05:32 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.22])
 by mx.groups.io with SMTP id smtpd.web10.19893.1761224726274196618
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GZmUiHOD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GZmUiHOD;
 spf=pass (domain: arm.com, ip: 52.101.65.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nmXVYUcREkNtiEJuHKcKCFILz8rsf0pz5Czic/jsy7/LFmyB+uXmSwfSBl2VAqWcL/Z3zzQnHZiOD4nwjvk/Qcm+KKtZxzeJkg3GaGh7DIsI4ceKV/k2/5VvjXhJsPl8X3ALS/OohFj3qaQgZz9Id0bEfCtmajxxSslHKeF5H8Fjr3I9ybQ+uUzHnMK4eIIsA9Jx5yHUoy7NUtg8ewQGu885UqTmsHd5D1d9fTNFXATxL5AeK0INVeguSo8VE/6mWLPfvz99I3ZlqeaiWNCdyckBOkH7YADYcIpf1vGif3WlTznonllztxHXa1wDrCSh0apTAABmzzHIpKCKBNi9wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2y+2A29lQNGGqRrou1DmW54QGJtoKpfKByEedLaGMo=;
 b=O33ojZHHf2Arfg8N55LI9D5aZ0DECT9YbUEu/VhEJLUR+DRWFGzmSPiynIbw8F9wUJBzjYgZ7jOnoUBLKCEo/ydoApw2VFL5VMrCZcbEqZiT3rHJdUKZZD2SoXGqHFy76EHteT45THFBaWUNDhiQoz+BnxmKEqKOVyAuz7xsYuJ9+tlIPH1pjiASjIK2WZZ0o/K9Sb4u+C/dk8UKQje1rY3KZggQL9w1XUcVhQisUvmDuxjckyBaBLFv3xwXVwomOQP2Rnm8mq9Nf5gTpMXljgwjtl7WO8DTGMc1O6v50KKCIj8O0EeYYcik4r4DQ0SNMtJGtAuGXlW1wuQ2tsBO1Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2y+2A29lQNGGqRrou1DmW54QGJtoKpfKByEedLaGMo=;
 b=GZmUiHODB5Ughc27P/dxmq5a6f5Krl6EI05K08ZTXHZYIBPsyClltaJBjVSc5zHQXdJkDz1+vQZmP68i7oTkXcxdV9NrlwfN6FCPk39MG+1jLsrw4ZPTyDe9HLGrAvsw/9x4zcaK5Z/ewxHDgWIYnisQdhaxFk9H3H1ztgLeG5I=
Received: from DUZPR01CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::29) by DB3PR08MB10336.eurprd08.prod.outlook.com
 (2603:10a6:10:43b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 13:05:22 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::a) by DUZPR01CA0098.outlook.office365.com
 (2603:10a6:10:4bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 13:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Thu, 23 Oct 2025 13:05:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeyfntWjzg0QDIjrewEEqLV6pbx87F3E+bWq74E6vj19nqGCbAmRNx4TjLlMQ4RksDB1F/Vw/vYKoLUi/i/A1ocMLosBcweU43XxG1Y/Gw3L8ota5D9Q1m/qL6DXpY2CxXRPBLJ56QOJ4hgyal9Hd6JTe2D3+e3wJ9NU977dsgtkHU2dg7lKbefvu3vMVMeQ6eb7EMaIWE5s83NjAG8KCae/wNa/+9M/Bbkp+Nv+T1HCKsuH/hNdSeVMbWFwrMgx1y3KGIik1tLGUQ32gV7cTdcRh9Zx6BvBzjAXftPkcFEpd0AwUJ0oI/u3Sml9MBg18OmGUTuGxcNniqtLHtzWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2y+2A29lQNGGqRrou1DmW54QGJtoKpfKByEedLaGMo=;
 b=ThCBNKVChG6rVNFUXeYLFZ9NeY43deCmSHIcDeE/zETfecC000JN0mc77fgDE15GNYSB6TF5t7UpHtE6zGRiFmx/an826I5uMYwI17KmE/BFTkMRIhwrun3UgcLhQAdIPIydnJuE3N64e/7bmJl7h2/D2+/UbgkeFw7y4nFifuT/wvPw1dM9x0s+Wv44ZCdAy3KP85tdLkZ261+Yi1jXdv39jBf3t+5jfv5uq2H5X9CiM5bkGpF+NQJ23gwGDaKs2LCav/o/jke0XduYzPPX8BYzVftq0Xtdvw/GsDQ/FmDWUeo+RvGoKmZEHtmPfkgSOifMGMTw+zGKpPZkuTmmvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2y+2A29lQNGGqRrou1DmW54QGJtoKpfKByEedLaGMo=;
 b=GZmUiHODB5Ughc27P/dxmq5a6f5Krl6EI05K08ZTXHZYIBPsyClltaJBjVSc5zHQXdJkDz1+vQZmP68i7oTkXcxdV9NrlwfN6FCPk39MG+1jLsrw4ZPTyDe9HLGrAvsw/9x4zcaK5Z/ewxHDgWIYnisQdhaxFk9H3H1ztgLeG5I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB7800.eurprd08.prod.outlook.com (2603:10a6:150:2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 13:04:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 13:04:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dani.barra25@gmail.com" <dani.barra25@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] Fstab xattrs: This update ensures that fstab
 xattrs are correctly updated without adding a lock to the database.
Thread-Topic: [OE-core] [PATCH] Fstab xattrs: This update ensures that fstab
 xattrs are correctly updated without adding a lock to the database.
Thread-Index: AQHcQUGuf4q9eKcde06MFbRngzG+6rTK8i6AgATGeYA=
Date: Thu, 23 Oct 2025 13:04:48 +0000
Message-ID: <0843A567-F194-4B13-B248-A1DAEA0A85E9@arm.com>
References: <DDM7O4JOPS0Y.1YQP1AS47WNL7@bootlin.com>
 <20251019153922.27208-1-dani.barra25@gmail.com>
 <20251019153922.27208-2-dani.barra25@gmail.com>
 <CANNYZj_MZwiUEYPJ2XpMeKpKPm0rDMNguDn+7RnW10H3Z=xuxQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_MZwiUEYPJ2XpMeKpKPm0rDMNguDn+7RnW10H3Z=xuxQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB7800:EE_|DB5PEPF00014B93:EE_|DB3PR08MB10336:EE_
X-MS-Office365-Filtering-Correlation-Id: 312ec83c-531a-472c-2b33-08de1234d332
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TklqbG1qSnE2UCtqRkxlYlpjVlBJMnlXci8rWk9OWkt4TlgvQWVYeGVhakQ0?=
 =?utf-8?B?dFhqYnhhVGM2eTI5aG1NMEZHcmNURW04QiswNWh4MTdIMXVHbWtKbE9wMlFT?=
 =?utf-8?B?aDFlMWJVa2wycCtUZXJoNWVOakdORGxweGMvVVhIakthKy8rb1JLdWVjSWs4?=
 =?utf-8?B?WnJNRW8vVkpybmM0R3dQMFJmOXR4RzNYNG1LNS95RGpDOTNiRzlBdmNkdUNB?=
 =?utf-8?B?OHVzY2tMRWdldnkwUkp3Y0NaaFVmWU9RQStRT0l5bmdxSUpYTmZ3V2FzbTdW?=
 =?utf-8?B?d0dQZGRwRXducUNMWWVWR2RkWXRvVk5mS0VUS2hiMGhkKzdYb3dZWFpDalZz?=
 =?utf-8?B?L0E0dWlBYlVqNnNQbHlvajZIRmc4Ykdvd3JXYkhuNCttWkt1R2ljTzVjNXFL?=
 =?utf-8?B?OUVORTc4cE0vcWpxUTRqcTJCaDRrSnlKVW90MHQ5VHI2MklKT1d0aXVqRHcy?=
 =?utf-8?B?Q0VCa0trWWlKSm5HTXNidW1Jb05ya0hvZVlsSjVmdWJaRW1zS3lVTFFlSHZR?=
 =?utf-8?B?a3FXdnFzdTc5elhyREN3cVBTRXdob1RPYVdpQXcxTytrUytTQlB1U21sd2Zp?=
 =?utf-8?B?QmNyV2RpLzdSMWhDYTRYcXVHeHA4OUJQazdQZ2xSdWZkYUZlTHBWRjVOK3dF?=
 =?utf-8?B?RUJSNXducGh3T2Z2WTl0NmVCUkwxS1lITndiS21vUm5rU2VQNjNmNFFCalJS?=
 =?utf-8?B?MDBFZkVZNjRCRXFOZmh3S2o1WVRvYzBadVM2dUFsWENqb2lSY05iOUJ4dWht?=
 =?utf-8?B?RFlIeGhPaGhxVGxGekZPUlRIdEZZRnRpbmxRMTRLM2lmakxBR2JLZFljUmI1?=
 =?utf-8?B?Ukh0VzhkMU0zbWhTZnNPZVhwMkRtbVc1SnBjVlVtNm82VXpVdWtxMU1rQURI?=
 =?utf-8?B?OTBvQ294TXQzaDl3c0ZPZVBWYTBjTGFzNjF3MWxFMXRFQjBocUtYelNtYmFh?=
 =?utf-8?B?Y2p6MHFLZ0hxQTF3SXc0U3ZUZUNhR3pBQ2JZWFVDUFpZQ1ZDU2dGUkxXRHg1?=
 =?utf-8?B?WVA5NUdmdlJJV2xFdHhHZHdpSzdWRUdGTG1JWkdYSk8xRUt4ZjlQa1FWb2ov?=
 =?utf-8?B?dUtjRHppb0N2d2xEOVJiQmErVGpFRWdxZ0t3RFlRaHhGM21sMnpEc1R4V1pC?=
 =?utf-8?B?aEVISGV1dG5meGt4L1NMMkNUOUNYR0cySVY2WklsSllRdXp0aXdLck85QzM3?=
 =?utf-8?B?REN4QlZSaXFpbEtZZ2RsZUdNMFc0Z3JTZzZGTUJuTGlSOFpDZGFkOWFaWWtw?=
 =?utf-8?B?VEVsK1U0YXk2Si85UzNpa290bjJsRE1zTTNKSXVSYzdGWkVGelZPRXFiNGNT?=
 =?utf-8?B?YmRhdzFXMmZta3ZhRDZCa016ZUd3NG0vajQxZlZOdjVGRlFiczdZaUZ3M2pi?=
 =?utf-8?B?YnF3NDF1bnVjcDVZYU93Tmh5bTkxLzRyTnQzTkNuM0dMMVVwMVdBNU1vay9u?=
 =?utf-8?B?dXEvUGhvQ3FscWdyVE95QjRpeVQrcjZBMi9TL1lIZi9NNGVVNXFtMFY0eDRt?=
 =?utf-8?B?MjNwMUxnWmlWTnRnQVJ1R0lsaDIrdGtNcFp2dVBaajc2QzRkVEtFRlJ5cHJq?=
 =?utf-8?B?cjc2SVhTbHZYekRmN1ZYNzI0T2NXRFE2NkhqajBocnRrWVdtSnNWRk9GZmJU?=
 =?utf-8?B?SHFkWWtwSW1jN2k3WmhGMGZyUEtXRnY0OGJaUFdxSEFYWERGZEo4RmJXWWRz?=
 =?utf-8?B?V0RFUjFIckVjcXZEb2pKdWFFUVZidEVySWJGUXdKVDdLQ3Y0dDhobHlCSllY?=
 =?utf-8?B?cXp2b3JmSTNvY3lkYUxNOEV1NEM2MXdBVjdlMVJhMWFwaE43MzZ6ZlpkK0E1?=
 =?utf-8?B?alRyOHMzZWdJSHo5ZklmNkpmZlJ6VzJadENKR3JIdVh0TGxlT2VZcDE4ak9u?=
 =?utf-8?B?WDJNWkZEU1EwaUJvU2F0Y2N0Q1RsVERDRUZLM2RLZmdaaTg3RW1aQjJkNTdo?=
 =?utf-8?B?bnN4MjNLbC9rVnB6T0lscm1WdG5kOFdrV1g1bENpcUh0bTdVQm5kVmRKMnFX?=
 =?utf-8?B?WkxBWDNxS0c5Nk5qbEFldTFVbGhRYWxJVThsUTJicnJSZDBoVmFYR0VEM3dt?=
 =?utf-8?Q?EQxEtD?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <38F73E9856F2814D9AB36EF50EC65E13@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7800
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d8c0dc1e-2d81-459a-f3f8-08de1234bee5
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|35042699022|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QjhRZytPSFI5WkZnNDE2VTI1QnkzbFN5bGhVZHh6NGp4UW8xNFd3Sk13OWdG?=
 =?utf-8?B?SnJ4WFNMaVRLWi9ObWxMR3VyM2JuYzdJaW42dC96MnlHM25tUVR6Q0RCSndv?=
 =?utf-8?B?Vnd0bGIwZEdZL3pqTEEzeXdPWUNuR2o2STFzR2ZxdVRpOXk2ejYvM3p1YjVM?=
 =?utf-8?B?TlUyd2pieXZhbTZEaWhWeFRXWUdKaldWYmRxUlk2N0EzWFdtbjE4VUNXZVB3?=
 =?utf-8?B?MXREdGtwUklneHYydnhHTnp5UHZJemd4WjFVRXpTSzByZTg0Q0l3MUlPYjFD?=
 =?utf-8?B?SEI5Wk1zTHNEZXJQa1huVm5JWHc2RWQxTkhQN1BWVEZoVjl0ZWxMSjBNa3ow?=
 =?utf-8?B?RkpkK3NZOE8rTHFtbVNkQi93RmFTWlNiT3pOaUY4TjY1c1dvamQ1VzRvbCtk?=
 =?utf-8?B?ZVUyQzVPdGJNd0REK3FZMHgybUlZY1ZtaXVtUG1NM1g3Zjl5ajYzRS9udWdX?=
 =?utf-8?B?Y1RXRHdsQnBGUVB5UmtOUGdlQ0kyTmRBeUd4blM0aWQ0OG01Y3c2NThhQ3dB?=
 =?utf-8?B?U28xOENGRGN0TGlJQnZEUDhVbk1YYnAvM2hGNS8xYlQ0TFhLS0Rxbzd0Rmd2?=
 =?utf-8?B?a2hCSHN4cWpCaCtIdE8wNlJkNDlVL09sdWp3STBuTFQ1dlMzbWZiaWY4ZmhC?=
 =?utf-8?B?SUx4dTVlWElBa01kUXNMQnJCTGliQkk2dXUwMnV3R1Mza2hmaElXaW10TThv?=
 =?utf-8?B?cm5QeGY1b3R3TVpwQ1Q3c1pjQkRaS1Q4OWpIR3dacjAxaEtZM2g5bE12R3dm?=
 =?utf-8?B?cnp1azZZRnozQW9QcEdkZ3ZmcC9yWmF3UTYyckVxbEhSenZHcndsZCtENVNF?=
 =?utf-8?B?akJ4VFhoc3pGY3BmaFFzVUZEallYTG5peFdnODFJSkU4QzBMS0JNRVpZRG13?=
 =?utf-8?B?NGtMNU9mTWVlRG1pZVd2QjNlUmppRXI3RThnTkpmTndXaEVJOEJjMGpMQVl5?=
 =?utf-8?B?aXc4K2Qrd3g5M1FtRmpJb043S3NCMXlVZC8zaVBWZGVOZDlTZFpkWm9HRVIx?=
 =?utf-8?B?WmdIYVRlZ0RIQWNyV3RFTGVhWC9Rdk4wckF6UUtKbUN2dVQ0UTJ0YmlmOGw5?=
 =?utf-8?B?K3BFcDFIZEhhMjlEQmV4OGtBTG54Q2RoRG1FQTI5RndMVGhndmx5a3drOW53?=
 =?utf-8?B?MndVZDVZMTdTUm8wTHJRNGd5QnpxR1R4eTIyYjI3eGp3Uk5BSTBiOEt0MFRW?=
 =?utf-8?B?MWRNeU5lVTlpRTZJR1ZvV3paYW9oNmpPVnQ4b05oS0VKTFhjYlg5YTcwVzhR?=
 =?utf-8?B?VG1QcHNQbXArUTBmWXMybGtsWk1lMEdIaDVnM3p4Y1Y3dEEwWGFzZTI4Rjcr?=
 =?utf-8?B?blpqeTJJN0gzNFcwaEMzQ3BjRm4zV0pUZWkvbXNrNUJnTGE1NXVNWlhIN3dW?=
 =?utf-8?B?a2NmV0JxNm5qelZFZTY5UmpodlUyYVhFWkJxZWFPL0I5NzBROHA2dFFvK3Iv?=
 =?utf-8?B?bms3enhVMW1Ec3lzYS9wZjJ0REJheVlkcThXejBGWk94SW1TeVJJWldENi9K?=
 =?utf-8?B?ZlM2bm5aS0lmeUx3NDlCMllZaDJ5ZVVxeVVjM3UyRUxYNHM2SHNZL1FXUjBw?=
 =?utf-8?B?UGhMMTVHaUJMUWtlM09rNUNLbXhUQnpCaGJvOG9pcDU5ZWVoMWpVMDdVQVFk?=
 =?utf-8?B?cm11aWlyK3AxVjloemhqdGZiOVkwcmhvZVNWUmo1bVpPSlJUd0pMQndBd2lB?=
 =?utf-8?B?THRqVlNobmlzNW5QZXcxL0tyWHh6NkRyMHY1NDhtSmtzbU9oc1NYb21aNTZR?=
 =?utf-8?B?QXRFWjRpYzhoT1haOVpWNG1vMWE3WXg2ZjhaMmlWek80aldiUXA5c1pOZnRI?=
 =?utf-8?B?aGJYMDFjWUE0UXVPc1hmOXVXSGpOV0lWVm51T2Mzem1DbE9BTm1oQjYxMHl1?=
 =?utf-8?B?K3dDdVJ0UFFZcy9uSkxBbHhRamRBdUxMRHFJbEYwbUVCZitqb0piYXNpZzls?=
 =?utf-8?B?eDVBZWRTbFBhNk9ucURuN0FCM014RmdQbjlBTmt4OUEybXZBakZETjg1WDNk?=
 =?utf-8?B?K3lIMVpZZFE2Uk5iUGEvWVFHamNleitzN1ZFV3lSOVovUkRxVjJ5azFiL243?=
 =?utf-8?B?andDYkU3Z1lUMW5pam9ZWC82WFFZcVFGRlRtN3liazcwajFoZ2NOVWVYWDh3?=
 =?utf-8?Q?mg40=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(35042699022)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 13:05:22.3050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 312ec83c-531a-472c-2b33-08de1234d332
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10336
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225257

T24gMjAgT2N0IDIwMjUsIGF0IDEzOjA5LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IElzIGl0IHBvc3NpYmxlIHRvIGRlc2NyaWJlIGhvdyB0byByZXBy
b2R1Y2UgYW5kIG9ic2VydmUgdGhlIGlzc3VlIHRoYXQNCj4gdGhpcyBwYXRjaCBhaW1zIHRvIGZp
eD8gVGhpcyBzbmlwcGV0IG1ha2VzIG1lICp2ZXJ5KiBuZXJ2b3VzIGFzIHBzZXVkbw0KPiBpcyB1
c2VkIGJ5IG11bGl0cGxlIGJpdGJha2UgdGFza3MgaW4gcGFyYWxsZWwsIGFuZCBkb2luZyBzaHV0
ZG93bnMgYW5kDQo+IHJlcGFpcnMgaW4gdGhlIG1pZGRsZSBvZiBpdCBjYW4gYmxvdyB1cCBzcGVj
dGFjdWxhcmx5Lg0KDQpBZ3JlZWQuICBJZiB5b3XigJlyZSBidWlsZGluZyBhIHNpbmdsZSBpbWFn
ZSB0aGVuIHllcywgdGhlIHdpYyB0YXNrcyB3aWxsIHR5cGljYWxseSBoYXBwZW4gYXQgdGhlIGVu
ZCB3aXRoIG5vdGhpbmcgZWxzZSBpbiBwYXJhbGxlbC4gQnV0IHRoaXMgaXMgbm90IGEgZ3VhcmFu
dGVlIGFuZCBraWxsaW5nIHBzZXVkbyB3aGlsc3Qgb3RoZXIgcmVjaXBlcyBtaWdodCBiZSBtaWQt
YnVpbGQgaXMgbm90IGFjY2VwdGFibGUuDQoNClJvc3M=

