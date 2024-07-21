Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF118C3DA64
	for <webhook@archiver.kernel.org>; Sun, 21 Jul 2024 18:03:49 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.1449.1721585022130218445
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jul 2024 11:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G7Wahyqj;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso669714b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 11:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721585021; x=1722189821; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z/OjCrnzpibjeImaLu/idMQuauXX83kC2INUn3OIwqo=;
        b=G7WahyqjjTlM6v/vKs77WoaD28WeY7BwNr7PlaeAKB6AzTzqvdOqISs5Q1/GdbUPya
         PMoePcA+xFeo/iXCAKPXOGUEDJeJlMvAP+rD5Jal5EaGdpxsNCs59u6RZKMafVWIGEzc
         WgfkU3+nXu/LnDLwcHMF8ZpEOLhmtZrFbW+d5NmWF80nH1QJQYK9dF1Mk6Oq5JeXFTBc
         8wKIBca/Y9OfrjQqrU+2Em2epkbvbWwpm8+G+vF3zZ50na0BYNQjcbPhHmC4/sWPPPru
         iOhkUj7xVWcTnjNNDMCpAzimZHvdMHImG64Qs36JKj4g1s4RuyTQv982rDUuOBR/eJNl
         pX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721585021; x=1722189821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/OjCrnzpibjeImaLu/idMQuauXX83kC2INUn3OIwqo=;
        b=dbzUOjG4qxoRVkjr+FyySMmE85rA3ZHrBxrtr6BGaqZIzjz0jSPI54GnYIZwSCxN03
         Qmeak61/4N6SbV6K4lBV1J3vEu3N+8UmnH1083pRRk/4EAH0H9fDVfF4b8I34wFj+fLM
         Gu7Ftw7O0di52s7Na8U5LaOKXSP3B01q1YCf0S86rFxsxDv1oS3eW8DFfH/rQ2OTblGF
         sMEEogpZMD5n/79aTgE+TIZPzORko28PPr8MRr+8ExqddEsUGPSdS37CBzk9BFvAI1yF
         b5gsxjT2wKiyiPefyGIr92N6UNwXj3KiD4SftVgsnPAvZkYd6k0NN1CZ6yll+eEkjfTR
         Q8fw==
X-Gm-Message-State: AOJu0Yyxuk8/Cwy3okJvqRt7k9SOxyGboTEzKzvMPOocvfscR0uybKhM
	zcXYSWEbdYYcn7RaO97aPNznoQAoxBap+5EUyEotk2loTVBVYngflCRSzn2U
X-Google-Smtp-Source: AGHT+IEQo1g9Jn7zF1u1bZmoVnoiRuirO56S80binSLUlZE0IkxEmWZ55Rk/cU8XDidlV09VAe5nAA==
X-Received: by 2002:a05:6a00:ad3:b0:70b:152:331 with SMTP id d2e1a72fcca58-70d085edda4mr6549817b3a.21.1721585020899;
        Sun, 21 Jul 2024 11:03:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d142246b0sm2155803b3a.14.2024.07.21.11.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 11:03:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [RFT][PATCH 1/2] glibc: Upgrade to 2.40
Date: Sun, 21 Jul 2024 11:03:35 -0700
Message-ID: <20240721180336.2642270-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jul 2024 18:03:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202298

Major new features:

* The <stdbit.h> header type-generic macros have been changed when using
  GCC 14.1 or later to use __builtin_stdc_bit_ceil etc. built-in functions
  in order to support unsigned __int128 and/or unsigned _BitInt(N) operands
  with arbitrary precisions when supported by the target.

* The GNU C Library now supports a feature test macro _ISOC23_SOURCE to
  enable features from the ISO C23 standard.  Only some features from
  this standard are supported by the GNU C Library.  The older name
  _ISOC2X_SOURCE is still supported.  Features from C23 are also enabled
  by _GNU_SOURCE, or by compiling with the GCC options -std=c23,
  -std=gnu23, -std=c2x or -std=gnu2x.

