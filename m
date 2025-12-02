Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C4ED12662
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 17:44:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1911.1764697463719811663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 09:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=RNt9/fYP;
 spf=pass (domain: snapchat.com, ip: 209.85.208.49, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so2736989a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 09:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764697462; x=1765302262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMMzL2kMnHmPCEgiQQ8qTpWbeKFob2X7csegCo3Cj2Q=;
        b=RNt9/fYPeBJlVB6GHVfz6EunXQi08b58OrtsnIY0Zif+dghexiiHD8kBwdoherdSSA
         /Oc/3iOvZCQ2q+t+FlC74j4V6mXvpo3upMZsRaKH94iBYd7biHqxMphAiLO3Htvoa21E
         0voPsXz5tmBqzxtBT7df5obSGu0xAOSjwrwu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764697462; x=1765302262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMMzL2kMnHmPCEgiQQ8qTpWbeKFob2X7csegCo3Cj2Q=;
        b=nZHhtiTwMbX3ody+IMiqIfjA5i1aOn8nfHm57emdJ7S5+rJ07dKQlXqdutDZHmlRRo
         TaMeIT8C4qGxHQBzHfdpRCNVxp0fKKR316LfxmbyL5p0OcMES84YVM5PG2CZrn1qfV3v
         +LAE5rbdrYHVC3lJe0F+r908AEUFaP5N1LxSCEu6x+NB4X7wT2VwzCSpVRr9TDEe5/Y0
         tuFSLacIMexd7sKXLUcJryZa4eJzCxKlXJrsboUUM79iGDOb7b88QXBQQsHVoq8Jb3Wn
         OWL4r8gCyjbryWx+OPfCNRcoouj/x+k6y7W7sDaP4pqE5Q66/GPADcs1SYkukenz8Xq+
         BWsA==
X-Gm-Message-State: AOJu0YwXJ35mMBwv1DLTxLVw761DarhtH9Uo1ef4WVChE/tlLu2aR4Ko
	3oiExujUCn39M4GCgK4l56o96c0G/L796+jS0ywf3ZyBMBSxdYYRUMe1kbjawfLAtVSu2JpTffJ
	V3255+Go=
X-Gm-Gg: ASbGnctQMacmZsW64pmi72RwAsA637FW0bnzoi3Xmkp0Mckv+BxEj3UDJTBwe9xiaY9
	QgBby7bXu8RBSKfjK7HPHP0ipeFdY0M3phQDG6jW6tTpBRC2m9FEr+RJrktquTCafmUFug4/wnT
	6I1ta8nKt7aQ2WGjppyb7anAPxM7Dn2Xnfzdjiy4p81mjhdsmz7fjENwjinIfUxQiWZAP9Q5C6X
	RCqOEPb88kse1r+j0Syv+m53PYLeYhZw6fwmj1d94NZZGKciB+3VORAx/BGYSWRJQQ/Fxq/DmJG
	36ngKBjHQxntxc8ad9XdgC6WGQV/cRHAq1Gy1WP8soGccpggjaI8KJOIkDSqcYeu0L+bSK/0lO0
	9OBLXTYkkCpgYUw74tJ92VoSGIwQqG9SeOsKbHqZVgb30I4t+oWB1AbI8SyVGYIXbben4T78EQX
	/XsW38FOola4lFcshdRbMWCHrvLgFCgDm5ZifoW9Gj5ir5GSvyfKHdxqE=
X-Google-Smtp-Source: AGHT+IHYae3PGZVRgiwO02fS4fACr4imuWhSJUz7iRNWP53pZH8Lc/H24/cOvWdkde7tOd/mDNCqeg==
X-Received: by 2002:a05:6402:2549:b0:647:6ec9:8d8b with SMTP id 4fb4d7f45d1cf-6476ec98dc4mr10849869a12.34.1764697461852;
        Tue, 02 Dec 2025 09:44:21 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647641453d7sm11331329a12.13.2025.12.02.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 09:44:21 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] opkg: fix WITH_ACL and USE_ATTR being enabled per default
Date: Tue,  2 Dec 2025 18:44:14 +0100
Message-ID: <20251202174414.2547206-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Dec 2025 17:44:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227182

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
2.49.1


