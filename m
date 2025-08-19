Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF55CCA0EF8
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:21 +0000 (UTC)
Received: from smtp-8fa8.mail.infomaniak.ch (smtp-8fa8.mail.infomaniak.ch [83.166.143.168])
 by mx.groups.io with SMTP id smtpd.web11.8805.1755591379513162441
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8d6D9nz75j;
	Tue, 19 Aug 2025 10:16:17 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8d2JmFzRHg;
	Tue, 19 Aug 2025 10:16:17 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:04 +0200
Subject: [PATCH v5 4/9] mesa: move BBCLASSEXTEND out of the include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-4-b8b89e6af908@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222081

From: Quentin Schulz <quentin.schulz@cherry.de>

We're going to have a new mesa-tools-native recipe include mesa.inc
soon. We don't need a target mesa-tools recipe for now so we'll go with
a native-only recipe which this BBCLASSEXTEND prevents us to do
properly, so let's move them to the recipes instead.

No intended change in behavior.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 ++
 meta/recipes-graphics/mesa/mesa.bb    | 2 ++
 meta/recipes-graphics/mesa/mesa.inc   | 2 --
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 42120687197d663a157786916392d52f8f180999..1a594a52f8c6dabbc282af0769b27a755d0e7b22 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -15,3 +15,5 @@ PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 51d0384ef5930f36ff2f5c20ebad2d7ad8b817a9..db5eab5fb27c6a7228f6e0fd823514352c42ad1f 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -23,3 +23,5 @@ PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
     virtual/mesa \
 "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 46fe465cd84ae9e799571d8c519a1d7933c716a6..4c079fe0aba8125763f0a598d6e114082a8453ee 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -43,8 +43,6 @@ EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
 
-BBCLASSEXTEND = "native nativesdk"
-
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"

-- 
2.50.1


