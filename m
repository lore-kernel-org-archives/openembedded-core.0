Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04524E69174
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:07:55 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87656.1766434073157208867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nNGICMzU;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b7697e8b01aso820289366b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434071; x=1767038871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nq2a2TSaf3AG3Kodo79/Vwq/3f2NGZIImmkyoh6kCE4=;
        b=nNGICMzUCCU1bLmHWjHacWhc/izm/tAIDcnLL1rGyhdmh9hXrb+SomiAWK90EtThMi
         kiLyMGLhldp2a0Wc05H6KqGrgQQPQ0kqNLz4o8bweZct4dZU8DWhmzWMKGRWJpGnKIy1
         j7H3hZmUFJ8c6VEbOSzI06r5Tm4wiqa4/P5HnO4r3ZDIiUqfDNjm/JJhe0aI3em87czN
         gG/4ooxeq8M7abZogLecz6PRFn+y2+V5sklSQoavGiI1jQHNdAmuJXkAqKJBGAcXQmPg
         GONIPi6wwY4VWI5VRz9lhv83IfYBJtmZyNCBaIv56/S+/E1QTQAbgzOyfvUHrIM10YXP
         grsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434071; x=1767038871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nq2a2TSaf3AG3Kodo79/Vwq/3f2NGZIImmkyoh6kCE4=;
        b=SeXaMaNA68uBpGt7IHRLFoAtO/vwVdjns0/CuFr1qgk6Doiyn6S0yYkLmrBeJsEkub
         AmvBS7YybcCl+kaCXq0nJ4OIu5SEv5kYS45R6psRWTJ8oqayJBrjFtPE4X43XnqHBI2O
         5lrONE0dYgkzcT9atG2AYYGAj1mgdd57/5jfGoGUNtK0oeK5TwmZgUSJ3Xya6R+qbhKF
         dR+l6y51CB9vZV+qICjLJPGbry2uDSkBr5GUtptnbVRxqEPxh/Qr4ViDtopZpnQk/Myw
         7X7nkWde9tTqatGJReKwYTN0v2ztBA4A6CLlrIUj9BibbFeXyCbdHAAYOnMq1eQyCTyg
         3i5g==
X-Gm-Message-State: AOJu0YwNG1E7HFAGxhtM4iprjCXiK3mxwQX/RQi/BQc/Wp7s+VvT7AYN
	g24vAWP/JdiKqLkHzBaklCS0VRfn4DYqkYoHrrJo4LAhzKpHlhCfYbgiTPmpEg==
X-Gm-Gg: AY/fxX7a722ioFOMq8T9guI6s79aRgDX9JOSmMXABrMXL2N8bjUiPviQlZCONIMWGzW
	KnyX7Nd12BVx2cnq/6BeF+c0rTsdhFp428ldu5IgfnqKp7Hr0kloLLPTUOSAgDFxtm+P0UrJo1I
	rRZcqOCKiCrK2Eh6uIvQFEmSPdUFLxpTvww++AjQBvsw9/LxwJmjarpwall7Tx2AC5RZpRrlTEE
	q5Fdz6rIGT5EyQVvb0p8GQNGeYIrx4BpPF+dTbRvYJykquptStxvSj2Mp1ymGWTrTXxh/KHRd5n
	CE4+CxDcDtIszZFrYZAnmsxpDJ73xbtSN/5RoqzibRHsjEi9Q+0/5Nv84+R1SqvEoK/UM0cPzGh
	/04TWUqHBelUJSD4v/yf3no43IcJTNIg06wSUfv1OCYCK7sdkVUtClSQAYc1OaiHtBE+G5yXzLf
	fUfLrvcF2gZqsggdz2BaHjufvgFpUptvThkXNtnfDtGWpfq7c=
X-Google-Smtp-Source: AGHT+IHh2ALQBmyjcNvelmJE5rcG1Kyzwbcx2/9WVywfoy573riLd0WOylcHMPlrMCJ+78or1OGvlw==
X-Received: by 2002:a17:907:6eac:b0:b80:333e:faf6 with SMTP id a640c23a62f3a-b8036f0d7b7mr1343971866b.14.1766434071413;
        Mon, 22 Dec 2025 12:07:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:07:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 009/114] cmake: upgrade 4.2.0 -> 4.2.1
Date: Mon, 22 Dec 2025 21:05:51 +0100
Message-ID: <20251222200739.2278706-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228334

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                       | 2 +-
 ...isable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch | 6 +++---
 .../cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch     | 6 +++---
 .../cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb}                | 0
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.0.bb => cmake-native_4.2.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.0.bb => cmake_4.2.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.0.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 0dcc5c3f55..d120638b1b 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "4104e94657d247c811cb29985405a360b78130b5d51e7f6daceb2447830bd579"
+SRC_URI[sha256sum] = "414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
index f31dce5644..0d2de28d5b 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal.patch
@@ -1,4 +1,4 @@
-From cf8210696ebbaff14612d845bc98fac447c0e6f5 Mon Sep 17 00:00:00 2001
+From 3d87f9fd1071e548cf9a6718c4ade0bfde812c30 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index 04d986b6ea7d8dc0bd7e909d4e7b4e73c9e35437..014fe78063f7d30c9a4970b7cf3aeeaeb36bcdbc 100644
+index 9957052d..71a7aeb5 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
-@@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
+@@ -734,12 +734,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
  LA_CHECK_INCLUDE_FILE("direct.h" HAVE_DIRECT_H)
  LA_CHECK_INCLUDE_FILE("dlfcn.h" HAVE_DLFCN_H)
  LA_CHECK_INCLUDE_FILE("errno.h" HAVE_ERRNO_H)
diff --git a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 158eea2c3e..f6b6cfcf41 100644
--- a/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0002-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From e0a1996a85dcb43d69d3c7daecab4da74599e5ba Mon Sep 17 00:00:00 2001
+From d4696e9d78d09366c13ba738e01f833f234b160a Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,10 +22,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 75b510205984894ffa11461e7aa04d3c479709b4..83463042d82d9c7f17932753f47c47b12aeec85b 100644
+index 63d3a4f5..ab5f1c50 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -105,7 +105,7 @@ set(USE_ECH OFF)
+@@ -109,7 +109,7 @@ set(USE_ECH OFF)
  set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
  set(USE_LIBRTMP OFF)
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.0.bb b/meta/recipes-devtools/cmake/cmake_4.2.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.0.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.1.bb
-- 
2.47.3


