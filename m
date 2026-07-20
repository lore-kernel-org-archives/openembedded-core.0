Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D9FC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 09:31:37 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5264.1784539891846804895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 02:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 20 Jul 2026 18:31:29 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 20 Jul 2026 18:31:29 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v3 1/3] kernel-arch: fall back to GNU ld unless ld-is-lld is in DISTRO_FEATURES
Date: Mon, 20 Jul 2026 18:31:17 +0900
Message-ID: <20260720093119.3245892-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720093119.3245892-1-mark.yang@lge.com>
References: <20260720093119.3245892-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 09:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241350

From: "mark.yang" <mark.yang@lge.com>

Nothing stages a bare ld.lld unless ld-is-lld is in DISTRO_FEATURES,
so a clang kernel fails its first linker check on any other setup.
Use GNU ld.bfd from binutils-cross instead.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v3: no changes
v2: new patch; the merged clang support uses a bare ld.lld which
    nothing stages without ld-is-lld

 meta/classes-recipe/kernel-arch.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 6ebc0f13ea..321c9ed577 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -88,7 +88,7 @@ KERNEL_CC:toolchain-clang = "${CCACHE}clang ${HOST_CC_KERNEL_ARCH} \
  -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
  -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
-KERNEL_LD:toolchain-clang = "ld.lld ${HOST_LD_KERNEL_ARCH}"
+KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'ld.lld', '${HOST_PREFIX}ld.bfd', d)} ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"

