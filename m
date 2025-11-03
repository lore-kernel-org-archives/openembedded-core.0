Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6E89CCFA07
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:21:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.84])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16039.1762158108538159684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:21:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Up+ZrLkQ;
 spf=pass (domain: navimatix.de, ip: 52.101.84.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voD8JzHYI1ltKLarrth91P//tV0WGGBm+aG7M/yj6zBclT161KsomYr/REQ0xzQ4Ze4AOModTFTKChILsRxQKYI5tOldV3MJOocixwcwTnRm29x/HEVGeyd5Ue8Tf9tbBkm9BN+7CudPMZeJuEpG5eAWjiEM/N278+r9Uy0GDL0zAkh7/WeNyNvMx5q5F9gHeLI8FfzuvaEnak2pKggyRUh1te7FjuntX0pn5hJl80b7Np5lHK5ZXFupWFcUHoJEkegG6Mee91339K5O5DPJjvjB8PeOXg+fQxsSTVB976/rOGC7AoHWcwKAKppBoeujfFPJuvE0ZjUYl9e8NrFa7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwrcYXSx7O5Sa9iY0VSMh6PFSyNeVNb0IZBir16sYRU=;
 b=TkEj6BeXbhnO+JB7zbEBZBW+4md89Lru5LOMK53mT3nP0nQMY1tQQyKR1vAnuam86vveeGogk5hwrEeivyshwsGzZlmGtpXcbW+EfeS1vO+Zy24S6BmV9W9uAkURHfoW7cCNy1UF96B110n3QqyAAVuuEoB5QLx45mBlFGpQukJiW3x/g2FEzDiKWBCogDbP/X4j/ItY5D5xA/fd0phn1c5ICSC4FWyO4oIM/Rfkkt5LW4CcwIown/4+W9xIc2+8uGB8ElmdfEbSU0pkSmXlCBrmA44+7MzQSu/pZRZoDPwiQ2v3KFdEC5WfWlv0pQInHIYdoNgTOHmeQX1y4qLsvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwrcYXSx7O5Sa9iY0VSMh6PFSyNeVNb0IZBir16sYRU=;
 b=Up+ZrLkQxyemcTnCaPJ2cWNywmftk4RRKK7giQI2SkZGDDerr+Gf4t2IvTmPrd0CNBWkPYZKd87KkTsMOElwcMVUFKspUBrCBsn7BVAITkw9g+mxljEWzx4TZ1oM8ulq7bs9jqegpBDEHeMUn72fNZEBDZhGLc65hduxCs9ecT4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU0PR01MB9432.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:32f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 08:21:43 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:21:43 +0000
Date: Mon, 3 Nov 2025 09:21:42 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 02/19] gtk+3: port to Meson
Message-ID: <33cb22d197cedb4098472f324fabb798430826cf.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:67::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU0PR01MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: d7afc5ff-a111-41a8-0b8a-08de1ab205c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?urTQEt52uFpZKhyt7hGXxACiOaZTgamZWN828O5rrNazcCjTj/tloGQhH1tQ?=
 =?us-ascii?Q?j5lgjTfbfgfrFPofIRctCwx1Rt3AVW3zYzrbgCf4T/L3mnPRFAAT9hfuO+ie?=
 =?us-ascii?Q?2SlMobyyKP5rNHgeZwJg1WJU/wfdVOW2gp5vsY6lNU8y9uSH7Bss+ugKYIF0?=
 =?us-ascii?Q?0CDJRiQlYzuu4R2D49DDShl9CIHhT6vh4462FqlVzfjn+6Ud9PA4Lz2nFo3A?=
 =?us-ascii?Q?0XPS/ybmGA1uWPoDMsvl+rR0CWhDB6SEwimD48JZP3Pu+OBy3H5qQrp6doJy?=
 =?us-ascii?Q?AeHsQQxeq2uwFHI1rfokK82Dcldb4Xl/HPfTdDt9GlzjpR3vtU23lnIvBkpp?=
 =?us-ascii?Q?gLOuSgrJyfkYX4GjF8draZpeBLNyYO9mbxBiKgZOj5fDIsy1XaE1CN9PlNXE?=
 =?us-ascii?Q?9ic0O6AawqHwvnOK4ZWhYQ8H4h6Xi9BHlIJp7IMv0jXwxFCGbPrzQTVfq7by?=
 =?us-ascii?Q?Oh1QMopkdi+grUQ9pB9FFb+/tSySwWpnRpIwsjCJVxFIfIpKnYoUnLrd7BG+?=
 =?us-ascii?Q?IVPmwayCeYbOAqh9MP9w+tuQvg8prBdpJI0md3AeCySI3gg0ZI6OS6PtrCD7?=
 =?us-ascii?Q?acX7WpmaQK7jlHCsgxDQ8BcHPTa8ZNeEgHIp74gQx7C0tfhr0T5YEbG/BPUM?=
 =?us-ascii?Q?leN/IHP1gHiEDJ97vhzhn4rXvt5J9TwXrRZp/X+DJk27RFDbQWcwYHSSFZph?=
 =?us-ascii?Q?BuaYsRCw9rfO0c34Ftav+RWoXiMu3h8BA5jJ1WzALIqGUxM4n9f6l2tMH75/?=
 =?us-ascii?Q?rxybTfgWMJ4LoSiPNMhUPixJkRZMcw53L0E+DTH4AKPBvtQLJ7aUdKsD1N9r?=
 =?us-ascii?Q?FREVNmMxTdoqkOoQt6aSmbzMVEpzP8Vll5BMRaZaO16H8w5jOcu4ynrO8ew4?=
 =?us-ascii?Q?wnmzwgxRcf7IOTDxLJ/GyKlUGRWSgfd2nLIIQTmvu5My+qCpyWdgk0ElDb4q?=
 =?us-ascii?Q?R576tR3v3fDOrIqzBL5PL+HujV4wegr9Mw7XlpDMNTSPH2RKDitSmet3eha2?=
 =?us-ascii?Q?AqEtFqbFndIjxDho4qijPR6BsU7Y1nWYtgdXwtfQZtNB6ud65D8ctGScRcyF?=
 =?us-ascii?Q?5vqeLFJTl80pv43Z88y9VpDLUJPpzIJXa0+Gmg9N62sMu4ZzjkltgD1DUQzW?=
 =?us-ascii?Q?aQFjUKK3Xl7M1KKcMm5tvZdm/xIUkBo+5M+VRgswyOBk9ShNg1aSPX1qQNP1?=
 =?us-ascii?Q?7xY3C9hMTmZgizo+ZeW6Iwzoet+iW00mGEFrQUUvxHqscjnuhMshmfPcd0mW?=
 =?us-ascii?Q?5vx/0EMtNUBQkAA3/wBZHPi+LSh3bGMHrORJOlqbUi++02XVny/62MZUEe8g?=
 =?us-ascii?Q?3DFJA6eiLq4BfUQA3vCtIAHtB7vX1tyqC0aNz41YnNDowqvtZRWVdsY3pG+3?=
 =?us-ascii?Q?v1SxEIF0bJy6mRBcP+wd0VbBYSf9CW1GAdnuVpXeTUqzEh9bRg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q0IN1EENTmM0fzlw/4LvGs8PVWsqaVVr9xH7nxklf6r+k5LSjFjSFVAe5nyX?=
 =?us-ascii?Q?Pd2KWfeEtx97r5x4VKL34tibNJXiC/puDRlmgfo3snhqnGIR4ukpA3ydm+//?=
 =?us-ascii?Q?Un4F/g2zDupknaYNMwyP4G3v37mH41H3/eOfOtlhXQyX7l4OQ4DmII2LNDRf?=
 =?us-ascii?Q?zDX8NOaTOCy2xQLboTNsNw3H9GsIRxenhJ7r+LhWr0dLmlVLeX+aD+qaG5G1?=
 =?us-ascii?Q?XyymE7VrabuCwIzU/IvUFl+gqavPzeU6e0lZHp8/NR+kuS42+ddEwdDb9e1C?=
 =?us-ascii?Q?2Re90kjoI7CCPYBq9quLPm+spyx8Sxgg9FtVQZi4k5YKMCwaj0dQ/FTR8WOG?=
 =?us-ascii?Q?xYOhphoSU9kyLmkapfFKRGbHAgjfeB6suxsShLHc3IO5OYeociyeeqB6gFrq?=
 =?us-ascii?Q?EcfgSDzEMBvyVZCCg6Y0w8it20njLu5phvft2uJVaN70maCaUyM43Y0fAdMi?=
 =?us-ascii?Q?lQ9PhyC4Qctr5YLhsEgZg4X8mVNPS+Eq0iIiQzgKJuReIvekWXiQw+nF3qiG?=
 =?us-ascii?Q?q2zF8efDShIHL80IdiBxfMaP9oq5V2VZ+NXNkEa+bT016EO9V4IKGDiYCHZx?=
 =?us-ascii?Q?J1k9E4S9sMdgS9tGCMGQxa4/HLHOcazQh0xxkwknfkf9p9P+LPj5nV940ZK1?=
 =?us-ascii?Q?ONTA0XxvU8wsCPtOyVYHnsST7U5C9SOSbvBemZx00rP4vJSrjTpoAMwR9NwQ?=
 =?us-ascii?Q?XCgmcr7RibUJMUNdvvoQ9S1h6s4nsJ8Q0HO2ohj66zWIEh5FswbRVA+cbbs4?=
 =?us-ascii?Q?6AS5R9zkLAHmj2As34lKhAX+yI6SViomptD8Gf2HCXy/FswuprlenUPlQ0NT?=
 =?us-ascii?Q?WGZmYOdwtU0oKOVeG50IEhjv1DAD8LbJETXOsVkedvNFNx/Z4UaSm9y04Fcv?=
 =?us-ascii?Q?gP39LZqEDKvV6umBnJitKMF2gAPhaT2j7eu3MlGrUc1dNsBRa+WdsN52iNf8?=
 =?us-ascii?Q?vkEc1r/mUbSW/4vAJZbekui6KabAV3Fbnau9ZwMxryJqrsT8Hz8QWNVV55OD?=
 =?us-ascii?Q?0AjZ2LeMsW7ohmhQPflL8yG9xNrumtm7jhrJokPnUHp7P8vQ2pgkwqJqUUWa?=
 =?us-ascii?Q?QdaA2oJ3PqrH7P3hfMPOzMdAm1p4/5Tz0TaGdVx7XzefX9+i0VQ9Mdw5ekIV?=
 =?us-ascii?Q?v5wkWLoX9AXNMnHDTh++efAOnDLYYegJbEKKJdoZIcbGhY7P1WMDSPtMekCk?=
 =?us-ascii?Q?SFdazKC343w7qajmIARL4jsKFiDPVsllVbiYD0C9fsrGH76UcDqNYrYf6Wwh?=
 =?us-ascii?Q?iHeFlTpjRKI0d6TKPI3Uqw3cauTEjUusGM5AFjzVUhrxKzBTOueJflH0Gj4d?=
 =?us-ascii?Q?dtlyhdyX3TaZw9lzuc/JjXHBLxR5cZHGvfXzIu174qP0+NTkwYMO1lEtt/Un?=
 =?us-ascii?Q?jD8BeaxpAmtNpouzlrl3zsMI4dB7ea3wGjjNHloN0ewybXc9OqO5cRwcPODq?=
 =?us-ascii?Q?KIYW/mFKDb0cP6eZtLMBnY77ER9qqpzhBPtbWIBFEW9ILqF2+PFudknkMgee?=
 =?us-ascii?Q?a76w6Chcf/h3r2DFaS73pjNmi92txcSoWEOU7tgeG1dZ5iSVMdEopvzN7F4x?=
 =?us-ascii?Q?Obn2eoAZoM7c7vJGoNDByazDSggq23pg2TW7F8O3bEcbf5/GR77z+2tBe+z0?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d7afc5ff-a111-41a8-0b8a-08de1ab205c0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:43.7919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zD/kSbn1/BPKGsWUliWUxWtY4MXb3Da0l/g5lS/9PwbU+bhiccPVnqmSVPLaEsaaotQJfDCgd4Ecjmqe/taucUujxTG13k3/u6jDiaufpdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR01MB9432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225616

