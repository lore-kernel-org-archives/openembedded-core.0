Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14D05C02196
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 17:37:02 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.94312.1738604221091364441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 09:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShMus8Mf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so32689825e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 09:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738604218; x=1739209018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=r9BHn7JKMNLgUbbN3RtkwE3U/LOAsK8105UEgJiXkQw=;
        b=ShMus8MflAzOPyRiVN5LEVcBMKNognYyFUBLH2g66jgxzofieotZlDCG+5AY+XTe42
         DWgRfvcF6jnzNh6zVwLYY+NG8p3PWnbi5/yxfR20O8Th39Yw0GpA0JlkPn+sFZEoiTBZ
         BKQXuj3weYaJG9f3OXyS+3laIS2egfgHPCkvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738604218; x=1739209018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9BHn7JKMNLgUbbN3RtkwE3U/LOAsK8105UEgJiXkQw=;
        b=XNcLg4/TlYPxw8fLiimsjx7l2j5fKPk/rBgTM89Tg+dIgAhhRMC+qNfIiCq4Ijwy2G
         yKcpLXH+cqQefsBly4Dm63RlMm1/wJYFXExhTzuHjcyi5TBpT9joIJ/n+gYYbG36Him3
         2ja5vDULj20VbCkiEnaqE20c60DWLnJMuealVZPAsBrSdV5y7GggGGPEYwg3Sxj2hYrL
         ZUMBZ55XoFofAH0sBIcPrwiKQjMdN4HMpMdlrQwrrGabR25lWHYETjNHQiE6aw7wKmCx
         mFj8wbTVdT/3lNh0N5usmc9MP61ktmy0UPTQx6pU+i24rRBkhZwIwNfvetXp7asrzI9U
         210Q==
X-Gm-Message-State: AOJu0Yy2K7amYGyBZCY4PMIySGb+bi2QRdR++NnQoxjZBoZLZh0kYX6A
	YiG8aq1GD6qEEHDTynanfWAtDR4n1TDgxyimB+PYJWSHS1/xd7HYGPx6/9e+U4sTT8+CJIDTNhb
	y
X-Gm-Gg: ASbGnctHn2zYrE/d6cz6KCFOSXBQVDqWloCxOZtJ4fIrsbLRJakj23TMy6r3Jgc5ug/
	DgpNS/2Ni/7vjDrr05yyTpXUTaD3C8aOvoQxG/eiSIwcYeU/0mzmRCjFWN1PTkrPmxf98xNBqiA
	VVjrMIgEHbAKxEdx8sVw9I+WrWxTZIoISkjQ4Nqdx1Er3aWMbfxSggL5iFsIGv4hxi7F2XHMwsc
	WE7G8IMDQh+PK66qmtFhvOqMXA1KhXGtpZCp5kTsEyaDHwbQDb8FG8XccRERjBujCxzPotp89qw
	Kp0r+lxU3I6sqE/thmaY+5cEybMDlLKhBp8SuDSCaaUW
X-Google-Smtp-Source: AGHT+IEMD1IkY986UI9i7GePNni3DPiyg5aCRrsyYa7VxxubpqbYiSgtqL+5gGA3bOat14N/Jq3uhg==
X-Received: by 2002:a05:600c:1c97:b0:434:9c1b:b36a with SMTP id 5b1f17b1804b1-438dc3caac1mr190323705e9.13.1738604218442;
        Mon, 03 Feb 2025 09:36:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e244f403sm161056515e9.25.2025.02.03.09.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:36:57 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] llvm: upgrade 19.1.6 -> 19.1.7
Date: Mon,  3 Feb 2025 17:36:52 +0000
Message-ID: <20250203173656.3412275-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 17:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210721

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...tcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 9 ++++-----
 .../llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb}              | 2 +-
 3 files changed, 7 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.6.bb => llvm_19.1.7.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index a5c53b66574..f2447e07fd9 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 3b30a9bda88374e8f03bf96e972aee5bd214b98b Mon Sep 17 00:00:00 2001
+From 51d1ecbd5fc05aa801ded4ada9d9ff6426087aea Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 73724e662f9e..1ca9c73415db 100644
+index 5035ef527..03fc84203 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index add38b3bb4d..edd8824a388 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From 588a8694c6540e31140c7e242bfb5e279d6ca08c Mon Sep 17 00:00:00 2001
+From e10e7f1ef8816f99550cc124ea8c0c8c265cfc16 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
@@ -13,11 +13,11 @@ Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- llvm/tools/llvm-config/llvm-config.cpp | 25 +++++++++++++++++++------
- 1 file changed, 19 insertions(+), 6 deletions(-)
+ llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/llvm/tools/llvm-config/llvm-config.cpp b/llvm/tools/llvm-config/llvm-config.cpp
-index e86eb2b44b10..7b2abf318dbe 100644
+index d5b76b1bb..6c28c34bc 100644
 --- a/llvm/tools/llvm-config/llvm-config.cpp
 +++ b/llvm/tools/llvm-config/llvm-config.cpp
 @@ -246,6 +246,13 @@ Typical components:\n\
@@ -34,4 +34,3 @@ index e86eb2b44b10..7b2abf318dbe 100644
    // This just needs to be some symbol in the binary; C++ doesn't
    // allow taking the address of ::main however.
    void *P = (void *)(intptr_t)GetExecutablePath;
- 
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.6.bb b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.6.bb
rename to meta/recipes-devtools/llvm/llvm_19.1.7.bb
index 3efd6c40c30..029a1fb4c50 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_19.1.7.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "e3f79317adaa9196d2cfffe1c869d7c100b7540832bc44fe0d3f44a12861fa34"
+SRC_URI[sha256sum] = "82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 

