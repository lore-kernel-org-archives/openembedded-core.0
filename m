Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A94FE7718E
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 20:05:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.77])
 by mx.groups.io with SMTP id smtpd.web11.20895.1734984317855565748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 12:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=rPYpPSQv;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.77, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pj0rMrr2skij4xEOo533KiockFTxaVB+HjKm/Tb3w24sFKbCmRWHkGMcSqhZoVyu+EftLJlJ3pJdEoSpljf8bd1SvltMya1o6OK7db5U0HQqYZ5xYvFiyZbHqzXDYP6ABeY0XJZ4TsjD+wDGEw2/GGXf3/KMYdV2acTcu01KfKdI7NAnGznxp3m+pX8JZpIB0tEKeN24KBq1TtP2TRQSZK4nFO+8y71VLQ4tz8b+fyzACO3p7XvW18SbOhIfkGjywCR9lflGlQxPhNdbDaZvXiE8R/g90lx0mYglX0KOdJpX4rfGTActV0Ei7g1ldIh6bDk+iXeG0NFMqnpDjzL+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=AQPouyolWJ0MqJqVfyAE3/pzyhLZe+jo5DF7KQk6TJ+eOvFhtoCB9nc0OlQ37JLgymd5oG3uXlElvzePYUEEZj7ttZasSwHw3WBMjA3H6mS3HbdlFZyzJz5SvtXj36Ij3y8v+UHVelL7Xv2fzNruIyBPn6vHXWoHJlRSfdOrFYJup+J08ew2AJvtbMa8NOcXYVOJmf1m+kenm/Qlhts8iaoK63uH3+dRyy3wWFKYkZ0NoJLjblD3Rwn4Lz662K3KL6xbXT5KDI4oyC0cXzIxcm4jZExKOj15DMDBBvUGwk6JeZAjCUHRt5VnyuqCc5+H3nRzK258nDFDL1/MUOwA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=rPYpPSQvtVl4RVh7+o44ozQdmzlQ7hIopzRjKweFKCxDx/6RMXB2hNwuPKyCs9WJHsBRLq3ToGqddGDN7ukO+Z/YHkQVop0UinXBinKNHmCwXaf2lNkusxZPh6naXQ8FyZpBNZFD7UD/1vab9EsZNfKK7oJboZhRlsHzCxuKrzS7MSD96hd8zPuLOo2FH7fkRepX9U66QoCUnlyppQ/sAYC0E4O1iRh2b/p13uK/cPKN+hgpNvesG0BY/GYa5mpeUETE3nQOEK+P+3u8cTA4VHsiSs0rhmn28+dkii2y2EBjKJpnzFJ35MIiW7U50GAwz/6obMMfrOXBFPDKFswT8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8157.eurprd04.prod.outlook.com (2603:10a6:102:1cf::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Mon, 23 Dec
 2024 20:05:14 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 20:05:14 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 4/5] weston: Disable unused tests build