From: Ross Burton <ross.burton@arm.com>

GTK+ 3.24.36 will drop the autotools build, so get ahead of the curve
and switch to Meson.

The tarball is missing one meson.build file so add that explictly for
now.

(From OE-Core rev: f9b0930eab6cf89bbf80c565676c89997b610206)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 9eb2b0bb7ab4b047acc11c3ce0034aa4def49432
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |  34 +-
 ...t-try-to-initialize-GL-without-libGL.patch |  57 --
 ...-Add-disable-opengl-configure-option.patch | 874 ------------------
 .../recipes-gnome/gtk+/gtk+3/buildpaths.patch |  57 ++
 .../gtk+/gtk+3/link_fribidi.patch             |  19 -
 meta/recipes-gnome/gtk+/gtk+3/meson.build     |  14 +
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 765 +++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb      |   6 +-
 8 files changed, 851 insertions(+), 975 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initia=
lize-GL-without-libGL.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-c=
onfigure-option.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/meson.build
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/opengl.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 5b7b73ac8d..1d726b5696 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -6,12 +6,11 @@ HOMEPAGE =3D "http://www.gtk.org"
 BUGTRACKER =3D "https://bugzilla.gnome.org/"
 SECTION =3D "libs"
=20
-DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf \
-           gdk-pixbuf-native"
+DEPENDS =3D "glib-2.0 cairo pango atk jpeg libpng gdk-pixbuf gdk-pixbuf-na=
tive"
=20
 LICENSE =3D "LGPL-2.0-only & LGPL-2.0-or-later & LGPL-2.1-or-later"
