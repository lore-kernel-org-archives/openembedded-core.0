Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7094C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:31 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.92330.1738600942403832022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fnlClRGX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4362f61757fso47858815e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600940; x=1739205740; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCj9JfyZtVwO6FbkTYOa3Ked1vtEp6gVtJ3A8qn3dgs=;
        b=fnlClRGXMFo6cNcpNbPiu8AtLm9RuGAgZmuRDdbR6lqVEtHM7SY0JahL7L2wy4WjVx
         HKBDZlmJ7ctkENe7DA2eZXvB0JlVyefZS0+XFq/QTudRlxBJ6t/qR21bVLdotAUsSgip
         bhsGZseesozO4Ef0HtyflWUH104dKMWfKUlPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600940; x=1739205740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCj9JfyZtVwO6FbkTYOa3Ked1vtEp6gVtJ3A8qn3dgs=;
        b=Qu8oXarW4YnPbdBEP94p3XMUfSOL7vTNdGONoEWfIwO0zM6VFEoXNcZz4qHR+cNTOi
         kpWrtSYATlIPiM4jTQ7fsgKtw21lyz9VsVIDg9OnwxdeWHspji79EdJ0TLYwb4vS89rj
         4mdcMqtIjYCd+KYFdwF7p2UfdguJFcH6YchsjnV0ja/n6jyDZODgrGZX3IcdKTM/hHJi
         eIwl3+rJI62TVbDtj8c0HLvu+ri6zVb/dAH0gw/0xNTU4YBonNJ/16KffUrP1vkpTL5N
         hdHNqgfeCwBN8eP4U+ypusG0zgawTqNdp7/cjuK7oyHNuxBX+n7C79PsTuyoe5sbaw5N
         309Q==
X-Gm-Message-State: AOJu0Yzg+/WCJC60SxhCY0FMkTPjHfyQPhpl0+abJ6i8tDjGwibpYDHQ
	UyemGvEK93cg2NZmylZmhNbS0DintmHEZTDaKBAWvQnPHx0KZVdkH9Yd6ck7iIUPAWnfBGiw3sM
	N
X-Gm-Gg: ASbGncv2C3op6SGNv101ayabWtcRyAxnBg+N5Gr+EMzeXDkldH6K8yok3zk9wwlfsAT
	bb6F6Ch6U8r5nBhBfZxNZIBo1wRsDtLlIz6woBc2dyDmMggYRaFleAJFfu0HplcDjr5q6dCKgxS
	cm8Vrxiue5Kdsk+Ml4UPTJ5agtaMjn9uJi5tcyehZEpYbSHCJTT0phB6ceBykO/sxCRcNy1ZqhR
	T0K51XBgd7QnI1oXFCUMDggu7jxwRC8t7EK4o1E7zQIV9r+r99MPANLXxsPUlswwtGiK3IMC08l
	oHw4FoMW407jSHif+GMEBiHM0/1c/bQ2PKSEB7huzL9x
X-Google-Smtp-Source: AGHT+IF67ZlBuGoicuv0i5ItFzpC4y9aRXmT+JsV9jzMaJpz6/FjkJD6KJwUApyYUtkI7PzRZVmy4w==
X-Received: by 2002:adf:e591:0:b0:385:fb56:5596 with SMTP id ffacd0b85a97d-38c51944328mr12301261f8f.19.1738600940236;
        Mon, 03 Feb 2025 08:42:20 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 46/46] cmake: upgrade 3.31.4 -> 3.31.5
Date: Mon,  3 Feb 2025 16:41:30 +0000
Message-ID: <20250203164130.3403325-46-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210719

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_3.31.4.bb => cmake-native_3.31.5.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.4.bb => cmake_3.31.5.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.4.bb => cmake-native_3.31.5.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.4.bb => cmake_3.31.5.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f1410a2c4be..703b037f09c 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "a6130bfe75f5ba5c73e672e34359f7c0a1931521957e8393a5c2922c8b0f7f25"
+SRC_URI[sha256sum] = "66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index cf00964a9c4..60dc439c3cb 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 969b2d07ad955fdc117bf2ea30305a5b2e74ea76 Mon Sep 17 00:00:00 2001
+From 4651696a9bac909191d4b2aa8c3b606d716e63e6 Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index a01e3fe8c7f..df77e54b72a 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From 8faeaefaf00f8d443511077b82624a8bd19cf725 Mon Sep 17 00:00:00 2001
+From fe238e7f4250fd7885e36ac63d346b21ee296d5d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 95ae9108aaa..757b59a2510 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From c0ca5859788189a81c53face2ab5eaeadc1236b4 Mon Sep 17 00:00:00 2001
+From 345e3176a12907fb1cf96913c95975554957b967 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.4.bb b/meta/recipes-devtools/cmake/cmake_3.31.5.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.5.bb

