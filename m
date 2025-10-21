Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59AE7CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 17:03:16 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.89])
 by mx.groups.io with SMTP id smtpd.web11.18340.1761066190493685893
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 10:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=znVOF/iu;
 spf=pass (domain: navimatix.de, ip: 52.101.69.89, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAOpAONJxXbrzRm0Yo8UjxkFsz/Ak0xtLtVqb/0eBaiEPTHoEuKRtX2ma9BMvsvm4S/AMHy2sWEQ2B41NswC7MydGlE96scnG8fMzvepnk6XCcekUYnYZaH8URzWExaUwTIlXQSd0aElmFYzS65fFUl03NJP8/9OwQ78a6i5wyj0fG1XZulePmttPEmDWp2+jP0mLC4EKt+78Vb6o9V8598jl10a/LdOcQApyDg65VWhDZ9WsCoehspXqlGK/jw/dENkKoV5OBe8pdRESei2m0deS5Wiu4D7BIt6yLpuH4zywZktQwCuAJWSRd1m+/eDnmObgI/WbcDb9rOeNMDwig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pkjz89M6mNNyVH1+LSBcT4VQySAyhqJwyF0tcbM5Qns=;
 b=Xrz9dbgn6zbnbJKWj5YM4m75682WTKnmJ2t11bHaKIxIaX+uMTksGSpw8XCc9qY6E3Ab6O2WhDSoG+A+hoL0ucVGD8HH+iPsgDkWlrR1uG96fgIVxBHJKeo/ijm2FquP/kX6Kf5HBOLERJQmZoTDBeMlhDR691I1pb/Sv0nmt+U44dZXDaBzqNJwhzUdF3SeBLxelvUzAXNK3N7a4cyV83EAodJL/5UHPxzlbPKyExONya59omSCsSYl48lLsWEeAtsHwQfhfh+gULrQ/6kohzSxCxri+9ZeO5LtT9RHl/jDITljkTv4TDpsomeGJQPbWLWCak+XwKGf4igWuETbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pkjz89M6mNNyVH1+LSBcT4VQySAyhqJwyF0tcbM5Qns=;
 b=znVOF/iuXIe8diyv5wA3AGBiqE9FzSfy+SSPjghIBraZZH4T6rRIsOZ1kDOoAj2/fxWxifYukKI3xpdUg9pDNqoGxPeT5XNYbPIZFH17dg+0nco7hyGrxy5Blph1FqimMXxlORSPWDEl6H03kuPYLxOXoO5Rq9359e78GUv5BUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AM7PR01MB7025.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1c2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 17:03:06 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9228.015; Tue, 21 Oct 2025 17:03:06 +0000
Date: Tue, 21 Oct 2025 19:03:04 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, 
	f_l_k=t-online.de@lists.openembedded.org, f_l_k@t-online.de, joerg.sommer@navimatix.de
CC: "Markus Volk via lists.openembedded.org" <f_l_k=t-online.de@lists.openembedded.org>, 
	Markus Volk <f_l_k@t-online.de>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] gtk4: update 4.18.6 -> 4.20.2
