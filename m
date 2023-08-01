Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084EDC04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 03:27:17 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.5046.1690860426898843454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 20:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IoQJm3Yh;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-564232debf2so2600999a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 20:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690860426; x=1691465226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R19DXVGZvz87xB5r8jKE3m7H5CxMG5Cs5ZkCHmb4WKg=;
        b=IoQJm3YhfXjQptRw68GaSs5Gp28zrSaCu9ccWczT73Y1UvWEBhHHJUfaRhGfpOhcQX
         Psnqm9KOkeGycX4u47AXyGXrd/7iwIxknwHyZ4tqQxg82ZTei8h6WQa4+2KRwtpGQ8y9
         r0GS+UYOZoR54BgwKWGitSf/DfijdrxdHZ1/FucqFg0Sti/RdaKAlTJtrcza9s8cQ5Jt
         BaDrJZvSmlDWE1QVk5yYmHtSXIglzWk7PP8BB/XxYw3VT2kwrVJu7rfJTrdBN7urOFHX
         u2EHVoyGOqWmI2JHTjCrT002dYxi1z2pT9jtGVQ9d7FYMHK+ZbHEpos6LFv+A8ovNVQc
         5F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690860426; x=1691465226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R19DXVGZvz87xB5r8jKE3m7H5CxMG5Cs5ZkCHmb4WKg=;
        b=Xeog4JtkNOyc7lpcC+otnxfNeM4J7DmdD+FwtyZ9FZQlOp5HyP8/KJMGloDmQcJChE
         aA86OK+FQoif5YcOdBjgfPk0tSi5R8DLCCMSKvlAOMDouKpt6fJshvYOvXgtOMxqkB2C
         t7oNFWTvfwjlwJdkslo6f8RU4DfhTpqIM24xpuRBacE9iX4IjSX+RU87z7pZBBEQgfvU
         5hxsCpGavz8HYfzLwIXSKxsyi41uobvTNmIg9z06C93nQmhX/4lLxXtVI0MRaLc+Et1v
         0DqBv/RY1EJCPqJH+UjT4iqD/R5rt50E/ndvWdS85XiLQQJc+7d83cQ7QMDhTofaBJRq
         0QYg==
X-Gm-Message-State: ABy/qLYxZS5E3BMi12T+SoaCtT5Ci5nIuxXMBVYs/JicWEYDBNHiJEPG
	5pY7+xYxn7dFd6e9EeuBWxcpCubQq/VdfA==
X-Google-Smtp-Source: APBJJlGOJm2tDmf5y+uFgQZEufUTU9IvC7eIRXZ5pTMz89dwvaQx8R4rBo29rEtfqPKv6ZHdJKoD/g==
X-Received: by 2002:a17:90a:e398:b0:263:e814:5d0f with SMTP id b24-20020a17090ae39800b00263e8145d0fmr11060365pjz.41.1690860425610;
        Mon, 31 Jul 2023 20:27:05 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::61c9])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a4d8800b0026822cb85casm6753601pjh.18.2023.07.31.20.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 20:27:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] glibc: Upgrade to 2.38 release
Date: Mon, 31 Jul 2023 20:27:00 -0700
Message-ID: <20230801032702.1475825-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185185

