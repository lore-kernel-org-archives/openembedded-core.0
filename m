Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C692EEE20BD
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2786.1770398658773108958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D11BR4zNSb;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D05n7rz9j6;
	Fri,  6 Feb 2026 18:24:16 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:55 +0100
Subject: [PATCH 3/7] mesa: make expat dependency a PACKAGECONFIG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-3-166935b0e379@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230634

From: Quentin Schulz <quentin.schulz@cherry.de>

expat is a mesa meson feature which can be disabled so let's make it a
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

Now that expat is a PACKAGECONFIG and that if it's not there expat isn't
autodetected anymore by meson, having xmlconfig PACKAGECONFIG add expat
as a DEPENDS (third parameter) is likely not enough anymore due to expat
feature being explicitly disabled if expat is not in PACKAGECONFIG.
Therefore, remove the third parameter for xmlconfig and add a comment
telling the user there's a PACKAGECONFIG dependency here. Note that
since this commit adds the expat PACKAGECONFIG to all recipes including
mesa.inc, no change in behavior is expected.

This is in preparation for the addition of a mesa-tools-native
native-only package which will include mesa.inc.

[1] https://lore.kernel.org/openembedded-core/07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de/
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.bb    | 1 +
 meta/recipes-graphics/mesa/mesa.inc   | 6 ++++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 3b55d2b77e..fe32e74744 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG = "opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} xmlconfig"
+PACKAGECONFIG = "expat opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} xmlconfig"
 
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 2c9a38cf65..2db08727fe 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -1,6 +1,7 @@
 require ${BPN}.inc
 
 PACKAGECONFIG = " \
+	expat \
 	gallium \
 	video-codecs \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d075210015..35b7e5a09a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -43,7 +43,7 @@ do_install:append() {
   fi
 }
 
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
+DEPENDS = "makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
@@ -162,8 +162,10 @@ TOOLS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}
 # dependencies for tools.
 TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libconfig libxml2 ', '', d)}"
 
+PACKAGECONFIG[expat] = "-Dexpat=enabled, -Dexpat=disabled, expat"
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
-PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
+# Depends on expat PACKAGECONFIG!
+PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled"
 
 GALLIUMDRIVERS_LLVMPIPE = ",llvmpipe"
 GALLIUMDRIVERS_SOFTPIPE = ",softpipe"

-- 
2.53.0


