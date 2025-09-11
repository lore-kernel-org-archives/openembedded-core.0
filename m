Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57401CAC592
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 08:51:48 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.41401.1757580697949318649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 01:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gb0nHgGb;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so2754425e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 01:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757580696; x=1758185496; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzufoHzEg4n1eZTDRQHlyZI6q/VxDNwLU/ySJHWijos=;
        b=Gb0nHgGbFO9+Pi0onzrbZ5IPlKmlKrjzURy2MLI0L0OPNSQILnzzkhySaAvDLmD33L
         nVIj3sLixZqwEgwG+olxIbq7Sk4jK2k6sDYLTWdgpzZbR2NcCp1DNcUP4NmwfkqDP61Z
         VWbTEHg4n0bvuNJh5MNTntJv2Vn+KF0YykCdDSG467wkkazPMD7PUst7zbLGh2VSGing
         j7+p2UnVSahfK0BnWUKK383DBhcNLmhZDE8CaaTlaHMmxUI7KULq4LuYAwf/NzfbHtEe
         2g8EySVw+ch2qm4P8Lt5xZnax4Q8Ysqh/fICFGmhMvEbc7b+GDLsMQZjnrxIcwGsxXWe
         QE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757580696; x=1758185496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzufoHzEg4n1eZTDRQHlyZI6q/VxDNwLU/ySJHWijos=;
        b=qdB1a3mBD4J8LDPNy7nJNBnLufm2izDXH7getta1hB2HOlH0MEcsfSF1o+fHnyLUv1
         RF4TGSF/p+3xgGI/w2Wn/BGpZSNAWWNZUEtMIttOAC66ycx8ITDbmHM1pU4y/plom2WA
         N38dLOmL2KOHwLnmkzXSQjjsPxHs7OFesJ6xf7IpiUUEoKq8fkIWTvoxPlsT9k/sMbsn
         9yyZL6r9mdPA2BWahgepuFHYPt7ohuouGqIP3WEHyqyowyarGEmnq8Zt+qW2ZZKAl0y6
         pytp9fLPYouqAwq0ernAyOilVqANfmToxMT5FSijQQgC8UYNi6P55KZ16V5hxn83wPIN
         T7oA==
X-Gm-Message-State: AOJu0Yw2W62yCPI+gic+/rcBkrUWrAya4vp4G//9VT0pjRp/ZelJgVKW
	j7ej08MnZl/RSiwyYCG9EV5K+8l1M5FL4hdxJmbFLb1z4zfcfmacgL4sN3vGAg==
X-Gm-Gg: ASbGncvuOhC1HwaC6xJiq8P6HpCrWkw484Vxu35vmiUHD6kjDqObeFL4hPw3D+jB1Nh
	0q24YOxuJ8GLZOKKXgXSUYwpiSUSB04ll+uqSXKeghe6E9Azb0swZB5uvG85WCfA9bdgTaxb5sm
	5GFRef1JqPKA20kWbggVkUqKajvbdF6LaWVTQKI4KFhbYCFGLxRfO4aXc5af7SjKgYR+A2TCJzg
	GjAlFWqe1IX/eZsVlsLtvGUQiOhpJi3cfWS4Yx6Q/QuWrOLhu0XqrA27GruAWZp/DaZG8gz/ekl
	aEN/zSq2l75O0vsqp5YmW824ahhO+d1OV+JRjPp89cV1ctAVbDW3n5sI1PsTAXOZKTwvcpCKEgL
	07Wdcu6O6JoUFHK8ByuHltVtu9fYGbvjdcfwpGZJyUjRYBa3G8dfzIBNLuWfip5FZ5QUuRszb0X
	4C2d9S8VloyE1tPEJ2LkKugHAdPFoyU6YSn/007jHyRR/gHHdOz0lnDm2Z80/Gio4KotaB
X-Google-Smtp-Source: AGHT+IHOmYbrh4x5z+SlxPzQ966qPZOGpCC0mykx7HNyGAYCsJGIUrqgQfGKgObT/X4bDH8ORN5PsQ==
X-Received: by 2002:a05:600c:4f09:b0:45d:e54b:fa29 with SMTP id 5b1f17b1804b1-45ded923f53mr78054035e9.14.1757580696076;
        Thu, 11 Sep 2025 01:51:36 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b2f4esm19382005e9.17.2025.09.11.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 01:51:35 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/16] librepo: update 1.19.0 -> 1.20.0
Date: Thu, 11 Sep 2025 10:51:11 +0200
Message-Id: <20250911085123.1551425-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911085123.1551425-1-alex.kanavin@gmail.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 08:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223251

From: Alexander Kanavin <alex@linutronix.de>

Drop 0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
as upstream added pkg-config support at last.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...tain-PYTHON_INSTALL_DIR-by-running-p.patch |  2 +-
 ...les-with-pkg-config-not-with-cmake-m.patch | 26 -------------------
 .../{librepo_1.19.0.bb => librepo_1.20.0.bb}  |  5 ++--
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
 rename meta/recipes-devtools/librepo/{librepo_1.19.0.bb => librepo_1.20.0.bb} (83%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 1425041dad6..ac5373f2e76 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From e86f562d3cc6cea3e19c4bab77ffa2902f634615 Mon Sep 17 00:00:00 2001
+From 0062f49b62ce014dc81485c6ae101d49399d22cf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
deleted file mode 100644
index edee8698d80..00000000000
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 93d3c49dbdf348eec9900d53a152457f6d1cb816 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:23:27 +0200
-Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
- (which doesn't work properly)
-
-Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config support and is not interested in it]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 68ce953..04f83b9 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -39,7 +39,8 @@ PKG_CHECK_MODULES(LIBXML2 libxml-2.0 REQUIRED)
- FIND_PACKAGE(CURL 7.52.0 REQUIRED)
- 
- IF (USE_GPGME)
--    FIND_PACKAGE(Gpgme REQUIRED)
-+    PKG_CHECK_MODULES(GPGME gpgme REQUIRED)
-+    set(GPGME_VANILLA_LIBRARIES ${GPGME_LIBRARIES})
-     IF (ENABLE_SELINUX)
-         PKG_CHECK_MODULES(SELINUX REQUIRED libselinux)
-     ENDIF(ENABLE_SELINUX)
diff --git a/meta/recipes-devtools/librepo/librepo_1.19.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
similarity index 83%
rename from meta/recipes-devtools/librepo/librepo_1.19.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.20.0.bb
index ba66c8ef68f..6557dda43a4 100644
--- a/meta/recipes-devtools/librepo/librepo_1.19.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -5,12 +5,11 @@ DESCRIPTION = "${SUMMARY}"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=${PV} \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
-           file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
            "
 
-SRCREV = "7955987e33ba98dddb3fc2c63bb6dc892e3505fa"
+SRCREV = "363cb70c6548be900832bc9b18ced3e7569da15a"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.39.5