Date: Mon, 23 Dec 2024 14:04:55 -0600
Message-ID: <20241223200456.2504683-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
References: <20241223200456.2504683-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c939048-f9b9-4bd0-7e96-08dd238d1d29
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U+usTmHcjXUBvhKdVX5Ym5D8UeiVmd1dD3zPopk/fLhc1Aqc4EWVj2vg2Uq/?=
 =?us-ascii?Q?2EFb1byRi/ZyCjvIh1/xLSPQ0t5ABgAq7KaA5jdVWhnRisBBs4LUxC2K/Bka?=
 =?us-ascii?Q?DOG4ILMbPK0NZeG85IE4PtxtBzQRa1XeoeQbk5+xtx0i3blii/dloqoOfciN?=
 =?us-ascii?Q?yqOijsYEI95h5XjVW5ZbcOfKWrACICc2iMrIbmlgsOpJPHzOoD3cLeqYEaih?=
 =?us-ascii?Q?Jf7So/mt0ibltS8N+HaV6A9ghbh3VBsfjPp8Pux9x8XqhvNV8/C5q3BLUOZt?=
 =?us-ascii?Q?3MGU77UxGZTLbzHtrRbBjd83KLyKKl8tLx5mbVRzhc9k7vU7ouMuWKIjXaTk?=
 =?us-ascii?Q?/ybuLAdHPS818H05uqL/4279KeBXQ8c4AkjdfKxgw/aN3qoVQuiwxnO1+YOb?=
 =?us-ascii?Q?6Dt7qtmBgNupqrGH78e/k19MflPqguRCSuVNwJVwBSkdOiHPjbYKXqe1ijlo?=
 =?us-ascii?Q?ba11d/5YyAR4zh199sxTZjiWfXmomwiTT883h0uzH40AqLpoduW1yv0dsEHb?=
 =?us-ascii?Q?TwRluXvqPmcw+dwcfVpNAUateHYpSzweYAWnbMrzZuozUOA6StMrMAi9qSrl?=
 =?us-ascii?Q?APLzBowS/yR+7gY98HGSDA8AkQVL6RHslNH9xL4dzivMFkhkcRDXXRwzFutK?=
 =?us-ascii?Q?VXcF60YkasCuxiOobeVFI29R8XOZDmO5WogkKAlVKaS0AY6FjHacymMLBBPA?=
 =?us-ascii?Q?U1c9Sc4lsby7XmvY43Hc7JSGzqZBi8KNduWRl5LexjCtM9QFiS8zFSVr2NC3?=
 =?us-ascii?Q?K+WBCLSQBBoC/7enVQi4hVfnYir6aGpX7D7E7k5NWKPA5+owo6wvZFsAmxYw?=
 =?us-ascii?Q?KVLz75mr8brbOOgBzagEqQxMcZab8qZyFC36FxFaSWt3HjSZIjO1u3V2fSKC?=
 =?us-ascii?Q?6yjiVwurHTfXec+T3bqHlFmXogNCsA/rqxcA+uBBv/LQR1q5T2kolL9SVBjF?=
 =?us-ascii?Q?5Cym14YBwkEcsG2hOG+pCMb+hHxswlrPqEsGlAniuz5dfInCDtpEzaoRq/OL?=
 =?us-ascii?Q?0xeW/PHseMDNWokPYCzbr1dRHx8mK7zGOtqsdI2uZyc3ZN5zwnKxD2LY3FYu?=
 =?us-ascii?Q?wDXEkVE/csyO3CbPTV5Amk0qm3e4IvyUf8KjVpPYelZtP+ZXMCS2abvB4PKl?=
 =?us-ascii?Q?UIFaCNsskuS/O8l9TH6uqoGYYGIyVJUZIKuQ46MxxGpYwauD99DeokgP4bo8?=
 =?us-ascii?Q?BDCCT1t3xeU+JJAPSNOUL+60fSECQ45q8g5YxPUvt8ZotYO/bB8Velug/Z/v?=
 =?us-ascii?Q?NSbXaoLmP7+zo4ePdyQizyhXr0AmZ3PzOuuwpUateLuFalJc7YWakYEndBo2?=
 =?us-ascii?Q?MDynrCXWkHQBF7I99S80WPWpR8s8bJ4ub/6Pr7+DvoWPGaYtQUdkSG5GTqfw?=
 =?us-ascii?Q?YxoqzSIBXFlvHDEp5KczQFJDjgrphrI7T8yLViLdRlj4o3DtwRbuAgGuVUbj?=
 =?us-ascii?Q?5lwjuhRApK/B8oqnD0eyl+WW9kY4ISrZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+PiHal6qSchivrBa94exLr8RVlxHUHpwCHF5zgHELJrLFJnWiaKNSTEdBjUP?=
 =?us-ascii?Q?u9T/bzSW91+lXBaLxzyE7stCOyiVvwpzi0jfKBpMZ7cYNzLOkiQIDyhBzpcl?=
 =?us-ascii?Q?XEDpY/aNySZId2cNTZqUO50RJPf40AB02RoUd6y8d2SV15l08V1ys9Z4PJ6Q?=
 =?us-ascii?Q?adyVEmgyJM2+FHjqA0LpDR/AswW0Z7UqfYFBL40mEvYqEILjQqgu5oxLnlIq?=
 =?us-ascii?Q?lR0cJ621OsvTqZv1vzwKk3oYIjNpTD2G1WVW3lkfYbd9QcfQtHw+ZHXK58qh?=
 =?us-ascii?Q?XqmgSY8eJZc3DXFdz43Tuo4px9r/CMSXqgXRlpJtnscM7BkKKodL/2/MH7CH?=
 =?us-ascii?Q?qMUbnlR+7gwQ0ZcsmhCSDVlaYedDjwHqTKXL5CI+RNAvPqleOYFr/mGCeuT0?=
 =?us-ascii?Q?ORcCBpoc0uu81wocKQ2zU3bKCTFBW13M7oKZTSZwuAfJkzUv7vRLTu2mfKNb?=
 =?us-ascii?Q?0JPfLEs6JmlrCgSD+dsTzPeoyTKPu5OXIYWEEQlOiExTy4qJjHaYGMfqRexn?=
 =?us-ascii?Q?VqqZGThA0Fe4vOKTJ9C6MSjJFnwo+rNaK1pgnEA8yIZIRHnq4t1eaNOIReuI?=
 =?us-ascii?Q?eNc2OqnQvdY4odsfzQ/Xy1Ke5/DIn/4yJwnc4QPcNUo9JpPucYy6F+eY0Nbl?=
 =?us-ascii?Q?IRHjovUzWUnMpmNHit8APX1tinxYcuSGbttP2C6ACYCWWwmMkktAnYYnoe1H?=
 =?us-ascii?Q?1MW1H34D6QYafL60RpybqMw60PMR749we0NrJ0miWf0qRZIKTzCxN6X+hOqH?=
 =?us-ascii?Q?tFyZJBJOZ88c6AjGtazlWRv0x3kOfk5qa8OKV9N+McTnNyeeSaeuS5KoFRTm?=
 =?us-ascii?Q?M39bWAEaOGVVFEgrWm3K1UoI3bdqI7CJTOJdNZRI5tjNHnG7oBgoLiDs+GdD?=
 =?us-ascii?Q?QM+F5jFbUjv7yezPQ/2G+fUzHDaZa1kIZs9IOrPgy5aTePnBA/iPQFXS3T/W?=
 =?us-ascii?Q?wGOUCGWiUw14mu9uWxRBDA4iKfZfOiahW1sfVybB83IgWD6i6lYi6QTY4UB4?=
 =?us-ascii?Q?EFGQA1AURqbVuvasC2M5OcTBmJzxmfHjPxIK+YzLDyR4WJu6GNFkZvZty8FN?=
 =?us-ascii?Q?E3PEDr/WfNZjNbUYzU9BAsurbz21MV2QJVu8D+1cEgo0PAcgUjUCX38SmJSs?=
 =?us-ascii?Q?WQGNC2UiTY48/h2DnULGLKxgLNNOfTyosCZZ8NQxye/LmxxmgAeNjEWF5x0a?=
 =?us-ascii?Q?CtTcOnO4vohHQZf6ou97KKdMQeVkrpbhmcpuKm3MoBWpGOfxzby/sa6pNPcU?=
 =?us-ascii?Q?o5EFgDJQt87Au8G0Exz8PY69Y7sglBOf6T+PhqnjEc8ImGXuRazJvAXSZ2i2?=
 =?us-ascii?Q?Y9HFm6QbnS+3Yv/x5r6nXYAsOmPQhzHEH5HtDDl3s66U2kI4wcEnhDjidv46?=
 =?us-ascii?Q?timJPUygo5jIwB7nYLR5AUxF2UIJmwC+nsbWi9Bwqi39Z275a5BgAc135Ne1?=
 =?us-ascii?Q?3ODupU3FHcoTM2m2I3rJIDxtaXY5TOMg9MN0OBLr/FvL4Tqh+R5qkyjSLAyC?=
 =?us-ascii?Q?1t+l63TgOtzOKN9Sv5yaQjvlwkCVQrjQt+uUsvIJdvrFr/kq5p9QHEswp2B7?=
 =?us-ascii?Q?IySYvU/EGfx1wo0PHlUzlHYaLthui3dUFQfYQj9Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c939048-f9b9-4bd0-7e96-08dd238d1d29
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 20:05:14.4862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mG+B0mLIlbGblvOzsIQ7jrVTF68D2QCh6j0Fz3+EgkkzRSc4mSciO4SZ2tvLBA/v3f7hmaTOBSxht7Dg/zd2Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 20:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209051

