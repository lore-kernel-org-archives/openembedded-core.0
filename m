Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC6AC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 20:46:34 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.37654.1742157989773381823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 13:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BfZ4pVcD;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-226185948ffso2924705ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 13:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742157989; x=1742762789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1tr7eQN91lkE1hk/6JoTjpHFbgUi157ZyrGgUUa9WiE=;
        b=BfZ4pVcDTNP6/X7wUaTXQRny/WF8xKrQHH6f1uBtuFN+Q3zYC9r3pxgzxK63gYsVS+
         TG/iNrjAImSH4RWfCLoE6AyF5MBO2WB+OtdBJDcpSLcF/XwROn2PO5G3G3w3xsEUXjvd
         b7W7v7OQ2Z5EgA5M5B+PSNURy8uGbWyLE91vZRDyri65A7pGXKPF7dGJhswsGk2pW4qc
         5cHRVADKR10hGQhAQNrFaXMwagZn9PntC28oAAo6lGsTdIn7bNjlVjXqQXZ3+b6U4xvO
         WLPqGjQ1/cp3WBenNke4AAbFV++BQLiYZmy3RerT0w5EsJFNwAX2DdWeOH/Wa8RsbNhd
         4KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742157989; x=1742762789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tr7eQN91lkE1hk/6JoTjpHFbgUi157ZyrGgUUa9WiE=;
        b=mJ5VjEBRxB9Tipcgll1DMsqwzGJIQm4IjROoaVi//2yAfgAFrJ7H572jKUP8iGWnXt
         RjKL2PUwS7wiGKjxMJlD7odgb4TPkHCxhrybFSmYejH20+thgKeNZhnICeZ11/0xA9J6
         FWUcPue69yAhT9410Mfk27KNuCnVC2ZDoE0kORLtBZPLCT6GA00bKP1UOi5QBuvnjndX
         psUptGkMUgE0eg+ppBBPEEuYGOQ4zTomcD9Au0tz24E88yIu1IuubkkkutzjjtlSzGFu
         HLQIlyAThUkfE85eAUI4JUg3SsPXGpDZ9FDWE9rfVCjf3mJbCBsUSNWtBkn3slkklD8f
         CCjQ==
X-Gm-Message-State: AOJu0YxwzaIuM+kkMex0nzB3kWQBPMGwlxHQj1scXzPY+s6b3hCYoSPv
	pwO8aUvoV1+UNbjmcsOikPSvMbBEngmPxs1s7d8IQqr6B2zXEkAQFJmg9Knn
X-Gm-Gg: ASbGncv1Ca+f6aPiaoD3losaf+s2faNlbr7C+jd0MCnUK2kt/FhZUSUoWhQS+VUKW8d
	6I9jplAIOMQS6JcKXPXLH8+h88u/x7wYxcDqxnEDJ3QQghRdNW1kba51v1T4FhhHgJXa0Tu6Ywn
	7+/amvHsANg025EbOOnSmjW/TdV0p1yrceS5puqcCoyhvTp+j8Begd7YXTAjBcjZRwfeRvHSsW3
	aFrb6uFd9JKVUEDYvKBlC/MceLOjIp9AzikdyymtUw5ZsVxf4o8KKcnKlh+aYRxtdsHwoG6p6XU
	UgK8xRL6R1T9VJ0esdvOq3QkpQMo4NLA4svF
X-Google-Smtp-Source: AGHT+IHM9DzlFfSFQ5obrNPBJcBGSFuf7IAiYvKuqDCw2myjDoEgjwlNg49YvLw6VgsCuLnQIvHNBQ==
X-Received: by 2002:a05:6a00:1413:b0:736:d6da:8f9e with SMTP id d2e1a72fcca58-7372225268amr14074249b3a.0.1742157988690;
        Sun, 16 Mar 2025 13:46:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7371167df03sm6364127b3a.106.2025.03.16.13.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 13:46:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] llvm: upgrade 19.1.7 -> 20.1.0
Date: Sun, 16 Mar 2025 13:46:25 -0700
Message-ID: <20250316204625.1588247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 20:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213059

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch | 4 ++--
 .../llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch  | 2 +-
 meta/recipes-devtools/llvm/{llvm_19.1.7.bb => llvm_20.1.0.bb} | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/llvm/{llvm_19.1.7.bb => llvm_20.1.0.bb} (98%)

diff --git a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
index f2447e07fd9..ae2c3baa8ce 100644
--- a/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
+++ b/meta/recipes-devtools/llvm/llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
@@ -1,4 +1,4 @@
-From 51d1ecbd5fc05aa801ded4ada9d9ff6426087aea Mon Sep 17 00:00:00 2001
+From 9824c2ab5e7d37a5a18a409a512511f5f5cd408d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 27 Nov 2020 10:11:08 +0000
 Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-index 5035ef527..03fc84203 100644
+index 7684387d8..d225a3b6d 100644
 --- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 +++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
 @@ -361,7 +361,10 @@ public:
diff --git a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
index edd8824a388..29266013ecb 100644
--- a/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
+++ b/meta/recipes-devtools/llvm/llvm/0007-llvm-allow-env-override-of-exe-path.patch
@@ -1,4 +1,4 @@
-From e10e7f1ef8816f99550cc124ea8c0c8c265cfc16 Mon Sep 17 00:00:00 2001
+From 00e5ac68dad872b8490297fa6f0b67e6a3e48661 Mon Sep 17 00:00:00 2001
 From: Martin Kelly <mkelly@xevo.com>
 Date: Fri, 19 May 2017 00:22:57 -0700
 Subject: [PATCH] llvm: allow env override of exe and libdir path
diff --git a/meta/recipes-devtools/llvm/llvm_19.1.7.bb b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
similarity index 98%
rename from meta/recipes-devtools/llvm/llvm_19.1.7.bb
rename to meta/recipes-devtools/llvm/llvm_20.1.0.bb
index 8e861939e07..47d1e28b9d7 100644
--- a/meta/recipes-devtools/llvm/llvm_19.1.7.bb
+++ b/meta/recipes-devtools/llvm/llvm_20.1.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/llvm/llvm-project/releases/download/llvmorg-${PV}/
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
            file://llvm-config \
            "
-SRC_URI[sha256sum] = "82401fea7b79d0078043f7598b835284d6650a75b93e64b6f761ea7b63097501"
+SRC_URI[sha256sum] = "4579051e3c255fb4bb795d54324f5a7f3ef79bd9181e44293d7ee9a7f62aad9a"
 UPSTREAM_CHECK_URI = "https://github.com/llvm/llvm-project"
 UPSTREAM_CHECK_REGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
 
@@ -180,3 +180,5 @@ FILES:${PN}-staticdev += "\
 INSANE_SKIP:${PN}-libllvm += "dev-so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PV = "20.1.0"

