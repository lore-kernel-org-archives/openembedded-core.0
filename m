Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.7565.1631612751521960334
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 02:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MfVHCBAr;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id f129so12190486pgc.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s+uVpVhdc99KC1gtjTpdsZeVhj75E2PVCGpj+7oA4rw=;
        b=MfVHCBArMbjt0ElJSRBZYfYaeEYH77C+9QkZ8cAjzi9Vt88coOZSIfdLfUqNBZL62B
         4PrCifmsm3cqMvjKkxgsYv+e2889MfJEIuG1R6oZLM3wuLLZffVEMXKy1jkWsevmENux
         nDTKRdzrR5OIl9AmNdIaEdzEpl9pwGPvY/WihAjNiBE+HFne29nwdEHP7Z7oWLiKFYPJ
         MLiUF6y3LutFMa0pLBpt7rTXqpdX7jLTrX4j25xz1/DOoK2zLW2n3vazcq+bEo5yatUb
         ljQo/wbCZuJCjyzhJ3kapftGK64yECxRnGDGyJE/Jx/gsEdb808jTy99upIMFuiZcD08
         TNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s+uVpVhdc99KC1gtjTpdsZeVhj75E2PVCGpj+7oA4rw=;
        b=79wPG9KnNtVL7PM8mqYRvP38Nb2Nsn5WRBVsySzN2pp78jWMyqkE72eoeLnTHXHez6
         gEiN5IFNW4Le/ryxlUhgEUmU5B3QeYUNKz/CdysvKs153KSxDzdv9KFsx6qLgZRK9V9z
         a+eapybr3RS05T3+zpjsGa6fzI0TtqT477TgbOZl9bWpkycccU2LjjAOqscNu+DDYeVa
         r+g96GbjA6MEHgnG84FvlCTa97/88AgadanVv1cTaUBK2Vj2PnHY8fPCn8Ulk0u0E6B+
         SUkTgP9ui7pWV08ykySMi7worbSG6dUzTAoHCUdCzay4YjbdC6Vs6QH8ojhh/AwwaiPO
         lf/Q==
X-Gm-Message-State: AOAM530DUdurUPTktLYpUnfKwxqIS7TXxB+cC6XGU91iyHpsGaAIUoQK
	g6dtDwMNo7OyNgARo0/loZfUzs5olRZRjvLF
X-Google-Smtp-Source: ABdhPJzZqFZfDcnFMxVaVWsI9UTG89XIdzkT9XngJvD9G7HRQUSxZJhYRMlLmdxbRSZMeG6qFiWTgQ==
X-Received: by 2002:a63:3c5d:: with SMTP id i29mr14726515pgn.415.1631612750627;
        Tue, 14 Sep 2021 02:45:50 -0700 (PDT)
Return-Path: <purushottamchoudhary29@gmail.com>
Received: from localhost.localdomain ([2405:201:a410:a032:9452:3b41:e50c:d46d])
        by smtp.gmail.com with ESMTPSA id bb17sm998613pjb.45.2021.09.14.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 02:45:50 -0700 (PDT)
From: "Purushottam Choudhary" <purushottamchoudhary29@gmail.com>
X-Google-Original-From: Purushottam Choudhary <purushottam.Choudhary@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: mikko.rapeli@bmw.de,
	nisha.parrakat@kpit.com,
	Purushottam Choudhary <purushottamchoudhary29@gmail.com>
Subject: [OE-core][dunfell][PATCH 2/2] assimp: Fix path for _IMPORT_CHECK_FILES_FOR_assimp
Date: Tue, 14 Sep 2021 15:15:26 +0530
Message-Id: <20210914094526.30291-2-purushottam.Choudhary@kpit.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914094526.30291-1-purushottam.Choudhary@kpit.com>
References: <20210914094526.30291-1-purushottam.Choudhary@kpit.com>

From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>

Fix path for _IMPORT_CHECK_FILES_FOR_assimp
As it is giving configuration error during validation of path
when used by 3rd party component to configure itself
using assimp::assimp target.
Compute the installation prefix relative to file.

Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
---
 ...h-for-_IMPORT_CHECK_FILES_FOR_assimp.patch | 93 +++++++++++++++++++
 ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch | 32 -------
 meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |  2 +-
 3 files changed, 94 insertions(+), 33 deletions(-)
 create mode 100644 meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
 delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch

