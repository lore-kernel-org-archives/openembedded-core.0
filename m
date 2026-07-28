Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FF2C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 07:26:12 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6420.1785223568605604390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 00:26:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RO7Cq54y;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2801797a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785223568; x=1785828368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zAPhpPN7McV9sIVs8behGA/XjOG3kdJqbd2wsXKaTr4=;
        b=RO7Cq54y7CP7taoSjVp/YPfKO4zcWaEkU+81U4JuCjvmfWH/DOJNx7ESK9AI/QVUZ1
         avc7v7INEaoeELfqLPbds6CRDA45X06ppMB7C0+NyvuX7Q2BKZZK5Z9im3HtRyTPFrjN
         UOdvEg1zyHzPB3eQ1VHwh947wEwEDERBxGDBAbIChlApTQ9/dHDzUeUpfOnmoCEVJ5UU
         zVdKsv8voTDfZOMGELSkxI+FIeOxisJTXsKmOWMvCjXNhN3MIBr2h/mPErEGBPpHvkaf
         k87NaXtfP4hJBiSbYcG+Q2jab9atkdagHIakPsyNOo1mdWVpPinWyGrDOEVJiXOR+XRY
         Uy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785223568; x=1785828368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zAPhpPN7McV9sIVs8behGA/XjOG3kdJqbd2wsXKaTr4=;
        b=BAHeDSctCMk96p8yFJHsV+yldzwcvEmi53lKXa2VLs+wbeRUWOG+xP/jg62s3hDMhP
         QiE82Dg8rOCKfLQ9N+GQrRaXiqAcFkDErngX4r79Sa2UFTnny4zA/9NvzLKrYWEW6Yzu
         YiauNOFJr+QtwGVRyawWCbotIcmJxnMWO/vnQpKzWq3pMvS0WvZLyU2XVJYWd63bj++b
         JMijMvFcaBCAwwDluCiN7l4o3eEHmnA5iKsM2/MHcSlryMeuha7CCk2nyKSDLBXYBXP7
         f6076JOFLMqAV4B+gN6/8D9zQEpNTM69FZ0pVAaB4mYmzVXBpHZn/gzN+Z47eF2wDsOd
         ta/g==
X-Gm-Message-State: AOJu0Yy/hKBymnbEkCpMCKaihjMsBVtLaR+IqDmZsrgy4XtC+7sDMduY
	PeZs/kFNXYYeplPx60gdy/JSnJ2ZredcaJH2nSrGKCnUrQguXxOxN9fTcA3SoH7d
X-Gm-Gg: AR+sD13PpyMtj8jex/LMPgU8orLI6RjNrdBX5bOxv6hVYaSCRrF0sxOtdgdwYXBI9U/
	ftgOGeBkQYp+6EptknAHPltSN2UdI13I3YMRPjBkO8CN4X1UQY2htCrJSuU1dchGbgippncUO2f
	mG8XUdujM9cDoU0Bld4I38fOWD7lux7pk88M/h3OpbBgpKyMBrUDisYdnGNAXL0E9G4gkSJ+RGw
	8LDgey7cEdRiLknxPL8Pb/LhnGyjZVf+a4Fi/R+Rt9x6w7z/PhFZyC2/OTlb6boJrntyMObwog7
	GmdxoTmCFLNcFspwtFYO5f9sFk7wCZPMrFaKaxHitB2kK2fW9CVwAeUGAIgD+6Toou3RTmcphXu
	wk0tZ/EAZEbsDWpqPt+WlfG3+5KH4I/CPD08IysypFvCM8F/v8NJU3+G+ASJjsEd3F5cHGdB4i7
	OPxm/PuqJ/VM12Jaa8T5TzvM9Li5LhGa6/CMSXR5jPjXmgPRbd0tABWzSdLEGx/fICzvEEsId5C
	xu5swhqZjMG/XL6C5tKdarCVX7pGNUw1Rd24JNMXXDk4EF13lGAvE+gfj7kmz1xFjhS7NB2AkW1
	enH+FNIbSiV2LvpIYHA=
X-Received: by 2002:a17:90b:4c42:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38f6a443814mr1309207a91.4.1785223566674;
        Tue, 28 Jul 2026 00:26:06 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e0f4a039asm34484673c88.9.2026.07.28.00.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:26:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] glibc: Upgrade to 2.44 release
Date: Tue, 28 Jul 2026 00:26:02 -0700
Message-ID: <20260728072602.3269425-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 07:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242167

