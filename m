Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52963E7718F
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 16:23:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web10.27158.1734884579574530729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 08:23:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=f3eapJap;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.46, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/sM5vMp+qfw2c70AvY0+EQEUTIcbztNBGypDUb1icnquZshhJhDz1NLm1TbD16D1p70QH6K9RZwc2VE7BXFmRdVxTzdV6Sg6L51Q+s22z2ywif9nKaTkZpcasJCRmH7eHlpY3p66SOjdokPpEExPX7v4GfWBho0j6ufY5pK7im69jJVvd0fDs6AKnUWn0VxxS4wMY5ysw8JZYcfC+lxvEXXjlEJf5oMywLQqj0ez3JDJSQoJ2HZn9xoaMMygLZzuUxlU5iz6MJ2lwUn71v5sdxjxVfCoijDo/XbtCVacQmaZTK2IRi+cvjj+BMh9urx8rhO0pEsxOBcdVrTdfpJ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=bf1ufKFiZJxLz1tNmxALvqW/Lc8mA+ZmgMdwnDY1Z/zSN+17y6gUXtyKp2mVg7EHOoPYOxMA+D2wtsQf02byCGsLph3rfRqEz/YFgOiZAxHwGosx7rA1/Dv3IKE6Y5iqxULbIuCTR4qJpEdqHieIE5f7IRkIfXeQSEwtwWExk3u2V8/9P9+M/TjZeP8VoRmtAsz2ULxzyUyeESY6XfbDwS0Mbh1z3jI4BVv/eysqJ3jRWK3EyaNXtZ1oIIcAD8y6Xki0G7+WOpEwX4rr5Eef/N8uB/pgHbeXQlKyP4qBRGK1Mni6jpGu60PCB1dHMj4zsClSTnDAnjbJbGDJ1NGD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYJzlWO7mg4AaZRYFLBn9yr6RmYVez/nm5cSEYkAyNY=;
 b=f3eapJapUxLV1AThY/O6bMyzFBglGYLTDEcFK9/1ep4ajTxN6nQgIFeNBldwPtbHQtWNeKZScd92cp9JDrPOSUBvsPX3MVfU1+EseiwoO5yo9N/iwBGJ7JWk6En4iUYIWzq/oXemjp7xLgjm39SZREwu2T1m5/0w3pTzDtUzj8ZOHo+aCcq4joydGPYU7rLOlj5rd+tWCFnY88frewvN17+hniRdyPechwaZjtx9ed6unPaPys7LqW6tfclUbvb3IROceStKvZMqPpwNlR2F9ReKPbgZHzmUY+0bMPcpTqzpJCM35gDZNqpQF/nTT46axk0URidDIyGO/zqDIWy54A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS4PR04MB9483.eurprd04.prod.outlook.com (2603:10a6:20b:4ec::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Sun, 22 Dec
 2024 16:22:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 16:22:56 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v3 4/5] weston: Disable unused tests build
