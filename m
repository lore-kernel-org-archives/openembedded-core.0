Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D868EC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:22:14 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.15509.1638555734442693419
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=svH9FeCv;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id j11so3887845pgs.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=B5SL1vmQbfFDO3JxImrjqt7EKuzaGyQZh60tA1A7DJw=;
        b=svH9FeCviQkdpy0xjiCmBSJXmtgbwNnIw2vQ5kEGo7aYERMLH/A/DDfT/83rl0mJdM
         2WW/McJCqS15mJG7Rpdd1IJrYFMEFqfsoAwF8Wql6aEpZUfOI4Zw18BjgF2otKFBUN+N
         63xICdmm138Zz3A8ZvSDAUWtEJxhaCUA0KlkzsoJgPwjLoyBtmALab7Schsz7GIoM3DN
         B+gLu6WXIRSOlJVYhCc7a1EatcMVKW6rgDI/Hfk0RPGl7VvzeBHl1lk6ZY7PnGW1u6Oy
         sCx3fH+ZGn3zxEpZGfe7gF5VOfnHw98fATTOFco4a7D8FqpMk/GCWmWv/OQmnred+DL4
         x8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5SL1vmQbfFDO3JxImrjqt7EKuzaGyQZh60tA1A7DJw=;
        b=LQQBA/RRrAvaK4UKY7rwjsqJgkZAK8Lc+uuwvKLj+uX0tjVCA9fl7rKBiw1vXTPCCg
         zb9Vm/sZAFRePRSZKfc6IQ4fvHHSIbfBuFXWVRzGVttBzdaYro9/aWPVZYe9lItaTL+T
         0/ooVOMMZRk1aDyztvCVvgySD9cWxbFW2+SPWjK0QQw6Krd5/k81/AGR86EFIwxsztat
         pHKEshPkS6CVGUIb2tko3wQI5gXuHWxCeo/3Yv1xiZhd6L0Oy7DdDaycCoNpX0YTjDVB
         mIuN2qK/5yfyyb0E9qiqEjaskLe2emHldy/QwbKXOsmqYIngYmKjXWsQzwzCEsxapnAI
         FOVw==
X-Gm-Message-State: AOAM531rahZ7lcWyePo7tm0v960BJ1GP0YMF84ASPkVEp7Wnoh0Oj6RO
	pr8NTPW7uspoF9L2ly3HZtdd7+mOQCq4DS6Y7sw=
X-Google-Smtp-Source: 
 ABdhPJzcK/A2rVBgdHksxivPEqxEi78xol51xmvie9+RTEoqM1jX9zTxIswMa6w+yiKC9gUOAyxhDQ==
X-Received: by 2002:a62:924e:0:b0:4a2:82d7:1244 with SMTP id
 o75-20020a62924e000000b004a282d71244mr20541084pfd.50.1638555733233;
        Fri, 03 Dec 2021 10:22:13 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.22.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:22:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/18] cmake: FindGTest: Add target for gmock
 library
Date: Fri,  3 Dec 2021 08:19:03 -1000
Message-Id: 
 <80ab29b962cea17a4f2486ad25577bc830cdd8d9.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:22:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159143

From: Eero Aaltonen <eero.aaltonen@vaisala.com>