Announcement - https://mail.gnu.org/archive/html/info-gnu/2023-07/msg00010.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.37.bb => cross-localedef-native_2.38.bb} |  0
 meta/recipes-core/glibc/glibc-common.inc      |  3 +-
 ...bc-locale_2.37.bb => glibc-locale_2.38.bb} |  0
 ...bc-mtrace_2.37.bb => glibc-mtrace_2.38.bb} |  0
 ...-scripts_2.37.bb => glibc-scripts_2.38.bb} |  0
 ...libc-tests_2.37.bb => glibc-tests_2.38.bb} |  0
 ...tsuite_2.37.bb => glibc-testsuite_2.38.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  8 +-
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  8 +-
 ...Fix-buffer-overrun-with-a-relocated-.patch |  6 +-
 ...Raise-the-size-of-arrays-containing-.patch | 16 ++--
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  2 +-
 ...Make-relocatable-install-for-locales.patch |  6 +-
 ...Fall-back-to-faccessat-on-faccess2-r.patch |  2 +-
 ...the-path-sets-wrong-config-variables.patch | 86 +++++++++----------
 ...ss-building-and-testing-instructions.patch |  2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  4 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  4 +-
 ...port-cross-locale-generation-support.patch |  6 +-
 ...-archive-uses-a-hard-coded-locale-pa.patch |  4 +-
 ...Do-not-ask-compiler-for-finding-arch.patch |  4 +-
 ...y-the-header-between-arm-and-aarch64.patch | 42 +++------
 ...h-printf-builtin-in-nscd-init-script.patch |  2 +-
 ...igure.ac-Set-libc_cv_rootsbindir-onl.patch |  7 +-
 ...ell-interpreter-overridable-in-tzsel.patch |  4 +-
 ...Use-bin-sh-default-shell-interpreter.patch |  2 +-
 ...d-failed-in-unprivileged-process-BZ-.patch | 10 +--
 ...build-time-paths-in-the-output-binar.patch |  6 +-
 .../glibc/{glibc_2.37.bb => glibc_2.38.bb}    |  0
 32 files changed, 111 insertions(+), 129 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.37.bb => cross-localedef-native_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-locale_2.37.bb => glibc-locale_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.37.bb => glibc-mtrace_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.37.bb => glibc-scripts_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-tests_2.37.bb => glibc-tests_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.37.bb => glibc-testsuite_2.38.bb} (100%)
 rename meta/recipes-core/glibc/{glibc_2.37.bb => glibc_2.38.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 18daf446e51..8c62a317a0d 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -20,7 +20,7 @@ GCCVERSION ?= "13.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.40%"
 GDBVERSION ?= "13.%"
-GLIBCVERSION ?= "2.37"
+GLIBCVERSION ?= "2.38"
 LINUXLIBCVERSION ?= "6.4%"
 QEMUVERSION ?= "8.0%"
 GOVERSION ?= "1.20%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.37.bb b/meta/recipes-core/glibc/cross-localedef-native_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/cross-localedef-native_2.37.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index b93b55fe77d..be33c29857c 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -22,5 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.37"
-PR = "r1"
+PV = "2.38"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.37.bb b/meta/recipes-core/glibc/glibc-locale_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.37.bb
rename to meta/recipes-core/glibc/glibc-locale_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.37.bb b/meta/recipes-core/glibc/glibc-mtrace_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.37.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.37.bb b/meta/recipes-core/glibc/glibc-scripts_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.37.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-tests_2.37.bb b/meta/recipes-core/glibc/glibc-tests_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-tests_2.37.bb
rename to meta/recipes-core/glibc/glibc-tests_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.37.bb b/meta/recipes-core/glibc/glibc-testsuite_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.37.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.38.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 37bb9fd34fb..7d5219f2d2e 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,7 +1,7 @@
-SRCBRANCH ?= "release/2.37/master"
-PV = "2.37"
-SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
-SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
+SRCBRANCH ?= "release/2.38/master"
+PV = "2.38"
+SRCREV_glibc ?= "36f2487f13e3540be9ee0fb51876b1da72176d3f"
+SRCREV_localedef ?= "2d6d138500779504ba52e564edd21a3e50ae9472"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index 0e2bbbc6a27..eb3da94b8ba 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From 604a78e86ca374278fc5f3ce11b0abe1ff096b7e Mon Sep 17 00:00:00 2001
+From 7c06ca59b47ce06f785b9fce7b9e9d675d5b6e10 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 0fd8a0d57d1..2dc4634dd5c 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From 85d14ae38fb9e7b46bb4b8f5f041e39a605ed81e Mon Sep 17 00:00:00 2001
+From 9ff5200eb16e9c89ca8da89d7e07975d082a13b0 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index c6f1455ee1e..f2602d0e567 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From d1b745b6e4c6a755cceb92329227efce1547d5fc Mon Sep 17 00:00:00 2001
+From 0d996c5600603a67f0265e870511cdd18dbaa8a6 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:48:24 +0000
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index fcb39a78d4..cde9fc2358 100644
+index 9a87fda9c9..0a6fa9b8f0 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2109,6 +2109,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2102,6 +2102,14 @@ _dl_map_object (struct link_map *loader, const char *name,
              }
          }
  
