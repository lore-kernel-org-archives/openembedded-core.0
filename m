Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A7BAC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:04:27 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6853.1783512259980227070
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xo+dWBfl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b966dd74so2197495e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512258; x=1784117058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ANC9ScdiTUcVpN8ARUOvJnQJlT9vT+YSbGMMsJKXwA=;
        b=Xo+dWBflQ8mfBoHxL2BPrrXzOMl0QouK/B4ZP2XyzW8f+b6oQvDW4xhdswhnJZq56s
         o5i3fEYMnjARAARx6alcR6HJBmall1MXgXlSQ+3rWD7m4NZNLhpwWkQQGX6CbbZMlelI
         kfhqA4mVbmd+4DiAQGNaCdAZ9pkpmN6F4hxUw6WVKDdcuKpFn/V52mlZH+af3gAZaiEv
         7TMWeKqCqNlPCjkFQ0jWeVWV+5rYPDGJbNbedkq+Bt9zGwgn8sAKuMw1zWfvgeegj1c7
         Y4JkYEWY2oTcsQClqpIuxHoajQ61cg+lF/Vr0xDI2SyTslvkI1KHdRTSvkUnMuVlLxFP
         LeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512258; x=1784117058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ANC9ScdiTUcVpN8ARUOvJnQJlT9vT+YSbGMMsJKXwA=;
        b=HAQh3DnZwklebMi+579Qu3X5bmvborzSEQsPa+djiOvJG6BcP6pSHuTwOe1/saLmjX
         RoAvEhCh94H0/hWrhrseBuWMAfFCqpP0f6pWz1NSFKliNGVWR/mhwDf/GIcvfVlGbirM
         V6ZMs8u/pkSIr+ASrzm3lpxL3MYxYZL6bh54djQSeMi2+91k6RLM4ps+MUrY1XtOebig
         PQHDg/UOyyQgI9IKtsahwctHecKlgOSn5zTkIigOt9zGAtk0OsYCfiFxE5T5139g7TrW
         LvpD7FobjPlM7RRgLM0Lb8PRgp4LFAs+kfsuJIShUn11vsHcZ+tai0i6V8rSUqfdw9gg
         M1jw==
X-Gm-Message-State: AOJu0YxoPh3gfYC/PHW67ANt8QJFy1NbpHgM/4RmEuOQnVgT2qx5IjTe
	RVp1aqWJ/QHms72IKbMKiFxoN6ja8jtkcz2CF+/bLtslvUijsEsSy5fHcMHYMA==
X-Gm-Gg: AfdE7cme5vkbierH2e4ssV9ueV1Rm+kVXbGRpCYbYk64rT5MDZ/tDPnSaBSMY+6amfh
	0M/fD7mJS1+xF0HENHsZRriCBeTJMlhRc31zLaDsSA+FY06q/VtxF27ax84n+oN8MFnj6CkxA57
	Zfra0Ux+w4vI36E5WTdn6/wBf/Aeh24VPTgWSA/JAgsF0juwiDJ5iHv/kl2NNdoN9H8li7G4Tzt
	MkEpKXfCrNuzt/v8v+L6o8scLBNTE1DAa+UHl53mM/T+fFGAlXPY0b2M6xQ2PLF/+fr2oA15nuQ
	sid0JksptXa5wthkzWvNznL1codxkLOtY8vjxHrMH59ICEIudoDsdrBSEqVVopz6u2RvzDChOqA
	n709zAsgWaO8jX2rJtfK1Z7gCLOAMO27nHhZX6ft/x4yGpJvFhy/YewS9TNk5mVN8EDSNnaeElr
	NStlKEzimlV9VEAxIzqj6ouRSuRiKiTjzbOqD9Ye5ZJVVxp+SL
X-Received: by 2002:a05:600c:3b0d:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-493e68678b9mr20517695e9.27.1783512257992;
        Wed, 08 Jul 2026 05:04:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f40912sm128049445e9.4.2026.07.08.05.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:04:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] libical: upgrade 3.0.20 -> 4.0.3
