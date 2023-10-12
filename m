Return-Path: <cordlandwehr@kde.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDD9CDB47E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 16:05:43 +0000 (UTC)
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by mx.groups.io with SMTP id smtpd.web11.16044.1697126738314257714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 09:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@kde.org header.s=users header.b=fC2yiq5+;
 spf=pass (domain: kde.org, ip: 46.43.1.242, mailfrom: cordlandwehr@kde.org)
Received: from behemoth.fritz.box (p200300e27f452f00a212083d4da86f62.dip0.t-ipconnect.de [IPv6:2003:e2:7f45:2f00:a212:83d:4da8:6f62])
	(Authenticated sender: cordlandwehr)
	by letterbox.kde.org (Postfix) with ESMTPSA id 6EE6B32CDE9;
	Thu, 12 Oct 2023 17:05:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1697126735; bh=TAPJg0Bd876MFzzBrjQjqeYO4hNOt+EnZM+jfmGG5BU=;
	h=From:To:Cc:Subject:Date:From;
	b=fC2yiq5+Vra9vOa78GXzRLUxEzyDrPjeAans8Mi55kBwmfTPCMykcRt59cpOviRDk
	 Buz+H+fhCRnFn0p3nQaL5wWFpQmVSpYEGjVydJODYumCNbyOiwUjbAszW6frHPrUrs
	 3L8KDRvlWABPIsLOTyyHZuQly8Zpls3shafSc4qSc+rhM1HbI7Cprie4Ewhs/cdRdU
	 chIYz/sQMK6v1LOfc5GzLutKsNM0kENwCoc0t6j0jM854SkG617t7tjRPWyu4PRr6l
	 qp5JYoIXr3E0Bn7n9VtldskVl9dq1K2A/YeCeEZtd8qLqYGC4yQWfvNQxwNZ0LWiQ7
	 9AWBCuBRztelA==
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Cc: Andreas Cord-Landwehr <cordlandwehr@kde.org>
Subject: [PATCH v3] wayland: consider pkgconfig sysroot for pkgdatadir
Date: Thu, 12 Oct 2023 18:05:26 +0200
Message-Id: <20231012160526.3669278-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 16:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189007

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
 ...der-pkgconfig-sysroot-for-pkgdatadir.patch | 48 +++++++++++++++++++
 .../wayland/wayland_1.22.0.bb                 |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0002-Consider-p=
kgconfig-sysroot-for-pkgdatadir.patch

diff --git a/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfi=
g-sysroot-for-pkgdatadir.patch b/meta/recipes-graphics/wayland/wayland/00=
02-Consider-pkgconfig-sysroot-for-pkgdatadir.patch
new file mode 100644
index 0000000000..6a102a8b8f
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0002-Consider-pkgconfig-sysro=
ot-for-pkgdatadir.patch
@@ -0,0 +1,48 @@
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
+
+Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
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


