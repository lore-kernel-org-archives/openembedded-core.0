Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34CB6C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 02:30:11 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.260.1783477805531471772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 19:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo02.lge.com) (156.147.1.126)
	by 156.147.23.52 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 156.147.1.126
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO jenkins-X670-AORUS-ELITE-AX..) (10.177.121.125)
	by 156.147.1.126 with ESMTP; 8 Jul 2026 11:30:03 +0900
X-Original-SENDERIP: 10.177.121.125
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [OE-core][PATCH 2/3] kernel-yocto: export CLANG_FLAGS for the kconfiglib config audit
Date: Wed,  8 Jul 2026 11:28:55 +0900
Message-Id: <20260708022856.2087339-3-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708022856.2087339-1-mark.yang@lge.com>
References: <20260708022856.2087339-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 02:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240412

From: "mark.yang" <mark.yang@lge.com>

do_kernel_configcheck evaluates Kconfig with kconfiglib instead of
kbuild make, so scripts/Makefile.clang never sets CLANG_FLAGS and the
compiler checks in scripts/Kconfig.include pick it up from the
environment. With TOOLCHAIN = "clang" the audit fails:

  Sorry, this assembler is not supported.

as-version.sh needs -fintegrated-as in the arguments to recognize the
integrated assembler. Export the flags kbuild would use, with gcc this
expands to nothing.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e7fdeb5d4b..46ccc69e75 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -578,6 +578,13 @@ python do_config_analysis() {
                 bb.warn( analysis )
 }
 
+# The kconfiglib audit evaluates Kconfig's compiler checks outside kbuild make,
+# where scripts/Makefile.clang would normally set CLANG_FLAGS, so provide it
+# via the environment.
+CLANG_FLAGS ?= ""
+CLANG_FLAGS:toolchain-clang = "--target=${HOST_SYS} -fintegrated-as"
+export CLANG_FLAGS
+
 python do_kernel_configcheck() {
     import re, string, sys, subprocess
 

