Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F667C5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:20 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.14866.1709739730458715350
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SF5lVSIs;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a441d7c6125so220747666b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739729; x=1710344529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=df+RegnSztVklxvxOU2MkDPFPKDtBAaJAcdQb43nVhc=;
        b=SF5lVSIsReSPCDPuEsgNWIUr0r7BazCOLg6eq7KodUtlnN0/kG51Sd35EMHXwMGCoJ
         Tu7EjKC+d95XDy7SxzjdBnS3aaqqnTS8KBF6sD1yEDQiqxJc27vrjGRI87RUK2uVrIkl
         0mqlLetBSssaZLAls6H9xwxoTFbz5x94VFrhweYsgHbLLHZaYM1O4yB5wMCVPoSz1sHT
         /R+rXJ92UxbkSPdtCU2hnjUy3xs+VN1GuDs/KNE3nBw2rX9khpBYdG7ivsIVYLkwCY7B
         tw2EbQHgC/Ph9lz9dZtxUDMsSPJfJxnNw+tlJdHlv3MOnVn6cKORAcl+fYFwseD5pgkY
         b+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739729; x=1710344529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df+RegnSztVklxvxOU2MkDPFPKDtBAaJAcdQb43nVhc=;
        b=AnTtuJwJj8ZGB0lhrRDVckd4urL+7ym3AoOBP4NkNdatyq1vRl7KbGt8G22LK7Advh
         Naxj8OpJTMzJv8DZkc73qoJJM5X1TTBqXQvh5Aw1Xw4dbHWYzFcfo4sUEhN3297vqx4E
         VL93MqQ/KhDV9dlaTt812QeMQwJwZcQTHUp/1TEkin9KnB9A1x7DYejjXa9BC3H3mRgn
         r3RP10n70UdnnAXYMZV1W+FmKpdRhof1M0hhMCFuMqi7D6n/+wFVe+VIQZyPpr8o+YWJ
         uL0frxez9YbsiKWWgNPqupmT5SpuJJhopj1dOkPRH10NqYfzKLtKAzulsELPJDM+wfja
         c1Eg==
X-Gm-Message-State: AOJu0YypVc2SlnqIhK6G6jqeQeaVWlYgclOfi1hB3Ev9ONCo60eWJPho
	9PjAyOot62WKn8XDviBSLOWxGjRcEV0Gxjmrc/PJcadOyrv6Yc/2iLg07ebd
X-Google-Smtp-Source: AGHT+IGOLf3PEzbVHfnMEE6OuKrn7DorCVr9UgYpRm66XWSS6/4Xq+tDa5nqmn1P6rv3uZ8pTRvsXw==
X-Received: by 2002:a17:906:c00d:b0:a45:b75d:2e6d with SMTP id e13-20020a170906c00d00b00a45b75d2e6dmr1815052ejz.14.1709739728867;
        Wed, 06 Mar 2024 07:42:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/47] libdnf: update 0.72.0 -> 0.73.0
Date: Wed,  6 Mar 2024 16:41:20 +0100
Message-Id: <20240306154151.3741709-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196699

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ake-drop-the-requirement-for-GTKDOC_SCA.patch |  9 +++------
 ...s-for-both-libsolv-and-libsolvext-libdn.patch |  3 +--
 .../0001-drop-FindPythonInstDir.cmake.patch      |  5 +----
 ...ariables-with-pkg-config-cmake-s-own-mo.patch |  3 +--
 .../recipes-devtools/libdnf/libdnf/armarch.patch | 16 ++++++++++++----
 .../libdnf/libdnf/enable_test_data_dir_set.patch |  3 +--
 .../{libdnf_0.72.0.bb => libdnf_0.73.0.bb}       |  2 +-
 7 files changed, 20 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.72.0.bb => libdnf_0.73.0.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 791a32e7486..046e09eab21 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -1,7 +1,7 @@