Date: Wed,  8 Jul 2026 14:04:13 +0200
Message-ID: <20260708120413.3112969-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:04:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240479

From: Alexander Kanavin <alex@linutronix.de>

Drop -DSHARED_ONLY=True (replaced upstream with LIBICAL_STATIC, false by default).

Drop 0001-cmake-Do-not-export-CC-into-gir-compiler.patch (merged upstream).

Rebase flags.patch (couldn't find evidence of ical-glib-static and so
that chunk was dropped).

Rework various upstream cmake options.

License-Update: file renamed, additional information added at the bottom:
https://github.com/libical/libical/blob/v4.0.3/LICENSE.txt
LGPL/MPL texts aren't necessary to track, as LICENSE.txt specifies
what the actual terms are.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/no-static-libs.inc   |  1 -
 ...e-Do-not-export-CC-into-gir-compiler.patch | 30 -------------
 .../libical/libical/flags.patch               | 42 +++++++++----------
 .../{libical_3.0.20.bb => libical_4.0.3.bb}   | 19 ++++-----
 4 files changed, 29 insertions(+), 63 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
 rename meta/recipes-support/libical/{libical_3.0.20.bb => libical_4.0.3.bb} (74%)

diff --git a/meta/conf/distro/include/no-static-libs.inc b/meta/conf/distro/include/no-static-libs.inc
index 75359928a1..cf26873992 100644
--- a/meta/conf/distro/include/no-static-libs.inc
+++ b/meta/conf/distro/include/no-static-libs.inc
@@ -23,7 +23,6 @@ DISABLE_STATIC:pn-musl = ""
 
 EXTRA_OECONF:append = "${DISABLE_STATIC}"
 
-EXTRA_OECMAKE:append:pn-libical = " -DSHARED_ONLY=True"
 EXTRA_OECMAKE:append:pn-libjpeg-turbo = " -DENABLE_STATIC=False"
 EXTRA_OECMAKE:append:pn-libjpeg-turbo-native = " -DENABLE_STATIC=False"
 
