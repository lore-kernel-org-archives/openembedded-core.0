Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 978D865D3B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 05:44:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0D5iVr2003251
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 12 Jan 2015 21:44:31 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 12 Jan 2015 21:44:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 13 Jan 2015 13:44:02 +0800
Message-ID: <7ded082bd2291eb7d131cabb990094c168d3a108.1421127484.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421127484.git.hongxu.jia@windriver.com>
References: <cover.1421127484.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] elfutils: upgrade to 1.161
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
X-List-Received-Date: Tue, 13 Jan 2015 05:44:36 -0000
Content-Type: text/plain

Drop PREFERRED_VERSION_elfutils in meta/conf/distro/include/
tcmode-default.inc, it builds the latest version by default.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc        |   1 -
 .../arm_backend.diff                               |   0
 .../arm_func_value.patch                           |   0
 .../arm_unwind_ret_mask.patch                      |   0
 .../fixheadercheck.patch                           |   0
 .../hppa_backend.diff                              |   0
 .../m68k_backend.diff                              |   0
 .../mips_backend.diff                              |   0
 .../mips_readelf_w.patch                           |   0
 .../non_linux.patch                                |   0
 .../redhat-portability.diff                        | 564 +++++++++++----------
 .../scanf-format.patch                             |   0
 .../testsuite-ignore-elflint.diff                  |   0
 .../{elfutils_0.160.bb => elfutils_0.161.bb}       |   4 +-
 14 files changed, 305 insertions(+), 264 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_func_value.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/arm_unwind_ret_mask.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/mips_readelf_w.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/non_linux.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/redhat-portability.diff (76%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.160 => elfutils-0.161}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.160.bb => elfutils_0.161.bb} (95%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2b41090..2b871f8 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -59,7 +59,6 @@ PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_uclibc                   ?= "${UCLIBCVERSION}"
 PREFERRED_VERSION_uclibc-initial           ?= "${UCLIBCVERSION}"
-PREFERRED_VERSION_elfutils ?= "0.160"
 # don't use version earlier than 1.4 for gzip-native, as it's necessary for
 # some packages using an archive format incompatible with earlier gzip
 PREFERRED_VERSION_gzip-native ?= "1.6"
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/arm_func_value.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/arm_func_value.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/arm_unwind_ret_mask.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/arm_unwind_ret_mask.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/non_linux.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/non_linux.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff
similarity index 76%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff
index a358b11..08f25a5 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.161/redhat-portability.diff
@@ -1,58 +1,47 @@
-Index: elfutils-0.159/backends/ChangeLog
-===================================================================
---- elfutils-0.159.orig/backends/ChangeLog
-+++ elfutils-0.159/backends/ChangeLog
-@@ -364,6 +364,10 @@
- 	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
- 	GNU_Power_ABI_Struct_Return.
- 
-+2009-01-23  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (libebl_%.so): Use $(LD_AS_NEEDED).
-+
- 2008-10-04  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
-@@ -691,6 +695,11 @@
- 	* sparc_init.c: Likewise.
- 	* x86_64_init.c: Likewise.
- 
-+2005-11-22  Roland McGrath  <roland@redhat.com>
-+
-+	* Makefile.am (LD_AS_NEEDED): New variable, substituted by configure.
-+	(libebl_%.so rule): Use it in place of -Wl,--as-needed.
-+
- 2005-11-19  Roland McGrath  <roland@redhat.com>
- 
- 	* ppc64_reloc.def: REL30 -> ADDR30.
-@@ -713,6 +722,9 @@
- 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
- 	(CLEANFILES): Add libebl_$(m).so.
- 
-+	* Makefile.am (WEXTRA): New variable, substituted by configure.
-+	(AM_CFLAGS): Use it in place of -Wextra.
-+
- 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
- 	* ppc64_reloc.def: Likewise.
- 
-Index: elfutils-0.159/backends/Makefile.am
-===================================================================
---- elfutils-0.159.orig/backends/Makefile.am
-+++ elfutils-0.159/backends/Makefile.am
-@@ -119,7 +119,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
- 	$(LINK) -shared -o $(@:.map=.so) \
- 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
- 		-Wl,--version-script,$(@:.so=.map) \
--		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw)
-+		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw)
- 	$(textrel_check)
- 
- libebl_i386.so: $(cpu_i386)
-Index: elfutils-0.159/ChangeLog
-===================================================================
---- elfutils-0.159.orig/ChangeLog
-+++ elfutils-0.159/ChangeLog
-@@ -148,6 +148,8 @@
+Rebase to 1.161
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ ChangeLog                   | 30 +++++++++++++++++++++++
+ backends/ChangeLog          | 12 +++++++++
+ backends/Makefile.am        |  2 +-
+ config/ChangeLog            |  4 +++
+ config/eu.am                | 14 ++++++++---
+ configure.ac                | 60 +++++++++++++++++++++++++++++++++++++++++++--
+ lib/ChangeLog               |  8 ++++++
+ lib/eu-config.h             | 11 +++++++++
+ libasm/ChangeLog            |  5 ++++
+ libcpu/ChangeLog            |  8 ++++++
+ libcpu/i386_disasm.c        |  1 +
+ libdw/ChangeLog             | 13 ++++++++++
+ libdw/dwarf_begin_elf.c     |  8 ++++++
+ libdw/libdw.h               |  2 +-
+ libdwfl/ChangeLog           | 20 +++++++++++++++
+ libdwfl/linux-core-attach.c | 29 ++++++++++++++++++++++
+ libdwfl/linux-pid-attach.c  | 14 +++++++++++
+ libebl/ChangeLog            |  5 ++++
+ libelf/ChangeLog            | 10 ++++++++
+ libelf/common.h             |  4 +--
+ libelf/gnuhash_xlate.h      |  6 +++--
+ src/ChangeLog               | 30 +++++++++++++++++++++++
+ src/Makefile.am             |  5 ++++
+ src/addr2line.c             |  4 +--
+ src/findtextrel.c           |  6 ++++-
+ src/ld.h                    |  2 ++
+ src/readelf.c               | 15 ++++++++----
+ src/strings.c               | 11 +++++++++
+ src/strip.c                 | 20 +++++++++++++--
+ tests/ChangeLog             | 14 +++++++++++
+ tests/Makefile.am           |  1 +
+ tests/backtrace.c           |  1 +
+ tests/line2addr.c           |  2 +-
+ 33 files changed, 355 insertions(+), 22 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index f81b302..3f9eaf1 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -187,6 +187,8 @@
  
  2012-01-24  Mark Wielaard  <mjw@redhat.com>
  
