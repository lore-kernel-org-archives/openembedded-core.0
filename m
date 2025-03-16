Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569F9C35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:22 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.31773.1742141534378697140
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dOmlE8ca;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f403edb4eso1968591f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141532; x=1742746332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yICgwGDnF5gVoVsy9nSKnxuHyBdnHQX3t9hxN0i+oNw=;
        b=dOmlE8caa0XAos+oNIN3l/ZDCuL3xyGsfco189Lpoce8T4RarMb4b6U6ZtP141LJ8L
         9sAghvsMjOmM7+Uag47I4lj3/Ax8+prZ16VftbmpiEtV0wyNKt05UEL/NcvhxIrExKam
         6UKj0vrkh3V+SuFi2AToqWd/YpJd6lxKSnxgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141532; x=1742746332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yICgwGDnF5gVoVsy9nSKnxuHyBdnHQX3t9hxN0i+oNw=;
        b=kFKvEEFL9F8Dq1fWV89bRoStcO45cGa40tTDSbz/uMRW/IB3vjQabO4I93odFjPNfq
         AgPOBM5GEptVBDqfoDdYgywDYHPrGXsWy4RUxLzjV8gYc6QADvgxioEo+khQlkowd7/n
         YJv/VQHnKHbjlEnn6IS30tzPq8zitVXyffaLgl7bJ8ZE7yyBuGAqLvO2yMhs1BV8jz2B
         C+9JXRJx7xDmsQFui2tuwmBnRWE5u35u+bsK0qN4aLnnA/9rjLcb6dsPvYaYokJKfY3b
         m821Zw7x63KycC/SZLdKJSzDOF6qynP2+PKry8n8yAwHHLayLBag4WqYfWOZMbfg6YFC
         eppQ==
X-Gm-Message-State: AOJu0YzRSe1B+Kjk+efMWFP3ITBrbg/EZzx3mJvsDieBXuI7MOlrCAzu
	JdIof9Rhvxbw4Z0vd9NHivRccQGwsxFjpBh4/KLdWTTE1V+TcJMkfbu7HRdTzT8kXKr9xQyL32y
	8
X-Gm-Gg: ASbGncsnVk2iZ4VDS7FOGIF821XNBCmyScxZqvs5uFXmP6yfGY8LrP2h2K3UAOZvzR1
	bQwQOR2yh1ylUmqC/pA+hrNzY++/yHA4aKTHy4spPnGiXtslWCxhriFZHsEasMCrEw4soRATMkW
	0Cj9qH3KtDzRMPoVinjkyZ37FKZG3Wxfq0T7SfQQQ4cC6O+XDcyCNLZ8VcCC/s/yF8bgCJfTVFJ
	LlFS/f3N2ZvxLv7fUPtuwppBtmk9OmnlWZ+qlzfffR3z0YlTVfPv3lg0eoIgAMTI87Li5j8aY5Z
	k455u2zT/sSFieCICD52wjca3iW5U6RH4d8tKU73BmFJjjYCk16maaEJeZ01NhtB+cfrVgAUQg=
	=
X-Google-Smtp-Source: AGHT+IG9rJJL2SxYW8Tw4+Ht4tqSZlCHOHRb0ZV/4t06+66AAToL+mSykrn8YhFnatvoh0kQXAJiBA==
X-Received: by 2002:a05:6000:186b:b0:391:23de:b1b4 with SMTP id ffacd0b85a97d-3971ffb1eccmr8749209f8f.45.1742141532167;
        Sun, 16 Mar 2025 09:12:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/43] cmake: Upgrade 3.31.5 -> 3.31.6
Date: Sun, 16 Mar 2025 16:11:28 +0000
Message-ID: <20250316161209.3629986-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213005

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../cmake/{cmake-native_3.31.5.bb => cmake-native_3.31.6.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch | 2 +-
 .../cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch   | 2 +-
 ...5-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.31.5.bb => cmake_3.31.6.bb} | 0
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.5.bb => cmake-native_3.31.6.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.31.5.bb => cmake_3.31.6.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.5.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 703b037f09c..b3cc10ae022 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -20,7 +20,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch \
            "
 
-SRC_URI[sha256sum] = "66fb53a145648be56b46fa9e8ccade3a4d0dfc92e401e52ce76bdad1fea43d27"
+SRC_URI[sha256sum] = "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb78ce22ddd9e55f0"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
index 60dc439c3cb..3895c7e03b9 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-fl.patch
@@ -1,4 +1,4 @@
-From 4651696a9bac909191d4b2aa8c3b606d716e63e6 Mon Sep 17 00:00:00 2001
+From e4061151ac13bc727512d961a80faca3ceb22b5a Mon Sep 17 00:00:00 2001
 From: Philip Lorenz <philip.lorenz@bmw.de>
 Date: Mon, 3 Jun 2024 13:19:24 +0200
 Subject: [PATCH] CMakeDetermineCompilerABI: Strip -pipe from compile flags
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
index df77e54b72a..ab78fa26ba0 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeLists.txt-disable-USE_NGHTTP2.patch
@@ -1,4 +1,4 @@
-From fe238e7f4250fd7885e36ac63d346b21ee296d5d Mon Sep 17 00:00:00 2001
+From 061253f390ada0661b30cf8856fa8d8d40a7355d Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 28 Dec 2022 17:51:27 +0800
 Subject: [PATCH] CMakeLists.txt: disable USE_NGHTTP2
diff --git a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
index 757b59a2510..7559c529323 100644
--- a/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
+++ b/meta/recipes-devtools/cmake/cmake/0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch
@@ -1,4 +1,4 @@
-From 345e3176a12907fb1cf96913c95975554957b967 Mon Sep 17 00:00:00 2001
+From 8effa783e47e2b574be90733c38b27701e06e929 Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 5 Jul 2018 10:28:04 -0300
 Subject: [PATCH] Disable use of ext2fs/ext2_fs.h by cmake's internal
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.5.bb b/meta/recipes-devtools/cmake/cmake_3.31.6.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.6.bb

