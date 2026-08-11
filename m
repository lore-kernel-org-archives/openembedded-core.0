Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC56C5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 19:46:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62778.1786477574178329865
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 12:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hbHdtelE;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hbHdtelE;
 spf=pass (domain: arm.com, ip: 52.101.65.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N2869ut91/3cGEoKHRkEU6jb+PiuXtUFxPPLFxyI4gY3UWhenOkp85mwzyCmf6y5jB1nRAHi4ukoulOGMDHG1t3uc07wFshtRjSsSqB6bDze6338qGsuQ6hwB09i4lKw1T5DZfmGF+xH3xeCaAXurdy4iHvgAOtO/nzrJLu5bwoBPXt+pdrb4VH1n/GfpkWYAFX5APZuzHKzZna6oxarWuKTWHSHNpAdPUXUYmZILDrUlfsVP2g1USyLBloKPMJCD3OGmOe9x47SKrpg8V1F9o5u8C7TGTlPQ0aSfmdcqCszNJUDsoH9mnOjUN2AzjA/E3noKTsb+l1/MSw6XNbYrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7hLn6CBzVqBw2ivBhKdHJyWYdFKsdNuy2jW/2+1m/Y=;
 b=wEMU7Z31Z6j9pGsifLK/VWnd0U/HkSnDiOBQgzukn5/xuVJqZEUzGZT/fAV2SkWnC8vt9y9EHgWfwT9ti63MT1jZEc9TXDm2h/PmpB4f1+p744P3z5nMMB0RRh/8Hvu/YGUM3Gjag3DO3UsHi3XgBhPsqR0GuRdF9uPYj2M/5hpZgD/GFPaq1y3AXYcVeqzkjFCWVtWCvIDt0iBvNlCMgSx86I0KB8dd3EMGPe5M1RZjLzRmbGD3OYTBImBYCvGFv+C2hTmkAVMrJf67ovzskhiO5As1VJyYOzO2iuakOU7cLkfrfliEzX7nh2YlN+Ow8flS+NonIYoo/hJBcm/8Vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7hLn6CBzVqBw2ivBhKdHJyWYdFKsdNuy2jW/2+1m/Y=;
 b=hbHdtelEp44p2Ah2O7861ieStILkQV1tmp8YP9DfU6J8Z8yB4PE+RPsP2WOFKHJn+nTLlsbQ2SRgv35v49ANt1utHlPiKF0T95UMljXvz4m35KbPauk9ewI03zyB+gFWL+QRbdT3vxJwBWkzXENnXKiXuSYLQUH4dwrZEH14xb4=
Received: from AM0PR10CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::23)
 by DU4PR08MB10934.eurprd08.prod.outlook.com (2603:10a6:10:571::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 19:46:09 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::23) by AM0PR10CA0013.outlook.office365.com
 (2603:10a6:208:17c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Tue,
 11 Aug 2026 19:46:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 19:46:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVcsbQWt6+M8s8Nvr6mZ6PsdOjjZehADAk0+albw9So/w9qUeheSivX57XghKcTQJfvRqFOW2Aj+4IpHkaC42QaOIlMSEGJKDW0ktw3WOIlfQ1ZYieTE76twEHP4c4Qlcx3uxGOKGQjwz2zvulfY6XffePvn+vZ1ywkjiAcJ72O7GHQWuQFpyH4X42tLorziq9VATD5E02Y6rsDJ74j3M5+Tg2Yi4RYHghdBM/7pgFFU0E3+iXhlcFprkoqkLrHnovsVrvKRBzJyn5FlZSV5JX1iPOv4cuseRBpzpNOCQ8HVrEhLBRLB1UgEV3KWvMYnLxRgD5Eec9pVRd7zQpxJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7hLn6CBzVqBw2ivBhKdHJyWYdFKsdNuy2jW/2+1m/Y=;
 b=zMzQ/OQM2lxZ3gP/6jmaIol98gkpja6R6W25igf8cwylDAic0fX3o4huc4nWnLfMl1SURbJriqPCm6fXMUmP6C/xZatfOhzhcX1w8/sUTZpVEHGTSeO5Ge4Q6OuW8PcUK9zffs6KTMh5m+N6hF/kBWPPDZJLEbaGyhE04YFU4OU23DERUN6XZKXrzvSlnyo4c5/Cyl5ea6sBzcYmiVYlNHdRN/lk90BCQD5G4lmgeKHYxTwIJ1hEcibZoZ5VdySEjH10x/aKAssBzGDwlq18liRlYrmSWDSCjz9YJJOMJRGQt0eRUTbpxbzz2UR12OcAM54rxnyrjBEs37hkPjvR/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7hLn6CBzVqBw2ivBhKdHJyWYdFKsdNuy2jW/2+1m/Y=;
 b=hbHdtelEp44p2Ah2O7861ieStILkQV1tmp8YP9DfU6J8Z8yB4PE+RPsP2WOFKHJn+nTLlsbQ2SRgv35v49ANt1utHlPiKF0T95UMljXvz4m35KbPauk9ewI03zyB+gFWL+QRbdT3vxJwBWkzXENnXKiXuSYLQUH4dwrZEH14xb4=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by PAXPR08MB7526.eurprd08.prod.outlook.com (2603:10a6:102:24c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Tue, 11 Aug
 2026 19:45:35 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 19:45:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "twoerner@gmail.com"
	<twoerner@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gptfdisk: remove recipe
Thread-Topic: [OE-core] [PATCH 2/2] gptfdisk: remove recipe
Thread-Index: AQHdKac6AJsxSMXW7UG9hrYK6HlO6baZMLqAgAAP34A=
Date: Tue, 11 Aug 2026 19:45:35 +0000
Message-ID: <3C8CF150-0C4B-402C-8F8C-AB2CE27957DE@arm.com>
References: <20260811153619.2048639-1-ross.burton@arm.com>
 <20260811153619.2048639-2-ross.burton@arm.com>
 <DKMC7ZM6NDM7.3U64VA8LP2GYM@bootlin.com>
In-Reply-To: <DKMC7ZM6NDM7.3U64VA8LP2GYM@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|PAXPR08MB7526:EE_|AM3PEPF0000A790:EE_|DU4PR08MB10934:EE_
X-MS-Office365-Filtering-Correlation-Id: 89326b6f-3d9e-47ea-052c-08def7e13070
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 
 PwZg/9QKVvdXo79tGDlenbDTgoU6z9LlZXkMvaR/qy3rdEE/7rdj9kv5nuooS91hkQdXoPxgeGVQg1U/u2hmPoMZG2inPfP85awcv+cHbIUXokASDQ2SrpLHomcp0h/VdRrXKhz7cwLjTvk92lRLg4HsX+cPrj1Se9k5U6s6kKBtLli8h0uAxZuBHb6cRkg3HMtoVLeU9qI/Cu7Zq/Ha3D0npoTqZSAQ4Kx6KD+LMLfk9ns0xWhy6loqq7wEd1Rbait4OgdqZCiOg//xna5YLxamXCabpT3SrDoHTbn+DvT0xCFe9EFtcLmnOXvINg2W+a0Y0ataXhGNhFWuzcHgNJtJVPIUFKrdL4e7d0UznytzLCBfiUytitTL61Wnuqtd8i0XFvTD1L17fs31I+XlpjrTQQy32QvIwwgrP2k+1vtVVfaSzGHIDX8Q3BhCKqwROalbT5kIQPeov0QHnsWpBgDJi30u86V9FZcZj5x8j2tWGRIdtfDeMJeRQeHrkjA3ICvZL9zIhuCY/d68NaxbQU1fq1Pl2tdYGWnlde1XDglMrhLx0Gi/OlNKbPisrv3dCV7i2zrIP+IdPSP3k9ENRrd3pLjOd4I6452PZQyrL+2c7/NTmJFM664iCBjx5HQ/xx2h0EwGsTYg7QEbVyhc/gM9Yv4O6Bl4QGfZ3WsETdjmgLULfqsP6KkQ8Tf5hMeMvviQKx2DqdwuB0yX84ieDwixr+oKowOqzPP1Un5SIAo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2D10F3C5A411742866ED90163CD28DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 H+evUNHJRTPlER7XDW3zO0ZAteLqb3G5uU5k85/4W/JrC12KRBLMwPqGpMFL1YsEhkTtLGyUABZ9luZkH7y5bHArg7dDTQxLb5IRBM61cwCDwnpxn4MhHQRxvxy3uJIvAqRrCAdLQxeZWjwjwMugYymItP8fQqJU5wFTVG+/KMPF1c8zIddbqPukHm1nEeGzlfUWwmkEbKvW6DT5+i/JzLS/2gULWV9hpHxMZ3sC8xwIhXtz+j8tyJLXxWmGRECdoX4d1nJ+fOaAnDdKa5/GYT3RQaiqXWevbtRiG/Qc1U8V18ZJRgzBf/iXPB+4n5wwBFsrcBhiIV8mYGo7ZX+QbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7526
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a656a49-4a9c-4e94-f92a-08def7e11cd1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|35042699022|14060799003|376014|23010399003|36860700016|56012099006|10067099003|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	LgUYnqgT8F1gAFtW6yZrCR10rzYJzvjZ+DmMDLqxJRkwDdRVwcsDd8MlwJL7nDimy6l4NrJd8EXS02iEjfMQatAdBe+vD8deUJHZLayLKk8lCSuQlw43jrNwGYKzvFWspxRA/Iqdb44aDsDtZj7BRG2mJ4VzzRRjfXh0bKCQd7DKJ1p8wAok/W10IoUHJQjbJYkWxFdlnZ1F6QMhbhTKbyb1HKKZYMN4UoALkpFuaPsnE1kRv4LU3krXWokP+7x7Lcdg2N5uuf94Aqi9tUfs8rDqRatsJkE8SaJl8k0frrFPObM8QP1vsMpMze2lpN0ovDV0s1REjRxaoSVXkfbFUqma9CWjW0Fg8U3w0CrbaaYElT1f+1GCZfp16o3lA/0pgi4Awo3Cm4ova1o937+iKMHbOEJk8ZEn2tgk0xZs4vAt4pU1rA8jg3sgzGDIJOZn5KaZCI+bdcCu63ze489tD06gdw8TGRB7cwTM66ma9R3LR91bG5I5iOs8qBNlpPJCpPiE12MUy/dldsc5h8FkT9G8Hxnb+G510lt7efWD8ovCy1fPuJ89z6nRXF6SNm+tatrUZbcdU6s1Huey2ZW4hGJUpNhCQ9HbOcmPXLBIYvJwzotG54ItkOibijYVyYKN1MCjnTe6xQE/k+qIUOhzTSQC5BDuj93KOL5T/2Gr7C1Spzqdk6JRJ4m5oG9bwPWIt5tT7v7lR9P0tW410Gc9Qw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(14060799003)(376014)(23010399003)(36860700016)(56012099006)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eNh/5KJcxuQk/dgdteX7nX8Db3WxFbKCboMn93BnXsD+P2U83Ms/KFl5vn93UVZWVOH3X7qNh/MGVJbJDyWpF2BCiKoJN8Du8Oz00xEFX4q7+eFqnKuKWI+nADHcmK0uBV4uJxTc2C2OIm5HVtAfVpZ8vP/NIhJDY0tphX5DdMlCrsdF23hEJAjCXyejOGME0yOs83PkygILg9CQGu6g+8V6xRZCaP8DlBJ+2ub2pY6NJWxzMA8VlmUBg4eZrwWLTUY52BeCaEuM/iULivvw3KVeiONxlDoHsxvr8nz/uKCn7IDJtUn0senBiNtTig46yuf1vj9TTWizFvj31Lur4AT9qY9jDflpP7p74RDVRHB7S6lGjGalzp6oQBH+LwSK4ekBaM7OaMtCEZdl0fH0B9mh2reqT7jcY5oS3ZSqeW4JVU9DTIzj3ZAJ7HeaXgSa
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 19:46:08.4666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89326b6f-3d9e-47ea-052c-08def7e13070
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10934
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 19:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243221

T24gMTEgQXVnIDIwMjYsIGF0IDE5OjQ4LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQgPG1hdGhpZXUu
ZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+PiBBcyBzdWNoLCByZW1vdmUgdGhl
IHJlY2lwZS4NCj4gDQo+IEFuZCBicmVhayB0aGUgYnVpbGQgOikNCj4gDQo+IExvb2tzIGxpa2Ug
d2UgZG8gaGF2ZSBhIGRlcGVuZGVuY3kgb24gZ3B0ZmRpc2stbmF0aXZlLiBNYXliZSB0aGlzIG1h
dGNoDQo+IGluIG1ldGEteW9jdG8/DQoNClNvcnJ5LCBJIGRpZG7igJl0IG5vdGljZSB0aGF0IG9u
ZSwgcGF0Y2gganVzdCBzZW50IHRvIHBva3lALg0KDQpSb3Nz

