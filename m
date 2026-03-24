Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B97F54ADD
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:27:46 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11057.1774394858484657358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 16:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 25 Mar 2026 08:27:36 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 25 Mar 2026 08:27:36 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] llvm: add binutils-plugin PACKAGECONFIG for LLVMgold.so
Date: Wed, 25 Mar 2026 08:27:34 +0900
Message-Id: <20260324232734.2081279-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:27:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233834

From: "mark.yang" <mark.yang@lge.com>

Add a 'binutils-plugin' PACKAGECONFIG option to selectively build
LLVMgold.so by passing -DLLVM_BINUTILS_INCDIR and adding binutils
to DEPENDS only when enabled.

LLVMgold.so is the LLVM LTO plugin for GNU ld BFD.
When using lld as the linker, this plugin is not needed since lld has
built-in LTO support. However, for toolchains that rely on BFD
this plugin is required to enable LTO.

binutils-plugin is named after Gentoo's USE flag convention for similar
functionality.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/clang/llvm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..e12ac11853 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -79,6 +79,7 @@ PACKAGECONFIG[opt-viewer] = "-DLLVM_TOOL_OPT_VIEWER_BUILD=ON,-DLLVM_TOOL_OPT_VIE
                              python3-pyyaml python3-pygments,"
 PACKAGECONFIG[lto] = "-DLLVM_ENABLE_LTO=Full -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 PACKAGECONFIG[thin-lto] = "-DLLVM_ENABLE_LTO=Thin -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
+PACKAGECONFIG[binutils-plugin] = "-DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR},,binutils,"
 
 # LLVM debug symbols are very large (several gigabytes), reduce the debug level
 # so they're just hundreds of megabytes.
@@ -126,6 +127,10 @@ llvm_sysroot_preprocess() {
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
 }
 
+PACKAGES =+ "llvm-linker-tools"
+
+FILES:llvm-linker-tools = "${libdir}/LLVMgold* ${libdir}/libLTO.so.*"
+
 FILES:${PN}-dev += "${libdir}/llvm-config"
 
 BBCLASSEXTEND = "native nativesdk"

