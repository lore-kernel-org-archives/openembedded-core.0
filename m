Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7A1C433F5
	for <webhook@archiver.kernel.org>; Sun, 22 May 2022 17:32:08 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.18537.1653240719483110589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 May 2022 10:31:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=n+m2JXpZ;
 spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93,
 mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653240719; x=1684776719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QXZuAO+jHMzWiHUir5KHsEBufR8jNILqQGi/zYFe4YI=;
  b=n+m2JXpZeNcI0+MA7ihwVzEiUuzyfomJ3o0OGXrT+IhxaCuZFpxhuLpl
   7pUx08/3dvTXhZNBY5Ok09bAE/fB0yHtHf9SyZrLiYcIcGbg+hZZn5joa
   hDkFcbrYnW4VFs4G9S07JPE9cfbmst6hpILGVgDx78LdnXfzRD68AN8P6
   unYk//vaEa+sb4BJIqk58byrATFdnFu/ZYdLOgxI2qPkSTUg+KeLBA9DI
   vmhDj5GFwFRZL6+8kMyjc7DaBEZYS1mj7lz1u+iarhn4i3F+Xg5q56LcN
   HMrArZPDyX1e76yr9XeGMw5RUDaOF7VmOPHa55SuD3150vdziOeqr4cT9
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="270597920"
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="270597920"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,244,1647327600";
   d="scan'208";a="571693875"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 10:31:57 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [oe-core] [PATCH 2/4] systemd: Remove __compare_fn_t type in
 musl-specific patch
Date: Mon, 23 May 2022 01:31:43 +0800
Message-Id: <20220522173145.1015305-3-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
References: <20220522173145.1015305-1-jiaqing.zhao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 May 2022 17:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165983

Since systemd v250, commit d8f16737005e ("sort-util: avoid using
glibc's internal __compar_d_fn_t type"), __compare_fn_t type is no
longer used. This patch removes that type in the musl-specific patch.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 ...-missing_type.h-add-comparison_fn_t.patch} | 44 ++++++-------------
 ...missing.h-check-for-missing-strndupa.patch | 14 +++---
 meta/recipes-core/systemd/systemd_250.5.bb    |  2 +-
 3 files changed, 22 insertions(+), 38 deletions(-)
 rename meta/recipes-core/systemd/systemd/{0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch => 0003-missing_type.h-add-comparison_fn_t.patch} (61%)

diff --git a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
similarity index 61%
rename from meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
rename to meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
index dfe4164900..c28c8381e8 100644
--- a/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch
+++ b/meta/recipes-core/systemd/systemd/0003-missing_type.h-add-comparison_fn_t.patch
@@ -1,13 +1,9 @@
-From a4f51ef07375466f79cb148ff1178ed11f808f0a Mon Sep 17 00:00:00 2001
+From 5513b918d02900a3a78fd0e0300a118b163edfef Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 13:55:12 +0800
-Subject: [PATCH] missing_type.h: add __compare_fn_t and comparison_fn_t
+Subject: [PATCH] missing_type.h: add comparison_fn_t
 
-Make it work with musl where comparison_fn_t and __compare_fn_t
-is not provided.
-
-Revisit this when upgrading to 251+ systemd since systemd does not need
-__compare_fn_t anymore
+Make it work with musl where comparison_fn_t and is not provided.
 
 Upstream-Status: Inappropriate [musl specific]
 
@@ -16,19 +12,19 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 [Rebased for v242]
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
+[Rebased for v250, Drop __compare_fn_t]
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
- src/basic/missing_type.h            | 9 +++++++++
+ src/basic/missing_type.h            | 4 ++++
  src/basic/sort-util.h               | 1 +
- src/core/kmod-setup.c               | 1 +
  src/libsystemd/sd-journal/catalog.c | 1 +
- 4 files changed, 12 insertions(+)
+ 3 files changed, 6 insertions(+)
 
 diff --git a/src/basic/missing_type.h b/src/basic/missing_type.h
-index f6233090a9..aeaf6ad5ec 100644
+index f6233090a9..6c0456349d 100644
 --- a/src/basic/missing_type.h
 +++ b/src/basic/missing_type.h
-@@ -10,3 +10,12 @@
+@@ -10,3 +10,7 @@
  #if !HAVE_CHAR16_T
  #define char16_t uint16_t
  #endif
@@ -36,13 +32,8 @@ index f6233090a9..aeaf6ad5ec 100644
 +#ifndef __GLIBC__
 +typedef int (*comparison_fn_t)(const void *, const void *);
 +#endif