Release highlights [1]:

* System-wide tunables can be applied using /etc/tunables.conf and
  running ldconfig.
* New glibc.elf.thp tunable to map read-only segments with Transparent
  Huge Pages; THP page size in malloc is now capped to MAX_THP_PAGESIZE.
* Additional correctly rounded math functions (cosh, sinh, tanh) imported
  from the CORE-MATH project.
* Static PIE is now supported for arm-*-linux-gnueabi.
* On AArch64, all GCS operations are locked after enabling GCS with an
  ENFORCED or OVERRIDE policy, and more SVE/AdvSIMD special cases are
  vectorized.
* On RISC-V, vector extension optimized variants of memcmp, memcpy,
  memmove, strcmp, strcpy, strlen and others have been added.
* On PowerPC, memchr optimized for Power10 has been re-added.
* Support for LoongArch32 has been added.
* Pre-built ld.so.cache files can be installed with ldconfig.
* New locale hrx_BR (Hunsrik as spoken in Brazil).

Upstream changes affecting compatibility:

* The --enable-memory-tagging configure option, and the AArch64 specific
  functionality it gated, have been removed. Drop the corresponding
  memory-tagging PACKAGECONFIG, it would now be an unrecognized option.
* The --enable-static-nss configure option has been removed, it was not
  used here.
* The s390-linux-gnu (31bit) configuration is no longer supported.

Recipe metadata changes:

* Change 0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-SDK.patch,
  it is adjusted for open_path() now sizing its candidate
  path buffer via dl_scratch_buffer instead of alloca. The pre-pass that
  computes the real max_dirnamelen is kept ahead of that allocation, so
  print_search_path()'s new buffer precondition stays satisfied too.
* Drop 0023-CVE-2026-5450.patch and CVE_STATUS_STABLE_BACKPORTS, already
  in 2.44
* Drop the PR/HASHEQUIV_HASH_VERSION bump as its comment instructs.

Tested on qemux86-64

