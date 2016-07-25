Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4D7731CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8GZxo009366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:26 -0700
Message-ID: <ee1232cd353adfc76dd1a3b61a9f174cc8759d35.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/7] guile: 2.0.11 -> 2.0.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2016 08:16:35 -0000
Content-Type: text/plain

* Remove these patches which already in the source:
  - libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
  - remove_strcase_l_funcs.patch
  - 0001-libguile-Check-for-strtol_l-during-configure.patch

* Update 0002-Recognize-nios2-as-compilation-target.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...guile-Check-for-strtol_l-during-configure.patch | 56 ----------------------
 ...002-Recognize-nios2-as-compilation-target.patch | 20 ++++----
 ...guile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch | 43 -----------------
 .../guile/files/remove_strcase_l_funcs.patch       | 38 ---------------
 .../guile/{guile_2.0.11.bb => guile_2.0.12.bb}     | 11 +----
 5 files changed, 10 insertions(+), 158 deletions(-)
 delete mode 100644 meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
 delete mode 100644 meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
 delete mode 100644 meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
 rename meta/recipes-devtools/guile/{guile_2.0.11.bb => guile_2.0.12.bb} (91%)

diff --git a/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch b/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
deleted file mode 100644
index 24f073f..0000000
--- a/meta/recipes-devtools/guile/files/0001-libguile-Check-for-strtol_l-during-configure.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 814d6fb6c1f4a544c8fd37f5a390ba020c2d8c85 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 10 Jan 2016 22:28:17 +0000
-Subject: [PATCH] libguile: Check for strtol_l during configure
-
-strtol_l is a gnu extention which may not be available on other linux
-libc implementations e.g. musl. Therefore check for this funciton and
-conditionalize the use of it.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac    | 5 +++--
- libguile/i18n.c | 2 +-
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3969929..f8a6a1a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -752,7 +752,8 @@ AC_CHECK_HEADERS([assert.h crt_externs.h])
- #   truncate - not in mingw
- #   isblank - available as a GNU extension or in C99
- #   _NSGetEnviron - Darwin specific
--#   strcoll_l, newlocale - GNU extensions (glibc), also available on Darwin
-+#   strcoll_l, newlocale, strtol_l - GNU extensions (glibc),
-+#                                    also available on Darwin
- #   fork - unavailable on Windows
- #   utimensat - posix.1-2008
- #   sched_getaffinity, sched_setaffinity - GNU extensions (glibc)
-@@ -768,7 +769,7 @@ AC_CHECK_FUNCS([DINFINITY DQNAN cexp chsize clog clog10 ctermid		\
-   getgrent kill getppid getpgrp fork setitimer getitimer strchr strcmp	\
-   index bcopy memcpy rindex truncate unsetenv isblank _NSGetEnviron	\
-   strcoll strcoll_l newlocale utimensat sched_getaffinity		\
--  sched_setaffinity sendfile])
-+  sched_setaffinity sendfile strtol_l])
- 
- AM_CONDITIONAL([BUILD_ICE_9_POPEN],
-   [test "x$enable_posix" = "xyes" && test "x$ac_cv_func_fork" = "xyes"])
-diff --git a/libguile/i18n.c b/libguile/i18n.c
-index 97d44b0..9fb6976 100644
---- a/libguile/i18n.c
-+++ b/libguile/i18n.c
-@@ -1352,7 +1352,7 @@ SCM_DEFINE (scm_locale_string_to_integer, "locale-string->integer",
- 
-   if (c_locale != NULL)
-     {
--#ifdef USE_GNU_LOCALE_API
-+#if defined(USE_GNU_LOCALE_API) && defined(HAVE_STRTOL_L)
-       c_result = strtol_l (c_str, &c_endptr, c_base, c_locale);
- #else
-       RUN_IN_LOCALE_SECTION (c_locale,
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch b/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
index 519585b..8e84747 100644
--- a/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
+++ b/meta/recipes-devtools/guile/files/0002-Recognize-nios2-as-compilation-target.patch
@@ -10,27 +10,23 @@ Upstream-Status: Submitted [ http://debbugs.gnu.org/cgi/bugreport.cgi?bug=22480
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/module/system/base/target.scm b/module/system/base/target.scm
-index d60a8e0..d1f6cff 100644
 --- a/module/system/base/target.scm
 +++ b/module/system/base/target.scm
 @@ -65,7 +65,7 @@
        (cond ((string-match "^i[0-9]86$" cpu)
               (endianness little))
              ((member cpu '("x86_64" "ia64"
--                           "powerpcle" "powerpc64le" "mipsel" "mips64el"))
-+                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "nios2"))
+-                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "sh4"))
++                           "powerpcle" "powerpc64le" "mipsel" "mips64el" "sh4" "nios2"))
               (endianness little))
              ((member cpu '("sparc" "sparc64" "powerpc" "powerpc64" "spu"
-                            "mips" "mips64"))
-@@ -100,7 +100,7 @@
+                            "mips" "mips64" "m68k" "s390x"))
+@@ -108,7 +108,7 @@
  
            ((string-match "64$" cpu) 8)