@@ -61,7 +50,7 @@ Index: elfutils-0.159/ChangeLog
  	* COPYING: Fix address. Updated version from gnulib.
  
  2012-01-23  Mark Wielaard  <mjw@redhat.com>
-@@ -166,6 +168,9 @@
+@@ -205,6 +207,9 @@
  
  2011-10-08  Mike Frysinger  <vapier@gentoo.org>
  
@@ -71,7 +60,7 @@ Index: elfutils-0.159/ChangeLog
  	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
  
  2011-10-02  Ulrich Drepper  <drepper@gmail.com>
-@@ -187,6 +192,10 @@
+@@ -226,6 +231,10 @@
  
  	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
  
@@ -82,7 +71,7 @@ Index: elfutils-0.159/ChangeLog
  2009-09-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* configure.ac: Update for more modern autoconf.
-@@ -195,6 +204,10 @@
+@@ -234,6 +243,10 @@
  
  	* configure.ac (zip_LIBS): Check for liblzma too.
  
@@ -93,7 +82,7 @@ Index: elfutils-0.159/ChangeLog
  2009-04-19  Roland McGrath  <roland@redhat.com>
  
  	* configure.ac (eu_version): Round down here, not in version.h macros.
-@@ -206,6 +219,8 @@
+@@ -245,6 +258,8 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -102,7 +91,7 @@ Index: elfutils-0.159/ChangeLog
  	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
  
  	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
-@@ -286,6 +301,10 @@
+@@ -325,6 +340,10 @@
  	* configure.ac: Add dummy automake conditional to get dependencies
  	for non-generic linker right.  See src/Makefile.am.
  
@@ -113,7 +102,7 @@ Index: elfutils-0.159/ChangeLog
  2005-11-18  Roland McGrath  <roland@redhat.com>
  
  	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
-@@ -333,6 +352,17 @@
+@@ -372,6 +391,17 @@
  	* Makefile.am (all_SUBDIRS): Add libdwfl.
  	* configure.ac: Write libdwfl/Makefile.
  
@@ -131,11 +120,61 @@ Index: elfutils-0.159/ChangeLog
  2005-05-19  Roland McGrath  <roland@redhat.com>
  
  	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
-Index: elfutils-0.159/config/ChangeLog
-===================================================================
---- elfutils-0.159.orig/config/ChangeLog
-+++ elfutils-0.159/config/ChangeLog
-@@ -58,6 +58,10 @@
+diff --git a/backends/ChangeLog b/backends/ChangeLog
+index e800d16..6a86248 100644
+--- a/backends/ChangeLog
++++ b/backends/ChangeLog
+@@ -433,6 +433,10 @@
+ 	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
+ 	GNU_Power_ABI_Struct_Return.
+ 
++2009-01-23  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (libebl_%.so): Use $(LD_AS_NEEDED).
++
+ 2008-10-04  Ulrich Drepper  <drepper@redhat.com>
+ 
+ 	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
+@@ -760,6 +764,11 @@
+ 	* sparc_init.c: Likewise.
+ 	* x86_64_init.c: Likewise.
+ 
++2005-11-22  Roland McGrath  <roland@redhat.com>
++
++	* Makefile.am (LD_AS_NEEDED): New variable, substituted by configure.
++	(libebl_%.so rule): Use it in place of -Wl,--as-needed.
++
+ 2005-11-19  Roland McGrath  <roland@redhat.com>
+ 
+ 	* ppc64_reloc.def: REL30 -> ADDR30.
+@@ -782,6 +791,9 @@
+ 	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
+ 	(CLEANFILES): Add libebl_$(m).so.
+ 
++	* Makefile.am (WEXTRA): New variable, substituted by configure.
++	(AM_CFLAGS): Use it in place of -Wextra.
++
+ 	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
+ 	* ppc64_reloc.def: Likewise.
+ 
+diff --git a/backends/Makefile.am b/backends/Makefile.am
+index 4d15a5d..507c9df 100644
+--- a/backends/Makefile.am
++++ b/backends/Makefile.am
+@@ -131,7 +131,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a $(libelf) $(libdw)
+ 	$(LINK) -shared -o $(@:.map=.so) \
+ 		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
+ 		-Wl,--version-script,$(@:.so=.map) \
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw)
+ 	@$(textrel_check)
+ 
+ libebl_i386.so: $(cpu_i386)
+diff --git a/config/ChangeLog b/config/ChangeLog
+index 1b4e896..058dd88 100644
+--- a/config/ChangeLog
++++ b/config/ChangeLog
+@@ -71,6 +71,10 @@
  
  	* known-dwarf.awk: Use gawk.
  