[1] https://sourceware.org/pipermail/libc-alpha/2026-July/179159.html

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...2.43.bb => cross-localedef-native_2.44.bb} |   0
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 ...bc-locale_2.43.bb => glibc-locale_2.44.bb} |   0
 ...bc-mtrace_2.43.bb => glibc-mtrace_2.44.bb} |   0
 ...-scripts_2.43.bb => glibc-scripts_2.44.bb} |   0
 ...tsuite_2.43.bb => glibc-testsuite_2.44.bb} |   0
 meta/recipes-core/glibc/glibc-version.inc     |   6 +-
 meta/recipes-core/glibc/glibc.inc             |   4 -
 ...Look-for-host-system-ld.so.cache-as-.patch |   8 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  15 +-
 ...Raise-the-size-of-arrays-containing-.patch |  20 +--
 ...the-path-sets-wrong-config-variables.patch |  10 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  10 +-
 ...port-cross-locale-generation-support.patch |   4 +-
 ...ell-interpreter-overridable-in-tzsel.patch |   8 +-
 ...Use-bin-sh-default-shell-interpreter.patch |   4 +-
 ...u-tests-that-can-hang-in-oe-selftest.patch |  10 +-
 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch |   6 +-
 .../glibc/glibc/0023-CVE-2026-5450.patch      | 135 ------------------
 .../glibc/{glibc_2.43.bb => glibc_2.44.bb}    |  10 +-
 21 files changed, 55 insertions(+), 199 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.43.bb => cross-localedef-native_2.44.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.43.bb => glibc-locale_2.44.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.43.bb => glibc-mtrace_2.44.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.43.bb => glibc-scripts_2.44.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.43.bb => glibc-testsuite_2.44.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch
 rename meta/recipes-core/glibc/{glibc_2.43.bb => glibc_2.44.bb} (92%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7442b2c451..9fbfc80040 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -11,7 +11,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
-GLIBCVERSION ?= "2.43%"
+GLIBCVERSION ?= "2.44%"
 RUSTVERSION ?= "1.96.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.43.bb b/meta/recipes-core/glibc/cross-localedef-native_2.44.bb
similarity index 100%
rename from meta/recipes-core/glibc/cross-localedef-native_2.43.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.44.bb
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 4722440447..42756862be 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,6 +22,6 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.43+git"
+PV = "2.44+git"
 
 TOOLCHAIN = "gcc"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.43.bb b/meta/recipes-core/glibc/glibc-locale_2.44.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.43.bb
rename to meta/recipes-core/glibc/glibc-locale_2.44.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.43.bb b/meta/recipes-core/glibc/glibc-mtrace_2.44.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.43.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.44.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.43.bb b/meta/recipes-core/glibc/glibc-scripts_2.44.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.43.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.44.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.43.bb b/meta/recipes-core/glibc/glibc-testsuite_2.44.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.43.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.44.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index af3db54cee..ea13d8d558 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.43/master"
-PV = "2.43+git"
-SRCREV_glibc ?= "e9517114acc77c0b8af9da6700107df16882b701"
+SRCBRANCH ?= "release/2.44/master"
+PV = "2.44+git"
+SRCREV_glibc ?= "7cba77790f3279bec3ac20e9c7632b021cd53f95"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index d46c31593d..560ebef677 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -3,10 +3,6 @@ require glibc-ld.inc
 
 DEPENDS = "virtual/cross-cc virtual/cross-binutils libgcc-initial linux-libc-headers gawk-replacement-native"
 
-# remove at next version upgrade or when output changes
-PR = "r1"
-HASHEQUIV_HASH_VERSION .= ".1"
-
 PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index e4d97b5827..339205c1fd 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 25e211815d9298f979dc29af9f0586fd8b092e33 Mon Sep 17 00:00:00 2001
+From 97eedb524991309eee4f622db18a4a6016b98ffa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 13:54:16 -0800
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 7355eef8e7..2d32ae9676 100644
+index 95404adae9..c7ae246437 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2043,6 +2043,14 @@ _dl_map_new_object (struct link_map *loader, const char *name,
+@@ -2086,6 +2086,14 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  			&loader->l_runpath_dirs, &realname, &fb, loader,
  			LA_SER_RUNPATH, &found_other_class);
  
@@ -48,7 +48,7 @@ index 7355eef8e7..2d32ae9676 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2101,14 +2109,6 @@ _dl_map_new_object (struct link_map *loader, const char *name,
+@@ -2144,14 +2152,6 @@ _dl_map_new_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 89eb32c703..949dfce1f4 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From e39b52defe90067e5725e99c7238246c68a2500e Mon Sep 17 00:00:00 2001
+From b1161d040b7e1b4023865edfcfbd2913f26132b0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,12 +21,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 2d32ae9676..a706cef129 100644
+index c7ae246437..28880171e1 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1750,7 +1750,19 @@ open_path (const char *name, size_t namelen, int mode,
-        given on the command line when rtld is run directly.  */
-     return -1;
+@@ -1784,10 +1784,22 @@ open_path (const char *name, size_t namelen, int mode,
+      loader rejects empty names well before reaching here).  */
+   assert (namelen >= 1);
  
 +  do
 +    {
@@ -38,7 +38,10 @@ index 2d32ae9676..a706cef129 100644
 +    }
 +  while (*++dirs != NULL);
 +
-   buf = alloca (max_dirnamelen + max_capstrlen + namelen);
+   size_t bufsize = max_dirnamelen + max_capstrlen + namelen;
+   struct dl_scratch_buffer scratch = dl_scratch_buffer_init ();
+   dl_scratch_buffer_allocate (&scratch, bufsize, 0);
+   char *buf = scratch.data;
 +
 +  dirs = sps->dirs;
    do
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 9979344c68..635248bca0 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 179c398399444e772bb9f5c4ef6d8682ce390387 Mon Sep 17 00:00:00 2001
+From 60f2397f95b1291ffe1818b2833fd0edf118713b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 9458ffae2a..0e80847695 100644
+index c6820a9f41..120f560c1d 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -335,6 +335,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
+@@ -345,6 +345,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
    return best;
  }
  
@@ -41,10 +41,10 @@ index 9458ffae2a..0e80847695 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index a706cef129..19a93ea9a8 100644
+index 28880171e1..e7ecee07df 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -107,8 +107,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
+@@ -84,8 +84,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -98,10 +98,10 @@ index bdc7291966..5c401940a5 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index aca967403a..dde1960347 100644
+index a39f3ecfcd..92da658f31 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -150,6 +150,8 @@ static struct argp argp =
+@@ -163,6 +163,8 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -111,10 +111,10 @@ index aca967403a..dde1960347 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 29e7a4ddfa..70483518ed 100644
+index fc053df858..d23a5239f8 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
-@@ -189,6 +189,7 @@ dso_name_valid_for_suid (const char *p)
+@@ -187,6 +187,7 @@ dso_name_valid_for_suid (const char *p)
      }
    return *p != '\0';
  }
