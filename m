Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560B4C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 21:03:18 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.1250.1737406993185176490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 13:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mzIh1jOL;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b6ed9ed5b9so90641585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 13:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737406992; x=1738011792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AuD/zOOaRBk4h52zOpQaVLMnlVtYNJhf8bF/HTLuM58=;
        b=mzIh1jOL1B2hpJPSeFW8GsXrwaGHmd221K/Li6AD9AfxZyKE4VOS77Jgn/NYur9+eC
         bTBcutEtLKTuBup2ftfCXnv3WmzDFY4B0JjXj+mk87UeC4MIiVd80oVo2nwU5hmI2H/q
         CVVRmtbLj23kfSzPK7WkyPlVZqBmwC4LhS2id88fwmRr1eTs8wV96WDYJc08K2/EUsqN
         OsoC1mSVo2xCm2weaL86SCwICtQSW1+XcH3nNGGu2AXEAghhXxRACCifmdfcmZUVbTjs
         La14wZpRacSDmW4lfyblqfV4X1jbwemsLZ6BjsZhBZHAF3qY935GOL4BWmWav1bAy0tK
         btJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737406992; x=1738011792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AuD/zOOaRBk4h52zOpQaVLMnlVtYNJhf8bF/HTLuM58=;
        b=qa/pTf+kmHAGLZ4c+8rG5LPkY63HuKUYNDqb0+Lh/RUs3bysfCs6A0ty7GmLZCBBKT
         eJ8UleQB4bZQkE/DPlTvB/iahS5qnp80Q9PEymxGDTC1Hg5bpt+sTOpG/Snx2SdI1p2n
         Ek6Nn1NKAPNCR4PMS5UPjQ4b+64kpVgzQVeyE7PVi/3UTwd4HJlu5evJQsa4HW5NYL4Y
         hdWOiktZnhiwtzkw3xbvX5Eo2M+8go29xSbClcbedD4JuOyuhLtguMb/XZcgNdeE3HaH
         kng+IQcKrHGHFLWNRuDisiRsMYJVvKda6IY6trTeXMHvGS6FGzX4JYdVc73ADGxKQM7l
         rZ2Q==
X-Gm-Message-State: AOJu0YzIL2rm4nO6uliwICr+Pl5W+Pf4LwpLUuAox7WpUTc+jLCySyfm
	NAp5TVvoj4Sf0+L3/VH8aou2qkQHbHf125dxUKCK1KsQS1D91NugWobeLzg0jknwe65qijTM5w6
	Nxiw=
X-Gm-Gg: ASbGncs0FrZrEav5oSxqHnZwGHCqV7y/rlzt7Kj0AATZdzLdT49E14TmwjtyQrEmM7B
	IWnIa7L16iH4wymTsFI0ElBOSNBbP3qUOp50AJGMyy+xm2ZnyYTliGpR0lOM4zFGCn1j0drs3iQ
	A5+dZk6EBvQ7BVi/Xpjow+SYwMcTSQc9/U5EYAWFnHHR1OsKBqv//V9uFvTlslES75vjbT5gA/w
	JzT5N42j689hhTikYx7EQVzfYlfWD8lJJIDZFxPO7BpY90O4nTW6H5sxi7u0QQRXoSM9S06EapU
	qyrIMPH9386Q+Wj07XoeY0+xbhxC8A==
X-Google-Smtp-Source: AGHT+IHMx/1p/avUnkw40k2h+u+/sxoZwzKcfeFOTjvJiePfPypeOe66gK4E1MbxaUCtozsVZBtgqA==
X-Received: by 2002:a05:620a:4722:b0:7b6:f1b8:8a03 with SMTP id af79cd13be357-7be6324fb67mr3150874785a.36.1737406991674;
        Mon, 20 Jan 2025 13:03:11 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be614758b6sm484825185a.13.2025.01.20.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 13:03:10 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] cmake: upgrade 3.31.3 -> 3.31.4
Date: Mon, 20 Jan 2025 16:03:07 -0500
Message-Id: <20250120210307.1876707-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 21:03:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210063

Release notes: https://cmake.org/cmake/help/latest/release/3.31.html#id17

commit log:

|tgamblin@megalith ~/workspace/git/cmake (master)$ git log --oneline v3.31.3..v3.31.4
|569b821a13 (tag: v3.31.4) CMake 3.31.4
|92b260387d Merge topic 'duplicate-source-behavior' into release-3.31
|3df8890638 Merge topic 'lfortran-generate-object-code' into release-3.31
|8f45140baf Merge topic 'revert-genex-tco-subgraph' into release-3.31
|3e15419bd4 target_sources: Restore toleration of duplicate CXX_MODULES sources
|5cfb8ae790 Tests/CXXModules: add a test with duplicate sources
|daf6cc89ee LFortran: Remove hard-coded --generate-object-code flag
|a6b84a438f GenEx: Revert "Limit TARGET_PROPERTY transitive closure optimization"
|627d710570 Merge topic 'FindBoost-1.87' into release-3.31
|d29855f985 Merge topic 'codegen-help' into release-3.31
|f485f94d1a FindBoost: Add support for Boost 1.87
|45726d93a8 Makefile: List codegen target in help
|e7153c29ac Merge topic 'Help-FindPython-Fix-typo' into release-3.31
|e7ea2998fb Help: FindPython: fix typo

Reproducibility OK:

|2025-01-20 13:52:30,296 - oe-selftest - INFO - Ran 1 test in 1949.827s
|2025-01-20 13:52:30,296 - oe-selftest - INFO - OK
|2025-01-20 13:52:34,885 - oe-selftest - INFO - RESULTS:
|2025-01-20 13:52:34,886 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1874.21s)
|2025-01-20 13:52:34,886 - oe-selftest - INFO - SUMMARY:
|2025-01-20 13:52:34,886 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1949.827s
|2025-01-20 13:52:34,886 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../cmake/{cmake-native_3.31.3.bb => cmake-native_3.31.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.3.bb => cmake_3.31.4.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.3.bb => cmake-native_3.31.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.3.bb => cmake_3.31.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 14cd9ffc5ee..f1410a2c4be 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87"
+SRC_URI[sha256sum] = "a6130bfe75f5ba5c73e672e34359f7c0a1931521957e8393a5c2922c8b0f7f25"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 68c1020a42f..cf00964a9c4 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From d6e3cb98ffa81c6234ad5a563354ef5f442e1bb3 Mon Sep 17 00:00:00 2001
+From 969b2d07ad955fdc117bf2ea30305a5b2e74ea76 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index fe3bf33c607..a01e3fe8c7f 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 3f9b36a52f12e8f8860cf4337acc9a9514a2095b Mon Sep 17 00:00:00 2001
+From 8faeaefaf00f8d443511077b82624a8bd19cf725 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index ea4c76f99f2..95ae9108aaa 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 7a4c1ed7b4dd038ef99c4a82e1d27743b2801757 Mon Sep 17 00:00:00 2001
+From c0ca5859788189a81c53face2ab5eaeadc1236b4 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.3.bb b/meta/recipes-devtools/cmake/cmake_3.31.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.4.bb
-- 
2.39.5


