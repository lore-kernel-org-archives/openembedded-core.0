Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.21516.1630932700364784737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 05:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C90yaDmY;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: purushottamchoudhary29@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id q21so3886381plq.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 05:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=GXZ5GRn/WXOk3TEDiYGfcPJLnXhMaIYGedSUljaACq0=;
        b=C90yaDmY5CZMQJu3wdrmwbZkSbNoq+c1pkqPe9FvB/3arC+2seQspyIosKt0HsHvcN
         Wp8YCeH3YiJymVMsrU+d4cGARS0WE0iExi2V1r3mCU07uXoZ8oZZIouQjHYT5dbWBD8r
         uSIjqgSHEp5OUp2LN10mxEZ4OxywL9i7XbKhQFASWtpG+5z6Z8FMMfjhGlreqVgPtqpa
         ZLpmMjsymntC4q2mDtZCaEkh6EL7tFAHimZTkfzeh7c9hcpTteLhKeQt8NKxDONiHXsO
         Gopiy8LkP1luMo1wXkgzsrzLooRVjz6tujE227cahHJ7nrGimUYqjMl5w5nA6yS6+B4e
         uHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=GXZ5GRn/WXOk3TEDiYGfcPJLnXhMaIYGedSUljaACq0=;
        b=bXJ0tZCAsda11p8oPy9ZjrLvpniJgcbmAFmmlC0kyE1GTz3eLqOhIbOPbXnT3ET/A4
         htAS9Rb07DXP/XRl30qkg8/BpSNmlJv86q7wsseGZG+eojNVVqYwsS48/OTnmklCeiVJ
         PcCbno9QUCAgy9D5Xgw+TIhe/VWhrlgn2yHvK+7Xr/59vrf92xWelHVFeps3j9LZyyGD
         3/8ByZv38mUJdhrB/vbD/qpmyjTjPK6JeAel2/KDeyrZ9MGmNAXed4Zk8b8n7MCQJP8D
         czkCdwEEXfAAFoeZzpNI92L+lpUAcuG7lJuwYRVgMLG4J4VaL3xFVxHIVwURqpQ87psp
         u86g==
X-Gm-Message-State: AOAM533RBTC5FtmW1o777SaF8AbDXwR+TMGNWtmMgnf3+fOuSJU7s5Fr
	N7mXMsq8bjgTB16NTOPogrm81GAqb1loA8Y7
X-Google-Smtp-Source: ABdhPJy9DOD2YW3cqda//NkY9pWa5gvhq34+HDxmHwPUD2sOOHpaGQeRhAdGjOZ0Ka+zbHmShdvpRA==
X-Received: by 2002:a17:90a:4b4d:: with SMTP id o13mr13808487pjl.236.1630932699533;
        Mon, 06 Sep 2021 05:51:39 -0700 (PDT)
Return-Path: <purushottamchoudhary29@gmail.com>
Received: from localhost.localdomain ([2405:201:a410:a032:91c7:4f0:be90:6827])
        by smtp.gmail.com with ESMTPSA id v6sm7548268pjr.41.2021.09.06.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 05:51:39 -0700 (PDT)
From: "Purushottam Choudhary" <purushottamchoudhary29@gmail.com>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Cc: Mikko.Rapeli@bmw.de,
	nisha.parrakat@kpit.com
Subject: [poky][master][PATCH] assimp: Fix path for _IMPORT_CHECK_FILES_FOR_assimp
Date: Mon,  6 Sep 2021 18:21:27 +0530
Message-Id: <20210906125127.6603-1-purushottamchoudhary29@gmail.com>
X-Mailer: git-send-email 2.17.1

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
index 0000000000..11f1da6f3b
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
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Signed-off-by: Purushottam Choudhary <purushottam.choudhary@kpit.com>
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
index 89c555f08e..3a1f850f64 100644
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

