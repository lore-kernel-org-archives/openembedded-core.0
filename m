Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757C5CD13D1
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 09:39:26 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.27144.1694943557627263446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 02:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TO+qLwTs;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50305abe5f0so1270325e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694943556; x=1695548356; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSZE1XxhvEgq1lTIO/4VX2KPjNk95IY9gNkJfwz8Uqo=;
        b=TO+qLwTsJqgYTFKIoARmPZbPMiJnaYAaiyo54Q9ZQf8YA0JTznQLBBgDIusCD3AIaf
         rSmHEjM2AGu3FQ1q0wvRPgcMUJ0EPQID45871ABZjo5ff7K+uplB8OUiuZvfb0NKIyS/
         4MyFuLt3Cj2UuQe3CscI/Jn6LdUym59zJA7GmZz2dvCaIYRBqZlIz5CQrobACm/UeMNd
         hocoDy+N4oOxMIYSChj+g3hINBnxLd2SKQxqaSRZSk6xMl7vPpqt9fWIgN5wUpFIEqoX
         KqIQ3UauihGOoMqmrIJz9kRFGlaMsuKKXhVmTSR1EPUMYE0TA3/9JrqRWn/Ils++Z/n+
         ujuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694943556; x=1695548356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSZE1XxhvEgq1lTIO/4VX2KPjNk95IY9gNkJfwz8Uqo=;
        b=ss+dJ62R4qc42958QpKo8/eIfOwpbYJ89h7/JH0Ih533j+Aij/byZLmBPBYto8AvuI
         eI7K1x8yN0/yQGAG6BIBcGSPbunLsJPHbobtsVqTcyarEN5+U45EU4hMPX3HtbnqKB4Q
         L8S5AEq6fJ05V6yF3wNqo4yKknvbThwzauv+CH8Ow+zEPzL5fnR9qHb3sYl+xYok27jz
         Kw8k/pG9c2swkz6iJdXcVyFejibeDxk2DY1W5S0SjYcZXSRdWYwG0J7+5YZGjyRkqxOi
         tBLNqgrtIiueBzeKZrSLzvf4zXNS6WmyUXGYIi93BW6djzasOm4Xfrdr3OLKJ/Mr0l0J
         QQTA==
X-Gm-Message-State: AOJu0Yxu8R5Nhu1bT7iXc+KNUT6zgsc8/shWUIyzYT4LPE0r3S1hQv3p
	hcoN5COwLKKDBta2SurgxNG59xZcLCk=
X-Google-Smtp-Source: AGHT+IGrjawgfZe+DvyYE2oumM2U7zFNwEIu6VeplvdKB41dtqUoWfIpPrRTaai8bLTXVDDfcyvSYw==
X-Received: by 2002:a19:6756:0:b0:502:ff3b:7671 with SMTP id e22-20020a196756000000b00502ff3b7671mr2942713lfj.9.1694943555743;
        Sun, 17 Sep 2023 02:39:15 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d8-20020a17090694c800b0099ce188be7fsm4779683ejy.3.2023.09.17.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 02:39:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/29] libdnf: update 0.70.1 -> 0.71.0
Date: Sun, 17 Sep 2023 11:38:50 +0200
Message-Id: <20230917093901.428214-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230917093901.428214-1-alex@linutronix.de>
References: <20230917093901.428214-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187791

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ers-for-both-libsolv-and-libsolvext-libdn.patch | 10 +++++-----
 ...-variables-with-pkg-config-cmake-s-own-mo.patch |  8 ++++----
 .../libdnf/libdnf/enable_test_data_dir_set.patch   | 14 +++++++++++---
 .../libdnf/{libdnf_0.70.1.bb => libdnf_0.71.0.bb}  |  2 +-
 4 files changed, 21 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.70.1.bb => libdnf_0.71.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index c7b2af89d18..08d08599539 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From 9294cd19e5e3121fb8d37b44ee82dd7c4b3ab2c7 Mon Sep 17 00:00:00 2001
+From b87ae6860ea44996b677ad1c4a9793720b77c67c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -13,15 +13,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b722d4fb..ce88b9e3 100644
+index e99b28d0..548a9137 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -52,7 +52,7 @@ endif()
+@@ -51,7 +51,7 @@ endif()
+ 
  
  # build dependencies
- find_package(Gpgme REQUIRED)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
  set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
-
+ 
  
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 643a5f37b6a..32f2bb6ad0b 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From fbb181d25ad85778add7ed45b6aaf114e02d0f79 Mon Sep 17 00:00:00 2001
+From 0b8eceb9161711003cd25ab400cadde7c1601733 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -13,13 +13,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 405dc4e8..53837448 100644
+index 6444c374..e99b28d0 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -52,7 +52,8 @@ endif()
+@@ -51,7 +51,8 @@ endif()
+ 
  
  # build dependencies
- find_package(Gpgme REQUIRED)
 -find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index e3784cc9e47..8b1a5972001 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,7 @@
-libdnf: allow reproducible binary builds
+From dc83a79053597546b2b42fcf578f3a7727b13f3b Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Wed, 22 Jul 2020 13:31:11 -0700
+Subject: [PATCH] libdnf: allow reproducible binary builds
 
 Use a dummy directory for test data if not built WITH_TESTS.  Allow for overriding
 TESTDATADIR, since the default is guaranteed to be wrong for target builds.
@@ -7,11 +10,16 @@ Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
+---
+ CMakeLists.txt | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
 
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 548a9137..c378e7d9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -133,7 +133,12 @@ add_definitions(-DG_LOG_DOMAIN=\\"libdnf
- add_definitions(-D_FILE_OFFSET_BITS=64)
+@@ -132,7 +132,12 @@ add_definitions(-DGETTEXT_DOMAIN=\\"libdnf\\")
+ add_definitions(-DG_LOG_DOMAIN=\\"libdnf\\")
  
  # tests
 -add_definitions(-DTESTDATADIR=\\"${CMAKE_SOURCE_DIR}/data/tests\\")
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
index c44ae2729b0..396a6664bca 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.71.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "3b8e59ad8ed3a3eb736d8a2e16b4fc04313d1f12"
+SRCREV = "39098f39806becdc87cf93e03a49ae89a33e7ede"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.30.2


