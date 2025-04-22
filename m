Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECE6C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:28:26 +0000 (UTC)
Received: from smtp-190e.mail.infomaniak.ch (smtp-190e.mail.infomaniak.ch [185.125.25.14])
 by mx.groups.io with SMTP id smtpd.web11.41323.1745332101088379380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zhl2q3pQQzyfg;
	Tue, 22 Apr 2025 16:28:19 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4Zhl2p6XW5zwnJ;
	Tue, 22 Apr 2025 16:28:18 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 22 Apr 2025 16:26:58 +0200
Subject: [PATCH 1/2] mesa-demos: use latest git version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-mesa-demos-git-v1-1-87eac5e3af26@cherry.de>
References: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
In-Reply-To: <20250422-mesa-demos-git-v1-0-87eac5e3af26@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:28:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215212

From: Quentin Schulz <quentin.schulz@cherry.de>

When trying to use vkgears on RK3588 with PanVK, version 9.0.0 (released
two years ago) currently crashes due to a Segfault. Considering there's
been quite a few commits since that version, let's use the latest commit
in the master branch instead of trying to figure out which patch(es)
exactly fix that issue.

License-Update: removed trailing whitespace, c.f. 1303498303c2 ("remove
trailing space")

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...001-meson-fix-glx-detection-without-glvnd.patch | 46 ----------------------
 .../{mesa-demos_9.0.0.bb => mesa-demos_git.bb}     | 12 +++---
 2 files changed, 7 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-without-glvnd.patch b/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-without-glvnd.patch
deleted file mode 100644
index f16ba4a24c421b713782f7cd8b06f776a7bc0bd7..0000000000000000000000000000000000000000
--- a/meta/recipes-graphics/mesa/mesa-demos/0001-meson-fix-glx-detection-without-glvnd.patch
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
-@@ -99,10 +99,11 @@ if not dep_glu.found() and host_machine.system() != 'darwin'
- endif
- 
- dep_glx = dependency('glx', required: false, disabler : true)
--if not dep_glx.found() and host_machine.system() == 'darwin'
--  # xquartz doesn't have a glx.pc, but it does have the header. And all the
--  # symbols reside in libGL, so let's just use that.
--  if cc.check_header('GL/glx.h', dependencies: dep_x11)
-+if not dep_glx.found()
-+  # Both Mesa build without GLVND and XQuartz lacks a glx.pc, but does
-+  # provide the header. And all the symbols reside in libGL, so let's
-+  # just use that.
-+  if cc.check_header('GL/glx.h', dependencies: [dep_x11, dep_gl])
-     dep_glx = dep_gl
-   endif
- endif
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb b/meta/recipes-graphics/mesa/mesa-demos_git.bb
similarity index 86%
rename from meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-demos_git.bb
index d92f1ddc5baacbbb0301e9defc1a013bb60a4aa8..9dbb19d4696aa3b4812c60850d72a44a48d65d99 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_9.0.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_git.bb
@@ -6,13 +6,15 @@ BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 
 LICENSE = "MIT & PD"
-LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=914225785450eff644a86c871d3ae00e \
+LIC_FILES_CHKSUM = "file://src/xdemos/glxgears.c;beginline=1;endline=20;md5=a481fbdb2ac800ecb12405c33bcfacae \
                     file://src/xdemos/glxdemo.c;beginline=1;endline=8;md5=b01d5ab1aee94d35b7efaa2ef48e1a06"
 
-SRC_URI = "https://archive.mesa3d.org/demos/${BPN}-${PV}.tar.xz \
-           file://0001-meson-fix-glx-detection-without-glvnd.patch \
-           "
-SRC_URI[sha256sum] = "3046a3d26a7b051af7ebdd257a5f23bfeb160cad6ed952329cdff1e9f1ed496b"
+SRC_URI = "git://gitlab.freedesktop.org/mesa/demos.git;branch=main;protocol=https"
+SRCREV = "11939e1697b894be3c68a89e3ea86fc51a320836"
+
+S = "${WORKDIR}/git"
+
+PV = "9.0.0+git"
 
 inherit meson pkgconfig features_check
 # depends on virtual/egl, virtual/libgl ...

-- 
2.49.0


