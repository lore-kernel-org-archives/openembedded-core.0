Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.7846.1614526644315545452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CcdGhjs9;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id w1so23544643ejf.11
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R3c39Gj9rpfHzBsSvQcc0zPReHJqhW9g+9LwSHVJsfo=;
        b=CcdGhjs9wrLbDU0pQ7//pVSG2tN9ZeqIyuU99zUTABmlwe5AigX9hpGNb/hx73e7jX
         ENLxYwuMeU2o6AwEpekhMVjos5j+c1KTVn30Vn1OKc2fxYGco4ciseCmXnrTuJEpzuYu
         FGYedoZzOmshMHtiOQbXuivPkr7yipztAiRv71muQG4YAfxVVGtJyNElSIIiusMojpxN
         fhttCg4+HR0x2yIa6vLPa0SRtupMmNOMdHMoropuXFLHEaaWNwe/GAfOv8VzoR480kUw
         Ebemnz2m5qJjGlfizGlbTTHmqCltnDktRh3VAn15rwZuqbs43RgwTxEmF46UbVx9Sl1Q
         Fypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R3c39Gj9rpfHzBsSvQcc0zPReHJqhW9g+9LwSHVJsfo=;
        b=lErxbJV6YizUf26AKQQgurxMrVK85uQqEFvJNBUhAuO/BOEM0wJWXyBkpv1Qfqn/6Y
         /KL4UVTaqkBCkLtwFQWbBcnv8DSjm+JfuMjgTNujbb6fbMdqhdmaOpEursBvQwCsYoUu
         Zl416eTYri9G2cMCSLRSr63UBir0OEiJnCC1/B4w2Wi3hN1qqt0pn9946dupgESapDny
         IfRhIxivZP8lABE2CELp4+TmmjvLaWpIJxHabjGtNCNq4Qu7AKDc21RZq0awSg0G7wAB
         OIE12vnwM1qHyZn5OuAQZhcwUVQYxZqp4tm4dtd8G/uvJZGGxM09D8+HKCbCBrHMaJ2e
         CMDw==
X-Gm-Message-State: AOAM533ZPSwpFVkMB0W/KiBNFPS5/pnCgUePZ9Udmrc/ggnSk/2LRUgE
	B8DWyS3aMy4q4h2LKbZNGHZVva8tdSyuTQ==
X-Google-Smtp-Source: ABdhPJz5VtfZTmG14ZqRY6wd3hRmuwaBYxZjK7BHaU5QvKLJqlJRsRA3VJzSjnOgURO33vR45E+Txg==
X-Received: by 2002:a17:906:f885:: with SMTP id lg5mr12119869ejb.25.1614526642836;
        Sun, 28 Feb 2021 07:37:22 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:22 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/24] libical: update 3.0.8 -> 3.0.9
Date: Sun, 28 Feb 2021 16:36:54 +0100
Message-Id: <20210228153702.498275-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream attempted to fix cross-compilation, but seems to have botched it,
so a new ticket was filed, and patch to un-break it was rewritten.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Fix-build-with-icu-68.1.patch        | 81 -------------------
 ...-our-hand-build-native-src-generator.patch | 45 +++++------
 .../{libical_3.0.8.bb => libical_3.0.9.bb}    | 14 ++--
 3 files changed, 28 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
 rename meta/recipes-support/libical/{libical_3.0.8.bb => libical_3.0.9.bb} (79%)

