Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31A3C87FD2
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 11:04:17 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web11.84907.1754046249413391755
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 04:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4btjkc0TQkzhVC;
	Fri,  1 Aug 2025 13:04:08 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4btjkb06kXzZxK;
	Fri,  1 Aug 2025 13:04:06 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 01 Aug 2025 13:03:12 +0200
Subject: [PATCH RFC v4 4/9] mesa: move BBCLASSEXTEND out of the include
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mesa-libclc-panfrost-v4-4-101c6dcf564f@cherry.de>
References: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
In-Reply-To: <20250801-mesa-libclc-panfrost-v4-0-101c6dcf564f@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 11:04:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221234

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
index 6da99293ca844a253705d4759f72bf148f5a72c8..0bacdbc89e96ca83b38ca6158cf22a282019beda 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -45,8 +45,6 @@ EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
 
-BBCLASSEXTEND = "native nativesdk"
-
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"

-- 
2.50.1


