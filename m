Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EEAC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 11:11:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6068.1783509074882231639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 04:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GiteT9nr;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E703A1E5E
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F027D3F85F
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2026 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783509074; bh=OZgP8brIqERIal1RepsFj9SyrxPmuBE7Au7NByelRDw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GiteT9nrQoRhrbL5jobgcYNuJpwyYJ7TJJc3LM9M21JVptBrx3ZyyLs8Rk/SAbcze
	 tIdR81tRQjLakNG1NeoMj3rQJ+D4JtCo529IsCEQ6pKvC6gzYUnzVTVHbGBZipvhdS
	 PuvtNG6IZN/vb4TRMwQjXGzXglnlFOxDi/yjksM0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] mesa-demos: move to latest commit
Date: Wed,  8 Jul 2026 12:11:06 +0100
Message-ID: <20260708111108.3577325-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708111108.3577325-1-ross.burton@arm.com>
References: <20260708111108.3577325-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 11:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240460

Upgrade mesa-demos to the latest commit.  Too many changes to list as
there have been ~230 commits since the 9.0.0 release in 2023.

Drop a backported patch, and update the GLUT option.

License-Update: license strings rewritten

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...eson-fix-glx-detection-without-glvnd.patch | 46 -------------------
 .../recipes-graphics/mesa/mesa-demos_9.0.0.bb | 14 +++---
 2 files changed, 8 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-=
glx-detection-without-glvnd.patch

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-det=
ection-without-glvnd.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-m=
eson-fix-glx-detection-without-glvnd.patch
deleted file mode 100644
index f16ba4a24c..0000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-=
without-glvnd.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e16117fc92688d76a042ad2c590c77d5a987a4ac Mon Sep 17 00:00:00 2001
-From: Erik Faye-Lund <erik.faye-lund@collabora.com>
-Date: Fri, 24 Mar 2023 13:31:58 +0100
-Subject: [PATCH] meson: fix glx-detection without glvnd
-
-When build without GLVND, Mesa provides GLX as a part of libGL, just
-like XQuartz does on MacOS. There's nothing really macOS specific about
-this fallback, so let's drop the condition.
-
-And just for good measure, let's add in dep_gl as a dependency for
-the header-check here, in case some one decides to install libGL outside
-of the default include directory.
-
-Fixes: 34300551 ("meson: explicitly check for glx dependency")
-Closes: https://gitlab.freedesktop.org/mesa/demos/-/issues/36
-Reviewed-by: Hoe Hao Cheng <haochengho12907@gmail.com>
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index c1853f94..bc3278e1 100644
---- a/meson.build
-+++ b/meson.build
-@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() !=3D=
 'darwin'
- endif
-=20
- dep_glx =3D dependency('glx', required: false, disabler : true)
--if not dep_glx.found() and host_machine.system() =3D=3D 'darwin'
--  # xquartz doesn't have a glx.pc, but it does have the header. And all=
 the
--  # symbols reside in libGL, so let's just use that.
--  if cc.check_header('GL/glx.h', dependencies: dep_x11)
-+if not dep_glx.found()
-+  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but does
-+  # provide the header. And all the symbols reside in libGL, so let's
-+  # just use that.
-+  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
-     dep_glx =3D dep_gl
-   endif
- endif
---=20
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipe=
s-graphics/mesa/mesa-demos_9.0.0.bb
index 593bc0147e..6c0c3d1b56 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
@@ -6,14 +6,16 @@ BUGTRACKER =3D "https://bugs.freedesktop.org"
 SECTION =3D "x11"
=20
 LICENSE =3D "MIT & PD"
-LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endline=
=3D20;md5=3D914225785450eff644a86c871d3ae00e \
+LIC_FILES_CHKSUM =3D "file://src/xdemos/glxgears.c;beginline=3D1;endline=
=3D5;md5=3D2c456e2fe0a0a05d31a72e076d404528 \
                     file://src/xdemos/glxdemo.c;beginline=3D1;endline=3D=
8;md5=3Db01d5ab1aee94d35b7efaa2ef48e1a06"
=20
-SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain;tag=3D${BP} \
-           file://0001-meson-fix-glx-detection-without-glvnd.patch \
-           "
+SRC_URI =3D "git://gitlab.freedesktop.org/mesa/demos.git;protocol=3Dhttp=
s;branch=3Dmain"
=20
-SRCREV =3D "661681767bfb4e8f136aac1fd7934e6b0fa46d29"
+SRCREV =3D "188fc2354de5a9cbfd73852183a35f4982ca43d5"
+
+# This recipe doesn't plan to make more releases, so track upstream git =
commits
+PV .=3D "+git"
+UPSTREAM_CHECK_COMMITS =3D "1"
=20
 inherit meson pkgconfig features_check
 # depends on virtual/egl, virtual/libgl ...
@@ -34,7 +36,7 @@ PACKAGECONFIG[drm] =3D "-Dlibdrm=3Denabled,-Dlibdrm=3Dd=
isabled,libdrm"
 PACKAGECONFIG[egl] =3D "-Degl=3Denabled,-Degl=3Ddisabled,virtual/egl"
 PACKAGECONFIG[gles1] =3D "-Dgles1=3Denabled,-Dgles1=3Ddisabled,virtual/l=
ibgles1"
 PACKAGECONFIG[gles2] =3D "-Dgles2=3Denabled,-Dgles2=3Ddisabled,virtual/l=
ibgles2"
-PACKAGECONFIG[glut] =3D "-Dwith-glut=3D${STAGING_EXECPREFIXDIR},,freeglu=
t"
+PACKAGECONFIG[glut] =3D "-Dglut=3Denabled,-Dglut=3Ddisabled,freeglut"
 PACKAGECONFIG[vulkan] =3D "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulkan=
-loader glslang-native"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Denabled,-Dwayland=3Ddisabled,vir=
tual/libgl wayland wayland-native wayland-protocols libxkbcommon libdecor=
"
 PACKAGECONFIG[x11] =3D "-Dx11=3Denabled,-Dx11=3Ddisabled,virtual/libx11 =
libglu libxkbcommon libxcb"
--=20
2.43.0


