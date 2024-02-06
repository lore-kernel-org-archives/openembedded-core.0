Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2699EC4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:20:48 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.27188.1707240038198701898
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 09:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=U0m4UxJm;
 spf=pass (domain: baylibre.com, ip: 209.85.222.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7d5c2502ea2so2172948241.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707240036; x=1707844836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HqltTfrvQsKgo7CNfSny5FH2kiFIMF5mVSq42PMO2YE=;
        b=U0m4UxJmxXu07WerSnBRCPHYpsM/cYSk3mAPBgAafNRvXmk3G+s2MKK0bIaR90yLKI
         AHdAUGi11W3dLz0dFCDs60jVzUrAAdyVCTsxrZSjk3b4/o4uyU02MbQxNdgYc1Wsr/Cv
         hZcgtrFll4Q21PbR5Ug+ZA1e6XpFCh4yqlvve/dzeoPGEl0gm0WBcWdptffFmYrjOGeO
         0WsKOr1jsmiRQcFl8opguaLbqQR5nhJzoOCT6eeZdbvfRPmfLurgZq8+C854e3MUpT6L
         sC14/voXygZyEqxfac3dURSXHFVmB32HPvkT+Hpi45/OQzD+ncJGajHzhGMADsN9G3vN
         uKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707240036; x=1707844836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HqltTfrvQsKgo7CNfSny5FH2kiFIMF5mVSq42PMO2YE=;
        b=bcyfQzLzlIF51TDmF+Bwpyg0lkHIiPz418nvRyAf9uEoJF4owijrxGatiJWg4m1OjS
         kp06GEeLQ8L5exUt0zboD8tMvKJzZFGR8RbcqMIBNcIvKGIVYfKxZ0dvkHOcaL1SSKct
         +OVj6QJ6JKrJATTIOrRQpkVNpSEOLLMYr/Pt7FBDM4J42FJHgCCoHtvtdVCaDFJ9pA4H
         VDPUtf0xwLm6bNHHGnWE9mhJWWF52g5bD7Fo4kuZzj3SebeR0gqWPG/9vCjRNMx6ynZp
         jtHpWoDEocuBSQ2jPBJbXwtk4z90nRlbYXVWVNUvMpdevHgkcrvNkUQmEiqxTODQhQgM
         y7QQ==
X-Gm-Message-State: AOJu0Yxm3rww8x2FIpexmTclLfPaDapwPhfPigAA7Y+hg6SglzYTye+X
	ZlGeelO7LcI1kiaKUr5x4pAZwJC5wEOdX82hlpyVjT6hpJ0foQ3gThmOUcaEfSMr62lYa8h79nT
	a
X-Google-Smtp-Source: AGHT+IFlQ94EiZzIdX3CByyC8yomvJoJDk69qz+cVmWv356ZtPXtID3MqMowsKqPUqy5gUQAvkw6hg==
X-Received: by 2002:a05:6122:308e:b0:4b7:48b9:ec12 with SMTP id cd14-20020a056122308e00b004b748b9ec12mr220433vkb.7.1707240036481;
        Tue, 06 Feb 2024 09:20:36 -0800 (PST)
Received: from megalith.. (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id ng6-20020a0562143bc600b00685ad9090basm1199090qvb.97.2024.02.06.09.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:20:36 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] cmake: upgrade 3.27.7 -> 3.28.3
Date: Tue,  6 Feb 2024 12:20:34 -0500
Message-ID: <20240206172034.1179647-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 17:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195013

Changelog: https://cmake.org/cmake/help/latest/release/3.28.html

The patch 0001-CMakeLists.txt-disable-USE_NGHTTP2.patch had to be
adjusted to apply cleanly on top of the new source version.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ake-native_3.27.7.bb => cmake-native_3.28.3.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc              |  2 +-
 .../0001-CMakeLists.txt-disable-USE_NGHTTP2.patch  | 14 +++++++++-----
 .../cmake/{cmake_3.27.7.bb => cmake_3.28.3.bb}     |  0
 4 files changed, 10 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.27.7.bb => cmake-native_3.28.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.27.7.bb => cmake_3.28.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.27.7.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.27.7.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index ecb0e487df2..ab9f459c05c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e"
+SRC_URI[sha256sum] = "72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index d6486cb45fc..b2933d88be9 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 3fd6082c52a8140db5995afb59fb391f7d5c19d7 Mon Sep 17 00:00:00 2001
+From d33d8a5e9f3b25a80d47b72b1a8a6624a85563c1 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
@@ -9,17 +9,21 @@ dependency, disable nghttp2.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Adjust the patch to apply on top of v3.28.3.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Utilities/cmcurl/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Utilities/cmcurl/CMakeLists.txt b/Utilities/cmcurl/CMakeLists.txt
-index f842270b..17b1ce19 100644
+index 9387247366..d3de01f4e8 100644
 --- a/Utilities/cmcurl/CMakeLists.txt
 +++ b/Utilities/cmcurl/CMakeLists.txt
-@@ -68,7 +68,7 @@ set(ENABLE_UNIX_SOCKETS OFF CACHE INTERNAL "No curl Unix domain sockets support"
- set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
+@@ -88,7 +88,7 @@ set(HTTP_ONLY OFF CACHE INTERNAL "Curl is not http-only")
  set(PICKY_COMPILER OFF CACHE INTERNAL "Enable picky compiler options")
+ set(SHARE_LIB_OBJECT OFF)
  set(USE_LIBIDN2 ON)
 -set(USE_NGHTTP2 ON)
 +set(USE_NGHTTP2 OFF)
@@ -27,5 +31,5 @@ index f842270b..17b1ce19 100644
  set(USE_QUICHE OFF)
  set(USE_WIN32_IDN OFF)
 -- 
-2.25.1
+2.43.0
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.27.7.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.27.7.bb
rename to meta/recipes-devtools/cmake/cmake_3.28.3.bb
-- 
2.43.0


