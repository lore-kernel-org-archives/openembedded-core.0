Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A70D33A32
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:45:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.27955.1730832351662841600
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:45:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bNen9d9g;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20ca388d242so58779425ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 10:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730832351; x=1731437151; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0M6PSOiWB/4P5Ib+O7NMZroGplhInshT4hwzyrHqtYc=;
        b=bNen9d9ggex8+FqwNFLDCF6Hkmh/fT3k+92vrEwiDUxZY1E+4I5VACQtNup221MMop
         oJzANnSbg5fPDOOOn7iU+jFkeqa+XdRRCar4/CilGeDO+0H2tHiKqBqGwlYWisSXTi61
         PPVUw+x2cj3sMBFXYAAnJEqggfR+mmVUO1u+tHz2D0ONoRItEIKpdZO+icXLX58JYqYc
         KlR//Jk+7Z8VLcTeqrycWTuRSiWPL9cW7uXPvbf2mK6HmFyQcX2+k2Yv8jR6TPzQtOw6
         bZ59WzidSHMvPxMO5gQlkB7yJv7LMFQZAIPQkSzi6TFBWX/BN+LToUkyNIvnPAj3OKDf
         Zedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730832351; x=1731437151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0M6PSOiWB/4P5Ib+O7NMZroGplhInshT4hwzyrHqtYc=;
        b=f6IyBE6TwGaW40aNcR5aX9wgxbcmmHSPxq6OH53cbVBzDgBHI3FSO2xAdr3/MMwyYo
         6Y4uJV4YzSw9Oap1E27P1uw6kbaXwH4UTMveesCnhdk/TtK7ZAmOEXQvmK9wSCPKCMdd
         DjreCKkhAWkLADN5ytNub6vEcXXueGxOkwKLhOT3wHTGYzNKpmaW6p+eVKxUOe2ppAEg
         aoDjNaESErFtr1rBIEXZ111M+RcIbULycKNAS86rwCnmfg/MPauKBfwmPZtF1V4Lm9yI
         NAr3Y35mW1wpJO++Z9AZJ17cx2+iP8AJjRKy/nbmvrMajXIR6AXuR1bHg0oZvgrEAwJq
         xc6A==
X-Gm-Message-State: AOJu0YynhUZ+/RkoE2RtF5XyzqEs7jcfVzc7aqIIkA5z2NH1Qqys70+R
	Tc37fL+RbFVWBdkZbFtRE6lONQ1JO3XiaF8QSolvfp6qufdGG+8rfOyQxw==
X-Google-Smtp-Source: AGHT+IGHKDHmF7VKRfUydMo3Ggglwi5nFcAR+eZwOccoDEpvn2kmWeij+q0/tiTOL0tjZ2UOQRFwBg==
X-Received: by 2002:a17:902:db0b:b0:20b:a41f:6e48 with SMTP id d9443c01a7336-2111af69655mr240731595ad.27.1730832350689;
        Tue, 05 Nov 2024 10:45:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::ba3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa0ed5esm12526670a91.2.2024.11.05.10.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:45:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 08/19] clang/recipes: Add missing SUMMARY field
Date: Tue,  5 Nov 2024 10:45:27 -0800
Message-ID: <20241105184540.3450302-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105184540.3450302-1-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 18:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206735

Enhance description while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clang/clang-cross-canadian_git.bb                 |  2 +-
 meta/recipes-devtools/clang/clang-cross_git.bb        |  2 +-
 meta/recipes-devtools/clang/clang-crosssdk_git.bb     |  2 +-
 meta/recipes-devtools/clang/clang_git.bb              | 11 ++++++++++-
 .../clang/compiler-rt-sanitizers_git.bb               |  4 +++-
 meta/recipes-devtools/clang/compiler-rt_git.bb        |  6 +++++-
 meta/recipes-devtools/clang/libclc_git.bb             |  2 +-
 meta/recipes-devtools/clang/libcxx_git.bb             |  2 +-
 meta/recipes-devtools/clang/nativesdk-clang-glue.bb   |  2 +-
 meta/recipes-devtools/clang/openmp_git.bb             |  2 +-
 10 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
index 33c33c4d443..f327a1275e7 100644
--- a/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross-canadian_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGET_ARCH} target)"
+SUMMARY = "Clang/LLVM based C/C++ compiler (cross-canadian for ${TARGET_ARCH} target)"
 HOMEPAGE = "http://clang.llvm.org/"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang-cross_git.bb b/meta/recipes-devtools/clang/clang-cross_git.bb
