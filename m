Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C93BC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:17:31 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11015.1784589448941306297
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.51 with ESMTP; 21 Jul 2026 08:17:26 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 21 Jul 2026 08:17:25 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v3 3/3] kernel: add KERNEL_TOOLCHAIN to switch the whole kernel toolchain
Date: Tue, 21 Jul 2026 08:17:14 +0900
Message-ID: <20260720231714.1631366-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720093119.3245892-1-mark.yang@lge.com>
References: <20260720093119.3245892-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 23:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241493

From: "mark.yang" <mark.yang@lge.com>

Setting TOOLCHAIN on the kernel recipe alone leaves modules and
make-mod-scripts running make against the shared build tree with gcc;
kbuild spots the CC_VERSION_TEXT mismatch and silently regenerates
the shared .config. Add a KERNEL_TOOLCHAIN switch so the kernel,
modules and make-mod-scripts change toolchain together, gcc by default.

Set TOOLCHAIN from it in the kbuild consumers rather than in
kernel-arch: kernel-arch is also inherited by u-boot and barebox for
the ARCH mapping, and the u-boot kbuild hardcodes ${CROSS_COMPILE}gcc,
so switching them too would drop the gcc cross dependency they need:

  /bin/sh: 1: x86_64-oe-linux-gcc: not found

Full log: https://errors.yoctoproject.org/Errors/Build/242654/

Signed-off-by: mark.yang <mark.yang@lge.com>
---
Resending with the 3/3 numbering restored; the first posting went out
as [PATCH v3] so patchwork split it from the series. No changes to the
patch itself.

v3: set TOOLCHAIN from the kbuild consumers instead of kernel-arch,
    which is also inherited by u-boot and barebox
v2: rebased on the merged clang toolchain support which supersedes
    the other v1 patches; dependency changes split out into patch 2

 meta/classes-recipe/kernel-arch.bbclass                      | 1 +
 meta/classes-recipe/kernel.bbclass                           | 1 +
 meta/classes-recipe/module-base.bbclass                      | 1 +
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 1 +
 4 files changed, 4 insertions(+)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 321c9ed577..b15e0aca80 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -92,4 +92,5 @@ KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld'
 KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
+KERNEL_TOOLCHAIN ?= "gcc"
 TOOLCHAIN = "gcc"
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 48e394b650..a90122354a 100644
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