diff --git a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch b/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
deleted file mode 100644
index 79e1475c6c..0000000000
--- a/meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 52d603212173d4502800bf746436a93f806a8898 Mon Sep 17 00:00:00 2001
-From: Allen Winter <allen.winter@kdab.com>
-Date: Sat, 31 Oct 2020 17:38:01 -0400
-Subject: [PATCH] Fix build with icu-68.1
-
-Use stdbool.h to define true and false when possible
-
-Issue#448
----
- ConfigureChecks.cmake   |  1 +
- config.h.cmake          |  3 +++
- src/libical/icalrecur.c | 10 ++++++++--
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/ConfigureChecks.cmake b/ConfigureChecks.cmake
-index e4d0e2ec..bba33fa9 100644
---- a/ConfigureChecks.cmake
-+++ b/ConfigureChecks.cmake
-@@ -10,6 +10,7 @@ check_include_files(sys/utsname.h HAVE_SYS_UTSNAME_H)
- check_include_files(fcntl.h HAVE_FCNTL_H)
- check_include_files(unistd.h HAVE_UNISTD_H)
- check_include_files(wctype.h HAVE_WCTYPE_H)
-+check_include_files(stdbool.h HAVE_STDBOOL_H)
- 
- include(CheckFunctionExists)
- if(WIN32 AND MSVC)
-diff --git a/config.h.cmake b/config.h.cmake
-index 8fd3421b..c8008692 100644
---- a/config.h.cmake
-+++ b/config.h.cmake
-@@ -39,6 +39,9 @@
- /* Define to 1 if you have the <dirent.h> header file. */
- #cmakedefine HAVE_DIRENT_H 1
- 
-+/* Define to 1 if you have the <stdbool.h> header file. */
-+#cmakedefine HAVE_STDBOOL_H 1
-+
- /* Define if we have pthread. */
- #cmakedefine HAVE_PTHREAD_ATTR_GET_NP 1
- #cmakedefine HAVE_PTHREAD_GETATTR_NP 1
-diff --git a/src/libical/icalrecur.c b/src/libical/icalrecur.c
-index 73178450..b3f054b8 100644
---- a/src/libical/icalrecur.c
-+++ b/src/libical/icalrecur.c
-@@ -145,6 +145,12 @@
- #if defined(HAVE_LIBICU)
- #include <unicode/ucal.h>
- #include <unicode/ustring.h>
-+#if defined(HAVE_STDBOOL_H)
-+#include <stdbool.h>
-+#else
-+#define false 0
-+#define true 1
-+#endif
- #define RSCALE_IS_SUPPORTED 1
- #else
- #define RSCALE_IS_SUPPORTED 0
-@@ -1018,7 +1024,7 @@ icalarray *icalrecurrencetype_rscale_supported_calendars(void)
- 
-     calendars = icalarray_new(sizeof(const char **), 20);
- 
--    en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
-+    en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
-     while ((cal = uenum_next(en, NULL, &status))) {
-         cal = icalmemory_tmp_copy(cal);
-         icalarray_append(calendars, &cal);
-@@ -1411,7 +1417,7 @@ static int initialize_rscale(icalrecur_iterator *impl)
-         }
- 
-         /* Check if specified calendar is supported */
--        en = ucal_getKeywordValuesForLocale("calendar", NULL, FALSE, &status);
-+        en = ucal_getKeywordValuesForLocale("calendar", NULL, false, &status);
-         while ((cal = uenum_next(en, NULL, &status))) {
-             if (!strcmp(cal, rule.rscale)) {
-                 is_hebrew = !strcmp(rule.rscale, "hebrew");
--- 
-2.25.1
-
diff --git a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
index b7b757d74b..0813641ee9 100644
--- a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
+++ b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
@@ -1,33 +1,32 @@
-From e33bc310238bba1690f2c71ad333e10b9e422ea9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Sat, 19 Oct 2019 14:23:06 +0200
+From 378df7d6ef9207d3e11a3de54ffd05c04c6c0e0b Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 24 Feb 2021 20:28:22 +0000
 Subject: [PATCH] Use our hand-build native src-generator
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Inappropriate [oe-core specific]
-
-Signed-off-by: Andreas MÃ¼ller <schnitzeltony@gmail.com>
+Upstream-Status: Inappropriate [reported at https://github.com/libical/libical/issues/481]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
- src/libical-glib/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ src/libical-glib/CMakeLists.txt | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/src/libical-glib/CMakeLists.txt b/src/libical-glib/CMakeLists.txt
-index f3704e6..ce9db16 100644
+index 13f77aa..c337c9e 100644
 --- a/src/libical-glib/CMakeLists.txt
 +++ b/src/libical-glib/CMakeLists.txt
-@@ -63,8 +63,8 @@ endforeach()
- 
- add_custom_command (
-   OUTPUT ${LIBICAL_GLIB_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/libical-glib-private.h ${CMAKE_CURRENT_BINARY_DIR}/i-cal-forward-declarations.h
--  COMMAND ${EXECUTABLE_OUTPUT_PATH}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
--  DEPENDS ${EXECUTABLE_OUTPUT_PATH}/src-generator ${xml_files}
-+  COMMAND ${CMAKE_BINARY_DIR}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
-+  DEPENDS ${CMAKE_BINARY_DIR}/src-generator ${xml_files}
- )
+@@ -74,12 +74,7 @@ endforeach()
  
- configure_file(
+ if(CMAKE_CROSSCOMPILING)
+   # import native ical-glib-src-generator when cross-compiling
+-  set(IMPORT_ICAL_GLIB_SRC_GENERATOR "ICAL_GLIB_SRC_GENERATOR-NOTFOUND"
+-    CACHE FILEPATH
+-    "Path to exported ical-glib-src-generator target from native build"
+-  )
+-  include(${IMPORT_ICAL_GLIB_SRC_GENERATOR})
+-  set(ical-glib-src-generator_EXE native-ical-glib-src-generator)
++  set(ical-glib-src-generator_EXE ${CMAKE_BINARY_DIR}/src-generator)
+ else()
+   set(ical-glib-src-generator_EXE ical-glib-src-generator)
+ endif()
 -- 
-2.21.0
+2.17.1
 
diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.9.bb
similarity index 79%
rename from meta/recipes-support/libical/libical_3.0.8.bb
rename to meta/recipes-support/libical/libical_3.0.9.bb
index 6230f09eca..6f8b491190 100644
--- a/meta/recipes-support/libical/libical_3.0.8.bb
+++ b/meta/recipes-support/libical/libical_3.0.9.bb
@@ -8,19 +8,16 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1910a2a76ddf6a9ba369182494170d87 \
                     "
 SECTION = "libs"
 
-SRC_URI = " \
-    https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
-    file://0001-Use-our-hand-build-native-src-generator.patch \
-    file://0001-Fix-build-with-icu-68.1.patch \
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
+           file://0001-Use-our-hand-build-native-src-generator.patch \
 "
-SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
-SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
+SRC_URI[sha256sum] = "bd26d98b7fcb2eb0cd5461747bbb02024ebe38e293ca53a7dfdcb2505265a728"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
 
 do_compile_prepend() {
-	# As long as https://github.com/libical/libical/issues/394 is open build native src-generator manually
+	# As long as https://github.com/libical/libical/issues/481 is open build native src-generator manually
 	NATIVE_CFLAGS="${BUILD_CFLAGS} `pkg-config-native --cflags glib-2.0` `pkg-config-native --cflags libxml-2.0`"
 	NATIVE_LDFLAGS="${BUILD_LDFLAGS} `pkg-config-native --libs glib-2.0` `pkg-config-native --libs libxml-2.0`"
 	${BUILD_CC} $NATIVE_CFLAGS ${S}/src/libical-glib/tools/generator.c ${S}/src/libical-glib/tools/xml-parser.c -o ${B}/src-generator $NATIVE_LDFLAGS
@@ -42,5 +39,6 @@ do_install_append () {
     sed -i \
        -e 's,${STAGING_LIBDIR},${libdir},g' \
        -e 's,${STAGING_INCDIR},${includedir},g' \
-       ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake
+       ${D}${libdir}/cmake/LibIcal/LibIcal*.cmake \
+       ${D}${libdir}/cmake/LibIcal/Ical*.cmake
 }
-- 
2.29.2