* The following ISO C23 function families (introduced in TS
  18661-4:2015) are now supported in <math.h>.  Each family includes
  functions for float, double, long double, _FloatN and _FloatNx, and a
  type-generic macro in <tgmath.h>.

  - Exponential functions: exp2m1, exp10m1.

  - Logarithmic functions: log2p1, log10p1, logp1.

* A new tunable, glibc.rtld.enable_secure, can be used to run a program
  as if it were a setuid process. This is currently a testing tool to allow
  more extensive verification tests for AT_SECURE programs and not meant to
  be a security feature.

* On Linux, the epoll header was updated to include epoll ioctl definitions
  and the related structure added in Linux kernel 6.9.

* The fortify functionality has been significantly enhanced for building
  programs with clang against the GNU C Library.

* Many functions have been added to the vector library for aarch64:
    acosh, asinh, atanh, cbrt, cosh, erf, erfc, hypot, pow, sinh, tanh

* On x86, memset can now use non-temporal stores to improve the performance
  of large writes. This behaviour is controlled by a new tunable
  x86_memset_non_temporal_threshold.

Deprecated and removed features, and other changes affecting compatibility:

* Architectures which use a 32-bit seconds-since-epoch field in struct
  lastlog, struct utmp, struct utmpx (such as i386, powerpc64le, rv32,
  rv64, x86-64) switched from a signed to an unsigned type for that
  field.  This allows these fields to store timestamps beyond the year
  2038, until the year 2106.  Please note that applications are still
  expected to migrate off the interfaces declared in <utmp.h> and
  <utmpx.h> (except for login_tty) due to locking and session management
  problems.