@@ -48,7 +48,7 @@ index fcb39a78d4..cde9fc2358 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2167,14 +2175,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2160,14 +2168,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index 8256a562456..974312367e8 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From 3789e9ae4c208b2d97169a95cf3b1767e73b3856 Mon Sep 17 00:00:00 2001
+From c3492719b2deaf3339eefb1ab30f4337e592ed80 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index cde9fc2358..e514bdcc21 100644
+index 0a6fa9b8f0..3a23dc618c 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1809,7 +1809,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1802,7 +1802,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 2899c0b845a..086e0c6f143 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 66e971a785aae80ba838a2604c679db70cbb8b3b Mon Sep 17 00:00:00 2001
+From e874dacbfdb06520240887e9077c58006ee33f87 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 07c054b11a..0fa36548b0 100644
+index 804bf23222..d99501c389 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -352,6 +352,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
@@ -41,7 +41,7 @@ index 07c054b11a..0fa36548b0 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index e514bdcc21..c43747a3a8 100644
+index 3a23dc618c..563e703096 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
 @@ -117,8 +117,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
@@ -56,7 +56,7 @@ index e514bdcc21..c43747a3a8 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index 53535c1583..3ba7d9d200 100644
+index 98f0b0d027..ab4f76e1fe 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
 @@ -25,6 +25,8 @@
@@ -77,7 +77,7 @@ index 53535c1583..3ba7d9d200 100644
    --library-path PATH   use given PATH instead of content of the environment\n\
                          variable LD_LIBRARY_PATH\n\
    --glibc-hwcaps-prepend LIST\n\
-@@ -207,7 +209,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
+@@ -203,7 +205,7 @@ setting environment variables (which would be inherited by subprocesses).\n\
  \n\
  This program interpreter self-identifies as: " RTLD "\n\
  ",
@@ -98,7 +98,7 @@ index ae21ae0cb3..b168e6da66 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index 166dccb528..8dda23c92c 100644
+index d26eef1fb4..e5af6e5c01 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
 @@ -150,6 +150,8 @@ static struct argp argp =
