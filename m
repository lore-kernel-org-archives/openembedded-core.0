Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AD3C531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 04:59:22 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13166.1784869161721137172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 21:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 24 Jul 2026 13:59:19 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 24 Jul 2026 13:59:19 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v2] kernel-arch: limit KERNEL_TOOLCHAIN to the kbuild recipes
Date: Fri, 24 Jul 2026 13:59:17 +0900
Message-ID: <20260724045917.3595374-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 04:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241888

From: "mark.yang" <mark.yang@lge.com>

u-boot and barebox inherit kernel-arch for the ARCH mapping, so since
0e3756efe0 ("kernel-arch: add KERNEL_TOOLCHAIN to switch the whole
kernel toolchain") KERNEL_TOOLCHAIN = "clang" switches them too. That
swaps u-boot's gcc-cross dependency for clang-cross, but its kbuild
hardcodes ${CROSS_COMPILE}gcc:

  /bin/sh: 1: x86_64-oe-linux-gcc: not found

Full log: https://errors.yoctoproject.org/Errors/Build/242654/

Pin TOOLCHAIN back to gcc in kernel-arch and set it from
KERNEL_TOOLCHAIN in kernel.bbclass, module-base and make-mod-scripts.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: add a comment explaining why kernel-arch keeps TOOLCHAIN pinned
    to gcc

The v2 series was merged, so this carries the remaining v3 3/3 delta
(<20260720231714.1631366-1-mark.yang@lge.com>) as a follow-up fix.

 meta/classes-recipe/kernel-arch.bbclass                      | 5 ++++-
 meta/classes-recipe/kernel.bbclass                           | 1 +
 meta/classes-recipe/module-base.bbclass                      | 1 +
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
 4 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 5f8dbacc0c..72780940f1 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -92,5 +92,8 @@ KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld'
 KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
+# The kbuild recipes (kernel, modules, make-mod-scripts) set TOOLCHAIN
+# from KERNEL_TOOLCHAIN; other inheritors like u-boot and barebox only
+# use kernel-arch for the ARCH mapping and must stay on gcc.
 KERNEL_TOOLCHAIN ?= "gcc"
-TOOLCHAIN = "${KERNEL_TOOLCHAIN}"
+TOOLCHAIN = "gcc"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 91248467be..619359fb7d 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -214,6 +214,7 @@ python do_symlink_kernsrc () {
 addtask symlink_kernsrc before do_patch do_configure after do_unpack
 
 inherit kernel-arch deploy
+TOOLCHAIN = "${KERNEL_TOOLCHAIN}"
 
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-module-.*"
 PACKAGES_DYNAMIC += "^${KERNEL_PACKAGE_NAME}-image-.*"
diff --git a/meta/classes-recipe/module-base.bbclass b/meta/classes-recipe/module-base.bbclass
index 2a225881ba..cae71a9b15 100644
--- a/meta/classes-recipe/module-base.bbclass
+++ b/meta/classes-recipe/module-base.bbclass
@@ -5,6 +5,7 @@
 #
 
 inherit kernel-arch
+TOOLCHAIN = "${KERNEL_TOOLCHAIN}"
 
 # We do the dependency this way because the output is not preserved
 # in sstate, so we must force do_compile to run (once).
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 338a50de91..d11afa86a1 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -4,6 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
 
 inherit kernel-arch linux-kernel-base
+TOOLCHAIN = "${KERNEL_TOOLCHAIN}"
 inherit pkgconfig
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"

