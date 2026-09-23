Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47EE1C98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:06:10 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7782.1790172359810114495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ojU/YEsn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ojU/YEsn;
 spf=pass (domain: arm.com, ip: 40.107.162.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RNVi6bf4ZZGvYrzbqfdbAFiUvgXblqRiFVTQLWuMsspriP0MYYyzGlR/VKiE9fxO8BMki6XtgXXvQskFJtN/U7tsE/DIZ02ixM7AMU8qOxeBbjZJuqe1QzOOIZFCcmMlHSNjrEL6lnu1iCp3Jfw+zIT24MQOzGTfJmqqUt//4LlPSGaBaYq1vBiCHRKHIKCEBODEG0mnESiWkegQzxwRmq65NJR78KeDvqbCDeeo4y8uYDPOdWPgacaVpGar4X2Cj9U8olZSrqtzc3scwjXo5TDeIhLTMzPCkOTBDrvB4fgHpw7Fr9b7c+WGInYrXdarhVm4vlyZWqLlP6NCbF8cfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBBiWfBqvbHv6LbCgf+tOiZeOZJ+/mOaKIQHtudyF4M=;
 b=kgL2G/DYWzxvLHaRhb2Q0U/pN7zPLJKHB5aHHKfXKdAz9COqO45BrOHp+5JkO6SybzG2deBG3h94+MBDKLUf82JV0MO4bhHlOP0ivxg2x47mfsCOtg94JEWQTEpvgahCbL6V1U3QPIozD99BN0X9CzZlt3Z7Vq3hSiJKxRMvwktKSXnx16ZPNVekEh1mArzEodOTiFAFiGX+MZHptqMcj/SOyKOF3yz6nY9XWclPOUyIhRx97+pEBp9W5Zg9Qg2ofJPgrHXVLFS1H4DKEexei1rt8CoV9kRmMmCoWp+VFF0u6CEfv6p164DDxipPYsFVF2Le+BwDSNPLyVyRoyUeTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBBiWfBqvbHv6LbCgf+tOiZeOZJ+/mOaKIQHtudyF4M=;
 b=ojU/YEsnB4KhNPIC+MszAjYcysILsgUbAcaWT3Y1da3YSRvqo0Xh36gZsg8TZTvCvW5+M6gBpaFd70zHAZdSgIqdRVmVd+5+a9OM8WwJHknsAGipEYbs4NBgn3uIK7CUbT709ovbwt3q5DNknLuXYrnxn13A1DlQ7qPMJKFGEE8=
Received: from AS9PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:48b::15)
 by AM0PR08MB5523.eurprd08.prod.outlook.com (2603:10a6:208:17f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:05:53 +0000
Received: from AM1PEPF000C1AD9.eurprd02.prod.outlook.com
 (2603:10a6:20b:48b:cafe::8) by AS9PR04CA0061.outlook.office365.com
 (2603:10a6:20b:48b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 14:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000C1AD9.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 14:05:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bVxhJ2nXvTiuo9Rs1TkEndTXJt+/Ay+t8eezk6uTPhcW98d6f4pCA6wQ76bMRutCZ5euOqQQng2QJSciJnpjJQLSbT0J6o40o2yADGjCUiDxBjRvAJcj6HFEvEq7n/A2fkoGw+Frf42W5f2p1Fs6yYypjgM0/aG5gOhQL+pTE7SVLkZWaI7DpKof7KBnuNWNBFdS11r3gKogwlqv9ZX0d1qh38zibJ8yDVlCwMBd7NebnsmzU1Mj7gyjviaGAvMPD7WhcNgc76V2a/8EnaLoP/GEsWsmVhG4e1//dV8i2c5hyDtVw0sS+y8WwI37jxFr8BCt5oc7Mhh6ARSiJ9cTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBBiWfBqvbHv6LbCgf+tOiZeOZJ+/mOaKIQHtudyF4M=;
 b=JgtRpIJx+AmTtC33K3zJG7ajyLyoM8WZ4PcZVUAzxzUmOT8RqgYruohsQYUJ3FUVJ4DKeyexvNKFPC2v7TaSC8GKa+c3cwNgL11qbpG4rzSnQZ2JC8Nm2OK5heU8uz1Ji2jNRlHgUg3qgGvS5hG6GgDTeYCIsoX9UCVUm6ktEApWaZ9IpacY5rmKtmyUFlT2eapyOQK/aTbH/GZFmbRqg/EJygJWNkK2mf2vLa32eeNOvrP0DUgMfLjrS2L+jQPd/fjLgpeUexAKCiLXeeSk+KnHudWntK09WoNMZ8h9dX00Y5xp9+i+7IgpKlr/2X3QO4cgVpnRoR8oN41cSa4dQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBBiWfBqvbHv6LbCgf+tOiZeOZJ+/mOaKIQHtudyF4M=;
 b=ojU/YEsnB4KhNPIC+MszAjYcysILsgUbAcaWT3Y1da3YSRvqo0Xh36gZsg8TZTvCvW5+M6gBpaFd70zHAZdSgIqdRVmVd+5+a9OM8WwJHknsAGipEYbs4NBgn3uIK7CUbT709ovbwt3q5DNknLuXYrnxn13A1DlQ7qPMJKFGEE8=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by VI1PR08MB10200.eurprd08.prod.outlook.com (2603:10a6:800:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 14:05:19 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 14:05:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Topic: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Index: AQHdRusDxfNkMYpjl0qVIzcjYKjp/bbcOz4A
Date: Wed, 23 Sep 2026 14:05:19 +0000
Message-ID: <E355EDBB-60D0-49E6-9F2A-3042130D2906@arm.com>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-2-jaipaul.cheernam@est.tech>
In-Reply-To: <20260917212435.93696-2-jaipaul.cheernam@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|VI1PR08MB10200:EE_|AM1PEPF000C1AD9:EE_|AM0PR08MB5523:EE_
X-MS-Office365-Filtering-Correlation-Id: 9262a3ab-c767-49b2-ff92-08df197bc7e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|18002099003|22082099003|11063799006|4143699003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 tYe/hxIU7WinnICFt4egXrLL6qMw8rFhk+SOG7kWVfFDK72Qdr8wpOmwJvpQQuzEeqUUbV1/sO8YHlvdfseuVJp4rghqhMvSFzuwS5bhYvTON/AHFNTbN03/cOVSgPoRvIMlZ56YVC4zmGe0vIShZ7mwI/64wqpvvlXHX+Ntwmh7YTy8xEYDcL8QJaxcRQl2GpMjNvsvZP9BxbkjARf94tV+zaP8LntN22cVYqqKsNmf9Hot3dpu4aXqeycGcsLI9KQ+jga2k2QDaIDjMaZz1eWKVkIwVef4iSSN6D9YkfJOCiH5rbEnwjS8xbyLaXU3HSn4DQite/yWHv1JzdWLKoD8tEMd6PBb0T4So0WKDTHH18xtE1es1mlHiBTtzT9FiY3OTKMxaQ3Ml1EpBzBhCDguNMpGZ4BKG88gOQQmdCuhvKgTkJF2KLN/tMrsBImqb/xJ9oxbHyaGBhiO3lDZGCQoa6bkKCZP9Fauyc5kzdeCbTqIF8StlZ7tdZl+Dpf4QXnZkYRKFYl550ZP6gsSFwrbrKkNmzOS7cslEnPyif8iZPhSZFHWEF1fHBGx+S6ESb3VlrXLssvDvOk3/NvhN6XXHXAx0WPQRYPrerlZ0L6pqm5v+M8LjZ7S2twQ3ftwNhsbiBVJTtsPjHgAeJOUHbO0KMBTrF4dFdT52qDEFBYiKj6Ev9PNPBoT9rYwe3DDZOZ3Vdi2XjCySogmB42GYpB4yfw6hVTFxbqqehfX0j8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5B3992BD2DC704A91E92500F8E756C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 qS7VifKii9DCl8WP2gJK8KEPsi2g9+9CfpLdpwDwdFtnvvcYn1Lwr7wc6KV0xocs7P/tjrjH9nZ+ajtnshhAhQ4JFH+nbAt1pzMAJVtJGrsv8Kaa88cL2DZ/WTVdoGlKoakde7PQuFXFKT4OVy9ZbVZ4xYDiczOrn7vsf9oPPk8koYqEwvLkHK1LyLgshC1kGQhUVDgjoamNIKkQL6kAWA2vWtOoFKbjxi3pxSSNdU2NTo1Q04sNekD1jZSP5lukUp9e3PmdT/5LdvEcC5/dEfVVGOWysxFWQ2+rSroRL/d3YrFyaZzySgC5K8kL9aoSQUCFAGpsC6kF9QCEPUW50Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10200
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000C1AD9.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	edf8ded3-9ded-4d0d-c85d-08df197bb364
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|35042699022|14060799003|82310400026|1800799024|23010399003|10067099003|11063799006|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jVkDnednLyrAuBoKuUrCqR29w0oJEEemrbBViw4S07OaSxiumikmrzMMRa4sL/2Hf0Gk/nEnRXfo4Z7dvHPlcRc6S/elWZ9RzBqlOAD9YMnBUyV7ORnQPpBZ2jkBBFiws+LI/o0JSGPuxm6nk9NQEFH3d2dup/3Sv/MIIFLxUO3jMC//mUA7CiRvxVYch1QnNGbJvfuQpVIRSO2+LZggsKoYukWasxaMwK4ITh7+MLglkYALHjO6+Uij+JWQdiOJsdutp2yEFoaklD/szW2vEQ5NnnlVh3E8hvfE01VrxpsXiMEXhtq5W1YKJ246RU1fPhK3WUhIbvLpR0Hta4tiJjiyZJ/fNgxy1hlxzTZsNRTZZhuSQ2gtDgL8crxTB6Zj8Kr69xI5p15P2JzewbgiO11QxojUoU3bnyFUmQB5uacmsfwbPrylSaUNr0WUIz/I7+EljdowzvUlMO/Dchg2KwWAJDSwfIRNK+wS+W9Y3nG4DagNe18gqSZHtSn2XtyhCDZirPj00FyKnK4Z0c0xh4Jz9ZCD+yS3qH9SHbEQRxJihxXOSuOHUUcWWKooxBtDG0WOFb9I0Eo8Qhd7xgoaO4JtrUm8KRRiCQmfUcC4MOST6LJ4zyw1cN9tnGb+q5SnlUWf59WVbwqE0SkW8umPSdZYD2TdS6kxF6bq1nR3+WjWIz2jiOuRoORGWH05vYlti/TYnKZS3AzKh0IWR7fQWg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(35042699022)(14060799003)(82310400026)(1800799024)(23010399003)(10067099003)(11063799006)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BdyG2eVGI/w1gyQEdhaxhnu3BVZDdHtZgUnpvD16StCU8QRvpStDPhxeKI0q+o/H6z+BndUteiTCLcZp7x1tFyM7sWSis02u2ERGqAjZPI1BwnOpIgBKnJeYsixLGXBOdxgtcrzt+h9wAkknS6isrdNHQAAGuUDR6uroiBG0p8EUF4OaB2ZOhlqolGHTxfCFk13RUhQN2OLbd0t1dprD+8CCXXcY7ljP3w2EF9xSKPecpBpe7znz8vOSnBiceujrLoX9rscwgkI2aq+OIo1q/KonmDCqMexaYGBAbhacaegM0VR4psWlwRqVA/kNhNyJfQIKDrsS8JQm0PeGp3bc/Es4JW41Cm908mvRPRrPXfWCcoXu46gBmmti+6fflqbrS4EyAohP1oscSwIx0tR0AYD97iLsagwVd2ybpoPE8Uots7Uipe2QX8oIyWEknNAt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:05:53.5158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9262a3ab-c767-49b2-ff92-08df197bc7e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000C1AD9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246520

T24gMTcgU2VwIDIwMjYsIGF0IDIyOjI0LCBKYWlwYXVsIENoZWVybmFtIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxqYWlwYXVsLmNoZWVybmFtPWVzdC50ZWNoQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBkZWYgZ25vbWVfdmVyZGlyKHYpOg0KPiAtICAgIHJldHVybiAiLiIu
am9pbih2LnNwbGl0KCIuIilbOi0xXSkgb3Igdg0KPiArICAgICMgR05PTUUgZGlycyB1c2UgdGhl
IGZpcnN0IHR3byB2ZXJzaW9uIGNvbXBvbmVudHMsIGUuZy4gMC4yMS44LjIgLT4gMC4yMQ0KPiAr
ICAgIHBhcnRzID0gdi5zcGxpdCgiLiIpDQo+ICsgICAgcmV0dXJuICIuIi5qb2luKHBhcnRzWzoy
XSBpZiBsZW4ocGFydHMpID49IDMgZWxzZSBwYXJ0c1s6LTFdKSBvciB2DQoNClRoZSBvcmlnaW5h
bCBsb2dpYyB3YXMgc2xpZ2h0bHkgb3ZlcmNvbXBsaWNhdGVkLCBhbmQgdGhpcyBzZWVtcyBldmVu
IG1vcmUgc28uDQoNCldoeSBpc27igJl0IHRoaXMgc3VmZmljaWVudD8NCg0KZGVmIGdub21lX3Zl
cmRpcih2KToNCiAgcmV0dXJuIOKAnC7igJ0uam9pbih2LnNwbGl0KOKAnC7igJ0pWzoyXSkNCg0K
DQo=

