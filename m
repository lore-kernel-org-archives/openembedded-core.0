Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9594C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 15:51:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9821.1784130659131927846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 08:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Tr0dVbxf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Tr0dVbxf;
 spf=pass (domain: arm.com, ip: 52.101.66.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bV7DxM5y13ZHawqxHjsyV+s6LZxaPSUNZNLRQECqZd+bQDRQnW0K4oy2jCmf5IYILTxTGQNIoT2GsgW1YkZWocXGZFCdqjZ3ylriMez7GdKqYY5M4oKxUgs6sdfDqFopr8tN2GzfbNGSAt6ff/hz/k3lHyx/1Nzlxk6DCiWHUvquBphOVAc4BFDtsToE7YbRp/6fltHw8tq63wEfcD2S4tJ8qzJxTxUHawdrXmAH2OSH/Ao36wiWFsfn+AQVDN/5YJXQ+q9sLoIKg/tlV6NI9YOG547LpRZTXtZTbAQTjmArB5/732koci2Db4SGQR2kDcMx5Oft2lPu0MibaeRYBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgP3yGBmOHh5F+AwHUnq3h2XegOHGxYPE2nXEtz73Os=;
 b=H17yChc5MrPBHzmdoJWGG/Q5KfBj583zgb5s1b2o4qEhs5epfhJiFfqaY3MmRRS4Lu3t/AjJtJnoU2rAjxmzkNpwnLISeVenCnnB0XIcVrcZwiz/NYaSn/w3cbio3CTWY6jJgnr2RRX2ZIBVJ1rOmxp0tf7CG+AqVLl5b2KtJ0QfWKG9hlXoEde2mJDNwuNWfD2JZJPmEtInqmVOJrprTF9RCg1oiMwK2scMoeRnlD+Kld3+QsetFQkmGx77D6OptMj9RvYOqlnIqWGG31BqqQqEG+zF/ab9kUlTkLSMeQHzPL8jSGZTtXLeSLFQycAqO6skcHCqw3iaH9ii5X39SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgP3yGBmOHh5F+AwHUnq3h2XegOHGxYPE2nXEtz73Os=;
 b=Tr0dVbxf1qfT+EZFc8Sb4JvjnbGqkbwBJqS7kJMaPuxD1wvwSG1FfQMfOXXZBXTJhSB5xM1sRIQRCNPl4+2DTAp+ufOoq9IFZxHh2W4cKzX6bs+NFGcs8nsAteN8FillGzOwviMrp2e3zLgnpp6zJYJerj4/ZlqTwVUVTgmq27s=
Received: from DU2PR04CA0196.eurprd04.prod.outlook.com (2603:10a6:10:28d::21)
 by VI1PR08MB10219.eurprd08.prod.outlook.com (2603:10a6:800:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 15 Jul
 2026 15:11:14 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::8a) by DU2PR04CA0196.outlook.office365.com
 (2603:10a6:10:28d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 15:11:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 15:11:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDmt1Wrn2vK3EVOnuqnAqu3p5mrvqsjYwErzz3d9QuD++pAZ88Tks6eQbwb1lBOIFZaBrFqg/nXhv3GajoY9c0vXlYRRRADHruY0WufzYvDeui+11pmKYN26aPer8EsD547kEQoAiMxQh0UbW+EZh2x3a9Rl61tU257035kFkCTLge9bQbitcrFWGrRpCq29T3dApZKN8cz/lnnzT16MNmN9bq2D7viW0Dz4HYnvlvlPXKXQMP4tYF1F6Ovyk43dr9zwFc1TH49R0/+akXAXNAP0qYCAOkoqQYSlZZ9Pgt+zkC8+QXOZaLG3Jjc9ozPg3SimdMAoLXfrWfZOcxfZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgP3yGBmOHh5F+AwHUnq3h2XegOHGxYPE2nXEtz73Os=;
 b=brxdKOK8UpyXQORXNpwiSGNAJoxvqruGQXB5UV8KJzO2kXVRJgodxhxACRemnQ/4rs6EeEzALYfAp345MCWeoU1JSRSFrbhXp/5jkW87otfvxc2bs25wBWaEp0diXjaNdNtbSKhkzndYCmE5WXcLFLrhYJyReojQ/+ejicsXGI1e5ehMJyrAoXLgjbZs0iljr10K8cQs+1d9Mlh0WRAlGP63K5PrjlgJyRpcIKr1nFdUReCikkmamGVVTZVgfBcBqNGew4pUlJmLOXtAWHq7tcRDsYGdAUN7I6xzBBuQpvdX4kiOFOOmjRndWz1stzOwxv/J+kV7T6diazL8thLomQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgP3yGBmOHh5F+AwHUnq3h2XegOHGxYPE2nXEtz73Os=;
 b=Tr0dVbxf1qfT+EZFc8Sb4JvjnbGqkbwBJqS7kJMaPuxD1wvwSG1FfQMfOXXZBXTJhSB5xM1sRIQRCNPl4+2DTAp+ufOoq9IFZxHh2W4cKzX6bs+NFGcs8nsAteN8FillGzOwviMrp2e3zLgnpp6zJYJerj4/ZlqTwVUVTgmq27s=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by AS8PR08MB7790.eurprd08.prod.outlook.com (2603:10a6:20b:527::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:10:11 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 15:10:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd: enable coredump by default
Thread-Topic: [OE-core] [PATCH 1/3] systemd: enable coredump by default
Thread-Index: AQHdFGS2fCKB6A59rUCPVPei5GPjubZurzgA
Date: Wed, 15 Jul 2026 15:10:11 +0000
Message-ID: <B9C84703-F43C-4DF1-B9ED-46940427FAF7@arm.com>
References: <20260715141728.2384771-1-ross.burton@arm.com>
In-Reply-To: <20260715141728.2384771-1-ross.burton@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
 AM9PR08MB6258:EE_|AS8PR08MB7790:EE_|DB3PEPF0000885B:EE_|VI1PR08MB10219:EE_
X-MS-Office365-Filtering-Correlation-Id: f543213c-25c5-47e5-b685-08dee2834fea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|23010399003|376014|4022899009|366016|1800799024|38070700021|22082099003|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 
 YVm/HT28qJ4hRBnJiGFEQKwlOxcM3gDyjO0BIMYeiu8PNULZx03S8BYDgUL8nMPdCF7P2sMNq9GRhl7d/9E6ByzCirWBWUteBVZNZQdlz5m7zJOMxyrntbKPGVbNc+H/i/v01sioP+ylxkUvCY7w3IMF71Djc1NSjIjbs1xu4ZxsA8Pm1ASxEEcbSbXXNeRiYbKBVp2fe87c6WAqHc17286xV2odErrAteLLAGDpIkkKt01SuzrmbwQc48b/gEaOLe33hZex70FwUCAgUnf/QsWJ6IDykbu4Mpc3MHy8BrC3izr5X178pXLd3vZ5zmFUbV+rfPhllYvK7zzNhTbwBsjFP6743E/SoislPzJZCXq+R8HSh36NvIG9JBSOURy71ZQSKFhvTtja2p4ICbuJcuK5biVBw4hi4C6hiUXwkAxY0ZNHGlrFyW+AftbUWn0YwhE17WW8Zz1OESdzKdvok46WJJiL8bustlt/iKbJwawONCh0r7GUSJ0kInSM0Du2GleRuOPNaxuMJj93znkFjlx1aib7m8qmwQLCFMv2+wujjeSF4R7tNDdoUzMrYYbmczkJtzC3FreH2WI26dXMhzviqvsYhqetDGeu8oSf/yh47bSq/2PCYFiX9aJseE+2mZ91/wl1ej+scSRXqsqlrTavYclR4T24FDVjdQZp57Q=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(4022899009)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C4D6A53F03564B4EB486F5B993A380DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 sOf8m+Q4yszhUriAZb8s8E6B+QlM1FtxoyKf30+7sjA8xqbNygg2zB9WQxBmQviHxlMn2Qe14e/hyY7InygvqgMPxFgYg8qwPR2ECX2XJiWbQnB73HaBh0MO2Y3n7n00CCdRSVbAhhFrnjB1L4l1vTV5oL/4rTmVT+ZdSUQIue+geoDqmy6i4LiCqFjSipv8SRmUvb2n3reua66lpcj+ggKI7U8bm2N3JdR/Y2d6j7YnkTRbhP/nQnpS3U2OT3srAO0bW8ufqSLRNADCajXNlu0rI1QIOElGQIu+4aHI8Q6uUhGX+nZFQ7KtnmiwteOQj2/Kbew8ArX45rKQ+1RbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7790
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
 e06e3e8d-0cfc-4da8-7359-08dee2832a50
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|35042699022|23010399003|14060799003|36860700016|82310400026|4022899009|1800799024|376014|11063799006|6133799003|56012099006|18002099003|13003099007|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
 m3cWap421z4ylkenWI+eXNdEY/6jMRHDErszTB3tWQa0U5D8tgUFOl4UzEmQw/BuS54SPJF8z/KYb4MxblsNGEaeZItiGRRBzBnkHv6vaEZG9ISqRiRYNW3aGImUNsTYFYdRV5veY7XUaljFcwJ3oyPbI+jJqf5MyEV++cr5egnEFZJUdb57o968QXUHUW3oJ9UjE63nsJYTULiWVOCZ87itUbYU2tfaMQFAKxApFXhQAvzrsQqJeY8EHitwOd36tG/Ifq9P+v9hGORaAK/BMdiYZL6kjEycezNQTwuAAtBlqIIHJvejSUjjT6OyY/FBtQftDQXl2h0eoHROn+oewRQd3XTIIvgSf/k7P48c359LrQO9G0SAPV4OwXHpz750mZf1Jdil6QvP7FKLp72sX96FwhLqVdU635Tt/FeO1t6pS/ahwy3Q/L87N8AKgbcvRhAOKjHfd9MObhGa80LRPWxv9xm1qPmkg76CUnoumyV2LzuIPhdYgoJ7i4EwKPf6/4OfSFibPZRHN/FvuFX3A91IrRxFUvZ7zZhH5XDqUe0S9AedEETHqylbC5nQ2Em0YvPKKauxTzqpn3qzmofMk2gUQnmr64+9ThY/Eo9HGMTHYRL5VCpYVQtU17kMdtYpt+A8AxGEXi+hTEnd8gFVcao2e/YZc0yX0/CNHzxUCVM=
X-Forefront-Antispam-Report: 
 CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(14060799003)(36860700016)(82310400026)(4022899009)(1800799024)(376014)(11063799006)(6133799003)(56012099006)(18002099003)(13003099007)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 749WGp6/7A/NNa6ebCmhUayQ8KPGvWGuDeH9sSELVWUNfUcY+8hckidwf0PVuuoJcxczW3qo2VJrBaKMOr2WyX0oeDEXA5EEpAFpLqZ35wNPbR6h8eVO7g82fADlyRcoT3E2IQEbxg2740ajNIKKy+xDhKwA0SePfFadPoanNB1Ho3pBVO6j37n/rtWgnDpFRY5jfrijlkcomPdxpvDH682ozjctw+RF+Z3jmDOVALcbZ4IYQrToD3cfcFf5QApqIcerMyJ5VG5yZ1k+1KeVVYx3IwE4NWirt2usDLkbU9F4vLLU2xDSzdFdLmDJk3ZrS68eu3crJ7M2I79Y9qvU/VlySg4e/MtP5IF0BUWPQQcjS1WYKUJgqMkuFEy47LIzvb+s/pAKgHmbQUXwHzEMwdObqhGXgnUk80C0REcAZ9YSU3qar66ktR/5cVQ6jipt
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:11:14.2202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f543213c-25c5-47e5-b685-08dee2834fea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 15:51:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240983

Almost but not quite, to be useful this also needs elfutils enabled.

More incoming shortly...

> On 15 Jul 2026, at 15:17, Ross Burton via lists.openembedded.org <ross.bu=
rton=3Darm.com@lists.openembedded.org> wrote:
>=20
> coredump capturing is useful, so enable the support by default.
>=20
> This doesn't pull any further build dependencies into the build, it just
> adds coredumpctl and associated services (+140Kb).
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> meta/recipes-core/systemd/systemd_259.5.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-co=
re/systemd/systemd_259.5.bb
> index 27722f97bbb..356a10b4b61 100644
> --- a/meta/recipes-core/systemd/systemd_259.5.bb
> +++ b/meta/recipes-core/systemd/systemd_259.5.bb
> @@ -52,6 +52,7 @@ PACKAGECONFIG ??=3D " \
>     link-udev-shared \
>     backlight \
>     binfmt \
> +    coredump \
>     gshadow \
>     hibernate \
>     hostnamed \
> --=20
> 2.43.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240972): https://lists.openembedded.org/g/openembedde=
d-core/message/240972
> Mute This Topic: https://lists.openembedded.org/mt/120281508/6875888
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ro=
ss.burton@arm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


