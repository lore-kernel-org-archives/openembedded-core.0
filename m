Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C18D30CF0
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 22:54:35 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72065.1768344873559358733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 14:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 14 Jan 2026 07:54:31 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 14 Jan 2026 07:54:31 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH] llvm: enable LLVMgold.so build by adding binutils dependency
Date: Wed, 14 Jan 2026 07:54:24 +0900
Message-Id: <20260113225424.1208879-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 22:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229292

From: "mark.yang" <mark.yang@lge.com>

Currently, LLVMgold.so is not built because the binutils headers
are missing during the build process.

This allows LLVM to find the necessary headers and build the LLVMgold.so,
which is required for Link Time Optimization (LTO) support properly.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta/recipes-devtools/clang/llvm_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..bed9988c1a 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -11,7 +11,7 @@ require common-source.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=8a15a0759ef07f2682d2ba4b893c9afe"
 
-DEPENDS = "llvm-tblgen-native libffi libxml2 zlib zstd"
+DEPENDS = "llvm-tblgen-native libffi libxml2 zlib zstd binutils"
 
 inherit cmake pkgconfig lib_package multilib_header
 
@@ -50,6 +50,7 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=MinSizeRel \
                   -DLLVM_TOOL_YAML2OBJ_BUILD=OFF \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
+                  -DLLVM_BINUTILS_INCDIR=${STAGING_INCDIR} \
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
                  "
 

