Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68920C369B4
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 19:22:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.3456.1744658536143832838
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Apr 2025 12:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A1E11A2D
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 12:22:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6979B3F66E
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 12:22:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] mesa-demos: fix detection of GLX headers
Date: Mon, 14 Apr 2025 20:22:10 +0100
Message-ID: <20250414192210.18008-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414192210.18008-1-ross.burton@arm.com>
References: <20250414192210.18008-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 19:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214808

Backport a patch from upstream to fix the build when glx.pc isn't found,
but the glx headers are available. As libglvnd is the only provider of
glx.pc and by default we build without libglvnd, this is common.

This solves the problem where mesa-demo is missing the GLX demos, such
as glxgears.

[ YOCTO #15825 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...eson-fix-glx-detection-without-glvnd.patch | 46 +++++++++++++++++++
 .../recipes-graphics/mesa/mesa-demos_9.0.0.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-=
glx-detection-without-glvnd.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-det=
ection-without-glvnd.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-m=
eson-fix-glx-detection-without-glvnd.patch
new file mode 100644
index 00000000000..f16ba4a24c4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-=
without-glvnd.patch
@@ -0,0 +1,46 @@
+From e16117fc92688d76a042ad2c590c77d5a987a4ac Mon Sep 17 00:00:00 2001
+From: Erik Faye-Lund <erik.faye-lund@collabora.com>
+Date: Fri, 24 Mar 2023 13:31:58 +0100
+Subject: [PATCH] meson: fix glx-detection without glvnd
+
+When build without GLVND, Mesa provides GLX as a part of libGL, just
+like XQuartz does on MacOS. There's nothing really macOS specific about
+this fallback, so let's drop the condition.
+
+And just for good measure, let's add in dep_gl as a dependency for
+the header-check here, in case some one decides to install libGL outside
+of the default include directory.
+
+Fixes: 34300551 ("meson: explicitly check for glx dependency")
+Closes: https://gitlab.freedesktop.org/mesa/demos/-/issues/36
+Reviewed-by: Hoe Hao Cheng <haochengho12907@gmail.com>
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c1853f94..bc3278e1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() !=3D=
 'darwin'
+ endif
+=20
+ dep_glx =3D dependency('glx', required: false, disabler : true)
+-if not dep_glx.found() and host_machine.system() =3D=3D 'darwin'
+-  # xquartz doesn't have a glx.pc, but it does have the header. And all=
 the
+-  # symbols reside in libGL, so let's just use that.
+-  if cc.check_header('GL/glx.h', dependencies: dep_x11)
++if not dep_glx.found()
++  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but does
++  # provide the header. And all the symbols reside in libGL, so let's
++  # just use that.
++  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
+     dep_glx =3D dep_gl
+   endif
+ endif
+--=20
+2.43.0
+
diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
index 0301b553611..d92f1ddc5ba 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;begi=
nline=3D1;endline=3D20;md5=3D9142
                     file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D=
8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
=20
 SRC_URI =3D "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
+           file://0001-meson-fix-glx-detection-without-glvnd.patch \
            "
 SRC_URI[sha256sum] =3D "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed95232=
9cdff1e9f1ed496b"
=20
--=20
2.43.0


