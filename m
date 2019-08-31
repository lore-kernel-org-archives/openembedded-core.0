Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id A7E857F4AA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 05:23:27 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id o3so4243442plb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 22:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4bKn/WM9pOAWtx2utFaMkooT+IOEf+DNn/5T1shQce0=;
	b=HtvJGfW4+tVhhPkGtPy/kXU4rxAVcNX4Vpi6lNBjf1W7YNOa37lr+sJwN1+0ZS5PeX
	iBP0F1khDPzfM3GKOBt5/c7riaBAVvGpFQF4k6WvjDmo8IswnKU/6QRyxWEjXR8UPsj7
	3WlxAJdu5OsIDUDZNk1PxSUXsmtKEzjnxmFJa/q43y8nR8KKO9VcDpEyQafusuGZLKO4
	rdHFDT9fgqE12bP5eVej8Eczia90eNbF8IYBy//ri9xBc4Fns/buhKoXWg8sYrbek3zo
	tepYkfdd4wqayeYxQgUO8fyMyWAX0S51ltafViSUtI/4Qp1AeYYQkwiyc+3eorYMDaD/
	DrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4bKn/WM9pOAWtx2utFaMkooT+IOEf+DNn/5T1shQce0=;
	b=XzMArA+mSzNrlkPyqgglKAxu5GpFFMDdnbhDRKqe/B5JgEgphbAwO/jhb6ZjX3fkO2
	bx3Ekp+lZvxF71iMJAyjDcQjCwztCGx8wPdu6ZEkuDjHveL3ai9frEy9fy2usnDZTrOY
	p3NqqaDD3N2vg2e8OXwLmc+TdTq3RqZ/Y6L2hjS1GZsgft9auA7lftWq/Jpq4L4UAcwx
	MNFshXSVVHAgAMHA8WFoTX7wiY3e9/FmFF4AixQfO5fwhsateMUNj8cUcR95KrVrCNM9
	2d2BJiaDumdOCuDcpcFWybcYYbVANqnDDlsFYBDvKphfeCPtDTtamPK3oIb9JDnTTCMi
	DjCg==
X-Gm-Message-State: APjAAAWFoHfiAiSvJv+xFUccKBdmlWOC769dmtrZFzVmzDTwvC48XyLi
	8BPq412WCwyyRZ9X/EHVYq8dr8YsGWk=
X-Google-Smtp-Source: APXvYqwLigi6gMVDEljLwoLP+BbRf3e3Qr65oEsLGG3bX1h/IPWcisfpQjud4KvlFWtTtHEgKmrNWg==
X-Received: by 2002:a17:902:1a6:: with SMTP id
	b35mr18653408plb.228.1567229008104; 
	Fri, 30 Aug 2019 22:23:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	131sm6493221pge.37.2019.08.30.22.23.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 22:23:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 22:23:14 -0700
Message-Id: <20190831052314.19974-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190831052314.19974-1-raj.khem@gmail.com>
References: <20190831052314.19974-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gcc: Fix ldbl-128 support for musl
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
X-List-Received-Date: Sat, 31 Aug 2019 05:23:27 -0000
Content-Transfer-Encoding: 8bit

Let the patch trigger based on target triplet instead of passing via
configure, this lets gcc compile for 64bit otherwise it ends up with
libgcc  build errors

error: unable to emulate 'TF'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...bgcc-Add-knob-to-use-ldbl-128-on-ppc.patch | 178 +++++++-----------
 meta/recipes-devtools/gcc/gcc-common.inc      |   7 -
 .../gcc/gcc-configure-common.inc              |   1 -
 3 files changed, 66 insertions(+), 120 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch b/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
