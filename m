Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F408EC001DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:09 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.9023.1689690422136913801
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AUsFs8jR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-668711086f4so3573403b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690421; x=1692282421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B680sGUvSDNiRsyEtb8oZsmr8CS1hon49PHkaRLPd1U=;
        b=AUsFs8jRfmOITf0q/hjP/zHnHPZD5X88mFNSFt3FVwhcD21hwI9xWvWIAJmqgRSv7k
         7TCkMuFsZ/R86dRCsrgi5N3pHm35s0pMzSBGhv7OtkVekJbdGAvtv/DEDSJH4Rush90A
         NiCWu7Nf37IjWWjc4jZAmomplIE9at1OUnn24NgqNRBHSUURCIUIMGCtP6scEQCOiFNw
         lNPF6RIba3ekeQQ5Lhkc2wHdiUfUotPxradHNKFeeHBkCioUtcIJ193T0NztoBfXC+Y8
         ncdAAXmUDLmKxZClSgh0zWqakEPK+S2uLZiqyCuAPnmW6VKoI0f367GInIVm9yNoQNHd
         H+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690421; x=1692282421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B680sGUvSDNiRsyEtb8oZsmr8CS1hon49PHkaRLPd1U=;
        b=b9X5xBuczgCQiTR5VoRPBA1aHHs85htEvfdLhXC5G1KcjpFrmCq2/VIuwXs14tL66Z
         9h16M6QxPjeBR16HINARvoBkHsQTE4YMEd1a0Gh5bOwdtCZLHMnxvUiZFMfizge25jZb
         eSnyG9W8hynKD1OlEiTpgKfDOnDNMAWn7HVzskPuku5mKd29NZ67z8w1agvk7ErEEzKL
         uzinpxOWCIvwLy+wsA63Y3ZS9SbCigoPYkvBo9zMrjrVfsdjAkO7fEr0BSZ0sbDHMgoA
         rejOAtuDoyYG90edC3Xs9WPZW/vamsUC8sJxQ4A2NslYOQCH0pzeEX4O77zk75OA3Ste
         fVFw==
X-Gm-Message-State: ABy/qLbkCDv74AYXApYUjTc/c+LFvXgupbKJd58Oe2f5WhUy4udc6R3R
	Zc7v9ThJZZWeRULI/M3Y0hOwLQU3HfZYUEUL2NI=
X-Google-Smtp-Source: APBJJlFuvGnk08fhHPWoT2sqxVCSSA9UWl2w82edbXME2LBg+TSp0QSnBaL/syKR39kECKE5A5No6w==
X-Received: by 2002:a05:6a00:2d24:b0:682:ffaa:ebba with SMTP id fa36-20020a056a002d2400b00682ffaaebbamr14827623pfb.13.1689690421182;
        Tue, 18 Jul 2023 07:27:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:27:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/27] rust-llvm: backport a fix for build with gcc-13
Date: Tue, 18 Jul 2023 04:25:53 -1000
Message-Id: <d6684a9c9f713ad30442a2a036ff86b534585400.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184523

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

* needed for rust-llvm-native on hosts with gcc-13

Based on commit 3382759cb6c5 ("llvm: backport a fix for build with gcc-13")

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
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
2.34.1