Message-ID: <937cd285011380f8b87aa2ef557ce3def2c656a4.1761066183.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AM7PR01MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: b379526d-ce1f-4daf-b7b5-08de10c3b42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?V+Z+dABCu+HqdhnbBF9/NjpmVMkr7SUkzEzl+OQGQ+6Y1La5RcW9NpT7GlSO?=
 =?us-ascii?Q?vixT+1PtVV1qazX6VIJryC5+FpMAKX0qQYzbLBTSJxw5AZp9gwA9QSrCh3Nd?=
 =?us-ascii?Q?i10jEzX4lUwKzseLfdpJgYapTBc+aqXMUGERO/LSwZAqCsfd5PEZxv2Pzro4?=
 =?us-ascii?Q?b2LBprH7y8DKcVMhap7QwT299ud3OtxEB4whEfXWxmTI3E3pDRn9GzJpfH2w?=
 =?us-ascii?Q?23rAK+6KZtGG1057Vdp/fUukHeYmUDAhWTWfJSG1cOzfMwdDz37SRvJmogou?=
 =?us-ascii?Q?KFb3GKJsRcqW2mrrjLLglGZ7iaEvbKgx78J7x2bUFEnT6HAmpjXJMr3Vfbv4?=
 =?us-ascii?Q?i8yMxVlQ1w5WgPpQJKGc9D7v+hzsz//vkNW36sb4OfxIljulkJ9pCFFEgFEZ?=
 =?us-ascii?Q?DI9NnzVGm3S1MIf8v6SgrVMM0jUiQFewVI0ugeKVTc64U+LC2uMQsfxJzuCc?=
 =?us-ascii?Q?6JCoYNiNc6cw35CYdW76VVFFoGULQtaWUvBnGx8KLhTVuxfYKjgwL3sHuMtW?=
 =?us-ascii?Q?usF7owzv4Kz0Ohg9HJsldr08v4KW/fouacBiR9VzPrRtP+CUKQq55OX0xprj?=
 =?us-ascii?Q?b33LJRA/7VgA1N9uoePOc4kSf7wdsREBZ1proQm3mA2PV1zN3vOvSJOMtYmM?=
 =?us-ascii?Q?Q5rNzSZC3NWTXEb5zy7Rlz7AE5Jm03PJWX3JRdf01Awv1aK9CCUcKPW6sSZS?=
 =?us-ascii?Q?hsxq2IvCP0aRNCE38N25HtHHi46oyNmyTZ6C/MQ7iiIMmzVWxURnOImmWQdF?=
 =?us-ascii?Q?joH8x+prHtgEl6TsvRMcS6dICt/UMraV+TInpr8EF2QKcu/gORfbdttyPqhW?=
 =?us-ascii?Q?4e9GSw58s3Kx84jsQqL54aSe+bx1W7ljzxPfao/jnM7qXuzdEYj+zNKfByuB?=
 =?us-ascii?Q?hE7JTMF/OSgErogcQIMeNZx3otR123yIzyvoj/0aalrWSw8ivIIxh6wM7onz?=
 =?us-ascii?Q?9S9/vtfenIUHsEJ5hDsPrCk3ek1Bu+A4gFs+uDO36tu5Mw3Fxux3MAbj2XnW?=
 =?us-ascii?Q?00xmX++C4mSWmwlSf3zqM1iYctNdyzCIzQJmC0fD865OZuvOIWDe8oZ5iUQp?=
 =?us-ascii?Q?2zh5/v8qFj6zCVmEPRhbr+nYgqqAUHcb76Fgg1viuY3D4i0ZEjqylhNFq0/n?=
 =?us-ascii?Q?wF+pwrls/7vgO6w8pWd6PbYW3elNtRrdrRIK0FDU3lvAMgOmn8+QBSycztrS?=
 =?us-ascii?Q?iDpiZHuG/yZFoW2Phz1813tA0XWCliMmxSxbyvH5RbxtMRpOlO0gD/3veQFa?=
 =?us-ascii?Q?3a/oGvL1Nhzd3BE5B/TQHxdYyISnI1ywryivphpbj13QCosmcX5uYahE8ALh?=
 =?us-ascii?Q?qeq0Dk3vQDI1HAUjaBGP/XrI6cbAeIRGrg0KyDvrEH3zOMkcB1HofiKBeFd4?=
 =?us-ascii?Q?QLUBMt/9tOryq3X0mI8C4lE8Qxg0sh9snj63AARC+hLvPGOMmcIpCZqUThpG?=
 =?us-ascii?Q?dn2kiYCtX0YT39P3hKWz2KAqVaGPSh72?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a03TpvdjbVk+ELl94JmVT5fvM3iPaSJeHf7/T10pyt7uckq5O40GxgmFHjC/?=
 =?us-ascii?Q?JgJnjdohp8wJCmCI5cn93zG4hidr67s9dboC7QXo9VLIzkqoFUKIpgGwAgiG?=
 =?us-ascii?Q?fB9VZSuZa4hJuMzsYYlNJKqjIdyz8kfgPI/sJ/G1aKrrypurVES5WD6JilI1?=
 =?us-ascii?Q?5PlgJf6GHKmjJ1RBmzREwI2XX2C3Do8EV3/U1txunkXg8KtQsV77eRLam9u2?=
 =?us-ascii?Q?pqkVQY/4/I1dAkeTzeENO5CW36mGtLdDYB7d24tbng6g1/bkTcYKf2hgCEhF?=
 =?us-ascii?Q?BDhUaVR9wiJLGQqk115APuYIXbsi5wdIAP6L5vvADYnNoeTE6u6z/DYwUrgY?=
 =?us-ascii?Q?6/9lvilMwUQi4jEYC6a3kZo48qjJOLKcsamDW5DDixnxisNHoyjO8GqVYofR?=
 =?us-ascii?Q?5SEP6BCdgkQ0OCRlePrxbpmdtVP8l1DZsDqHDC8uWEKDbfzfo27ZMROQAOhn?=
 =?us-ascii?Q?V+ZRFVdHUUN7vlNfEjkRg0+NI1B9GtvimG7FAWBjhj4+G07uW3NtmLAkqKKi?=
 =?us-ascii?Q?8RjzcDo2taxWYimMEJV/GBA4+5vUFv4NJ/puTxaBz6PM/aO2QIYf58anrzUK?=
 =?us-ascii?Q?RWKyHsB4vcvCOtlaPPF0TJQ2CfNagB+dmNwpzKkaRPaOG6LUSxAHurVKzjbO?=
 =?us-ascii?Q?PP56dDRsJ1/4+v1WX6WN6ihkZOz85a7sqqyWFKPRBUHOuABfgmrt+8Bn48ra?=
 =?us-ascii?Q?jEyET7HJ8NTqY01piPrcXRjNK5jmuWs3TeI+nKKzyOSzWKQnLF6L3gmxwa6+?=
 =?us-ascii?Q?1BY/GqowqykGRoU4W2rKF9bwCbE/QK3oTeQRGEzHHq5OhCIBHXLcvMXYvHVb?=
 =?us-ascii?Q?dKfM+ErFeLNSE1SrGfChStq0JL6x244UFkqjSCaPur4MPLKWsM+o+tP8SQV6?=
 =?us-ascii?Q?1NWIWYUjJCuSOUIqoNxjuH3FARRKM+3LwtoLgwt194X8E6s9Uu27Lhyh1rAv?=
 =?us-ascii?Q?F1ZIbqEfjhIwKcyeEX6TjKeU1irQgxuDLlG/MG1Q18kcJBB3tpO7+2OtdNb9?=
 =?us-ascii?Q?hg6gk3xU1CkLXqsg8zvHc+ZTMjyEzJFDhGiIr/E82QH68J2hlD6e+D4TCNfq?=
 =?us-ascii?Q?1vWxoNWRuG5Uwrr+eQZCCNXDOZoVfZtKwuZls1QztF0paDfp459y50t9r4i6?=
 =?us-ascii?Q?gnCyzhrjMZCP7E20waeyYU+CJ3MMS+BZppo0t0XQQh9p4YytRf+CY4PdjX81?=
 =?us-ascii?Q?F4IOcFDkuvCVJQ3Jr4m7u9NQ+1OxHwXe41biGUryKcHXigjHNVCxn/N/Gwaz?=
 =?us-ascii?Q?ZWVPo6R5TbNQ4hIluYlT4w5IJuDOm3PBCNRbHUiroqAznFy+GGr8DQQPDCom?=
 =?us-ascii?Q?sxKbt5fSe8odJNjKPitg5JZx56i9puRx7jHtIQ1D0rKydl3yVp9KeAM8cIHi?=
 =?us-ascii?Q?MsDaJ39qrE3/zDQbuxrBNmWDMmEyp1pvMyXi4NsU962sNH0XBC5VUEsVnEAm?=
 =?us-ascii?Q?CknknNaghjcfI/z56BgixoL/v2xB39hPjhgejy+pfI4olZQgv3UdBmVpl/bf?=
 =?us-ascii?Q?lh/xbApXVHbGhHDWe4g5hurC5nwiaIZzexzx1XqNpa3UL5NkAni+wBJmez6Z?=
 =?us-ascii?Q?PiuTCURDaBYYXdkL2PYeFUGQDC5xEZBtsbphN3OUpALH11yJo0hH9KhDBESG?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b379526d-ce1f-4daf-b7b5-08de10c3b42e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 17:03:06.2547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhbbVK3fpqfY4YBQdaezjNSe5y9Dz+6JRahZekL9nfCiQ6UOFTO5b2ge38WU1RYlL0NtTG/bIC5MX0tG5SFxOa08MJd965OvgY1tSaRLNvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB7025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225155

