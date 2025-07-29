Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88AEC87FD6
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 09:36:39 +0000 (UTC)
Received: from smtp-bc0f.mail.infomaniak.ch (smtp-bc0f.mail.infomaniak.ch [45.157.188.15])
 by mx.groups.io with SMTP id smtpd.web10.3134.1753781795878231486
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 02:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4brqwy4VDKzq2c;
	Tue, 29 Jul 2025 11:36:34 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4brqwy13Qjz9T9;
	Tue, 29 Jul 2025 11:36:34 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 29 Jul 2025 11:36:24 +0200
Subject: [PATCH RFC v3 3/9] mesa: move BBCLASSEXTEND out of the include
 file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-mesa-libclc-panfrost-v3-3-42559ddc93ef@cherry.de>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
In-Reply-To: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 09:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221048

From: Quentin Schulz <quentin.schulz@cherry.de>

We're going to have a new mesa-tools-native recipe include mesa.inc
soon. We don't need a target mesa-tools recipe for now so we'll go with
a native-only recipe which this BBCLASSEXTEND prevents us to do
properly, so let's move them to the recipes instead.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-gl.bb | 2 ++
 meta/recipes-graphics/mesa/mesa.bb    | 2 ++
 meta/recipes-graphics/mesa/mesa.inc   | 2 --
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index 8418f13bbc8aa84c6591eb8b46e1fa96d7aad9b6..460e5e60c8dcee69d43885954c431b175c19394f 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -22,3 +22,5 @@ PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
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
index cef62308f2cb8a5480c3dc5b42836b95b2a04284..55793baa8de5a190ae5eadb44662c1d11487c026 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -44,8 +44,6 @@ EXTRANATIVEPATH += "chrpath-native"
 
 inherit meson pkgconfig python3native gettext features_check rust
 
-BBCLASSEXTEND = "native nativesdk"
-
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"

-- 
2.50.1