=20
-inherit autotools gettext pkgconfig gtk-doc update-alternatives gtk-immodu=
les-cache gsettings features_check gobject-introspection
+inherit meson gettext pkgconfig gtk-doc update-alternatives gtk-immodules-=
cache gsettings features_check gobject-introspection
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
@@ -22,10 +21,6 @@ UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>3\.([1-8]?[024=
68])+(\.\d+)+)\.tar"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
-# This should be in autotools.bbclass, but until something elses uses it p=
utting
-# it here avoids rebuilding everything.
-export PKG_CONFIG_FOR_BUILD =3D "${STAGING_BINDIR_NATIVE}/pkg-config-nativ=
e"
-
 do_configure:prepend() {
     # These files are generated by wayland-scanner but will race over modi=
fication
     # time between the copies in the sysroot from wayland-protocols and th=
e copy
@@ -33,27 +28,21 @@ do_configure:prepend() {
     rm -f ${S}/modules/input/*-text-input-*.[ch]
 }
=20
-EXTRA_OECONF +=3D " \
-                 --disable-glibtest \
-                 --disable-xinerama \
-                 --enable-modules \
-                 ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--dis=
able-gtk-doc", d)} \
-                 "
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
=20
-do_compile:prepend() {
-        export GIR_EXTRA_LIBS_PATH=3D"${B}/gdk/.libs"
-}
+EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
+EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfalse=
"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland=
 x11', d)}"
 PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11=
', d)}"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES', '=
x11', d)}"
=20
-PACKAGECONFIG[x11] =3D "--enable-x11-backend,--disable-x11-backend,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes"
+PACKAGECONFIG[x11] =3D "-Dx11_backend=3Dtrue,-Dx11_backend=3Dfalse,at-spi2=
-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxre=
nder libxcomposite libxfixes"
 # this is provided by oe-core patch that removes epoxy/gl dependency from =
a X11 build
-PACKAGECONFIG[opengl] =3D "--enable-opengl,--disable-opengl,libepoxy"
-PACKAGECONFIG[wayland] =3D "--enable-wayland-backend,--disable-wayland-bac=
kend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
-PACKAGECONFIG[cups] =3D "--enable-cups,--disable-cups,cups"
-PACKAGECONFIG[colord] =3D "--enable-colord,--disable-colord,colord"
+PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue,-Dopengl=3Dfalse,libepoxy"
+PACKAGECONFIG[wayland] =3D "-Dwayland_backend=3Dtrue,-Dwayland_backend=3Df=
alse,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wa=
yland-native"
+PACKAGECONFIG[cups] =3D "-Dprint_backends=3Dcups,-Dprint_backends=3Dfile,c=
ups"
+PACKAGECONFIG[colord] =3D "-Dcolord=3Dyes,-Dcolord=3Dno,colord"
=20
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-c=
ache-3.0
@@ -96,7 +85,8 @@ FILES:${PN}-demo =3D "${bindir}/gtk3-demo \
 FILES:${PN}:append =3D " ${bindir}/gtk-update-icon-cache-3.0 \
                ${bindir}/gtk-query-immodules-3.0 \
                ${bindir}/gtk-launch \
-               ${datadir}/themes ${sysconfdir} ${datadir}/glib-2.0/schemas=
/ \
+               ${datadir}/themes ${datadir}/gtk-3.0/emoji \
+               ${sysconfdir} ${datadir}/glib-2.0/schemas/ \
                ${libdir}/gtk-3.0/${LIBV}/engines/libpixmap.so \
                ${libdir}/gtk-3.0/modules/*.so"
=20
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL=
-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-ini=
tialize-GL-without-libGL.patch
deleted file mode 100644
index 80dc2d7a05..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-withou=
t-libGL.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 6575ab0f0e8c1bba033ad1616511e37a2ec995ff Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 16 Oct 2015 16:35:16 +0300
-Subject: [PATCH] Do not try to initialize GL without libGL
-
-_gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
-GLX api which will exit() if libGL.so.1 is not present. We do not
-want that to happen and we don't want every app to have to set
-"GDK_GL=3Ddisabled" environment variable: so use #ifdef set based on
-opengl distro feature.
-
-Upstream is not interested in the fix as it is: Either epoxy should be
-fixed (to not exit) or GTK+ possibly could do some additional probing
-before calling epoxy APIs.
-
-Upstream-Status: Denied
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- configure.ac            | 6 ++++++
- gdk/x11/gdkvisual-x11.c | 5 +++++
- 2 files changed, 11 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index e9f5583..bd651bb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -346,6 +346,12 @@ AC_ARG_ENABLE(cloudproviders,
-               [AS_HELP_STRING([--enable-cloudproviders],
-                               [enable libcloudproviders integration])],
-                               [cloudproviders_set=3Dyes])
-+AC_ARG_ENABLE(glx,
-+              [AS_HELP_STRING([--enable-glx],
-+                              [When enabled Gdk will try to initialize GL=
X])])
-+AS_IF([test "x$enable_glx" !=3D "xno"], [
-+  AC_DEFINE([HAVE_GLX], [], [GLX will be available at runtime])
-+])
-=20
- AC_ARG_ENABLE(profiler,
-               [AS_HELP_STRING([--enable-profiler],
-diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
-index 81479d8..3c8c5c0 100644
---- a/gdk/x11/gdkvisual-x11.c
-+++ b/gdk/x11/gdkvisual-x11.c
-@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
-   /* If GL is available we want to pick better default/rgba visuals,
-      as we care about glx details such as alpha/depth/stencil depth,
-      stereo and double buffering */
-+  /* update_visuals_for_gl() will end up calling epoxy GLX api which
-+     will exit if libgl is not there: so only do this if we know GL
-+     is available */
-+#ifdef HAVE_GLX
-   _gdk_x11_screen_update_visuals_for_gl (screen);
-+#endif
- }
-=20
- gint
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configur=
e-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-conf=
igure-option.patch
deleted file mode 100644
index fe67144536..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-optio=
n.patch
+++ /dev/null
@@ -1,874 +0,0 @@
-From e59cb71740ff70022bb2d9bd3685a1d77b43cac0 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 21 Jun 2016 15:11:39 +0300
-Subject: [PATCH] Add --disable-opengl configure option
-
---disable-opengl will remove the dependency on libepoxy and on the
-OpenGL APIs. This is useful for those who want to keep using gtk+3
-without the "opengl" distro feature.
-
-GtkGLArea is still part of the API (it just doesn't work) even when
-OpenGL is disabled. GdkX11GLContext was removed from the Gtk API
-completely: that object exposes GL API elements so it had to be at
-the very least modified.
-
-The patch is _not_ great from a maintenance point of view and
-modifying the library API is also a fairly nasty thing to do.
-Next long term release (4.0) will require alternative solutions
-as it actually will depend on OpenGL.
-
-Upstream-Status: Inappropriate [Evil eye expected from upstream]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- configure.ac                               | 13 ++++-
- demos/gtk-demo/glarea.c                    | 14 ++++++
- docs/tools/Makefile.am                     |  9 +++-
- docs/tools/widgets.c                       |  4 +-
- gdk/gdk-sources.inc                        |  8 ++-
- gdk/gdkdisplay.c                           |  4 +-
- gdk/gdkgl.c                                | 10 ++++
- gdk/gdkglcontext.c                         |  6 +++
- gdk/gdkwindow.c                            | 13 +++++
- gdk/x11/Makefile.am                        | 30 +++++++++--
- gdk/x11/gdkdisplay-x11.c                   |  6 ++-
- gdk/x11/gdkscreen-x11.c                    |  5 ++
- gdk/x11/gdkwindow-x11.c                    |  4 ++
- gdk/x11/gdkx-autocleanups.h                |  2 +
- gdk/x11/{gdkx.h =3D> gdkx-with-gl-context.h} |  1 -
- gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++
- gtk/Makefile.am                            |  2 +-
- gtk/gtkglarea.c                            | 20 +++++++-
- gtk/inspector/general.c                    |  6 +++
- tests/Makefile.am                          | 10 ++--
- testsuite/gtk/objects-finalize.c           |  2 +
- 21 files changed, 208 insertions(+), 19 deletions(-)
- rename gdk/x11/{gdkx.h =3D> gdkx-with-gl-context.h} (98%)
- create mode 100644 gdk/x11/gdkx-without-gl-context.h
-
-diff --git a/configure.ac b/configure.ac
-index 9ed65e5f8a..70c68364ff 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
-               [AS_HELP_STRING([--enable-cloudproviders],
-                               [enable libcloudproviders integration])],
-                               [cloudproviders_set=3Dyes])
-+AC_ARG_ENABLE(opengl,
-+              [AS_HELP_STRING([--enable-opengl],
-+                              [When enabled, Gtk+ will use libepoxy and e=
xposes GtkGLArea widget ])])
-+AS_IF([test "x$enable_opengl" !=3D "xno"], [
-+  AC_DEFINE([HAVE_OPENGL], [1], [libepoxy and opengl APIs are available a=
t buildtime])
-+  EPOXY_PACKAGES=3D"epoxy >=3D epoxy_required_version"
-+])
-+AM_CONDITIONAL([HAVE_OPENGL],[test "x$enable_opengl" !=3D "xno"])
-+
- AC_ARG_ENABLE(glx,
-               [AS_HELP_STRING([--enable-glx],
-                               [When enabled Gdk will try to initialize GL=
X])])
-@@ -1367,7 +1376,7 @@ CFLAGS=3D"$saved_cflags"
- LDFLAGS=3D"$saved_ldflags"
-=20
- GDK_PACKAGES=3D"$PANGO_PACKAGES gdk-pixbuf-2.0 >=3D gdk_pixbuf_required_v=
ersion cairo >=3D cairo_required_version cairo-gobject >=3D cairo_required_=
version"
--GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $c=
airo_backends epoxy >=3D epoxy_required_version $CLOUDPROVIDER_PACKAGES $PR=
OFILER_PACKAGES fribidi >=3D fribidi_required_version"
-+GDK_PRIVATE_PACKAGES=3D"$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $c=
airo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fr=
ibidi >=3D fribidi_required_version"
-=20
- PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
- GDK_DEP_LIBS=3D"$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1401,7 +1410,7 @@ fi
- PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
-=20
- GTK_PACKAGES=3D"atk >=3D atk_required_version cairo >=3D cairo_required_v=
ersion cairo-gobject >=3D cairo_required_version gdk-pixbuf-2.0 >=3D gdk_pi=
xbuf_required_version gio-2.0 >=3D glib_required_version"
--GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >=3D epoxy_=
required_version fribidi >=3D fribidi_required_version"
-+GTK_PRIVATE_PACKAGES=3D"$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES f=
ribidi >=3D fribidi_required_version"
- if test "x$enable_x11_backend" =3D xyes -o "x$enable_wayland_backend" =3D=
 xyes; then
-   GTK_PRIVATE_PACKAGES=3D"$GTK_PRIVATE_PACKAGES pangoft2"
- fi
-diff --git a/demos/gtk-demo/glarea.c b/demos/gtk-demo/glarea.c
-index b51e4ae1fe..82409c7358 100644
---- a/demos/gtk-demo/glarea.c
-+++ b/demos/gtk-demo/glarea.c
-@@ -3,9 +3,12 @@
-  * GtkGLArea is a widget that allows custom drawing using OpenGL calls.
-  */
-=20
-+#include "config.h"
- #include <math.h>
- #include <gtk/gtk.h>
-+#if HAVE_OPENGL
- #include <epoxy/gl.h>
-+#endif
-=20
- static GtkWidget *demo_window =3D NULL;
-=20
-@@ -23,6 +26,8 @@ enum {
- /* Rotation angles on each axis */
- static float rotation_angles[N_AXIS] =3D { 0.0 };
-=20
-+#ifdef HAVE_OPENGL
-+
- /* The object we are drawing */
- static const GLfloat vertex_data[] =3D {
-   0.f,   0.5f,   0.f, 1.f,
-@@ -215,6 +220,7 @@ compute_mvp (float *res,
- static GLuint position_buffer;
- static GLuint program;
- static GLuint mvp_location;
-+#endif
-=20
- /* We need to set up our state when we realize the GtkGLArea widget */
- static void
-@@ -241,8 +247,10 @@ realize (GtkWidget *widget)
-       fragment_path =3D "/glarea/glarea-gl.fs.glsl";
-     }
-=20
-+#ifdef HAVE_OPENGL
-   init_buffers (&position_buffer, NULL);
-   init_shaders (vertex_path, fragment_path, &program, &mvp_location);
-+#endif
- }
-=20
- /* We should tear down the state when unrealizing */
-@@ -254,10 +262,13 @@ unrealize (GtkWidget *widget)
-   if (gtk_gl_area_get_error (GTK_GL_AREA (widget)) !=3D NULL)
-     return;
-=20
-+#ifdef HAVE_OPENGL
-   glDeleteBuffers (1, &position_buffer);
-   glDeleteProgram (program);
-+#endif
- }
-=20
-+#ifdef HAVE_OPENGL
- static void
- draw_triangle (void)
- {
-@@ -290,6 +301,7 @@ draw_triangle (void)
-   glBindBuffer (GL_ARRAY_BUFFER, 0);
-   glUseProgram (0);
- }
-+#endif
-=20
- static gboolean
- render (GtkGLArea    *area,
-@@ -298,6 +310,7 @@ render (GtkGLArea    *area,
-   if (gtk_gl_area_get_error (area) !=3D NULL)
-     return FALSE;
-=20
-+#ifdef HAVE_OPENGL
-   /* Clear the viewport */
-   glClearColor (0.5, 0.5, 0.5, 1.0);
-   glClear (GL_COLOR_BUFFER_BIT);
-@@ -307,6 +320,7 @@ render (GtkGLArea    *area,
-=20
-   /* Flush the contents of the pipeline */
-   glFlush ();
-+#endif
-=20
-   return TRUE;
- }
-diff --git a/docs/tools/Makefile.am b/docs/tools/Makefile.am
-index bec43e3a55..189e8fc926 100644
---- a/docs/tools/Makefile.am
-+++ b/docs/tools/Makefile.am
-@@ -9,13 +9,18 @@ AM_CPPFLAGS =3D \
- 	$(GTK_DEBUG_FLAGS)		\
- 	$(GTK_DEP_CFLAGS)
-=20
-+if HAVE_OPENGL
-+GEARS_LDADD =3D $(top_builddir)/tests/gtkgears.o
-+endif
-+
- DEPS =3D \
--	$(top_builddir)/gtk/libgtk-3.la
-+	$(top_builddir)/gtk/libgtk-3.la	\
-+	$(GEARS_LDADD)
-=20
- LDADDS =3D \
- 	$(top_builddir)/gtk/libgtk-3.la	\
- 	$(top_builddir)/gdk/libgdk-3.la	\
--	$(top_builddir)/tests/gtkgears.o \
-+	$(GEARS_LDADD)			\
- 	$(GTK_DEP_LIBS)			\
- 	$(GDK_DEP_LIBS)			\
- 	-lm
-diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
-index 932daf1746..54239d6129 100644
---- a/docs/tools/widgets.c
-+++ b/docs/tools/widgets.c
-@@ -1526,9 +1526,11 @@ create_gl_area (void)
-   widget =3D gtk_frame_new (NULL);
-   gtk_frame_set_shadow_type (GTK_FRAME (widget), GTK_SHADOW_IN);
-=20
-+#ifdef HAVE_OPENGL
-   gears =3D gtk_gears_new ();
-   gtk_container_add (GTK_CONTAINER (widget), gears);
--=20
-+#endif
-+
-   info =3D new_widget_info ("glarea", widget, MEDIUM);
-=20
-   return info;
-diff --git a/gdk/gdk-sources.inc b/gdk/gdk-sources.inc
-index 9235edb6cf..349acb8f4c 100644
---- a/gdk/gdk-sources.inc
-+++ b/gdk/gdk-sources.inc
-@@ -146,7 +146,6 @@ x11_introspection_files =3D 		\
- 	x11/gdkeventsource.c		\
- 	x11/gdkeventtranslator.c	\
- 	x11/gdkgeometry-x11.c		\
--	x11/gdkglcontext-x11.c		\
- 	x11/gdkkeys-x11.c		\
- 	x11/gdkmain-x11.c		\
- 	x11/gdkmonitor-x11.c		\
-@@ -172,7 +171,6 @@ x11_introspection_files =3D 		\
- 	x11/gdkx11display.h		\
- 	x11/gdkx11displaymanager.h	\
- 	x11/gdkx11dnd.h			\
--	x11/gdkx11glcontext.h		\
- 	x11/gdkx11keys.h		\
- 	x11/gdkx11monitor.h		\
- 	x11/gdkx11property.h		\
-@@ -182,6 +180,12 @@ x11_introspection_files =3D 		\
- 	x11/gdkx11visual.h		\
- 	x11/gdkx11window.h
-=20
-+if HAVE_OPENGL
-+x11_introspection_files +=3D 		\
-+	x11/gdkglcontext-x11.c		\
-+	x11/gdkx11glcontext.h
-+endif
-+
- w32_introspection_files =3D		\
- 	win32/gdkcursor-win32.c		\
- 	win32/gdkdevicemanager-win32.c	\
-diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 748f54860c..911ab2a65f 100644
---- a/gdk/gdkdisplay.c
-+++ b/gdk/gdkdisplay.c
-@@ -2420,7 +2420,9 @@ gboolean
- gdk_display_make_gl_context_current (GdkDisplay   *display,
-                                      GdkGLContext *context)
- {
--  return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (displa=
y, context);
-+  if (GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current)
-+    return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (disp=
lay, context);
-+  return FALSE;
- }
-=20
- GdkRenderingMode
-diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 9690077cc2..55f85ef605 100644
---- a/gdk/gdkgl.c
-+++ b/gdk/gdkgl.c
-@@ -26,7 +26,9 @@
- # include "win32/gdkwin32.h"
- #endif
-=20
-+#ifdef HAVE_OPENGL
- #include <epoxy/gl.h>
-+#endif
- #include <math.h>
- #include <string.h>
-=20
-@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surfa=
ce,
-                                g_object_ref (window),  g_object_unref);
- }
-=20
-+#ifdef HAVE_OPENGL
- static const char *
- get_vertex_type_name (int type)
- {
-@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)
-       glUseProgram (paint_data->current_program->program);
-     }
- }
-+#endif
-=20
- void
- gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
-                       GdkTexturedQuad *quads,
-                       gboolean flip_colors)
- {
-+#ifdef HAVE_OPENGL
-   GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data (p=
aint_context);
-   GdkGLContextProgram *program;
-   GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
-@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
-=20
-   glDisableVertexAttribArray (program->position_location);
-   glDisableVertexAttribArray (program->uv_location);
-+#endif
- }
-=20
- /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
-                         int                   width,
-                         int                   height)
- {
-+#ifdef HAVE_OPENGL
-   GdkGLContext *paint_context;
-   cairo_surface_t *image;
-   cairo_matrix_t matrix;
-@@ -718,6 +725,7 @@ out:
-   if (clip_region)
-     cairo_region_destroy (clip_region);
-=20
-+#endif
- }
-=20
- /* This is always called with the paint context current */
-@@ -725,6 +733,7 @@ void
- gdk_gl_texture_from_surface (cairo_surface_t *surface,
- 			     cairo_region_t  *region)
- {
-+#ifdef HAVE_OPENGL
-   GdkGLContext *paint_context;
-   cairo_surface_t *image;
-   double device_x_offset, device_y_offset;
-@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
-=20
-   glDisable (GL_SCISSOR_TEST);
-   glDeleteTextures (1, &texture_id);
-+#endif
- }
-diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index 3b23639e1c..1f04f8e0b2 100644
---- a/gdk/gdkglcontext.c
-+++ b/gdk/gdkglcontext.c
-@@ -85,7 +85,9 @@
- #include "gdkintl.h"
- #include "gdk-private.h"
-=20
-+#ifdef HAVE_OPENGL
- #include <epoxy/gl.h>
-+#endif
-=20
- typedef struct {
-   GdkDisplay *display;
-@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
-                                int              height,
-                                guint            texture_target)
- {
-+#ifdef HAVE_OPENGL
-   GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
-=20
-   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
-@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
-             glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, =
GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
-         }
-     }
-+#endif
- }
-=20
- static gboolean
-@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
- static void
- gdk_gl_context_check_extensions (GdkGLContext *context)
- {
-+#ifdef HAVE_OPENGL
-   GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
-   gboolean has_npot, has_texture_rectangle;
-=20
-@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)
-                        priv->use_texture_rectangle ? "yes" : "no"));
-=20
-   priv->extensions_checked =3D TRUE;
-+#endif
- }
-=20
- /**
-diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 727b0cf1f4..d4d91b0d16 100644
---- a/gdk/gdkwindow.c
-+++ b/gdk/gdkwindow.c
-@@ -45,7 +45,9 @@
-=20
- #include <math.h>
-=20
-+#ifdef HAVE_OPENGL
- #include <epoxy/gl.h>
-+#endif
-=20
- /* for the use of round() */
- #include "fallback-c89.c"
-@@ -2844,6 +2846,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window=
,
- {
-   GError *internal_error =3D NULL;
-=20
-+#ifndef HAVE_OPENGL
-+  g_set_error_literal (error, GDK_GL_ERROR,
-+                       GDK_GL_ERROR_NOT_AVAILABLE,
-+                       _("GL support disabled with --disable-opengl"));
-+  return NULL;
-+#endif
-+
-   if (_gdk_gl_flags & GDK_GL_DISABLE)
-     {
-       g_set_error_literal (error, GDK_GL_ERROR,
-@@ -2979,6 +2988,7 @@ gdk_window_begin_paint_internal (GdkWindow          =
  *window,
-         }
-       else
-         {
-+#ifdef HAVE_OPENGL
- 	  gdk_gl_context_make_current (context);
-           /* With gl we always need a surface to combine the gl
-              drawing with the native drawing. */
-@@ -2993,6 +3003,7 @@ gdk_window_begin_paint_internal (GdkWindow          =
  *window,
-           glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
-=20
-           glViewport (0, 0, ww, wh);
-+#endif
-         }
-     }
-=20
-@@ -3056,6 +3067,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
-=20
-           gdk_gl_context_make_current (window->gl_paint_context);
-=20
-+#ifdef HAVE_OPENGL
-           if (!cairo_region_is_empty (opaque_region))
-             gdk_gl_texture_from_surface (window->current_paint.surface,
-                                          opaque_region);
-@@ -3066,6 +3078,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
-                                            window->current_paint.need_ble=
nd_region);
-               glDisable(GL_BLEND);
-             }
-+#endif
-=20
-           cairo_region_destroy (opaque_region);
-=20
-diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index 32b1f24434..63523130ce 100644
---- a/gdk/x11/Makefile.am
-+++ b/gdk/x11/Makefile.am
-@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES =3D 	\
- 	gdkeventtranslator.c	\
- 	gdkeventtranslator.h	\
- 	gdkgeometry-x11.c  	\
--	gdkglcontext-x11.c	\
--	gdkglcontext-x11.h	\
- 	gdkkeys-x11.c		\
- 	gdkmain-x11.c		\
- 	gdkmonitor-x11.c	\
-@@ -56,14 +54,32 @@ libgdk_x11_la_SOURCES =3D 	\
- 	gdkwindow-x11.h		\
- 	gdkxftdefaults.c	\
- 	gdkxid.c		\
--	gdkx.h			\
- 	gdkprivate-x11.h	\
- 	xsettings-client.h	\
- 	xsettings-client.c
-=20
-+if HAVE_OPENGL
-+libgdk_x11_la_SOURCES +=3D        \
-+	gdkglcontext-x11.c	\
-+	gdkglcontext-x11.h
-+endif
-+
- libgdkinclude_HEADERS =3D 	\
- 	gdkx.h
-=20
-+if HAVE_OPENGL
-+GDKX_HEADER =3D gdkx-with-gl-context.h
-+else
-+GDKX_HEADER =3D gdkx-without-gl-context.h
-+endif
-+
-+BUILT_SOURCES =3D gdkx.h
-+
-+.PHONY: gdkx.h
-+gdkx.h:
-+	$(AM_V_GEN) cd $(srcdir) \
-+	&& (cmp -s $(GDKX_HEADER) gdkx.h || cp $(GDKX_HEADER) gdkx.h )
-+
- libgdkx11include_HEADERS =3D 	\
- 	gdkx-autocleanups.h	\
- 	gdkx11applaunchcontext.h \
-@@ -77,7 +93,6 @@ libgdkx11include_HEADERS =3D 	\
- 	gdkx11display.h		\
- 	gdkx11displaymanager.h	\
- 	gdkx11dnd.h		\
--	gdkx11glcontext.h	\
- 	gdkx11keys.h		\
- 	gdkx11monitor.h		\
- 	gdkx11property.h	\
-@@ -87,10 +102,17 @@ libgdkx11include_HEADERS =3D 	\
- 	gdkx11visual.h		\
- 	gdkx11window.h
-=20
-+if HAVE_OPENGL
-+libgdkx11include_HEADERS +=3D gdkx11glcontext.h
-+endif
-+
- # We need to include all these C files here since the conditionals
- # don't seem to be correctly expanded for the dist files.
- EXTRA_DIST +=3D 			\
-+	gdkx.h			\
- 	gdksettings.c	\
- 	meson.build
-=20
-+MAINTAINERCLEANFILES =3D gdkx.h
-+
- -include $(top_srcdir)/git.mk
-diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 7e08f472cc..30fd7b6089 100644
---- a/gdk/x11/gdkdisplay-x11.c
-+++ b/gdk/x11/gdkdisplay-x11.c
-@@ -37,7 +37,9 @@
- #include "gdkdisplay-x11.h"
- #include "gdkprivate-x11.h"
- #include "gdkscreen-x11.h"
-+#ifdef HAVE_OPENGL
- #include "gdkglcontext-x11.h"
-+#endif
- #include "gdk-private.h"
- #include "gdkprofilerprivate.h"
-=20
-@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cla=
ss)
-   display_class->text_property_to_utf8_list =3D _gdk_x11_display_text_pro=
perty_to_utf8_list;
-   display_class->utf8_to_string_target =3D _gdk_x11_display_utf8_to_strin=
g_target;
-=20
--  display_class->make_gl_context_current =3D gdk_x11_display_make_gl_cont=
ext_current;
-+#ifdef HAVE_OPENGL
-+   display_class->make_gl_context_current =3D gdk_x11_display_make_gl_con=
text_current;
-+#endif
-=20
-   display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
-=20
-diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index c2b7480c48..114fd4c67a 100644
---- a/gdk/x11/gdkscreen-x11.c
-+++ b/gdk/x11/gdkscreen-x11.c
-@@ -1842,3 +1842,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *scree=
n)
- {
-   return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
- }
-+
-+#ifndef HAVE_OPENGL
-+/* Function from in gdk/x11/gdkglcontext-x11.c */
-+void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
-+#endif
-diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 194bc82e29..0302bb68d4 100644
---- a/gdk/x11/gdkwindow-x11.c
-+++ b/gdk/x11/gdkwindow-x11.c
-@@ -36,7 +36,9 @@
- #include "gdkasync.h"
- #include "gdkeventsource.h"
- #include "gdkdisplay-x11.h"
-+#ifdef HAVE_OPENGL
- #include "gdkglcontext-x11.h"
-+#endif
- #include "gdkprivate-x11.h"
- #include "gdk-private.h"
-=20
-@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
-   impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
-   impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
-   impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
-+#ifdef HAVE_OPENGL
-   impl_class->create_gl_context =3D gdk_x11_window_create_gl_context;
-   impl_class->invalidate_for_new_frame =3D gdk_x11_window_invalidate_for_=
new_frame;
-+#endif
-   impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
- }
-diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
-index edb0ea7dbf..a317d61cca 100644
---- a/gdk/x11/gdkx-autocleanups.h
-+++ b/gdk/x11/gdkx-autocleanups.h
-@@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_=
unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Display, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DisplayManager, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DragContext, g_object_unref)
-+#ifdef HAVE_OPENGL
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11GLContext, g_object_unref)
-+#endif
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
- G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
-diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx-with-gl-context.h
-similarity index 98%
-rename from gdk/x11/gdkx.h
-rename to gdk/x11/gdkx-with-gl-context.h
-index 1f64bccb6d..ae05fa6b1f 100644
---- a/gdk/x11/gdkx.h
-+++ b/gdk/x11/gdkx-with-gl-context.h
-@@ -45,7 +45,6 @@
- #include <gdk/x11/gdkx11dnd.h>
- #include <gdk/x11/gdkx11glcontext.h>
- #include <gdk/x11/gdkx11keys.h>
--#include <gdk/x11/gdkx11monitor.h>
- #include <gdk/x11/gdkx11property.h>
- #include <gdk/x11/gdkx11screen.h>
- #include <gdk/x11/gdkx11selection.h>
-diff --git a/gdk/x11/gdkx-without-gl-context.h b/gdk/x11/gdkx-without-gl-c=
ontext.h
-new file mode 100644
-index 0000000000..c9e261720f
---- /dev/null
-+++ b/gdk/x11/gdkx-without-gl-context.h
-@@ -0,0 +1,58 @@
-+/* GDK - The GIMP Drawing Kit
-+ * Copyright (C) 1995-1997 Peter Mattis, Spencer Kimball and Josh MacDona=
ld
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library. If not, see <http://www.gnu.org/licen=
ses/>.
-+ */
-+
-+/*
-+ * Modified by the GTK+ Team and others 1997-2000.  See the AUTHORS
-+ * file for a list of people on the GTK+ Team.  See the ChangeLog
-+ * files for a list of changes.  These files are distributed with
-+ * GTK+ at ftp://ftp.gtk.org/pub/gtk/.
-+ */
-+
-+#ifndef __GDK_X_H__
-+#define __GDK_X_H__
-+
-+#include <gdk/gdk.h>
-+
-+#include <X11/Xlib.h>
-+#include <X11/Xutil.h>
-+
-+#define __GDKX_H_INSIDE__
-+
-+#include <gdk/x11/gdkx11applaunchcontext.h>
-+#include <gdk/x11/gdkx11cursor.h>
-+#include <gdk/x11/gdkx11device.h>
-+#include <gdk/x11/gdkx11device-core.h>
-+#include <gdk/x11/gdkx11device-xi2.h>
-+#include <gdk/x11/gdkx11devicemanager.h>
-+#include <gdk/x11/gdkx11devicemanager-core.h>
-+#include <gdk/x11/gdkx11devicemanager-xi2.h>
-+#include <gdk/x11/gdkx11display.h>
-+#include <gdk/x11/gdkx11displaymanager.h>
-+#include <gdk/x11/gdkx11dnd.h>
-+#include <gdk/x11/gdkx11keys.h>
-+#include <gdk/x11/gdkx11property.h>
-+#include <gdk/x11/gdkx11screen.h>
-+#include <gdk/x11/gdkx11selection.h>
-+#include <gdk/x11/gdkx11utils.h>
-+#include <gdk/x11/gdkx11visual.h>
-+#include <gdk/x11/gdkx11window.h>
-+
-+#include <gdk/x11/gdkx-autocleanups.h>
-+
-+#undef __GDKX_H_INSIDE__
-+
-+#endif /* __GDK_X_H__ */
-diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 946e72febc..b01da7f128 100644
---- a/gtk/Makefile.am
-+++ b/gtk/Makefile.am
-@@ -467,7 +467,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkpri=
vatetypebuiltins.h $(top_s
- 	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-=
gtfsrc.c | \
- 	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
- 	  sort | uniq | \
--	  $(SED) '{ s/^/*tp++ =3D /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_s=
ocket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; }' >> xgen-gtf \
-+	  $(SED) '{ s/^/*tp++ =3D /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_s=
ocket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; s/^.*gdk_x11_gl.*$$/#ifd=
ef HAVE_OPENGL\n&\n#endif/; }' >> xgen-gtf \
- 	&& cp xgen-gtf $@ && rm -f xgen-gtf
- $(srcdir)/gtktestutils.c: gtktypefuncs.inc
-=20
-diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 802303ea9f..33001cfb61 100644
---- a/gtk/gtkglarea.c
-+++ b/gtk/gtkglarea.c
-@@ -29,7 +29,9 @@
- #include "gtkprivate.h"
- #include "gtkrender.h"
-=20
-+#ifdef HAVE_OPENGL
- #include <epoxy/gl.h>
-+#endif
-=20
- /**
-  * SECTION:gtkglarea
-@@ -369,9 +371,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
- static void
- gtk_gl_area_resize (GtkGLArea *area, int width, int height)
- {
-+#ifdef HAVE_OPENGL
-   glViewport (0, 0, width, height);
-+#endif
- }
-=20
-+#ifdef HAVE_OPENGL
- /*
-  * Creates all the buffer objects needed for rendering the scene
-  */
-@@ -483,6 +488,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
-=20
-   priv->needs_render =3D TRUE;
- }
-+#endif
-=20
- /**
-  * gtk_gl_area_attach_buffers:
-@@ -501,6 +507,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
- void
- gtk_gl_area_attach_buffers (GtkGLArea *area)
- {
-+#ifdef HAVE_OPENGL
-   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
-=20
-   g_return_if_fail (GTK_IS_GL_AREA (area));
-@@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
-         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
-                                    GL_RENDERBUFFER, priv->depth_stencil_b=
uffer);
-     }
-+#endif
- }
-=20
- static void
- gtk_gl_area_delete_buffers (GtkGLArea *area)
- {
-+#ifdef HAVE_OPENGL
-   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
-=20
-   if (priv->context =3D=3D NULL)
-@@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
-       glDeleteFramebuffers (1, &priv->frame_buffer);
-       priv->frame_buffer =3D 0;
-     }
-+#endif
- }
-=20
- static void
-@@ -679,6 +689,7 @@ gtk_gl_area_draw (GtkWidget *widget,
-   GtkGLArea *area =3D GTK_GL_AREA (widget);
-   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
-   gboolean unused;
-+#ifdef HAVE_OPENGL
-   int w, h, scale;
-   GLenum status;
-=20
-@@ -690,7 +701,6 @@ gtk_gl_area_draw (GtkWidget *widget,
-                                      gtk_widget_get_allocated_height (wid=
get));
-       return FALSE;
-     }
--
-   if (priv->context =3D=3D NULL)
-     return FALSE;
-=20
-@@ -736,6 +746,14 @@ gtk_gl_area_draw (GtkWidget *widget,
-     }
-=20
-   return TRUE;
-+#else
-+  if (priv->error !=3D NULL)
-+      gtk_gl_area_draw_error_screen (area,
-+                                     cr,
-+                                     gtk_widget_get_allocated_width (widg=
et),
-+                                     gtk_widget_get_allocated_height (wid=
get));
-+  return FALSE;
-+#endif
- }
-=20
- static gboolean
-diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 4fd0c3039c..a8e59ed077 100644
---- a/gtk/inspector/general.c
-+++ b/gtk/inspector/general.c
-@@ -33,8 +33,10 @@
-=20
- #ifdef GDK_WINDOWING_X11
- #include "x11/gdkx.h"
-+#ifdef HAVE_OPENGL
- #include <epoxy/glx.h>
- #endif
-+#endif
-=20
- #ifdef GDK_WINDOWING_WIN32
- #include "win32/gdkwin32.h"
-@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
-   gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
- }
-=20
-+#ifdef HAVE_OPENGL
- #ifdef GDK_WINDOWING_X11
- static void
- append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
-   add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_gl=
x_extension (dpy, 0, ext), 0);
- }
- #endif
-+#endif
-=20
- #ifdef GDK_WINDOWING_WAYLAND
- static void
-@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
- static void
- init_gl (GtkInspectorGeneral *gen)
- {
-+#ifdef HAVE_OPENGL
- #ifdef GDK_WINDOWING_X11
-   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
-     {
-@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
-     }
-   else
- #endif
-+#endif
- #ifdef GDK_WINDOWING_WAYLAND
-   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
-     {
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index f283e89831..5e7180e923 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -80,8 +80,6 @@ noinst_PROGRAMS =3D  $(TEST_PROGS)	\
- 	testfullscreen			\
- 	testgeometry			\
- 	testgiconpixbuf			\
--	testglarea			\
--	testglblending			\
- 	testgrid			\
- 	testgtk				\
- 	testheaderbar			\
-@@ -172,12 +170,18 @@ noinst_PROGRAMS =3D  $(TEST_PROGS)	\
- 	testactionbar			\
- 	testwindowsize			\
- 	testpopover			\
--	gdkgears			\
- 	listmodel			\
- 	testpopup			\
- 	testpopupat			\
- 	$(NULL)
-=20
-+if HAVE_OPENGL
-+noinst_PROGRAMS +=3D
-+	testglarea			\
-+	testglblending			\
-+	gdkgears
-+endif
-+
- if USE_WAYLAND
- noinst_PROGRAMS +=3D testforeign
- endif
-diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fina=
lize.c
-index 24540e313f..e0f863ab6a 100644
---- a/testsuite/gtk/objects-finalize.c
-+++ b/testsuite/gtk/objects-finalize.c
-@@ -116,7 +116,9 @@ main (int argc, char **argv)
- 	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
- 	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
- 	  all_types[i] !=3D GDK_TYPE_X11_DISPLAY_MANAGER &&
-+#ifdef HAVE_OPENGL
- 	  all_types[i] !=3D GDK_TYPE_X11_GL_CONTEXT &&
-+#endif
- #endif
- 	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbu=
f_loader_close() */
- 	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
---=20
-2.34.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch b/meta/recipes-=
gnome/gtk+/gtk+3/buildpaths.patch
new file mode 100644
index 0000000000..627d1d4b7e
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
@@ -0,0 +1,57 @@
+Use basename not full filename to remove buildpaths from the packages.
+
+Upstream-Status: Backport [8eb4e59613a0979757332eb833231b947d61f13d]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/gdk/gdkenumtypes.c.template b/gdk/gdkenumtypes.c.template
+index df9edfefa1..c5104e0e0d 100644
+--- a/gdk/gdkenumtypes.c.template
++++ b/gdk/gdkenumtypes.c.template
+@@ -5,7 +5,7 @@
+ /*** END file-header ***/
+=20
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+diff --git a/gtk/gtkprivatetypebuiltins.c.template b/gtk/gtkprivatetypebui=
ltins.c.template
+index 2565208bfc..d7961be8ef 100644
+--- a/gtk/gtkprivatetypebuiltins.c.template
++++ b/gtk/gtkprivatetypebuiltins.c.template
+@@ -7,7 +7,7 @@
+ /*** END file-header ***/
+=20
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+diff --git a/gtk/gtkprivatetypebuiltins.h.template b/gtk/gtkprivatetypebui=
ltins.h.template
+index a21e9aac05..5ecd4d392f 100644
+--- a/gtk/gtkprivatetypebuiltins.h.template
++++ b/gtk/gtkprivatetypebuiltins.h.template
+@@ -14,7 +14,7 @@ G_BEGIN_DECLS
+=20
+ /*** BEGIN file-production ***/
+=20
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
+diff --git a/gtk/gtktypebuiltins.c.template b/gtk/gtktypebuiltins.c.templa=
te
+index f4d748b7b9..9a5a360f09 100644
+--- a/gtk/gtktypebuiltins.c.template
++++ b/gtk/gtktypebuiltins.c.template
+@@ -6,7 +6,7 @@
+ /*** END file-header ***/
+=20
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+=20
+ /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch b/meta/recipe=
s-gnome/gtk+/gtk+3/link_fribidi.patch
deleted file mode 100644
index e4bbd799f1..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/link_fribidi.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Link with libfribidi, this is to avoid under linking where these functions=
 are
