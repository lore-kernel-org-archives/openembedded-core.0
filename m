Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3257CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 18:25:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.88])
 by mx.groups.io with SMTP id smtpd.web10.20467.1761071123203928771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 11:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Kk3D2cPT;
 spf=pass (domain: navimatix.de, ip: 52.101.69.88, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fu2WD4Ssrfm5ypB4/WouxsAIi9zPGIkGpMpQbZG/E6yha4Mdqb82yPI2lB41DYgtmCk+lt2i+1hOv8xzA6XsX74HEBlEpeYUFArXSl6hVSCBhrnjdHQGKrN1XMfZO742VtjRlf3crkrkdiC0qLmsuUnR4busAKt2OteJJOWe/iRHKuqgZqTZ+GXG9yWRd/a5EUhSS6g4A0/sTdIXDHMuf+j1PWkGUG2q0qW/b5Zg8Ya6GDqsXvW2104Xa9y2FRxIhiTPVnQnEYkcXR9waEUydKUUOhmX9e1YV/N+dKUY++6Vr0gJeBtgxsT88jlF54lNspuUTir0pzBUn+VNAZFOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zk23/+nLv8KEGGLq7BJ23d32aqW3+HlYptT8c0D/Zc=;
 b=A23g0k7pd6+EDWil6L3TFSVeU59pF/d1gbNrQWoMfFbQC4Y0O4D+sDu8HwIWSfZ1nlZSQHNKqFBQKPVUGIywhExZ1z5g50aoF+Pcpk+QN2JXMY6Pa6xa+rJfMGhtj8NVTLEzelcWeawHBiEmYet/HDl9i0MHmAUiZ82mpBTn6jRzfqsRgjUlEbva7R+xaGYz5+Z7m54sZuMA6Uo3Mc7CfbaTgs3fmKsgHwsgMpdaRQ2ovd6xQkobwQrvccO2ZWkaeJ+oebDVsO/OipLxUM8RmxgXDrpnQcUUX8c9O3DyQfWGF5/GzAEOl2n8+5kvg0uyjtmRqZRAik6jrU7zWeRWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zk23/+nLv8KEGGLq7BJ23d32aqW3+HlYptT8c0D/Zc=;
 b=Kk3D2cPThoBfEebCP6y4Y7Puou7CMzDattXPS4+869VBtAogpW+m5R+zqiiJNPf7A86F4cGEsfIEGdOVy8c6EZzqTP/LXl2zE9SZo1tbW8JU5CFCcmp1UdHSw8OHqjY8B/0KSxODT/90+mNMyhcSEPPulT7R/Wr9pkVMTIaf/k8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PA4PR01MB7405.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 18:21:54 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9228.015; Tue, 21 Oct 2025 18:21:54 +0000
Date: Tue, 21 Oct 2025 20:21:52 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	=?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v3] gtk4: update 4.18.6 -> 4.20.2
Message-ID: <b5488743ef4865982b2453f617d303efa5763d54.1761070849.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0268.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PA4PR01MB7405:EE_
X-MS-Office365-Filtering-Correlation-Id: b60ccdf7-eac1-4b27-4b56-08de10ceb66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?MfoDXXl9Y4YPwbNe4LqGKwFFOJ6mJstO9sXoVrczBgHn6yDxuZ2fqcD+uO?=
 =?iso-8859-1?Q?KP49BCzn1FUpjDsOpAiTBRX01nBnivnULtYeik+/kxwUIXrbtMCjbSq57v?=
 =?iso-8859-1?Q?exlij5xZixqHx20v9ayXk3NlNZ89hSPQKM0uR/it3W9HWzgjwW8leXsJ1T?=
 =?iso-8859-1?Q?dS/Om5o/x8h3WuwREaIiaNXpzIZtlt0oDV5VVX70nRC5KLnZu4cVxEp1Hm?=
 =?iso-8859-1?Q?3k4jN+ExM4QGpUQTFEIPz+EThy4IZtWQRBbqQXoSamko4sdTG9A6GPQS1+?=
 =?iso-8859-1?Q?aK15ltF2baJLdRRUU1OQiIAsFGq7WlICpt0kMb9UE2biN6/hrGDbc2kTf0?=
 =?iso-8859-1?Q?bcE4Si1sR+4ZQSN4mX9dK3dyF4ZovOBHiwwL5VILoa5fW31wm8JJnr9HM7?=
 =?iso-8859-1?Q?fRZpnoL68njwn0hLfRkVEEzqjhmzHrzcTdGVZQoRp4H3aHiwO8ySC9PiQI?=
 =?iso-8859-1?Q?K6rcYfFlA8KJI/11Rb1wFEc8iddqfw8VNxUjT/3mcTIgJDbi6EO1M2P9vK?=
 =?iso-8859-1?Q?vdaTs8nzXVLdiKtjIukoO+hg8KHYZ3TFKRbo8uadFDOG4lLGpngYYD30hB?=
 =?iso-8859-1?Q?v57uBxx3vjirDcpecY+YfvGWNyis7Yf+4osAlIcigZrlqjphXwBjh0FMMD?=
 =?iso-8859-1?Q?VQ5Au56UltXRgOTfK+hxBMWNKbJBtMjlzBcALLKVhgeHb9JpPeu5cYht8+?=
 =?iso-8859-1?Q?mswjjB7WOKYT3le9kTvKciXUaHn96FX+m/i+Fm9K1t0Clp3L5UYqSYRzz2?=
 =?iso-8859-1?Q?kay+HkjK2lO9+CI6g+o+ZR7DxCnj3p5grkJxfrpCaCiPNph5+m0cWhqvAC?=
 =?iso-8859-1?Q?/UOVpNafeyy0EpkvktfYVcsfcJJiqlMd7trtlVTLBcJH6G7DNIqh360MiE?=
 =?iso-8859-1?Q?ON+9cgdFUu8Z1HgVGsZmpKYZhgHY42VICkMMvUvcI7Voi+ENAumAiG7HOV?=
 =?iso-8859-1?Q?lOPOIIcQ4cBYNiex5Nz4ByRaTCqzgs0uEzWM6GQ3dyaUovjJNyRDaGjzPi?=
 =?iso-8859-1?Q?L1exs/mBNf8jEi5JECZrS/ouMdh1XOGqG9adYkldDpLu0SWomrjYHMpaKV?=
 =?iso-8859-1?Q?UTVU5H7WXL8yPOU8h+j29Zo+7uKkWWcZgDHX6laQItoYMNaWKaqQcElqSx?=
 =?iso-8859-1?Q?xobDBPRD5GdSJoVWEvSLzx3cI1T7YIwW3Tn40+RJbarQYBHhYFcxYsjcJ3?=
 =?iso-8859-1?Q?mebtrdT4qBRSSrZX/zVtLouF/3yvZeqjthTuQI0rmikkIuUIkOI41G4MxZ?=
 =?iso-8859-1?Q?Vr6u5OPiLqoHHJyETC5H7G+CDE1/IYVQsqVr32qY9rhOV98QS0XzFH120a?=
 =?iso-8859-1?Q?2PTR6BgDPInFN/BnPj8YzyUQrdre/vUbJySHGdFcMhQWVzhLIMxsL6UzD1?=
 =?iso-8859-1?Q?oEvtERvNqZvHhc+RBRW3sqv+qwiZwpK7RF6/LY2InImWCJVAmEcn6jgYiy?=
 =?iso-8859-1?Q?vck5vZJM8ORv5EowbajsXP/tXDbQgDX7B16lIw1EkIo7Rtoqr1cviZwwj+?=
 =?iso-8859-1?Q?w+eMQbVqc2QydbTOYc30M+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7aXEnxJhV3uxlO/w79oxCm6pz69txjK4+HdPLXaT38DeSfKehPiqI/ejpW?=
 =?iso-8859-1?Q?MrcXpnpgFZLk92gIjbnulMw8/qd4qIcCgudvqFKCdYXxqukvefNA3vOJem?=
 =?iso-8859-1?Q?EthMx3BlDRhxJeO1R1Sk4aVw9rjdT2OuEYD4K9U3WNlRj28yZEJ/MOYvKi?=
 =?iso-8859-1?Q?yq2owqJvKdg4/cENSPGpwo6S/gelrRgboLnDnr13l4wnBvY6rM/v5ekoh7?=
 =?iso-8859-1?Q?XcdQJGcM+oTiJQtZD8EuIYcmjoW7Y6Wofvtbx6NWvnfPsCFYloneXWPqaR?=
 =?iso-8859-1?Q?PjNICuSB42EpWNNz7prWPWjQR4OqBCUichahwWd4bkqjt5S/CeK3Ttwdc0?=
 =?iso-8859-1?Q?JbF5rQQ7Ukp/Tk82Dw7W19dYwEWrUVpJpwjrWe9e7t3aXKsTlGo0zFqYwo?=
 =?iso-8859-1?Q?p0ooWXzlSyoALl2KBBFTFkXviOY8CyOLPJtQFhZy9UPqrOl2rbMvGRG7cU?=
 =?iso-8859-1?Q?riUbocELy1OmblxxYlvoNmc9f5YFs3tgNulCzRwhtbGLydVBGSrkNhbmwK?=
 =?iso-8859-1?Q?oHOBsjsRIAnAnzbghiRhqv3oASF/nseMZM+NbxKX3S5tpgZE8watVPlcfD?=
 =?iso-8859-1?Q?1MlAgKOeNYhaVeJRXCDZY9UTaV+BHHVA8pR6BsF0OuoyzXiy6SkxixaWK7?=
 =?iso-8859-1?Q?+rRwJFIObIaI6Ov8YkjQmxJvP1+4JagtvfAlnFMw45J/O/Qsv0g5F6t6Wy?=
 =?iso-8859-1?Q?r1qxkageNBiAehqzbSSyFdMzVpd1Ky7yTA8xA0HjELSUXq97FSP3bN1BmG?=
 =?iso-8859-1?Q?6ee9NKLoW9pb1c9gbv8xlA7oX68pkdstPelqWcaxoObXUwlc3KP1ONIrRV?=
 =?iso-8859-1?Q?6X0/cNxUolJfmAfo8KoegRn4P9aElnZZyxPVZCqvyr/JV1rHljMxTCo/vG?=
 =?iso-8859-1?Q?llSZKh2vddlhm1eL9TRGMP4svT+Fv5vADMH3yP2UVGZrBHKlW5JVt0rGIe?=
 =?iso-8859-1?Q?pZUNW9UsnL7LV7eMvjXSapVbSnu2VJCuKCaGwCGAYxZGsytDPFhm69JTCr?=
 =?iso-8859-1?Q?v+4qNmgOOx0Wg8sp+1fZmKbmO+ngHdfo4kjx0U+QdNjuVHcoW7anMD5BTu?=
 =?iso-8859-1?Q?4Bki721aWG0vYOvYmgE36vqo97Ti3L2V8Hi/37U9l2Anrqm2ywT5EAmLo8?=
 =?iso-8859-1?Q?I1CzBFeKvzUBlmsQaWXBOu8fFANwaUk/GcsvQIP77of9R+cajJwodLSCKL?=
 =?iso-8859-1?Q?f5x8bwWOS5PBr1XlOp7hbRushX1HSpv6ddtRNi9CjjqdFEl31+4QjlOR4f?=
 =?iso-8859-1?Q?KbjCiH/ieuCHfvGD/Vf8nbiIv2XFqx5byYoAPtypCwqZzdqOwnMkRam4Fx?=
 =?iso-8859-1?Q?AufRzfjfFJjjhaGtB0ae3VS5De8poeAXdMNs3VBsjoHT8B5C4Ti27lpL+c?=
 =?iso-8859-1?Q?+RNB2vI3Sst2zTDNGsct90WaXvPE9DY3TJfGlnLyum6P8ANfwhTdWSxWZ+?=
 =?iso-8859-1?Q?8cUmB/hNwD63pOuRuN3udWcc49Pupbax2UcXXkfcFndhU9FFzho6z/vB5X?=
 =?iso-8859-1?Q?rplA/3nuJPC3HTl/IWvAcPsGFeaxZWoCY5a3Fvy3RaiG/64IfDxgWCvDbh?=
 =?iso-8859-1?Q?WM1OWUj/AiqLlzB7SK+2yupsFI8jOJ+uKdJuvqSPt9BuemjmdVA9chx6mx?=
 =?iso-8859-1?Q?8pw4L2iNn4hR5+p5a0QWlV5ME6xBxOdbt4NsMJkgmXi0DBEV1DF9vieQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b60ccdf7-eac1-4b27-4b56-08de10ceb66b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 18:21:54.4167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bzqylZPFywWkQBRZtgw2qzzKTQ4IDIVdVd4Ujpxrr4te43uQs37y39Z9zcIy93EiRtQU/A0DwSKItGcfrEYBHaWq3aDKhAVmBgbvfv4TJYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 18:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225161

From: Markus Volk <f_l_k@t-online.de>

Changelog: [https://gitlab.gnome.org/GNOME/gtk/-/blob/4.20.2/NEWS]

- add bash-completion to FILES to avoid an installed-vs-shipped issue
- remove gtk4-printbackend-cups package
- use $GNOME_MIRROR in download URL

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 .../gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb}         | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.18.6.bb =3D> gtk4_4.20.2.bb} (89%)

Changes since v2:

  - Replaced https://download.gnome.org/sources by ${GNOME_MIRROR}

Changes since v1:

  - Fixed author email

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.18.6.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.20.2.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk4_4.18.6.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
index 2d24468dcc..9fcb55b52a 100644
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
+SRC_URI =3D "${GNOME_MIRROR}/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
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


