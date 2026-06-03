Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58275CD6E69
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:49:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16282.1780480185580828813
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=g4VGllcg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=g4VGllcg;
 spf=pass (domain: arm.com, ip: 52.101.66.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dn5T1HiOhsfJdLP+eoDod1oaqK+EvXQhpOCARHTd86qF/y9LB8G4HTj1hn5p95zE8gu5HPy/mMmz1B747tMf/4xnlapYm7sj+mYFpPSlUHIcJbyGgtI0pXtvAwgKZoIOpccwx0Xc/P7sOyb55yyBBuo9GUmirHiCZ15K7wfPNi5ndr8IvLY1DWFKvZVusc9Sq747H+jYwYGBYx7TwW9nbged73rlC1GkddSwyugbwDWgLVBLOWxQUP2PeYBHVlR8iN7neBCFd4w7c8ApBX52r5GmXC9AYk3oLShEByBjtxxYtWRBAmnBddeUNc+fJsBP+fmEiulTgSaE4ygpbZ8L5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZrxzey/qib6xlDgs9oPSbibMNKuWIWLrZZHjzLEg0g=;
 b=mJiTBHhhICrWVzlfjZQjZ+5Z7C8/NwMbijlB4AtB1S3HqwIKQ2lhkVa10pee7hvIoNvRWYE+uvWFFH2h8SfSeRVLrtbP/+GQ7lASZnH61sAy0637g8kAuQGFzhDFqnRrvekeIXHqjhvjEEvPbUWvRqGvlg0ucnLWcIU5SlFqhInsqMjHYOA6coMceZxTf9YNjHUPu+Ab+Dl+YH6BBBaKkcy/lpxPrztgeh70pVwrGnPFYPvqNmMY1jv++rJ+YvtAg6zga5h281m8j+Jgq0Xb/X7eisjEE3Jrhm09kYbGt1SxPh2X+LDxcQFgSKtdowfFnZIqv032moEclzm8rVPq+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZrxzey/qib6xlDgs9oPSbibMNKuWIWLrZZHjzLEg0g=;
 b=g4VGllcgeVwpXioENKoqHWJO+hh7T6k0qPCiyJh18Dm/tS5aHvNyPpoyl4oPFMgEUhI9dxfJI6V6P1d0/80ZUjyEqYTDEXqpNFoYdzPoXduA81EQ8n+/M5GRzkkToyUCQ6WW5o55yf3tzuFHcAkbE3lYY5i/AedpAu1EldTQcWs=
Received: from AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::25)
 by AS1PR08MB7514.eurprd08.prod.outlook.com (2603:10a6:20b:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:49:37 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::a) by AM0PR10CA0015.outlook.office365.com
 (2603:10a6:208:17c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 09:49:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Wed, 3 Jun 2026 09:49:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwmUO9Qf1HdhwqTcaOigOYcTrwBLRNv7Xp375TySxounM5DRPCUvw38fI/F1/HdrFykkLogLy+CnbwB0bpjpjr/+rMm9OHLo6WFZuQy2y0MeesLHMc45kJWR/YmE/RjVySOoSMeC1Hh3Zj2uCexd/byWXlOb2jFRMCu2+ygfqJNqzKEUkcffpcuzsphYhgBgcGwimp7+XdFFlMbyhhJm9ZO/KAq4iRkuiGsobo1Y2+MSS46WNH8D8xdyosOcBuKhEypND8onFUy0jQ5xDXrIiQJyQtQjV4RfEa4zft+1ApJ2Xn8uNka3Bv9GjNvpMxu9wN/Y0b7WDQFEZ60D/XQMbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZrxzey/qib6xlDgs9oPSbibMNKuWIWLrZZHjzLEg0g=;
 b=xRpOrWNkEk7QL5n4CE7PDOfydNG7FZiyc86MAs9K86dXeZcqtnOr8gOt/NXAtb5TQqn65luCFeFo0/ci85Usz2N60+rGruFgpl2ZWXEqdhzWrd9NBpYNSx+3ZbtiVvj/jvrn0A5+ANvTtMN7sVQmszwNOfavv2SxT1ezpUSMwSHrmEAJ+ns4c+9eGLvKazWaLScmfkiSlSNsFLKTAFjAAbt/gtWyM7RelyD6pXIifzeDC5wnWxZSvyvn3gBVpf8wmVAEOkHtUMw6tDf+rloVH4MsL7ukJlM+VhzqHl+BIWjEwAQlCjVXOQDuunWtxCadT1xCyaddWoEwX4mbjtHe1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZrxzey/qib6xlDgs9oPSbibMNKuWIWLrZZHjzLEg0g=;
 b=g4VGllcgeVwpXioENKoqHWJO+hh7T6k0qPCiyJh18Dm/tS5aHvNyPpoyl4oPFMgEUhI9dxfJI6V6P1d0/80ZUjyEqYTDEXqpNFoYdzPoXduA81EQ8n+/M5GRzkkToyUCQ6WW5o55yf3tzuFHcAkbE3lYY5i/AedpAu1EldTQcWs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PR3PR08MB5644.eurprd08.prod.outlook.com (2603:10a6:102:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:48:34 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:48:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Patches and discussions about the oe-core
 layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Topic: [OE-core] [RFC PATCH] avahi: upgrade 0.8 -> 0.9-rc4
Thread-Index: AQHc46bnpDeMaUADskCpkasHyeafyrYNtmIAgAAA1YCAHfAKgIABDasA
Date: Wed, 3 Jun 2026 09:48:34 +0000
Message-ID: <77901880-9008-468E-9FD3-07408FFA9310@arm.com>
References: <20260514133748.219486-1-ross.burton@arm.com>
 <CAMKF1soV8G-LLutq=9Ba-pkz=XyEJ=5812eQnaYOP834pvBNDg@mail.gmail.com>
 <8FD4DA19-AA50-430F-9B77-0B79D6E70F26@arm.com>
 <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_2Ky4KYra153oe85KSArHOe5Uawi4aK=SZe+-c5zvuaA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PR3PR08MB5644:EE_|AMS0EPF000001B3:EE_|AS1PR08MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3ef49f-6f88-43fa-c6d5-08dec1556cac
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|11063799006|22082099003|18002099003|56012099006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 3ZCTwMyLsYRx+hWIQF4BOMuduRjHjmPEPYtZF33cvus6shzN0wABtDFcqzBXe0262Dv2gmT96jA5pWeAx3YhawKpYw80gCG98wEOSmB8ca+9LpYrgj+gjKyMB7lF+i28IL2zLul75bpNVZdIE4j9+TGxeOk6IuvEeC64mEQBtLzxVapPR64kYfkMDlC54+mhZ5XIEEk6cZFqVaHi827TuPArLoG2/dZO7ITKa4bTWhpllNySqBXpWm9FgqkodwefflCPFrWXbTCTy1RFCxESMhS87IL6TyztKm+H3jPKtC5+SkU0vW7UyXsLXQZrrC/6cWAMzeBZTUKvfnaJvRXFzJOQ2SIA/zUgyNX9bM3UjYTE2n3fI93knEA6VfboC9QiYQGMp5bG1wdQh+VodFqK2wBTGn/eZvtNKx1aXFuCs1Sjl9LeMpxaLfcLZ+3l1yos8UrTCjmEZhbO7paz5ufJXEc8YvtDRKsEwjF8rZy7hObpb0gfGy73ElvklfRHj+itlulnMoZ2QKkxjw8Dzoe0ju9b798s8YPloZwhQ4BvF9wGFvUN2waHRZWg05+NfAz3LtiFRNVf1zYC4btGECx8HrB5ZCLTs+Lh9ZCbmyQ3YXqHM+bBS0unZ6kAKXG5fVHduQvGnkdsfR4Eh0VXNIVttd0tGM5x4MV8kp+rzxcXsi+jYh3WE3ALbqGYa5se6H8ZN3+w62TPs6adfOWjlA+ZJSUymoQTHA0hKw5MS2Gq5e1tOCeclGzWHdLKo1vHWNuJ
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99EABCD434F9B541918664BBFD28FDF9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 F3+5VyZqlIgdGwja2C1Z1UOQMnoUJtIuQ5cyb8F3mL6k83fpflo7K0C91zghyyGVRbxioqUXP9VNVrkvDTNnV+JDFJjF8oPukbwIgSXa+eFSMGsaaO8c3mJXUSb0440tGwqwSpeaf5Z8g382FJSg7BijvWUl5Fwx0j0Uxa0qX87wxIWkrVYrydqGw+ijx52Hlcs8pn0HFm5+VOQra624Gg7V3f2syVAfH4X0WM4+qbOcWMIDSGJjrHERGKCe93dTOEThjeViKNDZCi9u+8wG28n2e0XZgYVVVXBf2ACZ031kbymJA1Nz+/Ev9TN42eaShaiLI1Gh+7HgdxbUzdXS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5644
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a9b25fa9-ae6d-4ff6-8e22-08dec1554745
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|30052699003|36860700016|14060799003|82310400026|1800799024|35042699022|13003099007|22082099003|18002099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Va74oifPoRCLcdNrwfXHRC8bHdAzdTEOBd35gl8ZkNVEpPFvES5DSKT2J51Ma+QQbMTQJL3YrETeB+M23om/gom2ICY+QKxSfCz1OLBItYSyjMNuZsz0VF3cDF17a2SyfB7NgttA0Wpw5W0QLFW7GgNo66Dc4M1b+CQVn3aetTKxQB+WBq5jCNTEdAoZiuS75IRy2Q9BrqQ4W8vLHuhXciXbydYZcZviq51b7A+l1hc1OZWer30GD1Yq1ZFxg4FjtJokZSpkkHZanXO2WVbrhGkRJOs3y4NYEUem862QmcRFJmkBsRkvaKM4oAKMb1+mpxTVHQMBe0CyfU7hpp0yrqRHFT3geDSlwXYtlma55P1pSzvOTxhpHlXfhG6B/rUy4JkmoSkR8joS2kWHj4t+j98kGvDtMnVAUDjZ2l7HWWKV++PWmajxJFj3EwAZnIqBMu7eybvhEIuuTik9KRN/wvzY1jzEl3IplWyr2hYydm1/dhGx43P3QUG9MKapFXQ6kKxfsJ+XTIuK9kHOXLiadq9KjeDr8CXh57feQaP4ZBZRbxgin8NXx4ThtY31SYoXExhTwMTKRzL95wvK+ZbEuRu3I49J+UEkOejcOgCrn0mhMY3Z5AKVTDbqPQCogxLbfP1b2GFjoEM1/AWHvxbBD4wY/lMjP3JS3vHwrvI+56HT43mcR3+xSBAsokKflKYw2SIal0TnFbOUelDF+OmVOwzdcrZEqr7a9kigON7DW7I=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(30052699003)(36860700016)(14060799003)(82310400026)(1800799024)(35042699022)(13003099007)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	31eXd6pS6xIrPX6L0QKFHwumhYQyKAM+EuSoQVJcgp+u/6m4iUp/CpVRpOVR5B0m2d8G4kq619t1ZxTuMHh6psuB0DSwRgf5p2otm/R5jMqDUui6A86a+sLMDgUVSpb6PM7FnaMDqjeqGTs6tm8Z9gqfdU5lfhDLG5ws4zr2f5pB2UG+t/yd8nUe5usMBdiysGAlfZFUhO1KIsfYioU53hIHp9LU6Nx14W3VFspZ2bQIuDiJlYHgSQ/KdjBK18HhMXFB5TKY/ZdZjGf4z6mONROO2/RP5vywVVyMZQvNM3JfY8qiS1VizOuUOI7BkcB6BxufNtZaRfFir3b7p/2YeEnCei9GU48jXMm8VL0pFaAHgLG4ZyEJGFYbJr0bg922ViPUldRPSdv9FH9fkQEG+Q+WfbmjMZqxvBb7EPrnPQjbY5AEQYRh/c8lIlu7bPXY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 09:49:37.1922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3ef49f-6f88-43fa-c6d5-08dec1556cac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238090

T24gMiBKdW4gMjAyNiwgYXQgMTg6NDMsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMTQgTWF5IDIwMjYgYXQgMTg6MzMsIFJv
c3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxyb3NzLmJ1cnRvbj1hcm0u
Y29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4+IEhvdyBjb25maWRlbnQgYXJl
IHdlIHdpdGggdGhlIHJlbGVhc2UgaGFwcGVuaW5nIG9uIHRpbWUgYmVmb3JlIHdlIHJlbGVhc2Ug
aW4gbmV4dCA1IG1vbnRocyB0aW1lDQo+PiANCj4+IFRoZXJl4oCZcyBhIGxvdCBvZiBkaXN0cm9z
IGxlYW5pbmcgb24gdGhpcyB0byBoYXBwZW4gYnV0IGluZGVlZCBpdOKAmXMgYSBsb25nIHRpbWUg
Y29taW5n4oCmDQo+IA0KPiAqcmFudCoNCj4gDQo+IEkgd2lzaCB1cHN0cmVhbSBkZXZlbG9wZXJz
LCBhbmQgSSBkb24ndCBqdXN0IG1lYW4gYXZhaGksIHdvdWxkDQo+IHJlbWVtYmVyIHRoYXQgJ3Jj
JyBzdGFuZHMgZm9yICdyZWxlYXNlIGNhbmRpZGF0ZScuIEFuZCAncmVsZWFzZQ0KPiBjYW5kaWRh
dGUnIG1lYW5zIGEgY2FuZGlkYXRlIGZvciByZWxlYXNlLCBhIHNvdXJjZSBzbmFwc2hvdCB0aGF0
IGlzDQo+IGRlZW1lZCByZWFkeSwgYW5kIGJlY29tZXMgdGhlIGFjdHVhbCByZWxlYXNlLCB1bmxl
c3MgYW55IGVtYmFycmFzc2luZw0KPiBsYXN0IG1pbnV0ZSBpc3N1ZXMgYXJlIHJlcG9ydGVkIGlu
IGEgbGltaXRlZCB0aW1lZnJhbWUgKGUuZy4gZGF5cykuDQo+IA0KPiBXaGF0IGlzIGF2YWhpJ3Mg
dHJhY2sgcmVjb3JkIHdpdGggdGhvc2UgJ3JjJyB0YWdzPw0KPiANCj4gaHR0cHM6Ly9naXRodWIu
Y29tL2F2YWhpL2F2YWhpL3RhZ3MNCj4gDQo+ICplbmQgcmFudCoNCj4gDQo+IFRoYXQgc2FpZCwg
d2UgcHJvYmFibHkgc2hvdWxkIGp1c3QgdGFrZSBpdCwgYXMgbG9uZyBhcyBQViBvZiB0aGUNCj4g
YWN0dWFsIDAuOSB3b3VsZCBzb3J0IGhpZ2hlciB0aGFuIHRoaXMgcmMuDQoNCkFncmVlZCwgc2Vl
IGh0dHBzOi8vZ2l0aHViLmNvbS9hdmFoaS9hdmFoaS9pc3N1ZXMvNTAzLg0KDQpJIGV4cGxpY2l0
bHkgc2V0IHRoZSBQViB0byAiMC45fnJjNOKAnSBzbyB0aGF0IGl0IHNvcnRzICpiZWZvcmUqIDAu
OS4NCg0KUm9zcw==

