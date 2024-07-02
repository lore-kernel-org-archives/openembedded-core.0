Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CC9C3064D
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 06:26:27 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.18247.1719901583596259484
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 23:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W3D00UOK;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70670fb3860so2337638b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 23:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719901583; x=1720506383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hdtmwodtPPo23IZniv5GpeZFSQCzFN5zZHHOtmuMP0=;
        b=W3D00UOKZm2+YtdIDuRyofUbccwr53BQ/p865ToM/nFkq7SGr2dI/p0kAl45OuRp5S
         I+52hb35VQXGmvoguSGxH+AlJXRZOcI7rUJNa6NjqQGfnDbQ6+grK3uEIx1Y8O+0Uc+f
         Ayro9hvdobeLtlAeXTzlPrQpOSxbOQUvAFcU8SeUo8fWIFcVIck5NcL9EmXRbP7sQvLS
         AMfuao5OULpNJc79NccFuQvXinAlN7M6f1u8cRPeDzUP2JaexzYBrauGhsneqYY6xccs
         uNR+8rGJ4EB2hSBqw1cBiJ/H0qcyvf2m4aTIpC/I+5ZnuSjChY06JMtvXE3IMSz5WfjP
         QOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719901583; x=1720506383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hdtmwodtPPo23IZniv5GpeZFSQCzFN5zZHHOtmuMP0=;
        b=eLGJRDqg/sZW+mYHdHDGBibp7annezuWqYnPqJDXmvizzsGoYkHdoO+A2ZBVBVQdOR
         K7yWA76Om2woZRQdCrkRksBMmGtWBVMT3A7FsE0uMWqwF7+yvnG18vjJKgy04sFJ4b6S
         lHXaWr1PQH7CkhS0yNqPYkVpKAM9bkEreOCCT7xj2SPHQfzUfRMi2N4FgeVhTRXet9zO
         ELOctcR1s7WbW7ieBExdrQd//CydKxNy3G0aE+InIb6fRUotHudyQRLEM7PLD9kS5q4o
         /njH1ONtEUHBVoIpf3QcpIbW0K5Ft9U1UGmLqY1gc1V1cvOw9XrjCBgCk/l3K7xWAHtR
         /UPQ==
X-Gm-Message-State: AOJu0YwgOouGMiIGPsMqR4mduvvLG0Izh2Cl1q1DuctyVl7sBNtFIlrW
	IXFOBGzl6B3EhoWr9Dtuq35b/H/ovWt201QUY6BhZ5OMtk3kzNTkqA5NSw==
X-Google-Smtp-Source: AGHT+IHmbt3L/VZlBNEKflK8a1jCVD+Atf8fLkQ0LWic25moJXqeFjd06vtaNOl7tcB7tAmkr7uKrg==
X-Received: by 2002:a05:6a00:c87:b0:706:89cb:6f97 with SMTP id d2e1a72fcca58-70aaad1e249mr6958475b3a.5.1719901582616;
        Mon, 01 Jul 2024 23:26:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::9980])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70803ecf95bsm7869454b3a.140.2024.07.01.23.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:26:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa: Including missing LLVM header
Date: Mon,  1 Jul 2024 23:26:18 -0700
Message-ID: <20240702062619.1072589-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 06:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201412

This issue happens with LLVM trunk

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-missing-llvm-IR-header-Module.h.patch | 41 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
new file mode 100644
index 00000000000..82ad88a079c
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-amd-Include-missing-llvm-IR-header-Module.h.patch
@@ -0,0 +1,41 @@
+From 777d69cf15b80ab1f109a4936d6e4801c4b0e0f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 1 Jul 2024 23:09:29 -0700
+Subject: [PATCH] amd: Include missing llvm IR header Module.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With LLVM-19, Module.h header is not being pulled, which results in
+compile errors e.g.
+
+src/amd/llvm/ac_llvm_helper.cpp:102:10: error: no matching function for call to ‘unwrap(LLVMOpaqueModule*&)’
+  102 |    unwrap(module)->setTargetTriple(TM->getTargetTriple().getTriple());
+      |    ~~~~~~^~~~~~~~
+In file included from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/Type.h:18,
+                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/DerivedTypes.h:23,
+                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/IR/InstrTypes.h:26,
+                 from /mnt/b/yoe/master/build/tmp/work/x86_64-linux/mesa-native/24.0.7/recipe-sysroot-native/usr/include/llvm/Analysis/TargetLibraryInfo.h:14,
+                 from ../mesa-24.0.7/src/amd/llvm/ac_llvm_helper.cpp:8:
+
+Its getting the definition from llvm/IR/Type.h instead of Module.h and caused
+confusion to compiler
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29993]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/amd/llvm/ac_llvm_helper.cpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helper.cpp
+index 5d065279ad1..af4a50f8409 100644
+--- a/src/amd/llvm/ac_llvm_helper.cpp
++++ b/src/amd/llvm/ac_llvm_helper.cpp
+@@ -8,6 +8,7 @@
+ #include <llvm/Analysis/TargetLibraryInfo.h>
+ #include <llvm/IR/IRBuilder.h>
+ #include <llvm/IR/LegacyPassManager.h>
++#include <llvm/IR/Module.h>
+ #include <llvm/IR/Verifier.h>
+ #include <llvm/Target/TargetMachine.h>
+ #include <llvm/MC/MCSubtargetInfo.h>
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2581ccb1202..272d57c7496 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-drisw-fix-build-without-dri3.patch \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
+           file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"