@@ -111,7 +111,7 @@ index 166dccb528..8dda23c92c 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index b8467f37cf..be7bd08bc3 100644
+index a91e2a4471..56d816d4d9 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
@@ -123,7 +123,7 @@ index b8467f37cf..be7bd08bc3 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 21165a558a..3dd67b0ea2 100644
+index ee9e97e1bd..01a99382d0 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -35,7 +35,7 @@
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index b0e3dbfa8a4..421afdca1ca 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From a9795b9aadcbc04ad0404badf722acb83ef0ab7b Mon Sep 17 00:00:00 2001
+From 76eaf7340a7f9063ab1ad2d7c6c0e205f22f544c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index 2dac1f10615..64243b10981 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From 68e5df9a7750d7db2323824b1342483e9ecdddd4 Mon Sep 17 00:00:00 2001
+From ef8bb46455d602cb00caf59b2044a9a23b240cc2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -41,7 +41,7 @@ index 1b7034348b..939d4fd613 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 454bbc7eda..f904158182 100644
+index 5b857d5d24..e642912e2a 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,7 +54,7 @@ index 454bbc7eda..f904158182 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index 66cad7a83b..b7b856f77f 100644
+index 8bbf281427..7a930079a5 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int item)
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index 7a8fe348156..38dca83b1b4 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From 18fc01c620311d9744a38d9a4a75dbe07b5d9225 Mon Sep 17 00:00:00 2001
+From 7f05e35c675a6d1af2144b4cfbabab250de43f38 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index cf3b35f8d0d..61fdcb08167 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From c7419991ebca369d727cc2f4489fed91fd5bb83f Mon Sep 17 00:00:00 2001
+From 70e721856c3ebf6ae0ea84b828396bd2af090acf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -29,10 +29,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  12 files changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 2130f6b8f8..7b7e3bbcf1 100644
+index ca57edce47..5e91fab023 100644
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
-@@ -152,12 +152,12 @@ else
+@@ -165,12 +165,12 @@ else $as_nop
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __AARCH64EB__
@@ -42,13 +42,13 @@ index 2130f6b8f8..7b7e3bbcf1 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_aarch64_be" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "is_aarch64_be" >/dev/null 2>&1
+ then :
    libc_cv_aarch64_be=yes
- else
-   libc_cv_aarch64_be=no
+ else $as_nop
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 85c6f76508..8ecd15d273 100644
+index 27874eceb4..8a708f2ef4 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
 @@ -13,8 +13,8 @@ AC_DEFINE(SUPPORT_STATIC_PIE)
@@ -63,10 +63,10 @@ index 85c6f76508..8ecd15d273 100644
    ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
  if test $libc_cv_aarch64_be = yes; then
 diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
-index 5b0237e521..969fc9fe95 100644
+index 35e2918922..94d7fbe8bb 100644
 --- a/sysdeps/arm/configure
 +++ b/sysdeps/arm/configure
-@@ -148,12 +148,12 @@ else
+@@ -161,12 +161,12 @@ else $as_nop
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __ARM_PCS_VFP
@@ -76,11 +76,11 @@ index 5b0237e521..969fc9fe95 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_arm_pcs_vfp" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "use_arm_pcs_vfp" >/dev/null 2>&1
+ then :
    libc_cv_arm_pcs_vfp=yes
- else
-   libc_cv_arm_pcs_vfp=no
+ else $as_nop
 diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
 index 5172e30bbe..f06dedd7c5 100644
 --- a/sysdeps/arm/configure.ac
@@ -97,10 +97,10 @@ index 5172e30bbe..f06dedd7c5 100644
    ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
  if test $libc_cv_arm_pcs_vfp = yes; then
 diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
-index 3f4d9e9759..888453c70b 100644
+index 1e8c6711e6..ae52ccd929 100644
 --- a/sysdeps/mips/configure
 +++ b/sysdeps/mips/configure
-@@ -145,11 +145,11 @@ else
+@@ -158,11 +158,11 @@ else $as_nop
  /* end confdefs.h.  */
  dnl
  #ifdef __mips_nan2008
@@ -109,11 +109,11 @@ index 3f4d9e9759..888453c70b 100644
  #endif
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "use_mips_nan2008" >/dev/null 2>&1
+ then :
    libc_cv_mips_nan2008=yes
- else
-   libc_cv_mips_nan2008=no
+ else $as_nop
 diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
 index d3cd780d78..250223d206 100644
 --- a/sysdeps/mips/configure.ac
@@ -131,10 +131,10 @@ index d3cd780d78..250223d206 100644
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
 diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-index b3cd28349e..f47e5a5adc 100644
+index 2fb230cbaa..1959d0a444 100644
 --- a/sysdeps/nios2/configure
 +++ b/sysdeps/nios2/configure
-@@ -142,12 +142,12 @@ else
+@@ -155,12 +155,12 @@ else $as_nop
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef __nios2_big_endian__
@@ -144,11 +144,11 @@ index b3cd28349e..f47e5a5adc 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_nios2_be" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "is_nios2_be" >/dev/null 2>&1
+ then :
    libc_cv_nios2_be=yes