diff --git a/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
new file mode 100644
index 0000000000..61c40a33c8
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/assimp/0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch
@@ -0,0 +1,93 @@
+From 330914fed75cde09f48553cae92bed89925d98d8 Mon Sep 17 00:00:00 2001
+From: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
+Date: Mon, 6 Sep 2021 16:30:38 +0530
+Subject: [PATCH] Fix path for _IMPORT_CHECK_FILES_FOR_assimp
+
+Fix path for _IMPORT_CHECK_FILES_FOR_assimp
+As it is giving configuration error during validation of path
+when used by 3rd party component to configure itself
+using assimp::assimp target.
+Compute the installation prefix relative to file.
+
+Upstream-Status: Submitted [https://github.com/assimp/assimp/pull/4071]
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottamchoudhary29@gmail.com>
+---
+ assimpTargets-release.cmake.in | 10 +++++-----
+ assimpTargets.cmake.in         | 12 ++++++++++++
+ 2 files changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
+index a416e8899..cd91e1277 100644
+--- a/assimpTargets-release.cmake.in
++++ b/assimpTargets-release.cmake.in
+@@ -46,8 +46,8 @@ if(MSVC)
+       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${importLibraryName}")
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_BINDIR@/${sharedLibraryName}" )
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${importLibraryName}")
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/bin/${sharedLibraryName}")
+   else()
+     set(staticLibraryName "assimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
+ 
+@@ -57,7 +57,7 @@ if(MSVC)
+       IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/${staticLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}")
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}")
+   endif()
+ 
+ else()
+@@ -73,14 +73,14 @@ else()
+       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${sharedLibraryName}" )
+   else()
+     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
+     set_target_properties(assimp::assimp PROPERTIES
+       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}"
+     )
+     list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
+-    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${staticLibraryName}" )
++    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "${_IMPORT_PREFIX}/lib/${staticLibraryName}" )
+   endif()
+ endif()
+ 
+diff --git a/assimpTargets.cmake.in b/assimpTargets.cmake.in
+index ef90c834a..140386660 100644
+--- a/assimpTargets.cmake.in
++++ b/assimpTargets.cmake.in
+@@ -40,6 +40,15 @@ unset(_targetsDefined)
+ unset(_targetsNotDefined)
+ unset(_expectedTargets)
+ 
++# Compute the installation prefix relative to this file.
++get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
++get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
++if(_IMPORT_PREFIX STREQUAL "/")
++  set(_IMPORT_PREFIX "")
++endif()
++
+ # Create imported target assimp::assimp
+ if(@BUILD_SHARED_LIBS@)
+   add_library(assimp::assimp SHARED IMPORTED)
+@@ -65,6 +74,9 @@ foreach(f ${CONFIG_FILES})
+   include(${f})
+ endforeach()
+ 
++# Cleanup temporary variables.
++set(_IMPORT_PREFIX)
++
+ # Loop over all imported files and verify that they actually exist
+ foreach(target ${_IMPORT_CHECK_TARGETS} )
+   foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
+--
+2.17.1
diff --git a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch b/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
deleted file mode 100644
index 1078148d6b..0000000000
--- a/meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
-Date: Fri, 13 Aug 2021 16:42:48 +0530
-Subject: [PATCH] assimp: remove shared lib from _IMPORT_CHECK_TARGETS
-
-In the target assimp::assimp shared library verification removed
-as it is giving configuration error when used by 3rd part component to
-configure itself using assimp::assimp target
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
----
- assimpTargets-release.cmake.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/assimpTargets-release.cmake.in b/assimpTargets-release.cmake.in
-index cd2fac7e0..52edc7990 100644
---- a/assimpTargets-release.cmake.in
-+++ b/assimpTargets-release.cmake.in
-@@ -72,8 +72,8 @@ else()
-       IMPORTED_SONAME_RELEASE "${sharedLibraryName}"
-       IMPORTED_LOCATION_RELEASE "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}"
-     )
--    list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
--    list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
-+    #list(APPEND _IMPORT_CHECK_TARGETS assimp::assimp )
-+    #list(APPEND _IMPORT_CHECK_FILES_FOR_assimp::assimp "@CMAKE_INSTALL_FULL_LIBDIR@/${sharedLibraryName}" )
-   else()
-     set(staticLibraryName "libassimp${ASSIMP_LIBRARY_SUFFIX}@CMAKE_STATIC_LIBRARY_SUFFIX@")
-     set_target_properties(assimp::assimp PROPERTIES
---
-2.17.1
diff --git a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
index a81be08481..154d17d26b 100644
--- a/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
+++ b/meta/recipes-graphics/vulkan/assimp_5.0.1.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 SRC_URI = "git://github.com/assimp/assimp.git;branch=assimp_5.0_release \
            file://0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch \
            file://use-GNUInstallDirs-where-possible.patch \
-           file://0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch \
+           file://0001-Fix-path-for-_IMPORT_CHECK_FILES_FOR_assimp.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
 
-- 
2.17.1

