Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A032EB64D9
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 17:15:21 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.45944.1689009319932565612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 10:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=hZKXBESN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-456497-2023071017151647640fd8147f0f5e8a-aj5hat@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023071017151647640fd8147f0f5e8a
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Jul 2023 19:15:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=UjgE0vvwHwCWFs4lrv78n3LW6ow06v3C/dooKjxR84g=;
 b=hZKXBESNZQhmNe9efhn5GpV+CywDUTT9CcUpyXezHeI7Hv4UGxzd2e/DCf4mSpm9LLlrWH
 XYmZBmWS7GhSmbVWm1DNtQy3ajz+oWTxgnVio+yyLEEOVB2MFSHLtWrmmV2AMb8sSDrlGd6p
 0eCZZ3FCmxIX1GM5C1uQffHdRoVeM=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [kirkstone][PATCH v2] rust-llvm: backport a fix for build with gcc-13
Date: Mon, 10 Jul 2023 19:15:01 +0200
Message-ID: <20230710171504.867425-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 17:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184090

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

* needed for rust-llvm-native on hosts with gcc-13

Based on commit 3382759cb6c5 ("llvm: backport a fix for build with gcc-13")

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: rebase onto 2022-04.11-kirkstone

 meta/recipes-devtools/rust/rust-llvm.inc      |  4 ++-
 ...-missing-cstdint-header-to-Signals.h.patch | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-header-to-Signals.h.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm.inc b/meta/recipes-devtools/rust/rust-llvm.inc
index 5c2ccdac9a..e645e7a7ac 100644
--- a/meta/recipes-devtools/rust/rust-llvm.inc
+++ b/meta/recipes-devtools/rust/rust-llvm.inc
@@ -3,7 +3,9 @@ LICENSE ?= "Apache-2.0-with-LLVM-exception"
 HOMEPAGE = "http://www.rust-lang.org"
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2"
+            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+            file://0003-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
+"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
diff --git a/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-header-to-Signals.h.patch
new file mode 100644
index 0000000000..6ed23aa9c5
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0003-Support-Add-missing-cstdint-header-to-Signals.h.patch
@@ -0,0 +1,32 @@
+From a94bf34221fc4519bd8ec72560c2d363ffe2de4c Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 23 May 2022 08:03:23 +0100
+Subject: [PATCH] [Support] Add missing <cstdint> header to Signals.h
+
+Without the change llvm build fails on this week's gcc-13 snapshot as:
+
+    [  0%] Building CXX object lib/Support/CMakeFiles/LLVMSupport.dir/Signals.cpp.o
+    In file included from llvm/lib/Support/Signals.cpp:14:
+    llvm/include/llvm/Support/Signals.h:119:8: error: variable or field 'CleanupOnSignal' declared void
+      119 |   void CleanupOnSignal(uintptr_t Context);
+          |        ^~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [llvmorg-15.0.0 ff1681ddb303223973653f7f5f3f3435b48a1983]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
+---
+ llvm/include/llvm/Support/Signals.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/include/llvm/Support/Signals.h b/llvm/include/llvm/Support/Signals.h
+index 44f5a750ff5c..937e0572d4a7 100644
+--- a/llvm/include/llvm/Support/Signals.h
++++ b/llvm/include/llvm/Support/Signals.h
+@@ -14,6 +14,7 @@
+ #ifndef LLVM_SUPPORT_SIGNALS_H
+ #define LLVM_SUPPORT_SIGNALS_H
+ 
++#include <cstdint>
+ #include <string>
+ 
+ namespace llvm {
-- 
2.41.0


