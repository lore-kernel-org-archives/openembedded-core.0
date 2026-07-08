Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C80AC44501
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:30:11 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.259.1783477805453913114
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
Subject: [OE-core][PATCH 3/3] kernel-arch: add KERNEL_TOOLCHAIN for building the kernel with clang
Date: Wed,  8 Jul 2026 11:28:56 +0900
Message-Id: <20260708022856.2087339-4-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708022856.2087339-1-mark.yang@lge.com>
References: <20260708022856.2087339-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240413

From: "mark.yang" <mark.yang@lge.com>

kernel-arch pins TOOLCHAIN to gcc, so a clang kernel needs TOOLCHAIN
and the KERNEL_* variables overridden per recipe. Modules and
make-mod-scripts then keep the gcc defaults and run make against the
shared kernel build tree with a different compiler: kbuild detects the
CC_VERSION_TEXT mismatch, re-runs syncconfig and silently drops
compiler-dependent options such as CONFIG_CFI_CLANG.

Add toolchain-clang variants of KERNEL_CC, KERNEL_LD and KERNEL_AR and
a KERNEL_TOOLCHAIN switch covering all kernel-arch recipes, so the
kernel, modules and make-mod-scripts change toolchain together. The
default stays gcc.

-fuse-ld is left out of KERNEL_CC because the kernel links with
KERNEL_LD directly and kbuild's -Werror=unused-command-line-argument
rejects the unused option. KERNEL_LD uses ld.lld when the distro has
ld-is-lld (clang-cross only installs the symlink then), GNU ld.bfd
otherwise.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/kernel-arch.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 7aea9cd3e8..7e83a09b1c 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -76,9 +76,20 @@ KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
+KERNEL_CC:toolchain-clang = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_KERNEL_ARCH} \
+ ${DEBUG_PREFIX_MAP} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+"
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
+KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', '${HOST_PREFIX}ld.lld', '${HOST_PREFIX}ld.bfd', d)} ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
+KERNEL_AR:toolchain-clang = "${HOST_PREFIX}llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY = "${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 # Code in package.py can't handle options on KERNEL_STRIP
 KERNEL_STRIP = "${HOST_PREFIX}strip"
-TOOLCHAIN = "gcc"
+# The kernel, out-of-tree modules and make-mod-scripts share one kernel build
+# tree and must agree on the toolchain, so switch it with KERNEL_TOOLCHAIN
+# rather than setting TOOLCHAIN on individual recipes.
+KERNEL_TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "${KERNEL_TOOLCHAIN}"

