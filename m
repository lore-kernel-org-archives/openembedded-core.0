Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3793C4450B
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:33 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.155309.1783358248828230431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lgMoqRz3;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c7902f47so19941535e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358247; x=1783963047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqG8BekM/SPvxAq65wHxnWcelo7s0hOKYlsCbVXtwJo=;
        b=lgMoqRz38nFxg0aqpvn5WxviHJKMgnFVnttEhrTk2hF4fscl4jacpST6+7mzjw36TO
         KBBHuNx2C3Yf1RKDMrvNnGx4Mxc6kudbh1irTB+InJQsunuRxmRiFc0/4yNqChEffWCz
         7i4s42MMeCq7nKuaGsEMMXivYpvm4Oz6yR5CFPPtjoWLaDLMMPZqy1wJ0wuORIoh+j+g
         QB1z6yhVvjbPUv6ZMD/X3denE9FQP+ZYd0DK79HG3MlGEfzzyrFXU6Z2aqqSRRf98TKO
         7Xg6K3svEajFSt82mLxNV+bj4a/dvCfKEaomJZnXS8PJkutHll2r+zlG6oHclSK8cwq/
         /hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358247; x=1783963047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SqG8BekM/SPvxAq65wHxnWcelo7s0hOKYlsCbVXtwJo=;
        b=X/L3hk9hKhalBXYwBMAkO4wzgWKXd8wUIErrOJaKCDfLHbJViLPosL0wfrgPRO2Rma
         z5Js53EUomRMB0R+a1y9rwrAx21+aB0Gum/rj375BlJJhcvn0aIQ+44uiSB/huLGEk/h
         Z+XMZa/5PRp6eY/6szgPBIuNCnBWFKkAGWR/kfvHTmgZsawgIhKKi2OfGbZ0MoJJ55AI
         i0nmkZ3qKM2nbVCnLfn3u6FRIA5FI9DEKpMJ05sPzleLs+w7WzT8X0w5wEjqr/6gJyha
         7UMQQgfb3SLAHr+NOFl5elnz6teqACIm5TNtq6HTMCNoJel0oR6fZ1h+3OMyxPZbfkWj
         +vSQ==
X-Gm-Message-State: AOJu0YwV7eFrzjBOIkjBFqiPwsrCgZml60sJEJowhTmTrXs8zKqFEog8
	euh01smFGrIv3TnTRU1ewKUXzT38NTThrgDJgqjehIVhS2eUqPIeUWnUeSFalw==
X-Gm-Gg: AfdE7claj/2C5kcgEsJgDKNtWA6G597YFuUKFL+xhBTx04GsLwjn3fWPMprKb4SYIkV
	9w5iUu7NvWe7CD2VX9liF9Wh5cnkusCmWNadC/u2aEIRhuTFf2XVdxk9v/56ePk5eohQKiXc/+r
	9P/UEjRjUxk/8VdTjyWFNHkgk0tpAg6xs4+S5ggg9C6LRmBa8R7qsAoLgHXWaJK8g07UsDEX5s8
	Q8MZnTj1lULjRxUXfF30H3X1z4qFmn0beFeojHVCSA4AoO6MGiKRQaw7P383n6Q7dwW5Jnhj5QA
	89uoppvvbuNF6gcq6JTbBEE8cpXbnQVwg10mTY+JgVkTJ7CrwfuFmqVCMUSQk504XAaMqkMj/LG
	uC2BGtaQXR7nJnKttC58QSaDkNN6lJpFdofUHF+94Qu+3fsKcoE8vMv+qj/2hBd9y6sWb6gIfaR
	3pI3LgPXlQkbAdoYkGjf8e55+uGCXGAWReEVkDwBhZ5T/gNO7y
X-Received: by 2002:a05:600c:8b70:b0:493:b6e4:fb2b with SMTP id 5b1f17b1804b1-493df06e943mr15669655e9.25.1783358247048;
        Mon, 06 Jul 2026 10:17:27 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:26 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/45] opkg: upgrade 0.9.0 -> 0.10.0
Date: Mon,  6 Jul 2026 19:16:38 +0200
Message-ID: <20260706171701.70536-24-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240309