index 8aee5cd8628..a0c215e4dfb 100644
--- a/meta/recipes-devtools/clang/clang-cross_git.bb
+++ b/meta/recipes-devtools/clang/clang-cross_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "Cross compiler wrappers for LLVM based C/C++ compiler"
+SUMMARY = "Cross compiler wrappers for LLVM based C/C++ compiler"
 HOMEPAGE = "http://clang.llvm.org/"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang-crosssdk_git.bb b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
index e4b521d0d23..913c49ac740 100644
--- a/meta/recipes-devtools/clang/clang-crosssdk_git.bb
+++ b/meta/recipes-devtools/clang/clang-crosssdk_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
 HOMEPAGE = "http://clang.llvm.org/"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index c2b6f272d8f..1ad40f2fcff 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -1,7 +1,16 @@
 # Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "LLVM based C/C++ compiler"
+SUMMARY = "LLVM based C/C++ compiler"
+DESCRIPTION = "Clang is an LLVM based C/C++/Objective-C compiler, \
+                which aims to deliver amazingly fast compiles, \
+                extremely useful error and warning messages and \
+                to provide a platform for building great source \
+                level tools. The Clang Static Analyzer and \
+                clang-tidy are tools that automatically find bugs \
+                in your code, and are great examples of the sort \
+                of tools that can be built using the Clang frontend \
+                as a library to parse C/C++ code"
 HOMEPAGE = "http://clang.llvm.org/"
 SECTION = "devel"
 
diff --git a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
index db484683af4..acd5516a8d1 100644
--- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
@@ -1,7 +1,9 @@
 # Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "LLVM based C/C++ compiler Runtime"
+SUMMARY = "LLVM based C/C++ compiler Sanitizers Runtime"
+DESCRIPTION = "Runtime libraries that are required \
+				to run the code with sanitizer instrumentation"
 HOMEPAGE = "http://compiler-rt.llvm.org/"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/recipes-devtools/clang/compiler-rt_git.bb
index a6f6db3cc73..080e53b93d5 100644
--- a/meta/recipes-devtools/clang/compiler-rt_git.bb
+++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
@@ -1,7 +1,11 @@
 # Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "LLVM based C/C++ compiler Runtime"
+SUMMARY = "LLVM based C/C++ compiler Runtime"
+DESCRIPTIOM = "Simple builtin library that provides an \
+				implementation of the low-level target-specific \
+				hooks required by code generation and other runtime \
+				components"
 HOMEPAGE = "http://compiler-rt.llvm.org/"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index 16ab8332138..0d43133281f 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "LLVM based OpenCL runtime support library"
+SUMMARY = "Implementation of the library requirements of the OpenCL 1.1+ C programming language"
 HOMEPAGE = "http://libclc.llvm.org/"
 SECTION = "libs"
 
diff --git a/meta/recipes-devtools/clang/libcxx_git.bb b/meta/recipes-devtools/clang/libcxx_git.bb
index a2a67880a8b..c7f3a77ca94 100644
--- a/meta/recipes-devtools/clang/libcxx_git.bb
+++ b/meta/recipes-devtools/clang/libcxx_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "libc++ is a new implementation of the C++ standard library, targeting C++11"
+SUMMARY = "libc++ is a new implementation of the C++ standard library, targeting C++11 and above"
 HOMEPAGE = "http://libcxx.llvm.org/"
 SECTION = "base"
 
diff --git a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
index a0b93740845..8e5622f6c18 100644
--- a/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
+++ b/meta/recipes-devtools/clang/nativesdk-clang-glue.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2014 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
+SUMMARY = "SDK Cross compiler wrappers for LLVM based C/C++ compiler"
 HOMEPAGE = "http://clang.llvm.org/"
 LICENSE = "Apache-2.0-with-LLVM-exception"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0-with-LLVM-exception;md5=0bcd48c3bdfef0c9d9fd17726e4b7dab"
diff --git a/meta/recipes-devtools/clang/openmp_git.bb b/meta/recipes-devtools/clang/openmp_git.bb
index 34f6e4ab9e5..549df0e7684 100644
--- a/meta/recipes-devtools/clang/openmp_git.bb
+++ b/meta/recipes-devtools/clang/openmp_git.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2017 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-DESCRIPTION = "LLVM based C/C++ compiler Runtime"
+SUMMARY = "LLVM OpenMP compiler Runtime"
 HOMEPAGE = "https://openmp.llvm.org/"
 SECTION = "libs"
 

