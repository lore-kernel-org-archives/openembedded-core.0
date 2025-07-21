Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3116C87FCD
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:34:02 +0000 (UTC)
Received: from smtp-bc0b.mail.infomaniak.ch (smtp-bc0b.mail.infomaniak.ch [45.157.188.11])
 by mx.groups.io with SMTP id smtpd.web10.37287.1753094033378879041
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4blxZm0qQLzPHQ;
	Mon, 21 Jul 2025 12:33:52 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4blxZl4G5dzW4Q;
	Mon, 21 Jul 2025 12:33:51 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 21 Jul 2025 12:33:38 +0200
Subject: [PATCH RFC v2 1/6] mesa: move PACKAGECONFIG defaults to recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-mesa-libclc-panfrost-v2-1-f713d0858949@cherry.de>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
In-Reply-To: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Otavio Salvador <otavio.salvador@ossystems.com.br>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 10:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220674

From: Quentin Schulz <quentin.schulz@cherry.de>

We're planning on reusing mesa.inc for a new mesa-tools-native recipe
which will require much less in terms of PACKAGECONFIG than the actual
mesa recipes.

It also doesn't make a lot of sense to have a default PACKAGECONFIG in
an include file inherited by multiple recipes (here mesa and mesa-gl)
which is highlighted by the useless PACKAGECONFIG ??= that is in mesa-gl
since it was entirely replaced by the one from mesa.inc (hence why it's
removed in this commit).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 14 ++++++++++++--
 meta/recipes-graphics/mesa/mesa.bb    | 12 ++++++++++++
 meta/recipes-graphics/mesa/mesa.inc   | 13 -------------
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index e2f03c81c4588c6257ffec2892fef7fcbe9f82bf..8418f13bbc8aa84c6591eb8b46e1fa96d7aad9b6 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -8,7 +8,17 @@ S = "${UNPACKDIR}/mesa-${PV}"
 
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
-# At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG = " \
+	gallium \
+	video-codecs \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+"
+
 PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 96e8aa38d61661c02d2228d825f70cf41f985382..305b18070d6a47a53f204906a16bc8d4833fd9d6 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -1,2 +1,14 @@
 require ${BPN}.inc
 
+PACKAGECONFIG = " \
+	gallium \
+	video-codecs \
+	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+"
+
+PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 47b95728e0b33c43992e1200a9e50e0f22c9bd6b..0f896887a4d956514f1fcc807de2ad31afa29f18 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -81,22 +81,9 @@ EXTRA_OEMESON = " \
 def strip_comma(s):
     return s.strip(',')
 
-PACKAGECONFIG = " \
-	gallium \
-	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
-"
-
 # skip all Rust dependencies if we are not building OpenCL"
 INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '', '1', d)}"
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
-
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
 

-- 
2.50.1


