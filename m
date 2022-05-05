Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 51/61] elfutils: update 0.186 -> 0.187
Date: Thu,  5 May 2022 07:05:34 +0200
Message-Id: <20220505050544.651895-51-alex@linutronix.de>
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>

Drop backports.

License-Update: copyright years, copyright holders
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{elfutils_0.186.bb => elfutils_0.187.bb}  |  6 +--
 ...infod-client.c-use-long-for-cache-ti.patch | 45 ----------------
 ...ompilation-on-platforms-without-erro.patch | 54 -------------------
 .../elfutils/files/0003-musl-utils.patch      |  8 +--
 .../0015-config-eu.am-do-not-use-Werror.patch |  2 +-
 5 files changed, 7 insertions(+), 108 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.186.bb => elfutils_0.187.bb} (96%)
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch
 delete mode 100644 meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
similarity index 96%
rename from meta/recipes-devtools/elfutils/elfutils_0.186.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.187.bb
index 46ee40cce6..d20220e433 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.187.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "elfutils is a collection of utilities and libraries to read, crea
 SECTION = "base"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & LGPL-3.0-or-later & GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://debuginfod/debuginfod-client.c;endline=27;md5=d2adfd8f5347d4c96e3c280393ce66da \
+                    file://debuginfod/debuginfod-client.c;endline=28;md5=f0a7c3170776866ee94e8f9225a6ad79 \
                     "
 DEPENDS = "zlib virtual/libintl"
 DEPENDS:append:libc-musl = " argp-standalone fts musl-obstack "
@@ -21,14 +21,12 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://run-ptest \
            file://ptest.patch \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
-           file://0001-debuginfod-fix-compilation-on-platforms-without-erro.patch \
-           file://0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "7f6fb9149b1673d38d9178a0d3e0fb8a1ec4f53a9f4c2ff89469609879641177"
+SRC_URI[sha256sum] = "e70b0dfbe610f90c4d1fe0d71af142a4e25c3c4ef9ebab8d2d72b65159d454c8"
 
 inherit autotools gettext ptest pkgconfig
 PTEST_ENABLED:libc-musl = "0"
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch
deleted file mode 100644
index 089f1a2210..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a0852044907110479d0fb212dda2c5e45af2d3aa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 9 Dec 2021 10:43:06 +0100
-Subject: [PATCH] debuginfod/debuginfod-client.c: use long for cache time
- configurations
-
-time_t is platform dependent and some of architectures e.g.
-x32, riscv32, arc use 64bit time_t even while they are 32bit
-architectures, therefore directly using integer printf formats will not
-work portably.
-
-Use a plain long everywhere as the intervals are small enough
-that it will not be problematic.
-
-Upstream-Status: Submitted [via email to mark@klomp.org,elfutils-devel@sourceware.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- debuginfod/debuginfod-client.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/debuginfod/debuginfod-client.c b/debuginfod/debuginfod-client.c
-index c875ee6..11e0fd5 100644
---- a/debuginfod/debuginfod-client.c
-+++ b/debuginfod/debuginfod-client.c
-@@ -134,17 +134,17 @@ struct debuginfod_client
-    how frequently the cache should be cleaned. The file's st_mtime represents
-    the time of last cleaning.  */
- static const char *cache_clean_interval_filename = "cache_clean_interval_s";
--static const time_t cache_clean_default_interval_s = 86400; /* 1 day */
-+static const long cache_clean_default_interval_s = 86400; /* 1 day */
- 
- /* The cache_miss_default_s within the debuginfod cache specifies how
-    frequently the 000-permision file should be released.*/
--static const time_t cache_miss_default_s = 600; /* 10 min */
-+static const long cache_miss_default_s = 600; /* 10 min */
- static const char *cache_miss_filename = "cache_miss_s";
- 
- /* The cache_max_unused_age_s file within the debuginfod cache specifies the
-    the maximum time since last access that a file will remain in the cache.  */
- static const char *cache_max_unused_age_filename = "max_unused_age_s";
--static const time_t cache_default_max_unused_age_s = 604800; /* 1 week */
-+static const long cache_default_max_unused_age_s = 604800; /* 1 week */
- 
- /* Location of the cache of files downloaded from debuginfods.
-    The default parent directory is $HOME, or '/' if $HOME doesn't exist.  */
diff --git a/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch b/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch
deleted file mode 100644
index e80d96aaca..0000000000
--- a/meta/recipes-devtools/elfutils/files/0001-debuginfod-fix-compilation-on-platforms-without-erro.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 99617d7ab5b01c322b0f27d4aa0dd91c61793a5e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C3=89rico=20Nogueira?= <erico.erc@gmail.com>
-Date: Wed, 10 Nov 2021 21:17:48 -0300
-Subject: [PATCH] debuginfod: fix compilation on platforms without <error.h>
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-"system.h" only declares the error() function, so it needs to be in an
-'extern "C"' block, otherwise linking fails.
-
-Since we are here, use quotes for "system.h" header, since it's a local
-header, not a system one.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=90b9e91b961b794a4e58ab76d9191a5e7343584e]
-Signed-off-by: Érico Nogueira <erico.erc@gmail.com>
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- debuginfod/ChangeLog      | 4 ++++
- debuginfod/debuginfod.cxx | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/debuginfod/ChangeLog b/debuginfod/ChangeLog
-index f06d3ee..822bd63 100644
---- a/debuginfod/ChangeLog
-+++ b/debuginfod/ChangeLog
-@@ -1,3 +1,7 @@
-+2021-11-10  Érico N. Rolim  <erico.erc@gmail.com>
-+
-+	* debuginfod.cxx: include "system.h" under 'extern "C"' block.
-+
- 2021-11-05  Frank Ch. Eigler  <fche@redhat.com>
- 
- 	PR28430
-diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
-index 521cb52..764e7b9 100644
---- a/debuginfod/debuginfod.cxx
-+++ b/debuginfod/debuginfod.cxx
-@@ -33,11 +33,11 @@
- 
- extern "C" {
- #include "printversion.h"
-+#include "system.h"
- }
- 
- #include "debuginfod.h"
- #include <dwarf.h>
--#include <system.h>
- 
- #include <argp.h>
- #ifdef __GNUC__
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
index cbc9fce790..1c7cde6d7d 100644
--- a/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
+++ b/meta/recipes-devtools/elfutils/files/0003-musl-utils.patch
@@ -1,4 +1,4 @@
-From 8b48c580bae0b0ffc773b0b829c50d33a907853c Mon Sep 17 00:00:00 2001
+From 81da32c3404b58cbad7b3af00854e0cf2dc3dbf1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 23 Aug 2019 10:19:48 +0800
 Subject: [PATCH] musl-utils