-           ((string-match "64[lbe][lbe]$" cpu) 8)
--          ((member cpu '("sparc" "powerpc" "mips" "mipsel")) 4)
-+          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2")) 4)
+           ((string-match "64_?[lbe][lbe]$" cpu) 8)
+-          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "m68k" "sh4")) 4)
++          ((member cpu '("sparc" "powerpc" "mips" "mipsel" "m68k" "sh4" "nios2")) 4)
+           ((member cpu '("s390x")) 8)
            ((string-match "^arm.*" cpu) 4)
            (else (error "unknown CPU word size" cpu)))))
- 
--- 
-2.7.0.rc3
-
diff --git a/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch b/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
deleted file mode 100644
index e50059a..0000000
--- a/meta/recipes-devtools/guile/files/libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a85c78ea1393985fdb6e6678dea19135c553d341 Mon Sep 17 00:00:00 2001
-From: Mark H Weaver <mhw@netris.org>
-Date: Fri, 19 Sep 2014 21:18:09 -0400
-Subject: [PATCH] VM: ASM_MUL for ARM: Add earlyclobber constraint to the SMULL
- outputs.
-
-Reported by Rob Browning <rlb@defaultvalue.org>.
-
-* libguile/vm-i-scheme.c (ASM_MUL)[ARM]: Add earlyclobber (&) constraint
-  to the SMULL output registers.
-
-Author: Mark H Weaver <mhw@netris.org>
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- libguile/vm-i-scheme.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libguile/vm-i-scheme.c b/libguile/vm-i-scheme.c
-index 587aa95..162efab 100644
---- a/libguile/vm-i-scheme.c
-+++ b/libguile/vm-i-scheme.c
-@@ -1,5 +1,4 @@
--/* Copyright (C) 2001, 2009, 2010, 2011, 2012, 2013,
-- *   2014 Free Software Foundation, Inc.
-+/* Copyright (C) 2001, 2009-2014 Free Software Foundation, Inc.
-  * 
-  * This library is free software; you can redistribute it and/or
-  * modify it under the terms of the GNU Lesser General Public License
-@@ -363,7 +362,7 @@ VM_DEFINE_FUNCTION (149, ge, "ge?", 2)
-       {									\
- 	scm_t_signed_bits rlo, rhi;					\
- 	asm ("smull %0, %1, %2, %3\n"					\
--	     : "=r" (rlo), "=r" (rhi)					\
-+	     : "=&r" (rlo), "=&r" (rhi)					\
- 	     : "r" (SCM_UNPACK (x) - scm_tc2_int),			\
- 	       "r" (SCM_I_INUM (y)));					\
- 	if (SCM_LIKELY (SCM_SRS (rlo, 31) == rhi))			\
--- 
-2.3.5
-
diff --git a/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch b/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
deleted file mode 100644
index e7a06fe..0000000
--- a/meta/recipes-devtools/guile/files/remove_strcase_l_funcs.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-These unused functions cause build failures with uclibc since they reference __uclibc_locale_struct
-and this is exposed by uclibc API headers only if C locales are built, but for OE we build full locale
-support
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: guile-2.0.11/libguile/i18n.c
-===================================================================
---- guile-2.0.11.orig/libguile/i18n.c
-+++ guile-2.0.11/libguile/i18n.c
-@@ -851,27 +851,6 @@ str_downcase (register char *dst, regist
-   *dst = '\0';
- }
- 
--#ifdef USE_GNU_LOCALE_API
--static inline void
--str_upcase_l (register char *dst, register const char *src,
--	      scm_t_locale locale)
--{
--  for (; *src != '\0'; src++, dst++)
--    *dst = toupper_l (*src, locale);
--  *dst = '\0';
--}
--
--static inline void
--str_downcase_l (register char *dst, register const char *src,
--		scm_t_locale locale)
--{
--  for (; *src != '\0'; src++, dst++)
--    *dst = tolower_l (*src, locale);
--  *dst = '\0';
--}
--#endif
--
--
- SCM_DEFINE (scm_string_locale_lt, "string-locale<?", 2, 1, 0,
- 	    (SCM s1, SCM s2, SCM locale),
- 	    "Compare strings @var{s1} and @var{s2} in a locale-dependent way."
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.12.bb
similarity index 91%
rename from meta/recipes-devtools/guile/guile_2.0.11.bb
rename to meta/recipes-devtools/guile/guile_2.0.12.bb
index 6cefe66..d2fe511 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
@@ -22,18 +22,11 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
            file://libguile-Makefile.am-hook.patch \
-           file://libguile-VM-ASM_MUL-for-ARM-Add-earlyclobber.patch \
-           file://remove_strcase_l_funcs.patch \
-           file://0001-libguile-Check-for-strtol_l-during-configure.patch \
            file://0002-Recognize-nios2-as-compilation-target.patch \
            "
 
-#           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-#           file://opensuse/guile-turn-off-gc-test.patch
-
-SRC_URI[md5sum] = "03f1bce1a4983076d955003472306a13"
-SRC_URI[sha256sum] = "aed0a4a6db4e310cbdfeb3613fa6f86fddc91ef624c1e3f8937a6304c69103e2"
-
+SRC_URI[md5sum] = "081fdf80cd3a76f260a2a0d87f773d6b"
+SRC_URI[sha256sum] = "de8187736f9b260f2fa776ed39b52cb74dd389ccf7039c042f0606270196b7e9"
 
 inherit autotools gettext pkgconfig texinfo
 BBCLASSEXTEND = "native"
-- 
2.9.0


