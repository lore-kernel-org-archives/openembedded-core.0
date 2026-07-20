Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A937C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 15:46:41 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.578.1784562395648926680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 08:46:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X0jyUn9i;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=X0jyUn9i;
 spf=pass (domain: arm.com, ip: 52.101.84.37, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zjst0xgyS/rHChKgBjBTXM8lBkCWv1v24LSlQorZ3SLvGnFjLkdhUMZfUwTM9CYgIzfS/PEWuDQV2JkUyCQNHEXSpJ4efmypEShdhKhJP7CyfvwwugQrNUWADaYuMyg0PULbrGzcJ4fRKjeGJEMWutEX1yeyPXxyGSR2xfpVPJrctVI9zSPDCWLy1oFzMLERNoer1JP1MAknGGy0vknyZy9e5fpGhhh2SmZkLdFiaBXkOm6B8A5RNsyZowDMgH+ssAeuN123qMpU9AYgy2NhguHTbU34lLprEZjhTCfRftxaCUsG0n1qbjkCoTkzhokWfVGhgDcuvsL3DlfKlpFp0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJCzaXEAvZqBE7J/QoRVGD5eqSITNJezYZuUEQ8e/p4=;
 b=S9PGZzK5fIKoIclT81/aflA0RAwNcVXOAgCopsYVoXaBL8SAO/891+iFeR9muTmrJqknqlXwB+aiLLpcJQN1RpQqTyizGXHkRNDw66k4Z02ehPSrBYr72zb2L9Z0YCgzg/vOPODFgzp+ZXXGFNv4s32+gstpy8Edx3QuzYJqWI0DravzVRzL3qcx4FwO5YRjpGYU83xy1EHW8PaU4+QKTtGIIaJV4lrASl8rvVrRjeeLZF+iIedcuNX2tJ/dIX7N0P+y1DkurAIED+Pu/pKA7OT6CkqnVhYvzs80cO9kXW6TJKxO7UbcSSOENvdXl79LwP3TTSM9kAFTGnNhqgnpkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJCzaXEAvZqBE7J/QoRVGD5eqSITNJezYZuUEQ8e/p4=;
 b=X0jyUn9ipmllog1Z2BYo12sYkV9j/nDXhwevtBtsVlPHLPEuBccOQNpHVaJalrunpJY784AL5EoUcI+Mq/abYPHGfIs+ReJmLgzadt/MFqD0//72jvq8Dknui4aCa6GeDJoEwqyGXKQv2o4X1umxuAgpfFyezXn5XeTth4GFNjs=
Received: from DUZPR01CA0120.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::18) by PAWPR08MB9663.eurprd08.prod.outlook.com
 (2603:10a6:102:2e0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Mon, 20 Jul
 2026 15:46:29 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::2) by DUZPR01CA0120.outlook.office365.com
 (2603:10a6:10:4bc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 15:46:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Mon, 20 Jul 2026 15:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fff5OBcXnTmDakawqm5D+Pnwf/8MFonq56UthtO80r9nvoCWzzjSdKQ9PM1fG4JcVu4xw0YzS+A9mGG8C3G/DqSOetzWImY96saAKTDcA5IiBI7kgem0NU3IEB9LZ+wjObYzemlo4NIOTvJxArhBgwCGZ50rLelVrhSoPMJpHj1y32IzuTIW2P3ltGK4OGtKtmKgyb+Pct/Rd9DQwx5XD12o4JK1XCTP/RDkSh02Py6FgP2ErUrPDgTs10a49y6f4offk5bFC9mUtH0G5UbboWO63JW5W9Hn8moGlKpKX4J3BlU46jKOJ/d5kyYeqZJ0HTZFYvKJaX6j1RgZ+vXOVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJCzaXEAvZqBE7J/QoRVGD5eqSITNJezYZuUEQ8e/p4=;
 b=zS0cZCne5jUwqQ33DhU8w/bk387igUm/FI9VRd+v27WdTVmKogSYYgnZwoxdj89+hE+R4Rj7pMYd6RG4GGjxSZ7w6z226FxJSo7D+cCFZ/Hxhd0bejLwHhNC3nxvP4noF5stzc5SL+f2EFSaGXRUnSiLeWQjtj/2WMtlmyKKlYluWPmhABzwDg4Rd7yq4ktUDW+6TStZqpoo4iH7dv83aXw6EzQe/XL0sXeZ+ygyw05e6SAFuYTfOonDlKVgulWKL0fu8mfl1xs7YMzMbtzi0/PuQyM9tfJZpODel7OdDEgiehmqs622hVFmIrG6rpaCfiHYJ3+hqkpQfQC34b8V4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJCzaXEAvZqBE7J/QoRVGD5eqSITNJezYZuUEQ8e/p4=;
 b=X0jyUn9ipmllog1Z2BYo12sYkV9j/nDXhwevtBtsVlPHLPEuBccOQNpHVaJalrunpJY784AL5EoUcI+Mq/abYPHGfIs+ReJmLgzadt/MFqD0//72jvq8Dknui4aCa6GeDJoEwqyGXKQv2o4X1umxuAgpfFyezXn5XeTth4GFNjs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS4PR08MB7507.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:45:24 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 15:45:24 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
Thread-Topic: [OE-core] [PATCH 03/12] libpsl: use libidn2 instead of ICU
Thread-Index: AQHdFGMPMCtfiyLTQES42wMdHLbhorZzdrEAgAKv94CAAGZ+gIAAB5WA
Date: Mon, 20 Jul 2026 15:45:24 +0000
Message-ID: <018CEDC7-C2FA-4B0D-B069-0B4DADA2C6F3@arm.com>
References: <20260715140507.2329605-1-ross.burton@arm.com>
 <20260715140507.2329605-3-ross.burton@arm.com>
 <CAMKF1sqTS3TAN7Xmsb=enK45PZeazgrCd8zPr95_GSUzs4LqeA@mail.gmail.com>
 <A4197DA1-6F0E-4267-BFAB-235AE2728B9F@arm.com>
 <CAMKF1sraBgBmbCpkpARTZK8y62F_uC2+ydM2aLsmBvO2JGFu_A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sraBgBmbCpkpARTZK8y62F_uC2+ydM2aLsmBvO2JGFu_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|AS4PR08MB7507:EE_|DB1PEPF000509FC:EE_|PAWPR08MB9663:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f30da83-4490-47f5-0b2a-08dee6761062
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|38070700021|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 
 tB1rabX6Or2fFhBCWmZvjx7jyYiC2Wl6PObK3XIpwcjXQDzjTryVoXRCvx6oa4kC3+3npyQ7Bo1Y2IW+qfFpn5Ci+KRxeFop4CqvkKm/Tlwwi8o2BmrnPbw6a+9+FfyX4Z3ROoU1Nt4jBGJyshJHi3w0D3J24giZsgmzU7h/Hm6DQDRSPp7rsvuWevivWkUJ1RKdfBnwANf+bGvHIWkvCy76e9JyhWQg80vjSqRMzqp6RloI3Nr0hIL1qIGxLlmvDKUAIFWBv5UdrPpmAnr4nrVivsKF7A23VkojNuPTe1mhij0qjmJR83gYTogTRl7Vj2JOrqwzqUnu3l1yrOtGQHoG/H/CbbfCQ0JEbjyJIJqtjmz9bLxHen+jHERqh2bdG6rkGkhdUyFXmwb2vTYqgEfyRL79pKS22NMXJq/VMAszCu0kiYivlVqaXA/qFjxJI1UFFNqZ/2uJN97lLe7hqK1SNRzjhmt8TLCStuhvooSHfHDAynYc1MkSKt6Zim0ivULHz7FrjkIlqhgq3JLogPMOAVBTWkjH8vm+wZowE/F1cUB910gSPX9qXaXohI8kEz/lC8yKwjF+W2cxarwQfZLGrzoybrSniVg47pWBvy4BPwO+9tFoZxxBYT9+M/vMpnyzBzYZeQpF+PscqEzcHg48kBaIB/5jfH8MRvC6xMg5gjKrKEeIENre9MGx02IHjWzHhSTDWFarDKErqU4RSxkUFxTufES1L258PNxpDoc=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <417EB135F506D14DBC6681821558A25A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 RHhjG/RDKei1IIDbHp0FDmrjJ7CYeDTLDOGdaGBOskV033DLNRWWYhcxhbWpZPXAcR38ypamwwjCJClb2kwU5zroFUbnt7Jp0NZ7J9CToOQ4Ov2PzUrBcowxm2NlNpwOiccx6D5zEsi4wjh9nq1heKqoFPGWyHRj7mUbBqSWWqnrVafPM0DkkXTG8AfVqQgkRhZIUaimuSPwspzawOaqUuxHpE/gM/raq9h5m8Q7TOTu12SgD+epJtz0k9oWyVGE7mC/OJuOesAm4Y5MHGI9zyTifIrnldNpNUyQPS7+7ev+HM3WQ0ssuTo/n86efEZoFrbq9NlPXY+jwNh3WP670Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7507
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	feb0b6bd-7b67-40db-62a8-08dee675ea00
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|36860700016|82310400026|23010399003|376014|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	hLUtnkc9q5AoIRCfBgmsxksBFbTYZDO7hBPIsKBk3FgjeTjq7uVQtbNPwYS6wLDxU8/q43nCBy71WeHZFKRJCXfKjsTU22UZNLLir8xJwrCWhu/Vz2792LMod/7hls7UE5ArNQuG3QbRKi3dAd7IyrjeuXhfdHCUzOIbR5wb9MIf/0F6VaJVOAvvywWJOfIMRmoymwYclQf9bzxfMkklJCCeqWKOOkWSMVJXIM9Y3/SUKw1HxpHrug/gj/MmGPKwDXoinzIyeDlr+azJX8Np847oQdAGuI27VXLMJE1EKpE1NDk1IM9JKoWnPzSZ6HiX3vcmLr658VSnTc9MySmldhTN56z8L5e8mxK6RHRs/wn4p+P9AA7M4c9Ox/0KVEGJoq657yevFvi3HXa6Xbt/nd9GOjkmrQEL7qkzUAjxYB8EQsXFEAwtlsxPDEjDjFFK1/O7CDXkl0QTMLcF1Pl5zYHezia087oREN9FCBLsJskiuQFVx3sfPV0wIZ/ROEIJUvrlBaJJEQdo8HFVhAMZwKfqnp/pQ+BdKzMmyT9j5+8nENO5WbUtaLhJYwSp3hdy0J4NbiAKNbJbHpQ1b42txmLXXLrnLBlTfC6J6ArGWg70EqyjEaPy4sI/kDm7yaZ9gIhAL0/MOFPSljrFr0telb+8rVGWu/7Ve4a1Wk/C8LUyqXe2U/BKKMc+ZDVfiZ0qs3mRk9sHKGwJ8Sjesoeqhw==
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(36860700016)(82310400026)(23010399003)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EeHIIS6PQk2W3WzD2nPCoEdBw6MCAkbm1u+HIIcA77svLr5VbfsjHigiobjtrC/z7fkgYEknH7vLfHL2WrV5Cjekxejk91YNYjyD2F7u/r4X20O2XcZQEEu/Gw6nzU+JKrbRjVrDneHLfc1upYAmEFdVbDHqrv5GUbi45dtkDZF7gPORB9DTsUzAPNKT+5QWuBdPj8HEbca2lfTDCM2E6tHVzW9UjATW/IkFKowtbXrDXGxKlrY2DNp7WgLF6l7OgDYDp1tRF9kSxfWJbtKDl0onmW7LdJVgyM8jDEfcYmNsZuORPKbAlr5b2FXGwmDoAwNAiFPxCnNc2TK81QFsU6SHsxEP8NCk/p/iEuFoXB69mXajkwj6aMmr5/r7+A9F3jw/lTLcBGJ8xlBfaAwwz2eicTMh4IeU10qZncJBdG8zVrLOZDJKPr1VYqeMpzTL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:46:28.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f30da83-4490-47f5-0b2a-08dee6761062
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9663
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 15:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241415

On 20 Jul 2026, at 16:18, Khem Raj <raj.khem@gmail.com> wrote:
> Yes that certainly helps and maybe its fine to use libidn2 as default. Ho=
wever there are valid use cases in real products of using ICU since ICU is =
used system wide as well by many other applications in those systems and IC=
U data can be regenerated to contain just the data you need default kitchen=
 sink of 30MB is not real usecase.

Sure, and the option to switch it back to ICU will remain.

Ross=

