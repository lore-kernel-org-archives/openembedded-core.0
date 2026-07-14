Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30252C4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:26:53 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9650.1784035607377518052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 14 Jul 2026 22:26:44 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.121 with ESMTP; 14 Jul 2026 22:26:44 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v2 2/3] module.bbclass/make-mod-scripts: inhibit default dependencies
Date: Tue, 14 Jul 2026 22:26:41 +0900
Message-ID: <20260714132642.2225115-3-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714132642.2225115-1-mark.yang@lge.com>
References: <20260714132642.2225115-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240890

From: "mark.yang" <mark.yang@lge.com>

Modules and make-mod-scripts build against the shared kernel build
tree with the kernel toolchain, so the default virtual/libc and
virtual/compilerlibs dependencies are unused. Inhibit them and add
the cross toolchain explicitly, as kernel.bbclass does, which also
keeps compiler-rt and libcxx out of module builds with clang.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: split out of the KERNEL_TOOLCHAIN patch

 meta/classes-recipe/module.bbclass                           | 3 +++
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 6b2c09f441..ce5898125b 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -6,6 +6,9 @@
 
 inherit module-base kernel-module-split pkgconfig
 
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "virtual/cross-cc virtual/cross-binutils"
+
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 4b0630313f..338a50de91 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,6 +18,9 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "virtual/cross-cc virtual/cross-binutils"
+
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 

