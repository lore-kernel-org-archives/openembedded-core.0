Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1B9E748ED
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 10:28:32 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.57074.1696156103411880897
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 03:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=H10UAAjx;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f452f00482c03ce67d1e4ad.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:482c:3ce:67d1:e4ad])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id EF60F32C765;
	Sun,  1 Oct 2023 11:28:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1696156102; bh=hEyW6e+cPECeLss7aTtynDSpZGk5Uq06OMJ7V4EIIpE=;
	h=From:To:Cc:Subject:Date:From;
	b=H10UAAjxYooL2DkJ2eoXRqHj039znrjJmrT6tfpxvNTd3V/L3B2bq+dtL2k55g7j7
	 NRleQE1k4uiOXj8/Nw42Kay/G7JQD0QZMX2jgnJ4Ogqu/OW0ggQI4q70T9lQs2625x
	 5QMpnOvMk/dqKJbH7es3i2a6Tr3e3NGq2M1yfMifABxPIWM1NeHkFhjuAgSHdAt1ZN
	 pWLdWg1+elh5t2Wiwhq/XHrk6qyG9RLmti1IkWnHgiE+eVmtN3BhdwlmHmvJ934CJE
	 ztGD+20UoKzb/7DTGDJHtqi8S13firPOtJ7W+Ew6iiORMFj8QKklcaIQEvvWM0EGt6
	 uZLfPTXuxf7+A==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [PATCH] wayland: consider pkgconfig sysroot for pkgdatadir
Date: Sun,  1 Oct 2023 12:28:18 +0200
Message-Id: <20231001102818.797907-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 10:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188480

Fix pkgconfig find calls to find wayland protocol XML files.
See discussion in:
https://gitlab.freedesktop.org/wayland/wayland/-/merge_requests/102

Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
---
 ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 46 +++++++++++++++++++
 .../wayland/wayland_1.22.0.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-p=
kgconfig-sysroot-for-pkgdatadir.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfi=
g-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/00=
02-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
new file mode 100644
index 0000000000..4573bb635a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysro=
ot-for-pkgdatadir.patch
@@ -0,0 +1,46 @@
+From ff8ecbe8891d592e645927659318720f9e190054 Mon Sep 17 00:00:00 2001
+From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
+Date: Sun, 6 Feb 2022 17:23:46 +0100
+Subject: [PATCH] Consider pkgconfig sysroot for pkgdatadir
+
+For libs/cflags this is done automatically, but not for manually accesse=
d
+variables. This matches what wayland-protocols does.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayla=
nd/-/merge_requests/272]
+---
+ src/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index a8a1d2b..721e151 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -65,7 +65,7 @@ if get_option('scanner')
+ 		version: meson.project_version(),
+ 		variables: [
+ 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
+-			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())=
,
++			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name()),
+ 			'bindir=3D' + join_paths('${prefix}', get_option('bindir')),
+ 			'wayland_scanner=3D${bindir}/wayland-scanner'
+ 		],
+@@ -211,7 +211,7 @@ if get_option('libraries')
+ 		filebase: 'wayland-server',
+ 		variables: [
+ 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
+-			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())
++			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name())
+ 		]
+ 	)
+
+@@ -250,7 +250,7 @@ if get_option('libraries')
+ 		filebase: 'wayland-client',
+ 		variables: [
+ 			'datarootdir=3D' + join_paths('${prefix}', get_option('datadir')),
+-			'pkgdatadir=3D' + join_paths('${datarootdir}', meson.project_name())
++			'pkgdatadir=3D' + join_paths('${pc_sysrootdir}${datarootdir}', meson=
.project_name())
+ 		]
+ 	)
+
+--
+2.37.2
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recip=
es-graphics/wayland/wayland_1.22.0.bb
index 26bad580eb..17e4a0cd98 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -15,6 +15,7 @@ DEPENDS =3D "expat libffi wayland-native"
 SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/$=
{PV}/downloads/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
+           file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
 SRC_URI[sha256sum] =3D "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936=
ebb7e7cbc2425842"
=20
--=20
2.39.2