Date: Sun, 22 Dec 2024 10:22:33 -0600
Message-ID: <20241222162234.2411262-4-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
References: <20241222162234.2411262-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SN6PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:805:ca::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS4PR04MB9483:EE_
X-MS-Office365-Filtering-Correlation-Id: da2a56a6-559c-4b46-13ee-08dd22a4e2ca
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IWWsxOp/1D096isfzI2vbhsYVjtpBA+6vPyUpmnEt++iMuL3602qbQTOUUx6?=
 =?us-ascii?Q?8QcS9RRyiynP3WpbxO907dOV0SPXVEL0zcpHlkgwq8VD/EKlWEDu7UBcLBtJ?=
 =?us-ascii?Q?omxzkcAFvcu9F4FRoxntyXXxIheid6nEyZP+UYuIk9Y4/QGI0GzdKBFS5sgh?=
 =?us-ascii?Q?x97SAj8X02FpZGMdkhvEse4iKgfcNrYoCww4bsk5DWg+WeTZlhMlSA4u3G5o?=
 =?us-ascii?Q?QbRuMCL7kGqtfVtKR3cEk06rU/xVpAPXVLE2dSNXMR9MKpk+8aM2BhaoT8QS?=
 =?us-ascii?Q?dm3L/G7jXQQfVtrxqahtlOl6tY7+1dj1DPyxZtGsVHx8DGhqCfJP2mkja24D?=
 =?us-ascii?Q?4TcVHLvfvg2bZwA457tsDVmZQDPWMPFPUKSXPA+7RB6EdaqoKgqz3JDARvZy?=
 =?us-ascii?Q?Sz6TgaD4N8lVF9zeRQ3Nr6WqR+5sET8tmbtc0TEwVCzY+iY5PsmbdkHblTs3?=
 =?us-ascii?Q?YT/471yrMz1Se8gnccbqFzrAfQtW7AbN+lbPVRysLC7CxFlfoH5aFNXB/Usi?=
 =?us-ascii?Q?iLgAZYZ/uYNZWqrA4XFe4TXeuLXO1khn9qsVi+NEUQHPoBUfZQIx9NPAk+2i?=
 =?us-ascii?Q?6Iy9XatMZXH/wb/G0+nshMeYaV+MYgevsAhIZslwhUSn14yQLmGbvj6/JQfu?=
 =?us-ascii?Q?pzsRBKh6fKwgQscI/qr8UY38IuEcNuPONUrc9WKFY4HkRV0kecpu6k40cNhl?=
 =?us-ascii?Q?2DVfVKzEC3i3HtGwvkIn9qKSbY0JRfssnaEiLtmlnzvSTP9dLnV/kActQC78?=
 =?us-ascii?Q?sbEPd4Iz1DX2iY1JzVwN10MNRPl9D2ZJtsqk4UksbgnJW6gFxyGjlLJP7Wz1?=
 =?us-ascii?Q?OeelLjABDoFUsH/pJrn/cH2csoUUZvipcJC2E22mwepiEQxvqu+C1pm2Eeae?=
 =?us-ascii?Q?WyrgN21bNMMXVgU/LBC1rNWPKn8hrwW1PStmIuFTzeFn62Xg6hGDDZKMdonb?=
 =?us-ascii?Q?TPS4/xBMLI20YxCt8hiOQGfwbyM3LsZM6EYbt8j3mgDavve2Jb3WedZ1zyLh?=
 =?us-ascii?Q?rGXd2LS25ZotqWfQlgetGBqxjE3Au7Pw+0LOfCa2rIG8ku3t++b6zMMRIhkp?=
 =?us-ascii?Q?BwDkgnjQuJAsH5a91sL78e1KxTC1mUawAW5JeIWEd96ZO4wv3qkLUZPR+GTt?=
 =?us-ascii?Q?FteTKWCL3HsIiPfBwksBRG+kikxjku4S0Plnkd1SGxCK8VhgpKnUKfEmglcr?=
 =?us-ascii?Q?phfWSQ9eKiU0jKDKMv7c6q8bCsTkeBgoi5BXe3M/tGmXl0IsDxn/Ut219i8W?=
 =?us-ascii?Q?qOeN/S8h/kWfeBKDEwHhXXhCbIuzd5TwbxxPNjJ/ynld5sNTJxIeJh/yVgGQ?=
 =?us-ascii?Q?Hou/ne2BAT5Lz/nSwlo8K9P//12Wosb/xsQdisvbYPakErpvk2IgdVIi8dxU?=
 =?us-ascii?Q?V/WmeHjNWUgGFr86IBpU0VgkHOLlKd17OJEdMA4vC2Qw1WZU/KpJkrZq2v7t?=
 =?us-ascii?Q?4BgW+ZB6ojbxrJaBUF60yS8pd53jOq1/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dvXskn0QKpqJc7M8jliq2kgsLJG8iNjV24NdLS0edIXtWpmjDJ/Erh9X7qgU?=
 =?us-ascii?Q?KAenALTMOF6VwpH07ry2FwXteyjmyIgvBKRRhCI2u/0PwzHgrtQp6aHLad2q?=
 =?us-ascii?Q?l5/rWiqmv0CwgbKFFJ4ViJroviahLz/Lh5D1gC5cyVvJhgN66TZsHLqYS0pT?=
 =?us-ascii?Q?Ywds3WJiVt6JeUciBcU7cmGlzNImTf64Lrr7hsCeksx7EwNqOQn0ig8YzBDN?=
 =?us-ascii?Q?ruCYe81F2XF2mqHMPRbxBnCWk70TNJyec1rvAjZT7bLBP9sNbcq+XJYwd/M1?=
 =?us-ascii?Q?AaqzTalkGAcvoXCx9Lpd1UoBA2Ll2Z6AMGtgu5J72LfZIlZBVYJrZg9g7ThW?=
 =?us-ascii?Q?/5OhHieGE3pSFTgkSzjNPgjW9RykvDcnDFk9n54PMh40tcRpvJueBnAvIFoR?=
 =?us-ascii?Q?pk6Pe9TDZJr1WNu/hMTDsLywAqVSpMviVKWwvtyMfxC/xn3MVurHmMrUOckK?=
 =?us-ascii?Q?eFbX28CEHHgzJYeieOKkaN6q/gzBFpU/QaFixVCbqIgl3HVyoH7YOxfK9Gn+?=
 =?us-ascii?Q?GCNBceHm6RT051poAWylwjgVRDO9nojAvZq8Fn5hmjFAlHKdYSa69eYGbvky?=
 =?us-ascii?Q?XqCVe0/SNUEdU0vMDnj98OC0I35ruaEErUcQxI4G481yRC/gMkSKhFLxtzOT?=
 =?us-ascii?Q?z7UpNSHY881SMjwPi3agLaoNC4PyL0QOPsJ+6+XraBt1qMAbtYZS1vvNmO39?=
 =?us-ascii?Q?5dEEWhskdfbiktaowIxZNopIBKrxllOYeN2Z9YEsI2RnYV+p8IHfN6f6GFCd?=
 =?us-ascii?Q?zoDpbssD0ZDHLEDw5Ph9jUsIHBz7UoU1EeU2R/cZRxamItsLqRDFnG86ubjN?=
 =?us-ascii?Q?fFMmybJV5c5bClJ+FQa3s7Pb2+IPhSaSxfWOoEWgCWZqUlpURdBWOF5K/wWr?=
 =?us-ascii?Q?m9xqCpMkQqnW4DJgCGnho8vCh95i1X1DJl+CenOfrOUPJzi+WXoJAnBQXyiu?=
 =?us-ascii?Q?0gneyAXAo4SMldmfylc5B4kvKc1qCspgUfdldTACY9/k8qYLQ7npL8TEaU9b?=
 =?us-ascii?Q?Yw52mkGYEZlL8+GF2h6bbusPm7k+/dOYOJe1ymiJ6lor/FGNP0mLLAUjgdtw?=
 =?us-ascii?Q?lX4C4FAX5+rN7baHOgNCvBb3E6Fy7AhdbJZsbKzRTVZWjf4MUtsbZWOpr7L+?=
 =?us-ascii?Q?61wpWALr7EKdRnwy0nBOYkC/knZ4/HrmmFd6p6DO8z2eL2CsxIardnkrSNhA?=
 =?us-ascii?Q?ojt75CP7b0RcOvBGd6WXbUSOfPvO5j+cfOzQ6R/lTkvXBGLLDyXERu6NA5bi?=
 =?us-ascii?Q?qsqeNxF3Qo58/7V/29HCKwh21dAIuBeZuR5USRf1zuFdJN69RepvMvxZBUw+?=
 =?us-ascii?Q?DshUdqPukdVGn8/KzW970XZ8X6VxzhbJAx9E3VjRLwUTzWgH/A7LdzeSgYly?=
 =?us-ascii?Q?8tVfGSauq4t2yVdQw5LzAYJRN2oehoB+cfRq66pNllMDx4F+MUhte2e8+713?=
 =?us-ascii?Q?hV7PHG+UUkUg56wxSAkKnKsd00IShyn+au7H29UZ4TMHNST7bWyLsAj8ly/P?=
 =?us-ascii?Q?Vtf0pmkxUVMUDu6FaYE3sq5MFDOLXMovmK3ORg7CnGaGVTPA56OjakSRTcgL?=
 =?us-ascii?Q?qSFDavpuYKIbUpYE7mqOemtaOvqJw5T6e/HSfDO6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da2a56a6-559c-4b46-13ee-08dd22a4e2ca
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 16:22:53.2239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxPFiaziekNiByuUKg4eJiZQxpvS5+PgU7nohv1EfXGKK4u39ZmAMFazIkRLgvnySizR70Ls6F+kHbEcfx63Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9483
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 16:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209010

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