* __rseq_size now denotes the size of the active rseq area (20 bytes
  initially), not the size of struct rseq (32 bytes initially).

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.39.bb => cross-localedef-native_2.40.bb} |  0
 meta/recipes-core/glibc/glibc-common.inc      |  2 +-
 ...bc-locale_2.39.bb => glibc-locale_2.40.bb} |  0
 ...bc-mtrace_2.39.bb => glibc-mtrace_2.40.bb} |  0
 ...-scripts_2.39.bb => glibc-scripts_2.40.bb} |  0
 ...tsuite_2.39.bb => glibc-testsuite_2.40.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  6 +-
 ...ests_2.39.bb => glibc-y2038-tests_2.40.bb} |  0
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch | 30 +++---
 ...Fix-buffer-overrun-with-a-relocated-.patch |  6 +-
 ...Raise-the-size-of-arrays-containing-.patch | 12 +--
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  2 +-
 ...Make-relocatable-install-for-locales.patch |  4 +-
 ...Fall-back-to-faccessat-on-faccess2-r.patch |  2 +-
 ...the-path-sets-wrong-config-variables.patch | 99 +++++++++++--------
 ...ss-building-and-testing-instructions.patch |  2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  4 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  2 +-
 ...port-cross-locale-generation-support.patch |  2 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |  2 +-
 ...Do-not-ask-compiler-for-finding-arch.patch |  6 +-
 ...y-the-header-between-arm-and-aarch64.patch | 55 ++---------
 ...h-printf-builtin-in-nscd-init-script.patch |  2 +-
 ...igure.ac-Set-libc_cv_rootsbindir-onl.patch |  2 +-
 ...ell-interpreter-overridable-in-tzsel.patch |  8 +-
 ...Use-bin-sh-default-shell-interpreter.patch |  4 +-
 ...d-failed-in-unprivileged-process-BZ-.patch |  2 +-
 ...build-time-paths-in-the-output-binar.patch |  6 +-
 ...-tests-that-can-hang-in-oe-selftest.patch} | 27 +++--
 .../glibc/{glibc_2.39.bb => glibc_2.40.bb}    |  4 +-
 33 files changed, 141 insertions(+), 156 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.39.bb => cross-localedef-native_2.40.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.39.bb => glibc-locale_2.40.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.39.bb => glibc-mtrace_2.40.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.39.bb => glibc-scripts_2.40.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.39.bb => glibc-testsuite_2.40.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-y2038-tests_2.39.bb => glibc-y2038-tests_2.40.bb} (100%)
 rename meta/recipes-core/glibc/glibc/{0023-qemu-stale-process.patch => 0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch} (61%)
 rename meta/recipes-core/glibc/{glibc_2.39.bb => glibc_2.40.bb} (97%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index c77ce9aa52a..23a4ace4a67 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.42%"
 GDBVERSION ?= "15.%"
-GLIBCVERSION ?= "2.39%"
+GLIBCVERSION ?= "2.40%"
 LINUXLIBCVERSION ?= "6.9%"
 QEMUVERSION ?= "9.0%"
 GOVERSION ?= "1.22%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.39.bb b/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/cross-localedef-native_2.39.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 91a3f5bcd5c..72d5dcd74bb 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.39+git"
+PV = "2.40+git"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.39.bb b/meta/recipes-core/glibc/glibc-locale_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.39.bb
rename to meta/recipes-core/glibc/glibc-locale_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.39.bb b/meta/recipes-core/glibc/glibc-mtrace_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.39.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.39.bb b/meta/recipes-core/glibc/glibc-scripts_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.39.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.39.bb b/meta/recipes-core/glibc/glibc-testsuite_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.39.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ad58bebcf13..6e167b6ca4a 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.39/master"
-PV = "2.39+git"
-SRCREV_glibc ?= "e8f521709731ce3ae8d6f1eca30135d5c0606f02"
+SRCBRANCH ?= "release/2.40/master"
+PV = "2.40+git"
+SRCREV_glibc ?= "6daa77104520ca992a9369bd01cccd4d98c82984"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-y2038-tests_2.39.bb
rename to meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index 4f919078dd0..e4fb2a7a285 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From 544d23dea91b2be793c805b9e4bce8cd1d28121f Mon Sep 17 00:00:00 2001
+From c22fc168dd00cdabcf24a54b4d9383a3f1a7b313 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 7c8fa973ec3..1bbd07d3313 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From ebb1e37285ab541135005cfe945b7a58e4b95040 Mon Sep 17 00:00:00 2001
+From fe564c5944621f240dd28a1b4157504384635518 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index bd4b5aa98b3..650e6087506 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,6 +1,6 @@
-From 9770abfda8e85fe027f95871bc03450d05b1e2c8 Mon Sep 17 00:00:00 2001
+From 213a4e5b43369f24d6f07a7c971f3909ec5d26a3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Mar 2015 01:48:24 +0000
+Date: Sat, 3 Feb 2024 13:54:16 -0800
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
 
 Upstream-Status: Inappropriate [embedded specific]
@@ -30,25 +30,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index ce8fdea302..1f502eb026 100644
+index 8a89b71016..1ea5415b76 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2105,6 +2105,14 @@ _dl_map_object (struct link_map *loader, const char *name,
-             }
-         }
+@@ -2046,6 +2046,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+ 			&loader->l_runpath_dirs, &realname, &fb, loader,
+ 			LA_SER_RUNPATH, &found_other_class);
  