@@ -146,10 +185,10 @@ Index: elfutils-0.159/config/ChangeLog
  2010-07-02  Ulrich Drepper  <drepper@redhat.com>
  
  	* elfutils.spec.in: Add more BuildRequires.
-Index: elfutils-0.159/config/eu.am
-===================================================================
---- elfutils-0.159.orig/config/eu.am
-+++ elfutils-0.159/config/eu.am
+diff --git a/config/eu.am b/config/eu.am
+index faf8add..6ca36a5 100644
+--- a/config/eu.am
++++ b/config/eu.am
 @@ -1,6 +1,6 @@
  ## Common automake fragments for elfutils subdirectory makefiles.
  ##
@@ -182,10 +221,10 @@ Index: elfutils-0.159/config/eu.am
  COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage, $(COMPILE))
  
  %.os: %.c %.o
-Index: elfutils-0.159/configure.ac
-===================================================================
---- elfutils-0.159.orig/configure.ac
-+++ elfutils-0.159/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 0e67a79..a1ad6db 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -89,6 +89,54 @@ CFLAGS="$old_CFLAGS"])
  AS_IF([test "x$ac_cv_c99" != xyes],
        AC_MSG_ERROR([gcc with C99 support required]))
@@ -241,7 +280,7 @@ Index: elfutils-0.159/configure.ac
  AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
  # Use the same flags that we use for our DSOs, so the test is representative.
  # Some old compiler/linker/libc combinations fail some ways and not others.
