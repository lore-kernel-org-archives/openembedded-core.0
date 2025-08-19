Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11A4CA0EF5
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:21 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web10.8637.1755591378731730937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8d25QPz7gd;
	Tue, 19 Aug 2025 10:16:17 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8c4kZ2zRyS;
	Tue, 19 Aug 2025 10:16:16 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:03 +0200
Subject: [PATCH v5 3/9] mesa: move PROVIDES out of include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-3-b8b89e6af908@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222080

From: Quentin Schulz <quentin.schulz@cherry.de>

There currently are two recipes including mesa.inc: mesa-gl and mesa.

Because mesa-gl.bb already sets PROVIDES, overriding the value it should
be getting from mesa.inc, move PROVIDES from mesa.inc to mesa.bb,
keeping the value in mesa-gl.bb intact.

Because GLPROVIDES is not used in mesa-gl.bb, it also is only moved to
mesa.bb.

No intended change in behavior.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.bb  | 11 +++++++++++
 meta/recipes-graphics/mesa/mesa.inc | 10 ----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 305b18070d6a47a53f204906a16bc8d4833fd9d6..51d0384ef5930f36ff2f5c20ebad2d7ad8b817a9 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -12,3 +12,14 @@ PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+
+GLPROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
+    virtual/mesa \
+"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 387f954789c603dac767ccf18ad60acb6731d35a..46fe465cd84ae9e799571d8c519a1d7933c716a6 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -40,16 +40,6 @@ do_install:append() {
 
 DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
 EXTRANATIVEPATH += "chrpath-native"
-GLPROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
-"
-PROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', '', d.getVar('GLPROVIDES'), d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
-    virtual/mesa \
-    "
 
 inherit meson pkgconfig python3native gettext features_check rust
 

-- 
2.50.1


