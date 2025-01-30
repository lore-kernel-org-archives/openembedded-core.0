Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653A3C0218A
	for <webhook@archiver.kernel.org>; Thu, 30 Jan 2025 16:54:11 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.20199.1738256044356484552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jan 2025 08:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMJzsx4W;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166651f752so6684015ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 08:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738256043; x=1738860843; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1tRXwjiOKKNaMPzPbL6c9+YeT1Ad8kGBpRymJ8VhWs=;
        b=nMJzsx4WRi3/YU0HZ9tcfwFtbden6VZ3zqaMN2s7y6SrQLP3NEEJCS2RRmVB3GdFU8
         osn1yEtBW/HogtT6tCw4JNqVVZ5/+EjyBR/+3D/lnOrm5xTUQZLC0Z92NPUDfEF8yDXH
         SNyRS6XuJyKiMv9O9n+pSRaR+3wy5vrdXU/GWu1/j+SchQ8ohOujB/ii0w9oD8f4OVFq
         uhEOfmS7mwKV5SWq1y9pF+lKXUw498iPTlp7iOkiEluHCU9K56Dj+UyKTIr6sMECVXYS
         H9D7OjsyCH30jCC8KsqQtA0NUR33pCuOT3ez7mYWBSfWJLqsqC8tE0Ch2w7sdxAibaG4
         xr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738256043; x=1738860843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1tRXwjiOKKNaMPzPbL6c9+YeT1Ad8kGBpRymJ8VhWs=;
        b=j+pLqoY3JMp3p2vTBym8f3sKaO0PD2wjcJyLs7KD91ObqYcRFfFxQnvDD0+DGD9IuW
         Kw4Q+rlf14KBs1FYEiZkQyTA642EqCz5W5hVNC3yI9d5AL0pK35/1eEVUHUzQBsGXBJ+
         HBk1u1hTzSz25JBANjcz1dEecNZZbTFk+pu7lES7St6nNh44HAI+4IHxH4jRY+FiSsbh
         SiiXizly7hnle2H0MMEpWawoCNy6OKm5b53eizKX0ugzvnpq8fhFg7g9EhGmnJU4Dglu
         9RyMibpB6kM+LM6jZ/K4hbzYzL8tFuFmLZAHEgj5rpnnUhOHMu/5U+d63+gaFokPXNMn
         pn7g==
X-Gm-Message-State: AOJu0YzDv+c5VM2NBAkWIvaWcLn9BxoHiWCGjWRd8abhlQ6lBfj9085r
	WNc8qOWJbsmYSBYOlhbG0PUjuPHRNvNk8e+EydAuB8v6Ml9OsqIRbgj7+Fro
X-Gm-Gg: ASbGncs2Lj0P8OwwHWPyOWgO77lGcNGokxpkTtWTTf+9Eezh1kftNThzKRsLXZXHPcu
	qaE9ckNq18YmuxgI8a9rdRIsXdCSQQ4UjcU/q0CxcJD1692hwLAOWQgzRa3uBpXgbLiuIkLVqb+
	qRiC2wlTvBTQGSGGp3Py/EHh/a9ciVQs57bKaAOG7sBCSnXR83j9UOY+KuAgpgDvj0UQzpiqjGE
	On4OsNVJ0mUw7Fwz9MsZ6Y0uauk+8TmbFSuLfsQ3cxhRuUGPP2vSBbwwEGUqDRQWjIiyjVHYtRc
	U86tsco=
X-Google-Smtp-Source: AGHT+IFRfuCuzNkZABDq4TR21AyHlKGA58F2p3A00wZ79q3AOVIRDBwkdyDbk1aJFv96SChnCF9DAA==
X-Received: by 2002:a17:903:2f84:b0:216:3e87:c9fc with SMTP id d9443c01a7336-21dd7c4c204mr134272125ad.5.1738256043188;
        Thu, 30 Jan 2025 08:54:03 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::c09e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee35esm16310185ad.15.2025.01.30.08.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:54:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Upgrade to 2.41 release
Date: Thu, 30 Jan 2025 08:53:59 -0800
Message-ID: <20250130165359.137315-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jan 2025 16:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210464

License-Update: Added license for e_gammaf_r.c [1]
                added url of CORE-MATH project [2]

