Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C934D58078
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 12:01:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.17202.1732536093874597001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Nov 2024 04:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWkCw+0H;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4349f160d62so8499905e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732536092; x=1733140892; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lappkrxn6GT08tOXZu79vRgV5HQplMstD3OEYEKZ8JE=;
        b=HWkCw+0H3SPv6livRPXhxKnNDroLXTlxvnPuOfBgeGyGX1SzeY7jmfCLdoEuujOmKo
         lk3XxCfCBCNF7tP3+cP3ZawI4e6Zw/5Cc3bQYDNysQTE0P+NBHg7o6IBABOJP/INCeEP
         wXOpDMbpbIF78didg7caYd531mmYHykewQbSPg4Oe6tV3YvBqHlgPZUlYMCiAa4GFhp/
         AfGe7+T6hXprtp8oIuiOMoQIGd8nqfIwGaI3sWssAkf74qChqDKTChhIkicWbufPMvEt
         6jlltTetE4dJPZkJWzVNihYwLBS3OLztd46NC45gH2fTNpTdKH01ZXHuFxh6LqEbcChS
         E/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536092; x=1733140892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lappkrxn6GT08tOXZu79vRgV5HQplMstD3OEYEKZ8JE=;
        b=hUQwJ2S0dcabfXcg1oy9NhPJ3QcFRhxUAGBjOLUUcYvueHCcUUbsYNi7uLf9zRUPHe
         cS8m0LJk9+/gsAZYEQZixwRxIaOHHPnpjZR8ovxl8j06pyL/jEO0opHZlkCULFJ0WZnE
         pdG6dhrAM3VV7lrkBc+gm2xaJd5bKrllEM+wjB29kU6by/oCyK4LLpIjtbkNUX9GSWyz
         HhslHQuCdl3rVJxJaYqaXwElZD+PL76wfaqmtRaJauNT5Dt1DDRIOPd/nwsDu8E+hshZ
         LRnvb5jjfvVNEqacUIXr492pvARu9RdtIFc2jSmx1zpCfBvyTSZp4uf3gngij93Odw+m
         Hccg==
X-Gm-Message-State: AOJu0YxcmCOCJtjIiBwkl+fDqjmKDGugjYeTuYtNMpvpM89Za/fvBSTE
	AJEuz/dg7zbY/X+vZJuLi2+DNecAd0DXvb3P10jb9ugt1SE2ZtW9yjTqXw==
X-Gm-Gg: ASbGncvWMZj4+RSFkGQvqT9tn7BH8oowvxy+bG4nR8PBcTVtTQzkySXxtZL3YIRXgqz
	nZ9U1uLJnnB03VeGFF/M1tbPRCOAYbKidID2bhFQ+OqtDUgoz6tDX5GDcgM3JdwnoPrUXZmz+iw
	9u/xYUnQ6+LElX4luqPjAB7NcBjwv9sqy5wRRozCVoFUVNQnpAU52P/jskSjLhvSVq6rpdbpUr2
	cw/t4FlOCLcJ8eDG2PisvZ1AGxBLlOa+eTLAZvpX7T+wgFV4L5/uvCeANFdFmTD5xSvY6DP3FaK
	I7/jChKKv34=
X-Google-Smtp-Source: AGHT+IE3/smhOW17An/J9fja28h7Ed2tZFYGUFjU61wiD2AJPANknFjgyYFtEvRVh3MM++vw5vZoWw==
X-Received: by 2002:a05:600c:1e8c:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-434a10f016amr15694725e9.9.1732536091958;
        Mon, 25 Nov 2024 04:01:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4349e80e51esm44881115e9.33.2024.11.25.04.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:01:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/35] cmake: upgrade 3.30.5 -> 3.31.0
Date: Mon, 25 Nov 2024 13:00:56 +0100
Message-Id: <20241125120127.2205232-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241125120127.2205232-1-alex.kanavin@gmail.com>
References: <20241125120127.2205232-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Nov 2024 12:01:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207751

From: Alexander Kanavin <alex@linutronix.de>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{cmake-native_3.30.5.bb => cmake-native_3.31.0.bb}      | 2 +-
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...akeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 4 ++--
 .../cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 ...sable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 6 +++---
 .../cmake/{cmake_3.30.5.bb => cmake_3.31.0.bb}              | 0
 6 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.30.5.bb => cmake-native_3.31.0.bb} (96%)
 rename meta/recipes-devtools/cmake/{cmake_3.30.5.bb => cmake_3.31.0.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.30.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake-native_3.30.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
index ddc41f289ea..e285a176816 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.30.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
@@ -13,7 +13,7 @@ LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
 LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmjsoncpp/LICENSE;md5=5d73c165a0f9e86a1342f32d19ec5926 \
     file://Utilities/cmlibarchive/COPYING;md5=d499814247adaee08d88080841cb5665 \
-    file://Utilities/cmexpat/COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9 \
+    file://Utilities/cmexpat/COPYING;md5=7b3b078238d0901d3b339289117cb7fb \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
     file://Utilities/cmcurl/COPYING;md5=eed2e5088e1ac619c9a1c747da291d75 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1f1d63cad6d..d32e2084ef0 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d"
+SRC_URI[sha256sum] = "300b71db6d69dcc1ab7c5aae61cbc1aa2778a3e00cbd918bc720203e311468c3"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 47373c194e0..57d5f081493 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 7fa115171a658d5358e15dcb40b233d049acae2f Mon Sep 17 00:00:00 2001
+From 29046e1308bec72cc21b0b00e979906f5a1fb63f Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
@@ -35,7 +35,7 @@ Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
  1 file changed, 8 insertions(+), 1 deletion(-)
 
 diff --git a/Modules/CMakeDetermineCompilerABI.cmake b/Modules/CMakeDetermineCompilerABI.cmake
-index 4a75e25a92..806f0b715d 100644
+index 4a75e25a..806f0b71 100644
 --- a/Modules/CMakeDetermineCompilerABI.cmake
 +++ b/Modules/CMakeDetermineCompilerABI.cmake
 @@ -52,14 +52,21 @@ function(CMAKE_DETERMINE_COMPILER_ABI lang src)
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 7dc07582da0..87efbd993df 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 5e624d82c2838fec2f41ebec124f74aacff9e61f Mon Sep 17 00:00:00 2001
+From 80655318696091d27d131e8c4a48140e37e73366 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index b766aee4..34ae7d2a 100644
+index ef6c269e..ecaac497 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -94,7 +94,7 @@ set(USE_ECH OFF)
+@@ -99,7 +99,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 8788cc7964e..9071d0f559a 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From b97f7dbb2637c6da772833c93bedc8be77520fb9 Mon Sep 17 00:00:00 2001
+From 2b8f6d4a5fddb5212ce07f0c61f5a3edbf5187d4 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index e47184b7..e4964c32 100644
+index feeaa3b7..c301fb25 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -721,12 +721,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.5.bb b/meta/recipes-devtools/cmake/cmake_3.31.0.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.0.bb
-- 
2.39.5


