Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379E7D1269E
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 10:25:46 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11953.1764757536226495589
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 02:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=YtBgmGXX;
 spf=pass (domain: snapchat.com, ip: 209.85.210.172, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7baf61be569so7720222b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764757535; x=1765362335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ5P4f6IN4h7mEaQZ/JZxzT/RpmPuJdmBy78jnRkB/4=;
        b=YtBgmGXXYICEtiHa3Rd9DUzLuUXMOxZ9NTBNZCYxw+Z7zUOqXfFh4NTsrBQqtgEYxg
         etoDuQDpoc9h/oIi9TwlfyzXJ7ba88Ch38iHU43tqEeMmumMDbntRdArpqRO9mRlTm/H
         5mahGcxWSEuiMcWJXnia9YjZ2bBPXC1yo9cWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764757535; x=1765362335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQ5P4f6IN4h7mEaQZ/JZxzT/RpmPuJdmBy78jnRkB/4=;
        b=AonlYTtpWRXnm59JlEPGt50sOLWnvSer/Or6duZlFccZbxRX8sZCv77w4YFGMvMmjL
         rUe/w/F2CSVZdQC75WFKYwLjdkQHl8hau6CJyLLiA2sXzOGBTVaszH0tD/MHm6LkC0Yz
         p+7EtiMKGgNnUfIeznaVVCXMj8A9lNmyxZX8bYjMnLgjZUeee69tDfxk6iV4XGRhXrEo
         fwp3njODwlVHAv9Y8xgtmoOsy3ic4/K53JlefEaCGqgmjvzgGP5RKx7JIjxQmQ60hJdN
         I8RuPKdnkzruEqI89ZXXaiCZm3/xxs4dVAqrXRW/vXgiVqFQc0n3ddlzIKi7TMYMtInl
         APAg==
X-Gm-Message-State: AOJu0YxtbdO0qKcLKCOB8Wz2j6l4L7hr/HS9fDi9zCPD4EK3TOQqpnuf
	Tuso1SF/VeMXroFKp5mugcgBTbZFk36cVJdhkqSFqaQC0i/52U5ZnBayVj+Kw3Z+ATEsiqMfYml
	Bbdly9zs=
X-Gm-Gg: ASbGnctPe5ObwicxDcixpUQahvinXSLsxO4yG8Pei4oPa/7A0Pxjze0cQ9EMWtAx/QT
	Twq4lfLyTjsIYDe3gRBqCjTgVI8G6AnSBp1/oS63/nv1YollxFYM1eQ52BxzIHLDrwn2Ay2n4+W
	eN873QaenqSbbNIUgeU37UbNZcHsGlUuikmCDdO2ZwyY1r3ITRcKc7HDpt4xZYU1H7vZnACB9PQ
	kQ5LH7GFOxFsuYSbGKn8Z0MCXdQoBaona50apkqfXTLNN6Alq+Pb2BmVdXuFPLkrzGIGxnhLXoM
	C+6kCt1XJb+ov+YwKYoyOjO5qWTHQyQor5bSXLakXCwYJ6CjkH4RfVgULqgE5v2Pp7NKsI4xDCr
	mcNdvFJJwK/0XshHT2XohIfc+Rrs9+kfTSz1+taWCAYBLq1S6zxDoWgrEf/vuLiCJTqmDxdtiwR
	hj7z3sLtY1BLEIX/KGG9lZ/SHS2dCZbjL/dT959JIQHZ5jJu1VnmfWuz948lbd1k//
X-Google-Smtp-Source: AGHT+IEMnE5G1DywMWBalzxjUYn83Vlozj5RCYLjW7kuhl43rrINxZO8+h3qX8RyW049r1wh/ebFmw==
X-Received: by 2002:a05:7022:61f:b0:119:e569:f26d with SMTP id a92af1059eb24-11df0c3b304mr1313252c88.22.1764757534834;
        Wed, 03 Dec 2025 02:25:34 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcaee660asm91345650c88.3.2025.12.03.02.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 02:25:34 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [OE-core][PATCH v2 1/2] opkg: fix WITH_ACL and USE_ATTR being enabled per default
Date: Wed,  3 Dec 2025 11:25:13 +0100
Message-ID: <20251203102514.3969401-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 10:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227213

From: Etienne Cordonnier <ecordonnier@snap.com>

ENABLE_XATTR and ENABLE_ACL were both "no" per default in autoconf, and this default
value was mistakenly changed during the cmake migration. Change it back to OFF per default

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 ...003-cmake-fix-WITH_ACL-and-USE_XATTR.patch | 95 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.9.0.bb      |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch b/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
new file mode 100644
index 0000000000..a041965515
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
@@ -0,0 +1,95 @@
+From 6d2eb69bb7b8f1ada6232eba4eb9c223be386d29 Mon Sep 17 00:00:00 2001
+From: Etienne Cordonnier <ecordonnier@snap.com>
+Date: Thu, 27 Nov 2025 19:05:16 +0100
+Subject: [PATCH] cmake: fix WITH_ACL and USE_XATTR
+
+- CMakeLists.txt was using USE_ACL, but config.h.in was using WITH_ACL.
+  Use the consistent logic that optional dependencies use the prefix HAVE_,
+  and thus since use WITH_ACL consistently (build dependency libacl).
+
+- opkg_archive.c was using ifdef instead of if for both USE_ACL and USE_XATTR.
+
+- ENABLE_XATTR and ENABLE_ACL were both "no" per default in autoconf, and this default
+  value was mistakenly changed during the cmake migration. Change it back to OFF per default.
+
+Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=6d2eb69bb7b8f1ada6232eba4eb9c223be386d29]
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
+Signed-off-by: Alex Stewart <alex.stewart@emerson.com>
+---
+ CMakeLists.txt         | 6 ++++--
+ config.h.in            | 2 +-
+ libopkg/CMakeLists.txt | 2 +-
+ libopkg/opkg_archive.c | 4 ++--
+ 4 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f2c01b1..316e343 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -13,6 +13,7 @@ set(PROJECT_VERSION "${PROJECT_VERSION}+git")
+ set(VERSION ${PROJECT_VERSION})
+ 
+ option(STATIC_LIBOPKG "Statically link libopkg into opkg" OFF)
++# Options which add optional dependencies are prefixed with "WITH_"
+ # The current libopkg API is deprecated so only build it if requested
+ option(WITH_LIBOPKG_API "Enable deprecated libopkg API" OFF)
+ option(WITH_XZ "Enable xz compressor support" ON)
+@@ -23,8 +24,9 @@ option(WITH_CURL "Enable downloading with curl" ON)
+ include(CMakeDependentOption)
+ cmake_dependent_option(WITH_SSLCURL "Enable certificate authentication with curl" ON "WITH_CURL" OFF)
+ option(WITH_SHA256 "Enable sha256sum check" OFF)
+-option(USE_ACL "Enable ACL support" ON)
+-option(USE_XATTR "Enable xattr support" ON)
++option(WITH_ACL "Enable ACL support" OFF)
++# Options which don't add optional dependencies are prefixed with "USE_"
++option(USE_XATTR "Enable xattr support" OFF)
+ option(USE_SOLVER_LIBSOLV "Enable libsolv solver support if true. Enable the internal solver if false." ON)
+ if(USE_SOLVER_LIBSOLV)
+     set(USE_SOLVER_INTERNAL OFF CACHE BOOL "Disable internal solver")
+diff --git a/config.h.in b/config.h.in
+index 877b8c7..f2d74c5 100644
+--- a/config.h.in
++++ b/config.h.in
+@@ -6,7 +6,7 @@
+ #cmakedefine01 WITH_CURL
+ #cmakedefine01 WITH_SSLCURL
+ #cmakedefine01 WITH_ACL
+-#cmakedefine01 WITH_XATTR
++#cmakedefine01 USE_XATTR
+ #cmakedefine01 USE_SOLVER_LIBSOLV
+ #cmakedefine01 USE_SOLVER_INTERNAL
+ #cmakedefine01 WITH_GPGME
+diff --git a/libopkg/CMakeLists.txt b/libopkg/CMakeLists.txt
+index 628cb8c..39064c2 100644
+--- a/libopkg/CMakeLists.txt
++++ b/libopkg/CMakeLists.txt
+@@ -182,7 +182,7 @@ if(WITH_SSLCURL)
+     target_link_libraries(libopkg OpenSSL::Crypto OpenSSL::SSL)
+ endif()
+ 
+-if(USE_ACL)
++if(WITH_ACL)
+     pkg_check_modules(acl REQUIRED IMPORTED_TARGET libacl)
+     target_link_libraries(libopkg PkgConfig::acl)
+ endif()
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 48f80c0..fb40db3 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -914,11 +914,11 @@ struct opkg_ar *ar_open_pkg_data_archive(const char *filename)
+     ar->extract_flags = ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
+         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_NO_OVERWRITE;
+ 
+-#ifdef USE_ACL
++#if WITH_ACL
+     ar->extract_flags |= ARCHIVE_EXTRACT_ACL;
+ #endif
+ 
+-#ifdef USE_XATTR
++#if USE_XATTR
+     ar->extract_flags |= ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XATTR;
+ #endif
+ 
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
index ed2f36d636..f021fd9b5a 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://0002-config.h.in-fix-typo.patch \
+           file://0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