@@ -39,7 +39,7 @@ index e117166..8326f6c 100644
  /* State of -D/-U flags.  */
  extern bool arlib_deterministic_output;
 diff --git a/src/elfcompress.c b/src/elfcompress.c
-index 2c6d91b..608646e 100644
+index 92f2fac..0b037a5 100644
 --- a/src/elfcompress.c
 +++ b/src/elfcompress.c
 @@ -37,6 +37,13 @@
@@ -57,7 +57,7 @@ index 2c6d91b..608646e 100644
  ARGP_PROGRAM_VERSION_HOOK_DEF = print_version;
  
 diff --git a/src/strip.c b/src/strip.c
-index d5b753d..d6e1b64 100644
+index 30a1f9d..e89a7f0 100644
 --- a/src/strip.c
 +++ b/src/strip.c
 @@ -46,6 +46,13 @@
@@ -75,7 +75,7 @@ index d5b753d..d6e1b64 100644
  
  /* Name and version of program.  */
 diff --git a/src/unstrip.c b/src/unstrip.c
-index aacc9aa..5e71290 100644
+index 3472637..40c73f3 100644
 --- a/src/unstrip.c
 +++ b/src/unstrip.c
 @@ -52,6 +52,15 @@
diff --git a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
index 9952070939..a7715587db 100644
--- a/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
+++ b/meta/recipes-devtools/elfutils/files/0015-config-eu.am-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From 5e39da062929a60a07ddfc8b6d435ea65ea3e31f Mon Sep 17 00:00:00 2001
+From ff6ab57ba5dd37947ef1ffe5de7af5dbebfeb4e9 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jun 2020 21:35:16 +0000
 Subject: [PATCH] config/eu.am: do not use -Werror
-- 
2.30.2