`googlemock` has been absorbed into the
[googletest](https://github.com/google/googletest) project and is built
and installed from the same source tree.

`googletest` has provided a CMake Config-file Package starting with
GTest 1.8.1. `find_package(GTest ...)` by default dispatches first to
CMake Find Module. Starting with CMake commit
2327b4330cce157d616ff8b611b3e77568d00351 in CMake v3.20.0 the module
dispatches onward to the Config-file Package so that the same targets
are available. In pre v3.20.0 versions of CMake however the Find Module
masks the targets provided by the upstream `GTest` package.

Update `Modules/FindGTest.cmake` to provide the same targets as the
CMake Config-file Package and backwards compatible targets and result
variables.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../cmake/cmake-native_3.16.5.bb              |   1 +
 ...ndGTest-Add-target-for-gmock-library.patch | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
index b2952ee5f5..96a7be6770 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
+            file://0006-cmake-FindGTest-Add-target-for-gmock-library.patch \
             "
 
 
diff --git a/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch b/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
new file mode 100644
index 0000000000..267f586a71
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
@@ -0,0 +1,255 @@
+From 39eae0d6c1b398f18761abac7f55944f0290f8a1 Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@iki.fi>
+Date: Sun, 17 Oct 2021 17:13:07 +0300
+Subject: [PATCH] FindGTest: Add target for gmock library
+
+`googlemock` has been absorbed into the
+[googletest](https://github.com/google/googletest) project and is built
+and installed from the same source tree.
+
+As GTest may be built with or without GMock, skip GMock if it is not
+present.
+
+Do not provide result variables for GMock.  They are not provided by
+upstream GTest's CMake Package Configuration File.
+
+Also update the test case to cover linking to `GTest::gmock`.
+
+The patch was imported from the Kitware git server
+(git@gitlab.kitware.com:cmake/cmake.git) as of commit id
+50bf457a0dd857cf976b22c5be7d333493233d1e
+
+Patch was modified to support upper case variable `GTEST_FOUND`.
+
+Upstream-Status: Accepted [https://gitlab.kitware.com/cmake/cmake/-/merge_requests/6632]
+Milestone: 3.23.0
+
+Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+---
+ .../dev/FindGTest-target-for-gmock.rst        |   4 +
+ Modules/FindGTest.cmake                       | 133 +++++++++++++++---
+ Tests/FindGTest/Test/CMakeLists.txt           |   4 +
+ 3 files changed, 121 insertions(+), 20 deletions(-)
+ create mode 100644 Help/release/dev/FindGTest-target-for-gmock.rst
+
+diff --git a/Help/release/dev/FindGTest-target-for-gmock.rst b/Help/release/dev/FindGTest-target-for-gmock.rst
+new file mode 100644
+index 0000000000..f78242c80e
+--- /dev/null
++++ b/Help/release/dev/FindGTest-target-for-gmock.rst
+@@ -0,0 +1,4 @@
++FindGTest-target-for-gmock
++--------------------------
++
++* The :module:`FindGTest` module now provides a target for GMock, if found.
+diff --git a/Modules/FindGTest.cmake b/Modules/FindGTest.cmake
+index e015a9840f..0331049594 100644
+--- a/Modules/FindGTest.cmake
++++ b/Modules/FindGTest.cmake
+@@ -7,10 +7,23 @@ FindGTest
+ 
+ Locate the Google C++ Testing Framework.
+ 
++.. versionadded:: 3.20
++  Upstream ``GTestConfig.cmake`` is used if possible.
++
+ Imported targets
+ ^^^^^^^^^^^^^^^^
+ 
+-This module defines the following :prop_tgt:`IMPORTED` targets:
++  This module defines the following :prop_tgt:`IMPORTED` targets:
++
++``GTest::gtest``
++  The Google Test ``gtest`` library, if found; adds Thread::Thread
++  automatically
++``GTest::gtest_main``
++  The Google Test ``gtest_main`` library, if found
++
++.. deprecated:: 3.20
++  For backwards compatibility, this module defines additionally the
++  following deprecated :prop_tgt:`IMPORTED` targets (available since 3.5):
+ 
+ ``GTest::GTest``
+   The Google Test ``gtest`` library, if found; adds Thread::Thread
+@@ -18,7 +31,6 @@ This module defines the following :prop_tgt:`IMPORTED` targets:
+ ``GTest::Main``
+   The Google Test ``gtest_main`` library, if found
+ 
+-
+ Result variables
+ ^^^^^^^^^^^^^^^^
+ 
+@@ -146,8 +158,42 @@ function(__gtest_import_library _target _var _config)
+     endif()
+ endfunction()
+ 
++function(__gtest_define_backwards_compatible_library_targets)
++    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES} PARENT_SCOPE)
++
++    # Add targets mapping the same library names as defined in
++    # older versions of CMake's FindGTest
++    if(NOT TARGET GTest::GTest)
++        add_library(GTest::GTest INTERFACE IMPORTED)
++        target_link_libraries(GTest::GTest INTERFACE GTest::gtest)
++    endif()
++    if(NOT TARGET GTest::Main)
++        add_library(GTest::Main INTERFACE IMPORTED)
++        target_link_libraries(GTest::Main INTERFACE GTest::gtest_main)
++    endif()
++endfunction()
++
+ #
+ 
++include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
++
++# first specifically look for the CMake version of GTest
++find_package(GTest QUIET NO_MODULE)
++
++# if we found the GTest cmake package then we are done, and
++# can print what we found and return.
++if(GTest_FOUND)
++    set(GTEST_FOUND ${GTest_FOUND})
++    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest HANDLE_COMPONENTS CONFIG_MODE)
++
++    set(GTEST_LIBRARIES      GTest::gtest)
++    set(GTEST_MAIN_LIBRARIES GTest::gtest_main)
++
++    __gtest_define_backwards_compatible_library_targets()
++
++    return()
++endif()
++
+ if(NOT DEFINED GTEST_MSVC_SEARCH)
+     set(GTEST_MSVC_SEARCH MD)
+ endif()
+@@ -194,50 +240,97 @@ if(MSVC AND GTEST_MSVC_SEARCH STREQUAL "MD")
+     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtest-mdd gtestd)
+     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main-md  gtest_main)
+     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_main-mdd gtest_maind)
++    __gtest_find_library(GMOCK_LIBRARY            gmock-md  gmock)
++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmock-mdd gmockd)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main-md  gmock_main)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_main-mdd gmock_maind)
+ else()
+     __gtest_find_library(GTEST_LIBRARY            gtest)
+     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtestd)
+     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main)
+     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_maind)
++    __gtest_find_library(GMOCK_LIBRARY            gmock)
++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmockd)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_maind)
+ endif()
+ 
+-include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
+ FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest DEFAULT_MSG GTEST_LIBRARY GTEST_INCLUDE_DIR GTEST_MAIN_LIBRARY)
+ 
+-if(GTEST_FOUND)
++if(GMOCK_LIBRARY AND GMOCK_MAIN_LIBRARY)
++    set(GMock_FOUND True)
++else()
++    set(GMock_FOUND False)
++endif()
++
++if(GTest_FOUND)
+     set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
+     __gtest_append_debugs(GTEST_LIBRARIES      GTEST_LIBRARY)
+     __gtest_append_debugs(GTEST_MAIN_LIBRARIES GTEST_MAIN_LIBRARY)
+-    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES})
+ 
+     find_package(Threads QUIET)
+ 
+-    if(NOT TARGET GTest::GTest)
++    if(NOT TARGET GTest::gtest)
+         __gtest_determine_library_type(GTEST_LIBRARY)
+-        add_library(GTest::GTest ${GTEST_LIBRARY_TYPE} IMPORTED)
++        add_library(GTest::gtest ${GTEST_LIBRARY_TYPE} IMPORTED)
+         if(TARGET Threads::Threads)
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_LINK_LIBRARIES Threads::Threads)
+         endif()
+         if(GTEST_LIBRARY_TYPE STREQUAL "SHARED")
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_COMPILE_DEFINITIONS "GTEST_LINKED_AS_SHARED_LIBRARY=1")
+         endif()
+         if(GTEST_INCLUDE_DIRS)
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_INCLUDE_DIRECTORIES "${GTEST_INCLUDE_DIRS}")
+         endif()
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "")
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "RELEASE")
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "DEBUG")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "DEBUG")
+     endif()
+-    if(NOT TARGET GTest::Main)
++    if(NOT TARGET GTest::gtest_main)
+         __gtest_determine_library_type(GTEST_MAIN_LIBRARY)
+-        add_library(GTest::Main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
+-        set_target_properties(GTest::Main PROPERTIES
+-            INTERFACE_LINK_LIBRARIES "GTest::GTest")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "RELEASE")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "DEBUG")
++        add_library(GTest::gtest_main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
++        set_target_properties(GTest::gtest_main PROPERTIES
++            INTERFACE_LINK_LIBRARIES "GTest::gtest")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "DEBUG")
++    endif()
++
++    __gtest_define_backwards_compatible_library_targets()
++endif()
++
++if(GMock_FOUND)
++    if(NOT TARGET GTest::gmock)
++        __gtest_determine_library_type(GMOCK_LIBRARY)
++        add_library(GTest::gmock ${GMOCK_LIBRARY_TYPE} IMPORTED)
++        set(_gmock_link_libraries "GTest::gtest")
++        if(TARGET Threads::Threads)
++            list(APPEND _gmock_link_libraries Threads::Threads)
++        endif()
++        set_target_properties(GTest::gmock PROPERTIES
++            INTERFACE_LINK_LIBRARIES "${_gmock_link_libraries}")
++        if(GMOCK_LIBRARY_TYPE STREQUAL "SHARED")
++            set_target_properties(GTest::gmock PROPERTIES
++                INTERFACE_COMPILE_DEFINITIONS "GMOCK_LINKED_AS_SHARED_LIBRARY=1")
++        endif()
++        if(GTEST_INCLUDE_DIRS)
++            set_target_properties(GTest::gmock PROPERTIES
++                INTERFACE_INCLUDE_DIRECTORIES "${GTEST_INCLUDE_DIRS}")
++        endif()
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "")
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "DEBUG")
++    endif()
++    if(NOT TARGET GTest::gmock_main)
++        __gtest_determine_library_type(GMOCK_MAIN_LIBRARY)
++        add_library(GTest::gmock_main ${GMOCK_MAIN_LIBRARY_TYPE} IMPORTED)
++        set_target_properties(GTest::gmock_main PROPERTIES
++            INTERFACE_LINK_LIBRARIES "GTest::gmock")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "DEBUG")
+     endif()
+ endif()
+diff --git a/Tests/FindGTest/Test/CMakeLists.txt b/Tests/FindGTest/Test/CMakeLists.txt
+index b65b9d28f6..7d3a378a65 100644
+--- a/Tests/FindGTest/Test/CMakeLists.txt
++++ b/Tests/FindGTest/Test/CMakeLists.txt
+@@ -12,3 +12,7 @@ add_executable(test_gtest_var main.cxx)
+ target_include_directories(test_gtest_var PRIVATE ${GTEST_INCLUDE_DIRS})
+ target_link_libraries(test_gtest_var PRIVATE ${GTEST_BOTH_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+ add_test(NAME test_gtest_var COMMAND test_gtest_var)
++
++add_executable(test_gmock_tgt main.cxx)
++target_link_libraries(test_gmock_tgt GTest::gmock_main)
++add_test(NAME test_gmock_tgt COMMAND test_gmock_tgt)
+-- 
+2.17.1
+
-- 
2.25.1


