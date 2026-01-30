Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DE6D49C92
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 09:55:09 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7173.1769766900473282294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 01:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 30 Jan 2026 18:54:57 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 30 Jan 2026 18:54:57 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] lto.inc: introduce LTO_DEFAULT variable to support per-package overrides with Clang
Date: Fri, 30 Jan 2026 18:54:52 +0900
Message-Id: <20260130095452.3522876-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230188

From: "mark.yang" <mark.yang@lge.com>

Currently, LTO variable is set with a toolchain-clang override directly.

This causes priority issues where package-specific overrides (e.g., LTO:pn-perl = "")
are ignored when the Clang toolchain is active, making it difficult to disable LTO
for specific failing recipes.

This patch refactors the logic by introducing an intermediate `LTO_DEFAULT` variable.
- `LTO_DEFAULT` handles the toolchain-specific flags (GCC vs Clang).
- `LTO` is assigned `LTO_DEFAULT` as a default value.

This structure allows `LTO` to be cleanly overridden by recipe-specific overrides
(like `pn-${PN}`) regardless of the active toolchain.

Added a toolchain-gcc override for alsa-lib because -flto-partition=none is not
supported by Clang.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/conf/distro/include/lto.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index 227f0c5c2a1..8752249685a 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -28,7 +28,7 @@ LTO:pn-grub-efi = ""
 # Custom LTO flags
 # disable partitioning/streaming algorithm since its uses ASM
 # constructs not compatible with lto
-LTOEXTRA:pn-alsa-lib = "-flto-partition=none"
+LTOEXTRA:pn-alsa-lib:toolchain-gcc = "-flto-partition=none"
 
 LTOEXTRA ?= ""
 
@@ -43,9 +43,11 @@ LTOEXTRA ?= ""
 # -fuse-linker-plugin
 # ensures that libraries participate in LTO by supplying intermediate
 # code from .a files to linker
-LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
+LTO_DEFAULT = "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
 
-LTO:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin ${LTOEXTRA}', '-flto ${LTOEXTRA}', d)}"
+LTO_DEFAULT:toolchain-clang = "${@bb.utils.contains('DISTRO_FEATURES', 'thin-lto', '-flto=thin ${LTOEXTRA}', '-flto ${LTOEXTRA}', d)}"
+
+LTO ?= "${LTO_DEFAULT}"
 
 SELECTED_OPTIMIZATION:append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS:append:class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"

