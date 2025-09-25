Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D94CAC5B7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:10 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.11863.1758807670057920920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UP2iARKv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so910965a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807669; x=1759412469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zj8bUAP4bdL/VGH1JGddHCcXr3E5VWtOJksEalWQuwE=;
        b=UP2iARKvKblNV8FKuNycptblQMCD9Tz1z7t3k21IWcSamUatSpl0Ze5z0MJ+AsDZWi
         xur+/cR1/aXYgfKkXeINxJxWreCsabCKNIWZQ8ZQIA6EeYRbae9dJ7vCoa1xbOY1I/yv
         dtqovH7cNK9xPzbfKpTkYQzfgkiBfPRchdKx8+uBrBHxQQgq7RVBNxK0vyZjYo3SYHmK
         p9Tzvtlj1+FEKiGZ289EBjWczTodoiVm1nWu2LdkerG36CIrOYvlObJvPw9/6zNlZqfs
         VgU1rZC61VsaOxrc5s0jyxd1AYbHm26EKKpB+Nu0xvUg/97z9dJvt2//KcwotVL1Ju3J
         T9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807669; x=1759412469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zj8bUAP4bdL/VGH1JGddHCcXr3E5VWtOJksEalWQuwE=;
        b=soG9u7V3txcIM5xpfriB9rKq2Nk1rqQt5hfAnHAZO616HCy705k9UqBYN8tuPVAPD6
         YJl0qyTohvSxBXaDnpd5Ryw8PH1Xr4eq3Mzn/aUZjdqRkrIVaPUQbMNd3wQMtVYjoIST
         tvV35Fz74mOQBWVg4lY3LQGkhPlITz8245DqfvviayReuaKDrWluLPnwKVgIuo92kwei
         bq+W4aVr3E6r2ywLOtJT2j6K+r9ybG4WC4+3CgRS8Y1DUZYTbu56eAWAeJjYM3Yc1Zf3
         toPLicN8tl/ECOHXzyDeV6Ra5GdjUEDMhi4e1dEi+rgaPuAbYNF/Ip1fMawv6xAvAlWS
         VvKw==
X-Gm-Message-State: AOJu0YzxhnotJTXLyfgw0V0vd6lzCyRpFNNN7pP+EdFwhnsGDHgAtcAD
	dJReNGRvabjSigVHDgQeiFybzq3MO26xn2KodnQ/OZrM/+6sGkluMQSzWfG7rkuJYkF/qE0olqn
	Yj0L9
X-Gm-Gg: ASbGncuUST/GIzRSrlmoUbWfF+6G5RBrppzflwBYTWmYa+E+znxs45onKXyK1YSYMXZ
	dOYvhrnMl0WTZjQSOz9dce7LoZEhngGL15Sb9S+M8K5TbiqkmDrdTq2hiXiM7768BDZUgY8ty/O
	d/5O42AUbkoZYopqYP7SbeV4GjprLT8/Ps/5/BJa4bBYaz5GXz/zGFqpappqoc9nm9a4DrQMxyB
	55QEdZQEpsDOd5HeKr9+y2xNN/d7SUpqs8n3Ou/bheWetv1WJsPn5Sy4yoQ0s/B8r9uxC14IKBO
	+3HYL8hByb4gIO/bmAI7kdgTRn4Pl6855tYFxZ4QmPaQ0VphIMTLSdKAO846Is3YD0RDFsV251J
	1Yd+YpzBItfufKw==
X-Google-Smtp-Source: AGHT+IHvzshPUveU1WVANDGpCND9V3dGWDcySmiz7c0869SjdXtXM65YiwWhwb/QbH68XpuTyGu77g==
X-Received: by 2002:a17:903:185:b0:267:a55a:8684 with SMTP id d9443c01a7336-27ed49c770fmr46735145ad.2.1758807669122;
        Thu, 25 Sep 2025 06:41:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] llvm: fix build with gcc-15
Date: Thu, 25 Sep 2025 06:40:48 -0700
Message-ID: <a2c5e1d6ec6c905bbf31f017a010b0496b39b211.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758807463.git.steve@sakoman.com>
References: <cover.1758807463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224022

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Pick 3 patches from meta-clang's scartsgap branch to fix build with
gcc-15. These patches are already in upstream llvm but not in
18.1.8 release.