From: Alexander Kanavin <alex@linutronix.de>

Drop backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-opkg.lock-in-run-instead-of-var-run.patch |  4 +-
 .../opkg/opkg/0002-config.h.in-fix-typo.patch | 27 ------
 ...003-cmake-fix-WITH_ACL-and-USE_XATTR.patch | 95 -------------------
 .../opkg/{opkg_0.9.0.bb => opkg_0.10.0.bb}    |  4 +-
 4 files changed, 3 insertions(+), 127 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
 rename meta/recipes-devtools/opkg/{opkg_0.9.0.bb => opkg_0.10.0.bb} (94%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
index 98daf746ec..88aadbd51c 100644
--- a/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
+++ b/meta/recipes-devtools/opkg/opkg/0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch
@@ -1,4 +1,4 @@
-From 82b29dcfe3033d8285890bf46e58f464d9944196 Mon Sep 17 00:00:00 2001
+From 1b1ea74d7375168eadc562d316a590e0dcae1260 Mon Sep 17 00:00:00 2001
 From: Jonathan Liu <net147@gmail.com>
 Date: Mon, 21 Sep 2015 20:23:23 +1000
 Subject: [PATCH] opkg_conf: create opkg.lock in /run instead of /var/run
@@ -17,7 +17,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libopkg/opkg_conf.h b/libopkg/opkg_conf.h
-index 3fa6ca9..b12672e 100644
+index 650b59c..f9cf981 100644
 --- a/libopkg/opkg_conf.h
 +++ b/libopkg/opkg_conf.h
 @@ -42,7 +42,7 @@ extern "C" {
diff --git a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch b/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
deleted file mode 100644
index 626bbd01b6..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0002-config.h.in-fix-typo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5a81faadbc2397d554bc598d535fd2d44cbc8d10 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Mon, 20 Oct 2025 18:57:56 +0200
-Subject: [PATCH] config.h.in: fix typo
-
-Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=d723a90bfe6409c7ad983ed911225d4aefbfd09e]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
----
- config.h.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.h.in b/config.h.in
-index 4fa9842..877b8c7 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -2,7 +2,7 @@
- #cmakedefine01 WITH_XZ
- #cmakedefine01 WITH_BZIP2
- #cmakedefine01 WITH_LZ4
--#cmakedefine01 WITH_LZSTD
-+#cmakedefine01 WITH_ZSTD
- #cmakedefine01 WITH_CURL
- #cmakedefine01 WITH_SSLCURL
- #cmakedefine01 WITH_ACL
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch b/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
deleted file mode 100644
index a041965515..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 6d2eb69bb7b8f1ada6232eba4eb9c223be386d29 Mon Sep 17 00:00:00 2001
-From: Etienne Cordonnier <ecordonnier@snap.com>
-Date: Thu, 27 Nov 2025 19:05:16 +0100
-Subject: [PATCH] cmake: fix WITH_ACL and USE_XATTR
-
-- CMakeLists.txt was using USE_ACL, but config.h.in was using WITH_ACL.
-  Use the consistent logic that optional dependencies use the prefix HAVE_,
-  and thus since use WITH_ACL consistently (build dependency libacl).
-
-- opkg_archive.c was using ifdef instead of if for both USE_ACL and USE_XATTR.
-
-- ENABLE_XATTR and ENABLE_ACL were both "no" per default in autoconf, and this default
-  value was mistakenly changed during the cmake migration. Change it back to OFF per default.
-
-Upstream-Status: Backport [https://git.yoctoproject.org/opkg/commit/?id=6d2eb69bb7b8f1ada6232eba4eb9c223be386d29]
-Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
-Signed-off-by: Alex Stewart <alex.stewart@emerson.com>
----
- CMakeLists.txt         | 6 ++++--
- config.h.in            | 2 +-
- libopkg/CMakeLists.txt | 2 +-
- libopkg/opkg_archive.c | 4 ++--
- 4 files changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f2c01b1..316e343 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -13,6 +13,7 @@ set(PROJECT_VERSION "${PROJECT_VERSION}+git")
- set(VERSION ${PROJECT_VERSION})
- 
- option(STATIC_LIBOPKG "Statically link libopkg into opkg" OFF)
-+# Options which add optional dependencies are prefixed with "WITH_"
- # The current libopkg API is deprecated so only build it if requested
- option(WITH_LIBOPKG_API "Enable deprecated libopkg API" OFF)
- option(WITH_XZ "Enable xz compressor support" ON)
-@@ -23,8 +24,9 @@ option(WITH_CURL "Enable downloading with curl" ON)
- include(CMakeDependentOption)
- cmake_dependent_option(WITH_SSLCURL "Enable certificate authentication with curl" ON "WITH_CURL" OFF)
- option(WITH_SHA256 "Enable sha256sum check" OFF)
--option(USE_ACL "Enable ACL support" ON)
--option(USE_XATTR "Enable xattr support" ON)
-+option(WITH_ACL "Enable ACL support" OFF)
-+# Options which don't add optional dependencies are prefixed with "USE_"
-+option(USE_XATTR "Enable xattr support" OFF)
- option(USE_SOLVER_LIBSOLV "Enable libsolv solver support if true. Enable the internal solver if false." ON)
- if(USE_SOLVER_LIBSOLV)
-     set(USE_SOLVER_INTERNAL OFF CACHE BOOL "Disable internal solver")
-diff --git a/config.h.in b/config.h.in
-index 877b8c7..f2d74c5 100644
---- a/config.h.in
-+++ b/config.h.in
-@@ -6,7 +6,7 @@
- #cmakedefine01 WITH_CURL
- #cmakedefine01 WITH_SSLCURL
- #cmakedefine01 WITH_ACL
--#cmakedefine01 WITH_XATTR
-+#cmakedefine01 USE_XATTR
- #cmakedefine01 USE_SOLVER_LIBSOLV
- #cmakedefine01 USE_SOLVER_INTERNAL
- #cmakedefine01 WITH_GPGME
-diff --git a/libopkg/CMakeLists.txt b/libopkg/CMakeLists.txt
-index 628cb8c..39064c2 100644
---- a/libopkg/CMakeLists.txt
-+++ b/libopkg/CMakeLists.txt
-@@ -182,7 +182,7 @@ if(WITH_SSLCURL)
-     target_link_libraries(libopkg OpenSSL::Crypto OpenSSL::SSL)
- endif()
- 
--if(USE_ACL)
-+if(WITH_ACL)
-     pkg_check_modules(acl REQUIRED IMPORTED_TARGET libacl)
-     target_link_libraries(libopkg PkgConfig::acl)
- endif()
-diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
-index 48f80c0..fb40db3 100644
---- a/libopkg/opkg_archive.c
-+++ b/libopkg/opkg_archive.c
-@@ -914,11 +914,11 @@ struct opkg_ar *ar_open_pkg_data_archive(const char *filename)
-     ar->extract_flags = ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
-         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_NO_OVERWRITE;
- 
--#ifdef USE_ACL
-+#if WITH_ACL
-     ar->extract_flags |= ARCHIVE_EXTRACT_ACL;
- #endif
- 
--#ifdef USE_XATTR
-+#if USE_XATTR
-     ar->extract_flags |= ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XATTR;
- #endif
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
similarity index 94%
rename from meta/recipes-devtools/opkg/opkg_0.9.0.bb
rename to meta/recipes-devtools/opkg/opkg_0.10.0.bb
index 7551f1bc49..debcd94a30 100644
--- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.10.0.bb
@@ -15,12 +15,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0002-config.h.in-fix-typo.patch \
-           file://0003-cmake-fix-WITH_ACL-and-USE_XATTR.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "440ef321862e01f83da4d02884a0cbb4d9d7b32f82faa81a6a85493f0c89d0f5"
+SRC_URI[sha256sum] = "4d099e010a5d262b34184fee4766bc60a8c7439741fb210aa11d51704afd04d1"
 
 # This needs to be before ptest inherit, otherwise all ptest files end packaged
 # in libopkg package if OPKGLIBDIR == libdir, because default
-- 
2.47.3


