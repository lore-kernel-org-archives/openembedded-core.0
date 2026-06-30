Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFE4C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:55:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18544.1782816907652811105
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 03:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZE3Pa0yU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZE3Pa0yU;
 spf=pass (domain: arm.com, ip: 52.101.66.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=a73Lo+ZIsPwxgaU7sYBCBweTyJrduys1jF0xFnznyhQfEPoynNW8J7S34O7ZcsnXrBxwECu9qIXaJ/dv3UL4G4d4Xnqe82yu7EjHMB3WSxt2VQH+00I/hSp/npdV8oPHOXpzmeUqsn+42DlKvXGYhPq9rtRXnNL4MHoYTKsSqMkuXju2ozcq2M68X2DZn43cZGWd3JG2uOgmPwaMR6SnB5udWaxweVgBzRymH3qDadhdjMFRO8MXiiqmLHJSM2D0zRsNQ+anTX3KVVhQccmQF6kYNDAZhM/fIo4zId5gmxiDLhOOX0vHtI45tSOTBa2nB3t4ShoyuI/eDp9WVWQAPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XryjszQzwtsbR/ax+gBC5FfwJZhDG7Hx+Ll5vDuX7gQ=;
 b=n7QDXXV2T2tupLRko9kXnuHgohPLis06lcqGUNq9WNtjxzVu+unwhiM/FCqNt2RnQ+lXoY+cm7ID3Tq9msvtNYjjyKImhKRfuFGAbeF5Ns5Y6gtnA4lify9vtaUkLyCDyxMS6xTutLhIIxbk/nyznRQSsCvQibh1qj717m8HscDx8154pAL5/ZCihezbupVgEnFoagLo+Sys74mLVWl1//GPrzKdf2pnUfZg83FKHIhcYRTeu2WcIEIBv2sRtaUCAU/PpwULCZuo/8yp1QfxHLYFe3pa5uTyNzmzA/PSVmjVk6dVIo5xcECFVa4hxPJnHHbSuyGzb2jieZtijYjcPA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=bootlin.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XryjszQzwtsbR/ax+gBC5FfwJZhDG7Hx+Ll5vDuX7gQ=;
 b=ZE3Pa0yULar/N2IhefhKSuh40Kj0fsRqVYPoqUHJUgM/eEl8NnmPpHM+b0p4YX+tha1xnyIutvoUesDjNnClZ/TJaIHXxO0NWufSvoipaa71B59jiYmq4pT6jLyc5uqnBpa2gB/ryLuqwyYg+2Z2MkcUmNquneGuP5R6x2PkubE=
Received: from AM0P309CA0010.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::17)
 by AS8PR08MB9840.eurprd08.prod.outlook.com (2603:10a6:20b:613::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:55:03 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::60) by AM0P309CA0010.outlook.office365.com
 (2603:10a6:20b:28f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.2 via Frontend Transport; Tue, 30
 Jun 2026 10:55:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Tue, 30 Jun 2026 10:55:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AS4pg9J6HOVrxrHWxTEsZeLmTDXQtZ7a1Q56twQ5BoGa7XTD5O3yhOH5YKkGvYEBo5YI8/C0Q0/1E+/wlgyLmY6zjzotXbeSw8tXlFydipSGe8vV1tjwAfPeF3b8wZ3jNJu4TDmYf+tinvMH+K0MV4tSdSBaUFN24pSw/rncnRokcSztJXq1Exix6F2BKgkfAgLVx5jsAs8/cm40Nuvuz3wAKB2QtISRAw72tVJwLW6Ar5VGXo8vrwNPljklnTLOK7sUc4k9MIkxQv85TBGAaAGmMXAS5O/uocGad2i8zVMhmkTU76nIgcbfy+c47pC3PxjBDAGXYx/2DsxAM4w0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XryjszQzwtsbR/ax+gBC5FfwJZhDG7Hx+Ll5vDuX7gQ=;
 b=WlLS/3/fvzBK3PK6mKj2OuJYagH0h+njeAlnTJSx0qcAsyv8FvoupzcpbgTef2SSJ0D7TrZEmuvuTPyXwyUj97URxAVZOt9meW57uFCruBWBLX9vHJW8/zgKRaSpCgmUd6q6fDLaJnfW9LY2BSCGSVwetTPwWzeXwQvk+FHz7vLiGjTLy6lhZQM+AH1sCT5Mj4bXteVX5eOhZrGBqmq/BfuSIMtjAO7Q/J9DudoT9kX/rqunlpcHdLIfd8Ag8eAo0SC99sijM+ToaQeyeBKzQBRhTWV7dzLlDsQe4yFcXh2FNlTxrBeauQgcIbXqvRyX011rluyrW9hBuHgn9w+W+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XryjszQzwtsbR/ax+gBC5FfwJZhDG7Hx+Ll5vDuX7gQ=;
 b=ZE3Pa0yULar/N2IhefhKSuh40Kj0fsRqVYPoqUHJUgM/eEl8NnmPpHM+b0p4YX+tha1xnyIutvoUesDjNnClZ/TJaIHXxO0NWufSvoipaa71B59jiYmq4pT6jLyc5uqnBpa2gB/ryLuqwyYg+2Z2MkcUmNquneGuP5R6x2PkubE=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by GV2PR08MB8749.eurprd08.prod.outlook.com (2603:10a6:150:b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Tue, 30 Jun
 2026 10:53:59 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:53:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] muon, an alternative to meson
Thread-Topic: [OE-core] muon, an alternative to meson
Thread-Index: AQHdA8mgxuNNsud2JUmNfuTRVou0fLZNjvWAgAAOnYCACVhRgA==
Date: Tue, 30 Jun 2026 10:53:59 +0000
Message-ID: <91FE9078-33C4-459B-879B-B3043F41E884@arm.com>
References: <D146E22D-7BC9-441E-A835-163CF509D8A3@arm.com>
 <8a1b467a-f648-4142-b07b-4dc6d239bbbb@bootlin.com>
 <715B5646-994C-4344-A7B9-8EEDD1B711E9@arm.com>
In-Reply-To: <715B5646-994C-4344-A7B9-8EEDD1B711E9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|GV2PR08MB8749:EE_|AM3PEPF0000A795:EE_|AS8PR08MB9840:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a6e44a-979e-46df-fd5e-08ded696098d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|38070700021|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 QWyu+5fVO6uvzz3k26gYZ7Jr+i9LdlnOQ1C0dpbEZGN02s+hAhmLRJ3DjZUiXGDEnXDbJHuO07+PKaYudZ50KjqC+KeG0slsGyoQTZGocG1sJkxE5ni1S7YQmU8qA7jZEDsqYJn4axgPXMiunOZYsOqyUhcli71f7NG71xShQNeqsYKDEC+vY9kzGVvQ/esv+ab7S5pfQHc2Pr4ix9Jg2LbyvUgryofaDoSkZQ6i4CbbqGo/npMvCeivdsMEKE9bmednOVtIb/HhN47ZdwBYX86euQcZkOmBDDabUvCM1sKOQjj9hJcTX+fUa2OLGi8kwrh9gJ6t2QmdlB/BNg3MXmhzO/F/HPxHq++YWpmpjtW4xe+tVyjqkKDuH3VoVG5xW9f7cA+fKWV3u47yaS13g2HYd9s58VrggXHBwf/VweHiwnWhw1t1WGdxxfYAcNN09O6hVoqn7j0aJb4ETQnV7yxxsE1m3aIL8BFosIdcYlIXoVz71ZGBrgpBcxyN+KyvRnc+rMzn5QDw0niiUZvHJAvUrQTps75KEHPOlZsO8d3Gpo37V0cGcoksTNjzsNLO/EGldS2hdrquoKDPUj1FVoUz0r2V9oRFp8xG9QncECwsq+lb3bi9dAt+TPBBlYmFliLSIHnCc8AJQJdH5E7gdL7dzIr4R72c6//0tbDyghSzjj7VPJJ04mvFVmz3Fmm1IuYd8ydPa8FkYxQJBKH8O9xQ4ZAQYtdJzKqhEyh5//k=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FD5EFCC29F6FB40B2B712A4A3BE6A16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 VKImxcMn0kLR4Lt80AsDVi9q5fiRBQ/9w4vQBlFCA+JOiW1lTGcc86brsdBp33b6Skqy6dBh54awC2gz7APNscbRS4Ehsd+3xTM92kpGjhxsJvSaIruMv70Wr69IYiX+/8nZ9XNgGC0TCkIqvaKgZMKVeggY4P9hf2ZumRSeiAmeJ2J/2Pxjw+XFOXNpXZ2TPp/n0NZHLaGWVVbV+0+VaMUElDTN6+oiukLAaj0yYuafoK/0EpVoVvJzVuPNJ2w1qoEGslWt1T+rikJFbohWqsXC8/3qqUTeSIM2yRpoLoke3lZi+tmGxKhBLwnfMSv0KhlDUmHq0WUA+10/4xH21Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8749
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	411d5d87-1e09-4e47-b29b-08ded695e3dd
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|23010399003|14060799003|376014|1800799024|82310400026|36860700016|18002099003|4143699003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	jY7tkUpJU0Zzy0L8/yIoPvZ++blwfhsXItObARP4V3Bpdd3u8bMM1bVt1ONqzYckb0jj2UQcZARI7tTUlLUJJxI/AO+679JEBQKdgPUGyqliD5hAYLEO5dKL4objgCkSYQX47kPtPyt2fOpc3FNP+s5j5x1u0juyktouqOItcZmP2/jhYxwoB+/yOgAiG3qBKJGUDvfnS/MBWT+MAmU/WAK8cXeUD7gK3uPOAoqvnlU9N3AtpHFGpLZfxpGWvFB1UMZ3pAtbjbJIKX08NvY1LyOs1kAUqSVCZy9a16Ha7TF7PPLsUjPiqdjhKW7Lxi31PIp9CsUU4whCMVTAZAPNUoonBS8VlzlNwi1CmbTd6BuhLifq4/TY6O372VWpZRnIRybbjPDS5wqTzQ4xg++zJQ6m/1wBPFqBS+YGaxh7njB68jYvaZes/gdWWvoV5nnIkZUrzhWIYVF0ThyOSs8ylXP5inH0DJbvUxarqZcptnVhxvKaEnQ5L+F/VqHWDCR+rspries8v82wy/lgrwqz7R1N1VHpYjb8KIGDQLDWNwRJwWUp6Wl8g8oWnDvVK52KWAEK32obJ8FoREftMcMYfLsmQbWHm2/n7gYaohNYn0U7kJBExptLshxRVDpqUVp3h2Ht7DL6aTAjzUJ9q13QVJiqYDKey38VO+jU4E4yFSY4AsjcXu1E140zLHgNy0DzQPlvgh1rl+ZR/9J3i2LHrA==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(14060799003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(4143699003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	jdverxO7hg3JMqNBXIk17/9GxAkicjLrvStraaaLE5HRdeNr36h+IWXTQEdaujo0bUsaFJhXTZB0sFOmfrX5sKiRcSagtdxtu9t0tqx/0Jj9kyraxueWrd+ZuWdsOnZYeA1DMjmJR9c6s5gbI6ZOgXLmvWNjcM/6ZmFVkXQW+MQ7H4JAt+4TuLkqs8eynhAc2JqAgwDtrXtMjcK9DI/7iHcMjyXe+tKNHHHTeNVOYrO72yf4E9n9XivHmlZ92gm9yF7/6t/vcFLTYpg5c+6lXa5tiwL7E27Ycpm7k0/M2RpekRfs5kqx1XRX2EQ5LrMC2T17yPZ93KCPfkNfnmOqfjTglAB8MKZ7XqSEBqj49TH32OtuLiINo7js/spnevKdaS1gRGevFgVrJizIgg9sqD6+pPdjaFkaiEch43fxZPzNMyw2Im+Q8DO3LiYWPHWK
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 10:55:02.6537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a6e44a-979e-46df-fd5e-08ded696098d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239877

SeKAmWxsIGJlIHB1c2hpbmcgdGhpcyBicmFuY2ggYWdhaW4gc29vbiwgYWZ0ZXIgZmlsaW5nIGEg
bnVtYmVyIG9mIHVwc3RyZWFtIGJ1Z3MuICBXZSBhYnNvbHV0ZWx5IGNhbm5vdCBqdXN0IHN3aXRj
aCBtZXNvbiB0byBtdW9uIHJpZ2h0IG5vdywgYnV0IGl0IHdpbGwgYmUgZW5vdWdoIHRvIGJvb3Rz
dHJhcCBzb21lIG5hdGl2ZSBwaWVjZXMgaWYgbWVzb27igJlzIHB5dGhvbiBkZXBlbmRlbmN5IGJl
Y29tZXMgYSBwcm9ibGVtLg0KDQooaWUgcGtnY29uZiBwcmVmZXJzIHRvIGJlIGJ1aWx0IHdpdGgg
bWVzb24uYnVpbGQgbm93KQ0KDQpSb3NzDQoNCj4gT24gMjQgSnVuIDIwMjYsIGF0IDEzOjExLCBS
b3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAyNCBKdW4g
MjAyNiwgYXQgMTI6MTksIEpvYW8gTWFyY29zIENvc3RhIDxqb2FvbWFyY29zLmNvc3RhQGJvb3Rs
aW4uY29tPiB3cm90ZToNCj4+IEknZCBsaWtlIHRvIHRyeSBpdCBvdXQsIGlmIHlvdSBjYW4gc2hh
cmUgdGhlIHJlY2lwZSB5b3Ugd3JvdGUuIFRoYW5rcyENCj4gDQo+IG9wZW5lbWJlZGRlZC1jb3Jl
LWNvbnRyaWIsIGJyYW5jaCByb3NzL3dpcC9tdW9uLg0KPiANCj4gbXVvbi1uYXRpdmUgYm9vdHN0
cmFwcyBpdHNlbGYgZmluZSwgYnV0IHRoZXJl4oCZcyBubyBzdXBwb3J0IGZvciBidWlsZGluZyB0
YXJnZXQgbXVvbiB5ZXQuICBJdCBhbHNvIGNyZWF0ZXMgYSBtZXNvbiBzeW1saW5rIHRvIGVudGVy
IHRoZSBjb21wYXRpYmlsaXR5IG1vZGUgYW5kIGJlIGFuIGVhc3kgc3dhcC4NCj4gDQo+IEnigJl2
ZSBhbHNvIGNoYW5nZWQgdGhlIG1lc29uLW5hdGl2ZS0+bXVvbi1uYXRpdmUgZGVwZW5kZW5jaWVz
IGluIHRoZSBtZXNvbiBjbGFzcyBidXQgZXZlcnl0aGluZyBpdCB0cmllcyB0byBidWlsZCBmYWls
cyB3aXRoIHRoZSBzYW1lIGVycm9yOg0KPiANCj4gIG1lc29uLnNldF9vcHRpb24oY19hcmdzLCBb
4oCYLWlzeXN0ZW3igKYvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlJywgJy1PMics
ICctcGlwZeKAmV0pDQo+ICBtZXNvbi5uYXRpdmUtdHJhbnNsYXRlZDoyMDoxODogZXJyb3IgdW5k
ZWZpbmVkIHZhcmlhYmxlDQo+IA0KPiBTbyBmaWd1cmluZyBvdXQgd2h5IGl0IGRvZXMgdGhhdCBp
cyB0aGUgbmV4dCBzdGVwLiAgSeKAmXZlIGFza2VkIHRoaXMgb24gI211b24gYnV0IG5vIHJlcGx5
IHlldC4NCj4gDQo+IFJvc3MNCg0K

