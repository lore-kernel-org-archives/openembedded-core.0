Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DDBC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:30:11 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.261.1783477805539997134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 19:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.53 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO jenkins-X670-AORUS-ELITE-AX..) (10.177.121.125)
	by 156.147.1.126 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 10.177.121.125
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [OE-core][PATCH 1/3] module.bbclass/make-mod-scripts: inhibit default dependencies
Date: Wed,  8 Jul 2026 11:28:54 +0900
Message-Id: <20260708022856.2087339-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708022856.2087339-1-mark.yang@lge.com>
References: <20260708022856.2087339-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240414

From: "mark.yang" <mark.yang@lge.com>

Modules and make-mod-scripts build against the shared kernel build tree
with the kernel toolchain, so the default virtual/libc and
virtual/compilerlibs dependencies are unused. Inhibit them and add the
cross toolchain explicitly like kernel.bbclass does.

This also avoids dragging compiler-rt and libcxx into every module
build when TOOLCHAIN is set to clang.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/module.bbclass                           | 5 +++++
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
index 6b2c09f441..a65744d33e 100644
--- a/meta/classes-recipe/module.bbclass
+++ b/meta/classes-recipe/module.bbclass
@@ -6,6 +6,11 @@
 
 inherit module-base kernel-module-split pkgconfig
 
+# Modules build with the kernel toolchain against the shared kernel build tree
+# and do not need the default userspace toolchain/libc dependencies.
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "virtual/cross-cc virtual/cross-binutils"
+
 EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 MODULES_INSTALL_TARGET ?= "modules_install"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 4b0630313f..97521c89e9 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -18,6 +18,11 @@ DEV_PKG_DEPENDENCY = ""
 DEPENDS += "bc-native bison-native"
 DEPENDS += "gmp-native"
 
+# The scripts build uses the kernel toolchain against the shared kernel build
+# tree and does not need the default userspace toolchain/libc dependencies.
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "virtual/cross-cc virtual/cross-binutils"
+
 EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCFLAGS="${BUILD_CFLAGS}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
 EXTRA_OEMAKE += " HOSTCXX="${BUILD_CXX} ${BUILD_CXXFLAGS} ${BUILD_LDFLAGS}" CROSS_COMPILE=${TARGET_PREFIX}"
 

