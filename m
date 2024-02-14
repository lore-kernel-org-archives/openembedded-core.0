Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D795C48BED
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 20:51:45 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.43.1707943900938698176
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 12:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kkHfnZAo;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d746ce7d13so1722565ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 12:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707943900; x=1708548700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=benwZnCfqsgxuNKsCufY57z1ZqpMUHW4ygCN9ct1+J8=;
        b=kkHfnZAoy9IWUbtmpseOw2rIZUVr7rN6TWdSWgL4WRg8V858QihNuAQAq+g1XcnJxv
         yOWXnDvwjg7+kWjdpZcfp4Vem2uiAI1JIjvmZHB8gSVkBT8PASIvcGF3QNL6jAuFZTY0
         29hZ7n8hEgXw7O7B7J8EsJClRJ4gYsiwlkb6qeS3/IGJFk7Ebp4fqfaQlK6y4t57Wm6A
         IEI1ZKcNkBzBSJUodwF5Gcvbq9R9KQJE/XOsBa3XzYoF4CeILd5N2JL/AwahZ4ta2t5v
         O+3PY4OulbV17BPquE7SVDpzqc7RDCh5yDQOLxCRpK0QVHt4qckOcO68DhsND5KJhdXE
         xDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707943900; x=1708548700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=benwZnCfqsgxuNKsCufY57z1ZqpMUHW4ygCN9ct1+J8=;
        b=IMTVTtsZQ8xwbHmfDNN4aKrwuxxL2kK0MPe3YnTYAd0Ill/Gjfke2kJJZx73eWTx0w
         xVm2YEz6uJ3F1q8Ttht/1OAoS9u2fCXDHgi4FTRlUhLCXyC2wAP76p1AXkaerbpB9kov
         3ga6+USqlI69cEElc67zVQ0niXghgk6mhQBetjrezafaB/k6hj1btEmyxRomzxYzUxj7
         tkRwMr/8pUfbuanyjsuirk9pZVcFGDPB/omZSxzCCtPfYVYuRHICQAsPo9JbyfAJ4rOm
         2IXc0pImYyJymau5a/x/enHkUi+5KHYW8TH4mwkIbqR22l4WA4Jzm2pXnTo3ovDJAMu0
         BKnQ==
X-Gm-Message-State: AOJu0YyQe78h03vW/+GgOoFE+RdCDB+rtj6YAT4vk/6CICHL+4rxFBKi
	/69WxLlnCNnGKBau1HDjR52A8dN2gStum1RUuHNbyNT7LmHACLh489gKTZPV95o=
X-Google-Smtp-Source: AGHT+IH/5RzHAmOeLSICwtDxGltv6ZAy6z8w80nWFgSsS50u7r+z4LGPDC9tYO5sI4OF7W78FvaHeA==
X-Received: by 2002:a17:903:2352:b0:1d9:bf90:2f1b with SMTP id c18-20020a170903235200b001d9bf902f1bmr4639728plh.53.1707943899773;
        Wed, 14 Feb 2024 12:51:39 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::b58c])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001d916995423sm4150770pld.99.2024.02.14.12.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 12:51:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] mesa: Fix build with llvm 18
Date: Wed, 14 Feb 2024 12:47:35 -0800
Message-ID: <20240214205135.401454-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240214205135.401454-1-raj.khem@gmail.com>
References: <20240214205135.401454-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 20:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195497

Backport a relevant patch from mesa 24

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-18-remove-useless-passes-partially-.patch | 59 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-fix-ac-llvm-LLVM-18-remove-useless-passes-partially-.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-fix-ac-llvm-LLVM-18-remove-useless-passes-partially-.patch b/meta/recipes-graphics/mesa/files/0001-fix-ac-llvm-LLVM-18-remove-useless-passes-partially-.patch
new file mode 100644
index 00000000000..9acdb09fc64
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-fix-ac-llvm-LLVM-18-remove-useless-passes-partially-.patch
@@ -0,0 +1,59 @@
+From bc7e363f8e1a26342e6fd7241c1f0ebb722338d6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Kai=20Wasserb=C3=A4ch?= <kai@dev.carbon-project.org>
+Date: Wed, 22 Nov 2023 20:21:11 +0100
+Subject: [PATCH] fix: ac/llvm: LLVM 18: remove useless passes, partially removed upstream
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream removed llvm::createLoopSinkPass() in commit
+<https://github.com/llvm/llvm-project/commit/b9975cec0ea0a2f10d65b7bd1197d9e1706cbd3d>
+and there is no useful alternative except moving to the new pass
+manager.
+
+On top of that, the usage of this optimisation pass and
+PromoteMemoryToRegisterPass were just useless, according to the
+upstream developer of the commit named above. Therefore the easiest
+solution is, as him, Marek and Dave suggested, to just remove these two
+passes from the pipeline for now.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26336]
+
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/10192
+Reference: https://github.com/llvm/llvm-project/pull/72811
+Reference: https://github.com/llvm/llvm-project/commit/b9975cec0ea0a2f10d65b7bd1197d9e1706cbd3d
+Suggested-by: Dave Airlie <airlied@redhat.com>
+Suggested-by: Aiden Grossman <agrossman154@yahoo.com>
+Suggested-by: Marek Olšák <maraeo@gmail.com>
+Signed-off-by: Kai Wasserbäch <kai@dev.carbon-project.org>
+Reviewed-by: Marek Olšák <marek.olsak@amd.com>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26336>
+---
+ src/amd/llvm/ac_llvm_helper.cpp | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/src/amd/llvm/ac_llvm_helper.cpp b/src/amd/llvm/ac_llvm_helper.cpp
+index 40a4399e705..5d065279ad1 100644
+--- a/src/amd/llvm/ac_llvm_helper.cpp
++++ b/src/amd/llvm/ac_llvm_helper.cpp
+@@ -299,17 +299,12 @@ LLVMPassManagerRef ac_create_passmgr(LLVMTargetLibraryInfoRef target_library_inf
+     */
+    unwrap(passmgr)->add(createBarrierNoopPass());
+ 
+-   /* This pass eliminates all loads and stores on alloca'd pointers. */
+-   unwrap(passmgr)->add(createPromoteMemoryToRegisterPass());
+    #if LLVM_VERSION_MAJOR >= 16
+    unwrap(passmgr)->add(createSROAPass(true));
+    #else
+    unwrap(passmgr)->add(createSROAPass());
+    #endif
+    /* TODO: restore IPSCCP */
+-   if (LLVM_VERSION_MAJOR >= 16)
+-      unwrap(passmgr)->add(createLoopSinkPass());
+-   /* TODO: restore IPSCCP */
+    unwrap(passmgr)->add(createLICMPass());
+    unwrap(passmgr)->add(createCFGSimplificationPass());
+    /* This is recommended by the instruction combining pass. */
+-- 
+2.43.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index fabc52f0e7b..c48f2be31b7 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,6 +18,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
+           file://0001-fix-ac-llvm-LLVM-18-remove-useless-passes-partially-.patch \
 "
 
 SRC_URI[sha256sum] = "dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36"
-- 
2.43.1


