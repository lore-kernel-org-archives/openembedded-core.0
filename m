Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 703BDC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 12:56:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.9])
 by mx.groups.io with SMTP id smtpd.web11.58587.1749473805729320688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 05:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hvG6oDU5;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hvG6oDU5;
 spf=pass (domain: arm.com, ip: 40.107.159.9, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DrbX/bSr+xgVnuTXTCeMt9aUv93t7YSH7T3U7JV5Q7lcyboqQd0m1Gm4VFErNaNo0ee0ldz7ebPB6ZpjInWggjXtK7UUwcRKnzRRkjrlFGNgFZdaDKfNo6c1VQyXQRMQB64xOw5KbimR3YHFkzltxS3SZG1wUIdUmz6oIMViqpv6ne8avjDkhxzZWnLN3pyrfDtuXvvBIHmlz3FYNiXd3dZGuSirBGpukiQ8SjOMlehMFH1P+p/20NpFRvYh6E1r5Xx1cxgNgJqknK0jNEHLZVsfIIPsZWiRMAXDYOhIctCOa8vzSKAeFds3adzFhwpVAfIyTLm3iMD7WrKlQDyqzA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5oSzIjyRTmWDYzBGYxhH4k3KpAnlwVyKbmaL6KWkU8=;
 b=Dw0olCsKh4ksGJsFD4Sew2KkI72teh3m1btPekfVcZ5dBrGbeDZmRPfIIMG/NrtUYPTDfkPb1IZ8R1svguFKiMpaWhEMbAcrJurRF+ffNKgr9fo9u5HjUXqAVMWEZJNCOxhVjzZSWPsfwtViTzlnHhrXVq0qr1mT59wR9DmH+6xfbPX2ouFyEPxdqqJjVHivEpyoXXCEmZf99vwb+jk/bMyIcbszgRqRhCPUagCbIdQNJfLswT+vGrIVXDv5nj+F4lxEEa9tIHCrpBXCCKvERLY2fuZ5Kxpw6L+vN/PEcdRa0Ysk/GKL55pULp5DH3pgEBqneWEqvuSy0pk6DpbxEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5oSzIjyRTmWDYzBGYxhH4k3KpAnlwVyKbmaL6KWkU8=;
 b=hvG6oDU5pVPsfBzgTEASvFGdrQ7Qk3HGpOIihPwC7U12jZ3Sr83NUDVcZo0sHZ5S8WzfECJ2m47a91AtInpj8mB7aGRLagzp6bkkakCA4V5ezSFXQ5guTaHmEaMkHbi4wpaI2HeWLwyMQIe5WcAvl5KoOp+yms1mR68w7DE491U=
Received: from DU2PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:10:234::16)
 by GVXPR08MB10473.eurprd08.prod.outlook.com (2603:10a6:150:156::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.24; Mon, 9 Jun
 2025 12:56:40 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::20) by DU2PR04CA0041.outlook.office365.com
 (2603:10a6:10:234::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 12:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 9 Jun 2025 12:56:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9pzH5WSf3r8Jg8TRdKuJUesYbHfIzU87L3roO6Ky9gYdQHgYVSXJPEt3MGeEyQtny7ZfX9mh33rUth+kJFB2PmKbphDStPGJCA8Vjs2IyNopsSMCJPyyJAzMHioGooVf5QoW8U/1mLu2t2vywcKz2VBYiVtU4tt34H70qFLW07tvK4QcoUlJP94mU4rC4rTzM+IYL2othmKMzQzsNYURu5IG7YaA/9HTsF8Lo6JhoT2HNXkX4bosTaYoes5UfVZJRQgBWpXAgwFDEoPLu++CDQ9PVnFog2l6Kx0upoj+kXq6tJtOL75t9PGM7KNoMMJe6zDN2PORoHnTH8ncqj3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5oSzIjyRTmWDYzBGYxhH4k3KpAnlwVyKbmaL6KWkU8=;
 b=N6Mrgiv5fXqfzhhOWkoctbZAUmE/USPKGOvOr+OiuNEu9QJPy5KdRFtSJ8ubYYCDBCkz8hWcLAtS71yw3OyumgJrRQrBSW9HnB4IxgDniERSE8RGC12PdOPvkyYlEdO6222I+aUmB9rjqEVT0uXMcktMuImpyvMj6SnkuUwn676jNLbu1PZ0YRmK3WwZ+gxSOIvo/uR9CnkjO0nQyu8ZO3354NZxQJMyclSgxPKfTNM4l5/cbD9CLYuVs56BOAblawCn8a9KfEKgKOGE2JaeSxAi9kGf/W/I5P/VffM3gMxTsCo3OW+/qL94zIkFRtfSp9aJGtVCD38NT3qeXBar5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+5oSzIjyRTmWDYzBGYxhH4k3KpAnlwVyKbmaL6KWkU8=;
 b=hvG6oDU5pVPsfBzgTEASvFGdrQ7Qk3HGpOIihPwC7U12jZ3Sr83NUDVcZo0sHZ5S8WzfECJ2m47a91AtInpj8mB7aGRLagzp6bkkakCA4V5ezSFXQ5guTaHmEaMkHbi4wpaI2HeWLwyMQIe5WcAvl5KoOp+yms1mR68w7DE491U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10249.eurprd08.prod.outlook.com (2603:10a6:20b:62f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Mon, 9 Jun
 2025 12:56:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 12:56:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libglvnd: migrate from meta-oe
Thread-Topic: [OE-core] [PATCH] libglvnd: migrate from meta-oe
Thread-Index: AQHb2ToadACc4u5Q7kytztHNaoAzRbP6xK+AgAAEi4A=
Date: Mon, 9 Jun 2025 12:56:07 +0000
Message-ID: <61824A9C-D290-4CE9-85AA-DB7ABD1C97BA@arm.com>
References: <20250609122826.2775354-1-dmitry.baryshkov@oss.qualcomm.com>
 <DB5PR02MB1021325B33F6D8951F75CEA95EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB1021325B33F6D8951F75CEA95EF6BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10249:EE_|DB5PEPF00014B9C:EE_|GVXPR08MB10473:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f14e0e-164a-40d6-32de-08dda7551394
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SVU3dXF5Sk8ydlhuS2lJMWxJampoelJTeWpFeDZldUx3dENQVlUyZ2lsT2oz?=
 =?utf-8?B?cGRwcGZXb1VFMVlNSklFa0U5dmxheXBIeXhoa3NBYkFIcTIzMERJdGR2SWhY?=
 =?utf-8?B?S09YdURIU2VZRTMwY1lJMWR1akhrQ0N1Qm9GN1ZZM1dWUnBZOUpTZ0N2VlUy?=
 =?utf-8?B?VkcyTUdNN3R4YXBFYlVvVTR3VGpJUGNySjJXd3dIcFp6bGROZ2F6L0RGS1lI?=
 =?utf-8?B?dURBM3YzVTVKUE9QdUN4R0FYMUJxbHU2S0JsNDFZMkZUejlhSGZuUTI4WFFP?=
 =?utf-8?B?NlpuK0VJbWJXUERaUEZZSjBTWU5DdVQ5TldFOXB5VEg3K3hITGpMWUpnRGZH?=
 =?utf-8?B?SHA0eW1ubVJwV2VwbHB3SFdTQlhaR082M2dxbGVndjBSOWlkMnN0RDhoZjZE?=
 =?utf-8?B?aU5DVGJEbTIwZjlqUGxKYkx2R2dVYldrMFJjdnBZcFBzeC9GNjVxcWtxeUhD?=
 =?utf-8?B?aUg1UmxJVlhTa0QybXkyajlQT3hzNnc2ZndlQjh6eVQxU3JaeTlYcURZYVhD?=
 =?utf-8?B?QzJiZDdtQWRUU2JPcHFtZzM4OWdrS3B6MDQwZHI1eVcwSzd2VUEzb0R1aTI4?=
 =?utf-8?B?aU9RVmt5ODZiVTQ3Yi84UUtNN1FYYm9tQllROG5PTTkyRy9jK2ZrNjNhWlA4?=
 =?utf-8?B?VlBRV3Q4Ung0am1lSVUvbG1NK1lYY3dnUk1BNVY2YXBtcy91QUlNbjkyazQ0?=
 =?utf-8?B?UzVsbFVhVzYxRlBGeFBPVlNjbnVwN2h3NG5mOWRnU1doMTBPeVVsUkEzdmU3?=
 =?utf-8?B?cG1IN1A4aWo2NzBkZzVLYzRwNHA3WGtMcVRGbDNqdFZOSVZ4L2h1aC9ZSmR2?=
 =?utf-8?B?OW94NEFHUTBQYmFQZ0crWENIcW5EbmQ4T2V3ZWxoOXM3VWU1VXBvcHRvOC9Z?=
 =?utf-8?B?SFJVRUNwQ0dPNDhHZFpHRzRKaXJUUUd4WDNxMkFqZE9PdHpQRUZKRUhEaGht?=
 =?utf-8?B?ajlTTlRRaTg0ZitHVG9xOHh1WVlzNjBaYUk2aHZpbWFoQzJSWlh0ajd0Sk1t?=
 =?utf-8?B?SVNJekROdlFjZTFwYmNZTUtzV0lkSFN0RzBYV3NNVUJ4UzIxalZKT3AxeXpu?=
 =?utf-8?B?Y244VXNpQjd1Wk9VSTNZU09GYlF4ejg2WkxlamZ2bmhMWCtGNVJNR0ExVHBK?=
 =?utf-8?B?K1NuVFFxREdrbndDZTBVVW9MM1lIUjhvWmI3R2F5em9DZDZramFFaVpYdkg0?=
 =?utf-8?B?V3FySVFWZ0VwWERYbU1DdU40Z0hMNW1lS3VKVzdBT0c3bHMzakZhckdkL2du?=
 =?utf-8?B?VS9qT0pRYmFTZjQ0UWxGcEpRRStISGtuYkljMi9QdCtkSEJrT25ERTFBSXox?=
 =?utf-8?B?aFM2c2ZVU2JMTFBzVlg1ZEhLUkgrSGFTd1Rrc3gvWXNEL0R4RGdMcFdsTi81?=
 =?utf-8?B?bVZSN1hZUVh5SUlYQmJ0WDQ2M2RUZVdOT1MzOHJMTjdNVjFmdkpiMUNNbThG?=
 =?utf-8?B?WGRaVG92NFovWC9PbVlFcEp2MnpHWHEwMUgzV1N1OSs5bW9yZDNEZ1luOGhs?=
 =?utf-8?B?bzBjSG9yUHYrcEFocUx6NzljeDU2V3Y2WnFUeUNweHl6aTRXRE1qWU81TEIr?=
 =?utf-8?B?NWo5cFlkcTlZVGhkaUw5UEF3SlpDWWZRZFhIV2tyMEpqZUhDRDR3UVh5dlBD?=
 =?utf-8?B?a2VuNzBXYmg5cVVuaVl4aUtFK3ZZSWhzaWRvekhiWXlaMzZEUGUxVDcvUmo0?=
 =?utf-8?B?SFNFMHpsdnFiZEdhUnRUQytkbDZYSGJpTGhvSGtacWUvS2JYYTEwV0FxK2kw?=
 =?utf-8?B?dk5aSGUwbVVuMTJ5U3ZSdDBrcmpkRFY3ZDlGbi9DVlVyRmYzcFk5M2ttWndD?=
 =?utf-8?B?cUF2NlRFeVhQY2IzSjZmTEhNVDU5TkhkM3FUZDdTYjNMYU9maUtTSXViaUNO?=
 =?utf-8?B?am1Zc3BobFFUZWUwR21BUy9tWUZ0emE4dFlmZDlJejNGaHA0Vk5VTy9HQVNM?=
 =?utf-8?B?ZnZlR2xZTE4wanlVOUN5Z0lxTkdLR1lhSFdEKzM2eGR1ZndyWGZLb1JNYWJG?=
 =?utf-8?Q?lj/Qd5iCy6A8FKq3d6kBJLqqmVnqCo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9760643BC10CA4EB23A28B760517E1F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10249
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	475b4a04-b2e8-4100-4728-08dda7550069
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|35042699022|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cHI2a24xQ0tEeG0zNVNMeXl5SGhHaFE0TFJOajQwOTRwK0lhcENqMm1OWmpJ?=
 =?utf-8?B?aDFITHZTYnZPYnlPVkJXWkVpU3NnY0lnOGY5UDYzS0ZFMTJjN2JrL1hXc0Zq?=
 =?utf-8?B?OXk0SnpYWktCL3RkdmE4dXFXUXYwbkhoSUZ3UEx4NDdLOGhmZmhSaU1FN2JB?=
 =?utf-8?B?Zmh6Z0dQOUJleGp3V1E3ZjJlMlFJSVNadVRjb0pzN1V2V2lNeXJ2djY3LzYr?=
 =?utf-8?B?M3hWUnhuTElBZHBTRkdWUGNYVE1nSmJRekZNc1BFTnRKSGFTOEI4NWdWakFy?=
 =?utf-8?B?ejNLb2FqNWJCWkRXQ09UTW55RHh6YWtYWExORXFZaGxHS3Bpb0w1K29CSlhZ?=
 =?utf-8?B?UXBPcVNxc3FlZVVGUTZZSEZPR3Z1eGhycEVsb2V0ckhWamdCVkdJOXNRbXJH?=
 =?utf-8?B?VGFFZ0Z6S0ExOEtpTVYrdmJpVkg4dEovOGZKUTBSakpkWUw0YW4reWd1Qjl4?=
 =?utf-8?B?Y0ZXRUxFK1QzRUtNT2NiNXRPM0tJQW11bXhiYXJ5a3hPeThPeXdHQ1QycEZ6?=
 =?utf-8?B?bVZqaXpzeXlOR2N3aXl1ZGNmU2U5b1Zoais4SEgwV1NETm5MM0FjOUxaT1Rl?=
 =?utf-8?B?QXFWVVF2VytiTFVxV3ZLVmFZQWdpYUZ1VVpBOTJvTnIxRHZURGJIQnozdTll?=
 =?utf-8?B?dzBjc00zT3UzUGNtQlpaQnJBMk00TVJUL0s2eTdxeEExT2kzY2tRUUViV0ZC?=
 =?utf-8?B?am1WSTJFVVhQazRjN2RQVk5zSkhHMEF3U1dqL25BOXo4R2ZHOU5RTC9mQkNp?=
 =?utf-8?B?b0VGaXgzdmt3RHRuZ3ErOFhia1l3dkV4aENTNkZZdDhHSGhDVzNHcTd1N1Q0?=
 =?utf-8?B?TVBCL1Y4eVVvQ3hienJMUUpXeFQwNVRLSjd1MmxUVmNPQmdTVUZBbGdWVkt4?=
 =?utf-8?B?cHAzRUg5cDQ0ZUJhQjhQMVZhY1JoT0lQcTl1OFdOT2N2Z0QydTduOU9JMWNG?=
 =?utf-8?B?S1dEWW12eFB2enduZHlpaE9FMURoOXFOZDJZOEt0Y2dTVnZtSzQzZUxQZDY3?=
 =?utf-8?B?eFA1dS84SGlrOTdDS2VDakc5cjNSM2d0c1gwbjE1TFppakdVc0ljM0ZkOW5T?=
 =?utf-8?B?VWxpbWNzcjlSaWxLM3lVb1NXaWNxenh5bmFVZGhhL0o2MFBNeVh3Yk1CRUZx?=
 =?utf-8?B?VWl2ejlIdmgvckZSQkMxY21OZUpsQVRvTFJHMmU5bjNjLzlwRDZ0enFGdkNB?=
 =?utf-8?B?NHNRUzdiUFRnRWl4NEI0SkMvZW9vMFVJWkxEbHpMRTJwdWZEWUQzZEIwVGcx?=
 =?utf-8?B?SDFvUURkOGlMdnh2cnJMWmdEUUdERjZoaUFlek0va2R1OTdZZjNqNW5YbUlu?=
 =?utf-8?B?UXh1WnplU01uK050bFF4R21acWZIcmVTTTFUdGEvMXZpL0l2VXNid3VvSU5R?=
 =?utf-8?B?TFd3cFVHcERHbkpRQ0ZPZUtidmJCM0RhZU14RWRoN0hZV0dEZHVnc01qcXBm?=
 =?utf-8?B?TEsrbkFmVVdKZjZUaVdtZk94VWI3elVJa3hUeDV0ZkFJN3grTHd3VjV2YXA5?=
 =?utf-8?B?RHRZY2haWXNDSFVDQkdXaksydmF2bklnUncwS1p3cHRCdVRPKzNvdHhESWJZ?=
 =?utf-8?B?L3dUV082U1RkZ3l0QzBVd3BYb0JnVVU1Njl3Y1U2OVRUVkNOcVlnV2xjYkox?=
 =?utf-8?B?cHFOaWlOd3ZjdG5aaS9SQmFhZTFuOUkzTVdJOHZFem1CUUVYZXE1ZzNteFBq?=
 =?utf-8?B?L0Q0NnNNRUlJdzR6TkRkMytzV29zc0xtelJoV1Y1blkzNTFPSTB5SzlqMHZG?=
 =?utf-8?B?Ymp3bVRVbTNEYmxYZldnZE1RSzRBZEt3OUtNWUZIOElqR1Z3L3M2emI4OWIw?=
 =?utf-8?B?SDhwaGUzeUkwejdHUHFDSGVTNEVoTjFyV2dzdGZHU3JQMWFmSWVBUDBveWd4?=
 =?utf-8?B?S2loOVBMeFBSeXRRekgxblJtZVVCV1NMZmJJeExqL0lFMlVQZnhUYkNLeXRo?=
 =?utf-8?B?bW93SXIrWi83eEl5TDFvRjBjY2REL1V0MFV0TDdJYTYwWkhJa2M5MFgyMi80?=
 =?utf-8?B?Z3YxYW9OY1FMcnZEL3QrMVAvT0FyelVYM3VlZWI5YzAvQ04wcVRtTWhINGEv?=
 =?utf-8?Q?WRtD7I?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(35042699022)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 12:56:39.7980
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f14e0e-164a-40d6-32de-08dda7551394
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 12:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218288

T24gOSBKdW4gMjAyNSwgYXQgMTM6MzksIFBldGVyIEtqZWxsZXJzdGVkdCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gUmVtb3ZlIHRoZSBjb21tZW50IHNpbmNlIGl0IGlzICho
b3BlZnVsbHkpIGluY29ycmVjdC4gSW5zdGVhZCBhZGQgYSANCj4gdGFnPXYke1BWfSB0byB0aGUg
U1JDX1VSSS4NCg0KQXMgUGV0ZXIgTWFya28gcG9pbnRlZCBvdXQsIHRhZz0gc2hvdWxkIGJlIGFk
ZGVkIG9uIHVwZ3JhZGVzIGFzIGV4aXN0aW5nIHNoYWxsb3cgY2xvbmVzIHdvbuKAmXQgaGF2ZSB0
aGUgdGFncy4NCg0KUm9zcw==

