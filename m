Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B889E7719B
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:17 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.5384.1735810867532624438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iX6lQSay;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43622267b2eso118228705e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810865; x=1736415665; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoKL/sdIfxFji1sI6sHDYmUjnXEtCDzrPDW7kkwXr74=;
        b=iX6lQSayXkQ3q7wTf481nhQ/f58JpwTTXtIOG6N0bROxlqz3gEuuF+Zj6xYmCQQr1B
         UspNxh7TOOqc4ekQBL79dDeCVz/uHk6iy+e7AZfAf1pbOA0R9QXpRKN+cJMqoC/Xj/aP
         y7BHpYtcGyL72YWMNjGvzOialBOSgB0JJhGa8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810865; x=1736415665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoKL/sdIfxFji1sI6sHDYmUjnXEtCDzrPDW7kkwXr74=;
        b=lK2yysQIaESWC9MQKzX+BZ2e+IYRN1khc1bvnME1+vgOoDVVb30ciUUOYK6wRz02Nf
         CWWVchdhgp4O9GGtRbcJ2NpQ8poeC1niA/4ItF5CTApHzTfpnHOKzz+ZBbM/UwX0w9y/
         QTjzcDTr0pg7/jmHBefzO1wlbTFq13XJu5irS3hyqEycBjNndXxTt/heHy4BxvHxbaDz
         vrm7O0PBe/4XLrU6tHi9alrY7xgAIiFrv5ukYRd/eL5BjB3W3ATzwLILK7jcfSisSsWT
         Kr37InmIJhIu2BbqfX3MMalXvB9eKxANNV9y4GC5PxaA2+qiElznHnoxnWQKNLf33cL1
         2Q9g==
X-Gm-Message-State: AOJu0Yzpm25NWZYqlcqCDL/UuD/AV5LghsROh2Xg+z8YTGHXhg646ZEL
	OAnWLbyrih9ykazpk1fcOQWDTX0259u09eHS4kJXR+H7yQr58TnX0vMYtTQuuKIfKy9WJsqFb2L
	ccOg=
X-Gm-Gg: ASbGnctem6/ZsBkZXe1dCS/V3oloP50N0Uj8vOKjzrWs1zzjYa/DXYtUK54HfyhtZMS
	FIBJW9Mx9fRQ0Hf8aclGVi14vVNMufeyd0ICFBuRQsRrOao0kZZNdsRmg3HEdsNj7otPrSvEnXu
	0mXWacDUE0hGR7kAoBjDzOSasQnnzkm87vZfFJc91Qj9sOapztzJc6XDslW2bu4IqiawkkxT8Vf
	MiDeiPZgS9rjx/o0QLlB+DJWq38hdH0e8zkafUmTKMi10I3VnbQsNygcOV5vxZeos3U+gKa+2H2
	foPMcj1fCg==
X-Google-Smtp-Source: AGHT+IEi/tTOWYoDwDFB5u/0+SlvvDVP317R/VkChq9Eu8P8T6wn+/NBYpkrTZKoN/qdICa5Jj/wFw==
X-Received: by 2002:a05:600c:1388:b0:434:f871:1bbc with SMTP id 5b1f17b1804b1-43668643aaamr476386755e9.10.1735810865323;
        Thu, 02 Jan 2025 01:41:05 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:04 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/21] cmake-native,cmake: upgrade 3.31.0 -> 3.31.3,3.31.0 -> 3.31.3
Date: Thu,  2 Jan 2025 09:40:35 +0000
Message-ID: <20250102094059.322187-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209264

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.3.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 2 +-
 ...CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch | 2 +-
 ...Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 4 ++--
 .../cmake/{cmake_3.31.0.bb => cmake_3.31.3.bb}                | 0
 6 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.0.bb => cmake-native_3.31.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.0.bb => cmake_3.31.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d32e2084ef0..14cd9ffc5ee 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "300b71db6d69dcc1ab7c5aae61cbc1aa2778a3e00cbd918bc720203e311468c3"
+SRC_URI[sha256sum] = "fac45bc6d410b49b3113ab866074888d6c9e9dc81a141874446eb239ac38cb87"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 57d5f081493..68c1020a42f 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 29046e1308bec72cc21b0b00e979906f5a1fb63f Mon Sep 17 00:00:00 2001
+From d6e3cb98ffa81c6234ad5a563354ef5f442e1bb3 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index 87efbd993df..fe3bf33c607 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 80655318696091d27d131e8c4a48140e37e73366 Mon Sep 17 00:00:00 2001
+From 3f9b36a52f12e8f8860cf4337acc9a9514a2095b Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 9071d0f559a..ea4c76f99f2 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 2b8f6d4a5fddb5212ce07f0c61f5a3edbf5187d4 Mon Sep 17 00:00:00 2001
+From 7a4c1ed7b4dd038ef99c4a82e1d27743b2801757 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
@@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 2 insertions(+), 6 deletions(-)
 
 diff --git a/Utilities/cmlibarchive/CMakeLists.txt b/Utilities/cmlibarchive/CMakeLists.txt
-index feeaa3b7..c301fb25 100644
+index 4e4b49c1..50e9a733 100644
 --- a/Utilities/cmlibarchive/CMakeLists.txt
 +++ b/Utilities/cmlibarchive/CMakeLists.txt
 @@ -745,12 +745,8 @@ LA_CHECK_INCLUDE_FILE("copyfile.h" HAVE_COPYFILE_H)
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.0.bb b/meta/recipes-devtools/cmake/cmake_3.31.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.3.bb