diff --git a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
deleted file mode 100644
index 4027c218c5..0000000000
--- a/meta/recipes-support/libical/libical/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7b20ca7f24a4cac25998bfcc70eed75bf796816b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Mar 2022 20:10:04 -0800
-Subject: [PATCH] cmake: Do not export CC into gir compiler
-
-this helps cross compilers where full compiler commandline defines the
-compiler rather than just CC variable, therefore let it use the default
-values from environment and not synthesize it from CMAKE_C_COMPILER just
-for this case.
-
-Upstream-Status: Backport [https://github.com/libical/libical/pull/552]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/modules/GObjectIntrospectionMacros.cmake | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/cmake/modules/GObjectIntrospectionMacros.cmake b/cmake/modules/GObjectIntrospectionMacros.cmake
-index 83aff93..d7d3f89 100644
---- a/cmake/modules/GObjectIntrospectionMacros.cmake
-+++ b/cmake/modules/GObjectIntrospectionMacros.cmake
-@@ -50,8 +50,7 @@ macro(gir_add_introspections introspections_girs)
-     set(_gir_libtool "--no-libtool")
- 
-     add_custom_command(
--      COMMAND ${CMAKE_COMMAND} -E env "CC='${CMAKE_C_COMPILER}'"
--              ${GObjectIntrospection_SCANNER}
-+      COMMAND ${GObjectIntrospection_SCANNER}
-               ${GObjectIntrospection_SCANNER_ARGS}
-               --namespace=${_gir_namespace}
-               --nsversion=${_gir_version}
diff --git a/meta/recipes-support/libical/libical/flags.patch b/meta/recipes-support/libical/libical/flags.patch
index 5fa4b479ee..868314591c 100644
--- a/meta/recipes-support/libical/libical/flags.patch
+++ b/meta/recipes-support/libical/libical/flags.patch
@@ -1,7 +1,8 @@
-From a5642fa1cd8c835209b39ec99e534d341779c985 Mon Sep 17 00:00:00 2001
+From cba8f762f6a3270530550915d957c01f3da9a601 Mon Sep 17 00:00:00 2001
 From: Milan Crha <mcrha@redhat.com>
 Date: Wed, 10 Sep 2025 09:52:37 +0200
 Subject: [PATCH] libical-glib: Hide some target options in the installed CMake
+
  files
 
 The build paths could be shown in the installed .cmake files, thus
@@ -12,29 +13,26 @@ Closes https://github.com/libical/libical/issues/532
 Upstream-Status: Submitted [https://github.com/libical/libical/pull/1010]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 ---
- src/libical-glib/CMakeLists.txt | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
+ src/libical-glib/CMakeLists.txt | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
-index 9f69e9c5..aa55e013 100644
+index d63bbf3..d820160 100644
 --- a/src/libical-glib/CMakeLists.txt
 +++ b/src/libical-glib/CMakeLists.txt
-@@ -8,8 +8,8 @@ add_executable(ical-glib-src-generator
-   tools/xml-parser.h
- )
-
--target_compile_options(ical-glib-src-generator PUBLIC ${GLIB_CFLAGS} ${LIBXML_CFLAGS} -DG_LOG_DOMAIN=\"src-generator\")
--target_link_libraries(ical-glib-src-generator ${GLIB_LIBRARIES} ${LIBXML_LIBRARIES})
-+target_compile_options(ical-glib-src-generator PRIVATE ${GLIB_CFLAGS} ${LIBXML_CFLAGS} -DG_LOG_DOMAIN=\"src-generator\")
-+target_link_libraries(ical-glib-src-generator PRIVATE ${GLIB_LIBRARIES} ${LIBXML_LIBRARIES})
-
- install(
-   TARGETS ical-glib-src-generator
-@@ -130,7 +130,7 @@ target_link_libraries(ical-glib PRIVATE ical ${GLIB_LIBRARIES})
- if(NOT SHARED_ONLY AND NOT STATIC_ONLY)
-   add_library(ical-glib-static STATIC ${LIBICAL_GLIB_SOURCES})
-   add_dependencies(ical-glib-static ical-header)
--  target_compile_options(ical-glib-static PUBLIC ${GLIB_CFLAGS} -DG_LOG_DOMAIN="libical-glib" -DLIBICAL_GLIB_COMPILATION)
-+  target_compile_options(ical-glib-static PRIVATE ${GLIB_CFLAGS} -DG_LOG_DOMAIN="libical-glib" -DLIBICAL_GLIB_COMPILATION)
-   target_link_libraries(ical-glib-static ${GLIB_LIBRARIES})
+@@ -24,13 +24,14 @@ if(NOT DEFINED LIBXML2_DEFINITIONS)
  endif()
+ target_compile_options(
+   ical-glib-src-generator
+-  PUBLIC
++  PRIVATE
+     ${GLIB_CFLAGS}
+     ${LIBXML2_DEFINITIONS}
+     -DG_LOG_DOMAIN=\"src-generator\"
+ )
+ target_link_libraries(
+   ical-glib-src-generator
++  PRIVATE
+   ${GLIB_LDFLAGS}
+   ${GOBJECT_LDFLAGS}
+   ${LIBXML2_LIBRARIES}
diff --git a/meta/recipes-support/libical/libical_3.0.20.bb b/meta/recipes-support/libical/libical_4.0.3.bb
similarity index 74%
rename from meta/recipes-support/libical/libical_3.0.20.bb
rename to meta/recipes-support/libical/libical_4.0.3.bb
index 7f85522e91..d7001d4a8c 100644
--- a/meta/recipes-support/libical/libical_3.0.20.bb
+++ b/meta/recipes-support/libical/libical_4.0.3.bb
@@ -6,17 +6,14 @@ their calendar data and arrange meetings with other users. "
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPL-2.1-only | MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
-                    file://LICENSE.LGPL21.txt;md5=8f690bb538f4b301d931374a6eb864d0 \
-                    file://LICENSE.MPL2.txt;md5=f75d2927d3c1ed2414ef72048f5ad640 \
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6d9294493d031c817783b0400a126c89 \
                     "
 SECTION = "libs"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
-           file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
            file://flags.patch \
-          "
-SRC_URI[sha256sum] = "e73de92f5a6ce84c1b00306446b290a2b08cdf0a80988eca0a2c9d5c3510b4c2"
+           "
+SRC_URI[sha256sum] = "86f29029d0ec9fa30c9001de16c0859a3816ae154ff5b097392b014e21a3d254"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
@@ -24,7 +21,7 @@ DEPENDS += "libical-native"
 
 PACKAGECONFIG ??= "icu glib"
 PACKAGECONFIG[bdb] = ",-DCMAKE_DISABLE_FIND_PACKAGE_BDB=True,db"
-PACKAGECONFIG[glib] = "-DICAL_GLIB=True,-DICAL_GLIB=False,glib-2.0-native libxml2-native glib-2.0 libxml2"
+PACKAGECONFIG[glib] = "-DLIBICAL_GLIB=True,-DLIBICAL_GLIB=False,glib-2.0-native libxml2-native glib-2.0 libxml2"
 # ICU is used for RSCALE (RFC7529) support
 PACKAGECONFIG[icu] = ",-DCMAKE_DISABLE_FIND_PACKAGE_ICU=True,icu"
 
@@ -33,13 +30,15 @@ EXTRA_OECMAKE += "-DPERL_EXECUTABLE=${HOSTTOOLS_DIR}/perl"
 # Disable the test suite as we can't install it
 EXTRA_OECMAKE += "-DLIBICAL_BUILD_TESTING=false"
 # doc build fails with linker error (??) for libical-glib so disable it
-EXTRA_OECMAKE += "-DICAL_BUILD_DOCS=false"
+EXTRA_OECMAKE += "-DLIBICAL_GLIB_BUILD_DOCS=false"
 # gobject-introspection
 EXTRA_OECMAKE:append:class-target = " -DGObjectIntrospection_COMPILER=${STAGING_BINDIR}/g-ir-compiler-wrapper"
 EXTRA_OECMAKE:append:class-target = " -DGObjectIntrospection_SCANNER=${STAGING_BINDIR}/g-ir-scanner-wrapper"
 EXTRA_OECMAKE += "-DVAPIGEN=${STAGING_BINDIR_NATIVE}/vapigen"
-EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DGOBJECT_INTROSPECTION=ON -DICAL_GLIB_VAPI=ON', '-DGOBJECT_INTROSPECTION=OFF -DICAL_GLIB_VAPI=OFF', d)}"
-EXTRA_OECMAKE:append:class-native = " -DGOBJECT_INTROSPECTION=OFF -DICAL_GLIB_VAPI=OFF"
+EXTRA_OECMAKE += "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DLIBICAL_GOBJECT_INTROSPECTION=ON -DLIBICAL_GLIB_VAPI=ON', '-DLIBICAL_GOBJECT_INTROSPECTION=OFF -DLIBICAL_GLIB_VAPI=OFF', d)}"
+EXTRA_OECMAKE:append:class-native = " -DLIBICAL_GOBJECT_INTROSPECTION=OFF -DLIBICAL_GLIB_VAPI=OFF"
+# no java
+EXTRA_OECMAKE += "-DLIBICAL_JAVA_BINDINGS=False"
 
 # Tell the cross-libical where the tool it needs to build is
 EXTRA_OECMAKE:append:class-target = " -DIMPORT_ICAL_GLIB_SRC_GENERATOR=${STAGING_LIBDIR_NATIVE}/cmake/LibIcal/IcalGlibSrcGenerator.cmake"
-- 
2.47.3