-+      /* try the default path.  */
-+      if (fd == -1
-+	  && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
-+	   || __builtin_expect (!(l->l_flags_1 & DF_1_NODEFLIB), 1))
-+	 && __rtld_search_dirs.dirs != (void *) -1)
-+	fd = open_path (name, namelen, mode & __RTLD_SECURE, &__rtld_search_dirs,
-+			&realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
-+      /* Finally try ld.so.cache */
++    /* Try the default path.  */
++    if (fd == -1
++      && ((l = loader ?: GL(dl_ns)[nsid]._ns_loaded) == NULL
++      || __glibc_likely (!(l->l_flags_1 & DF_1_NODEFLIB)))
++      && __rtld_search_dirs.dirs != (void *) -1)
++      fd = open_path (name, namelen, mode, &__rtld_search_dirs,
++                      &realname, &fb, l, LA_SER_DEFAULT, &found_other_class);
++  /* Finally try ld.so.cache */
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2163,14 +2171,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2104,14 +2112,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 19fc561a068..b98b6ec5fba 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From 587b92ff99e6d8f59c461ee8beecae39d8818f7e Mon Sep 17 00:00:00 2001
+From c17e485fc4ff3f7f16a824b43372bc9e3fe57dd6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 1f502eb026..c4a543fb00 100644
+index 1ea5415b76..e149dd7e76 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1802,7 +1802,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1757,7 +1757,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 55892417f49..21c39dce596 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 49caf586b80ba030a0ee4af9f6128ff2979ea636 Mon Sep 17 00:00:00 2001
+From 97229d19eca7d93d38ed7893640efe36a57e7bcb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,10 +26,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 85f3f179ed..cc55887c56 100644
+index 7c7dc58745..0147a281ad 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
-@@ -352,6 +352,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
+@@ -336,6 +336,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
    return best;
  }
  
@@ -41,10 +41,10 @@ index 85f3f179ed..cc55887c56 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index c4a543fb00..27fb70f09b 100644
+index e149dd7e76..c99ce0ee45 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -117,8 +117,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
+@@ -106,8 +106,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -111,7 +111,7 @@ index b64c54b53e..caf7001745 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 4f494b792e..d1c1252188 100644
+index 6352ba76c5..02316b8b16 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index 56eaaed4b7c..b867ffde482 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From 3a94365c730d174a3c30c6d9282e6ca12d9ad091 Mon Sep 17 00:00:00 2001
+From 680ceb8bf43f07884674a08423b8a1c15d1a48b5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 54c085a7144..a1d4f077249 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From 296bdde0683aa55cdea0fd0cab05ff8fbc462b17 Mon Sep 17 00:00:00 2001
+From 88c37776dca4603d6618fd7a12a055a15e2a519e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 8d6e4e33e3..bfe74f241d 100644
+index 43ff7201c1..9684a4249b 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index 096764009a1..09f64421ae0 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 70da806febac8b2eead6ddc32451bbc1787a1d7d Mon Sep 17 00:00:00 2001
+From ab38fdad1d435b68ae2d178f2e5d24c77f4e8d98 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index 364e5cfde82..b862b12d669 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From 2192588942c5bc3b5fa10fc6d7433923f42e9ba0 Mon Sep 17 00:00:00 2001
+From cac7bbbc82423697f8d3223222db8b787b63f500 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -27,13 +27,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  sysdeps/unix/sysv/linux/powerpc/powerpc64/configure    | 8 ++++----
  sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac | 8 ++++----
  12 files changed, 28 insertions(+), 28 deletions(-)
+ mode change 100644 => 100755 sysdeps/arm/configure
+ mode change 100644 => 100755 sysdeps/mips/configure
+ mode change 100644 => 100755 sysdeps/nios2/configure
+ mode change 100644 => 100755 sysdeps/unix/sysv/linux/mips/configure
+ mode change 100644 => 100755 sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index ca57edce47..5e91fab023 100644
+index 4bd5496a4a..6c051369fb 100755
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
-@@ -165,12 +165,12 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -157,12 +157,12 @@ else case e in #(
+   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __AARCH64EB__
 -                      yes
@@ -42,13 +47,13 @@ index ca57edce47..5e91fab023 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "is_aarch64_be" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "is_aarch64_be" >/dev/null 2>&1
  then :
    libc_cv_aarch64_be=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 27874eceb4..8a708f2ef4 100644
+index 56d12d661d..80fca20873 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
@@ -63,11 +68,13 @@ index 27874eceb4..8a708f2ef4 100644
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 35e2918922..94d7fbe8bb 100644
+old mode 100644
+new mode 100755
+index 935e022c74..9f7c98bcd3
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
-@@ -161,12 +161,12 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -153,12 +153,12 @@ else case e in #(
+   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __ARM_PCS_VFP
 -		      yes
