Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D41AC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 09:45:08 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36860.1785923105630521807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 02:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VW0iCGz7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VW0iCGz7;
 spf=pass (domain: arm.com, ip: 40.107.162.25, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t3fdSxFEpOPix1K1+QVmRfflBfYH3RbJpZouvbBJSmNMydWmAF6lV0pfDgDCEabDfLlBka+WC+o/MCbLxXdNlKVNR7ei42uaGN99MiFdZX51sFsZZUIy9AC6BXDV5pNY4sSJ+iIKMDQG6Zc7Gvv61fc5NjX7cNFTy/3rSR4rI3pH87AvqmuUYkLWMUoTTwMwRaREdpIJXzrnKIG1slf/Az7dFVpxT4lsMPGGv3ibFNCa8f/9S64Zk54Bcvc8QEso37ZVJsqjEILNuVoU3OesXzbsDM78MojBWt2i83PMKxHJtJBiIKOMTI7dkcSbrdhcfAJLOQRflvqcV073t0s5Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q30/soUiYyIv79lZaaeb5rLPs8tCX4/UUKew6KleOPY=;
 b=B65BcyVxRKROC/ohUDJHgZIA6vIwGCNqLBROKCvjW+1t0S16Uk4vjAziq2eS+yHzSay21JRC2Sr64Ey/Sf79Nh5SnmRECrfU4umnxwDtdmaX1wsIzLzgE9eRQ33JhkNPMpNE0F2jegS2uTuTQ4+OQ6a9kvKrjr1UVM8ZB7+8rL+3chJd9/00Ui14p1UPLQZ6glBVz6hMNU2Bf19D/KWIgoGUW04QouVriiPfehibugQDPhAm0nv7fLfXlKOyXWAv1aq9lfvqoO2PNAbHeHuq9yYNLyf1CoNogOBR8oh2vR5jOswpozHTz+b4xbkxaA6e5fedt+dunsXAs68Khgooog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q30/soUiYyIv79lZaaeb5rLPs8tCX4/UUKew6KleOPY=;
 b=VW0iCGz7zmgxbNB/xDJr6dUhUlGlXs8h62rn0qh+gznyg9NtPoqHeXPq7nQQ4OI2fFbCK7lPFgbSHPAIE09h7hewVgQXQDuLD1mlnJ/ivsWLp9t3wyQpi7cN6XtwnMUl9LJdhzEeoi+vybuDp5u4cMk2aKj1WbcyNQy8MaHRgvs=
Received: from DUZPR01CA0256.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::16) by VI0PR08MB11296.eurprd08.prod.outlook.com
 (2603:10a6:800:306::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 09:44:59 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::2f) by DUZPR01CA0256.outlook.office365.com
 (2603:10a6:10:4b5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 09:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via
 Frontend Transport; Wed, 5 Aug 2026 09:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OpUYM71sR4XM+kBSKoJ9pCU0+gXvn8aSzY2Sg4gVDk2GCcla6SI2V1jkhid3h9qPAtz5x14Z4hvqr0rm89DMCsnjuFWvBcjekNp3ZqAJel4TgmtRcxEpLH+PbUJN3MnDKiG7p0s5FKEt1lG3Gie7b6FORIvI7DXV4S4flEpHu/vbC6z+0+t/WgqwR7n3crT5ElUNezloJZKRIpLZ9lv660G/9z1TIIAgzVTgvwwd0nCIUrDOanF3YnJFVs7vf4KTw+Rr7FDJ2NmnQ8USz5t3+Fl6LeAwINb1NzEOpNL8TZnDxXS5kmn6MFIqYckOgb7iZy5iUPnNjZWL46CcuRIK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q30/soUiYyIv79lZaaeb5rLPs8tCX4/UUKew6KleOPY=;
 b=yOIpAfu67ifQsYsSJtgjNj3/kFsSkTrcnOckNGZdbBV52xeTcIs+iqBgwsXAqJnNpQCVSpI8f5IhpdOHCPEAPK3qodvE0sf5+RuTsysTKe/cGCcHhCRHuS4DQA50VL9pTlrjoWUZHN0eNGjsvasbqbyK9i9tz1PKNrX3hUb7slqlcVjdv68REcm0NnaesfIAAM4OcXyC8obWUgI9JzFjxEF0UBfEi4v1quoOIgklqtIO4kA7pkbWa9MQTj2pRfgqIJR8X4LEHkWsmCFtH1X/vSL4883eh6aZePgRTz3vETw9R6FdrYyEuQtsJ03YFMwOur0VmY6fmGem8rcaGVaNxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q30/soUiYyIv79lZaaeb5rLPs8tCX4/UUKew6KleOPY=;
 b=VW0iCGz7zmgxbNB/xDJr6dUhUlGlXs8h62rn0qh+gznyg9NtPoqHeXPq7nQQ4OI2fFbCK7lPFgbSHPAIE09h7hewVgQXQDuLD1mlnJ/ivsWLp9t3wyQpi7cN6XtwnMUl9LJdhzEeoi+vybuDp5u4cMk2aKj1WbcyNQy8MaHRgvs=
Received: from PA4PR08MB6272.eurprd08.prod.outlook.com (2603:10a6:102:ef::11)
 by AS8PR08MB7909.eurprd08.prod.outlook.com (2603:10a6:20b:52a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 09:44:22 +0000
Received: from PA4PR08MB6272.eurprd08.prod.outlook.com
 ([fe80::be31:a8d8:c70a:bc0c]) by PA4PR08MB6272.eurprd08.prod.outlook.com
 ([fe80::be31:a8d8:c70a:bc0c%6]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 09:44:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: always use GCC to build
Thread-Topic: [OE-core] [PATCH] u-boot: always use GCC to build
Thread-Index: AQHdJAY9YWUmMEOGwk2HP1Lpwnr8HraOpegAgACP+4A=
Date: Wed, 5 Aug 2026 09:44:22 +0000
Message-ID: <AB3329F3-0154-4430-A1E7-305B66E9248E@arm.com>
References: <20260804114134.4028175-1-ross.burton@arm.com>
 <CAMKF1spL4wUZ_ufSy4Z468nUQYyfXnx2H+bqvKixVk3-KHv=pg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spL4wUZ_ufSy4Z468nUQYyfXnx2H+bqvKixVk3-KHv=pg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB6272:EE_|AS8PR08MB7909:EE_|DU2PEPF0001E9C1:EE_|VI0PR08MB11296:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a966715-b4eb-4157-542a-08def2d636a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 9a4SqCRQw/I0wGopvQXqoUhEA+H08Xzxf5cHwKQOX38xOcCqZYVAsFXFDpFbTZb9t57hhHV/bqvn/yMWHUDBC24BfYsEgG+gsltJU4aRFVVKTkxt32GOBrqyueHwyzudahdoxfGlWOtc7ar47DPcnU83aHkeAO1DqCY+a1b3Ncqg2bJ6O29v52chyWtY2nNyedDZT30lXCwWry23Qdy0EWYMEvvz84Jq5d6mDSMPlcYTEx/+XCaw65AYCWOjOZmI3suaNOfdpTqjMqqMZI9uEjvLHhwT7kNLovWvyxKjQOPmg2C09A4F6Zr/ZbmVIAZQyKJzMEi4wnXWt5VnXcrKWFCBfSAE4ZRmKgaFOZGK6TMzuYdEV+AsKb53arxmmC8QeVvLvdkK2i2Y7WMQDyXQGWc6aGNf9l/yavmgK2/Vmo1FgPBpMIeWv8DGdlYHnPZlEzBILzQ9MYZujF4zErRpJdOfzb3OfX+FNkOnNqKH/rgXVgUrtB6+OqhGXL4HcmMMauatILWjeIOW57qreoga/9tqpuLknpa9Tu1witHtMHv29l/ThdmaoUeB7XTvFQAE3B5I/UYs0MPr+f4xrfse7WW4XcP89WZbwNTeRSm66OZ6FxDS1Y+EmHrcQJByzdzV7x7KI+r0q6L5sGqzv6JcT+1OIVkj+51iQiHaoqPzaDAIF/1PKEjkuQDNb56yNwAlAbHchYxQuTV5JCMyHyJnogHwqIGmuiQmFHLcW6rlReU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CFD6AD970423194584BC7F1795F7D2B6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 SRzgP7zytwEcA/dbo1/00b+BK3mfP8fw9KemzSqxRhR/mEEGkm2RbEMUnO75e0gH4z0L4TpHsLFswyyCCXRlYyBw9mhbYqPh4PGawTuNpCAnixIlr82WC1rLAcgH6sqVNhloySoLrQDUp+gA+tM3UB1VcHFgsU4CiBXMB1tevuGPiZ0HwdM7w58DpJxcUkbQj4p541zManBs0WSLFl8QOHZOtigDQIX2LGn2DF0umXjA0ELswpfDQiLonhQ5V/UebExMgPcIRQ+Hvk0L+Z64/NqQZaAWGLaLNWaAbKQ2NAWLMVrC4mLVD47/pTXVexQGvFvR75hD9OPRD01+37oMSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7909
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dedee532-dc22-4d50-b564-08def2d620d2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|23010399003|35042699022|36860700016|82310400026|1800799024|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	8ulndHV8rhojRnkfXQZ8TawUCLeY1BTb1WzXbVaStiw+sEJzWLTh/oMWFe/6vm88FUP+8Uh5YlcyIypcWDXz80O2v5xgn9FsL8MoYC7CkPq9uVPpGh5kk5TdNOvEEncfaHSmxqVwnpA94lj9KfIY/Fm5J44D10jI/ZeA2z4JLxeEvdqNwP/ba12XZZYSPE8z1GWCe9HUPRlwTms2TqDoC1NK+U7EnxQKyx0VI15EImRxQRC07/+/oyI5pASgTeBdUH6bO4PQ+iIGrNaawXnSRXB4YqilFMuIG8k7dTM2PgmSLQT6w5X/+f5XKN5NMGL2al8P2Q/eyVOWKWhdTI93XUVUgN4rV4Fq3NALzTYB5uHm7MjRFkfH5/FwvID8O62U4v23pimEUbd18lcpLpUtDib44Cu5nGMeGiWPyVzs74pDBhyWbpumu1TCMsTnu56ehwX2zQx8BRwX5dYO+ZB8Mfnral38LI7gRbg/npm6Nbe8cvI+/HmJg71PMZzVtMI7+TEYC51knsmWrbdPsiZczF45Xpl0Phuxkd8vDE6HVOstopB70ufVMGGEYyTUdl2SQrZZCEAs3Ocw2M4x/oVwzgqQI6wGwA4Jyq3oK7iYMVwDQogzJifS6mJEDIFECQdFGx9HzSFu4a3m+JxSoMXWJ/6VDQNhoPQ7mdJoS0GvGG/tdkCbnajsLZXzMSPQAYbrWEYcAKEI7AQwWWMBpJXC7A==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(23010399003)(35042699022)(36860700016)(82310400026)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kYc4/AbUOUbM6Cuxd63kiF1R2C5s5pKTqGv2ppXo03jN2pI6bCrY+KIGr+kH1cC3s4bFVB0RXrI5VJFtlYX1tZQDQ9GEULWdl1VMHnGKRcNiZh1V6vY9KwH7OkVzOPXOdukNYz7tuvd52JPkvRivH0Otzj04Vtyvzj821vou+NsItqDjezTOcBtb57C4qbVv/G7CJWRjBSQEkLc4yLwYoSvEOwlnW3O99UFs2g1eWKOfUQLr7KEL1oqygjMzioNO6CmyQm142iDp/Rj7kAh8fnkf36yaFwvZJr3Ep0LKxRqTyelnQHqXGLEsGzpr+Ta9/GK9mual1KkgcbXdKUa6/SHkBOmRAFsw8Y/WzQz9nm4A8PA2nnnIMuu5hxrHS8lhJ+uypienlICCR8yWjmrdAhyWRi1vUibmgeiMLrbAQ6oG5WH2v62ZxpOQ26ZYRXpW
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 09:44:58.6652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a966715-b4eb-4157-542a-08def2d636a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 09:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242849

On 5 Aug 2026, at 02:08, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> None of these caveats are relevant to u-boot and clang versions we use is=
n't it?
> so it seems to be workaround for some issue that is now brought forth whi=
ch was
> latent before ? if so, why not fix that

Almost definitely not, but the immediate fix of restoring the original beha=
viour (always builds with gcc, even when TOOLCHAIN=3Dclang) was provably a =
quick fix that could be merged.  I filed a bug for myself to do the work so=
 that the uboot recipe actually respects TOOLCHAIN.

Ross =

