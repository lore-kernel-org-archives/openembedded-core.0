Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D72EC56208
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 13:08:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18878.1786021717341444436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 06:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GE+qhEyM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GE+qhEyM;
 spf=pass (domain: arm.com, ip: 52.101.65.0, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CeBIqJsZQbiQ2TY1rBR3aGzJlnmFMXQMddJHk40m476dZfVymMt2BF97BPecVOXgM7+MKOTuB/MFRGoI7mXyY8jvK5Ft3M0vJPK90PBIUyHc9NlVmWG2/UedIBRE5VmqCHDdhkfH7MDaVM8SMLHQHpIpIiRYFc8GIQf7rS7cnySWxmw3ag/ezEiuq/jq/734Ucd5ma8flv0YrWJjhkjwqEo0YNx7kw7fSbp9ZxLUmBp2HWIheno3O7QyJEWam9OTQ6RdnFJyQKtyk88JRLmDbp+BZEC59LaLmjeMw+BPo0OsA+0fUtn/rBLaIhyvbf2p3upTps0VxZ/YNSDfn64Mkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR8pzqGyn7KX9EG1d1Ixl/pVxbd//uU7Gnb6SJOK5FY=;
 b=NiFJnUIRhNl85/rz5owfGHpvEUQlVMUMhwBSuiH7yFIkb+eDs00v3+vTOvdQXleU2CuH8Re+k/9RSLrAQ5tBtix4JvtDTm8s0PLyfD0epX+YcLPmvMTnJTTh2oueQ5qcuNP8zi3llByDQ8I5cwJY9uUb0yGp22TCt2Xa+keqKL8bA04oT0C3Rc/u5CI3ZizYWZIy3G+lMK9DcS1DQL0BnxV6xzO7GZC1oH1koS1qJSgIAv+YiyZnHVqfOYpQ2PzSEx8AAj6gTP4py6wLEOvSY156NJ2DUOdmPM1u5/P5NbBB5qeOmW7t102fvS0So6JAG9zZA7iVmyUTgXyJCPV8MA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR8pzqGyn7KX9EG1d1Ixl/pVxbd//uU7Gnb6SJOK5FY=;
 b=GE+qhEyMvQrdFLKWMBjAhsMcZe490t+RQp2qT6XGD7M3ED6sEknAbEEOe0HnvcnBOxy50t0+VOc7gHHR1tbjtSfImM+oc1XTWbDhC52B4nhJCpJVBAsaWOxohghgCm2wtYIwnlPhJuKmBI/T+ImWfmFgIgBCkeNmzoexWD/ylNc=
Received: from DU7P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::14)
 by AS8PR08MB9017.eurprd08.prod.outlook.com (2603:10a6:20b:5b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 13:08:30 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::6c) by DU7P191CA0023.outlook.office365.com
 (2603:10a6:10:54e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 13:08:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.8
 via Frontend Transport; Thu, 6 Aug 2026 13:08:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQMvHKREYzhYS+4gOESf7CgLZY7AtaA+PPKd+vdvpJI9psU4Siz4cTKeiHWpI4zSa1eJoMx25ibuNdm+ZqOIfxL+Rm5QifY0y2R5/16lMBux0b7LSbikIqJ1XiGkBReaC/kzzwEt2UZLeD5d774P4GQSBgVI4gucoWtRSM0/9ESp5JcHJSRGxFrjgxN+/W3Y8Z27mgmAGY8OK2Ex6HvLJT8sN5WDvkxTZh2FMiOPM8QOzMLySUb5xWrewIdjfg6rvldI2wpMdwrCeXpXplkcctPafLgQWa9rvvkcThjcpf0rRegKgfDOrowEFN7xiJUhyluflegXhGOxTjpKkzEhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xR8pzqGyn7KX9EG1d1Ixl/pVxbd//uU7Gnb6SJOK5FY=;
 b=NlWz7jgfenp66tob5kDmv64pxiwPQ4hCBIfcHbyKjBxGkODGtLE8bPVT9Pq42PEuAfJfYcErbgcFWlglUrV2ZDN7TaWDQDduXizY4cjkSS3U63XwcQYZUQfA/YgN68BpobVBG8Hf0k1Nk2zuRRa8T9+Fdm1WXSlZRkaaeZ7duaW3D0DJKs+mdluMhuGxYh8f1dMzNS17q6yfVWHnDsE0l+lLqd0sBltZYLGZaDp/TA5lVID0koubh/8AmnxkaRrL3KXuH6zccA8X8WKJ5C4O2opHbbAQ1sw5kMu5XJ27j0WWksIgoUdox/dTnDXa37wKeIzOmrrg9m1Ozck9MQTY5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xR8pzqGyn7KX9EG1d1Ixl/pVxbd//uU7Gnb6SJOK5FY=;
 b=GE+qhEyMvQrdFLKWMBjAhsMcZe490t+RQp2qT6XGD7M3ED6sEknAbEEOe0HnvcnBOxy50t0+VOc7gHHR1tbjtSfImM+oc1XTWbDhC52B4nhJCpJVBAsaWOxohghgCm2wtYIwnlPhJuKmBI/T+ImWfmFgIgBCkeNmzoexWD/ylNc=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PA4PR08MB7387.eurprd08.prod.outlook.com (2603:10a6:102:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 13:07:55 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 13:07:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: always use GCC to build
Thread-Topic: [OE-core] [PATCH] u-boot: always use GCC to build
Thread-Index: AQHdJAY9YWUmMEOGwk2HP1Lpwnr8HraQsOIAgABQNAA=
Date: Thu, 6 Aug 2026 13:07:55 +0000
Message-ID: <82E3C14F-1B0A-4315-AFA0-08593B3EC738@arm.com>
References: <20260804114134.4028175-1-ross.burton@arm.com>
 <37264213-bd7e-4e4d-b584-3468cd946865@cherry.de>
In-Reply-To: <37264213-bd7e-4e4d-b584-3468cd946865@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PA4PR08MB7387:EE_|DB1PEPF000509FA:EE_|AS8PR08MB9017:EE_
X-MS-Office365-Filtering-Correlation-Id: 882a49b5-efae-424a-c73b-08def3bbcff3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|4143699003|11063799006|38070700021|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 8B1h+54NYXgTqpaFVtu4tr++xVzoNcjb4Hd7XhFrntN/AOe4V4ZaLw+13cG3m9/5HHyw/7SBFlfoaWKeMq6mqJWvHdClHbMWXFVgif2s+7r7Dhilx8AYhVyqvtnld62tWQvdMZyb3IxDjjbi/aZxrC5vzAOWZSjzOZ5kN6cPsY/6+2Gj4YOR9ECJlmfu/ZbrkE4Rj642sZnyjW6r8pd46M9EkK9b8kUxrEla3WOIUWRpsTjxyh225XtoMxVT+aBiUnkP+ZxVNl0WjpLYcXQPkZnQ43kMduPSEnEaMuLa3s9bD7UjaOaPxfOPB1bG7B7HqE/5ncKr3n9mAQ/wK/Y5qtmmV4izoRSqPIL87cdsfmtH/XcjQyXNVzLL3PTFtakM9hcAkagBkavHYZmMH9+jSzaxexlKd74aZZff4xLRTcLDt3fFP1L/v7KFxGtSrM0/Ld73w6vNcK7RHMab/2Ea3IJO640nLrbfqfBskwnLM63LxONb0UEZHZBRmfMkiDyxTG75emTu/RPnnVrM74B3lg6Sco6NNSRNQX5JlMxgccpKxxu1LJGiGolRIMb9le/X25I3b/982QMi8+xq2vaPUGuNpTaGi6Q9Wah3glL5BDdrIlggRE4tDB2JTPII4+LwwCwqVU8hc/gSwykAzKfNf8fOAjvxYmjGIdxWpuJaUwZiY0g/EZa1Fn0f4T+DJpI1uaGMUVhz+UCxVRLbH+TVupNLgCb2PCP5gZIElfCD/1g=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(38070700021)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CC3A19D5D993F4B80C35FE1758E2CD2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 NOb6wFW4jYOxaOXNGjCCInTYP6Ndv3fkyELoNq3SHbrSerxwBvPywmM+PN2QkiH64VrrV5hKbvMRt9D5S3KqCq56Ou4T4uJRirUK5uzLGK1r7j5PcrmzH5PDMQOtZQIhM6RaDdd751y4GdKMHGwcH39xjaCfQlu30yv4ujkjCeEKCwd1H0nQQySKSvlGBdknOlQOKSTHGJQjvjpZd7l+XPqSJr97PKDv5AdUQby9Ok0S9FMwSMWICmBgS4kaUB4Dnhzj88ebGz7w6AmbzxDiGXjeMYpdAV0f7YBmgqRikbAuoondLh9CwQyKgmrnbK24pSxozGKKmMuNYqiB38OyBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7387
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c48c470f-e97e-4006-b520-08def3bbbabe
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|82310400026|23010399003|36860700016|35042699022|376014|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	aoWEhpStDGgANKo0xa2RYKyNrk3gNt7s2617BjPLAiwsvQYVdS2Psf1qiE63Vr6HEpKuXGxcXzWEl1dAyL34nY/76e0CcIS3lDbRP3ZmppTpM6S2COdXLAvtd+C3nTbLfZ2dChtmTE2z4GHMAjLY4seG/9bvefvY3Rp900EsMgwAkxcnSv6fPQsDMtpk33eB1RgbR5qZEXqjMubL+mlsOxMlknzfEPg79MhUyzYbZjMoJ5CPwoYm7Fl3Q66yzBe84DVGo/UgVU8/vqq7BeCLaewqf4WOyzwcuHdZRHUBXjzi7ERk4yjvXlF+2l0yHiTofxf+cIBaUM1oFIlmh3KS7K0Wd0xMCfa6CKVx40LhJs+T6fGMpIMxncvVsjscFkmimMS4Fv7kMEngJTdBzpKyiGyLIU10Tx/483ID3OOf5FAQcAzm7E2mibL4NvoyjgJwL9Y29qN2JjzIl60CFdtCw3Z4cz7XUbw54+ZMGujZNWOQaVFAHgrGyJM6koLPBZ2pFhIy/Z/9la/tQICJ5ToNX+d93/GiLQx4i7u96YMGLApbU1SgmRT4wkAcFmMeSlCKJnue9G22WQFV02jZyJkIVVNNtPUwqGZBCTkG4tschNfo52sc8GfoVl7t3XozGOhUAB/d3HKKn1mcaznBxGmAA6zEN744lV4iqtjsoBuna+izs65MrQsYwTPzYfyqfXNIT9y4KXcdlYT6jhWMrV98QQ==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(23010399003)(36860700016)(35042699022)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BJ4WmqvcKw92/tTALm4dEzsvjihO9vlq9f2c3SIK80uaCstfDKf0cdjMXnYEWE+VnohzCilhl0XBnuUKOLWaDERRrwDSLIkvnYNSXfPQ/sJuN54A0ZuSAaWR4bjNCpAVhmAFNInaiMrym9PLLc5Ophm+4sYbpNtsaPm02G8n6/y/ZOES/RU2fWTSR0IY3TrjWC7dBxa8eiHjQ9921u3VgYX5Yloy6CIY6HUzv9iXp1TwD8tiS+dBLbw/MQ8scHIaGbUQwicwA/+QAhTcz22eqz6udNHnV/qgY6AnRf3JqRC7sutEEOOD1DHw+dYmjr4LXrJiai8yBe0MEpIv4DP5VajBtRxWNhznlrMkT3x2wXCF3Jj03u/Q6CSVuiX3Ub9DLfb5jlgLnJe/bjHNttLnjSo8M6Rofu1KHqUhSU3sUfFeIUqEMITj56G0D195qyRY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 13:08:30.6004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 882a49b5-efae-424a-c73b-08def3bbcff3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 13:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242943

T24gNiBBdWcgMjAyNiwgYXQgMDk6MjAsIFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBj
aGVycnkuZGU+IHdyb3RlOg0KPiBZb3UgZG9uJ3Qgc2F5IHdoYXQgaXMgdGhlIGlzc3VlIHdlIGVu
Y291bnRlciB3aGVuIGJ1aWxkaW5nIHRoaXMgcmVjaXBlIHdpdGggY2xhbmcgc28gdGhpcyBjYW4g
YmUgc3VtbWVkIHVwIHRvICJmaXggaXNzdWUiIHdoaWNoIGlzbid0IHBhcnRpY3VsYXJseSBoZWxw
ZnVsIDopIA0KDQpTb3JyeS4gIEF0IHRoZSB0aW1lIHRoZSBtZXNzYWdlIHdhcyBzZW50IHRoZSBm
YWlsdXJlIHdhcyDigJx0aGUgbWFrZWZpbGUgZXhwbGljaXRseSBjYWxscyBnY2MsIGJ1dCBjbGFu
ZyBpcyBpbiB0aGUgc3lzcm9vdOKAnS4NCg0KUm9zcw==