@@ -76,13 +83,13 @@ index 35e2918922..94d7fbe8bb 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "use_arm_pcs_vfp" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "use_arm_pcs_vfp" >/dev/null 2>&1
  then :
    libc_cv_arm_pcs_vfp=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
-index 5172e30bbe..f06dedd7c5 100644
+index cd00ddc9d9..d3831867ac 100644
 --- a/sysdeps/arm/configure.ac
 +++ b/sysdeps/arm/configure.ac
 @@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
@@ -97,10 +104,12 @@ index 5172e30bbe..f06dedd7c5 100644
    ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
  if test $libc_cv_arm_pcs_vfp = yes; then
 diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
-index 1e8c6711e6..ae52ccd929 100644
+old mode 100644
+new mode 100755
+index 60dbd947e2..e3d10d7b96
 --- a/sysdeps/mips/configure
 +++ b/sysdeps/mips/configure
-@@ -158,11 +158,11 @@ else $as_nop
+@@ -150,11 +150,11 @@ else case e in #(
  /* end confdefs.h.  */
  dnl
  #ifdef __mips_nan2008
@@ -109,11 +118,11 @@ index 1e8c6711e6..ae52ccd929 100644
  #endif
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "use_mips_nan2008" >/dev/null 2>&1
  then :
    libc_cv_mips_nan2008=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
 index d3cd780d78..250223d206 100644
 --- a/sysdeps/mips/configure.ac
@@ -131,11 +140,13 @@ index d3cd780d78..250223d206 100644
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
 diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-index 2fb230cbaa..1959d0a444 100644
+old mode 100644
+new mode 100755
+index d25684d5ad..5801978aee
 --- a/sysdeps/nios2/configure
 +++ b/sysdeps/nios2/configure
-@@ -155,12 +155,12 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -147,12 +147,12 @@ else case e in #(
+   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __nios2_big_endian__
 -                      yes
@@ -144,11 +155,11 @@ index 2fb230cbaa..1959d0a444 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "is_nios2_be" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "is_nios2_be" >/dev/null 2>&1
  then :
    libc_cv_nios2_be=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
 index f738e9a7ed..4085851cbc 100644
 --- a/sysdeps/nios2/configure.ac
@@ -165,10 +176,12 @@ index f738e9a7ed..4085851cbc 100644
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index a060901de4..0ac7019438 100644
+old mode 100644
+new mode 100755
+index 6e3402c111..a23f24ef8e
 --- a/sysdeps/unix/sysv/linux/mips/configure
 +++ b/sysdeps/unix/sysv/linux/mips/configure
-@@ -441,11 +441,11 @@ else $as_nop
+@@ -443,11 +443,11 @@ else case e in #(
  /* end confdefs.h.  */
  dnl
  #ifdef __mips_nan2008
@@ -177,11 +190,11 @@ index a060901de4..0ac7019438 100644
  #endif
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "use_mips_nan2008" >/dev/null 2>&1
  then :
    libc_cv_mips_nan2008=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
 index 049a0f4bdf..005526d4e8 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
@@ -199,11 +212,13 @@ index 049a0f4bdf..005526d4e8 100644
  
  libc_mips_nan=
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-index cf1b70c745..0dccf6cd76 100644
+old mode 100644
+new mode 100755
+index 5dd70689fc..7d6c2322d3
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-@@ -168,12 +168,12 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+@@ -160,12 +160,12 @@ else case e in #(
+   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #if _CALL_ELF == 2
 -                      yes
@@ -212,13 +227,13 @@ index cf1b70c745..0dccf6cd76 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "use_ppc_elfv2_abi" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "use_ppc_elfv2_abi" >/dev/null 2>&1
  then :
    libc_cv_ppc64_elfv2_abi=yes