-@@ -104,7 +152,10 @@ static __thread int a; int foo (int b) {
+@@ -104,7 +152,10 @@ static __thread int a; int foo (int b) { return a + b; }]],
  CFLAGS="$save_CFLAGS"
  LDFLAGS="$save_LDFLAGS"])
  AS_IF([test "x$ac_cv_tls" != xyes],
@@ -253,7 +292,7 @@ Index: elfutils-0.159/configure.ac
  
  dnl This test must come as early as possible after the compiler configuration
  dnl tests, because the choice of the file model can (in principle) affect
-@@ -183,6 +234,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_
+@@ -183,6 +234,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_valgrind" = yes)
  AM_CONDITIONAL(BUILD_STATIC, [dnl
  test "$use_gprof" = yes -o "$use_gcov" = yes])
  
@@ -265,7 +304,7 @@ Index: elfutils-0.159/configure.ac
  AC_ARG_ENABLE([tests-rpath],
  AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
-@@ -297,7 +353,7 @@ case "$eu_version" in
+@@ -302,7 +358,7 @@ case "$eu_version" in
  esac
  
  # Round up to the next release API (x.y) version.
@@ -274,10 +313,10 @@ Index: elfutils-0.159/configure.ac
  
  AC_CHECK_SIZEOF(long)
  
-Index: elfutils-0.159/lib/ChangeLog
-===================================================================
---- elfutils-0.159.orig/lib/ChangeLog
-+++ elfutils-0.159/lib/ChangeLog
+diff --git a/lib/ChangeLog b/lib/ChangeLog
+index 4415213..4911cc1 100644
+--- a/lib/ChangeLog
++++ b/lib/ChangeLog
 @@ -65,6 +65,9 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
@@ -300,11 +339,11 @@ Index: elfutils-0.159/lib/ChangeLog
  2005-04-30  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile.am: Use -ffunction-sections for xmalloc.c.
-Index: elfutils-0.159/lib/eu-config.h
-===================================================================
---- elfutils-0.159.orig/lib/eu-config.h
-+++ elfutils-0.159/lib/eu-config.h
-@@ -162,6 +162,17 @@ asm (".section predict_data, \"aw\"; .pr
+diff --git a/lib/eu-config.h b/lib/eu-config.h
+index 3afff26..d89f3a8 100644
+--- a/lib/eu-config.h
++++ b/lib/eu-config.h
+@@ -162,6 +162,17 @@ asm (".section predict_data, \"aw\"; .previous\n"
  /* This macro is used by the tests conditionalize for standalone building.  */
  #define ELFUTILS_HEADER(name) <lib##name.h>
  
@@ -322,11 +361,11 @@ Index: elfutils-0.159/lib/eu-config.h
  
  #ifdef SHARED
  # define OLD_VERSION(name, version) \
-Index: elfutils-0.159/libasm/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libasm/ChangeLog
-+++ elfutils-0.159/libasm/ChangeLog
-@@ -79,6 +79,11 @@
+diff --git a/libasm/ChangeLog b/libasm/ChangeLog
+index 9b25af9..32b9fd0 100644
+--- a/libasm/ChangeLog
++++ b/libasm/ChangeLog
+@@ -87,6 +87,11 @@
  	* asm_error.c: Add new error ASM_E_IOERROR.
  	* libasmP.h: Add ASM_E_IOERROR definition.
  
@@ -338,10 +377,10 @@ Index: elfutils-0.159/libasm/ChangeLog
  2005-02-15  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
-Index: elfutils-0.159/libcpu/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libcpu/ChangeLog
-+++ elfutils-0.159/libcpu/ChangeLog
+diff --git a/libcpu/ChangeLog b/libcpu/ChangeLog
+index a20f440..5ea23b7 100644
+--- a/libcpu/ChangeLog
++++ b/libcpu/ChangeLog
 @@ -51,6 +51,9 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
@@ -364,11 +403,11 @@ Index: elfutils-0.159/libcpu/ChangeLog
  2005-02-15  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
-Index: elfutils-0.159/libcpu/i386_disasm.c
-===================================================================
---- elfutils-0.159.orig/libcpu/i386_disasm.c
-+++ elfutils-0.159/libcpu/i386_disasm.c
-@@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, con
+diff --git a/libcpu/i386_disasm.c b/libcpu/i386_disasm.c
+index 832241f..c7a0df0 100644
+--- a/libcpu/i386_disasm.c
++++ b/libcpu/i386_disasm.c
+@@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, const uint8_t *end, GElf_Addr addr,
  
  			default:
  			  assert (! "INVALID not handled");
@@ -376,11 +415,11 @@ Index: elfutils-0.159/libcpu/i386_disasm.c
  			}
  		    }
  		  else
-Index: elfutils-0.159/libdw/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libdw/ChangeLog
-+++ elfutils-0.159/libdw/ChangeLog
-@@ -420,6 +420,10 @@
+diff --git a/libdw/ChangeLog b/libdw/ChangeLog
+index abc2d71..a9ee0b0 100644
+--- a/libdw/ChangeLog
++++ b/libdw/ChangeLog
+@@ -717,6 +717,10 @@
  
  	* Makefile.am (known-dwarf.h): Run gawk on config/known-dwarf.awk.
  
@@ -391,7 +430,7 @@ Index: elfutils-0.159/libdw/ChangeLog
  2011-07-14  Mark Wielaard  <mjw@redhat.com>
  
  	* libdw.h (dwarf_offdie): Fix documentation to mention .debug_info.
-@@ -779,6 +783,10 @@
+@@ -1076,6 +1080,10 @@
  
  	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
  
@@ -402,7 +441,7 @@ Index: elfutils-0.159/libdw/ChangeLog
  2009-08-10  Roland McGrath  <roland@redhat.com>
  
  	* dwarf_getscopevar.c: Use dwarf_diename.
-@@ -1547,6 +1555,11 @@
+@@ -1844,6 +1852,11 @@
  
  2005-05-31  Roland McGrath  <roland@redhat.com>
  
@@ -414,10 +453,10 @@ Index: elfutils-0.159/libdw/ChangeLog
  	* dwarf_formref_die.c (dwarf_formref_die): Add CU header offset to
  	formref offset.
  
-Index: elfutils-0.159/libdw/dwarf_begin_elf.c
-===================================================================
---- elfutils-0.159.orig/libdw/dwarf_begin_elf.c
-+++ elfutils-0.159/libdw/dwarf_begin_elf.c
+diff --git a/libdw/dwarf_begin_elf.c b/libdw/dwarf_begin_elf.c
+index 4c49ce2..7ea1430 100644
+--- a/libdw/dwarf_begin_elf.c
++++ b/libdw/dwarf_begin_elf.c
 @@ -47,6 +47,14 @@
  #if USE_ZLIB
  # include <endian.h>
@@ -433,11 +472,11 @@ Index: elfutils-0.159/libdw/dwarf_begin_elf.c
  # include <zlib.h>
  # undef crc32
  #endif
-Index: elfutils-0.159/libdw/libdw.h
-===================================================================
---- elfutils-0.159.orig/libdw/libdw.h
-+++ elfutils-0.159/libdw/libdw.h
-@@ -891,7 +891,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (
+diff --git a/libdw/libdw.h b/libdw/libdw.h
+index b2b2282..722c589 100644
+--- a/libdw/libdw.h
++++ b/libdw/libdw.h
+@@ -1003,7 +1003,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (Dwarf *dbg, Dwarf_OOM handler);
  
  
  /* Inline optimizations.  */
@@ -446,11 +485,11 @@ Index: elfutils-0.159/libdw/libdw.h
  /* Return attribute code of given attribute.  */
  __libdw_extern_inline unsigned int
  dwarf_whatattr (Dwarf_Attribute *attr)
-Index: elfutils-0.159/libdwfl/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libdwfl/ChangeLog
-+++ elfutils-0.159/libdwfl/ChangeLog
-@@ -421,6 +421,21 @@
+diff --git a/libdwfl/ChangeLog b/libdwfl/ChangeLog
+index 69e59a6..15c2987 100644
+--- a/libdwfl/ChangeLog
++++ b/libdwfl/ChangeLog
+@@ -571,6 +571,21 @@
  	(dwfl_module_addrsym) (i_to_symfile): New function.
  	(dwfl_module_addrsym) (search_table): Use it.
  
@@ -472,7 +511,7 @@ Index: elfutils-0.159/libdwfl/ChangeLog
  2013-11-07  Jan Kratochvil  <jan.kratochvil@redhat.com>
  	    Mark Wielaard  <mjw@redhat.com>
  
-@@ -2186,6 +2201,11 @@
+@@ -2336,6 +2351,11 @@
  
  2005-07-21  Roland McGrath  <roland@redhat.com>
  
@@ -484,10 +523,10 @@ Index: elfutils-0.159/libdwfl/ChangeLog
  	* Makefile.am (noinst_HEADERS): Add loc2c.c.
  
  	* test2.c (main): Check sscanf result to quiet warning.
-Index: elfutils-0.159/libdwfl/linux-core-attach.c
-===================================================================
---- elfutils-0.159.orig/libdwfl/linux-core-attach.c
-+++ elfutils-0.159/libdwfl/linux-core-attach.c
+diff --git a/libdwfl/linux-core-attach.c b/libdwfl/linux-core-attach.c
+index 5a7b3b3..d05ac7e 100644
+--- a/libdwfl/linux-core-attach.c
++++ b/libdwfl/linux-core-attach.c
 @@ -29,6 +29,35 @@
  #include "libdwflP.h"
  #include <fcntl.h>
@@ -522,12 +561,12 @@ Index: elfutils-0.159/libdwfl/linux-core-attach.c
 +# endif
 +#endif
  
- #ifndef MIN
- # define MIN(a, b) ((a) < (b) ? (a) : (b))
-Index: elfutils-0.159/libdwfl/linux-pid-attach.c
-===================================================================
---- elfutils-0.159.orig/libdwfl/linux-pid-attach.c
-+++ elfutils-0.159/libdwfl/linux-pid-attach.c
+ #include "../libdw/memory-access.h"
+ 
+diff --git a/libdwfl/linux-pid-attach.c b/libdwfl/linux-pid-attach.c
+index efbcf03..ae5af38 100644
+--- a/libdwfl/linux-pid-attach.c
++++ b/libdwfl/linux-pid-attach.c
 @@ -255,6 +255,11 @@ void
  internal_function
  __libdwfl_ptrace_detach (pid_t tid, bool tid_was_stopped)
@@ -540,7 +579,7 @@ Index: elfutils-0.159/libdwfl/linux-pid-attach.c
    /* This handling is needed only on older Linux kernels such as
       2.6.32-358.23.2.el6.ppc64.  Later kernels such as
       3.11.7-200.fc19.x86_64 remember the T (stopped) state
-@@ -262,6 +267,15 @@ __libdwfl_ptrace_detach (pid_t tid, bool
+@@ -262,6 +267,15 @@ __libdwfl_ptrace_detach (pid_t tid, bool tid_was_stopped)
       PTRACE_DETACH.  */
    ptrace (PTRACE_DETACH, tid, NULL,
  	  (void *) (intptr_t) (tid_was_stopped ? SIGSTOP : 0));
@@ -556,11 +595,11 @@ Index: elfutils-0.159/libdwfl/linux-pid-attach.c
  }
  
  static void
-Index: elfutils-0.159/libebl/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libebl/ChangeLog
-+++ elfutils-0.159/libebl/ChangeLog
-@@ -748,6 +748,11 @@
+diff --git a/libebl/ChangeLog b/libebl/ChangeLog
+index 5e635f2..998544f 100644
+--- a/libebl/ChangeLog
++++ b/libebl/ChangeLog
+@@ -765,6 +765,11 @@
  	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
  	tracking works right.
  
@@ -572,11 +611,11 @@ Index: elfutils-0.159/libebl/ChangeLog
  2005-05-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* libebl_x86_64.map: Add x86_64_core_note.
-Index: elfutils-0.159/libelf/ChangeLog
-===================================================================
---- elfutils-0.159.orig/libelf/ChangeLog
-+++ elfutils-0.159/libelf/ChangeLog
-@@ -135,6 +135,11 @@
+diff --git a/libelf/ChangeLog b/libelf/ChangeLog
+index 3b88d03..cb6cad5 100644
+--- a/libelf/ChangeLog
++++ b/libelf/ChangeLog
+@@ -244,6 +244,11 @@
  
  	* elf-knowledge.h (SECTION_STRIP_P): Remove < SHT_NUM check.
  
@@ -588,7 +627,7 @@ Index: elfutils-0.159/libelf/ChangeLog
  2011-02-26  Mark Wielaard  <mjw@redhat.com>
  
  	* elf_end.c (elf_end): Call rwlock_unlock before rwlock_fini.
-@@ -812,6 +817,11 @@
+@@ -921,6 +926,11 @@
  
  	* elf.h: Update from glibc.
  
@@ -600,10 +639,10 @@ Index: elfutils-0.159/libelf/ChangeLog
  2005-05-08  Roland McGrath  <roland@redhat.com>
  
  	* elf_begin.c (read_file) [_MUDFLAP]: Don't use mmap for now.
-Index: elfutils-0.159/libelf/common.h
-===================================================================
---- elfutils-0.159.orig/libelf/common.h
-+++ elfutils-0.159/libelf/common.h
+diff --git a/libelf/common.h b/libelf/common.h
+index 744f1bb..185ea59 100644
+--- a/libelf/common.h
++++ b/libelf/common.h
 @@ -139,7 +139,7 @@ libelf_release_all (Elf *elf)
    (Var) = (sizeof (Var) == 1						      \
  	   ? (unsigned char) (Var)					      \
@@ -622,10 +661,10 @@ Index: elfutils-0.159/libelf/common.h
  	      : (sizeof (Var) == 4					      \
  		 ? bswap_32 (Var)					      \
  		 : bswap_64 (Var))))
-Index: elfutils-0.159/libelf/gnuhash_xlate.h
-===================================================================
---- elfutils-0.159.orig/libelf/gnuhash_xlate.h
-+++ elfutils-0.159/libelf/gnuhash_xlate.h
+diff --git a/libelf/gnuhash_xlate.h b/libelf/gnuhash_xlate.h
+index 04d9ca1..3e25936 100644
+--- a/libelf/gnuhash_xlate.h
++++ b/libelf/gnuhash_xlate.h
 @@ -1,5 +1,5 @@
  /* Conversion functions for versioning information.
 -   Copyright (C) 2006, 2007 Red Hat, Inc.
@@ -633,7 +672,7 @@ Index: elfutils-0.159/libelf/gnuhash_xlate.h
     This file is part of elfutils.
     Written by Ulrich Drepper <drepper@redhat.com>, 2006.
  
-@@ -68,7 +68,9 @@ elf_cvt_gnuhash (void *dest, const void
+@@ -69,7 +69,9 @@ elf_cvt_gnuhash (void *dest, const void *src, size_t len, int encode)
    dest32 = (Elf32_Word *) &dest64[bitmask_words];
    while (len >= 4)
      {
@@ -644,28 +683,11 @@ Index: elfutils-0.159/libelf/gnuhash_xlate.h
        len -= 4;
      }
  }
-Index: elfutils-0.159/src/addr2line.c
-===================================================================
---- elfutils-0.159.orig/src/addr2line.c
-+++ elfutils-0.159/src/addr2line.c
-@@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl
-       bool parsed = false;
-       int i, j;
-       char *name = NULL;
--      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
-+      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
- 	  && string[i] == '\0')
- 	parsed = adjust_to_section (name, &addr, dwfl);
--      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
-+      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
- 	{
- 	default:
- 	  break;
-Index: elfutils-0.159/src/ChangeLog
-===================================================================
---- elfutils-0.159.orig/src/ChangeLog
-+++ elfutils-0.159/src/ChangeLog
-@@ -1112,8 +1112,16 @@
+diff --git a/src/ChangeLog b/src/ChangeLog
+index 0ae863e..1162f6e 100644
+--- a/src/ChangeLog
++++ b/src/ChangeLog
+@@ -1371,8 +1371,16 @@
  	* readelf.c (attr_callback): Use print_block only when we don't use
  	print_ops.
  
@@ -682,7 +704,7 @@ Index: elfutils-0.159/src/ChangeLog
  	* ar.c (do_oper_extract): Use pathconf instead of statfs.
  
  2009-08-01  Ulrich Drepper  <drepper@redhat.com>
-@@ -1277,6 +1285,8 @@
+@@ -1536,6 +1544,8 @@
  	* readelf.c (print_debug_frame_section): Use t instead of j formats
  	for ptrdiff_t OFFSET.
  
@@ -691,7 +713,7 @@ Index: elfutils-0.159/src/ChangeLog
  2009-01-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
-@@ -1460,6 +1470,11 @@
+@@ -1719,6 +1729,11 @@
  	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
  	is valid in RELRO.
  
@@ -703,7 +725,7 @@ Index: elfutils-0.159/src/ChangeLog
  2008-02-29  Roland McGrath  <roland@redhat.com>
  
  	* readelf.c (print_attributes): Add a cast.
-@@ -1711,6 +1726,8 @@
+@@ -1970,6 +1985,8 @@
  
  	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
  
@@ -712,7 +734,7 @@ Index: elfutils-0.159/src/ChangeLog
  2007-10-15  Roland McGrath  <roland@redhat.com>
  
  	* make-debug-archive.in: New file.
-@@ -2150,6 +2167,10 @@
+@@ -2409,6 +2426,10 @@
  	* elflint.c (valid_e_machine): Add EM_ALPHA.
  	Reported by Christian Aichinger <Greek0@gmx.net>.
  
@@ -723,7 +745,7 @@ Index: elfutils-0.159/src/ChangeLog
  2006-08-08  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
-@@ -2226,6 +2247,10 @@
+@@ -2485,6 +2506,10 @@
  	* Makefile.am: Add hacks to create dependency files for non-generic
  	linker.
  
@@ -734,7 +756,7 @@ Index: elfutils-0.159/src/ChangeLog
  2006-06-12  Ulrich Drepper  <drepper@redhat.com>
  
  	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
-@@ -2574,6 +2599,11 @@
+@@ -2833,6 +2858,11 @@
  	* readelf.c (print_debug_loc_section): Fix indentation for larger
  	address size.
  
@@ -746,11 +768,44 @@ Index: elfutils-0.159/src/ChangeLog
  2005-05-30  Roland McGrath  <roland@redhat.com>
  
  	* readelf.c (print_debug_line_section): Print section offset of each
-Index: elfutils-0.159/src/findtextrel.c
-===================================================================
---- elfutils-0.159.orig/src/findtextrel.c
-+++ elfutils-0.159/src/findtextrel.c
-@@ -496,7 +496,11 @@ ptrcompare (const void *p1, const void *
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 4f198da..a612cf6 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -89,6 +89,11 @@ endif
+ # XXX While the file is not finished, don't warn about this
+ ldgeneric_no_Wunused = yes
+ 
++# Buggy old compilers or libc headers.
++readelf_no_Werror = yes
++strings_no_Werror = yes
++addr2line_no_Wformat = yes
++
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
+ 	   $(demanglelib)
+diff --git a/src/addr2line.c b/src/addr2line.c
+index de80294..e982982 100644
+--- a/src/addr2line.c
++++ b/src/addr2line.c
+@@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl *dwfl)
+       bool parsed = false;
+       int i, j;
+       char *name = NULL;
+-      if (sscanf (string, "(%m[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
++      if (sscanf (string, "(%a[^)])%" PRIiMAX "%n", &name, &addr, &i) == 2
+ 	  && string[i] == '\0')
+ 	parsed = adjust_to_section (name, &addr, dwfl);
+-      switch (sscanf (string, "%m[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
++      switch (sscanf (string, "%a[^-+]%n%" PRIiMAX "%n", &name, &i, &addr, &j))
+ 	{
+ 	default:
+ 	  break;
+diff --git a/src/findtextrel.c b/src/findtextrel.c
+index 264a06b..d7de202 100644
+--- a/src/findtextrel.c
++++ b/src/findtextrel.c
+@@ -502,7 +502,11 @@ ptrcompare (const void *p1, const void *p2)
  
  
  static void
@@ -763,10 +818,10 @@ Index: elfutils-0.159/src/findtextrel.c
  	   GElf_Addr addr, Elf *elf, Elf_Scn *symscn, Dwarf *dw,
  	   const char *fname, bool more_than_one, void **knownsrcs)
  {
-Index: elfutils-0.159/src/ld.h
-===================================================================
---- elfutils-0.159.orig/src/ld.h
-+++ elfutils-0.159/src/ld.h
+diff --git a/src/ld.h b/src/ld.h
+index 29f4031..8695c31 100644
+--- a/src/ld.h
++++ b/src/ld.h
 @@ -1114,6 +1114,7 @@ extern bool dynamically_linked_p (void);
  
  /* Checked whether the symbol is undefined and referenced from a DSO.  */
@@ -775,34 +830,18 @@ Index: elfutils-0.159/src/ld.h
  #ifdef __GNUC_STDC_INLINE__
  __attribute__ ((__gnu_inline__))
  #endif
-@@ -1131,5 +1132,6 @@ linked_from_dso_p (struct scninfo *scnin
+@@ -1131,5 +1132,6 @@ linked_from_dso_p (struct scninfo *scninfo, size_t symidx)
  
    return sym->defined && sym->in_dso;
  }
 +#endif	/* Optimizing and not GCC 4.2.  */
  
  #endif	/* ld.h */
-Index: elfutils-0.159/src/Makefile.am
-===================================================================
---- elfutils-0.159.orig/src/Makefile.am
-+++ elfutils-0.159/src/Makefile.am
-@@ -89,6 +89,11 @@ endif
- # XXX While the file is not finished, don't warn about this
- ldgeneric_no_Wunused = yes
- 
-+# Buggy old compilers or libc headers.
-+readelf_no_Werror = yes
-+strings_no_Werror = yes
-+addr2line_no_Wformat = yes
-+
- readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
- nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
- 	   $(demanglelib)
-Index: elfutils-0.159/src/readelf.c
-===================================================================
---- elfutils-0.159.orig/src/readelf.c
-+++ elfutils-0.159/src/readelf.c
-@@ -4239,10 +4239,12 @@ listptr_base (struct listptr *p)
+diff --git a/src/readelf.c b/src/readelf.c
+index d49544f..15dbe62 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -4368,10 +4368,12 @@ listptr_base (struct listptr *p)
    return base;
  }
  