* Testing support with different compilers (series)
* Remove XXX math functions from installed math.h (patch)
* Remove "%n" from assert (commit)
* Improve executable stack handling
* Compile glibc tests with Clang (series 1, series 2)
* asprintf should write NULL on failure
* Revert TCB layout changes
* Fix ld.so crashes with golang test suite
* Fixes after GET_ADDR_ARGS removal
* Extend Rseq Support, plus x32 fixup
* sh4: ensure FPSCR.PR==0 when executing FRCHG [BZ #27543]
* affinity-inheritance test: overallocate CPU sets
* rseq-related aarch64 test failures
* arc4random test failure under load
* benchtests: Add dummy in put files cospi, cospif, sinpi, sinpif, tanpi, tanpif
* pthread condvar missing signal, bug 25847
* aarch64: Add support for Guarded Control Stack extension
* testsuite: Make stdio-common/tst-printf-format-*-mem UNSUPPORTED if the mtrace output does not exist

Further Release Notes [3] [4]

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=2843e78b30da0aa743fdfb0ac61435c925182c04
[2] https://sourceware.org/git/?p=glibc.git;a=commit;h=d421d36582281a62e05f96a1bfb085db9d85f40b
[3] https://sourceware.org/glibc/wiki/Release/2.41

[4] https://sourceware.org/pipermail/libc-announce/2025/000045.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...2.40.bb => cross-localedef-native_2.41.bb} |  2 +-
 meta/recipes-core/glibc/glibc-common.inc      |  4 +-
 ...bc-locale_2.40.bb => glibc-locale_2.41.bb} |  0
 ...bc-mtrace_2.40.bb => glibc-mtrace_2.41.bb} |  0
 ...-scripts_2.40.bb => glibc-scripts_2.41.bb} |  0
 ...tsuite_2.40.bb => glibc-testsuite_2.41.bb} |  0
 meta/recipes-core/glibc/glibc-version.inc     |  6 +--
 ...ests_2.40.bb => glibc-y2038-tests_2.41.bb} |  0
 ...dd-hardlink-resolver-from-util-linux.patch |  2 +-
 ...-fix-ups-hardlink-to-make-it-compile.patch |  2 +-
 ...Look-for-host-system-ld.so.cache-as-.patch |  8 ++--
 ...Fix-buffer-overrun-with-a-relocated-.patch |  6 +--
 ...Raise-the-size-of-arrays-containing-.patch | 22 +++++-----
 ...k-glibc-Allow-64-bit-atomics-for-x86.patch |  4 +-
 ...Make-relocatable-install-for-locales.patch | 10 ++---
 ...Fall-back-to-faccessat-on-faccess2-r.patch |  4 +-
 ...the-path-sets-wrong-config-variables.patch | 43 +------------------
 ...ss-building-and-testing-instructions.patch |  2 +-
 ...glibc-Help-bootstrap-cross-toolchain.patch |  4 +-
 ...eglibc-Resolve-__fpscr_values-on-SH4.patch |  4 +-
 ...port-cross-locale-generation-support.patch | 24 +++++------
 ...-archive-uses-a-hard-coded-locale-pa.patch |  4 +-
 ...Do-not-ask-compiler-for-finding-arch.patch |  4 +-
 ...y-the-header-between-arm-and-aarch64.patch |  8 ++--
 ...h-printf-builtin-in-nscd-init-script.patch |  2 +-
 ...igure.ac-Set-libc_cv_rootsbindir-onl.patch |  2 +-
 ...ell-interpreter-overridable-in-tzsel.patch |  6 +--
 ...Use-bin-sh-default-shell-interpreter.patch |  4 +-
 ...d-failed-in-unprivileged-process-BZ-.patch |  4 +-
 ...build-time-paths-in-the-output-binar.patch |  6 +--
 ...u-tests-that-can-hang-in-oe-selftest.patch | 16 +++----
 ...ndomness-in-__gen_tempname-bug-32214.patch | 29 -------------
 .../glibc/{glibc_2.40.bb => glibc_2.41.bb}    |  1 -
 .../libmodulemd/libmodulemd_git.bb            |  2 +
 35 files changed, 85 insertions(+), 152 deletions(-)
 rename meta/recipes-core/glibc/{cross-localedef-native_2.40.bb => cross-localedef-native_2.41.bb} (96%)
 rename meta/recipes-core/glibc/{glibc-locale_2.40.bb => glibc-locale_2.41.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-mtrace_2.40.bb => glibc-mtrace_2.41.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-scripts_2.40.bb => glibc-scripts_2.41.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-testsuite_2.40.bb => glibc-testsuite_2.41.bb} (100%)
 rename meta/recipes-core/glibc/{glibc-y2038-tests_2.40.bb => glibc-y2038-tests_2.41.bb} (100%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
 rename meta/recipes-core/glibc/{glibc_2.40.bb => glibc_2.41.bb} (98%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 68a9515e0be..6affa6d7184 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -24,7 +24,7 @@ GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.44%"
 GDBVERSION ?= "16.%"
-GLIBCVERSION ?= "2.40%"
+GLIBCVERSION ?= "2.41%"
 LINUXLIBCVERSION ?= "6.12%"
 QEMUVERSION ?= "9.2%"
 GOVERSION ?= "1.22%"
diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
similarity index 96%
rename from meta/recipes-core/glibc/cross-localedef-native_2.40.bb
rename to meta/recipes-core/glibc/cross-localedef-native_2.41.bb
index fed6e4ea970..5aeb84ac800 100644
--- a/meta/recipes-core/glibc/cross-localedef-native_2.40.bb
+++ b/meta/recipes-core/glibc/cross-localedef-native_2.41.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "LGPL-2.1-only"
 
-LIC_FILES_CHKSUM = "file://LICENSES;md5=f77e878d320e99e94ae9a4aea7f491d1 \
+LIC_FILES_CHKSUM = "file://LICENSES;md5=df6e0948b55669789c30764c5fd9bc41 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
diff --git a/meta/recipes-core/glibc/glibc-common.inc b/meta/recipes-core/glibc/glibc-common.inc
index 72d5dcd74bb..e048f75c5d7 100644
--- a/meta/recipes-core/glibc/glibc-common.inc
+++ b/meta/recipes-core/glibc/glibc-common.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.gnu.org/software/libc/libc.html"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only & LGPL-2.1-or-later"
 
-LIC_FILES_CHKSUM ?= "file://LICENSES;md5=f77e878d320e99e94ae9a4aea7f491d1 \
+LIC_FILES_CHKSUM ?= "file://LICENSES;md5=df6e0948b55669789c30764c5fd9bc41 \
       file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
@@ -22,4 +22,4 @@ ARM_INSTRUCTION_SET:armv6 = "arm"
 #
 COMPATIBLE_HOST:libc-musl:class-target = "null"
 
-PV = "2.40+git"
+PV = "2.41+git"
diff --git a/meta/recipes-core/glibc/glibc-locale_2.40.bb b/meta/recipes-core/glibc/glibc-locale_2.41.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-locale_2.40.bb
rename to meta/recipes-core/glibc/glibc-locale_2.41.bb
diff --git a/meta/recipes-core/glibc/glibc-mtrace_2.40.bb b/meta/recipes-core/glibc/glibc-mtrace_2.41.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-mtrace_2.40.bb
rename to meta/recipes-core/glibc/glibc-mtrace_2.41.bb
diff --git a/meta/recipes-core/glibc/glibc-scripts_2.40.bb b/meta/recipes-core/glibc/glibc-scripts_2.41.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-scripts_2.40.bb
rename to meta/recipes-core/glibc/glibc-scripts_2.41.bb
diff --git a/meta/recipes-core/glibc/glibc-testsuite_2.40.bb b/meta/recipes-core/glibc/glibc-testsuite_2.41.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-testsuite_2.40.bb
rename to meta/recipes-core/glibc/glibc-testsuite_2.41.bb
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index b349560a0df..4d28affed90 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
-SRCBRANCH ?= "release/2.40/master"
-PV = "2.40+git"
-SRCREV_glibc ?= "efb710034e4c5e734d100cc4ef1b1e27d4315825"
+SRCBRANCH ?= "release/2.41/master"
+PV = "2.41+git"
+SRCREV_glibc ?= "0a7c7a3e283a55d1bfaa48fdef063a32a4689a2b"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
diff --git a/meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb b/meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
similarity index 100%
rename from meta/recipes-core/glibc/glibc-y2038-tests_2.40.bb
rename to meta/recipes-core/glibc/glibc-y2038-tests_2.41.bb
diff --git a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
index e4fb2a7a285..dbe3ce8c32d 100644
--- a/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
+++ b/meta/recipes-core/glibc/glibc/0001-localedef-Add-hardlink-resolver-from-util-linux.patch
@@ -1,4 +1,4 @@
-From c22fc168dd00cdabcf24a54b4d9383a3f1a7b313 Mon Sep 17 00:00:00 2001
+From cecd20fa2ff3ee2bd887b1d427088f32678cc04f Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 09:59:22 -0800
 Subject: [PATCH] localedef: Add hardlink resolver from util-linux
diff --git a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
index 1bbd07d3313..59d71a0d8b2 100644
--- a/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
+++ b/meta/recipes-core/glibc/glibc/0002-localedef-fix-ups-hardlink-to-make-it-compile.patch
@@ -1,4 +1,4 @@
-From fe564c5944621f240dd28a1b4157504384635518 Mon Sep 17 00:00:00 2001
+From e31f032ae87ba38645c66dd7d2dfaa8606602e70 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Sat, 7 Dec 2019 10:01:37 -0800
 Subject: [PATCH] localedef: fix-ups hardlink to make it compile
diff --git a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
index 650e6087506..0f7db0d5007 100644
--- a/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
+++ b/meta/recipes-core/glibc/glibc/0003-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch
@@ -1,4 +1,4 @@
-From 213a4e5b43369f24d6f07a7c971f3909ec5d26a3 Mon Sep 17 00:00:00 2001
+From f794ec18764a59ad45e242092e2ae6f5e3b19761 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 3 Feb 2024 13:54:16 -0800
 Subject: [PATCH] nativesdk-glibc: Look for host system ld.so.cache as well
@@ -30,10 +30,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 8a89b71016..1ea5415b76 100644
+index f905578a65..d4dd0fbc2a 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -2046,6 +2046,14 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2038,6 +2038,14 @@ _dl_map_object (struct link_map *loader, const char *name,
  			&loader->l_runpath_dirs, &realname, &fb, loader,
  			LA_SER_RUNPATH, &found_other_class);
  
@@ -48,7 +48,7 @@ index 8a89b71016..1ea5415b76 100644
  #ifdef USE_LDCONFIG
        if (fd == -1
  	  && (__glibc_likely ((mode & __RTLD_SECURE) == 0)
-@@ -2104,14 +2112,6 @@ _dl_map_object (struct link_map *loader, const char *name,
+@@ -2096,14 +2104,6 @@ _dl_map_object (struct link_map *loader, const char *name,
  	}
  #endif
  
diff --git a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
index b98b6ec5fba..d9731a6fb73 100644
--- a/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
+++ b/meta/recipes-core/glibc/glibc/0004-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch
@@ -1,4 +1,4 @@
-From c17e485fc4ff3f7f16a824b43372bc9e3fe57dd6 Mon Sep 17 00:00:00 2001
+From e8af7c91033875cfaf419c840d3283d71eb72d50 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:50:00 +0000
 Subject: [PATCH] nativesdk-glibc: Fix buffer overrun with a relocated SDK
@@ -21,10 +21,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index 1ea5415b76..e149dd7e76 100644
+index d4dd0fbc2a..0cd5221d6a 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -1757,7 +1757,19 @@ open_path (const char *name, size_t namelen, int mode,
+@@ -1749,7 +1749,19 @@ open_path (const char *name, size_t namelen, int mode,
         given on the command line when rtld is run directly.  */
      return -1;
  
diff --git a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
index 21c39dce596..0ee03c95d89 100644
--- a/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
+++ b/meta/recipes-core/glibc/glibc/0005-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch
@@ -1,4 +1,4 @@
-From 97229d19eca7d93d38ed7893640efe36a57e7bcb Mon Sep 17 00:00:00 2001
+From d7c4488ff48992631e14a53c27252790eaefe928 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:51:38 +0000
 Subject: [PATCH] nativesdk-glibc: Raise the size of arrays containing dl paths
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  8 files changed, 15 insertions(+), 10 deletions(-)
 
 diff --git a/elf/dl-cache.c b/elf/dl-cache.c
-index 7c7dc58745..0147a281ad 100644
+index 300aa1b6dd..6df873e08b 100644
 --- a/elf/dl-cache.c
 +++ b/elf/dl-cache.c
 @@ -336,6 +336,10 @@ search_cache (const char *string_table, uint32_t string_table_size,
@@ -41,10 +41,10 @@ index 7c7dc58745..0147a281ad 100644
  _dl_cache_libcmp (const char *p1, const char *p2)
  {
 diff --git a/elf/dl-load.c b/elf/dl-load.c
-index e149dd7e76..c99ce0ee45 100644
+index 0cd5221d6a..9b9593f8d8 100644
 --- a/elf/dl-load.c
 +++ b/elf/dl-load.c
-@@ -106,8 +106,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
+@@ -107,8 +107,8 @@ enum { ncapstr = 1, max_capstrlen = 0 };
     gen-trusted-dirs.awk.  */
  #include "trusted-dirs.h"
  
@@ -56,7 +56,7 @@ index e149dd7e76..c99ce0ee45 100644
    SYSTEM_DIRS_LEN
  };
 diff --git a/elf/dl-usage.c b/elf/dl-usage.c
-index 5baac4ba8e..60097ad0e2 100644
+index c6d13ac2ee..1dac82102d 100644
 --- a/elf/dl-usage.c
 +++ b/elf/dl-usage.c
 @@ -25,6 +25,8 @@
@@ -87,7 +87,7 @@ index 5baac4ba8e..60097ad0e2 100644
    print_hwcaps_subdirectories (state);
    _exit (EXIT_SUCCESS);
 diff --git a/elf/interp.c b/elf/interp.c
-index 8b705824bf..7d094829f3 100644
+index cc49e13c86..394c1ce0c5 100644
 --- a/elf/interp.c
 +++ b/elf/interp.c
 @@ -18,5 +18,5 @@
@@ -98,10 +98,10 @@ index 8b705824bf..7d094829f3 100644
 +const char __invoke_dynamic_linker__[4096] __attribute__ ((section (".interp")))
    = RUNTIME_LINKER;
 diff --git a/elf/ldconfig.c b/elf/ldconfig.c
-index b64c54b53e..caf7001745 100644
+index 1432187e9b..0654e02389 100644
 --- a/elf/ldconfig.c
 +++ b/elf/ldconfig.c
-@@ -150,6 +150,8 @@ static struct argp argp =
+@@ -151,6 +151,8 @@ static struct argp argp =
    options, parse_opt, NULL, doc, NULL, more_help, NULL
  };
  
@@ -111,7 +111,7 @@ index b64c54b53e..caf7001745 100644
  static error_t
  parse_opt (int key, char *arg, struct argp_state *state)
 diff --git a/elf/rtld.c b/elf/rtld.c
-index 6352ba76c5..02316b8b16 100644
+index f32058bba6..434ea6d0c5 100644
 --- a/elf/rtld.c
 +++ b/elf/rtld.c
 @@ -190,6 +190,7 @@ dso_name_valid_for_suid (const char *p)
@@ -123,7 +123,7 @@ index 6352ba76c5..02316b8b16 100644
  static void
  audit_list_init (struct audit_list *list)
 diff --git a/iconv/gconv_conf.c b/iconv/gconv_conf.c
-index 1063c31a2b..57fa832e52 100644
+index 41ab0768c9..7c48c2b328 100644
 --- a/iconv/gconv_conf.c
 +++ b/iconv/gconv_conf.c
 @@ -35,7 +35,7 @@
@@ -136,7 +136,7 @@ index 1063c31a2b..57fa832e52 100644
  /* Type to represent search path.  */
  struct path_elem
 diff --git a/sysdeps/generic/dl-cache.h b/sysdeps/generic/dl-cache.h
-index 919e49ffc8..cd3f8ba94b 100644
+index 0ee6571315..792308c0ab 100644
 --- a/sysdeps/generic/dl-cache.h
 +++ b/sysdeps/generic/dl-cache.h
 @@ -34,10 +34,6 @@
diff --git a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
index b867ffde482..597923e7929 100644
--- a/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
+++ b/meta/recipes-core/glibc/glibc/0006-nativesdk-glibc-Allow-64-bit-atomics-for-x86.patch
@@ -1,4 +1,4 @@
-From 680ceb8bf43f07884674a08423b8a1c15d1a48b5 Mon Sep 17 00:00:00 2001
+From 9b408439eb042c4fc5cb33c8929dea419bf25b41 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:35:35 -0800
 Subject: [PATCH] nativesdk-glibc: Allow 64 bit atomics for x86
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/sysdeps/x86/atomic-machine.h b/sysdeps/x86/atomic-machine.h
-index cfd395087b..28a937c468 100644
+index 5452716d22..8c7408feb4 100644
 --- a/sysdeps/x86/atomic-machine.h
 +++ b/sysdeps/x86/atomic-machine.h
 @@ -26,19 +26,14 @@
diff --git a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
index a1d4f077249..2886d461c81 100644
--- a/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
+++ b/meta/recipes-core/glibc/glibc/0007-nativesdk-glibc-Make-relocatable-install-for-locales.patch
@@ -1,4 +1,4 @@
-From 88c37776dca4603d6618fd7a12a055a15e2a519e Mon Sep 17 00:00:00 2001
+From 1a57ab6f7d602401396a18b0270498ff9228cf64 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:55:12 -0700
 Subject: [PATCH] nativesdk-glibc: Make relocatable install for locales
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/locale/findlocale.c b/locale/findlocale.c
-index 43ff7201c1..9684a4249b 100644
+index e5e2bd3974..bdd9b79f83 100644
 --- a/locale/findlocale.c
 +++ b/locale/findlocale.c
 @@ -55,7 +55,7 @@ struct __locale_data *const _nl_C[] attribute_hidden =
@@ -41,7 +41,7 @@ index 43ff7201c1..9684a4249b 100644
    else
      /* We really have to load some data.  First see whether the name is
 diff --git a/locale/loadarchive.c b/locale/loadarchive.c
-index 452e3eb6e3..c7467aec42 100644
+index 058a467cde..af62f3c304 100644
 --- a/locale/loadarchive.c
 +++ b/locale/loadarchive.c
 @@ -42,7 +42,7 @@
@@ -54,7 +54,7 @@ index 452e3eb6e3..c7467aec42 100644
  /* Size of initial mapping window, optimal if large enough to
     cover the header plus the initial locale.  */
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index ed698faef1..f7efc288a5 100644
+index ab1b5e5659..92aef8d58e 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -347,7 +347,7 @@ _nl_lookup_word (locale_t l, int category, int item)
@@ -67,7 +67,7 @@ index ed698faef1..f7efc288a5 100644
  /* Load the locale data for CATEGORY from the file specified by *NAME.
     If *NAME is "", use environment variables as specified by POSIX, and
 diff --git a/locale/programs/locale.c b/locale/programs/locale.c
-index c7ee1874e8..8281e32236 100644
+index 7e8832dc3b..7fa484f092 100644
 --- a/locale/programs/locale.c
 +++ b/locale/programs/locale.c
 @@ -631,6 +631,7 @@ nameentcmp (const void *a, const void *b)
diff --git a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
index 09f64421ae0..025ad153d64 100644
--- a/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
+++ b/meta/recipes-core/glibc/glibc/0008-nativesdk-glibc-Fall-back-to-faccessat-on-faccess2-r.patch
@@ -1,4 +1,4 @@
-From ab38fdad1d435b68ae2d178f2e5d24c77f4e8d98 Mon Sep 17 00:00:00 2001
+From 789083eea1feb1249ec5817710552dc31653b36e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 6 Mar 2021 14:48:56 -0800
 Subject: [PATCH] nativesdk-glibc: Fall back to faccessat on faccess2 returns
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/faccessat.c b/sysdeps/unix/sysv/linux/faccessat.c
-index 2fa57fd63d..4d0d5ff0c4 100644
+index edb22ebce6..b67684a3ba 100644
 --- a/sysdeps/unix/sysv/linux/faccessat.c
 +++ b/sysdeps/unix/sysv/linux/faccessat.c
 @@ -30,7 +30,11 @@ __faccessat (int fd, const char *file, int mode, int flag)
diff --git a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
index b862b12d669..dbb6d674d59 100644
--- a/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
+++ b/meta/recipes-core/glibc/glibc/0009-yes-within-the-path-sets-wrong-config-variables.patch
@@ -1,4 +1,4 @@
-From cac7bbbc82423697f8d3223222db8b787b63f500 Mon Sep 17 00:00:00 2001
+From 4a1ff3c313645aa425a0a87459c907dad1b9ca4b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:31:06 +0000
 Subject: [PATCH] 'yes' within the path sets wrong config variables
@@ -20,16 +20,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  sysdeps/arm/configure.ac                               | 4 ++--
  sysdeps/mips/configure                                 | 4 ++--
  sysdeps/mips/configure.ac                              | 4 ++--
- sysdeps/nios2/configure                                | 4 ++--
- sysdeps/nios2/configure.ac                             | 4 ++--
  sysdeps/unix/sysv/linux/mips/configure                 | 4 ++--
  sysdeps/unix/sysv/linux/mips/configure.ac              | 4 ++--
  sysdeps/unix/sysv/linux/powerpc/powerpc64/configure    | 8 ++++----
  sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac | 8 ++++----
- 12 files changed, 28 insertions(+), 28 deletions(-)
+ 10 files changed, 24 insertions(+), 24 deletions(-)
  mode change 100644 => 100755 sysdeps/arm/configure
  mode change 100644 => 100755 sysdeps/mips/configure
- mode change 100644 => 100755 sysdeps/nios2/configure
  mode change 100644 => 100755 sysdeps/unix/sysv/linux/mips/configure
  mode change 100644 => 100755 sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
 
@@ -139,42 +136,6 @@ index d3cd780d78..250223d206 100644
  #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
  if test x$libc_cv_mips_nan2008 = xyes; then
    AC_DEFINE(HAVE_MIPS_NAN2008)
-diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
-old mode 100644
-new mode 100755
-index d25684d5ad..5801978aee
---- a/sysdeps/nios2/configure
-+++ b/sysdeps/nios2/configure
-@@ -147,12 +147,12 @@ else case e in #(
-   e) cat confdefs.h - <<_ACEOF >conftest.$ac_ext
- /* end confdefs.h.  */
- #ifdef __nios2_big_endian__
--                      yes
-+                      is_nios2_be
-                      #endif
- 
- _ACEOF
- if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
--  $EGREP_TRADITIONAL "yes" >/dev/null 2>&1
-+  $EGREP_TRADITIONAL "is_nios2_be" >/dev/null 2>&1
- then :
-   libc_cv_nios2_be=yes
- else case e in #(
-diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
-index f738e9a7ed..4085851cbc 100644
---- a/sysdeps/nios2/configure.ac
-+++ b/sysdeps/nios2/configure.ac
-@@ -4,8 +4,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
- # Nios II big endian is not yet supported.
- AC_CACHE_CHECK([for big endian],
-   [libc_cv_nios2_be],
--  [AC_EGREP_CPP(yes,[#ifdef __nios2_big_endian__
--                      yes
-+  [AC_EGREP_CPP(is_nios2_be,[#ifdef __nios2_big_endian__
-+                      is_nios2_be
-                      #endif
-   ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
- if test $libc_cv_nios2_be = yes; then
 diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
 old mode 100644
 new mode 100755
diff --git a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
index 8b79916b81b..b1bed71f2b4 100644
--- a/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
+++ b/meta/recipes-core/glibc/glibc/0010-eglibc-Cross-building-and-testing-instructions.patch
@@ -1,4 +1,4 @@
-From 8216e0927262392f3b60a5cc5592d39c9f18ef3c Mon Sep 17 00:00:00 2001
+From 7d158af5750b351b3b08e78bb6c5fe80e7cb36ba Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:42:58 +0000
 Subject: [PATCH] eglibc: Cross building and testing instructions
diff --git a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
index 02751337904..13190125eb0 100644
--- a/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
+++ b/meta/recipes-core/glibc/glibc/0011-eglibc-Help-bootstrap-cross-toolchain.patch
@@ -1,4 +1,4 @@
-From bd4b95bcc335599e736a3554112f1e912a79542b Mon Sep 17 00:00:00 2001
+From 435b57e8327555b273a52df672b2611050a8c579 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:49:28 +0000
 Subject: [PATCH] eglibc: Help bootstrap cross toolchain
@@ -29,7 +29,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 include/stubs-bootstrap.h
 
 diff --git a/Makefile b/Makefile
-index c84f266ce7..790c717958 100644
+index 97b4328af8..5c20ed3cff 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -79,9 +79,18 @@ subdir-dirs = include
diff --git a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
index 91e52a0db93..780aff1e7d1 100644
--- a/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
+++ b/meta/recipes-core/glibc/glibc/0012-eglibc-Resolve-__fpscr_values-on-SH4.patch
@@ -1,4 +1,4 @@
-From ab08ea10e9bc8a91f83fea12ccf40abf1a150326 Mon Sep 17 00:00:00 2001
+From 46937c30c52cf186609bee1ec927464d395afb30 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:55:53 +0000
 Subject: [PATCH] eglibc: Resolve __fpscr_values on SH4
@@ -33,7 +33,7 @@ index 3ad702e165..931985b5d6 100644
      # a*
      alphasort64;
 diff --git a/sysdeps/unix/sysv/linux/sh/sysdep.S b/sysdeps/unix/sysv/linux/sh/sysdep.S
-index d5d8c5e033..f356d02077 100644
+index db898e9e39..6e2972e814 100644
 --- a/sysdeps/unix/sysv/linux/sh/sysdep.S
 +++ b/sysdeps/unix/sysv/linux/sh/sysdep.S
 @@ -30,3 +30,14 @@ ENTRY (__syscall_error)
diff --git a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
index ae14ba82dba..8f9bbb6cf37 100644
--- a/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
+++ b/meta/recipes-core/glibc/glibc/0013-eglibc-Forward-port-cross-locale-generation-support.patch
@@ -1,4 +1,4 @@
-From ae0b0897228da4c8815061fe57d9b31c2b742dbc Mon Sep 17 00:00:00 2001
+From 68dcae2527a64a4448334fdfe27c7b6014589aae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 01:33:49 +0000
 Subject: [PATCH] eglibc: Forward port cross locale generation support
@@ -23,7 +23,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  create mode 100644 locale/catnames.c
 
 diff --git a/locale/Makefile b/locale/Makefile
-index 2810f28605..05f847f9a6 100644
+index 9d9c1a7691..bf271fd0a8 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -30,6 +30,7 @@ headers = \
@@ -87,7 +87,7 @@ index 0000000000..538f3f5edb
 +    [LC_ALL] = sizeof ("LC_ALL") - 1
 +  };
 diff --git a/locale/localeinfo.h b/locale/localeinfo.h
-index f7efc288a5..6ef082eb25 100644
+index 92aef8d58e..ae23b2f7fe 100644
 --- a/locale/localeinfo.h
 +++ b/locale/localeinfo.h
 @@ -246,7 +246,7 @@ __libc_tsd_define (extern, locale_t, LOCALE)
@@ -100,7 +100,7 @@ index f7efc288a5..6ef082eb25 100644
  # define NL_CURRENT_INDIRECT	1
  #endif
 diff --git a/locale/programs/charmap-dir.c b/locale/programs/charmap-dir.c
-index 36504f238d..56ee97e61b 100644
+index e635a01ede..10e34a6da9 100644
 --- a/locale/programs/charmap-dir.c
 +++ b/locale/programs/charmap-dir.c
 @@ -18,7 +18,9 @@
@@ -146,7 +146,7 @@ index 36504f238d..56ee97e61b 100644
    return NULL;
  }
 diff --git a/locale/programs/ld-collate.c b/locale/programs/ld-collate.c
-index 5048adbd9f..4232834ead 100644
+index 7de3ba064d..3256427d21 100644
 --- a/locale/programs/ld-collate.c
 +++ b/locale/programs/ld-collate.c
 @@ -352,7 +352,7 @@ new_element (struct locale_collate_t *collate, const char *mbs, size_t mbslen,
@@ -195,7 +195,7 @@ index 5048adbd9f..4232834ead 100644
  			 == runp->wcnext->wcs[runp->nwcs - 1] + 1));
  
 diff --git a/locale/programs/ld-ctype.c b/locale/programs/ld-ctype.c
-index eb6e7e145c..14736d1cac 100644
+index 15fd39c637..d4c5e0c9e7 100644
 --- a/locale/programs/ld-ctype.c
 +++ b/locale/programs/ld-ctype.c
 @@ -914,7 +914,7 @@ ctype_output (struct localedef_t *locale, const struct charmap_t *charmap,
@@ -277,7 +277,7 @@ index eb6e7e145c..14736d1cac 100644
  	      srunp = srunp->next;
  	    }
 diff --git a/locale/programs/ld-time.c b/locale/programs/ld-time.c
-index 1abff3cf53..8a2f2b820a 100644
+index 9529d7945a..554454b9c1 100644
 --- a/locale/programs/ld-time.c
 +++ b/locale/programs/ld-time.c
 @@ -219,8 +219,10 @@ No definition for %s category found"), "LC_TIME");
@@ -346,7 +346,7 @@ index 1abff3cf53..8a2f2b820a 100644
  
  
 diff --git a/locale/programs/linereader.c b/locale/programs/linereader.c
-index 61373d2657..7ec5726377 100644
+index 6f40ecf77a..573d051d0a 100644
 --- a/locale/programs/linereader.c
 +++ b/locale/programs/linereader.c
 @@ -776,7 +776,7 @@ get_string (struct linereader *lr, const struct charmap_t *charmap,
@@ -359,7 +359,7 @@ index 61373d2657..7ec5726377 100644
    lr_buffer_init (&lrb);
  
 diff --git a/locale/programs/localedef.c b/locale/programs/localedef.c
-index 907bb5fb25..3106529043 100644
+index 7b66cd279c..dd0c3f1562 100644
 --- a/locale/programs/localedef.c
 +++ b/locale/programs/localedef.c
 @@ -108,6 +108,7 @@ void (*argp_program_version_hook) (FILE *, struct argp_state *) = print_version;
@@ -405,7 +405,7 @@ index 907bb5fb25..3106529043 100644
        force_output = 1;
        break;
 diff --git a/locale/programs/locfile.c b/locale/programs/locfile.c
-index 6c6ebf2dd6..cc02ab82bf 100644
+index b54fcbbceb..6110c7b369 100644
 --- a/locale/programs/locfile.c
 +++ b/locale/programs/locfile.c
 @@ -543,6 +543,9 @@ compare_files (const char *filename1, const char *filename2, size_t size,
@@ -428,7 +428,7 @@ index 6c6ebf2dd6..cc02ab82bf 100644
  
  /* Record that FILE's next element is the 32-bit integer VALUE.  */
 diff --git a/locale/programs/locfile.h b/locale/programs/locfile.h
-index 3afb0a8d29..46785374e8 100644
+index 9103fade14..ecd878563d 100644
 --- a/locale/programs/locfile.h
 +++ b/locale/programs/locfile.h
 @@ -70,6 +70,8 @@ extern void write_all_categories (struct localedef_t *definitions,
@@ -517,7 +517,7 @@ index 3afb0a8d29..46785374e8 100644
 +
  #endif /* locfile.h */
 diff --git a/locale/setlocale.c b/locale/setlocale.c
-index 7bd27e5398..2f194bad7c 100644
+index c04740ca19..12deadeb24 100644
 --- a/locale/setlocale.c
 +++ b/locale/setlocale.c
 @@ -63,35 +63,6 @@ static char *const _nl_current_used[] =
diff --git a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
index 94d5abf72f2..9448f360efd 100644
--- a/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
+++ b/meta/recipes-core/glibc/glibc/0014-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch
@@ -1,4 +1,4 @@
-From ccac9ff221fa08dbe330ae75a570da33edaaac4e Mon Sep 17 00:00:00 2001
+From 194e83794369783287956fb12c7f8469e6b7d110 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 3 Aug 2018 09:42:06 -0700
 Subject: [PATCH] localedef --add-to-archive uses a hard-coded locale path
@@ -18,7 +18,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 25 insertions(+), 10 deletions(-)
 
 diff --git a/locale/programs/locarchive.c b/locale/programs/locarchive.c
-index 8d79a1b6d1..6dc7ecd4e7 100644
+index 2c19f4fd29..b8495848c3 100644
 --- a/locale/programs/locarchive.c
 +++ b/locale/programs/locarchive.c
 @@ -339,12 +339,24 @@ enlarge_archive (struct locarhandle *ah, const struct locarhead *head)
diff --git a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
index 51d152f8c04..0e00c046597 100644
--- a/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
+++ b/meta/recipes-core/glibc/glibc/0015-powerpc-Do-not-ask-compiler-for-finding-arch.patch
@@ -1,4 +1,4 @@
-From e79835037312f8d58c8c555e1ebf5746e09d10cd Mon Sep 17 00:00:00 2001
+From 7d7f6fcd4f4b6664bff75addc92bc7b8a86dc22d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 7 Aug 2020 14:31:16 -0700
 Subject: [PATCH] powerpc: Do not ask compiler for finding arch
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+), 8 deletions(-)
 
 diff --git a/sysdeps/powerpc/preconfigure b/sysdeps/powerpc/preconfigure
-index 9e5a07ab6d..a308bdd863 100644
+index 48b9c9b65a..7eb260fc78 100644
 --- a/sysdeps/powerpc/preconfigure
 +++ b/sysdeps/powerpc/preconfigure
 @@ -29,10 +29,7 @@ esac
diff --git a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
index 87bc7a840ec..f40a8eff07a 100644
--- a/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
+++ b/meta/recipes-core/glibc/glibc/0016-wordsize.h-Unify-the-header-between-arm-and-aarch64.patch
@@ -1,4 +1,4 @@
-From 4dd93c44d85ad04343daa9933edfb6ae59863095 Mon Sep 17 00:00:00 2001
+From 2bd0ea2c8f9595414741ed523c6ca07630a4fc96 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 May 2020 17:05:45 -0700
 Subject: [PATCH] wordsize.h: Unify the header between arm and aarch64
@@ -17,7 +17,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  mode change 100644 => 120000 sysdeps/arm/bits/wordsize.h
 
 diff --git a/sysdeps/aarch64/bits/wordsize.h b/sysdeps/aarch64/bits/wordsize.h
-index 118e59172d..c6278c6afa 100644
+index f56260c2de..391d79d5a8 100644
 --- a/sysdeps/aarch64/bits/wordsize.h
 +++ b/sysdeps/aarch64/bits/wordsize.h
 @@ -17,12 +17,19 @@
@@ -44,11 +44,11 @@ index 118e59172d..c6278c6afa 100644
 +#endif
 diff --git a/sysdeps/arm/bits/wordsize.h b/sysdeps/arm/bits/wordsize.h
 deleted file mode 100644
-index 6ecbfe7c86..0000000000
+index be457d84d3..0000000000
 --- a/sysdeps/arm/bits/wordsize.h
 +++ /dev/null
 @@ -1,21 +0,0 @@
--/* Copyright (C) 1999-2024 Free Software Foundation, Inc.
+-/* Copyright (C) 1999-2025 Free Software Foundation, Inc.
 -   This file is part of the GNU C Library.
 -
 -   The GNU C Library is free software; you can redistribute it and/or
diff --git a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
index ff60c00102e..2af39799bed 100644
--- a/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
+++ b/meta/recipes-core/glibc/glibc/0017-Replace-echo-with-printf-builtin-in-nscd-init-script.patch
@@ -1,4 +1,4 @@
-From 0a29c4828c2440bf4768f4342480958a67d58954 Mon Sep 17 00:00:00 2001
+From 7ef9358bbb184026914fb4d9ff479361b82bf6c9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 31 Dec 2015 14:33:02 -0800
 Subject: [PATCH] Replace echo with printf builtin in nscd init script
diff --git a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
index e4bc40b1238..ca30edd91c5 100644
--- a/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
+++ b/meta/recipes-core/glibc/glibc/0018-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch
@@ -1,4 +1,4 @@
-From 1b1e654726931c27c86cf9c68371c32410f8d766 Mon Sep 17 00:00:00 2001
+From c43c1758baddaff1fb82afc118f7dba23af12540 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Mar 2015 00:27:10 +0000
 Subject: [PATCH] sysdeps/gnu/configure.ac: Set libc_cv_rootsbindir only if its
diff --git a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
index 24dd4dad562..2e4c6ced9ed 100644
--- a/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
+++ b/meta/recipes-core/glibc/glibc/0019-timezone-Make-shell-interpreter-overridable-in-tzsel.patch
@@ -1,4 +1,4 @@
-From 99aac9db31f52c3b59b32c424b26d881069aa5df Mon Sep 17 00:00:00 2001
+From a2179a1a5e0f6ded889d2c88cabb23c92b5a4b1e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Dec 2021 15:14:42 -0800
 Subject: [PATCH] timezone: Make shell interpreter overridable in tzselect.ksh
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 10 insertions(+)
 
 diff --git a/Makeconfig b/Makeconfig
-index 2d4343b604..1992e19c4e 100644
+index d0108d2caa..75887b1334 100644
 --- a/Makeconfig
 +++ b/Makeconfig
 @@ -309,6 +309,15 @@ ifndef sysincludedir
@@ -34,7 +34,7 @@ index 2d4343b604..1992e19c4e 100644
  # Commands to install files.
  ifndef INSTALL_DATA
 diff --git a/timezone/Makefile b/timezone/Makefile
-index cf4ef3bf7e..559b9a7e3d 100644
+index ebe5cf73a1..b5fa38f4d7 100644
 --- a/timezone/Makefile
 +++ b/timezone/Makefile
 @@ -143,6 +143,7 @@ $(objpfx)tzselect: tzselect.ksh $(common-objpfx)config.make
diff --git a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
index c294dda29d7..e68e37b1254 100644
--- a/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
+++ b/meta/recipes-core/glibc/glibc/0020-tzselect.ksh-Use-bin-sh-default-shell-interpreter.patch
@@ -1,4 +1,4 @@
-From 4c68d7aa739ebd997db43d73cf2a43b776969c89 Mon Sep 17 00:00:00 2001
+From c86de3e8b739f20fd7211b66dc3c69b61d28d611 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Dec 2021 21:47:53 -0800
 Subject: [PATCH] tzselect.ksh: Use /bin/sh default shell interpreter
@@ -16,7 +16,7 @@ Cc: Paul Eggert <eggert@cs.ucla.edu>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/timezone/tzselect.ksh b/timezone/tzselect.ksh
-index 38941bbc55..588bcb9f06 100755
+index ca3d82c6aa..1be42814fe 100755
 --- a/timezone/tzselect.ksh
 +++ b/timezone/tzselect.ksh
 @@ -1,4 +1,4 @@
diff --git a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
index 6f7b765accd..f1391a095cb 100644
--- a/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
+++ b/meta/recipes-core/glibc/glibc/0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -1,4 +1,4 @@
-From 5352c59f08d8e5e1f44fb5834d6bbbd3a20bdd36 Mon Sep 17 00:00:00 2001
+From 06dd2eec0d57e1e2702069ee4c970c68fc4d3bcb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 29 Aug 2021 20:49:16 +0800
 Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
@@ -72,7 +72,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
-index 40ef30303f..f97b1f6900 100644
+index 9a1f27d017..9a48340055 100644
 --- a/sysdeps/unix/sysv/linux/clone-internal.c
 +++ b/sysdeps/unix/sysv/linux/clone-internal.c
 @@ -98,7 +98,7 @@ __clone_internal (struct clone_args *cl_args,
diff --git a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
index f8e73662e70..a90814c63a5 100644
--- a/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
+++ b/meta/recipes-core/glibc/glibc/0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch
@@ -1,4 +1,4 @@
-From 51694f72b7326d36e51214eb2af0be1d6831c7a4 Mon Sep 17 00:00:00 2001
+From cd66a5301c4d84e3dbc4e30fdb9e32b341e66b3d Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sun, 24 Jul 2022 07:07:29 -0700
 Subject: [PATCH] Avoid hardcoded build time paths in the output binaries
@@ -14,10 +14,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/support/Makefile b/support/Makefile
-index aa57207bdc..3c66cec6c8 100644
+index 59a9974539..c3f7302bcb 100644
 --- a/support/Makefile
 +++ b/support/Makefile
-@@ -229,9 +229,9 @@ libsupport-inhibit-o += .o
+@@ -238,9 +238,9 @@ libsupport-inhibit-o += .o
  endif
  
  CFLAGS-support_paths.c = \
diff --git a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
index 256dab45f99..71777d3f2cb 100644
--- a/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
+++ b/meta/recipes-core/glibc/glibc/0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch
@@ -1,4 +1,4 @@
-From 19795af92830251dd03943bda4825def5bf774c4 Mon Sep 17 00:00:00 2001
+From 5395ccff4478d42fab7f2bd6ba7f7188bec09ddf Mon Sep 17 00:00:00 2001
 From: Yash Shinde <Yash.Shinde@windriver.com>
 Date: Fri, 5 Apr 2024 08:24:36 -0700
 Subject: [PATCH] tests: Skip 2 qemu tests that can hang in oe-selftest
@@ -20,18 +20,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/sysdeps/unix/sysv/linux/Makefile b/sysdeps/unix/sysv/linux/Makefile
-index ae66590e91..b2f0469273 100644
+index 8a755293b3..22dafcaad1 100644
 --- a/sysdeps/unix/sysv/linux/Makefile
 +++ b/sysdeps/unix/sysv/linux/Makefile
-@@ -223,7 +223,6 @@ tests += \
-   tst-process_mrelease \
-   tst-quota \
+@@ -228,7 +228,6 @@ tests += \
    tst-rlimit-infinity \
+   tst-sched-affinity-inheritance \
+   tst-sched_setattr \
 -  tst-scm_rights \
    tst-sigtimedwait \
    tst-sync_file_range \
-   tst-sysconf-iov_max \
-@@ -234,6 +233,8 @@ tests += \
+   tst-syscall-restart \
+@@ -240,6 +239,8 @@ tests += \
    tst-timerfd \
    tst-ttyname-direct \
    tst-ttyname-namespace \
@@ -40,7 +40,7 @@ index ae66590e91..b2f0469273 100644
    # tests
  
  # process_madvise requires CAP_SYS_ADMIN.
-@@ -271,9 +272,10 @@ tests-time64 += \
+@@ -277,9 +278,10 @@ tests-time64 += \
    tst-ntp_gettimex-time64 \
    tst-ppoll-time64 \
    tst-prctl-time64 \
diff --git a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch b/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
deleted file mode 100644
index c9f3e32f585..00000000000
--- a/meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9d30d58c32fe9d5f8ec6cda79fb11159e6789bcf Mon Sep 17 00:00:00 2001
-From: Andreas Schwab <schwab@suse.de>
-Date: Wed, 25 Sep 2024 11:49:30 +0200
-Subject: [PATCH] Fix missing randomness in __gen_tempname (bug 32214)
-
-Make sure to update the random value also if getrandom fails.
-
-Fixes: 686d542025 ("posix: Sync tempname with gnulib")
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=5f62cf88c4530c11904482775b7582bd7f6d80d2]
-
-Signed-off-by: Ola x Nilsson <olani@axis.com>
----
- sysdeps/posix/tempname.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sysdeps/posix/tempname.c b/sysdeps/posix/tempname.c
-index c00fe0c181..fc30958a0c 100644
---- a/sysdeps/posix/tempname.c
-+++ b/sysdeps/posix/tempname.c
-@@ -117,6 +117,8 @@ random_bits (random_value *r, random_value s)
-      succeed.  */
- #if !_LIBC
-   *r = mix_random_values (v, clock ());
-+#else
-+  *r = v;
- #endif
-   return false;
- }
diff --git a/meta/recipes-core/glibc/glibc_2.40.bb b/meta/recipes-core/glibc/glibc_2.41.bb
similarity index 98%
rename from meta/recipes-core/glibc/glibc_2.40.bb
rename to meta/recipes-core/glibc/glibc_2.41.bb
index 3e855b19d84..71b89ac9ffb 100644
--- a/meta/recipes-core/glibc/glibc_2.40.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -53,7 +53,6 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
-           file://0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d3bef833062..82749d94cde 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -22,3 +22,5 @@ BBCLASSEXTEND = "native nativesdk"
 GIR_MESON_OPTION = 'skip_introspection'
 GIR_MESON_ENABLE_FLAG = 'false'
 GIR_MESON_DISABLE_FLAG = 'true'
+
+GI_DATA_ENABLED:toolchain-clang = "False"