- else
-   libc_cv_nios2_be=no
+ else $as_nop
 diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
 index f738e9a7ed..4085851cbc 100644
 --- a/sysdeps/nios2/configure.ac
@@ -165,10 +165,10 @@ index f738e9a7ed..4085851cbc 100644
    ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
  if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
-index f25f2a3a65..1b7483e6c6 100644
+index a060901de4..0ac7019438 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure
 +++ b/sysdeps/unix/sysv/linux/mips/configure
-@@ -414,11 +414,11 @@ else
+@@ -441,11 +441,11 @@ else $as_nop
  /* end confdefs.h.  */
  dnl
  #ifdef __mips_nan2008
@@ -177,11 +177,11 @@ index f25f2a3a65..1b7483e6c6 100644
  #endif
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "use_mips_nan2008" >/dev/null 2>&1
+ then :
    libc_cv_mips_nan2008=yes
- else
-   libc_cv_mips_nan2008=no
+ else $as_nop
 diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
 index 049a0f4bdf..005526d4e8 100644
 --- a/sysdeps/unix/sysv/linux/mips/configure.ac
@@ -199,10 +199,10 @@ index 049a0f4bdf..005526d4e8 100644
  
  libc_mips_nan=
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-index ae7f254da4..874519000b 100644
+index cf1b70c745..0dccf6cd76 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 +++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
-@@ -155,12 +155,12 @@ else
+@@ -168,12 +168,12 @@ else $as_nop
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #if _CALL_ELF == 2
@@ -212,12 +212,12 @@ index ae7f254da4..874519000b 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "use_ppc_elfv2_abi" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "use_ppc_elfv2_abi" >/dev/null 2>&1
+ then :
    libc_cv_ppc64_elfv2_abi=yes
- else
-   libc_cv_ppc64_elfv2_abi=no
-@@ -188,12 +188,12 @@ else
+ else $as_nop
+@@ -203,12 +203,12 @@ else $as_nop
    cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  #ifdef _CALL_ELF
@@ -227,11 +227,11 @@ index ae7f254da4..874519000b 100644
  
  _ACEOF
  if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP "yes" >/dev/null 2>&1; then :
-+  $EGREP "is_def_call_elf" >/dev/null 2>&1; then :
+-  $EGREP "yes" >/dev/null 2>&1
++  $EGREP "is_def_call_elf" >/dev/null 2>&1
+ then :
    libc_cv_ppc64_def_call_elf=yes
- else
-   libc_cv_ppc64_def_call_elf=no
+ else $as_nop
 diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
 index f9cba6e15d..b21f72f1e4 100644
 --- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index df6a659e5e2..ffbe138ff1c 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From b5535340fb24bdae121286a79d759ecb3a464afd Mon Sep 17 00:00:00 2001
+From 9625e90bdf35774c71f1e566e73d435e38c04171 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 57828dd488d..88017bd29b0 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From 1aa07d35422f4628437a515a256fdf230192891f Mon Sep 17 00:00:00 2001
+From cf2126b2d6e073137a3a7d9bcc261e0a760a82da Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index 224c792185..6da151f5db 100644
+index c6d4817a9e..b4b0e23560 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index b2e30a60c88..fee020cc4cc 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From 47db0543da748fa7c355599b90b5016032e9deed Mon Sep 17 00:00:00 2001
+From 61948c02226acea68d34313cc6286ee1ab44a98c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
 
 diff --git a/sysdeps/unix/sysv/linux/sh/Versions b/sysdeps/unix/sysv/linux/sh/Versions
