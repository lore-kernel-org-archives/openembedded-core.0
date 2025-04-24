Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1C1C3ABA3
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 07:21:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.9648.1745479258525908763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 00:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m4WdmR7S;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2260c91576aso5243025ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 00:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479258; x=1746084058; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8B+fsbu7hS/hk8fsozRfLYehf1VTsHDFaAD8a4oBB8=;
        b=m4WdmR7SLSSLXEeDQg9/2QlfEQ7lR7fuG/GYnKFKqu9AXLvgkQHQMHRy5kCXHVwyoz
         HX2Yp4J2g/kfXOsEQUjeSOHrKzkybgMBvimbeCe+aKO/TA33RTkadWGwIu8Hi/I7dCMi
         bI188AcQrE6ioL/rhMDICtQRi6uDlBE4yzGaaxrQw6kag7N5yhcdTE8MDbgQmongMqrN
         KSA31LZ339D7qzv2hsxIJ9dGTNU3AxVEJjxkSUbgajZsAjZLhL3tgUFAeAt5y4m1SwHg
         NKvsrw7oYYXNEaa8pBqa/TT7wcQfJl5HP9jIsthRD2hCGHsfpyflAs2MSTxiJoswnFu6
         9OIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479258; x=1746084058;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8B+fsbu7hS/hk8fsozRfLYehf1VTsHDFaAD8a4oBB8=;
        b=ZISNuiUmSeRd6Bo1AsQTXEWHX6XudCj9xfaAhVUkbsHPILguVuzcjvSPs0MCghkl9v
         q1CbkN6MBKtltzamOcRsYAV7WlAEHqDthZF7AQbpkc7dJS7FY4ZO5jeACu2L78uhilxH
         qMI1o+9OkE4LhUP1TrxxYoa41fYDoRzT7VSge2zDP01kMjdEvaBLmOaJEgjmU6hUMNR2
         D9Nyl9X23pMBRKMtXhxKbp7+ly/pRP6ajfmsjRr2os//HM1AuhCZ+YU5NABwWS1RM9r6
         rxuEWWDoGiY+7fvn2pvR4P3dX8zZ0oGWFMZO6ygPsuJ3bQFbrDiCQziRHth2EUG+2pWy
         hKLg==
X-Gm-Message-State: AOJu0YzaTPh7XwTdywwG17xHGNyYfULSFjHdU6YXMXLJJTh2abYIsppQ
	gZj7TiewC9mhaDT0tlnhmLFmT+ZWUY/vvyTnShkmCJo9ugnmnuJ4
X-Gm-Gg: ASbGncu3M/jPUPJstEVzwQwwz6Lj0QaEpIlXOoJZzkdDvn+7xHgLS7Rh0IlwxJBl/PU
	NTUMTs1Qc8luD13iM9PS0NjkvLL7KKaunWwFmDMWPQ2PWb8OBh7KLKknHaNevhaIIeP5unVYsgx
	Rjfveja0qB3kO6Ehkav+cDSHi7BlfrmRLnM4GeMO+nfz9MFyQetPZQWubiwv4IgJcBDq5xxGcSq
	qlCEPFrBTcMPYa5Q4ktOqm1wiR9gVeH+bc65bOmED5KWGARmVogTFuvCw274OyCEu0FrMO8AqpU
	j/fo1ZvbMIHNZwQRlyf4FHpX2WbMMjjt
X-Google-Smtp-Source: AGHT+IEbidDQtx47gZvGR4p/Pa9/95Yae1oZhcag8hL+hr6a2HTRwaMVqti7E1QurzDq5DU0WHCwdg==
X-Received: by 2002:a17:903:1247:b0:223:60ce:2451 with SMTP id d9443c01a7336-22db3bf1387mr24153875ad.15.1745479257827;
        Thu, 24 Apr 2025 00:20:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5101636sm6234475ad.180.2025.04.24.00.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Apr 2025 00:20:40 -0700
Subject: [PATCH 06/11] clang: remove LLVM_LDFLAGS from llvm-config
 --ldflags output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-clang-merge-v1-6-5a492a8461aa@gmail.com>
References: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
In-Reply-To: <20250424-clang-merge-v1-0-5a492a8461aa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 07:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215333

From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

On OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
depend on exact build dir and as such be inappropriate to binaries
shared through sstate-cache. It is not possible to override this
behaviour in llvm-config since crossscripts are not being used for
native builds. Ignore LLVM_LDFLAGS for native builds.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-remove-LLVM_LDFLAGS-from-ldflags-output.patch | 32 ++++++++++++++++++++++
 meta/recipes-devtools/clang/common.inc             |  1 +
 2 files changed, 33 insertions(+)

diff --git a/meta/recipes-devtools/clang/clang/0039-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch b/meta/recipes-devtools/clang/clang/0039-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
new file mode 100644
index 0000000000000000000000000000000000000000..36831845490409d8ecb1f9c27cfc34ba3be8b3dd
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0039-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch
@@ -0,0 +1,32 @@
+From 648a28fcbde4f5c1899699185f9bceb389c0ad8c Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Date: Wed, 2 Apr 2025 17:05:17 +0300
+Subject: [PATCH] llvm-config: remove LLVM_LDFLAGS from --ldflags output
+
+On native OE builds the LLVM_LDFLAGS gets a lot of extra flags which may
+depend on exact build dir and as such be inappropriate to binaries
+shared through sstate-cache. It is not possible to override this
+behaviour in llvm-config since crossscripts are not being used for
+native builds. As a OE-specific modification ignore LLVM_LDFLAGS for
+native builds.
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/tools/llvm-config/llvm-config.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
+index a739f0d8dbea..3120f95fba9d 100644
+--- a/llvm/tools/llvm-config/llvm-config.cpp
++++ b/llvm/tools/llvm-config/llvm-config.cpp
+@@ -542,7 +542,7 @@ int main(int argc, char **argv) {
+         OS << ActiveIncludeOption << ' ' << LLVM_CXXFLAGS << '\n';
+       } else if (Arg == "--ldflags") {
+         OS << ((HostTriple.isWindowsMSVCEnvironment()) ? "-LIBPATH:" : "-L")
+-           << ActiveLibDir << ' ' << LLVM_LDFLAGS << '\n';
++           << ActiveLibDir << '\n';
+       } else if (Arg == "--system-libs") {
+         PrintSystemLibs = true;
+       } else if (Arg == "--libs") {
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f77a3eea0ec7af3de8bc7f075cd8ba88b77f6beb..6c89d853d5219b4d1f2907100dfad91953b126e9 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -70,6 +70,7 @@ SRC_URI = "\
     file://0036-Fix-build-on-ppc64-musl.patch \
     file://0037-clangd-Add-a-build-option-to-disable-building-dexp.patch \
     file://0038-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch \
+    file://0039-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

-- 
2.49.0


