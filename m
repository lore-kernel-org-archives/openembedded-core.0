Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4335C87FDA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 11:04:17 +0000 (UTC)
Received: from smtp-190d.mail.infomaniak.ch (smtp-190d.mail.infomaniak.ch [185.125.25.13])
 by mx.groups.io with SMTP id smtpd.web10.85034.1754046248307100672
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 04:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.13, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4btjkZ6Jktzj4Q;
	Fri,  1 Aug 2025 13:04:06 +0200 (CEST)
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4btjkY5wjgzYRm;
	Fri,  1 Aug 2025 13:04:05 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 01 Aug 2025 13:03:11 +0200
Subject: [PATCH RFC v4 3/9] mesa: move PROVIDES out of include file
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mesa-libclc-panfrost-v4-3-101c6dcf564f@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221233

From: Quentin Schulz <quentin.schulz@cherry.de>

There currently are two recipes including mesa.inc, mesa-gl and mesa.
The former overrides PROVIDES and the latter just inherits it from
mesa.inc.
Let's just move PROVIDES to where it makes sense the mesa recipe.

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
index 0dd9f9cb882014fc6784b0a71b7645072714a3b4..6da99293ca844a253705d4759f72bf148f5a72c8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -42,16 +42,6 @@ do_install:append() {
 
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


