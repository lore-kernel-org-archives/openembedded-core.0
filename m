Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AF5CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 19:51:05 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web10.6614.1755719457565973810
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 12:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kRSdC2QI;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kRSdC2QI;
 spf=pass (domain: arm.com, ip: 52.101.70.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=b8oOgad74PEwQHfmrRw8xXlMpzgBdeJGHQNDaI65IbPHKoSJrbbpLkEh9J6YzBalleaA8S52BFhuqEHBGVrDLbsIl7bYlOONHjTgHjzCRIv1sAXlMuSc7fJIKA4WIspMtsCxPx7ns18OMVMZroZ9QYt0BGd569HDw7hxsmY2QLCVy3nUiUZs05K4GEhsbGGspGqq4JrTwG2QL7HxHt+OH2UlDYz1w1F8VVdgPc/cDFu3XKtpHyXt3diThAMTbPLKwwfznl4IFogDOv0e0GAiLqwnNVvzQg7/0F0T/DVEgNoj4rgVPem3zGIPyyaCKO3dW3YwE37DiGMDZD03dEJvEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N9GBg8S4eqZFejwzWxGVP0Xon61V3IU+RBRCnd8zd0=;
 b=gYsJEx262vINNAz8sO7Tt8JSPgpBHR4v/weC2yXC+kGkuBw3DiUWdebcs765+urkZ+czqxkPsgDEwGCbDuROCBii61iQt8JssbkGLAQKF7gc2WXR7kWv+Ui6L11+jec2ysc/Dyb40QQVBe4goBsnxAWZuP0pWMwTUo0JMFyDYDNfgkqX3fEQYs5cnQAwWOrBVuZ/27N5wXPi5PwiNDaFWq9eoIiXCyU+9dhKGI3IGStdLDbA1C3dTQRQnakWBzgLN5/a/OrWmomLs7LYcOAiSiSBOZTGSgE3Zd0fPLcjiK+fnU/WDHEPeX/wZmN1v/XdatlgLOV+aKJRkgjExBylcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N9GBg8S4eqZFejwzWxGVP0Xon61V3IU+RBRCnd8zd0=;
 b=kRSdC2QILfj7hjIqm8GqwSxnuEkSU6Yr6Qv3nz6ZIbiFSM5XZ8N7csCUre44i8u8T+zWOgX6LdUF/UNuZsm5djh+1gUedZcGDf/UBXDnZCSJkjBqvATt7UoPWiMTuOtwNttCHlsHS/U5LcpwacBzlLsEaDx8Ek/NJ33DAM05Zzs=
Received: from PA7P264CA0096.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::14)
 by AS2PR08MB10373.eurprd08.prod.outlook.com (2603:10a6:20b:546::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 19:50:51 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:102:348:cafe::3f) by PA7P264CA0096.outlook.office365.com
 (2603:10a6:102:348::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.14 via Frontend Transport; Wed,
 20 Aug 2025 19:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.8
 via Frontend Transport; Wed, 20 Aug 2025 19:50:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8IZTJ6zmDZTl3Yuix+iSq7AXdHl9jzSlf+Z+QEhu0gYSnGHBuR6UUQM3HAY9SOwvuYyqQGZY6bp1SOf15ci6dFFomjOEfEg2nHAvAJgGAXSxSvV1CmbY2/onVbDZlnmdgYcc3Y5Udi1fWO16rimylKMbl50UGVyYxiwRVuOg7mgMeeYuwaYBN8GWKsruDxOV5mSoZsGwWFh9NZmOQC8VGPYVHZZ3QhfxwiRj+BpssbpLou6N7BuTnmJeHMYAvpprhf+Dj0crk2nRqlUwanqMisQBHmwmdKuaCkD46GGuzjcatWWNQFUfOHVW6YCqMBviK0lQFXTauSBVDtAP0I2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N9GBg8S4eqZFejwzWxGVP0Xon61V3IU+RBRCnd8zd0=;
 b=SH4yXyeQSETSqmbInk0KeQxSA5kxO8hzkgods3wtvsA7MReuYph3AaBVFsLrICOULcsjLfyZWEAoXCMNre9Pvt5Toe+jk4+VIuqylMjhyEhhrBKAYHqJHRJyKU9A/Jw19lSpUGfZQ4e59P77dQ5G55kmFqLPCo51aFpbGhCRJrjyOzSGae7V+1Mgqc2f8kEtPc6sICFY+t7C+0hO4RnlL3DCt8WPJseb5xUmsezVu07XiBnry6ILaMzjvXkljHPiixD4VRPlgHcB684V/WFgiKJG9lsEHMmYdX0p2GUzNU9DisGy19FqitvGV/+Fq4gxUuR/goQgVf76i6MO3RPL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N9GBg8S4eqZFejwzWxGVP0Xon61V3IU+RBRCnd8zd0=;
 b=kRSdC2QILfj7hjIqm8GqwSxnuEkSU6Yr6Qv3nz6ZIbiFSM5XZ8N7csCUre44i8u8T+zWOgX6LdUF/UNuZsm5djh+1gUedZcGDf/UBXDnZCSJkjBqvATt7UoPWiMTuOtwNttCHlsHS/U5LcpwacBzlLsEaDx8Ek/NJ33DAM05Zzs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU4PR08MB10984.eurprd08.prod.outlook.com (2603:10a6:10:573::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 19:50:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 19:50:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
Thread-Topic: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe
 cleanup
Thread-Index: AQHcEdaEg9whMBZ4NUuurfZe3513cbRryOUAgAAqrYA=
Date: Wed, 20 Aug 2025 19:50:16 +0000
Message-ID: <A3413038-010C-482D-8ECE-D501ADA44842@arm.com>
References: <20250820132929.2644708-1-ross.burton@arm.com>
 <CAMKF1so0oZt04POpvabf3k1J0WNk_7eRW1wYQ5uwt4xOT61X2Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so0oZt04POpvabf3k1J0WNk_7eRW1wYQ5uwt4xOT61X2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU4PR08MB10984:EE_|AMS0EPF000001AA:EE_|AS2PR08MB10373:EE_
X-MS-Office365-Filtering-Correlation-Id: 13877a32-1350-4566-60b2-08dde022ddd7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RXRaNUd5TXNMeFQ0UVRFSUIvd0tRRW9rYzl5REVVSzNCUHhETXJRV0JLNThj?=
 =?utf-8?B?WXZWV3k2cmN3YlFOUXRxSTdNUVRkcUhIaS9YNGNmbWJTazBPRlhpSzA1Vm9Q?=
 =?utf-8?B?clprSWI2TE1KUWozUTBVbjdOZjVPQnJIRGI2dVNOWkNNN2hCQkM0U2pwSFJT?=
 =?utf-8?B?RUlhOHRtNEdLYjgvR1JSNUxiRTArNXd6bm1rbVV4RGN1K3NXSTU4bExCcTRK?=
 =?utf-8?B?czI3eVhmeG5pbVBVUzhiK3l1anZWWDVpUEtqTUo0ekJlS0l4L1lrb0JKOGtU?=
 =?utf-8?B?eEpidlZGRGRCc1VlVmNBbFhvaU5OdDkxT0ozdFYrd2dQVkV4c3h4UWZEcVFs?=
 =?utf-8?B?NW53WG84YkFKRitPaFF4YWRwR1VPSjdTNnRndGoyZnMvSldVdFpwS2tYNncw?=
 =?utf-8?B?VmhXY1htNWp6a2V4anI4WlR6TzI0eXRCWTdlZExyMkxzMnFCeDJRMmFpbDNn?=
 =?utf-8?B?ZVlxbytic3Ryb0o2RFVwWGdxdUwvYlJYZkNQSFE4aEt5LzFCZ3hTWGF6Y1pq?=
 =?utf-8?B?UGNDZEhiQUJZM2VodnZOVVh0Y3RUdGkxakJETVdEMnY2OURkbUN5TFg5c0tG?=
 =?utf-8?B?S2g1VGJ6L0pyTlVsVkM4ZUU5RFZpL3o0QUdoU044RFVtYU9yT3FqK25yV0ow?=
 =?utf-8?B?Nktod25DK0JpclpKTFFXWG00dnZGOXUrTUREclNnUzlDeHI3S25abFBtY1lP?=
 =?utf-8?B?M0pxUmk2OXZ3RkNOMCsyUGhCVzRPRnE1NHlGWUl1ZUcyUnJ0UGFRSlhSQXB2?=
 =?utf-8?B?WHRTUHpOcEk1RW0rWGEzbUNENW1VU09RMjNYTk1lcTFSZFZESE5xaGVLQ3o2?=
 =?utf-8?B?MHo4YldTMDFiMWFvYmJUVVo5VHcycjJETndHMkViM2tMb2FPQW8yUEpYZ3lj?=
 =?utf-8?B?WG9jcUJzUjhKelJXbnRZUU53aEUyR256azZLQWhmVkVzMWxIY3BrLzFaRURn?=
 =?utf-8?B?Ukxsd0tSTHRMTjdvT0NablM4YVlQYjFud2xNYjJIRGVka05KSCthT2h1ZHN5?=
 =?utf-8?B?bVRqUWYyZTJOT3RRcXEwbnExaGFqUkVWUEp0QmZDMDIra0NQK1ZkRi9WNHkw?=
 =?utf-8?B?NU5TVGlHTEYyUzExSkxNM2lZNGVXRWczQTlScUMwbG14ZC9MZFJ6ejE1cTdi?=
 =?utf-8?B?a1JZYkhMZXBBdDI1Yy9kajU4NHY2Mm8ySjZBTWYyRjduZ0hIcHVKVmdKNnZU?=
 =?utf-8?B?bTVlck5Xa3lIU0VlVkdPdTBkdGVSblhxVG50YTVtaFVTWUxObjhhcWJTNWtL?=
 =?utf-8?B?L3N4N3dMemttbkxTZmx1Z2hzNkhBTTJ2N0ptdGZTTCtBby8ra1J1VThLYklP?=
 =?utf-8?B?SExGaFVyc1lWNUZwa25aK1lWUjk5TkpPa3kvd21NeGdXc05ncXErV2NWUEIx?=
 =?utf-8?B?ZmNZa3BYSi9VSWkwUll1b015Qk5XTTE5WlRrZ09xYUY1bWlieUxrZ3QraEZO?=
 =?utf-8?B?bVBlV2c4ZnhWTXhEeEhHb3cvbFl6L2loeEx5K1IyeHZiSjJJSGhGRktSNGs3?=
 =?utf-8?B?SkJqdjlkZjFNVG1FTndXcmVIN3Z6Zjd0MnVjVDJqVU10RHVSYm9lUG9uZWdo?=
 =?utf-8?B?UklnaXp0MndyU2VQeG1YUzBVV2g5cjB0K3NtTmpkMVVuMURQZlB1cGtEUVFr?=
 =?utf-8?B?VS9DQU51SzFoNndSWEtNSUpyTmR1OHpPQzZxVnBCRzdxSTZrd1cybG5ydVFt?=
 =?utf-8?B?bEErMk93Uk5LV251dmwyWmNLdzVETGNiaXl6REhIWjJMVEZSL1F4bDk1bGw1?=
 =?utf-8?B?ZkhzdW5KZXZWdjlrV1pVbndUNjV3V1FMb05nQ2Zsa3FtTm9OTWUxSUpwQmxX?=
 =?utf-8?B?anY2clIzS2ZLNGFTek9YVDJ2TUVLNG1wNGhacXEwUkNtNUxHTExCWW0zd2s0?=
 =?utf-8?B?dWY0ODFYT091MytyelZkSmx2dENwY3dhRGMvUG1EY3FIa3ZzWnE2Vm42YUNH?=
 =?utf-8?B?S2xUdXU4bTRZYlJyWk1EOGpSQ1hrZnQvN3lRUkd3aHM0cDJsMEVhV01YRm9K?=
 =?utf-8?Q?QISSfkfoG3f5+SpDsBBux2yk+TETgM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB147BAB9235A749A58A63187D623743@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10984
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7db00264-4683-4519-ff35-08dde022c8ed
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|376014|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VXI4cjdNRHVGcEhuM0N5WkdQdTVtRDhkZmRBK05Jb3NMKzJQSDcxVHp6L3lR?=
 =?utf-8?B?VTJFRFlDSGp4aGNUZFM5djZoWFFUd2VZVXF2ZWpxTXE1RENkNVJLTHpaYmRY?=
 =?utf-8?B?SXNsKzBGN2lEbWN4M1B2dGtwOFhSUTVkTjNWUmQ5cVAwdCtJNWhHUzBQTFNU?=
 =?utf-8?B?QnBNNmJrSGEwb2RxVU44UEUrcDlYWHBMWGlvL0Q1bUlRbXRXb1BPRVJ2THhu?=
 =?utf-8?B?VkhWNm9SRjBBeSsxaDY1a200TmFTQTRzYnZ4am80bSszUmdYNmZRa29IclRr?=
 =?utf-8?B?d2d5bFh0c3NaczZxZEo0MERuV0s5VjBsM3Z2UEE3bXQ3c1R0aG9wZThnTWZD?=
 =?utf-8?B?Wk1LYlRWZ3ViOFhZM1hiTWtwNHJsY3gzbFl2TkJ5TndYWCt6UzJkZjgwc2JV?=
 =?utf-8?B?UW5ISVdlU2tKeG00L3hTZXVKTVVxK1QybjhPOHNrZDRFamlSTGtWS2dNbEdl?=
 =?utf-8?B?NElsMWdQenNYRWk1R1VCcno3OWNnR0JZeno2RkRvaXpPNXYxcXp2TjVkaFd4?=
 =?utf-8?B?aUMwT0hlenlNQTZFZVFQU3QxMXJuR3ZpSVJ4b2IvcE5keGxtT1d5bVlMbUdK?=
 =?utf-8?B?WjgreU91ajFzblZGTytVZHl3dEV3QldhTmxpayt2Zlhhd3FvYUlzS1VTWTN5?=
 =?utf-8?B?WHc1MFBDYXJVazBpMGRtT2lmdVdFWVZWejBuSDlVVEw1OVFVazdMaXdvUWRr?=
 =?utf-8?B?VHU3bGtkamVvMVZhRGVKQW9GUmo2Wk9xY3VyY1d0S0VEZ0JCdytMU0xFNW9a?=
 =?utf-8?B?MktpNmVqOGdqVi94N0dCeTcxdjRmUElHMzZzaDlBdWtvRHlZbWprWXllK2pK?=
 =?utf-8?B?OUxFUG5ndGxQSlJhYVgwSmtjL2hXcmZuQjRCaGxXY3BoQy9DU0dlYVNTNXh0?=
 =?utf-8?B?TU0zWTQ5M3htL2o5L3c3Y1JyQTNXd3haM3l5eS9GamtzN2ZnR3RDWmZjZTVH?=
 =?utf-8?B?aVlQcjFwR0F1cGZScWVlMXNURlBVazd2LzlHc1ZvSmJid295a0ZEbEdadzJk?=
 =?utf-8?B?dzYzSkQ3d09jVmlYVVBtU2JTSTloMzBYWTZCWDYyUXBhazBxZEFSc2dhd1BJ?=
 =?utf-8?B?VEVjRWhMRW5EZjkrYU9LUGVvZXZjRGNnSHpPYzZrcU1FNlZrUVVtOUVSMjFo?=
 =?utf-8?B?R2NNWjgxallva1FsbmFiSFE3TUhxYUlIOTQxZ1ltc254bTRQNUtRY2tPbFd1?=
 =?utf-8?B?NnpVbkN6U3R1ZFM2dUJQblMzL3FrYkJ6SjJOWHlBMStGQnB1K2pmQ2RmTVJ1?=
 =?utf-8?B?MUFuZW1yc24wNU9hQWRaVDdHZi9aU1ZkdElON3RRblJzVHJrQU9aYUxKTE5B?=
 =?utf-8?B?bllJM29FbStZOG9xR3FPOXl3WWVUWUE5d2tKSzhRYmpGSW1NMjFyVlg0T2hh?=
 =?utf-8?B?VGpBZk9hTmQwNm1UL3gwUE5nRGNpWXlybVBJZ1VuTzJxaHhnb2dNSXgweThB?=
 =?utf-8?B?MjJHQStnNHkvRzBDMzF3eFdTZkZOQWo3R0Y3Z2g3MUZ0eTRwRGV1cm5pdmVa?=
 =?utf-8?B?OVVxUEZJMWo4RnlhTzQyY2xzV3MxR1VwQzRkZFZ3VzRzaTQyT3FFRzhhcSsw?=
 =?utf-8?B?MUV1clppd0VGVjBsMWlkUUxOM1RFV3l1dmI5NHQ1YmRGelFiT3FpS00zLzZN?=
 =?utf-8?B?V1Q5YlNwUVd2ZUNnVUhDa0JHMGhBRSt2NHZqMk1IeHFEeUlOUmxuWHhxZndj?=
 =?utf-8?B?QzMreTFEZmd0OENFb2R0QTZYOEtSdGFJWTZrbHBaUTJLK0ZHSEJZcDJNRFQ1?=
 =?utf-8?B?ZCt4OFdPNFhQNlVHM0JQTnJONkRqYmtYYkJ1ajY1K05jdUpUV291OUNqRnJE?=
 =?utf-8?B?SzdtWW1hNG5jSjhnOVFXVlg3ZVpUMmV4SFpabzZjK0NFYzZPQUVrQ3dMaWtO?=
 =?utf-8?B?UTUzSmRnMTlKNGhtalNka0l3eFQ1SURnbFN6L1JwR1VMbEUvMTY1dWI3OS9r?=
 =?utf-8?B?cFNnSkdvUzZTTmZ5Tzl5OUZlU1pBMW9wZDlESjBLMzB6d0swTWNiSHZER2dW?=
 =?utf-8?B?VzVldHVKZUJqS3VFMUg2UDVnZ05xVlAxWncvZU92NDV5RFFsWEtHdnpYWjNi?=
 =?utf-8?B?YVhKT0pvYmdmdHM4VktnQUxZZkRxYXBGY01PQT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 19:50:51.1428
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13877a32-1350-4566-60b2-08dde022ddd7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 19:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222195

T24gMjAgQXVnIDIwMjUsIGF0IDE4OjE3LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIFdlZCwgQXVnIDIwLCAyMDI1IGF0IDY6MjnigK9BTSBSb3NzIEJ1cnRv
biB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+IA0KPj4gLSBUaGVyZSBpcyBubyBuZWVkIGZv
ciBweXRob24zbmF0aXZlLCBhcyB0aGlzIHJlY2lwZSBkb2Vzbid0IGRlcGVuZCBvbg0KPj4gIG90
aGVyIHB5dGhvbiBtb2R1bGVzLg0KPj4gDQo+PiAtIEluaGVyaXQgbGliX3BhY2thZ2Ugc28gdGhl
IGxsdm0tc3BpcnYgYmluYXJ5IGlzIGluIGEgc2VwYXJhdGUgcGFja2FnZQ0KPj4gIHRvIHRoZSBs
aWJMTFZNU1BJUlZMaWIuc28gbGlicmFyeS4NCj4+IA0KPj4gLSBSZW1vdmUgb2Jzb2xldGUgQ01h
a2Ugb3B0aW9ucyB0aGF0IG5vIGxvbmdlciBhcHBlYXIgdG8gYmUgcmVxdWlyZWQuDQo+PiANCj4+
IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4gLS0t
DQo+PiAuLi4vc3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjAuMS40LmJiICAgICAgICAgICAg
ICAgfCAxMCArLS0tLS0tLS0tDQo+PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDkg
ZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
c3Bpci9zcGlydi1sbHZtLXRyYW5zbGF0b3JfMjAuMS40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIwLjEuNC5iYg0KPj4gaW5kZXggNjRhNzNj
ZTU1YWEuLjNhMDkwYjdiNWNiIDEwMDY0NA0KPj4gLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIwLjEuNC5iYg0KPj4gKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3NwaXIvc3BpcnYtbGx2bS10cmFuc2xhdG9yXzIwLjEuNC5iYg0KPj4gQEAg
LTE1LDE4ICsxNSwxMCBAQCBVUFNUUkVBTV9DSEVDS19HSVRUQUdSRUdFWCA9ICJ2KD9QPHB2ZXI+
XGQrKFwuXGQrKSspIg0KPj4gDQo+PiBERVBFTkRTID0gImxsdm0gc3BpcnYtdG9vbHMgc3BpcnYt
aGVhZGVycyINCj4+IA0KPj4gLWluaGVyaXQgY21ha2UgcGtnY29uZmlnIHB5dGhvbjNuYXRpdmUN
Cj4+ICtpbmhlcml0IGNtYWtlIHBrZ2NvbmZpZyBsaWJfcGFja2FnZQ0KPj4gDQo+PiAtIyBTcGVj
aWZ5IGFueSBvcHRpb25zIHlvdSB3YW50IHRvIHBhc3MgdG8gY21ha2UgdXNpbmcgRVhUUkFfT0VD
TUFLRToNCj4+IC0jIGZvciBDTUFLRV9TSEFSRURfTElCUz1PRkYgc2VlIGh0dHBzOi8vZ2l0aHVi
LmNvbS9LaHJvbm9zR3JvdXAvU1BJUlYtTExWTS1UcmFuc2xhdG9yL2lzc3Vlcy8xODY4DQo+PiBF
WFRSQV9PRUNNQUtFID0gIlwNCj4+ICAgICAtREJVSUxEX1NIQVJFRF9MSUJTPU9OIFwNCj4+IC0g
ICAgLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgXA0KPiANCj4gSXMgUmVsZWFzZSBhbHJlYWR5
IHRoZSBkZWZhdWx0ID8gVXN1YWxseSB0aGlzIG9wdGlvbiByZWR1Y2VzIHRoZSBkZWJ1Zw0KPiBp
bmZvIHNpemUsIHdoaWNoIG1heSBub3QgbWF0dGVyDQo+IGZvciB0aGlzIGJ1dCB3b3VsZCBiZSBn
b29kIHRvIGtub3cuDQoNClRoZSB1cHN0cmVhbSBjbWFrZWxpc3RzIGRvbuKAmXQgc2V0IGl0IGVp
dGhlciB3YXksIGFuZCBjaGFuZ2luZyB0aGlzIGRvZXNu4oCZdCBjaGFuZ2UgdGhlIG91dHB1dC4N
Cg0KKEkgYWxzbyBuZWVkIHRvIGZpbmlzaCBvZmYgdGhlIGJyYW5jaCB3aGljaCBtYWtlcyBvdXIg
Y2xhc3MgcGFzcyBSZWxXaXRoRGViSW5mbyBieSBkZWZhdWx0KQ0KDQpSb3Nz