-+
-+#ifndef __COMPAR_FN_T
-+#define __COMPAR_FN_T
-+typedef int (*__compar_fn_t)(const void *, const void *);
-+#endif
 diff --git a/src/basic/sort-util.h b/src/basic/sort-util.h
-index cb448df109..fd738a65ab 100644
+index 02a6784d99..0b33c83d59 100644
 --- a/src/basic/sort-util.h
 +++ b/src/basic/sort-util.h
 @@ -4,6 +4,7 @@
@@ -53,18 +44,6 @@ index cb448df109..fd738a65ab 100644
  
  /* This is the same as glibc's internal __compar_d_fn_t type. glibc exports a public comparison_fn_t, for the
   * external type __compar_fn_t, but doesn't do anything similar for __compar_d_fn_t. Let's hence do that
-diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index d054668b8e..d3bf55acbe 100644
---- a/src/core/kmod-setup.c
-+++ b/src/core/kmod-setup.c
-@@ -10,6 +10,7 @@
- #include "macro.h"
- #include "recurse-dir.h"
- #include "string-util.h"
-+#include "missing_type.h"
- 
- #if HAVE_KMOD
- #include "module-util.h"
 diff --git a/src/libsystemd/sd-journal/catalog.c b/src/libsystemd/sd-journal/catalog.c
 index 8fc87b131a..36a6efdbd8 100644
 --- a/src/libsystemd/sd-journal/catalog.c
@@ -77,3 +56,6 @@ index 8fc87b131a..36a6efdbd8 100644
  
  const char * const catalog_file_dirs[] = {
          "/usr/local/lib/systemd/catalog/",
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
index 4b1fac06b5..680930ca3c 100644
--- a/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
+++ b/meta/recipes-core/systemd/systemd/0005-src-basic-missing.h-check-for-missing-strndupa.patch
@@ -1,4 +1,4 @@
-From 55d48dd81e57add5b2d4b5a7d697c575a0f37ef5 Mon Sep 17 00:00:00 2001
+From 106b7bd7186c9d6c1dcd72bd4ca6457d3fa72d0b Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 25 Feb 2019 14:18:21 +0800
 Subject: [PATCH] src/basic/missing.h: check for missing strndupa
@@ -17,7 +17,6 @@ Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 [rebased for systemd 244]
 [Rebased for v247]
 Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
-
 ---
  meson.build                                |  1 +
  src/backlight/backlight.c                  |  1 +
@@ -74,7 +73,7 @@ Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
  52 files changed, 63 insertions(+)
 
 diff --git a/meson.build b/meson.build
-index ae53345260..8c8a6c9bdf 100644
+index cb9936ee8b..7ab201c6d9 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -507,6 +507,7 @@ foreach ident : ['secure_getenv', '__secure_getenv']
@@ -310,13 +309,13 @@ index 0b20d386d3..fccfb9268c 100644
  #define IDLE_TIMEOUT_USEC (5*USEC_PER_SEC)
  #define IDLE_TIMEOUT2_USEC (1*USEC_PER_SEC)
 diff --git a/src/core/kmod-setup.c b/src/core/kmod-setup.c
-index d3bf55acbe..63dd807b8a 100644
+index d054668b8e..9b4caa7651 100644
 --- a/src/core/kmod-setup.c
 +++ b/src/core/kmod-setup.c
-@@ -11,6 +11,7 @@
+@@ -10,6 +10,7 @@
+ #include "macro.h"
  #include "recurse-dir.h"
  #include "string-util.h"
- #include "missing_type.h"
 +#include "missing_stdlib.h"
  
  #if HAVE_KMOD
@@ -705,3 +704,6 @@ index 1a384d6b38..0089833e3f 100644
  
  #define RULES_DIRS (const char* const*) CONF_PATHS_STRV("udev/rules.d")
  
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index aca140d4d4..6d6b3f2ded 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -31,7 +31,7 @@ SRC_URI += "file://touchscreen.rules \
 SRC_URI:append:libc-musl = " ${SRC_URI_MUSL}"
 SRC_URI_MUSL = "\
                file://0002-don-t-use-glibc-specific-qsort_r.patch \
-               file://0003-missing_type.h-add-__compare_fn_t-and-comparison_fn_.patch \
+               file://0003-missing_type.h-add-comparison_fn_t.patch \
                file://0004-add-fallback-parse_printf_format-implementation.patch \
                file://0005-src-basic-missing.h-check-for-missing-strndupa.patch \
                file://0007-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-- 
2.34.1