From: "Markus Volk via lists.openembedded.org" <f_l_k=3Dt-online.de@lists.o=
penembedded.org>

Changelog: [https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.2/NEWS]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- remove gtk4-printbackend-cups package
- update download URL from ftp.gnome.org to download.gnome.org

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb}         | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.20.2.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index 2d24468dcc..ee6a84d7c2 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
@@ -37,8 +37,8 @@ MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 UPSTREAM_CHECK_REGEX =3D "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz=
"
=20
-SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${P=
V}.tar.xz"
-SRC_URI[sha256sum] =3D "e1817c650ddc3261f9a8345b3b22a26a5d80af154630dedc03=
cc7becefffd0fa"
+SRC_URI =3D "https://download.gnome.org/sources/gtk/${MAJ_VER}/gtk-${PV}.t=
ar.xz"
+SRC_URI[sha256sum] =3D "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f9=
0e010e10bddc5c"
=20
 S =3D "${UNPACKDIR}/gtk-${PV}"
=20
@@ -69,7 +69,7 @@ PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DI=
STRO_FEATURES', 'x11', d)
 PACKAGECONFIG[x11] =3D "-Dx11-backend=3Dtrue,-Dx11-backend=3Dfalse,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes xinerama"
 PACKAGECONFIG[wayland] =3D "-Dwayland-backend=3Dtrue,-Dwayland-backend=3Df=
