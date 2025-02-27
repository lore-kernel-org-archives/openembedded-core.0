Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BBBC021B8
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 02:30:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.2226.1740623407471663185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 18:30:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=igbCkx3I;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22349dc31bcso6575355ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 18:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740623407; x=1741228207; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DdIfHc230x5v3WCd2cnIoRIZOGgNtbrWr0ZC58WB2Cs=;
        b=igbCkx3IcFAkzTGjDNBmUShifiS6wOCkvX9GxF81Ww5ZhYJvug7254gP2AYabZgvrl
         SG9mLOtqzeVH7GMoUAYpaEqZiNxz94fcXzznN6hYggwnAnDAcf9KPr8+JdYNgR0SYmos
         OsruOW8VbcMtnVr3yWdDmT7dad6TJf3QN77YREr28YFvXVZV7jJMgeaDVq+6V2ObAti3
         ggcOiyzft+jjsO67gbFlMYOI6zVul8U2LzeEf1+WCdplv673H/TRpg4S5Mzp550pD5YJ
         DjZWAwngDrdFi8ydrNFciFGpggJ9lKiy9pJbc9FTzLwxH1vhNLzR7gXhrpBC2DR0agvs
         msTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623407; x=1741228207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdIfHc230x5v3WCd2cnIoRIZOGgNtbrWr0ZC58WB2Cs=;
        b=QlRXwhlzetEEk0gBejsfymGAupWCSExcoM/nJgws6uZV9wXiui6TVtRCAWVonmHm+Q
         LyHVwE+472xTbfFmsT4nH4s7pQfV0zMv9snWhgv19siviW5CcNOVTLY1Jqroc/hl7enb
         ST/LulerAgYET/MipxOsHtg8+FFCRKa2vBvNQO9zUtQceKL6WJRmYDMPbgVFhzXfI/IA
         Orn1dHRrwOmbFcTXJyHzyXC/Qv9fcTyKm+DVn58wTvlBOFkEbsjAXnneyos6XusjNG8h
         K30dihMnUJ6MIWG6UalQLgNxX+YqXD91Jz18kAtpjnpPLyHua7PbECK8W37vycdHHyC+
         5zwQ==
X-Gm-Message-State: AOJu0YzbGuX6aFVIejF3LwP6IqjlE/B3GG9ocTXRj7VIFXC0/C1SblXC
	yOGXz62dlLnQ3B7Xew3oherQFpojN0X7wlKmYnL+wNVQLufXejR/PUaCxnxj
X-Gm-Gg: ASbGnctRgF+UHmCto4JXLMlIE+mrsj6HOGUJt86vaK+e64ZMNjuKv7QBROdPHg9TDdr
	6heRm1FPyjgIPbuMOzY/Ayb5W4ZovNOgvSR4OCiZh+RpQ8UNBvMhSO+hLwB+nAGvmEbxFg3OoNu
	y7hRs2ozQqLkN3nejShaVYh/gLaJdfLKvCZHJVDJGCQbiP4J/dN+d1kC0g7E4GPaqVUFJmy6acu
	IKVwhSsJRXFUeeu9xTWd5kquwXVBTbWzVwZXz3B+c6HrcWE3atXkkE8grnI2Kfg3HUmCS54TY+K
	knbkpG7tRxe0fwPHUw==
X-Google-Smtp-Source: AGHT+IEO/Pqj8mpzV6eq03Hqaa/2S2z1qQdlEo7Jxh5+3mlfTp9sUjXu9KLMhRUcqKHfIBJXhExQJA==
X-Received: by 2002:a17:902:ce8c:b0:21f:522b:690f with SMTP id d9443c01a7336-221a11b9bfdmr385714685ad.46.1740623406452;
        Wed, 26 Feb 2025 18:30:06 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::9a5a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe6cd59sm342254b3a.75.2025.02.26.18.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 18:30:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <Randy.MacLeod@windriver.com>
Subject: [PATCH] rust-llvm: Fix build break found with clang
Date: Wed, 26 Feb 2025 18:30:03 -0800
Message-ID: <20250227023003.522118-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 02:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211975

call and callee have mismatched types, this patch fixes it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../0001-NFC-fix-build-failure-100993.patch   | 30 +++++++++++++++++++
 .../recipes-devtools/rust/rust-llvm_1.82.0.bb |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-NFC-fix-build-failure-100993.patch

diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-NFC-fix-build-failure-100993.patch b/meta/recipes-devtools/rust/rust-llvm/0001-NFC-fix-build-failure-100993.patch
new file mode 100644
index 00000000000..ed26de73cee
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-llvm/0001-NFC-fix-build-failure-100993.patch
@@ -0,0 +1,30 @@
+From 40b4fd7a3e81d32b29364a1b15337bcf817659c0 Mon Sep 17 00:00:00 2001
+From: Chen Zheng <czhengsz@cn.ibm.com>
+Date: Tue, 30 Jul 2024 09:02:07 +0800
+Subject: [PATCH] [NFC] fix build failure (#100993)
+
+Fix the build failure caused by
+https://github.com/llvm/llvm-project/pull/94944
+
+Fixes https://github.com/llvm/llvm-project/issues/100296
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/40b4fd7a3e81d32b29364a1b15337bcf817659c0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/lib/Analysis/ConstantFolding.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/llvm/lib/Analysis/ConstantFolding.cpp b/llvm/lib/Analysis/ConstantFolding.cpp
+index 85ee231675d0..084647b1d9d9 100644
+--- a/llvm/lib/Analysis/ConstantFolding.cpp
++++ b/llvm/lib/Analysis/ConstantFolding.cpp
+@@ -1782,8 +1782,8 @@ Constant *ConstantFoldFP(double (*NativeFP)(double), const APFloat &V,
+ }
+ 
+ #if defined(HAS_IEE754_FLOAT128) && defined(HAS_LOGF128)
+-Constant *ConstantFoldFP128(long double (*NativeFP)(long double),
+-                            const APFloat &V, Type *Ty) {
++Constant *ConstantFoldFP128(float128 (*NativeFP)(float128), const APFloat &V,
++                            Type *Ty) {
+   llvm_fenv_clearexcept();
+   float128 Result = NativeFP(V.convertToQuad());
+   if (llvm_fenv_testexcept()) {
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.82.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.82.0.bb
index 509b5078971..17d49be4ef5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.82.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.82.0.bb
@@ -10,7 +10,9 @@ require rust-source.inc
 
 SRC_URI += "file://0002-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
-	    file://0003-llvm-fix-include-benchmarks.patch;striplevel=2"
+            file://0003-llvm-fix-include-benchmarks.patch;striplevel=2 \
+            file://0001-NFC-fix-build-failure-100993.patch;striplevel=2 \
+           "
 
 S = "${RUSTSRC}/src/llvm-project/llvm"
 