Building weston with core-image-weston SDK fails for xwayland tests:
```
Run-time dependency xcb-cursor found: NO (tried pkgconfig and cmake)

tests/meson.build:357:2: ERROR: Problem encountered: xcb and xcb-cursor req=
uired for running xwayland tests
```

The problem is the tests folder is built but not installed. This
behavior seems to have been introduced with the 12.0.1 upgrade.

https://github.com/openembedded/openembedded-core/commit/be7da75827b4ffee3a=
243f977faad429dd9fa21c

Disable the build of the unused tests. Also drop the xwayland
dependency on xcb-util-cursor since it is a specific requirement
for the xwayland test build.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 4cb0ca4d5f..2a0a403d99 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -31,7 +31,7 @@ LDFLAGS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'lt=
o', '-Wl,-z,undefs', '',
=20
 WESTON_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
=20
-EXTRA_OEMESON +=3D "-Dpipewire=3Dfalse"
+EXTRA_OEMESON +=3D "-Dpipewire=3Dfalse -Dtests=3Dfalse"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'k=
ms wayland egl clients', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', =
'xwayland', '', d)} \
@@ -72,7 +72,7 @@ PACKAGECONFIG[webp] =3D "-Dimage-webp=3Dtrue,-Dimage-webp=
=3Dfalse,libwebp"
 # Weston with systemd support
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd dbu=
s"
 # Weston with Xwayland support (requires X11 and Wayland)
-PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xcb-util-cursor xwayland"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse,libxcb l=
ibxcursor xwayland"
 # Clients support
 PACKAGECONFIG[clients] =3D "-Dsimple-clients=3D${SIMPLECLIENTS} -Ddemo-cli=
ents=3Dtrue,-Dsimple-clients=3D -Ddemo-clients=3Dfalse"
 # Virtual remote output with GStreamer on DRM backend
--=20
2.34.1