- else $as_nop
-@@ -203,12 +203,12 @@ else $as_nop
-   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ else case e in #(
+@@ -197,12 +197,12 @@ else case e in #(
+   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef _CALL_ELF
 -                         yes
@@ -227,11 +242,11 @@ index cf1b70c745..0dccf6cd76 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1
-+  $EGREP "is_def_call_elf" >/dev/null 2>&1
+-  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
++  $EGREP_TRADITIONAL "is_def_call_elf" >/dev/null 2>&1
  then :
    libc_cv_ppc64_def_call_elf=yes
- else $as_nop
+ else case e in #(
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
 index f9cba6e15d..b21f72f1e4 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index d7f15c1cfa2..8b79916b81b 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From ce8b13bdf488058754fce573754cea0b022c37e2 Mon Sep 17 00:00:00 2001
+From 8216e0927262392f3b60a5cc5592d39c9f18ef3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 82a32926555..02751337904 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 65b79161b9e2848a174d3519a03348884f182975 Mon Sep 17 00:00:00 2001
+From bd4b95bcc335599e736a3554112f1e912a79542b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 7052b46df8..46073abaa8 100644
+index c84f266ce7..790c717958 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index e726a9e76fe..91e52a0db93 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 07a5fa22a9a8bbd43982c1b35132f8c2d5276bfe Mon Sep 17 00:00:00 2001
+From ab08ea10e9bc8a91f83fea12ccf40abf1a150326 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index f36b7f6f4cc..ae14ba82dba 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From 33e9867758e830e19d181d5a0aa7f2f3cc4a08b3 Mon Sep 17 00:00:00 2001
+From ae0b0897228da4c8815061fe57d9b31c2b742dbc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index daeff7b0653..94d5abf72f2 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From f4b1d6429298c0f8a2aa29ff559eb2093ea0188f Mon Sep 17 00:00:00 2001
+From ccac9ff221fa08dbe330ae75a570da33edaaac4e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index 8dd1f0a6567..51d152f8c04 100644
--- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 2d064c0c1243ea0bf405909285d7cddca92cf097 Mon Sep 17 00:00:00 2001
+From e79835037312f8d58c8c555e1ebf5746e09d10cd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/sysdeps/powerpc/preconfigure b/sysdeps/powerpc/preconfigure
-index 4de94089a3..428ad7b162 100644
+index 9e5a07ab6d..a308bdd863 100644
 --- a/sysdeps/powerpc/preconfigure
 +++ b/sysdeps/powerpc/preconfigure
 @@ -29,10 +29,7 @@ esac
@@ -31,7 +31,7 @@ index 4de94089a3..428ad7b162 100644
    # directory exists in sysdeps/powerpc.  Likewise, if we find a
    # cpu, don't let the generic configure append extra compiler options.
 diff --git a/sysdeps/powerpc/preconfigure.ac b/sysdeps/powerpc/preconfigure.ac
-index 6c63bd8257..3e925f1d48 100644
+index 14b6dafd4a..1acc6a457c 100644
 --- a/sysdeps/powerpc/preconfigure.ac
 +++ b/sysdeps/powerpc/preconfigure.ac
 @@ -29,10 +29,7 @@ esac
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 9bdfa763189..d269b6f0af6 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From b1c374f7ede81a98f2d02def2c7ca17f1001f7cb Mon Sep 17 00:00:00 2001
+From 3be9d4a66f83a64b26ffa0869385e4a0f623dd44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -11,15 +11,14 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h | 11 +++++++++--
- sysdeps/arm/bits/wordsize.h     | 22 +---------------------
- 2 files changed, 10 insertions(+), 23 deletions(-)
+ sysdeps/aarch64/bits/wordsize.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 118e59172d..ff86359fe8 100644
+index 118e59172d..b4b0692eb5 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
-@@ -17,12 +17,19 @@
+@@ -17,12 +17,16 @@
     License along with the GNU C Library; if not, see
     <https://www.gnu.org/licenses/>.  */
  
