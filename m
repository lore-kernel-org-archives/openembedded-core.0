Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48613C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 16:48:00 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.47813.1722444475947018130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 09:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=IWoo62IN;
 spf=pass (domain: baylibre.com, ip: 209.85.210.45, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7092dd03223so1539664a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 09:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722444475; x=1723049275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqz492aPfjSnZTSIv/E5FCihgDC4GG6GzVQW2oiKI4Q=;
        b=IWoo62INcmmSvQAcx/hNtBnOq2w8bKiarBVduNM6QIkGLeki8fhYPclIlBc+lupikU
         4c5b7xTsQVAnQQ93tb+dggYSV2l5HXr+Z9QaL6rQBFeYJ1I1lOoBVR3GiyHQZ5gERwjO
         fKZRil6YVHjdWhStqAgupuKjeGXXFynS6+JkjR+RTMOLffSjIaOrSeMrU7karGdceZro
         NsZw3P8P+wob1EKZR788efuCCH/vJlK/oZMdwciIzkt4Mu9Za81hjSwO1I7EPwiNZk/1
         P2jJdZBk/SEWyjlNHmD+qr9/EFK04O+Hg23+ZkNf77+bs0gLpzkE6zMERF22ulF6YeMX
         gIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722444475; x=1723049275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqz492aPfjSnZTSIv/E5FCihgDC4GG6GzVQW2oiKI4Q=;
        b=WwGgTvIrRr1ai8q09w9b4troaILZRsK7Z3tHHx0k+D/Qxu4TuTyRl7A492bRzjPXwp
         ULlkC9uWasTJaF4QFzLYFcQd7xIcLrqdkvXVxZARrkvZr9E+zmVRTp0fBX8X7zBzwQus
         aryYlUWV7S1yr1OkDMWmZG/VilhelW1jP/fIM3bj6epHh8C3hOZoJGwh30+01BJdDGiY
         L4poapmUKjHD1KnHUdepG2z0uF1ZMwfs+CZT9b7iMheW61BnrD/b5zQVX/cVCjmnvhvu
         I9gWtVB162h+hxUMQkjdYOo15N76x4ePaSdW20rLtcwnw9P7e55WM8kFvsLi1q3U7eeo
         Fumg==
X-Gm-Message-State: AOJu0Ywu82Pg/+00IzkWrA3Q2g/AmniG8SlZMWAyC/LCfL/1dEq7zFkz
	R/JrEbEfW7jVaNyCwSreoMXdNugNRtPI0REBcVuRjQ3NV798FiyXlmtqopXzVF+jYip0KEXcoPV
	4
X-Google-Smtp-Source: AGHT+IGH0qWhYNWa8dvDKbl5x5COEitBGwRxosritSStwoHRc8zoNdd4aJCjkeERTqa4gpby+dym+Q==
X-Received: by 2002:a05:6830:358e:b0:708:b40a:fecc with SMTP id 46e09a7af769-70940c04016mr17280181a34.1.1722444474994;
        Wed, 31 Jul 2024 09:47:54 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe840c096sm62121611cf.79.2024.07.31.09.47.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 09:47:54 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] cmake: upgrade 3.29.3 -> 3.30.1
Date: Wed, 31 Jul 2024 12:47:53 -0400
Message-Id: <20240731164753.2074043-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 16:48:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202718

Refresh 0001-CMakeLists.txt-disable-USE_NGHTTP2.patch to apply on top of
the new version.

Changelogs:

3.29.4+: https://cmake.org/cmake/help/latest/release/3.29.html#id2
3.30.x: https://cmake.org/cmake/help/latest/release/3.30.html

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ative_3.29.3.bb => cmake-native_3.30.1.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...1-CMakeLists.txt-disable-USE_NGHTTP2.patch | 19 +++++++++++++------
 .../{cmake_3.29.3.bb => cmake_3.30.1.bb}      |  0
 4 files changed, 14 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.29.3.bb => cmake-native_3.30.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.29.3.bb => cmake_3.30.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.29.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.30.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.29.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.30.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 1155c1bbe0..604a22a2f0 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "252aee1448d49caa04954fd5e27d189dd51570557313e7b281636716a238bccb"
+SRC_URI[sha256sum] = "df9b3c53e3ce84c3c1b7c253e5ceff7d8d1f084ff0673d048f260e04ccb346e1"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index b7ec3e7bac..090f441f0f 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 946011cbfd686fe6bd2cec94494f6b0c4394bb6c Mon Sep 17 00:00:00 2001
+From a2cd906c36a04c8ce5a0095ae53892902b30d728 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -12,21 +12,28 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
 
 Adjust the patch to apply on top of v3.28.3.
 
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+Adjust the patch to apply on top of v3.30.1.
+
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Utilities/cmcurl/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index 3dd24f1e..4a0f6773 100644
+index b766aee425..34ae7d2a39 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -91,7 +91,7 @@ set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
- set(PICKY_COMPILER OFF CACHE INTERNAL "Enable picky compiler options")
- set(SHARE_LIB_OBJECT OFF)
+@@ -94,7 +94,7 @@ set(USE_ECH OFF)
+ set(USE_HTTPSRR OFF)
  set(USE_LIBIDN2 ON)
+ set(USE_LIBRTMP OFF)
 -set(USE_NGHTTP2 ON)
 +set(USE_NGHTTP2 OFF)
  set(USE_NGTCP2 OFF)
+ set(USE_OPENSSL_QUIC OFF)
  set(USE_QUICHE OFF)
- set(USE_WIN32_IDN OFF)
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/cmake/cmake_3.29.3.bb b/meta/recipes-devtools/cmake/cmake_3.30.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.29.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.30.1.bb
-- 
2.39.2


