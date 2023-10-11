Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1551CDB482
	for <webhook@archiver.kernel.org>; Wed, 11 Oct 2023 19:20:43 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.25643.1697052040287874795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 12:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=JHiU52bX;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f452f00eb3717afe38b89d9.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:eb37:17af:e38b:89d9])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id EF02632D4EE;
	Wed, 11 Oct 2023 20:20:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1697052038; bh=w/VNl7v6qGF38FejNtwi5N4YT30/Kpq61nwIIWXMnvk=;
	h=From:To:Cc:Subject:Date:From;
	b=JHiU52bXTGd8/twd2ykcKSl5bCUcWPXTe5O7A9BAB2EXWyDfkYr6ZInhjvJTw+iNd
	 0fm06sdbKpioJqiiiz4pqU2RI4+99JIR60NjKwBn6A8Tk1AYYQn+aZylJrEe1az8H3
	 hdj7Rssdw6vNWY9LhHtmO8d7FsjcBjS925zXBiCq3HXJdrROB9uo43YK6ze7U6xs6t
	 bQrZuhnfJ3RsitESXbFCOMn+IVPKA+z8gH8xntlaaH+UJmhX3ztko9zmRhLITly5dm
	 5K7BgM/tF8n00m2BZoCW5lT/3e30h8jLXP2AQ4agdML1aw6xxCWOrQLvM8ZV86JECW
	 RLmNUMOnT09sw==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [PATCH v2] wayland: consider pkgconfig sysroot for pkgdatadir
Date: Wed, 11 Oct 2023 21:19:59 +0200
Message-Id: <20231011191959.3666657-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 19:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188970

Fix pkgconfig find calls to find wayland protocol XML files, which are
installed into /usr/share/wayland/. This patch fixes specifically the
call `pkg-config --variable=3Dpkgdatadir wayland-client` to locate the
folder containing wayland.xml. Without the patch, only the host system's
data dir /usr/share/wayland is reported (and that only when
wayland-protocols dev package is available) thus leaking a path from the
host system into the recipe build.

Access to wayland.xml is required by projects that generate wayland API
via waylandscanner like KDE's kwin or layer-shell-qt.

See further details of upstream discussion in:
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