@@ -32,47 +31,9 @@ index 118e59172d..ff86359fe8 100644
  # define __WORDSIZE32_SIZE_ULONG	1
  # define __WORDSIZE32_PTRDIFF_LONG	1
 +#else
-+#define __WORDSIZE			32
-+#define __WORDSIZE_TIME64_COMPAT32	1
-+#define __WORDSIZE32_SIZE_ULONG		0
-+#define __WORDSIZE32_PTRDIFF_LONG	0
++# define __WORDSIZE			32
++# define __WORDSIZE32_SIZE_ULONG	0
++# define __WORDSIZE32_PTRDIFF_LONG	0
  #endif
  
-+#ifdef __aarch64__
  #define __WORDSIZE_TIME64_COMPAT32	0
-+#endif
-diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-deleted file mode 100644
-index 6ecbfe7c86..0000000000
---- a/sysdeps/arm/bits/wordsize.h
-+++ /dev/null
-@@ -1,21 +0,0 @@
--/* Copyright (C) 1999-2024 Free Software Foundation, Inc.
--   This file is part of the GNU C Library.
--
--   The GNU C Library is free software; you can redistribute it and/or
--   modify it under the terms of the GNU Lesser General Public
--   License as published by the Free Software Foundation; either
--   version 2.1 of the License, or (at your option) any later version.
--
--   The GNU C Library is distributed in the hope that it will be useful,
--   but WITHOUT ANY WARRANTY; without even the implied warranty of
--   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--   Lesser General Public License for more details.
--
--   You should have received a copy of the GNU Lesser General Public
--   License along with the GNU C Library; if not, see
--   <https://www.gnu.org/licenses/>.  */
--
--#define __WORDSIZE			32
--#define __WORDSIZE_TIME64_COMPAT32	1
--#define __WORDSIZE32_SIZE_ULONG		0
--#define __WORDSIZE32_PTRDIFF_LONG	0
-diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-new file mode 120000
-index 0000000000..4c4a788ec2
---- /dev/null
-+++ b/sysdeps/arm/bits/wordsize.h
-@@ -0,0 +1 @@
-+../../aarch64/bits/wordsize.h
-\ No newline at end of file
diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index d8c0b1b4add..ff60c00102e 100644
--- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 0aac3b8ee5b13e289b6969da51de384443286a5b Mon Sep 17 00:00:00 2001
+From 0a29c4828c2440bf4768f4342480958a67d58954 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index c81f82f4335..e4bc40b1238 100644
--- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From 7a25d4796411f22f824742092a4c2a08df99752d Mon Sep 17 00:00:00 2001
+From 1b1e654726931c27c86cf9c68371c32410f8d766 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index d724c3e968d..24dd4dad562 100644
--- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 6aa1b835d95482287851e02abd3a406cbd0ef8c7 Mon Sep 17 00:00:00 2001
+From 99aac9db31f52c3b59b32c424b26d881069aa5df Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 85e00cef94..643724108a 100644
+index 2d4343b604..1992e19c4e 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
@@ -34,10 +34,10 @@ index 85e00cef94..643724108a 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index d7acb387ba..ec79326f66 100644
+index cf4ef3bf7e..559b9a7e3d 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
-@@ -136,6 +136,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
+@@ -143,6 +143,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
  	    -e '/TZVERSION=/s|see_Makefile|"$(version)"|' \
  	    -e '/PKGVERSION=/s|=.*|="$(PKGVERSION)"|' \
  	    -e '/REPORT_BUGS_TO=/s|=.*|="$(REPORT_BUGS_TO)"|' \
diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index 08c60a271b4..c294dda29d7 100644
--- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From ef47e6199986c4951e681ed74f064042db1ae2e1 Mon Sep 17 00:00:00 2001
+From 4c68d7aa739ebd997db43d73cf2a43b776969c89 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
@@ -16,7 +16,7 @@ Cc: Paul Eggert <eggert@cs.ucla.edu>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index 18fce27e24..cc08efb0fb 100755
+index 38941bbc55..588bcb9f06 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index d57dce125c7..6f7b765accd 100644
--- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 7254706544be5100843fc0a332e836fccffc9ef1 Mon Sep 17 00:00:00 2001
+From 5352c59f08d8e5e1f44fb5834d6bbbd3a20bdd36 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index b527ddffc83..f8e73662e70 100644
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,4 +1,4 @@
-From d39779afc72d34f87f052097592008cc38e20615 Mon Sep 17 00:00:00 2001
+From 51694f72b7326d36e51214eb2af0be1d6831c7a4 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 24 Jul 2022 07:07:29 -0700
 Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/support/Makefile b/support/Makefile
-index 362a51f882..56d2b37058 100644
+index aa57207bdc..3c66cec6c8 100644
 --- a/support/Makefile
 +++ b/support/Makefile
-@@ -228,9 +228,9 @@ libsupport-inhibit-o += .o
+@@ -229,9 +229,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
similarity index 61%
rename from meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
rename to meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index c0a467fcec2..256dab45f99 100644
--- a/meta/recipes-core/glibc/glibc/0023-qemu-stale-process.patch
+++ b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -1,4 +1,7 @@
-glibc: Skip 2 qemu tests that can hang in oe-selftest
+From 19795af92830251dd03943bda4825def5bf774c4 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <Yash.Shinde@windriver.com>
+Date: Fri, 5 Apr 2024 08:24:36 -0700
+Subject: [PATCH] tests: Skip 2 qemu tests that can hang in oe-selftest
 
 qemumips and qemuppc were leaving stale processes behind after
 running glibc oe-selftest. During analysis, it was found that
@@ -9,12 +12,18 @@ Disable them so that there are no stale processes left behind.
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=15423
 
 Upstream-Status: Inappropriate [oe-core specific]
+
 Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefile
---- a/sysdeps/unix/sysv/linux/Makefile    2024-03-18 01:15:49.019202881 -0700
-+++ b/sysdeps/unix/sysv/linux/Makefile  2024-03-14 06:26:18.581404107 -0700
-@@ -222,7 +222,6 @@
+ sysdeps/unix/sysv/linux/Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
+index ae66590e91..b2f0469273 100644
+--- a/sysdeps/unix/sysv/linux/Makefile
++++ b/sysdeps/unix/sysv/linux/Makefile
+@@ -223,7 +223,6 @@ tests += \
    tst-process_mrelease \
    tst-quota \
    tst-rlimit-infinity \
@@ -22,16 +31,16 @@ diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefil
    tst-sigtimedwait \
    tst-sync_file_range \
    tst-sysconf-iov_max \
-@@ -233,6 +232,8 @@
+@@ -234,6 +233,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
 +  # Skip this test to avoid stale qemu process
 +  # tst-scm_rights \
    # tests
-
+ 
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -270,9 +271,10 @@
+@@ -271,9 +272,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
@@ -41,5 +50,5 @@ diff --git a/sysdeps/unix/sysv/linux/Makefile  b/sysdeps/unix/sysv/linux/Makefil
 +  # Skip this test to avoid stale qemu process
 +  # tst-scm_rights-time64 \
    # tests-time64
-
+ 
  tests-clone-internal = \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.40.bb
similarity index 97%
rename from meta/recipes-core/glibc/glibc_2.39.bb
rename to meta/recipes-core/glibc/glibc_2.40.bb
index 411d226ef60..86f9fb927e7 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.40.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
-CVE_STATUS_STABLE_BACKPORTS = "CVE-2024-2961 CVE-2024-33599 CVE-2024-33600 CVE-2024-33601 CVE-2024-33602"
+CVE_STATUS_STABLE_BACKPORTS = ""
 CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
 
 DEPENDS += "gperf-native bison-native"
@@ -52,7 +52,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
-           file://0023-qemu-stale-process.patch \
+           file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"

