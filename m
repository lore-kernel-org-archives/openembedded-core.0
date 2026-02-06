Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA97FEE20BB
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-bc0d.mail.infomaniak.ch (smtp-bc0d.mail.infomaniak.ch [45.157.188.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2787.1770398658968847413
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D13lfpzNNG;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D11DVvzBRR;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:56 +0100
Subject: [PATCH 4/7] mesa: make zlib dependency a PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-4-166935b0e379@cherry.de>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
In-Reply-To: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev-bab12
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230635

From: Quentin Schulz <quentin.schulz@cherry.de>

zlib is a mesa meson feature which can be disabled so let's make it a
PACKAGECONFIG.

The motivation actually isn't about disabling it (though we now could as
it's only required for a few things) but rather that this dependency is
a non-native one.

The issue is when a native-only (-native recipe name suffix + inherit
native) recipe includes mesa.inc, it'll include the DEPENDS as well but
will then depend on a non-native recipe because BitBake doesn't add a
suffix to dependencies listed in DEPENDS for native-only recipes like it
does for recipes with BBCLASSEXTEND = native. This is a way to
circumvent the issue by making the dependency a PACKAGECONFIG dependency
such that the listed DEPENDS (third parameter) will be properly modified
by BitBake to have the native variant of the recipe pulled in. See[1]
for more info on why this is needed.

This is in preparation for the addition of a mesa-tools-native
native-only package which will include mesa.inc.

[1] https://lore.kernel.org/openembedded-core/07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.bb    | 1 +
 meta/recipes-graphics/mesa/mesa.inc   | 4 +++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index fe32e74744..eb0ee53af5 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG = "expat opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} xmlconfig"
+PACKAGECONFIG = "expat opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} xmlconfig zlib"
 
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 2db08727fe..66c8f9c372 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -10,6 +10,7 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
 	${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl vulkan', 'virtio', '', d)} \
 	xmlconfig \
+	zlib \
 "
 
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 35b7e5a09a..b2dfc6130d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -43,7 +43,8 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+# All dependencies **MUST** be -native. If not, then add a PACKAGECONFIG for it.
+DEPENDS = "makedepend-native flex-native bison-native libxml2-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
@@ -166,6 +167,7 @@ PACKAGECONFIG[expat] = "-Dexpat=enabled, -Dexpat=disabled, expat"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
 # Depends on expat PACKAGECONFIG!
 PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled"
+PACKAGECONFIG[zlib] = "-Dzlib=enabled, -Dzlib=disabled, zlib"
 
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 GALLIUMDRIVERS_SOFTPIPE = ",softpipe"

-- 
2.53.0


