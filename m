Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A13EB64DC
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 09:34:49 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.35749.1688981679559661875
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jul 2023 02:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=fxg63aMl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-456497-202307100934364d0526a6bb0e72924f-zhtacu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202307100934364d0526a6bb0e72924f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 10 Jul 2023 11:34:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zvXvZ02QLaNpoLrAv+r3Y3qsf9p2s5jzb197MmN22I4=;
 b=fxg63aMluaFJ5lRbXnifzEC219yFANA+R9x6ilkfKFJTlPmO33e3zZLejdzg8QuvUq3sRN
 erqvsEtSFXwG94Yc4leUxQENMK15ryQsPZzch7kjjOBecLcLtgKVw+jfhP1BfcsBNnJ/V9mg
 36pygjd1Bt7igD5R9mlazy2aDW5gQ=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH] rust-llvm: backport cstdint header fix for build with gcc-13
Date: Mon, 10 Jul 2023 11:34:27 +0200
Message-ID: <20230710093432.669209-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 09:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184062

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

* needed for rust-llvm-native on hosts with gcc-13

Based on commit 3382759cb6c5 ("llvm: backport a fix for build with gcc-13")

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 ...-missing-cstdint-header-to-Signals.h.patch | 32 +++++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.70.0.bb |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch b/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch
new file mode 100644
index 0000000000..6ed23aa9c5
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0004-Support-Add-missing-cstdint-header-to-Signals.h.patch
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
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
index 09e4c65be3..1d2a200005 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
@@ -10,7 +10,9 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+            file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+            file://0004-Support-Add-missing-cstdint-header-to-Signals.h.patch;striplevel=2 \
+"
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 
-- 
2.41.0