index f5769bc8e9..38eab5a083 100644
--- a/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
+++ b/meta/recipes-devtools/gcc/gcc-9.2/0030-libgcc-Add-knob-to-use-ldbl-128-on-ppc.patch
@@ -1,125 +1,79 @@
-From baab61ae3938ee2fa9ec03a20793508516a46dae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Apr 2016 20:03:28 +0000
-Subject: [PATCH 30/36] libgcc: Add knob to use ldbl-128 on ppc
-
-musl does not support ldbl 128 so we can not assume
-that linux as a whole supports ldbl-128 bits, instead
-act upon configure option passed to gcc and assume no
-on musl and yes otherwise if no option is passed since
-default behaviour is to assume ldbl128 it does not
-change the defaults
+From 47467f3ab0fb2f2fcede81060fe8bb339d0909eb Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <nsz@port70.net>
+Date: Wed, 28 Feb 2018 00:54:05 +0000
+Subject: [PATCH 10/12] ldbl128 config
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- libgcc/Makefile.in           |  1 +
- libgcc/config/rs6000/t-linux |  5 ++++-
- libgcc/configure             | 18 ++++++++++++++++++
- libgcc/configure.ac          | 12 ++++++++++++
- 4 files changed, 35 insertions(+), 1 deletion(-)
- mode change 100644 => 100755 libgcc/configure
+ gcc/configure    | 13 +++++++++++++
+ gcc/configure.ac | 16 ++++++++++++++--
+ 2 files changed, 27 insertions(+), 2 deletions(-)
 
-diff --git a/libgcc/Makefile.in b/libgcc/Makefile.in
-index ea390a5bbea..114c7876304 100644
---- a/libgcc/Makefile.in
-+++ b/libgcc/Makefile.in
-@@ -50,6 +50,7 @@ unwind_header = @unwind_header@
- md_unwind_header = @md_unwind_header@
- sfp_machine_header = @sfp_machine_header@
- thread_header = @thread_header@
-+with_ldbl128 = @with_ldbl128@
- 
- host_noncanonical = @host_noncanonical@
- real_host_noncanonical = @real_host_noncanonical@
-diff --git a/libgcc/config/rs6000/t-linux b/libgcc/config/rs6000/t-linux
-index 4f6d4c4a4d2..c50dd94a2da 100644
---- a/libgcc/config/rs6000/t-linux
-+++ b/libgcc/config/rs6000/t-linux
-@@ -1,3 +1,6 @@
- SHLIB_MAPFILES += $(srcdir)/config/rs6000/libgcc-glibc.ver
- 
--HOST_LIBGCC2_CFLAGS += -mlong-double-128 -mno-minimal-toc
-+ifeq ($(with_ldbl128),yes)
-+HOST_LIBGCC2_CFLAGS += -mlong-double-128
-+endif
-+HOST_LIBGCC2_CFLAGS += -mno-minimal-toc
-diff --git a/libgcc/configure b/libgcc/configure
-old mode 100644
-new mode 100755
-index 36dbbc1f699..b5dd5c34e2a
---- a/libgcc/configure
-+++ b/libgcc/configure
-@@ -651,6 +651,7 @@ build_vendor
- build_cpu
- build
- with_aix_soname
-+with_ldbl128
- enable_vtable_verify
- enable_gcov
- enable_shared
-@@ -702,6 +703,7 @@ with_ld
- enable_shared
- enable_gcov
- enable_vtable_verify
-+with_long_double_128
- with_aix_soname
- enable_version_specific_runtime_libs
- with_slibdir
-@@ -1363,6 +1365,7 @@ Optional Packages:
-   --with-target-subdir=SUBDIR      Configuring in a subdirectory for target
-   --with-cross-host=HOST           Configuring with a cross compiler
-   --with-ld               arrange to use the specified ld (full pathname)
-+  --with-long-double-128  use 128-bit long double by default
-   --with-aix-soname=aix|svr4|both
-                           shared library versioning (aka "SONAME") variant to
-                           provide on AIX
-@@ -2268,6 +2271,21 @@ fi
- 
- 
+diff --git a/gcc/configure b/gcc/configure
+index 6121e163259..07ff8597d48 100755
+--- a/gcc/configure
++++ b/gcc/configure
+@@ -29309,6 +29309,15 @@ if test "${with_long_double_128+set}" = set; then :
+   withval=$with_long_double_128; gcc_cv_target_ldbl128="$with_long_double_128"
+ else
  
-+# Check whether --with-long-double-128 was given.
-+if test "${with_long_double_128+set}" = set; then :
-+  withval=$with_long_double_128; with_ldbl128="$with_long_double_128"
-+else
-+  case "${host}" in
-+ power*-*-musl*)
-+   with_ldbl128="no";;
-+ *) with_ldbl128="yes";;
-+ esac
-+
-+fi
-+
++      case "$target" in
++	s390*-*-linux-musl*)
++	  gcc_cv_target_ldbl128=yes
++	  ;;
++	powerpc*-*-linux-musl*)
++	  gcc_cv_target_ldbl128=no
++	  ;;
++	*)
 +
