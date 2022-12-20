Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D1C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:55:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.49474.1671540943950305789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 784C92F4;
	Tue, 20 Dec 2022 04:56:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16D403F703;
	Tue, 20 Dec 2022 04:55:42 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] gtk+3: fix reproducible builds
Date: Tue, 20 Dec 2022 12:55:41 +0000
Message-Id: <20221220125541.3349917-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 12:55:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174848

We can't drop the missing meson.build file into the build tree via SRC_UR=
I
as then the timestamp of that file becomes the timestamp of the build,
which results in repeated builds having different timestamps.

Instead patch the file into the build, which doesn't change the SDE
every build.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gtk+/gtk+3/add-missing-meson.build.patch  | 38 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3/meson.build     | 14 -------
 meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb      |  2 +-
 3 files changed, 39 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build=
.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/meson.build

diff --git a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch =
b/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
new file mode 100644
index 00000000000..ef971ccff4f
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
@@ -0,0 +1,38 @@
+From 8a00d0269d547799b598adda364ad6c6ee328e6b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Tue, 20 Dec 2022 12:09:07 +0000
+Subject: [PATCH] Add missing meson.build
+
+This file was missing from the tarball, but will be in the .36 release.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ gdk/wayland/cursor/meson.build | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+ create mode 100644 gdk/wayland/cursor/meson.build
+
+diff --git a/gdk/wayland/cursor/meson.build b/gdk/wayland/cursor/meson.b=
uild
+new file mode 100644
+index 0000000..94cf47a
+--- /dev/null
++++ b/gdk/wayland/cursor/meson.build
+@@ -0,0 +1,14 @@
++# This file is missing from the 3.24.35 tarball
++
++wayland_cursor_sources =3D files([
++  'wayland-cursor.c',
++  'xcursor.c',
++  'os-compatibility.c'
++])
++
++libwayland_cursor =3D static_library('wayland+cursor',
++  sources: wayland_cursor_sources,
++  include_directories: [ confinc, ],
++  dependencies: [ glib_dep, wlclientdep, ],
++  c_args: common_cflags,
++)
+--=20
+2.34.1
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3/meson.build b/meta/recipes-gno=
me/gtk+/gtk+3/meson.build
deleted file mode 100644
index 94cf47a37f7..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/meson.build
+++ /dev/null
@@ -1,14 +0,0 @@
-# This file is missing from the 3.24.35 tarball
-
-wayland_cursor_sources =3D files([
-  'wayland-cursor.c',
-  'xcursor.c',
-  'os-compatibility.c'
-])
-
-libwayland_cursor =3D static_library('wayland+cursor',
-  sources: wayland_cursor_sources,
-  include_directories: [ confinc, ],
-  dependencies: [ glib_dep, wlclientdep, ],
-  c_args: common_cflags,
-)
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnom=
e/gtk+/gtk+3_3.24.35.bb
index 7c6ea104c7b..a467c0e9e95 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
@@ -3,7 +3,7 @@ require gtk+3.inc
 MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 2)}"
=20
 SRC_URI =3D "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+=
-${PV}.tar.xz \
-           file://meson.build;subdir=3D${S}/gdk/wayland/cursor \
+           file://add-missing-meson.build.patch \
            file://buildpaths.patch \
            file://opengl.patch \
            "
--=20
2.34.1