Note: the patch 0039-Fix-build-with-GCC-15.patch from meta-clang
is not needed as it targets lldb which we do not build.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...36-Add-cstdint-to-SmallVector-101761.patch | 28 ++++++++++++++++
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch | 23 +++++++++++++
 ...-include-to-X86MCTargetDesc.h-123320.patch | 32 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.8.bb     |  3 ++
 4 files changed, 86 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch b/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
new file mode 100644
index 0000000000..cf00eacbee
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
@@ -0,0 +1,28 @@
+From 9c9071480edd4093b28a9e9a9980c2426d27344c Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Fri, 2 Aug 2024 23:07:21 +0100
+Subject: [PATCH] Add `<cstdint>` to SmallVector (#101761)
+
+SmallVector uses `uint32_t`, `uint64_t` without including `<cstdint>`
+which fails to build w/ GCC 15 after a change in libstdc++ [0]
+
+[0] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=3a817a4a5a6d94da9127af3be9f84a74e3076ee2
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/7e44305041d96b064c197216b931ae3917a34ac1]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/include/llvm/ADT/SmallVector.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/include/llvm/ADT/SmallVector.h b/llvm/include/llvm/ADT/SmallVector.h
+index 09676d792..17444147b 100644
+--- a/llvm/include/llvm/ADT/SmallVector.h
++++ b/llvm/include/llvm/ADT/SmallVector.h
+@@ -19,6 +19,7 @@
+ #include <algorithm>
+ #include <cassert>
+ #include <cstddef>
++#include <cstdint>
+ #include <cstdlib>
+ #include <cstring>
+ #include <functional>
diff --git a/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch b/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
new file mode 100644
index 0000000000..24e7e1234f
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
@@ -0,0 +1,23 @@
+From 422390b31680305ce6babcfbf65579b7dbe090a5 Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sat, 3 Aug 2024 06:36:43 +0100
+Subject: [PATCH] Include `<cstdint>` in AMDGPUMCTargetDesc (#101766)
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/8f39502b85d34998752193e85f36c408d3c99248]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h b/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+index 3ef00f757..879dbe1b2 100644
+--- a/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
++++ b/llvm/lib/Target/AMDGPU/MCTargetDesc/AMDGPUMCTargetDesc.h
+@@ -15,6 +15,7 @@
+ #ifndef LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ #define LLVM_LIB_TARGET_AMDGPU_MCTARGETDESC_AMDGPUMCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ 
+ namespace llvm {
diff --git a/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch b/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
new file mode 100644
index 0000000000..9bfbe9e2ed
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
@@ -0,0 +1,32 @@
+From 72dc74c42eb9d9940b36c6804a4e4ac757370324 Mon Sep 17 00:00:00 2001
+From: Stephan Hageboeck <stephan.hageboeck@cern.ch>
+Date: Mon, 20 Jan 2025 17:52:47 +0100
+Subject: [PATCH] Add missing include to X86MCTargetDesc.h (#123320)
+
+In gcc-15, explicit includes of `<cstdint>` are required when fixed-size
+integers are used. In this file, this include only happened as a side
+effect of including SmallVector.h
+
+Although llvm compiles fine, the root-project would benefit from
+explicitly including it here, so we can backport the patch.
+
+Maybe interesting for @hahnjo and @vgvassilev
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/7abf44069aec61eee147ca67a6333fc34583b524]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h b/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+index 437a7bd6f..fd7d79484 100644
+--- a/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
++++ b/llvm/lib/Target/X86/MCTargetDesc/X86MCTargetDesc.h
+@@ -13,6 +13,7 @@
+ #ifndef LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ #define LLVM_LIB_TARGET_X86_MCTARGETDESC_X86MCTARGETDESC_H
+ 
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
index 1f4b7e74d7..615c9f9e59 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://0002-llvm-Fix-CVE-2024-0151.patch;striplevel=2 \
+           file://0036-Add-cstdint-to-SmallVector-101761.patch;striplevel=2 \
+           file://0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch;striplevel=2 \
+           file://0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch;striplevel=2 \
            file://llvm-config \
            "
 SRC_URI[sha256sum] = "0b58557a6d32ceee97c8d533a59b9212d87e0fc4d2833924eb6c611247db2f2a"
-- 
2.43.0


