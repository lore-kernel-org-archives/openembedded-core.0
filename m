Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44B7C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 09:12:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4983.1784538755680372562
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 02:12:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MvPfkpsl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MvPfkpsl;
 spf=pass (domain: arm.com, ip: 52.101.65.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MacLM5lTjRCmhaAzyYH1k4q9mBt1Juo6vRJB7HMAVUQ7oiE4VOLtZ0RZSHnkfPSUl6Ph8AC2tDPEJUzA8Q1u5B+JM2hVAeW4PBFXTADBQFzzyOysCsO93VGeXLn4I+fMUP6uwcj258/TNPqzi2Ykd21UEY0CjGwxQmivtFFq9CbP4bSVwcNsPjbSUzFuKdBRtg5kagiyytbuvtcDqB8qDD56pIsbnZcg5ZLG1QqrFn3hRZheqHsuZ6omUUPUr3Ry0KYtvxKmcWLps7hdi5ilEKvFAi40+e8lXYWoUiiIGjvvy+uwKl9qdffePBqluwCWW135EFZGQqb+VM8c4LCmbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of+iXyfWh5uHrMLVGF3shd1RTSIbo9OA/zKmqhaQvvE=;
 b=P1t+hTzo4ZVo/LRXgwrF+6JQyzXlNuKUwrZfaXsgSg4yaR6L1VpATPC9xjEcrxfy9lGAyYhbT2bV1zLPv62O/tQQR5oZAqpdi94OmFUiSX5tL7trYg3ctQp3MLiFi7fPzyXvQkjoI0cwEnivagaIXm2/CUXGTb15DZVzVgSjfP4NoHBIvHnEA2JmhpK6JSWFUPvN46BIln9JwC74h8sh25yCZslaQkmFxKg1CV2b3F95WwrxM9wTde55r/bRwWuSh/6h/xhm7kA0cbxbZP5npb4MtlXIzmf7d+V4EjUP9gw84hD2W18NRXro26diFUXBjEOaGVoh6JnEiPGq46Ei8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of+iXyfWh5uHrMLVGF3shd1RTSIbo9OA/zKmqhaQvvE=;
 b=MvPfkpslVeRcl3oY8LFllvVSdsm78b7hdUdhBmQviLVDetz3XeZ7TCMfWNsKqao2pKnNfsyYkYwKV9MtwLDo+MaJh9P25M/03lzKCPcp+MAyVNdU7wksa6jhXNQiFTCmNJXUn7GI8KhdNMJ+bPVutvhC49TQzYHnt7EJTq2sklo=
Received: from AM0PR10CA0054.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::34)
 by AS8PR08MB9647.eurprd08.prod.outlook.com (2603:10a6:20b:618::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 09:12:29 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::21) by AM0PR10CA0054.outlook.office365.com
 (2603:10a6:20b:150::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 09:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 09:12:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz2WDLw09fxAcCFvK7/fYS2wRrYLKi1KBSctETA9NgetmRVgFYL48uWrB5UCf/et5kU5D+czmluJG07oAqWEqn61WoYXIrym1EyHTKCqasJqJ5l3Q7M5Uv+6fGdeKvcOR+v2Hver9HGRa0hJRD0TKx3LhuXlROEFj3HO3GmlxbJECgfpx1vUYnXE4lpFSpMjBx8b+HPeL73xXF2+RRQFfojwkNqjxm92haWakFwG0iCN1RziOD3p0SaYeH7fM78y7cy+4l93GkTjvvhaGzQRhIknnWBlk8R3mGcr4PCxa6ByxFdJS8JbwLjWpe38o0kVOD112/RZuFYJRmNcgo8qBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of+iXyfWh5uHrMLVGF3shd1RTSIbo9OA/zKmqhaQvvE=;
 b=RdJU0O/WrIrzGBzvRDhziigqtplPc9vaC0Yf2dRqe1KUP8oOvMNvwyD1PxRDFboBtWlAkl4Em8Z3LOYc+Ff8vlzLsVGiRe0YHyy8vASkUTW3lplZwSOaeB6h31ndNc/mRFZQq3NnYuxJSmZDiz6U/Bm7JcvneZpn7L5z7y2BeOCBWJ2w/jlu9df1dcUV5NVN2tmbXk6W994D0dgmQeSW2Vk3S1Jq5hTcL6uoDw3FF0vuaagkCieigivDF8BpILBIeEK1BkgbPd2HNDraXQptes9JSJ3bOSiX1Lm69xYtJYdxMYQfrQUiJK8IEdOwToP6ePc6zV5qgYSaI0jGCeLK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Of+iXyfWh5uHrMLVGF3shd1RTSIbo9OA/zKmqhaQvvE=;
 b=MvPfkpslVeRcl3oY8LFllvVSdsm78b7hdUdhBmQviLVDetz3XeZ7TCMfWNsKqao2pKnNfsyYkYwKV9MtwLDo+MaJh9P25M/03lzKCPcp+MAyVNdU7wksa6jhXNQiFTCmNJXUn7GI8KhdNMJ+bPVutvhC49TQzYHnt7EJTq2sklo=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM0PR08MB5523.eurprd08.prod.outlook.com (2603:10a6:208:17f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:11:26 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 09:11:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
Thread-Topic: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
Thread-Index: AQHdFGMPMCtfiyLTQES42wMdHLbhorZzdrEAgAKv94A=
Date: Mon, 20 Jul 2026 09:11:25 +0000
Message-ID: <A4197DA1-6F0E-4267-BFAB-235AE2728B9F@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
 <20260715140507.2329605-3-ross.burton@arm.com>
 <CAMKF1sqTS3TAN7Xmsb=enK45PZeazgrCd8zPr95_GSUzs4LqeA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqTS3TAN7Xmsb=enK45PZeazgrCd8zPr95_GSUzs4LqeA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM0PR08MB5523:EE_|AM4PEPF00027A5F:EE_|AS8PR08MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: d250a0cd-e26f-4682-a41e-08dee63f0643
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|38070700021|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original: 
 O0lJxM4uCz2C3HZfGrBql/yG5V2P/UhLesur97eCPyBHD9DAEHaF7FXrXGn3OKMyLeJHRiqv4kVrfFAt+YV675Hthz8V77yjnaJzedpjqdfSANPEyG9Q6niPY60UbhT4T8hEeOVafIxTRWKvA2zwi7BPRsUJF672ynMl2t32a4x2DEbmsjj1FA/lgYLcYArTGuMjfVcsRJvO179eLAFHoL2zw0DxQY5j9yq4MCA7BSzRvuBh0lnFaNDTKNoUye4mE+AprMMOHrwFftO0g4C1DIPJaSKOzci/BFrEB06yX9fN5q93Ps6Tfgctj8a9YZeYko631g8wseYU79jKimQ4EjTiEGR94hwV2Sa9THeGdS2FYzIMqiYh/YffHqdg5sXojeopuGzmKKq9T8XCmNlr5TzGCwrartZdTCGjPXlMndChF+ejViN6/Imn3spwwgNFVYdcQp1YBmTiguePr3r/WfAxQdT9tII3wPRj+cd0tszCJBoInZGbbUGTKMtd6zCV2n6eXmPytCnT2Y31f5uMk5yBk2LRY5br7Ve1QzK+hpHTrep8mqDogwcKxMNXOWg7i+HsX4l/nyeXzIVmZ7kUg0NB2N07Vq1uWwZAZsLrsfQn4RPQ5nYjSfZq3ycW4qmusl1fJE7A4P/ai+OlNVmB+bpkNukdLsYPO6Esc2mwK2Bnhas+yWa88fd5M51uZZLuwpF6P5zvw3Gbs4kLitRHcTrwVsiA6nd7hDW8BptKXGA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A24E5B407E165349AB3A9C2C4BF81A14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 p/tm1ZlzBywQAzhvzByk4jAPHi3+SrSABSNozH7bN8DiGPBIgF50YejEioGOGkwmLfSuyjvYfs3oVnYESrfabtjX9qw4BHG45FiulDeo1cmIoFKOPJdZvU8nijBKNdGBdF8yQC+GH5PbPuFVwAr7UZMoJVVXXx7gbTJjzDPJCY/0+uS0UNZWd4R2+SWKYDzkcksLRXNPTj+D/c4EC2a42AXOu3YlAOooi6Ip/hOYRo57r8RP5EX4KEGIxtgI/B6jDrYMRk0Zx0UgFy9YTtF+lAnFkxdxCsNPxrUfgBgcS6An9P15M3Zt3e3umIYvQJGsdXBNqTeSoWJPnjynfrJPiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5523
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	aaf91bb7-bc32-4043-b793-08dee63ee041
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|23010399003|36860700016|376014|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ssT2OPxmSCobQYShPkT8I3Wnn+jfM7uCP2VC2ON6M7YHJvBj6F+xxW9yjdJqZaaEQ7UFIQmGLoEDrBSjIJVrnS2MMUvJ2s854C/t98HCGwr3/XwVPo+G/aGrjGugSDdGvN9NV6cGO9g9GMqUSVvBk70ozz2pkr/Xd6BubjsWY8h6SfIHlzC+3u65IjdKJhJ2a6CUfKAnmAuNoPNrra/LAr2sow/vs4jfLpQQdnCQQZfSpqaw0YqsewxZhPd9OObDXSZ60fWwTvNURuDH7/QcD4ud24keDjSHM9m3BgRKsaP6+mqY12pju6D6ommcHx9lmuCHOJC1roEQ783rYdiluAIQtRU7ivlPnWC7FUqygQvrbkVWXyp1kHagToUZF31SHv20gA4+4Hyd5x9JTa0HVWLZC8vrWL/sFPiNlO/yrCmXeuf/ZdtTueQOPiOcvFEiapUWjXEIBrhJZVNkULHkXTO5NlKAoLeQ32XlIRDH7Wsl60k2y75NrgVD2QIX4ENFEJFoOT5ZjZazD/wQ0D9bYMB0vWTt8urPw546tBEsEO0Qpns55vKy9pMCAFLuKmG+WB0czJUWH5V4SQ0MwVJZdIzFI5dsZCwRO879QYsgdM3Fw6eRY/SPaCUBpyhzBySXc3NA9IXtt4VPOGhzx6Ib/OIsHL6k3nyEbZZ7tU7WHoRKWHb/tmUWTqi0HoS4KJqDyabsDN0TADDOwVby1qtxxg==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(23010399003)(36860700016)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	K0VrZXxME6Oq/tEFtImKYzrpzl2jTw5u+CBmtcdFsXhZuRukPFzwYkJzroOSa81BQogRjUN0O04lBDajXU95wZzLT9+thjcfzVXMYsVmlxVQvACwOF8mK3Quyb9TpgFxPn3WirxpsNtkz+9F1FiH8qiff5hBR6bDgg5F6GKwMhkbPCmxdb3otL0JdX2B0fm8UC3iKe3v+Io4HSIEWBnhriV84AcbvFs9Ex5UCB/zMftTbGTWGFoi0n8k9O4Hd75OW/SIqbVIOb+142Cj46UtkQn4JKTZXrR9gX+k3RjxEE2kCcGwukZqGj4gRiAEIHMc5INKniq9CKXj/dAv2d2FFOjEWiIwLmbNieXUdI3KV+kckJWbisxAlP/SfDpOsvPDrmBeNZjrzX70I2hOjvBuf0Dfk3ifh6VwEbYZu2xLuw7wsGM2QLYIFV9bgl4Iti1B
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:12:29.5201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d250a0cd-e26f-4682-a41e-08dee63f0643
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 09:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241346

T24gMTggSnVsIDIwMjYsIGF0IDE3OjA4LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gbGliaWRuMiBkZWZhdWx0IHdhcyBzd2l0Y2hlZCB0byBidWlsZCBub24tR1BMMyBp
bWFnZXMgY29udmVuaWVudGx5IGJ5DQo+IHN3aXRjaGluZyB0byB1c2UgSUNVLCB3aGVyZSBJQ1Ug
aXMgdXNlZCBieSAgZW1iZWRkZWQgc3lzdGVtcyBtb3JlIGNvbW1vbmx5DQo+IHRoYW4gbGliaWRu
Mi4NCg0KTHVja2lseSB0aGUgbGlicmFyeSBpcyBkdWFsLWxpY2Vuc2VkIHdoaWNoIHNob3VsZCBo
ZWxwIHRoaXMuICBPbmx5IHRoZSAtYmluIHBhY2thZ2UgaXMgdjMtb25seS4NCg0KPiAgU3dpdGNo
IGJhY2sgdG8gbGliaWRuMiB0byByZXNwZWN0IHVwc3RyZWFtJ3Mgb3BpbmlvbiwgYW5kIGJlY2F1
c2UgSUNVIGlzDQo+IGEgbW9ub2xpdGhpYyBkZXBlbmRlbmN5OiB0aGlzIHN3aXRjaCBjYXVzZXMg
YSBtaW5pbWFsIGltYWdlIGNvbnRhaW5nDQo+IGxpYnBzbCB0byBzaHJpbmsgYnkgfjMwTUIuDQo+
IA0KPiBXaGljaCBwcm9kdWN0aW9uIGltYWdlIGFyZSB5b3UgYnVpbGRpbmcgPw0KDQpQcm9kdWN0
aW9uIGltYWdlcyBhcmUgb2J2aW91c2x5IGhhcmQgdG8gY29tcGFyZSwgc28gSSB3YXMgY29tcGFy
aW5nIG1pbmltYWwuICBCYXNpY2FsbHkgSUNVIGlzIGxhcmdlLCBsaWJpZG4yIGlzIGxpa2VseSBh
bHJlYWR5IHByZXNlbnQgKGdudXRscyBhbmQgY3VybCB1c2UgaXQgYnkgZGVmYXVsdCksIHNvIGlm
IHlvdeKAmXJlIG5vdCBvdGhlcndpc2UgdXNpbmcgSUNVIHRoYXTigJlzIGEgYmlnIHNhdmluZy4N
Cg0KUm9zcw0KDQo=