+ if test $glibc_version_major -gt 2 \
+   || ( test $glibc_version_major -eq 2 && test $glibc_version_minor -ge 4 ); then :
+   gcc_cv_target_ldbl128=yes
+@@ -29320,6 +29329,10 @@ else
+       && gcc_cv_target_ldbl128=yes
+ 
+ fi
 +
++	  ;;
++      esac
 +
- # Check whether --with-aix-soname was given.
- if test "${with_aix_soname+set}" = set; then :
-   withval=$with_aix_soname; case "${host}:${enable_shared}" in
-diff --git a/libgcc/configure.ac b/libgcc/configure.ac
-index 8e96cafdf8b..9247856bf24 100644
---- a/libgcc/configure.ac
-+++ b/libgcc/configure.ac
-@@ -82,6 +82,18 @@ AC_ARG_ENABLE(vtable-verify,
- [enable_vtable_verify=no])
- AC_SUBST(enable_vtable_verify)
+ fi
  
-+AC_ARG_WITH(long-double-128,
-+[AS_HELP_STRING([--with-long-double-128],
-+    [use 128-bit long double by default])],
-+      with_ldbl128="$with_long_double_128",
-+[case "${host}" in
-+ power*-*-musl*)
-+   with_ldbl128="no";;
-+ *) with_ldbl128="yes";;
-+ esac
-+])
-+AC_SUBST(with_ldbl128)
-+
- AC_ARG_WITH(aix-soname,
- [AS_HELP_STRING([--with-aix-soname=aix|svr4|both],
-     [shared library versioning (aka "SONAME") variant to provide on AIX])],
+     ;;
+diff --git a/gcc/configure.ac b/gcc/configure.ac
+index b066cc609e1..6c15ed898c0 100644
+--- a/gcc/configure.ac
++++ b/gcc/configure.ac
+@@ -5971,13 +5971,25 @@ case "$target" in
+     AC_ARG_WITH(long-double-128,
+       [AS_HELP_STRING([--with-long-double-128],
+ 		      [use 128-bit long double by default])],
+-      gcc_cv_target_ldbl128="$with_long_double_128",
++      gcc_cv_target_ldbl128="$with_long_double_128", [
++      case "$target" in
++	s390*-*-linux-musl*)
++	  gcc_cv_target_ldbl128=yes
++	  ;;
++	powerpc*-*-linux-musl*)
++	  gcc_cv_target_ldbl128=no
++	  ;;
++	*)]
+       [GCC_GLIBC_VERSION_GTE_IFELSE([2], [4], [gcc_cv_target_ldbl128=yes], [
+       [gcc_cv_target_ldbl128=no
+       grep '^[ 	]*#[ 	]*define[ 	][ 	]*__LONG_DOUBLE_MATH_OPTIONAL' \
+         $target_header_dir/bits/wordsize.h > /dev/null 2>&1 \
+       && gcc_cv_target_ldbl128=yes
+-      ]])])
++      ]])]
++      [
++	  ;;
++      esac
++      ])
+     ;;
+ esac
+ if test x$gcc_cv_target_ldbl128 = xyes; then
 -- 
-2.22.1
+2.17.1
 
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 96334e54b4..89273a7745 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -41,13 +41,6 @@ def get_gcc_ppc_plt_settings(bb, d):
         return "--enable-secureplt"
     return ""
 
-def get_long_double_setting(bb, d):
-    if d.getVar('TRANSLATED_TARGET_ARCH') in [ 'powerpc', 'powerpc64' ] and d.getVar('TCLIBC') in [ 'glibc' ]:
-        return "--with-long-double-128"
-    else:
-        return "--without-long-double-128 libgcc_cv_powerpc_float128=no"
-    return ""
-
 def get_gcc_multiarch_setting(bb, d):
     target_arch = d.getVar('TRANSLATED_TARGET_ARCH')
     multiarch_options = {
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index b6f2ca541d..24ba8ce75f 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -36,7 +36,6 @@ EXTRA_OECONF = "\
     ${EXTRA_OECONF_PATHS} \
     ${@get_gcc_mips_plt_setting(bb, d)} \
     ${@get_gcc_ppc_plt_settings(bb, d)} \
-    ${@get_long_double_setting(bb, d)} \
     ${@get_gcc_multiarch_setting(bb, d)} \
 "
 
-- 
2.23.0