alse,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cloudproviders] =3D "-Dcloudproviders=3Denabled,-Dcloudprovi=
ders=3Ddisabled,libcloudproviders"
-PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cu=
ps,cups gtk4-printbackend-cups"
+PACKAGECONFIG[cups] =3D "-Dprint-cups=3Denabled,-Dprint-cups=3Ddisabled,cu=
ps,cups"
 PACKAGECONFIG[colord] =3D "-Dcolord=3Denabled,-Dcolord=3Ddisabled,colord"
 PACKAGECONFIG[iso-codes] =3D ",,iso-codes,iso-codes"
 # gtk4 wants gstreamer-player-1.0 -> gstreamer1.0-plugins-bad
@@ -84,6 +84,7 @@ CFLAGS +=3D "-Wno-error=3Dint-conversion"
 LIBV =3D "4.0.0"
=20
 FILES:${PN}:append =3D " \
+    ${datadir}/bash-completion \
     ${datadir}/glib-2.0/schemas/ \
     ${datadir}/gtk-4.0/emoji/ \
     ${datadir}/metainfo/ \
@@ -121,15 +122,9 @@ RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland", =
"wayland-protocols", "", d)}"
=20
-PACKAGES_DYNAMIC +=3D "^gtk4-printbackend-.*"
 python populate_packages:prepend () {
     import os.path
=20
-    gtk_libdir =3D d.expand('${libdir}/gtk-4.0/${LIBV}')
-    printmodules_root =3D os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$',=
 'gtk4-printbackend-%s', 'GTK printbackend module for %s')
-
     if (d.getVar('DEBIAN_NAMES')):
         d.setVar(d.expand('PKG:${PN}'), '${MLPREFIX}libgtk-4.0')
 }
--=20
2.51.0