@@ -136,7 +136,7 @@ index a1f10ea88a..888d9a18f3 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 26f0c1e0bd..41541a889f 100644
+index 972ab32b86..28ce74affe 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -34,10 +34,6 @@
diff --git a/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
index df49a2fb64..91968abb8c 100644
--- a/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0008-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 0804cd4b41d81095705b8f7f93c222277201dc05 Mon Sep 17 00:00:00 2001
+From 738f10de6f6671739ce61e50326acaf0918184c2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -67,10 +67,10 @@ index b9981861f6..b52cbd88c8 100644
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
 old mode 100644
 new mode 100755
-index 935e022c74..9f7c98bcd3
+index 0cfc1159a0..52113812a7
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
-@@ -153,12 +153,12 @@ else case e in #(
+@@ -205,12 +205,12 @@ else case e in #(
    e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __ARM_PCS_VFP
@@ -86,10 +86,10 @@ index 935e022c74..9f7c98bcd3
    libc_cv_arm_pcs_vfp=yes
  else case e in #(
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
-index cd00ddc9d9..d3831867ac 100644
+index ab864b665b..50f100770f 100644
 --- a/sysdeps/arm/configure.ac
 +++ b/sysdeps/arm/configure.ac
-@@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+@@ -39,8 +39,8 @@ fi
  # the dynamic linker via %ifdef.
  AC_CACHE_CHECK([whether the compiler is using the ARM hard-float ABI],
    [libc_cv_arm_pcs_vfp],
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
index b61e2afcf8..b7291e39fd 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 082861ced3a5dd940f563caae87674d4ae317f83 Mon Sep 17 00:00:00 2001
+From 7993f4c21523e089a403c8ccf68d4b04f15dfb73 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index f81572c20a..127b91af5b 100644
+index a6aabca691..9054e21df6 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -79,9 +79,18 @@ subdir-dirs = include
+@@ -76,9 +76,18 @@ subdir-dirs = include
  vpath %.h $(subdir-dirs)
  
  # What to install.
@@ -52,7 +52,7 @@ index f81572c20a..127b91af5b 100644
  ifeq (yes,$(build-shared))
  headers += gnu/lib-names.h
  endif
-@@ -421,6 +430,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
+@@ -425,6 +434,16 @@ others: $(common-objpfx)testrun.sh $(common-objpfx)debugglibc.sh
  
  subdir-stubs := $(foreach dir,$(subdirs),$(common-objpfx)$(dir)/stubs)
  
@@ -69,7 +69,7 @@ index f81572c20a..127b91af5b 100644
  ifndef abi-variants
  installed-stubs = $(inst_includedir)/gnu/stubs.h
  else
-@@ -447,6 +466,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
+@@ -451,6 +470,7 @@ $(inst_includedir)/gnu/stubs.h: $(+force)
  
  install-others-nosubdir: $(installed-stubs)
  endif
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
index c87f193604..154ecd6920 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 6e7ac803914dbe730521c41ef0ba9803eded0ddd Mon Sep 17 00:00:00 2001
+From c581bc293f319bf6ca11a0ddd02fa5c73ca77e28 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index fc38c02114..05dd3066f3 100644
+index 25f9b5bbce..d692e2afe5 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -30,6 +30,7 @@ headers = \
diff --git a/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index dc493dd3b5..46cca50100 100644
--- a/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0018-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 21d5bbd98ac37ebff143836f3bf2964315e432c6 Mon Sep 17 00:00:00 2001
+From cd372730f78fd39949b1a0c119f7b2450a6706a8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 01d02180b9..603ed955c4 100644
+index e7dbd9fb9e..fd62fdf49b 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
@@ -34,10 +34,10 @@ index 01d02180b9..603ed955c4 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index 386731ab99..5d65520284 100644
+index ce9abe6cb2..721fb70be4 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -145,6 +145,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+@@ -140,6 +140,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
diff --git a/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index 2973e25ce3..9fcd0eb932 100644
--- a/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0019-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From 1c0987c983f3c5d1bbba92dba10781e61029cdae Mon Sep 17 00:00:00 2001
+From 8778596cedde9f04bbffbccbc5c7eb1ef62ae3cc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
@@ -16,7 +16,7 @@ Cc: Paul Eggert <eggert@cs.ucla.edu>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index ca3d82c6aa..1be42814fe 100755
+index 85a8c670e0..dac64e3f1d 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 68d49c4278..07ebfdb3f5 100644
--- a/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -1,4 +1,4 @@
-From a410b7a7e4cd43dd5fbf351bde6b60a4baeb5edd Mon Sep 17 00:00:00 2001
+From 193c11764fb6e3a1fd9f5bf33a25d0e0139ac6d1 Mon Sep 17 00:00:00 2001
 From: Yash Shinde <Yash.Shinde@windriver.com>
 Date: Fri, 5 Apr 2024 08:24:36 -0700
 Subject: [PATCH] tests: Skip 2 qemu tests that can hang in oe-selftest
@@ -20,10 +20,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
-index 955d316362..fd072396dc 100644
+index 14a56d5cc3..5b31dc0ef7 100644
 --- a/sysdeps/unix/sysv/linux/Makefile
 +++ b/sysdeps/unix/sysv/linux/Makefile
-@@ -225,7 +225,6 @@ tests += \
+@@ -226,7 +226,6 @@ tests += \
    tst-sched-affinity-inheritance \
    tst-sched_setattr \
    tst-sched_setattr-thread \
@@ -31,7 +31,7 @@ index 955d316362..fd072396dc 100644
    tst-sigtimedwait \
    tst-sync_file_range \
    tst-syscall-restart \
-@@ -237,6 +236,8 @@ tests += \
+@@ -238,6 +237,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
@@ -40,7 +40,7 @@ index 955d316362..fd072396dc 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -279,9 +280,10 @@ tests-time64 += \
+@@ -280,9 +281,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
index 40c0b34bdf..c6f14da8e7 100644
--- a/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -1,4 +1,4 @@
-From c52e8734d043ed43d21370b2c29104fdc8cc8cb7 Mon Sep 17 00:00:00 2001
+From bfb6add8bda9ad7cb7f969f061e3c24bbb8604cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 16 Apr 2025 19:51:01 -0700
 Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makeconfig b/Makeconfig
-index 603ed955c4..2f0e5d25f8 100644
+index fd62fdf49b..970b0dc32d 100644
 --- a/Makeconfig
 +++ b/Makeconfig
-@@ -1194,7 +1194,7 @@ endif
+@@ -1215,7 +1215,7 @@ endif
  
  # The assembler can generate debug information too.
  ifndef ASFLAGS
diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch
deleted file mode 100644
index 22408708ac..0000000000
--- a/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From e3e9a51815d6582206eef9b3f5ce408507c81e2c Mon Sep 17 00:00:00 2001
-From: Rocket Ma <marocketbd@gmail.com>
-Date: Wed, 20 May 2026 07:01:58 -0700
-Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
-
-* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
-format %mc or %mC, glibc allocates one byte less, leading to
-user-controlled one byte overflow. This commit fixes BZ #34008, or
-CVE-2026-5450.
-
-Upstream-Status: Backport [http://sourceware.org/git/gitweb.cgi?p=glibc.git;h=839898777226a3ed88c0859f25ffe712519b4ead]
-CVE: CVE-2026-5450
-
-Reviewed-by: Carlos O'Donell <carlos@redhat.com>
-Signed-off-by: Rocket Ma <marocketbd@gmail.com>
-Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- stdio-common/Makefile              |  4 +++
- stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
- stdio-common/vfscanf-internal.c    |  7 ++---
- 3 files changed, 55 insertions(+), 4 deletions(-)
- create mode 100644 stdio-common/tst-vfscanf-bz34008.c
-
-diff --git a/stdio-common/Makefile b/stdio-common/Makefile
-index 21094483..0c0085e6 100644
---- a/stdio-common/Makefile
-+++ b/stdio-common/Makefile
-@@ -349,6 +349,7 @@ tests := \
-   tst-vfprintf-user-type \
-   tst-vfprintf-width-i18n \
-   tst-vfprintf-width-prec-alloc \
-+  tst-vfscanf-bz34008 \
-   tst-wc-printf \
-   tstdiomisc \
-   tstgetln \
-@@ -564,6 +565,9 @@ tst-printf-bz18872-ENV = MALLOC_TRACE=$(objpfx)tst-printf-bz18872.mtrace \
- tst-vfprintf-width-prec-ENV = \
-   MALLOC_TRACE=$(objpfx)tst-vfprintf-width-prec.mtrace \
-   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
-+tst-vfscanf-bz34008-ENV = \
-+  MALLOC_CHECK_=3 \
-+  LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
- tst-printf-bz25691-ENV = \
-   MALLOC_TRACE=$(objpfx)tst-printf-bz25691.mtrace \
-   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
-diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf-bz34008.c
-new file mode 100644
-index 00000000..48371c8a
---- /dev/null
-+++ b/stdio-common/tst-vfscanf-bz34008.c
-@@ -0,0 +1,48 @@
-+/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
-+   Copyright (C) 2026 The GNU Toolchain Authors.
-+   This file is part of the GNU C Library.
-+
-+   The GNU C Library is free software; you can redistribute it and/or
-+   modify it under the terms of the GNU Lesser General Public
-+   License as published by the Free Software Foundation; either
-+   version 2.1 of the License, or (at your option) any later version.
-+
-+   The GNU C Library is distributed in the hope that it will be useful,
-+   but WITHOUT ANY WARRANTY; without even the implied warranty of
-+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+   Lesser General Public License for more details.
-+
-+   You should have received a copy of the GNU Lesser General Public
-+   License along with the GNU C Library; if not, see
-+   <https://www.gnu.org/licenses/>.  */
-+
-+#include "malloc/mcheck.h"
-+#include <stddef.h>
-+#include <stdio.h>
-+#include <string.h>
-+#include <wchar.h>
-+#include <stdlib.h>
-+#include <malloc.h>
-+#include <support/check.h>
-+
-+#define WIDTH 0x410
-+#define SCANFSTR "%1040mc"
-+static int
-+do_test (void)
-+{
-+  mcheck_pedantic (NULL);
-+  char *input = malloc (WIDTH + 1);
-+  TEST_VERIFY (input != NULL);
-+  memset (input, 'A', WIDTH);
-+  input[WIDTH] = '\0';
-+
-+  char *buf = NULL;
-+  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) != -1);
-+  TEST_VERIFY (buf != NULL);
-+
-+  free (buf);
-+  free (input);
-+  return 0;
-+}
-+
-+#include <support/test-driver.c>
-diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-internal.c
-index 63b9246e..8687150d 100644
---- a/stdio-common/vfscanf-internal.c
-+++ b/stdio-common/vfscanf-internal.c
-@@ -862,8 +862,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
- 			{
- 			  /* Enlarge the buffer.  */
- 			  size_t newsize
--			    = strsize
--			      + (strsize >= width ? width - 1 : strsize);
-+			    = strsize + (strsize >= width ? width : strsize);
- 
- 			  str = (char *) realloc (*strptr, newsize);
- 			  if (str == NULL)
-@@ -936,7 +935,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
- 		      && wstr == (wchar_t *) *strptr + strsize)
- 		    {
- 		      size_t newsize
--			= strsize + (strsize > width ? width - 1 : strsize);
-+			= strsize + (strsize >= width ? width : strsize);
- 		      /* Enlarge the buffer.  */
- 		      wstr = (wchar_t *) realloc (*strptr,
- 						  newsize * sizeof (wchar_t));
-@@ -991,7 +990,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
- 		    && wstr == (wchar_t *) *strptr + strsize)
- 		  {
- 		    size_t newsize
--		      = strsize + (strsize > width ? width - 1 : strsize);
-+		      = strsize + (strsize >= width ? width : strsize);
- 		    /* Enlarge the buffer.  */
- 		    wstr = (wchar_t *) realloc (*strptr,
- 						newsize * sizeof (wchar_t));
--- 
-2.49.0
-
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.44.bb
similarity index 92%
rename from meta/recipes-core/glibc/glibc_2.43.bb
rename to meta/recipes-core/glibc/glibc_2.44.bb
index 67f9e63f2c..9c93c05fe9 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.44.bb
@@ -16,12 +16,6 @@ CVE_STATUS[CVE-2019-1010025] = "disputed: \
 Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, may allow \
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
-CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438 \
-    CVE-2026-4046 \
-"
-CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
-
 DEPENDS += "gperf-native bison-native"
 
 NATIVESDKFIXES ?= ""
@@ -54,7 +48,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
-           file://0023-CVE-2026-5450.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
@@ -87,10 +80,9 @@ EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
 
 EXTRA_OECONF:append:x86-64 = " --enable-cet"
 
-PACKAGECONFIG ??= "memory-tagging"
+PACKAGECONFIG ??= ""
 
 PACKAGECONFIG[nscd] = "--enable-nscd,--disable-nscd"
-PACKAGECONFIG[memory-tagging] = "--enable-memory-tagging,--disable-memory-tagging"
 
 do_patch:append() {
     bb.build.exec_func('do_fix_readlib_c', d)

