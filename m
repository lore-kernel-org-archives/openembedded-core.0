Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1DDC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 14:43:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8679.1790174586126999901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 07:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nbs94XYF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nbs94XYF;
 spf=pass (domain: arm.com, ip: 52.101.65.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wfoxPDruHVnb+FA9z9oIhI3C4XJ7dUaV85GVgIUdgW33JTWwLD5e+rT+8KkASZRKqnjKbJ9tF+eOTB6efW4sKPt3Jz1R3TGQC4q69vfcaylByA+JozqNzTXIUzCGsjVJ9ugVM/yETTmjZQG2zdxZStz67ubD/BPjBa2DRY37fvBZ21KCQ0k+OJIzRGEwqn9KPpM2ULX7L8O59x7DT8oiwvl5J2L8bTrWjfkD9Iz5AIlcjscJVXaWGtNbNES5PAGsop/+WbxTAE8IGof9QjuYUpbSeoEMtKlTPVh0/sonnj0o65W7rwgRxx/wmckvVOHfPkxe6o9lRDYTSyA/eM2bKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A93q1IyPteDe+9lLNE81VfN11HzOcMux9rr4/KGFTFU=;
 b=lkyWozj53ltiPLnzH2teNOP+gp+lMM8JKf040qGwdtp2O5xx8a9MbYMgI87msn4T6/4NiMSS2RoSQczyN1rAQ7u3OAFkUZ1gRRUhMfhrTcP9kPEUpREZhS1aabZ9VSqCCUU2qXynD9LhFslIdH7ErhdkG9OdABrjw2PFEjaHWybRCP+aN6VPduYRwa8z7zZv3Jm6vv2pUNGVBp181Lg4DF7c//yhBWSIM37PVf/hBqazuQ/UX5AVSXVaQYDqYKi+CIB5a7NczFZg4LEaxQCeTQMb/BStf524Mk9mQkuTt4SSxf7oq9IWFw0HxaUSUht+4T6OtrTiZHsYkrQ8G7s42Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A93q1IyPteDe+9lLNE81VfN11HzOcMux9rr4/KGFTFU=;
 b=Nbs94XYFcZR5CKlRlB7PNGTd+dnQWlwBWQNHsWSZTMLTX1h6BZHZUtKGf1eoLNM914Hud1dPFgztPBwZOLRurxWmrpEPUQn+YniADkdf8ZDdihU+WtSY/K4z8yhuUtYazXLTooYKDR3x71COIjQJAnI0kHEH07OpwsTkf4/t67Y=
Received: from DB9PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:10:1da::32)
 by PA6PR08MB10444.eurprd08.prod.outlook.com (2603:10a6:102:3c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 14:42:57 +0000
Received: from MA3PEPF00000409.eurprd04.prod.outlook.com
 (2603:10a6:10:1da:cafe::32) by DB9PR05CA0027.outlook.office365.com
 (2603:10a6:10:1da::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 14:42:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MA3PEPF00000409.mail.protection.outlook.com (10.167.241.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 14:42:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpnHFMpN5nCwRdcAIqMgFWPBfBF5+Q9gVpT4hufl2ZHMmceerp6wy6jqBqgQgFoSE/hLV0VwTQVO6v2vrBDy/9OU/1A3BA4dqP1eba2YZekDccaakik7unhqkQDtWUWl5PFzE27tAuU2C6QtJ83buf5RjuI093uvgdqzW+vhdfIGNPDPRt5ZCUqNxS15KYvojGPg0dKCBvE0iWRUC4XX9rkdkAGbGNGD5o4C+sNC+SOPSwzhVHlYvp4tvoA1Tic9DjTLBLvFOx6lIV89XmpHvWAzn5o4nAmXoK5F4qRZcK/OCA6pwABT8KVNAsgF/fEVRPwEMujCa4815llWj5qCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A93q1IyPteDe+9lLNE81VfN11HzOcMux9rr4/KGFTFU=;
 b=yC6BbuwXptU3k4uCPy77Jw2jnl37V6/zt++wHY/UFcqJHNgBn75ipcUotjCJeqtahqxH+5XmzIIwSin0+9ObfJ8wGY8ON/++DM+lR8QkTc9R2HIxB8mS80AdVsOCHiGngfc9hiewMiHfgGGeHcYOKVQ1mBm5iVjZ0Mp6DgiDowFRxazlKhxqeuBUzSBmMzDmJTaLEoLk1xt6D5VqQjE84EEuOQQVJJ6XtGXDgMTUEjQ1IJBoWpRC4IFzTx55JKDFGuyAVzTvta+9YODviJryASLqmnxM9W0p3oHCBI+BL3b4hlq58Fl5E8oxGSq1Wjsqnlhv0gP3O1Jq+gNyMu+d4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A93q1IyPteDe+9lLNE81VfN11HzOcMux9rr4/KGFTFU=;
 b=Nbs94XYFcZR5CKlRlB7PNGTd+dnQWlwBWQNHsWSZTMLTX1h6BZHZUtKGf1eoLNM914Hud1dPFgztPBwZOLRurxWmrpEPUQn+YniADkdf8ZDdihU+WtSY/K4z8yhuUtYazXLTooYKDR3x71COIjQJAnI0kHEH07OpwsTkf4/t67Y=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AM8PR08MB6498.eurprd08.prod.outlook.com (2603:10a6:20b:364::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 14:42:22 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%4]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 14:42:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "jaipaul.cheernam@est.tech" <jaipaul.cheernam@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Topic: [OE-core] [PATCH v2 1/2] gnomebase: fix gnome_verdir for
 four-component versions
Thread-Index: AQHdRusDxfNkMYpjl0qVIzcjYKjp/bbcOz4AgAAElwCAAAXDgA==
Date: Wed, 23 Sep 2026 14:42:21 +0000
Message-ID: <4C4AEC9E-FE47-4605-84BB-24324BF79BC4@arm.com>
References: <20260917074956.22252-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-1-jaipaul.cheernam@est.tech>
 <20260917212435.93696-2-jaipaul.cheernam@est.tech>
 <E355EDBB-60D0-49E6-9F2A-3042130D2906@arm.com>
 <A7D15C6E-0CAE-42BC-ACBB-1A64BD97E5D7@arm.com>
In-Reply-To: <A7D15C6E-0CAE-42BC-ACBB-1A64BD97E5D7@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.700.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AM8PR08MB6498:EE_|MA3PEPF00000409:EE_|PA6PR08MB10444:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3b614e-8da5-493b-0450-08df1980f4d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 pBFJzXC3uj9M9sV5IIFH+M71E7IUjF01cQe2XpL8zUuysa4iNEQ6h/kq/ZpIQA+miG2HxdQoyzIH9qHlYIj6bxb796FsxiAnUi885NW4X7xctef9sOlZgqsOBx0dNjkUavJGPT+gOZdXZjbH8FQjNKX8zWOKZkdIGtPd9HIrlJAzBHrCIyrpmIpTyj0jsL5bosGhxqfCm4EalJejE54EwrXAcN1MVJkYy8kslrDGifvkRTio6uqdcSvDVgeeVSvlu9Tee2vU6c4YK8mIfQk5CFJPBH3IS5DWO3Ck9VL6Zvt1HvLiZX6hYKa8qjvaF7HGiapMbSGpS47LBuxWRITlHGGHvG34jGiPUO1Q80T4JW1ogxyueSwrE7N9Uxysv8pNZUFb+wi+E0YHY9Ugk9lc6a+diL79TZw6lxzcHElvwpP/BxM67OZboC97oV/e5I77huxAE5P3XIL5QZDcohu7kfDVl1juKm/fSZZQgHjsBaRzNMiTLxjs14Vlxw55P7UUZb8ARRvczj70dnOYDBqFNpRiwFrjZPCUbpXZMnHUhyLR01BRKSum1wVZeLlb9uRbtS754aJ5uk9ov3dsL/lhKH63m3PKuUMHriput0yawxZV3J8oPm9QIjl4FBaz3r2TTtb/RxPhHvzo082wcr1gWyqFr2HrYqdUSDuhiFZHrec=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B920A3A2D2F9F246AB5B6D1DF525A42B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 VyHZwxut7aEhxJUv2lzSrsHR95P27Oart+blRuk9gXDQfwfUB0CoMR2qqrXutcZgdJZVPJyCxYfIkcrdi5W+syG+ipUBO04iG5dxUCcd9M3bG93e1byaH/7lapuFtpkzgxlBdEQ3KLQbxoHaqecl0vD89RvmBIaiPHhSOsh7NXIZ/gPUwYgfoSJGzHDweNokmWfaGgpNRLt4sMIwJ5Jx2oLSintCXjSfgPcvHxpVUcRIRbizPisEtd2/01RkhmpwMfAbTWK6bgIjIEQl0ECBuCTUTA6T4aWfl2YNpW2YrkxSZS+UkYSBF/lYcFeqsTmvVKmBhhS3xywfc6VPuLn1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MA3PEPF00000409.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba864781-9e3a-4498-f1e9-08df1980e042
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|35042699022|376014|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 
	detEp0dyRBLFYPRYZbIk+FgDr+9gFu6XUXECtV5VkxEjt7cJKHdDfDZyagn36NoILgbTs/qbCJ3PNzeldPjJov1tfypKmffuduAhBN3MVOPa9Oa8u/9VOQYt0lk9aUM9gH+TYDaeHncBJCIflRda4NGmwgaq1iwsNZ8i99fs/FTWt1ZLp9lAR6M84M9ICCpRGALD+spRUb0SACB3TonBwru06yJPjJUKqH8rS4RQnVt103krOX6dEpcCNWnYjoMH62xDYT3UdEEIwdUGpPE+dL00eyDSK+0/GF0EaHHGmyJ2wnxNeAeFZ0PSQmopKycsM7vylEiaT5gjJABRN9c6hJ2/AqlBW3sNd4gRxrmuHKckcsXw8FE5wyn5PcOOR4Um+p9M+GqeywiMMoV86x9+C/qn8VM+WuUpZDsV5iNn0dDC3biakKFjG0zWozWCHsweUlUFpOpZSEYwzKksEDBHlWhFCY2aaOsUxAljZ1RGyvmG9MBb7Oy+WFD8XO2joBDkxA8IY6IdWGDcfqjxbGrWytkQiod5ioZ6Eej4fvtozjtpcTRBXHuFa5UJ8HLM89pESq1HyQfECVhs2j2TeF93Z6gfemojhFhhtGxeibFVNBBrviZ6HNmMzhL74iKrPlvJS/HBbgCz/mbPyyB3aEnHyysuyez3ZlXL0lqSvTwikVk=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(376014)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2u/HCjKtOH1KsN35vQRGd63AeFNt9ITL+wNCxy4gTsfpUjd0ZuqQrwctPaKODGTpeFz24eVC8daTXm0PGYmQl7Fk7HsV9ZhfTZ7htpW52cRWZVzoCV24Mxv53HtqZkIeHbT21oPhnZ6nR/hUryrz0hsgHwcc47dBXZRavFzlLEbyiM4DTkWoRsdDdp1MPkHMf/L3X3uAFWbjP5w77D/xBEnRSxRqfNHSoWLksIa9Tj3/PT0jPRfxvXkYjlaANDPC0tYmQPwqUfzpJuIfJO2uwl5l0MjUL6bBC5KQtOVl8Il25+Mh2R6TSnPO2Nvk6SSAuEuqmR7pR5LvOGRvNK66ShFvB5ewnDlmffNW+8fzKobPhc53OAUBJMNZazvM3EPAmFA9IevYkGQsTMWNQQq8IKkV/7EA8RJ4MiAh9VoeOuMckL2S2AGYWKcR1R7ja3hM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:42:56.3023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3b614e-8da5-493b-0450-08df1980f4d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MA3PEPF00000409.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10444
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 14:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246527

T24gMjMgU2VwIDIwMjYsIGF0IDE1OjIxLCBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNv
bT4gd3JvdGU6DQo+IEnigJltIGNoZWNraW5nIHdpdGggR05PTUUgdG8gc2VlIGlmIHRoZXnigJl2
ZSBhY3R1YWxseSBkb2N1bWVudGVkIHRoZSBhbGdvcml0aG0gdXNlZCBzbyB3ZSBjYW4gYmUgc3Vy
ZSB0byBtYXRjaCBpdC4NCg0KU2VlIGdldF9tYWptaW4oKSBpbiB1dGlscy5weToNCmh0dHBzOi8v
Z2l0bGFiLmdub21lLm9yZy9JbmZyYXN0cnVjdHVyZS9vcGVuc2hpZnQtaW1hZ2VzL2dub21lLXJl
bGVhc2Utc2VydmljZS8tL2Jsb2IvbWFpbi9nbm9tZV9yZWxlYXNlX3NlcnZpY2UvZ25vbWVfcmVs
ZWFzZV9zeXN0ZW0vdXRpbHMucHk/YmxhbWU9MSZyZWZfdHlwZT1oZWFkcyNMMzENCg0KVGhlIGNv
ZGUgdXNlZCB0byBwb3B1bGF0ZSB0aGUgc2VydmVyIHVzZXMgYSBtYWpvciBvZiA0MCB0byBjaGFu
Z2UgdGhlIGxvZ2ljLiAgSeKAmXZlIGp1c3Qgc2VudCBhIHBhdGNoIHJlcGxpY2F0aW5nIHRoYXQg
YmVoYXZpb3VyLCBsaW5raW5nIHRvIHRoZSB1cHN0cmVhbSBjb2RlLg0KDQpSb3Nz

