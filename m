Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446A4C27C50
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:26 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.3634.1716833542783939761
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTiKcK2e;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a632ba6c9dbso6618666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833541; x=1717438341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyy/20VlhjQAHPch7T3ZW2u5kGPN3eq9c4IoFbDbie4=;
        b=RTiKcK2eeWEqd1wQ7uWSz1g3tf9iFZOBeeQDDv6xk8gc5YIJzuBgc6p0xEQVgFDkRm
         R4XVhpSWZgrODHIon0aKW5KerQyv3hUaIq1OStHo1xeo+ixKyxT2VCvdqipjJLJ/n8aN
         /FI47i/DxATXlAoXF6tNdyiG3CUGqrwzkGDzL3ebJ7i59YwuxZ91K8OyF8yXdttpnh+s
         uyXwoSYAOIJAFm1/gFT0hGseFgOyrj5MG42ahFArz+VGuE1zXVTKPQZYzQUYxM1QMGrC
         eF79b0SCQzG8jnR+wBDvSgb2wRL36CVsdmTYrjKaoDdW1qKDkjaQTxPwzWrOpUcrEZ8m
         nJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833541; x=1717438341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uyy/20VlhjQAHPch7T3ZW2u5kGPN3eq9c4IoFbDbie4=;
        b=OmH0m3htog8gnEfQ2rRdLsQgg7Il2aOIWPyX7a3SFcv51BgFoKk1BsK94nAXnOrogb
         PMqSWuvKQ9XbwWe8NAuw4OfxLIKrrYBuXcP1z/yXu61rTj3nHrogwD2IUCcPGYQgiKoB
         tHeTWf80amjQaThiOaz6hr7k94n9vMfUKfPLfD/k7pZxRw1GFNPSSWSXQgWVlQkeiT1t
         56GtGKNq1IGW6D2D1x+tRGl5li526htixVTfGwBhgxyeKYronAzdIF+CU0b1XBf6NEBZ
         ZwAbDo6wlOVLK3bZjXvRXsaMWDHO9cbU8lXU9c2y/zP9PGEExGSElQ0yP/DbYccEdCFR
         1qgA==
X-Gm-Message-State: AOJu0YxlsP2Pd/WGwj/E4cd6mroK5WJEi3AsSWt95Y6OcQ2cEomv0mr9
	puSI3uW4dBTTOTou5M72ehxwPBZyhl0vh7khLPDWzbXj4ywczrn2obUgPg==
X-Google-Smtp-Source: AGHT+IHL3yfXeAog62HqsF1YBYXOG9z6r8OSp3Lrwu/tvrNNWJJJuAD/ZZ9H46mSZUULC29KVMDKTg==
X-Received: by 2002:a17:906:19cc:b0:a5e:cdd:7783 with SMTP id a640c23a62f3a-a62643e3520mr674076466b.39.1716833541076;
        Mon, 27 May 2024 11:12:21 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:20 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 05/13] cmake: upgrade 3.28.3 -> 3.29.3
Date: Mon, 27 May 2024 20:12:06 +0200
Message-Id: <20240527181214.1778037-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199922

From: Alexander Kanavin <alex@linutronix.de>

License-update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{cmake-native_3.28.3.bb => cmake-native_3.29.3.bb}   | 0
 meta/recipes-devtools/cmake/cmake.inc                    | 4 ++--
 .../cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch  | 9 +++------
 ...le-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 9 ++++-----
 .../cmake/{cmake_3.28.3.bb => cmake_3.29.3.bb}           | 0
 5 files changed, 9 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.28.3.bb => cmake-native_3.29.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.28.3.bb => cmake_3.29.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.29.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ab9f459c05c..1155c1bbe0a 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=9d3d12c5f3b4c1f83650adcc65b59c06 \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=718f05155941b33862726348d3cd46ce \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
+SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index b2933d88be9..b7ec3e7bacb 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From d33d8a5e9f3b25a80d47b72b1a8a6624a85563c1 Mon Sep 17 00:00:00 2001
+From 946011cbfd686fe6bd2cec94494f6b0c4394bb6c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -18,10 +18,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 9387247366..d3de01f4e8 100644
+index 3dd24f1e..4a0f6773 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -88,7 +88,7 @@ set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
+@@ -91,7 +91,7 @@ set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
  set(PICKY_COMPILER OFF CACHE INTERNAL "Enable picky compiler options")
  set(SHARE_LIB_OBJECT OFF)
  set(USE_LIBIDN2 ON)
@@ -30,6 +30,3 @@ index 9387247366..d3de01f4e8 100644
  set(USE_NGTCP2 OFF)
  set(USE_QUICHE OFF)
  set(USE_WIN32_IDN OFF)
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index d6f7308fe0c..af164084d03 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From fd9a04c1434e12f21c043385e306e0b52d38d749 Mon Sep 17 00:00:00 2001
+From 2d3f6933f78d393514a48f8222ac8c3c39cb5fc7 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -13,16 +13,15 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
 ---
  Utilities/cmlibarchive/CMakeLists.txt | 8 ++------
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index bfcaf30..2960683 100644
+index e47184b7..e4964c32 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -682,12 +682,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -721,12 +721,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
@@ -35,5 +34,5 @@ index bfcaf30..2960683 100644
 +SET(HAVE_EXT2FS_EXT2_FS_H 0)
 +SET(HAVE_WORKING_EXT2_IOC_GETFLAGS 0)
  LA_CHECK_INCLUDE_FILE("fcntl.h" HAVE_FCNTL_H)
+ LA_CHECK_INCLUDE_FILE("fnmatch.h" HAVE_FNMATCH_H)
  LA_CHECK_INCLUDE_FILE("grp.h" HAVE_GRP_H)
- LA_CHECK_INCLUDE_FILE("io.h" HAVE_IO_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.29.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.28.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.29.3.bb
-- 
2.39.2