-used but the library is not linked in, and they are marked undefined by BF=
D linker
-but gold linker refuses to link
-
-| ./.libs/libgdk-3.so: error: undefined reference to 'fribidi_get_bidi_typ=
e'
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
---- a/gdk/Makefile.am
-+++ b/gdk/Makefile.am
-@@ -55,6 +55,7 @@ LDADD =3D 					\
- 	-version-info $(LT_VERSION_INFO)	\
- 	-export-dynamic 			\
- 	-rpath $(libdir) 			\
-+	-lfribidi	 			\
- 	$(no_undefined)
-=20
- #
diff --git a/meta/recipes-gnome/gtk+/gtk+3/meson.build b/meta/recipes-gnome=
/gtk+/gtk+3/meson.build
new file mode 100644
index 0000000000..94cf47a37f
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/meson.build
@@ -0,0 +1,14 @@
+# This file is missing from the 3.24.35 tarball
+
+wayland_cursor_sources =3D files([
+  'wayland-cursor.c',
+  'xcursor.c',
+  'os-compatibility.c'
+])
+
+libwayland_cursor =3D static_library('wayland+cursor',
+  sources: wayland_cursor_sources,
+  include_directories: [ confinc, ],
+  dependencies: [ glib_dep, wlclientdep, ],
+  c_args: common_cflags,
+)
diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnom=
e/gtk+/gtk+3/opengl.patch
new file mode 100644
index 0000000000..ddec2c72d7
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -0,0 +1,765 @@
+From a6fb8ee9cfd5e0f8c4450d48b582614e2de8201c Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 16 Oct 2015 16:35:16 +0300
+Subject: [PATCH] Do not try to initialize GL without libGL
+
+_gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
+GLX api which will exit() if libGL.so.1 is not present. We do not
+want that to happen and we don't want every app to have to set
+"GDK_GL=3Ddisabled" environment variable: so use #ifdef set based on
+opengl distro feature.
+
+Upstream is not interested in the fix as it is: Either epoxy should be
+fixed (to not exit) or GTK+ possibly could do some additional probing
+before calling epoxy APIs.
+
+Upstream-Status: Denied
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ config.h.meson                   |  2 ++
+ demos/gtk-demo/meson.build       |  5 ++++-
+ docs/tools/meson.build           |  7 +++++--
+ docs/tools/widgets.c             |  6 +++++-
+ gdk/gdkconfig.h.meson            |  1 +
+ gdk/gdkdisplay.c                 |  4 ++++
+ gdk/gdkgl.c                      | 10 ++++++++++
+ gdk/gdkglcontext.c               |  6 ++++++
+ gdk/gdkwindow.c                  | 13 +++++++++++++
+ gdk/meson.build                  |  8 +++++++-
+ gdk/x11/Makefile.am              |  2 --
+ gdk/x11/gdkdisplay-x11.c         |  6 +++++-
+ gdk/x11/gdkvisual-x11.c          |  5 +++++
+ gdk/x11/gdkwindow-x11.c          |  4 ++++
+ gdk/x11/gdkx-autocleanups.h      |  2 ++
+ gdk/x11/gdkx.h                   |  2 ++
+ gdk/x11/meson.build              |  7 +++++--
+ gtk/gtkglarea.c                  | 19 +++++++++++++++++++
+ gtk/inspector/general.c          |  6 ++++++
+ meson.build                      | 17 ++++++++++++++---
+ meson_options.txt                |  2 ++
+ tests/meson.build                |  9 +++++++--
+ testsuite/gtk/objects-finalize.c |  2 ++
+ 23 files changed, 130 insertions(+), 15 deletions(-)
+
+diff --git a/config.h.meson b/config.h.meson
+index b502611cb7..0bf6678d5e 100644
+--- a/config.h.meson
++++ b/config.h.meson
+@@ -20,6 +20,8 @@
+ /* define if we have colord */
+ #mesondefine HAVE_COLORD
+=20
++#mesondefine HAVE_OPENGL
++
+ /* Define if the GNU dcgettext() function is already present or preinstal=
led.
+    */
+ #mesondefine HAVE_DCGETTEXT
+diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
+index 252da16d05..4b57cff6ac 100644
+--- a/demos/gtk-demo/meson.build
++++ b/demos/gtk-demo/meson.build
+@@ -28,7 +28,6 @@ demos =3D files([
+   'fishbowl.c',
+   'foreigndrawing.c',
+   'gestures.c',
+-  'glarea.c',
+   'headerbar.c',
+   'hypertext.c',
+   'iconview.c',
+@@ -87,6 +86,10 @@ elif harfbuzz_dep.found() and pangoft_dep.found()
+   gtkdemo_deps +=3D [harfbuzz_dep, pangoft_dep]
+ endif
+=20
++if opengl_enabled
++  demos +=3D files('glarea.c')
++endif
++
+ if os_unix
+   demos +=3D files('pagesetup.c')
+ endif
+diff --git a/docs/tools/meson.build b/docs/tools/meson.build
+index 05621ee7ed..3d0a333b32 100644
+--- a/docs/tools/meson.build
++++ b/docs/tools/meson.build
+@@ -2,10 +2,13 @@ if x11_enabled
+   doc_shooter_sources =3D [
+     'shadow.c',
+     'shooter.c',
+-    'widgets.c',
+-    '../../tests/gtkgears.c',
++    'widgets.c'
+   ]
+=20
++  if opengl_enabled
++  doc_shooter_sources +=3D ['../../tests/gtkgears.c']
++  endif
++
+   doc_shooter =3D executable('doc-shooter', doc_shooter_sources,
+                            include_directories: [ confinc, gdkinc, gtkinc=
, testinc, ],
+                            dependencies: libgtk_dep)
+diff --git a/docs/tools/widgets.c b/docs/tools/widgets.c
+index 932daf1746..348807e133 100644
+--- a/docs/tools/widgets.c
++++ b/docs/tools/widgets.c
+@@ -8,7 +8,9 @@
+ #include <X11/Xatom.h>
+ #include <gdkx.h>
+ #include "widgets.h"
++#ifdef HAVE_OPENGL
+ #include "gtkgears.h"
++#endif
+=20
+ #define SMALL_WIDTH  240
+ #define SMALL_HEIGHT 75
+@@ -1526,9 +1528,11 @@ create_gl_area (void)
+   widget =3D gtk_frame_new (NULL);
+   gtk_frame_set_shadow_type (GTK_FRAME (widget), GTK_SHADOW_IN);
+=20
++#ifdef HAVE_OPENGL
+   gears =3D gtk_gears_new ();
+   gtk_container_add (GTK_CONTAINER (widget), gears);
+-=20
++#endif
++
+   info =3D new_widget_info ("glarea", widget, MEDIUM);
+=20
+   return info;
+diff --git a/gdk/gdkconfig.h.meson b/gdk/gdkconfig.h.meson
+index 7db19e0470..088651bafa 100644
+--- a/gdk/gdkconfig.h.meson
++++ b/gdk/gdkconfig.h.meson
+@@ -15,6 +15,7 @@ G_BEGIN_DECLS
+ #mesondefine GDK_WINDOWING_WAYLAND
+ #mesondefine GDK_WINDOWING_WIN32
+ #mesondefine GDK_WINDOWING_QUARTZ
++#mesondefine GDK_WITH_OPENGL
+=20
+ G_END_DECLS
+=20
+diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
+index 748f54860c..04ef2c09d4 100644
+--- a/gdk/gdkdisplay.c
++++ b/gdk/gdkdisplay.c
+@@ -2420,7 +2420,11 @@ gboolean
+ gdk_display_make_gl_context_current (GdkDisplay   *display,
+                                      GdkGLContext *context)
+ {
++#ifdef HAVE_OPENGL
+   return GDK_DISPLAY_GET_CLASS (display)->make_gl_context_current (displa=
y, context);
++#else
++  return FALSE;
++#endif
+ }
+=20
+ GdkRenderingMode
+diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
+index 9690077cc2..55f85ef605 100644
+--- a/gdk/gdkgl.c
++++ b/gdk/gdkgl.c
+@@ -26,7 +26,9 @@
+ # include "win32/gdkwin32.h"
+ #endif
+=20
++#ifdef HAVE_OPENGL
+ #include <epoxy/gl.h>
++#endif
+ #include <math.h>
+ #include <string.h>
+=20
+@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surfa=
ce,
+                                g_object_ref (window),  g_object_unref);
+ }
+=20
++#ifdef HAVE_OPENGL
+ static const char *
+ get_vertex_type_name (int type)
+ {
+@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint=
_data)
+       glUseProgram (paint_data->current_program->program);
+     }
+ }
++#endif
+=20
+ void
+ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+                       GdkTexturedQuad *quads,
+                       gboolean flip_colors)
+ {
++#ifdef HAVE_OPENGL
+   GdkGLContextPaintData *paint_data  =3D gdk_gl_context_get_paint_data (p=
aint_context);
+   GdkGLContextProgram *program;
+   GdkWindow *window =3D gdk_gl_context_get_window (paint_context);
+@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+=20
+   glDisableVertexAttribArray (program->position_location);
+   glDisableVertexAttribArray (program->uv_location);
++#endif
+ }
+=20
+ /* x,y,width,height describes a rectangle in the gl render buffer
+@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+                         int                   width,
+                         int                   height)
+ {
++#ifdef HAVE_OPENGL
+   GdkGLContext *paint_context;
+   cairo_surface_t *image;
+   cairo_matrix_t matrix;
+@@ -718,6 +725,7 @@ out:
+   if (clip_region)
+     cairo_region_destroy (clip_region);
+=20
++#endif
+ }
+=20
+ /* This is always called with the paint context current */
+@@ -725,6 +733,7 @@ void
+ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+ 			     cairo_region_t  *region)
+ {
++#ifdef HAVE_OPENGL
+   GdkGLContext *paint_context;
+   cairo_surface_t *image;
+   double device_x_offset, device_y_offset;
+@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+=20
+   glDisable (GL_SCISSOR_TEST);
+   glDeleteTextures (1, &texture_id);
++#endif
+ }
+diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
+index 3b23639e1c..1f04f8e0b2 100644
+--- a/gdk/gdkglcontext.c
++++ b/gdk/gdkglcontext.c
+@@ -85,7 +85,9 @@
+ #include "gdkintl.h"
+ #include "gdk-private.h"
+=20
++#ifdef HAVE_OPENGL
+ #include <epoxy/gl.h>
++#endif
+=20
+ typedef struct {
+   GdkDisplay *display;
+@@ -243,6 +245,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
+                                int              height,
+                                guint            texture_target)
+ {
++#ifdef HAVE_OPENGL
+   GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
+=20
+   g_return_if_fail (GDK_IS_GL_CONTEXT (context));
+@@ -286,6 +289,7 @@ gdk_gl_context_upload_texture (GdkGLContext    *contex=
t,
+             glTexSubImage2D (texture_target, 0, 0, i, width, 1, GL_BGRA, =
GL_UNSIGNED_INT_8_8_8_8_REV, (unsigned char*) data + (i * stride));
+         }
+     }
++#endif
+ }
+=20
+ static gboolean
+@@ -774,6 +778,7 @@ gdk_gl_context_realize (GdkGLContext  *context,
+ static void
+ gdk_gl_context_check_extensions (GdkGLContext *context)
+ {
++#ifdef HAVE_OPENGL
+   GdkGLContextPrivate *priv =3D gdk_gl_context_get_instance_private (cont=
ext);
+   gboolean has_npot, has_texture_rectangle;
+=20
+@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context=
)
+                        priv->use_texture_rectangle ? "yes" : "no"));
+=20
+   priv->extensions_checked =3D TRUE;
++#endif
+ }
+=20
+ /**
+diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
+index 727b0cf1f4..d4d91b0d16 100644
+--- a/gdk/gdkwindow.c
++++ b/gdk/gdkwindow.c
+@@ -45,7 +45,9 @@
+=20
+ #include <math.h>
+=20
++#ifdef HAVE_OPENGL
+ #include <epoxy/gl.h>
++#endif
+=20
+ /* for the use of round() */
+ #include "fallback-c89.c"
+@@ -2844,6 +2846,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window=
,
+ {
+   GError *internal_error =3D NULL;
+=20
++#ifndef HAVE_OPENGL
++  g_set_error_literal (error, GDK_GL_ERROR,
++                       GDK_GL_ERROR_NOT_AVAILABLE,
++                       _("GL support disabled with --disable-opengl"));
++  return NULL;
++#endif
++
+   if (_gdk_gl_flags & GDK_GL_DISABLE)
+     {
+       g_set_error_literal (error, GDK_GL_ERROR,
+@@ -2979,6 +2988,7 @@ gdk_window_begin_paint_internal (GdkWindow          =
  *window,
+         }
+       else
+         {
++#ifdef HAVE_OPENGL
+ 	  gdk_gl_context_make_current (context);
+           /* With gl we always need a surface to combine the gl
+              drawing with the native drawing. */
+@@ -2993,6 +3003,7 @@ gdk_window_begin_paint_internal (GdkWindow          =
  *window,
+           glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
+=20
+           glViewport (0, 0, ww, wh);
++#endif
+         }
+     }
+=20
+@@ -3056,6 +3067,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+=20
+           gdk_gl_context_make_current (window->gl_paint_context);
+=20
++#ifdef HAVE_OPENGL
+           if (!cairo_region_is_empty (opaque_region))
+             gdk_gl_texture_from_surface (window->current_paint.surface,
+                                          opaque_region);
+@@ -3066,6 +3078,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+                                            window->current_paint.need_ble=
nd_region);
+               glDisable(GL_BLEND);
+             }
++#endif
+=20
+           cairo_region_destroy (opaque_region);
+=20
+diff --git a/gdk/meson.build b/gdk/meson.build
+index 4bb1bf2b6c..64172b8d3e 100644
+--- a/gdk/meson.build
++++ b/gdk/meson.build
+@@ -56,7 +56,6 @@ gdk_gir_public_headers =3D files(
+   'gdkdrawingcontext.h',
+   'gdkevents.h',
+   'gdkframetimings.h',
+-  'gdkglcontext.h',
+   'gdkkeys.h',
+   'gdkkeysyms.h',
+   'gdkmain.h',
+@@ -78,6 +77,12 @@ gdk_gir_public_headers =3D files(
+   'gdkwindow.h',
+ )
+ gdk_nogir_public_headers =3D [files('gdkkeysyms-compat.h')]
++if opengl_enabled
++gdk_gir_public_headers +=3D files('gdkglcontext.h')
++else
++gdk_nogir_public_headers +=3D files('gdkglcontext.h')
++endif
++
+ gdk_public_headers =3D gdk_gir_public_headers + gdk_nogir_public_headers
+ install_headers(gdk_public_headers, subdir : 'gtk-3.0/gdk')
+=20
+@@ -166,6 +171,7 @@ gdkconfig_cdata.set('GDK_WINDOWING_WAYLAND', wayland_e=
nabled)
+ gdkconfig_cdata.set('GDK_WINDOWING_WIN32', win32_enabled)
+ gdkconfig_cdata.set('GDK_WINDOWING_BROADWAY', broadway_enabled)
+ gdkconfig_cdata.set('GDK_WINDOWING_QUARTZ', quartz_enabled)
++gdkconfig_cdata.set('GDK_WITH_OPENGL', opengl_enabled)
+=20
+ gdkconfig =3D configure_file(
+   input  : 'gdkconfig.h.meson',
+diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
+index 32b1f24434..d73eee604a 100644
+--- a/gdk/x11/Makefile.am
++++ b/gdk/x11/Makefile.am
+@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES =3D 	\
+ 	gdkeventtranslator.c	\
+ 	gdkeventtranslator.h	\
+ 	gdkgeometry-x11.c  	\
+-	gdkglcontext-x11.c	\
+-	gdkglcontext-x11.h	\
+ 	gdkkeys-x11.c		\
+ 	gdkmain-x11.c		\
+ 	gdkmonitor-x11.c	\
+diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
+index 7e08f472cc..30fd7b6089 100644
+--- a/gdk/x11/gdkdisplay-x11.c
++++ b/gdk/x11/gdkdisplay-x11.c
+@@ -37,7 +37,9 @@
+ #include "gdkdisplay-x11.h"
+ #include "gdkprivate-x11.h"
+ #include "gdkscreen-x11.h"
++#ifdef HAVE_OPENGL
+ #include "gdkglcontext-x11.h"
++#endif
+ #include "gdk-private.h"
+ #include "gdkprofilerprivate.h"
+=20
+@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * cla=
ss)
+   display_class->text_property_to_utf8_list =3D _gdk_x11_display_text_pro=
perty_to_utf8_list;
+   display_class->utf8_to_string_target =3D _gdk_x11_display_utf8_to_strin=
g_target;
+=20
+-  display_class->make_gl_context_current =3D gdk_x11_display_make_gl_cont=
ext_current;
++#ifdef HAVE_OPENGL
++   display_class->make_gl_context_current =3D gdk_x11_display_make_gl_con=
text_current;
++#endif
+=20
+   display_class->get_default_seat =3D gdk_x11_display_get_default_seat;
+=20
+diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
+index 81479d81f4..3c8c5c02ff 100644
+--- a/gdk/x11/gdkvisual-x11.c
++++ b/gdk/x11/gdkvisual-x11.c
+@@ -306,7 +306,12 @@ _gdk_x11_screen_init_visuals (GdkScreen *screen)
+   /* If GL is available we want to pick better default/rgba visuals,
+      as we care about glx details such as alpha/depth/stencil depth,
+      stereo and double buffering */
++  /* update_visuals_for_gl() will end up calling epoxy GLX api which
++     will exit if libgl is not there: so only do this if we know GL
++     is available */
++#ifdef HAVE_GLX
+   _gdk_x11_screen_update_visuals_for_gl (screen);
++#endif
+ }
+=20
+ gint
+diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
+index 194bc82e29..0302bb68d4 100644
+--- a/gdk/x11/gdkwindow-x11.c
++++ b/gdk/x11/gdkwindow-x11.c
+@@ -36,7 +36,9 @@
+ #include "gdkasync.h"
+ #include "gdkeventsource.h"
+ #include "gdkdisplay-x11.h"
++#ifdef HAVE_OPENGL
+ #include "gdkglcontext-x11.h"
++#endif
+ #include "gdkprivate-x11.h"
+ #include "gdk-private.h"
+=20
+@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Clas=
s *klass)
+   impl_class->set_opaque_region =3D gdk_x11_window_set_opaque_region;
+   impl_class->set_shadow_width =3D gdk_x11_window_set_shadow_width;
+   impl_class->show_window_menu =3D gdk_x11_window_show_window_menu;
++#ifdef HAVE_OPENGL
+   impl_class->create_gl_context =3D gdk_x11_window_create_gl_context;
+   impl_class->invalidate_for_new_frame =3D gdk_x11_window_invalidate_for_=
new_frame;
++#endif
+   impl_class->get_unscaled_size =3D gdk_x11_window_get_unscaled_size;
+ }
+diff --git a/gdk/x11/gdkx-autocleanups.h b/gdk/x11/gdkx-autocleanups.h
+index edb0ea7dbf..a317d61cca 100644
+--- a/gdk/x11/gdkx-autocleanups.h
++++ b/gdk/x11/gdkx-autocleanups.h
+@@ -30,7 +30,9 @@ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DeviceXI2, g_object_=
unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Display, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DisplayManager, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11DragContext, g_object_unref)
++#ifdef HAVE_OPENGL
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11GLContext, g_object_unref)
++#endif
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Keymap, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Screen, g_object_unref)
+ G_DEFINE_AUTOPTR_CLEANUP_FUNC(GdkX11Visual, g_object_unref)
+diff --git a/gdk/x11/gdkx.h b/gdk/x11/gdkx.h
+index 1f64bccb6d..4db6c18351 100644
+--- a/gdk/x11/gdkx.h
++++ b/gdk/x11/gdkx.h
+@@ -43,7 +43,9 @@
+ #include <gdk/x11/gdkx11display.h>
+ #include <gdk/x11/gdkx11displaymanager.h>
+ #include <gdk/x11/gdkx11dnd.h>
++#ifdef GDK_WITH_OPENGL
+ #include <gdk/x11/gdkx11glcontext.h>
++#endif
+ #include <gdk/x11/gdkx11keys.h>
+ #include <gdk/x11/gdkx11monitor.h>
+ #include <gdk/x11/gdkx11property.h>
+diff --git a/gdk/x11/meson.build b/gdk/x11/meson.build
+index 754ae0a615..0318c83877 100644
+--- a/gdk/x11/meson.build
++++ b/gdk/x11/meson.build
+@@ -14,7 +14,6 @@ gdk_x11_sources =3D files(
+   'gdkeventsource.c',
+   'gdkeventtranslator.c',
+   'gdkgeometry-x11.c',
+-  'gdkglcontext-x11.c',
+   'gdkkeys-x11.c',
+   'gdkmain-x11.c',
+   'gdkproperty-x11.c',
+@@ -42,7 +41,6 @@ gdk_x11_public_headers =3D files(
+   'gdkx11display.h',
+   'gdkx11displaymanager.h',
+   'gdkx11dnd.h',
+-  'gdkx11glcontext.h',
+   'gdkx11keys.h',
+   'gdkx11monitor.h',
+   'gdkx11property.h',
+@@ -53,6 +51,11 @@ gdk_x11_public_headers =3D files(
+   'gdkx11window.h',
+ )
+=20
++if opengl_enabled
++  gdk_x11_sources +=3D files('gdkglcontext-x11.c')
++  gdk_x11_public_headers +=3D files('gdkx11glcontext.h')
++endif
++
+ install_headers(gdk_x11_public_headers, subdir: 'gtk-3.0/gdk/x11/')
+ install_headers('gdkx.h', subdir: 'gtk-3.0/gdk/')
+=20
+diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
+index 802303ea9f..6439d7745d 100644
+--- a/gtk/gtkglarea.c
++++ b/gtk/gtkglarea.c
+@@ -29,7 +29,9 @@
+ #include "gtkprivate.h"
+ #include "gtkrender.h"
+=20
++#ifdef HAVE_OPENGL
+ #include <epoxy/gl.h>
++#endif
+=20
+ /**
+  * SECTION:gtkglarea
+@@ -369,9 +371,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
+ static void
+ gtk_gl_area_resize (GtkGLArea *area, int width, int height)
+ {
++#ifdef HAVE_OPENGL
+   glViewport (0, 0, width, height);
++#endif
+ }
+=20
++#ifdef HAVE_OPENGL
+ /*
+  * Creates all the buffer objects needed for rendering the scene
+  */
+@@ -483,6 +488,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+=20
+   priv->needs_render =3D TRUE;
+ }
++#endif
+=20
+ /**
+  * gtk_gl_area_attach_buffers:
+@@ -501,6 +507,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+ void
+ gtk_gl_area_attach_buffers (GtkGLArea *area)
+ {
++#ifdef HAVE_OPENGL
+   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
+=20
+   g_return_if_fail (GTK_IS_GL_AREA (area));
+@@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
+         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
+                                    GL_RENDERBUFFER, priv->depth_stencil_b=
uffer);
+     }
++#endif
+ }
+=20
+ static void
+ gtk_gl_area_delete_buffers (GtkGLArea *area)
+ {
++#ifdef HAVE_OPENGL
+   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
+=20
+   if (priv->context =3D=3D NULL)
+@@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
+       glDeleteFramebuffers (1, &priv->frame_buffer);
+       priv->frame_buffer =3D 0;
+     }
++#endif
+ }
+=20
+ static void
+@@ -679,6 +689,7 @@ gtk_gl_area_draw (GtkWidget *widget,
+   GtkGLArea *area =3D GTK_GL_AREA (widget);
+   GtkGLAreaPrivate *priv =3D gtk_gl_area_get_instance_private (area);
+   gboolean unused;
++#ifdef HAVE_OPENGL
+   int w, h, scale;
+   GLenum status;
+=20
+@@ -736,6 +747,14 @@ gtk_gl_area_draw (GtkWidget *widget,
+     }
+=20
+   return TRUE;
++#else
++  if (priv->error !=3D NULL)
++      gtk_gl_area_draw_error_screen (area,
++                                     cr,
++                                     gtk_widget_get_allocated_width (widg=
et),
++                                     gtk_widget_get_allocated_height (wid=
get));
++  return FALSE;
++#endif
+ }
+=20
+ static gboolean
+diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
+index 4fd0c3039c..a8e59ed077 100644
+--- a/gtk/inspector/general.c
++++ b/gtk/inspector/general.c
+@@ -33,8 +33,10 @@
+=20
+ #ifdef GDK_WINDOWING_X11
+ #include "x11/gdkx.h"
++#ifdef HAVE_OPENGL
+ #include <epoxy/glx.h>
+ #endif
++#endif
+=20
+ #ifdef GDK_WINDOWING_WIN32
+ #include "win32/gdkwin32.h"
+@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
+   gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
+ }
+=20
++#ifdef HAVE_OPENGL
+ #ifdef GDK_WINDOWING_X11
+ static void
+ append_glx_extension_row (GtkInspectorGeneral *gen,
+@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+   add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_gl=
x_extension (dpy, 0, ext), 0);
+ }
+ #endif
++#endif
+=20
+ #ifdef GDK_WINDOWING_WAYLAND
+ static void
+@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
+ static void
+ init_gl (GtkInspectorGeneral *gen)
+ {
++#ifdef HAVE_OPENGL
+ #ifdef GDK_WINDOWING_X11
+   if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
+     {
+@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
+     }
+   else
+ #endif
++#endif
+ #ifdef GDK_WINDOWING_WAYLAND
+   if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
+     {
+diff --git a/meson.build b/meson.build
+index f2e63a8655..eea5347930 100644
+--- a/meson.build
++++ b/meson.build
+@@ -136,6 +136,7 @@ wayland_enabled        =3D get_option('wayland_backend=
')
+ broadway_enabled       =3D get_option('broadway_backend')
+ quartz_enabled         =3D get_option('quartz_backend')
+ win32_enabled          =3D get_option('win32_backend')
++opengl_enabled         =3D get_option('opengl')
+=20
+ os_unix   =3D false
+ os_linux  =3D false
+@@ -450,7 +451,7 @@ pangocairo_dep =3D dependency('pangocairo', version: c=
airo_req,
+                             fallback : ['pango', 'libpangocairo_dep'])
+ pixbuf_dep     =3D dependency('gdk-pixbuf-2.0', version: gdk_pixbuf_req,
+                             fallback : ['gdk-pixbuf', 'gdkpixbuf_dep'])
+-epoxy_dep      =3D dependency('epoxy', version: epoxy_req,
++epoxy_dep      =3D dependency('epoxy', version: epoxy_req, required: open=
gl_enabled,
+                             fallback: ['libepoxy', 'libepoxy_dep'])
+ atk_dep        =3D dependency('atk', version: atk_req,
+                             fallback : ['atk', 'libatk_dep'])
+@@ -496,6 +497,10 @@ if tracker3_enabled
+   endif
+ endif
+=20
++if opengl_enabled
++  cdata.set('HAVE_OPENGL', 1)
++endif
++
+ if iso_codes_dep.found()
+   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_pkgconfig_variab=
le('prefix'))
+ else
+@@ -926,9 +931,15 @@ else
+   gio_packages =3D ['gio-2.0', glib_req]
+ endif
+=20
++if opengl_enabled
++  epoxy_packages =3D ['epoxy', epoxy_req]
++else
++  epoxy_packages =3D []
++endif
++
+ pkgconf.set('GDK_PRIVATE_PACKAGES',
+             ' '.join(gio_packages + x11_pkgs + wayland_pkgs + cairo_backe=
nds +
+-                     ['epoxy', epoxy_req] + cloudproviders_packages +
++                     epoxy_packages + cloudproviders_packages +
+                      ['fribidi', fribidi_req]))
+=20
+ gtk_packages =3D ' '.join([
+@@ -942,7 +953,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+ # Requires.private
+ pc_gdk_extra_libs +=3D cairo_libs
+=20
+-gtk_private_packages =3D atk_pkgs + wayland_pkgs + ['epoxy', epoxy_req, '=
fribidi', fribidi_req]
++gtk_private_packages =3D atk_pkgs + wayland_pkgs + epoxy_packages + ['fri=
bidi', fribidi_req]
+ if wayland_enabled or x11_enabled
+   gtk_private_packages +=3D ['pangoft2']
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index 94099aa01e..8bd096896d 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -19,6 +19,8 @@ option('profiler', type: 'boolean', value: false,
+   description : 'Enable profiler support')
+ option('tracker3', type: 'boolean', value: false,
+   description : 'Enable Tracker3 filechooser search')
++option('opengl', type: 'boolean', value: true,
++  description : 'Enable use of GL')
+=20
+ # Print backends
+ option('print_backends', type : 'string', value : 'auto',
+diff --git a/tests/meson.build b/tests/meson.build
+index 586fe2f45e..6ecf317dde 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -5,7 +5,6 @@ gtk_tests =3D [
+   ['scrolling-performance', ['frame-stats.c', 'variable.c']],
+   ['blur-performance', ['../gtk/gtkcairoblur.c']],
+   ['flicker'],
+-  ['gdkgears', ['gtkgears.c']],
+   ['listmodel'],
+   ['motion-compression'],
+   ['styleexamples'],
+@@ -54,7 +53,6 @@ gtk_tests =3D [
+   ['testfullscreen'],
+   ['testgeometry'],
+   ['testgiconpixbuf'],
+-  ['testglblending', ['gtkgears.c']],
+   ['testgmenu'],
+   ['testgrid'],
+   ['testgrouping'],
+@@ -137,6 +135,13 @@ if x11_enabled
+   ]
+ endif
+=20
++if opengl_enabled
++  gtk_tests +=3D [
++    ['gdkgears', ['gtkgears.c']],
++    ['testglblending', ['gtkgears.c']],
++  ]
++endif
++
+ if os_linux
+   gtk_tests +=3D [['testfontchooserdialog']]
+ endif
+diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-fina=
lize.c
+index 24540e313f..e0f863ab6a 100644
+--- a/testsuite/gtk/objects-finalize.c
++++ b/testsuite/gtk/objects-finalize.c
+@@ -116,7 +116,9 @@ main (int argc, char **argv)
+ 	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
+ 	  all_types[i] !=3D GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
+ 	  all_types[i] !=3D GDK_TYPE_X11_DISPLAY_MANAGER &&
++#ifdef HAVE_OPENGL
+ 	  all_types[i] !=3D GDK_TYPE_X11_GL_CONTEXT &&
++#endif
+ #endif
+ 	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbu=
f_loader_close() */
+ 	  all_types[i] !=3D GDK_TYPE_PIXBUF_LOADER &&
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.35.bb
index 0b27e5c178..dae0d029df 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
@@ -3,9 +3,9 @@ require gtk+3.inc
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-$=
{PV}.tar.xz \
-           file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
-           file://0003-Add-disable-opengl-configure-option.patch \
-           file://link_fribidi.patch \
+           file://meson.build;subdir=3D${S}/gdk/wayland/cursor \
+           file://buildpaths.patch \
+           file://opengl.patch \
            file://CVE-2024-6655.patch \
            "
 SRC_URI[sha256sum] =3D "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06=
965629fef60bd1"
--=20
2.51.0


