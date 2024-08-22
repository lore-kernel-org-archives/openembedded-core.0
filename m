Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E03C54733
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:35:41 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.9502.1724319331031708976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jggg/BYl;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5bed0a2ae0fso813452a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 02:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724319329; x=1724924129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiuDPN3PzKaBjjf89aDIEzPrSHpWa4qnXa8WyJDbmag=;
        b=jggg/BYllgaRlL5kxlimDcQ9HYOHWIh/H3OZDiTewfkFlV8XL8QjoD+hXIWU1MQ7t+
         2xi1y9q7f2sgrkwOV2oNIkhXb3bfIc/llFeKejDMiK3zx6ovUidhCCQ9Dr18xWJ7xr7H
         /qVZ8pkKmJLxXNb7wvmnQ/vdpydeV7ZNUZsjpLWDb9wkYLGx7XnHmDkdh0Qja5nybde3
         4YlyDwFeVkU3MklkKgRD0NZ2tphp2OH9rfwVlktiGQ/218Sh/KfgnrpEMWiw22eSUYfj
         0LiQFz8bpqB4bKpX+9z5o6SnO+LfWN9xz5ViBO4fat6eZe4/et3Gz7tvf62+YyVtjIfg
         KBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724319329; x=1724924129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiuDPN3PzKaBjjf89aDIEzPrSHpWa4qnXa8WyJDbmag=;
        b=JXGOypL1wA5fjFolrh2xbPgDt9Q6tgS5zUJckLeJo0gJDdfjxyS7i7L8N5+CVscnSL
         7O5KSQrAnQsiVlN1YPfmf1rKYslJRg1+jPh/K+zoHzOqhZwpDrm+HTJkQpWBaDGv2rsD
         illDdTPi2hUB+tBEuddR115VHB3gNPA0TMuAu2bQqa1f8tMDHslNieT3x0H+uMd8p8RR
         gmAsRW69UZFewQAfta9ypajIW09mkuFcbwfHdWJr6DayGROgyR+6pEQ23l54ArCGt6s0
         ZudEjRf+MHdew2CiH/w+YoFjGHdjjJvP/M8+k6MHrKhhRp9eMm4bbbcJLNWNvAvtJBC9
         44fg==
X-Gm-Message-State: AOJu0YxLYo872blyx8kn12QXWEAUbx+lTFklYNF7hr6zDiTIwiXUFkJ7
	0N+Mccj1zpwjY7CZbjSbS0kiex4NarDnULTZpHo7JvglxwhTFtrciPSA/w==
X-Google-Smtp-Source: AGHT+IF0zDNolbSaLEz2CTj8at5QfgTkO5QzuVU9/+ulUkgxFxvyosiZVWnGdmFQuYJR2tw2ai02Yw==
X-Received: by 2002:a05:6402:320b:b0:5a3:5218:5d80 with SMTP id 4fb4d7f45d1cf-5bf1f15b1fbmr3462690a12.21.1724319328939;
        Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c044ddbce5sm698502a12.4.2024.08.22.02.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:35:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/32] cmake: upgrade 3.30.1 -> 3.30.2
Date: Thu, 22 Aug 2024 11:34:55 +0200
Message-Id: <20240822093521.36790-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822093521.36790-1-alex.kanavin@gmail.com>
References: <20240822093521.36790-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203621

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{cmake-native_3.30.1.bb => cmake-native_3.30.2.bb}     | 0
 meta/recipes-devtools/cmake/cmake.inc                      | 2 +-
 .../cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch    | 7 ++-----
 ...able-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../cmake/{cmake_3.30.1.bb => cmake_3.30.2.bb}             | 0
 5 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.30.1.bb => cmake-native_3.30.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.30.1.bb => cmake_3.30.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.30.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.30.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.30.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 604a22a2f0a..b88a4e4bc6f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "df9b3c53e3ce84c3c1b7c253e5ceff7d8d1f084ff0673d048f260e04ccb346e1"
+SRC_URI[sha256sum] = "46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 090f441f0fe..7dc07582da0 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From a2cd906c36a04c8ce5a0095ae53892902b30d728 Mon Sep 17 00:00:00 2001
+From 5e624d82c2838fec2f41ebec124f74aacff9e61f Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -22,7 +22,7 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index b766aee425..34ae7d2a39 100644
+index b766aee4..34ae7d2a 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
 @@ -94,7 +94,7 @@ set(USE_ECH OFF)
@@ -34,6 +34,3 @@ index b766aee425..34ae7d2a39 100644
  set(USE_NGTCP2 OFF)
  set(USE_OPENSSL_QUIC OFF)
  set(USE_QUICHE OFF)
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index af164084d03..8788cc7964e 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2d3f6933f78d393514a48f8222ac8c3c39cb5fc7 Mon Sep 17 00:00:00 2001
+From b97f7dbb2637c6da772833c93bedc8be77520fb9 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.30.1.bb b/meta/recipes-devtools/cmake/cmake_3.30.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.30.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.2.bb
-- 
2.39.2


