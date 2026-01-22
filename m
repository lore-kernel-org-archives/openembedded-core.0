Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A0FFC44500
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 05:51:57 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31097.1769061107796420823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 21:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.51 with ESMTP; 22 Jan 2026 14:51:45 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.126 with ESMTP; 22 Jan 2026 14:51:45 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] lto.inc: add clang specific LTO configuration
Date: Thu, 22 Jan 2026 14:51:43 +0900
Message-Id: <20260122055143.2530158-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 05:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229832

From: "mark.yang" <mark.yang@lge.com>

This commit adds support for Clang-specific LTO options.

1. -fuse-linker-plugin is not supported by Clang.
2. -ffat-lto-objects is used to ensure that object files (.o) are generated as ELF
   even when LTO is applied. During the dwarfsrcfiles process, if LTO is used
   with the Clang toolchain, static library object files are skipped if they are
   LLVM bitcode instead of ELF. Therefore, it is recommended to add this to
   LTOEXTRA if necessary.
3. Adding 'thin-lto' to DISTRO_FEATURES enables -flto=thin.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/conf/distro/include/lto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index b8193725a1..227f0c5c2a 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -45,6 +45,8 @@ LTOEXTRA ?= ""
 # code from .a files to linker
 LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
 
+LTO:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin ${LTOEXTRA}', '-flto ${LTOEXTRA}', d)}"
+
 SELECTED_OPTIMIZATION:append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 