-From 9bb7630915c3e787732463a3e2064fe0e177101b Mon Sep 17 00:00:00 2001
+From 5d6db56791d326e6b486dca54fe2335af0225229 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 24 Nov 2016 14:33:07 +0200
-Subject: [PATCH 1/4] FindGtkDoc.cmake: drop the requirement for
+Subject: [PATCH] FindGtkDoc.cmake: drop the requirement for
  GTKDOC_SCANGOBJ_WRAPPER
 
 For some reason cmake is not able to find it when building in openembedded,
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cmake/modules/FindGtkDoc.cmake b/cmake/modules/FindGtkDoc.cmake
-index 92b2cc7..39f34bd 100644
+index 92b2cc7e..39f34bd5 100644
 --- a/cmake/modules/FindGtkDoc.cmake
 +++ b/cmake/modules/FindGtkDoc.cmake
 @@ -52,7 +52,7 @@ find_program(GTKDOC_MKHTML_EXE gtkdoc-mkhtml PATH "${GLIB_PREFIX}/bin")
@@ -26,6 +26,3 @@ index 92b2cc7..39f34bd 100644
      VERSION_VAR GtkDoc_VERSION)
  
  # ::
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 08d08599539..223c1be2188 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -1,4 +1,4 @@
-From b87ae6860ea44996b677ad1c4a9793720b77c67c Mon Sep 17 00:00:00 2001
+From bf9bde4af952b67cc357d25b9863889099ea9665 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
@@ -7,7 +7,6 @@ Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
index d483dd410b3..27f76077d74 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
@@ -1,4 +1,4 @@
-From c0a465ccae395871ab10932975e37894220bc6a1 Mon Sep 17 00:00:00 2001
+From a6b3bc4fb3db996cd6c5616a99c16d085704dae0 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 1 Jun 2021 10:23:59 +0800
 Subject: [PATCH] drop FindPythonInstDir.cmake
@@ -37,6 +37,3 @@ index ed098ded..8b137891 100644
 -stdout.write(path)"
 -OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
 +
--- 
-2.18.1
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 32f2bb6ad0b..ecab47e5afa 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -1,4 +1,4 @@
-From 0b8eceb9161711003cd25ab400cadde7c1601733 Mon Sep 17 00:00:00 2001
+From e40def862bdeb10da295b15c5904fe2829d391c7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
@@ -7,7 +7,6 @@ Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
index 99eaf1d521f..63debdb58f5 100644
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
@@ -1,3 +1,8 @@
+From aa0f8b65feec64420a9b7b61cfcc8bcce161e14b Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Thu, 9 Nov 2023 10:29:31 +0000
+Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
+
 We change the way rpm architectures work, we make the machine name the default machine
 specific package architecture.
 
@@ -5,11 +10,14 @@ This arm mapping code can work or in the case of qemuarmv5, it doesn't as it cre
 armv5hl which doesn't exist and causes errrors. We can simply remove it, we don't need it.
 
 Upstream-Status: Inappropriate [Relies on OE rpm config]
+---
+ libdnf/hy-util.cpp | 23 -----------------------
+ 1 file changed, 23 deletions(-)
 
-Index: git/libdnf/hy-util.cpp
-===================================================================
---- git.orig/libdnf/hy-util.cpp
-+++ git/libdnf/hy-util.cpp
+diff --git a/libdnf/hy-util.cpp b/libdnf/hy-util.cpp
+index 9978c8e9..aa1369b6 100644
+--- a/libdnf/hy-util.cpp
++++ b/libdnf/hy-util.cpp
 @@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
      if (uname(&un) < 0)
          return DNF_ERROR_FAILED;
diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
index 8b1a5972001..e4f6d447f17 100644
--- a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -1,4 +1,4 @@
-From dc83a79053597546b2b42fcf578f3a7727b13f3b Mon Sep 17 00:00:00 2001
+From 25229773a9d4472235278bb45f75439e56630cee Mon Sep 17 00:00:00 2001
 From: Joe Slater <joe.slater@windriver.com>
 Date: Wed, 22 Jul 2020 13:31:11 -0700
 Subject: [PATCH] libdnf: allow reproducible binary builds
@@ -9,7 +9,6 @@ TESTDATADIR, since the default is guaranteed to be wrong for target builds.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
 ---
  CMakeLists.txt | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
index a8685a16048..dc2ddf94929 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.72.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.73.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://armarch.patch \
            "
 
-SRCREV = "908dba63c9e18c86a2d81166ce7523559e65338c"
+SRCREV = "1f30b3479528e8b62754f9047195c8e5a31f07ed"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.39.2