-index 9c734ff755..974e33b4b1 100644
+index 3ad702e165..931985b5d6 100644
 --- a/sysdeps/unix/sysv/linux/sh/Versions
 +++ b/sysdeps/unix/sysv/linux/sh/Versions
 @@ -3,6 +3,7 @@ libc {
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index 46df87430b9..60bcab0fecd 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From fc0f96b182cd32037326545625356c88feb5c27a Mon Sep 17 00:00:00 2001
+From befa58c48a8ba664e7bbdfcf22e2a15efa2e0d17 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -89,7 +89,7 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index b7b856f77f..5e87ff336d 100644
+index 7a930079a5..05d7848d29 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -519,7 +519,7 @@ index 5caf5c348f..76856a32c2 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index dd73fa4248..da3e17774e 100644
+index 6a902faa50..17413f0a9c 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 3bf4fa45a03..3e7d5b74c1b 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From 8e38bf52f1b71700a491cd1bd5ac5cf1ec7d097b Mon Sep 17 00:00:00 2001
+From 653b0631f80f17abe01957c06ef8a8d5d189b789 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index 87d2d9b1b2..36f5852949 100644
+index 71fd9f34fa..cd3eb90ad5 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index af7140e4da2..ff49a71bb21 100644
--- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From 666905d40b483b28ffa2a5fa7170a40475ff1003 Mon Sep 17 00:00:00 2001
+From fae5ee7d7b9dca2f25684a99f7046042d870235f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/sysdeps/powerpc/preconfigure b/sysdeps/powerpc/preconfigure
-index dfe8e20399..bbff040f0f 100644
+index 4de94089a3..428ad7b162 100644
 --- a/sysdeps/powerpc/preconfigure
 +++ b/sysdeps/powerpc/preconfigure
 @@ -29,10 +29,7 @@ esac
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 90a6cc2363d..b7b4046efc3 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From 80dbf6f21c12b1c60bfab9a64798d4f1ea242efb Mon Sep 17 00:00:00 2001
+From 91a7848698ce6c96c646f3a170714ee71eab6884 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -11,10 +11,10 @@ Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- sysdeps/aarch64/bits/wordsize.h          | 8 ++++++--
- sysdeps/{aarch64 => arm}/bits/wordsize.h | 8 ++++++--
- 2 files changed, 12 insertions(+), 4 deletions(-)
- copy sysdeps/{aarch64 => arm}/bits/wordsize.h (85%)
+ sysdeps/aarch64/bits/wordsize.h | 8 ++++++--
+ sysdeps/arm/bits/wordsize.h     | 1 +
+ 2 files changed, 7 insertions(+), 2 deletions(-)
+ create mode 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
 index 04d4be9519..63876a7830 100644
@@ -39,29 +39,11 @@ index 04d4be9519..63876a7830 100644
  #endif
  
  #define __WORDSIZE_TIME64_COMPAT32	0
-diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
-similarity index 85%
-copy from sysdeps/aarch64/bits/wordsize.h
-copy to sysdeps/arm/bits/wordsize.h
-index 04d4be9519..63876a7830 100644
---- a/sysdeps/aarch64/bits/wordsize.h
+diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
+new file mode 120000
+index 0000000000..4c4a788ec2
+--- /dev/null
 +++ b/sysdeps/arm/bits/wordsize.h
-@@ -17,12 +17,16 @@
-    License along with the GNU C Library; if not, see
-    <https://www.gnu.org/licenses/>.  */
- 
--#ifdef __LP64__
-+#if defined (__aarch64__) && defined (__LP64__)
- # define __WORDSIZE			64
--#else
-+#elif defined (__aarch64__)
- # define __WORDSIZE			32
- # define __WORDSIZE32_SIZE_ULONG	1
- # define __WORDSIZE32_PTRDIFF_LONG	1
-+#else
-+# define __WORDSIZE			32
-+# define __WORDSIZE32_SIZE_ULONG	0
-+# define __WORDSIZE32_PTRDIFF_LONG	0
- #endif
- 
- #define __WORDSIZE_TIME64_COMPAT32	0
+@@ -0,0 +1 @@
++../../aarch64/bits/wordsize.h
+\ No newline at end of file
diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index 2e5c60a002b..f2ed8210815 100644
--- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 561f67dda72ba806120e3ffadd8b85dcf02a90a6 Mon Sep 17 00:00:00 2001
+From 63611cfd3b25f3656db168aee41a5850ac769dfc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index 33585ee3377..12a460664f0 100644
--- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From 5b408839318b81cc2713956c87f19eddb009f677 Mon Sep 17 00:00:00 2001
+From 912ccb5001ffa5355caff09354558e89e9aa937b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/gnu/configure b/sysdeps/gnu/configure
-index c15d1087e8..d30d6e37ae 100644
+index 18c9d7945a..ef22cc845d 100644
 --- a/sysdeps/gnu/configure
 +++ b/sysdeps/gnu/configure
-@@ -32,6 +32,6 @@ case "$prefix" in
+@@ -32,7 +32,7 @@ case "$prefix" in
    else
      libc_cv_localstatedir=$localstatedir
     fi
@@ -26,6 +26,7 @@ index c15d1087e8..d30d6e37ae 100644
 +  libc_cv_rootsbindir=${libc_cv_rootsbindir:=/sbin}
    ;;
  esac
+ 
 diff --git a/sysdeps/gnu/configure.ac b/sysdeps/gnu/configure.ac
 index 634fe4de2a..492112e0fd 100644
 --- a/sysdeps/gnu/configure.ac
diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index f6e0cec983d..359b1c37e5e 100644
--- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 27d3ec9df3157966819e4369e571769ed9e8604c Mon Sep 17 00:00:00 2001
+From 1d518ac57b00a3335f80f10f899c1bc24a0ddbf5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 2fda4af5f7..87777942f3 100644
+index 77d7fd14df..e253046861 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index ee50a8148c3..9a1bfdd6af3 100644
--- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From d8c8500b619231c23ef6a151821555786c0d2966 Mon Sep 17 00:00:00 2001
+From 7274541782927394852712ba0c8dfd67bd9b8b5b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index 48386439112..3b567cc9ab1 100644
--- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 30d209d26918e48e34f34658923c42f269d27ee1 Mon Sep 17 00:00:00 2001
+From 4a1bff4c1e34ad9b596a7ba44ab61f4c9d00097b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
@@ -72,13 +72,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
-index a8611772a2..c75b063370 100644
+index 790739cfce..8d24d04917 100644
 --- a/sysdeps/unix/sysv/linux/clone-internal.c
 +++ b/sysdeps/unix/sysv/linux/clone-internal.c
-@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
-   /* Try clone3 first.  */
+@@ -106,7 +106,7 @@ __clone_internal (struct clone_args *cl_args,
+ #ifdef HAVE_CLONE3_WRAPPER
    int saved_errno = errno;
-   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
+   int ret = __clone3_internal (cl_args, func, arg);
 -  if (ret != -1 || errno != ENOSYS)
 +  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
      return ret;
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index 789d36cacb0..55c81f38aa3 100644
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,4 +1,4 @@
-From b672a35f7d9e25baa83f3fd854a51bc1ad49756a Mon Sep 17 00:00:00 2001
+From e61792fc978f9b8a9c790be468fbf97828ac8ae9 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 24 Jul 2022 07:07:29 -0700
 Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/support/Makefile b/support/Makefile
-index b29b7eb505..ae42e6e7e9 100644
+index 917a858bd1..17a747c8c7 100644
 --- a/support/Makefile
 +++ b/support/Makefile
-@@ -219,9 +219,9 @@ libsupport-inhibit-o += .o
+@@ -227,9 +227,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc_2.37.bb b/meta/recipes-core/glibc/glibc_2.38.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc_2.37.bb
rename to meta/recipes-core/glibc/glibc_2.38.bb
-- 
2.41.0


