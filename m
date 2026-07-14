Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6F9C44508
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:26:53 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9431.1784035607119424762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 14 Jul 2026 22:26:45 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.121 with ESMTP; 14 Jul 2026 22:26:44 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH v2 3/3] kernel-arch: add KERNEL_TOOLCHAIN to switch the whole kernel toolchain
Date: Tue, 14 Jul 2026 22:26:42 +0900
Message-ID: <20260714132642.2225115-4-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714132642.2225115-1-mark.yang@lge.com>
References: <20260714132642.2225115-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240889

From: "mark.yang" <mark.yang@lge.com>

Setting TOOLCHAIN on the kernel recipe alone leaves modules and
make-mod-scripts running make against the shared build tree with gcc;
kbuild spots the CC_VERSION_TEXT mismatch and silently regenerates
the shared .config. Add a KERNEL_TOOLCHAIN switch covering all
kernel-arch recipes so they change toolchain together, gcc by default.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
v2: rebased on the merged clang toolchain support which supersedes
    the other v1 patches; dependency changes split out into patch 2

 meta/classes-recipe/kernel-arch.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 321c9ed577..5f8dbacc0c 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -92,4 +92,5 @@ KERNEL_LD:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld'
 KERNEL_AR:toolchain-clang = "llvm-ar ${HOST_AR_KERNEL_ARCH}"
 KERNEL_OBJCOPY:toolchain-clang = "llvm-objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"
 KERNEL_STRIP:toolchain-clang = "llvm-strip"
-TOOLCHAIN = "gcc"
+KERNEL_TOOLCHAIN ?= "gcc"
+TOOLCHAIN = "${KERNEL_TOOLCHAIN}"

