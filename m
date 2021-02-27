Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.1506.1614411696669487749
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 23:41:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AXYyCwSG;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id f8so6524030plg.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 23:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w61QzY96e45WH+/zSiFgv3oje+y+rQz8GF0KLLWapmE=;
        b=AXYyCwSGCFAgvqjmpjsjWVjSHS6voiKB+WxqOLUdUnuIAzbw3xQ5Ab3D0HHa/aEIhv
         5wxEM3dbiCQ99quQKxh6McLVQZKIWQWgpIHulDpU/6l3lgxFris1SgUofHU9HHoDpK2y
         uJacfUGAFakNF+8lQBNGOeT4jpNmZnEK7DqBZiXzRhvL/h8qy2rSVYnNiiCLomqLwAI9
         738a054MyIi9iI7bXjVRXxGHjYi1krXfy/EQVXLOpQ/9Xxe2MC/izLfLZS30hphczSaK
         Z16LgFUUJwDm80mLUnBGGDdHNOyJt06SSTx++jnSEjiUtWl02dm7p5t/ZLk7YbBPAvuh
         XHPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w61QzY96e45WH+/zSiFgv3oje+y+rQz8GF0KLLWapmE=;
        b=m7LlkzKHkX5bdYpa8/e4Cetw7d9WjT9aMSWp5K56owadQDW8Boapb6JjkmaxpOpz9m
         WaW+v95PCikrJI01/xjCJ3j2B9OY+6KBieRJf+j0J3m8eB2xu2JncUDu5dTCWVZf6MHn
         vUEanSN5H/F4G6+3X9NrnzpCHF4y0HRaDX0WnjSY1iNKa5cEieDfNfWTREmzQ+BOS3K5
         mQ5o1fr0QFjJ4mmX6z5+/hcKb9eog+X25iDLylBTd1OrSOLkuS5AbFzlRnU0dTPfq1XM
         7lEmGi+J07mLOqgAoOpvLBLkn0cvdGiSt8ljfuoA4UXncnHbGNAb8Wjdh82wHqzEfxEZ
         Gfqw==
X-Gm-Message-State: AOAM532nlU0R0cOL9du8yiAjSL+t7UYEiB5n22cKeFdaeqP5fj7qLGuj
	Ni8W4UM2IiE7EMVcfyFFRC0NH4rpgWwSJQ==
X-Google-Smtp-Source: ABdhPJymhb+hfhW2UtHNUbqlrWQe3sniFwkxJzBwRAbn3qEf+A3PuKEPoPDuc+TnDk1ZncxyPVREew==
X-Received: by 2002:a17:902:e80e:b029:e3:cc4a:549c with SMTP id u14-20020a170902e80eb02900e3cc4a549cmr6550382plg.82.1614411695879;
        Fri, 26 Feb 2021 23:41:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id z137sm12462003pfc.172.2021.02.26.23.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 23:41:35 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] llvm: Fix build with c++17
Date: Fri, 26 Feb 2021 23:41:30 -0800
Message-Id: <20210227074132.4029374-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210227074132.4029374-1-raj.khem@gmail.com>
References: <20210227074132.4029374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes
/benchmark_register.h:17:30: error: 'numeric_limits' is not a member of 'std'
|   static const T kmax = std::numeric_limits<T>::max();
|                              ^~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../llvm/0001-nfc-Fix-missing-include.patch   | 26 +++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb        |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch b/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch
new file mode 100644
index 0000000000..f6dee77ab2
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0001-nfc-Fix-missing-include.patch
@@ -0,0 +1,26 @@
+From 3b7e611bd58ba842470d17374c550e14bceca5c7 Mon Sep 17 00:00:00 2001
+From: serge-sans-paille <sguelton@redhat.com>
+Date: Tue, 10 Nov 2020 14:55:25 +0100
+Subject: [PATCH] [nfc] Fix missing include
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/b498303066a63a203d24f739b2d2e0e56dca70d1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ llvm/utils/benchmark/src/benchmark_register.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/llvm/utils/benchmark/src/benchmark_register.h b/llvm/utils/benchmark/src/benchmark_register.h
+index 0705e219f2fa..4caa5ad4da07 100644
+--- a/llvm/utils/benchmark/src/benchmark_register.h
++++ b/llvm/utils/benchmark/src/benchmark_register.h
+@@ -1,6 +1,7 @@
+ #ifndef BENCHMARK_REGISTER_H
+ #define BENCHMARK_REGISTER_H
+ 
++#include <limits>
+ #include <vector>
+ 
+ #include "check.h"
+-- 
+2.30.1
+
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 86def0878c..db6694339c 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://0001-nfc-Fix-missing-include.patch;striplevel=2 \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
-- 
2.30.1

