Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1339CD6910B
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 13:51:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.68])
 by mx.groups.io with SMTP id smtpd.web11.95218.1732801880338513165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 05:51:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XiUpfV1R;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=XiUpfV1R;
 spf=pass (domain: arm.com, ip: 52.101.67.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QrAkoVrSj2zJ1iCRknrWLxKs26tjnK9W6ROr0ORN6bucMELF25mAvKzrV8IcCyL3/ypMtzX8Nnvhe1pemQ1xbz+DOoAp8IiTmNohcGFZT3a+eeygvqUdSlQMr5LyphCXkVTq0T+ZR/4VKfIR4KrKiZcFX3pFPpA7gSl/AR6xF8RAedLCJAhu52rSyd1r5RnbsaucJYtF+LTnwI4DuyNaL4Tns7sv9fDM8b0oXlILoAJhoD63VWkZYt/FoGFtFGeYXfXG1Dd4Xbbpv0KyBufix5vOQu5DQSYxvjZWW66A8+b3pFiqIBvR8X2HA4MwrjDRlLePleWbmjqrkyWFMeKOHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDY2HRs1eM+4t4K8rZhgv8sU6gB4V3vsop0JvK9HmqY=;
 b=jESpO0IvnSm8Kh9oEEobjSjky1+Z5C4HD0RVbFyRTajpXgHo3ks+qe1hHW9wyl9TS4YAfNVBEDAIWgLlrHhrdyWNVcIuX/176QqmhxAfiuZ5bWxGZw5RAR++LsJDcE5/aWEmyfvWphBRWytp6cW4XPQLxa4elCz1lFeeq1+eYtcMKpGvCq8p793BIm0PTwmLioj31ta0dUkZpXbOXVuMWGaGkuQeJslgEuwjhCt996VtScRLaliCMMcg75xicqpbb7u8sIwUhMHU74tfDkkAQFsEmWMb8Xkc+JeQ2cQVDEie7oEZLPKv+13gJtb9NA1sQgDRi7BEcKSVRb5kIDhgDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDY2HRs1eM+4t4K8rZhgv8sU6gB4V3vsop0JvK9HmqY=;
 b=XiUpfV1RFGCKSLQ7gg7tfqepltm3AI91N4jsT1oHXeugbvEqYWX5+3LQePHsjziSxKn8FEWXRikBllAbeBfT3Jmx/x3etYpRq86lQkrWqdEkz8sHK6wVXRUoEomnxbCfPsA+EWWBjpd0Z/DBXHbdZq3TR/U759KACUtTonE01Bg=
Received: from AM6P195CA0072.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::49)
 by DU0PR08MB8207.eurprd08.prod.outlook.com (2603:10a6:10:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 13:51:15 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:209:87:cafe::76) by AM6P195CA0072.outlook.office365.com
 (2603:10a6:209:87::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Thu,
 28 Nov 2024 13:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 13:51:14 +0000
Received: ("Tessian outbound 02553984e049:v514"); Thu, 28 Nov 2024 13:51:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6ac0677bce5d6fe
X-TessianGatewayMetadata: Ojs3euIoh+LF1abQEnMXDg0ORQ9F9xU79ut5RKmsxDMpXgRKL341Br/38JmmkcmB05rMQ1GvCX1ZAodJj3oyk6fiqX65ny1Rsyw0rUpeeeVLBxqStcAewtVAOSSVsFamENwwFWeqbv+B2CZh0sF/jLYB5C/Zik4dXdfoPCFylZw=
X-CR-MTA-TID: 64aa7808
Received: from L5be5a2dfef53.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 12CE1A3E-267D-4AAE-9749-C21A2126479D.1;
	Thu, 28 Nov 2024 13:51:08 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L5be5a2dfef53.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 13:51:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrSInkzRiYKzi0K/8xpfkhrBFQgpXP/MWXQ40liQJvyK+rTixx8M0V8K317QQLb3/t4H0pDvKMxdKl4NUukihMhHRlZuVXsOI+/ourQNEUuxkYxd1u4kMfxhiEbJxUYJl3vkWHYKFJKTd5DoOpYWJtoQM5mEo6mTLY/UedPwMZ1KIqjrDm9S61WKqM1p8hvOSAlCbYEn+IGToJVY1aD/Ot3hLi2VNFNA6QWenZ4mSJUIBegntU9P/ANW7GUOu8ity4rP5aI+0uWEyUbXylhAbogiKxTBQO/g+hIccykzljqoITaPmXNmDUnT0x14kZBmcLxMTtmes+/HM26rKyAjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDY2HRs1eM+4t4K8rZhgv8sU6gB4V3vsop0JvK9HmqY=;
 b=WyCInhXZT1EtUxQBvcSe2Xg0Oi+wVuIqteFRj6r1OXZa5jd0zHw+P5Cglt8Qi74E9xGW9/NXZud852IKOUjsv8E1COMdiasRj/ZLs0cf1Du/CouY2GwaVRn+9wozvB8nR3ee1GktDDrIkNbjKZt6vFdtCfnLq5dMpDAJuZ7PWXhfkJFzBY/GX+pqZmUbt0T3fAUjo2/r2apfDNSuO8qHZO3Vb7qN/09urxfdbn8+Lo/qfo6j9wo1QrKjd29bAqDwXCGKF0edLYf7L73UALKpiFGzqJtP0sOGt0nB/alO4a/gxA1NxeS3bHH16BkY0H6Xntxl2CuoEyRzZNjvnhzAbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDY2HRs1eM+4t4K8rZhgv8sU6gB4V3vsop0JvK9HmqY=;
 b=XiUpfV1RFGCKSLQ7gg7tfqepltm3AI91N4jsT1oHXeugbvEqYWX5+3LQePHsjziSxKn8FEWXRikBllAbeBfT3Jmx/x3etYpRq86lQkrWqdEkz8sHK6wVXRUoEomnxbCfPsA+EWWBjpd0Z/DBXHbdZq3TR/U759KACUtTonE01Bg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8284.eurprd08.prod.outlook.com (2603:10a6:150:a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 28 Nov
 2024 13:51:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 13:51:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jamin_lin@aspeedtech.com" <jamin_lin@aspeedtech.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "troy_lee@aspeedtech.com"
	<troy_lee@aspeedtech.com>
Subject: Re: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Topic: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Index: AQHbOYOsLghdnSp4Y0CIH703YxxwQ7LMxguA
Date: Thu, 28 Nov 2024 13:51:02 +0000
Message-ID: <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8284:EE_|AM2PEPF0001C70E:EE_|DU0PR08MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: e57a9094-b7b0-4d75-0539-08dd0fb3b9f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z3NxRVcrQTR1ZWpFclBOQU9ZUGVLVERYTk9ob2g3SDNzVjVGc0tBYnl5UEgy?=
 =?utf-8?B?cXVFQjBmZU5yQ1d5SFBjSW1TVDBoZ1hjZFNvdzF5V2hBV2tDUjVMemphSmpZ?=
 =?utf-8?B?aGxqQ1l4bDVEWklDb1VEY1crZzk5R0dwZ0w3cUNkeGhaVjJmdWh6ZG5wQXMw?=
 =?utf-8?B?MUtlRTZVM01VblNmWlR3OTlydDhzWjZ3QjRpU1k3RFdGbk5kR0VEVGtVdFFK?=
 =?utf-8?B?eEZ1NWpCUk9JdHJkZGtkenAzZGNrMWxxUENEcTNYQjFQeXpTS1Y1bjlBY2pT?=
 =?utf-8?B?dUJ3Y1lkaGx1eDg2cEx0YSsyWHU5a1FxLzFSemlHMFFUaHRMMVF2Z3FPSXhF?=
 =?utf-8?B?NzFZbFdYYVdlbmJYODVpajdTT2xISzJmZGc4UW9rRmMwTzBUNHVBc0Zsb1M2?=
 =?utf-8?B?SzZ4bXBxVm9iT2NBbldoaS9jWmEzK0ZObUVzd2JqeERWY0JQMndJVXlkU2pF?=
 =?utf-8?B?ek05KzNaZFpRdFhmNWd3c2ZYV2t2Tk9SWFVCSlNwSjR0M3VaUDdKMlZFaXpP?=
 =?utf-8?B?bmRlMU9DOXlENFViSWVOc3hmRXZzeUMwd0hIemF2V3BzWStueHhHYUtPb2pC?=
 =?utf-8?B?ZUFJb0xiNU5oRWVqSjkxb0F2SzN0cm01NTdsUUQzdzJoU0FpV0pIdTFXTWVh?=
 =?utf-8?B?QjYwS0Rsd01RT2c2Q1dlMm9hUGk0V3BsRkZhczZmMkNEVjI0Qzk2cmNQV0ZR?=
 =?utf-8?B?czlxZGpBVE9SRTFHNE1EL2E4dDdjOEs5cFgxb1N5TVJWcE1INDBCbHpjV0xE?=
 =?utf-8?B?eW1LVXhGNnBsaXJJTTROa3ZVWG9sQnJWazFzOWJHVi9tVEEreGtVVTdNQkVL?=
 =?utf-8?B?L0d5Vy9uQWVXQ2FzV1RWbFFCNnJzVWw5Z205UVg4ek1UTlRnQUl1cmZWcGVN?=
 =?utf-8?B?WjlQb3BYbXlBam4yUG5jVnh4bCtiZU9mRXRKT3V4Sm13QTFGcVZZSDhrcVBq?=
 =?utf-8?B?YXh5dHdhQ213ZitBejBab0tDREFQTjZOazM4eHlMTDNzTG9scWRQcXBWSUZG?=
 =?utf-8?B?MnJaay9MeVZsUkl4bVQ3MVYrUFczMyswVzlVR0w3V3R5UkpUdE5wa0NGWlhV?=
 =?utf-8?B?cmszNFlXRk53di92eTlLcjlKNkNVVWRBOHVPbTgybzhmdmJVcWs2aGRpQmVI?=
 =?utf-8?B?M2Nyc2h5c0JickxqUE5LVCs2UVkzNHdySS9Ca2wweGhIdmg1eXdIellFNHBt?=
 =?utf-8?B?RnhrVnI0OEtmME1ZdVRQL1J1eUhrQTBnT1lDM0pLSnphclNLRWsyRFh4Q3l1?=
 =?utf-8?B?Ym9qUk9RK3A2T2RHYnh4Qlc2N3QybjBGeDJaRU5mOVFSN2FXdit5SG5lc2FC?=
 =?utf-8?B?VjZGK3RJbmR0REhhNlJuem1ycDhLT21wditPcTBuMzdFWWtPS0JxbGVYSXdo?=
 =?utf-8?B?SEtnbXJNRUcrbXJVN3Z2Z21LN283ZHdiZllaT241R3JBajVoU1FDb0plZk1w?=
 =?utf-8?B?aTFYNHBXVkNLY2ljdHVwdkxlcXZqNnZadmh1dU1wMDg4NEcvWThxa2wrYncw?=
 =?utf-8?B?eExoUGI1M0xOeDNqd3VkSlZxMXg4bzNJemNKMHlDdm95MmxjbkU3YUZBZnYv?=
 =?utf-8?B?S0hnYzdpSEoxTWFrWGU3c2tJRFpzR2F5dzEzNCs0MFplanQ5cnlDNExHRHF4?=
 =?utf-8?B?RVVaakk2aWo5OFZwM2hXbEJFZVMzVWQ3Yms2bWtwMHF2VVNoQ3ovai92cVBF?=
 =?utf-8?B?NjNwN2ZmTGgyZzBOUHdXZFI1bm1LN0pnWmpURXJ1ejZZQUhpZmFjNFlUS3BK?=
 =?utf-8?B?Rk1tU2t1clZPazhmZHFoc2xLZDA5MVNWYzVXUkcxdnk3RERpRDl5ZXdCSE5S?=
 =?utf-8?Q?RLbN3xN90vtIQdor+xoKr7oN1FgtGYO16wudc=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <241FD03E6B763B42A3F42767FE5F083D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8284
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	be4b549d-4fe1-46b8-33ad-08dd0fb3b259
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|4022899009|36860700013|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmpMc2hURUJ6MGYrV1FqNXFhSkxJby9sdDlXcG92Qk1HL0dUSkt5N25qQ1hK?=
 =?utf-8?B?WG4wMzRqOTdyUGEzSjhBRXdFL25CcTlOakRXRGxucXJxZWNRbndQNHNRdmJF?=
 =?utf-8?B?OStYK0xndVRSMzcxUmZPdGZ0dmpjcVp4MzdYRHlTKzEvNkkrWkd0dmljeUdp?=
 =?utf-8?B?K2xEaEVKQUY0TXUwK0VBbTFXRm0wb0kxaktkMUFPLzhHSmhPK2JkT2NsZy9Z?=
 =?utf-8?B?S0Z0ZDl2emZvMTF5Tk1LK0tzYzM2aHFLVElnaUxaTkUwOFV0ekxoaUNBU3pP?=
 =?utf-8?B?VEI0bVBLWGlZY0k4U0tKRllFWVVOdm5LQlNoNUhSeU5DeFNRbXpJekZnbGJB?=
 =?utf-8?B?V3NBUTA1M3BIZEZjWDY0RThuUDROT3ArcnY4RXI1elYyaVNSRjRyMEVNb0Er?=
 =?utf-8?B?bC9GNjJWQWhsYlhtOXhJbHhhVHN0d3o0ekZ6TmNtSlpDVDhjeldKQTBHUVJB?=
 =?utf-8?B?QXQ2dWdESVA2Q2FjblVIMkFZL0VuSGJ1bjNzWFRQZVQrMUhOOERTblRSbWoz?=
 =?utf-8?B?a0VCN2FYams4bTJLMytXTTdlQzJjbEFvamVOY3BqcGU1TndmdXlkTEQ3REhW?=
 =?utf-8?B?YzQwaksrUFkyRG5iZjQ2bncrei9TZjVnZW9TVmpWTWRTZ1Zyc0hUK05EbWRZ?=
 =?utf-8?B?SmRTbFNNZTdoZ3I3bTE0cGljMFhRSkRiV1RNaUMvenQ3V2EyallvMDNuMDVk?=
 =?utf-8?B?SjhXdWMycXRVTnhNeUk4RkIyVUNYeCt0djNQc2hydmJleUJSeWdKVm43cnVk?=
 =?utf-8?B?ZDBjSTM4SVFJYzNablYrck9LQ2x2YkIwR01wV1FGSTdyQWlQMFJBd2pPMTdm?=
 =?utf-8?B?RUxleWM2R2t3UXFkTG0rMDBKT0t2Sk5yVll5NjJwNCtuSTBtUVZFbFc4R2l4?=
 =?utf-8?B?aXNNaFM1VmdhS0hyb2FnTGt1cVpzUFpwSHRWOVRtUjVCQktDajcrOElVM3JV?=
 =?utf-8?B?VGNEVm5mVXlyNzljMkxDOEN4WEZJVHR4b3VEVW8rRWUzT2hvdWx5ZWQwMnVV?=
 =?utf-8?B?cHQ0cUNRdGJxbFQraERwZWVZeTB1NHFkT3JpNFkza3FSUWg1OGNnb2ZOUjRC?=
 =?utf-8?B?dU84S0l6TzRldUFmanFMSzZ4NTZvOGhZbVR4MHhhM0I4ejUwZjdUWWZ4NXA3?=
 =?utf-8?B?QWlvWVp6SmdOSzNPM0FwQ3A5ZUNEcysrbHYyOS9ZczY3c0g3bVhNK294ZndG?=
 =?utf-8?B?Wjc1eHhpNGJpRjJ5RHI5KzhSWmtpNmpyaG9EYWJlM3hHWDJqdkU1OW54eXdN?=
 =?utf-8?B?VTlyTGFqL2E2cnFQMllnY3BLa05OK2YyRnFtc3pMS0xDSGN2NEg1VnZiQ2Fr?=
 =?utf-8?B?UjJPSGlsQlltWE9SUWhyY3p0TTZUZEtWdXNCWVl2eWJIa3R3aTRkUXJhZHJL?=
 =?utf-8?B?ckJRSDJXR1dsNi91b3BRQmJCbEJsNGZaSkZ4SEdTaXEwb3dNYjY4Rm0zeE4z?=
 =?utf-8?B?QWFreTZoT3h4Vy9YcXlJcHpBRHQ5ODVJSzRtVnhza1FDcXBWSVh6R0E3L0RB?=
 =?utf-8?B?UmtmdVFoNkhXc0VORnRGVmM2a1U0TVFoSVI2UkJpSHJ2cVRkWHlEbC9oUGg5?=
 =?utf-8?B?cDE4cTNTZDkxSXRVNUJEWm0vNVFaRW1hbVlHUGZLTjJSOTlZY0lwOS8xQktO?=
 =?utf-8?B?ZkFlcjF4NGtsL3BDSHk3OGVZbVdMdnR5UllURWVzQlpDOXVva3NLSDlGWEU0?=
 =?utf-8?B?UnNaSjJZYTBHbHhNZGtPb3hQb2VGUk5mYWsvVEkxUHJLbHNwMklnbzdYZXor?=
 =?utf-8?B?OGthOUsxeWIzNVlveHl2U3gxMytBVUp3L2tPNUlrWG1raTlmemRmREc2blRr?=
 =?utf-8?B?NjM5NlcwK3pCNGRBUGdSb3k1V3VCc2pQY2srRHBGYlhPa2I3RWk0Ylo1VGEy?=
 =?utf-8?B?ZWRsUFg1L1o2Y3o0d1BOUElGWFBmd3VQMzZibzhRMGZnZ0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(4022899009)(36860700013)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 13:51:14.8996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57a9094-b7b0-4d75-0539-08dd0fb3b9f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 13:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207991

SGkgSmFtaW4sDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoZXMuDQoNCkhvd2V2ZXIsIEnigJltIGdl
dHRpbmcgbW9yZSBjb252aW5jZWQgdGhhdCBhcyBvdXIgRklUIGdlbmVyYXRpb24gaXMgc3ByZWFk
IGJldHdlZW4gdWJvb3Qtc2lnbiBhbmQga2VybmVsLWZpdGltYWdlLCBtYXliZSB3ZSBzaG91bGQg
anVzdCBjcmVhdGUgYSBuZXcgY2xhc3MgdGhhdCBpcyBkZWRpY2F0ZWQgdG8gY3JlYXRpbmcgYSBG
SVQgaW1hZ2UgZnJvbSBhcmJpdHJhcnkgaW5wdXRzLCBzbyBpbiB0aGlzIGNhc2UgeW914oCZZCBo
YXZlIGRlcGVuZGVuY2llcyBvbiB0Zi1hL3Vib290L2tlcm5lbCBhbmQgd3JpdGUgYSBkdHMgdGhh
dCBkZXNjcmliZXMgdGhlIGxheW91dC4gIEnigJltIHVuY29udmluY2VkIHRoYXQgdGhlIGNvbXBs
ZXhpdHkgb2YgdGhlc2UgY2xhc3NlcyBpcyBzdXN0YWluYWJsZSBhbmQgYSB0cnVseSBnZW5lcmlj
IGNsYXNzIG1pZ2h0IGJlIGEgbW9yZSBtYWludGFpbmFibGUgYWx0ZXJuYXRpdmUuDQoNCldoYXTi
gJlzIHlvdXIgb3BpbmlvbiBvbiB0aGlzPyAgVGhlIGZhY3QgdGhhdCB5b3UgaGFkIHRvIGFkZCBj
dXN0b20gaG9va3MgaW4gMi8zIHNlZW1zIHRvIGluZGljYXRlIHRoYXQgYSBtb3JlIGluaGVyZW50
bHkgZmxleGlibGUgY2xhc3Mgd291bGQgYmUgdGhlIHJpZ2h0IGFwcHJvYWNoLg0KDQpDaGVlcnMs
DQpSb3NzDQoNCg0KPiBPbiAxOCBOb3YgMjAyNCwgYXQgMDY6MzIsIEphbWluIExpbiB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8amFtaW5fbGluPWFzcGVlZHRlY2guY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gdjA6DQo+ICAxLiBhZGQgdmFyaWFibGUgdG8gc2V0
IGxvYWQgYWRkcmVzcyBhbmQgZW50cnlwb2ludC4NCj4gIDIuIEZpeCB0byBpbnN0YWxsIG5vbmV4
aXN0ZW50IGR0YiBmaWxlLg0KPiAgMy4gc3VwcG9ydCB0byB2ZXJpZnkgc2lnbmVkIEZJVA0KPiAg
NC4gc3VwcG9ydCB0byBsb2FkIG9wdGVlLW9zIGFuZCBURkEgaW1hZ2VzDQo+IHYxOg0KPiAgRml4
IHBhdGNoIGZvciBjb2RlIHJldmlldw0KPiB2MjoNCj4gIGNyZWF0ZWQgYSBzZXJpZXMgcGF0Y2gN
Cj4gdjM6DQo+ICBhZGQgY292ZXIgbGV0dGVyDQo+IHY0Og0KPiAgQWRkIG9lLXNlbGYgdGVzdGNh
c2VzIGZvciByZXZpZXdlciBzdWdnZXN0aW9uDQo+ICBBZGQgZG9jdW1lbnRhdGlvbiBmb3IgcmV2
aWV3ZXIgc3VnZ2VzdGlvbi4NCj4gIExpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLnlvY3RvcHJvamVj
dC5vcmcvcHJvamVjdC9kb2NzL3BhdGNoLzIwMjQxMTE4MDYyMTEzLjI2OTI1My0xLWphbWluX2xp
bkBhc3BlZWR0ZWNoLmNvbS8NCj4gDQo+ICBUaGUgZm9sbG93aW5nIHBhdGNoZXMgaGFkIGJlZW4g
YXBwbGllZCBmcm9tIHYwIGNoYW5nZXMuDQo+ICBhLiBGaXggdG8gaW5zdGFsbCBub25leGlzdGVu
dCBkdGIgZmlsZQ0KPiAgYi4gc3VwcG9ydCB0byB2ZXJpZnkgc2lnbmVkIEZJVA0KPiAgYy4gYWRk
IHZhcmlhYmxlIHRvIHNldCBsb2FkIGFkZHJlc3MgYW5kIGVudHJ5cG9pbnQuDQo+IA0KPiBKYW1p
biBMaW4gKDMpOg0KPiAgdWJvb3Qtc2lnbjogc3VwcG9ydCB0byBjcmVhdGUgVEVFIGFuZCBBVEYg
aW1hZ2UgdHJlZSBzb3VyY2UNCj4gIHVib290LXNpZ246IHN1cHBvcnQgdG8gY3JlYXRlIHVzZXJz
IHNwZWNpZmljIGltYWdlIHRyZWUgc291cmNlDQo+ICBvZS1zZWxmdGVzdDogZml0aW1hZ2U6IGFk
ZCB0ZXN0Y2FzZXMgdG8gdGVzdCBBVEYgYW5kIFRFRQ0KPiANCj4gbWV0YS9jbGFzc2VzLXJlY2lw
ZS91Ym9vdC1zaWduLmJiY2xhc3MgICB8IDEwMCArKysrKysrLQ0KPiBtZXRhL2xpYi9vZXFhL3Nl
bGZ0ZXN0L2Nhc2VzL2ZpdGltYWdlLnB5IHwgMjg4ICsrKysrKysrKysrKysrKysrKysrKysrDQo+
IDIgZmlsZXMgY2hhbmdlZCwgMzg3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+
IC0tIA0KPiAyLjI1LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5r
czogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMyMDcyMDMpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIwNzIwMw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDk2NDAxMTgvNjg3NTg4OA0KPiBHcm91cCBP
d25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBV
bnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IA0KDQo=

