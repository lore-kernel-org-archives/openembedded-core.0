Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2D48CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:21 +0000 (UTC)
Received: from smtp-8fac.mail.infomaniak.ch (smtp-8fac.mail.infomaniak.ch [83.166.143.172])
 by mx.groups.io with SMTP id smtpd.web11.8804.1755591378057073761
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8c4l5Zz8nF;
	Tue, 19 Aug 2025 10:16:16 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8c0lHmzJXq;
	Tue, 19 Aug 2025 10:16:16 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:02 +0200
Subject: [PATCH v5 2/9] mesa: move PACKAGECONFIG defaults to recipes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-2-b8b89e6af908@cherry.de>
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222079

From: Quentin Schulz <quentin.schulz@cherry.de>

We're planning on reusing mesa.inc for a new mesa-tools-native recipe
which will require much less in terms of PACKAGECONFIG than the actual
mesa recipes.

It also doesn't make a lot of sense to have a default PACKAGECONFIG in
an include file inherited by multiple recipes (here mesa and mesa-gl)
which is highlighted by the fact that the only other recipe that
includes mesa.inc (mesa-gl) overrides PACKAGECONFIG (hence why mesa-gl
only gets a partial migration of PACKAGECONFIG defaults.

No intended change in behavior.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb |  5 +++++
 meta/recipes-graphics/mesa/mesa.bb    | 12 ++++++++++++
 meta/recipes-graphics/mesa/mesa.inc   | 13 -------------
 3 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 35d6dc854cf4dfac7a757e333e25e4ddeab10b6e..42120687197d663a157786916392d52f8f180999 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -10,3 +10,8 @@ TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
 PACKAGECONFIG = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+
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
index a848a2ad8c73dad945039b5374c66e221b5b9a05..387f954789c603dac767ccf18ad60acb6731d35a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -80,22 +80,9 @@ EXTRA_OEMESON = " \
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


