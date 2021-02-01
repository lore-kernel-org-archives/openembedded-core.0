Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.29793.1612156105311867510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 21:08:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,391,1602518400"; 
   d="scan'208";a="104040178"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 01 Feb 2021 13:08:00 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id AD4644CE67AB
	for <openembedded-core@lists.openembedded.org>; Mon,  1 Feb 2021 13:07:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 1 Feb 2021 13:07:59 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.8 -> 3.0.9
Date: Mon, 1 Feb 2021 13:07:56 +0800
Message-ID: <1612156076-77353-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: AD4644CE67AB.AAE64
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit

0001-Fix-build-with-icu-68.1.patch
removed since it is included in 3.0.9

refresh 0001-Use-our-hand-build-native-src-generator.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../0001-Fix-build-with-icu-68.1.patch        | 81 -------------------
 ...-our-hand-build-native-src-generator.patch | 32 ++++----
 .../{libical_3.0.8.bb => libical_3.0.9.bb}    |  5 +-
 3 files changed, 20 insertions(+), 98 deletions(-)
 delete mode 100644 meta/recipes-support/libical/libical/0001-Fix-build-with-icu-68.1.patch
 rename meta/recipes-support/libical/{libical_3.0.8.bb => libical_3.0.9.bb} (91%)

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
index b7b757d74b..d48185b971 100644
--- a/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
+++ b/meta/recipes-support/libical/libical/0001-Use-our-hand-build-native-src-generator.patch
@@ -9,25 +9,29 @@ Content-Transfer-Encoding: 8bit
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Andreas MÃ¼ller <schnitzeltony@gmail.com>
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
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
+@@ -74,12 +74,7 @@ endforeach()
  
- add_custom_command (
-   OUTPUT ${LIBICAL_GLIB_SOURCES} ${CMAKE_CURRENT_BINARY_DIR}/libical-glib-private.h ${CMAKE_CURRENT_BINARY_DIR}/i-cal-forward-declarations.h
--  COMMAND ${EXECUTABLE_OUTPUT_PATH}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
--  DEPENDS ${EXECUTABLE_OUTPUT_PATH}/src-generator ${xml_files}
-+  COMMAND ${CMAKE_BINARY_DIR}/src-generator "${CMAKE_CURRENT_SOURCE_DIR}/tools" "${CMAKE_CURRENT_SOURCE_DIR}/api"
-+  DEPENDS ${CMAKE_BINARY_DIR}/src-generator ${xml_files}
- )
- 
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
+2.25.1
 
diff --git a/meta/recipes-support/libical/libical_3.0.8.bb b/meta/recipes-support/libical/libical_3.0.9.bb
similarity index 91%
rename from meta/recipes-support/libical/libical_3.0.8.bb
rename to meta/recipes-support/libical/libical_3.0.9.bb
index 6230f09eca..548b7b1686 100644
--- a/meta/recipes-support/libical/libical_3.0.8.bb
+++ b/meta/recipes-support/libical/libical_3.0.9.bb
@@ -11,10 +11,9 @@ SECTION = "libs"
 SRC_URI = " \
     https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
     file://0001-Use-our-hand-build-native-src-generator.patch \
-    file://0001-Fix-build-with-icu-68.1.patch \
 "
-SRC_URI[md5sum] = "41bd1f1fcdcb4779cea478bb55cf07bf"
-SRC_URI[sha256sum] = "09fecacaf75ba5a242159e3a9758a5446b5ce4d0ab684f98a7040864e1d1286f"
+SRC_URI[md5sum] = "734099cc0b0f52bdcc5e3e191a0d9769"
+SRC_URI[sha256sum] = "bd26d98b7fcb2eb0cd5461747bbb02024ebe38e293ca53a7dfdcb2505265a728"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.25.1