@@ -817,7 +856,7 @@ Index: elfutils-0.159/src/readelf.c
    struct listptr *p1 = (void *) a;
    struct listptr *p2 = (void *) b;
  
-@@ -4331,8 +4333,11 @@ static void
+@@ -4467,8 +4469,11 @@ static void
  sort_listptr (struct listptr_table *table, const char *name)
  {
    if (table->n > 0)
@@ -831,7 +870,7 @@ Index: elfutils-0.159/src/readelf.c
  }
  
  static bool
-@@ -9252,7 +9257,7 @@ dump_archive_index (Elf *elf, const char
+@@ -9540,7 +9545,7 @@ dump_archive_index (Elf *elf, const char *fname)
  	  if (unlikely (elf_rand (elf, as_off) == 0)
  	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
  			   == NULL))
@@ -840,10 +879,10 @@ Index: elfutils-0.159/src/readelf.c
  	    while (1)
  #endif
  	      error (EXIT_FAILURE, 0,
-Index: elfutils-0.159/src/strings.c
-===================================================================
---- elfutils-0.159.orig/src/strings.c
-+++ elfutils-0.159/src/strings.c
+diff --git a/src/strings.c b/src/strings.c
+index f60e4b4..dae6ab2 100644
+--- a/src/strings.c
++++ b/src/strings.c
 @@ -43,6 +43,10 @@
  
  #include <system.h>
@@ -855,7 +894,7 @@ Index: elfutils-0.159/src/strings.c
  
  /* Prototypes of local functions.  */
  static int read_fd (int fd, const char *fname, off64_t fdlen);
-@@ -489,8 +493,13 @@ map_file (int fd, off64_t start_off, off
+@@ -489,8 +493,13 @@ map_file (int fd, off64_t start_off, off64_t fdlen, size_t *map_sizep)
  		    fd, start_off);
        if (mem != MAP_FAILED)
  	{
@@ -869,7 +908,7 @@ Index: elfutils-0.159/src/strings.c
  	  break;
  	}
        if (errno != EINVAL && errno != ENOMEM)
-@@ -581,9 +590,11 @@ read_block (int fd, const char *fname, o
+@@ -581,9 +590,11 @@ read_block (int fd, const char *fname, off64_t fdlen, off64_t from, off64_t to)
        elfmap_off = from & ~(ps - 1);
        elfmap_base = elfmap = map_file (fd, elfmap_off, fdlen, &elfmap_size);
  
@@ -881,10 +920,10 @@ Index: elfutils-0.159/src/strings.c
      }
  
    if (unlikely (elfmap == MAP_FAILED))
-Index: elfutils-0.159/src/strip.c
-===================================================================
---- elfutils-0.159.orig/src/strip.c
-+++ elfutils-0.159/src/strip.c
+diff --git a/src/strip.c b/src/strip.c
+index 2b21799..1b34eee 100644
+--- a/src/strip.c
++++ b/src/strip.c
 @@ -45,6 +45,12 @@
  #include <libebl.h>
  #include <system.h>
@@ -917,7 +956,7 @@ Index: elfutils-0.159/src/strip.c
      }
  
    /* Open the file.  */
