Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63F2CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:00 +0000 (UTC)
Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
 by mx.groups.io with SMTP id smtpd.web11.40128.1756994638738514920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.11, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6P31M8zvHv;
	Thu,  4 Sep 2025 16:03:57 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6N6VXwzmh2;
	Thu,  4 Sep 2025 16:03:56 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:38 +0200
Subject: [PATCH v7 09/13] mesa: allow to disable xmlconfig support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-9-e921a65412f7@cherry.de>
References: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
In-Reply-To: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222942

From: Quentin Schulz <quentin.schulz@cherry.de>

From my understanding, xmlconfig is useful for "dynamic" driconf
support, i.e. driconf the user specifies at runtime.

According to the wiki[1], driconf is useful for OpenGL drivers.

I wager we mostly don't need xmlconfig at all which may allow us to also
get rid (in most cases) of the expat dependency. But that is an
optimization to investigate later, so let's keep xmlconfig enabled for
now as it is the default whenever the meson feature is not disabled
(defaults to auto) and expat is found (currently part of DEPENDS in
mesa.inc).

This will be useful for mesa-tools-native which isn't meant to compile
drivers and thus shouldn't try to compile driconf support and install
driconf example files.

Technically, xmlconfig depends on the expat meson feature (and the
presence of the expat build dependency) but the feature is default auto
so having expat dependency in xmlconfig PACKAGECONFIG seems enough
instead of having one PACKAGECONFIG depend on another PACKAGECONFIG's
presence.

[1] https://dri.freedesktop.org/wiki/DriConf/

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 +-
 meta/recipes-graphics/mesa/mesa.bb    | 1 +
 meta/recipes-graphics/mesa/mesa.inc   | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 832137c8188f1253c9924e4c8410e5fae40f10fb..3b55d2b77e55b1297a1507a86aa16e6d15944983 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/libgl virtual/mesa"
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
 # At least one DRI rendering engine is required to build mesa.
-PACKAGECONFIG = "opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG = "opengl gallium ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} xmlconfig"
 
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index db5eab5fb27c6a7228f6e0fd823514352c42ad1f..49e077b20cd254415c73a30040da76b5d25fd2f3 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -6,6 +6,7 @@ PACKAGECONFIG = " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm virgl', '', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
+	xmlconfig \
 "
 
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 81b099bf6e5fe624e91e6a780f8bb55854580c2d..4b1c11be55f7b3f54b5244674263b83a8703bc25 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -115,6 +115,7 @@ TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurse
 PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
 
 PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
+PACKAGECONFIG[xmlconfig] = "-Dxmlconfig=enabled, -Dxmlconfig=disabled, expat"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"

-- 
2.51.0