-@@ -2086,7 +2102,7 @@ while computing checksum for debug infor
+@@ -2091,7 +2107,7 @@ while computing checksum for debug information"));
    /* If requested, preserve the timestamp.  */
    if (tvp != NULL)
      {
@@ -926,7 +965,7 @@ Index: elfutils-0.159/src/strip.c
  	{
  	  error (0, errno, gettext ("\
  cannot set access and modification date of '%s'"),
-@@ -2143,7 +2159,7 @@ handle_ar (int fd, Elf *elf, const char
+@@ -2148,7 +2164,7 @@ handle_ar (int fd, Elf *elf, const char *prefix, const char *fname,
  
    if (tvp != NULL)
      {
@@ -935,23 +974,11 @@ Index: elfutils-0.159/src/strip.c
  	{
  	  error (0, errno, gettext ("\
  cannot set access and modification date of '%s'"), fname);
-Index: elfutils-0.159/tests/backtrace.c
-===================================================================
---- elfutils-0.159.orig/tests/backtrace.c
-+++ elfutils-0.159/tests/backtrace.c
-@@ -36,6 +36,7 @@
- #include <fcntl.h>
- #include <string.h>
- #include <argp.h>
-+#include <sys/syscall.h>
- #include ELFUTILS_HEADER(dwfl)
- 
- #ifndef __linux__
-Index: elfutils-0.159/tests/ChangeLog
-===================================================================
---- elfutils-0.159.orig/tests/ChangeLog
-+++ elfutils-0.159/tests/ChangeLog
-@@ -283,6 +283,13 @@
+diff --git a/tests/ChangeLog b/tests/ChangeLog
+index 59048f6..02eccfc 100644
+--- a/tests/ChangeLog
++++ b/tests/ChangeLog
+@@ -421,6 +421,13 @@
  
  2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
  
@@ -965,7 +992,7 @@ Index: elfutils-0.159/tests/ChangeLog
  	* Makefile.am (check_PROGRAMS): Add backtrace, backtrace-child,
  	backtrace-data and backtrace-dwarf.
  	(BUILT_SOURCES, clean-local, backtrace-child-biarch): New.
-@@ -1147,6 +1154,8 @@
+@@ -1285,6 +1292,8 @@
  
  2008-01-21  Roland McGrath  <roland@redhat.com>
  
@@ -974,7 +1001,7 @@ Index: elfutils-0.159/tests/ChangeLog
  	* testfile45.S.bz2: Add tests for cltq, cqto.
  	* testfile45.expect.bz2: Adjust.
  
-@@ -1855,6 +1864,11 @@
+@@ -1993,6 +2002,11 @@
  	* Makefile.am (TESTS): Add run-elflint-test.sh.
  	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
  
@@ -986,10 +1013,34 @@ Index: elfutils-0.159/tests/ChangeLog
  2005-05-24  Ulrich Drepper  <drepper@redhat.com>
  
  	* get-files.c (main): Use correct format specifier.
-Index: elfutils-0.159/tests/line2addr.c
-===================================================================
---- elfutils-0.159.orig/tests/line2addr.c
-+++ elfutils-0.159/tests/line2addr.c
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index f32e4d0..2652fb8 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -365,6 +365,7 @@ get_lines_LDADD = $(libdw) $(libelf)
+ get_files_LDADD = $(libdw) $(libelf)
+ get_aranges_LDADD = $(libdw) $(libelf)
+ allfcts_LDADD = $(libdw) $(libelf)
++line2addr_no_Wformat = yes
+ line2addr_LDADD = $(libdw)
+ addrscopes_LDADD = $(libdw)
+ funcscopes_LDADD = $(libdw)
+diff --git a/tests/backtrace.c b/tests/backtrace.c
+index 331ba0f..46af9b5 100644
+--- a/tests/backtrace.c
++++ b/tests/backtrace.c
+@@ -36,6 +36,7 @@
+ #include <fcntl.h>
+ #include <string.h>
+ #include <argp.h>
++#include <sys/syscall.h>
+ #include ELFUTILS_HEADER(dwfl)
+ 
+ #ifndef __linux__
+diff --git a/tests/line2addr.c b/tests/line2addr.c
+index e0d65d3..7c171b9 100644
+--- a/tests/line2addr.c
++++ b/tests/line2addr.c
 @@ -124,7 +124,7 @@ main (int argc, char *argv[])
      {
        struct args a = { .arg = argv[cnt] };
@@ -999,15 +1050,6 @@ Index: elfutils-0.159/tests/line2addr.c
  	{
  	default:
  	case 0:
-Index: elfutils-0.159/tests/Makefile.am
-===================================================================
---- elfutils-0.159.orig/tests/Makefile.am
-+++ elfutils-0.159/tests/Makefile.am
-@@ -356,6 +356,7 @@ get_lines_LDADD = $(libdw) $(libelf)
- get_files_LDADD = $(libdw) $(libelf)
- get_aranges_LDADD = $(libdw) $(libelf)
- allfcts_LDADD = $(libdw) $(libelf)
-+line2addr_no_Wformat = yes
- line2addr_LDADD = $(libdw)
- addrscopes_LDADD = $(libdw)
- funcscopes_LDADD = $(libdw)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.161/scanf-format.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/scanf-format.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.161/scanf-format.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.161/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.160/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.161/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.160.bb b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
similarity index 95%
rename from meta/recipes-devtools/elfutils/elfutils_0.160.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.161.bb
index e02918e..a3c1f36 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.160.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.161.bb
@@ -7,8 +7,8 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7527f22dff8b1ac8c122cfc4d3d3bb1e"
-SRC_URI[sha256sum] = "741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1"
+SRC_URI[md5sum] = "e1b9847c9a6a1ad340de8d47a863ec52"
+SRC_URI[sha256sum] = "570c91a1783fa5386aaa2dfdd08dda1de777c2b63bf3b9c1437d635ffdd7a070"
 
 SRC_URI += "\
         file://mempcpy.patch \
-- 
1.9.1


