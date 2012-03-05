Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4ge4-00083z-NH
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:44:45 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2012 14:36:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="117953845"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2012 14:36:07 -0800
Message-ID: <4F553FD6.1060604@linux.intel.com>
Date: Mon, 05 Mar 2012 14:36:06 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1330928512-12937-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1330928512-12937-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gcc: Upgrade to 4.6.3 release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 22:44:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/04/2012 10:21 PM, Khem Raj wrote:
> core-image-sato/core-image-minimal builds and boots
> on all qemu machines
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gcc/gcc-4.6.inc              |    9 +-
>   .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   32 +++---
>   .../gcc/gcc-4.6/gcc-flags-for-build.patch          |   97 +++++++++++---------
>   .../gcc-4.6/gcc-poison-system-directories.patch    |   80 ++++++++--------
>   .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |   36 ++++----
>   .../gcc/gcc-4.6/volatile_access_backport.patch     |   28 ------
>   6 files changed, 131 insertions(+), 151 deletions(-)
>   delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch
>
Khem,

We are moving into stabilization phase with oe-core with the pending 
2012-01 version.  I am going to pull this locally to MUT and start 
testing it, if I get good results, we will get it into master now, but 
if we see issues, it will likely get held for master-next and most 2012-01.

Sau!

> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
> index edc2a58..99c30a6 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r22"
> +PR = "r23"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -8,7 +8,7 @@ PR = "r22"
>   # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
>   # to reflect that change
>
> -PV = "4.6.2+svnr${SRCPV}"
> +PV = "4.6.3+svnr${SRCPV}"
>
>   # BINV should be incremented after updating to a revision
>   # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
> @@ -16,9 +16,9 @@ PV = "4.6.2+svnr${SRCPV}"
>   # 4.6.1 then the value below will have 2 which will mean 4.6.2
>   # which will be next minor release and so on.
>
> -BINV = "4.6.3"
> +BINV = "4.6.4"
>
> -SRCREV = "181430"
> +SRCREV = "184847"
>   BRANCH = "gcc-4_6-branch"
>   FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
>
> @@ -63,7 +63,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
>   	   file://optional_libstdc.patch \
>   	   file://disable_relax_pic_calls_flag.patch \
>   	   file://COLLECT_GCC_OPTIONS.patch \
> -           file://volatile_access_backport.patch \
>              file://use-defaults.h-and-t-oe-in-B.patch \
>   	   file://powerpc-e5500.patch \
>              file://fix-for-ice-50099.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
> index 6ccbeea..575e0e4 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
> @@ -58,8 +58,8 @@ from the sysroot, one of the paths *does* need to be relocated in this way.
>   ===========================
>   Index: gcc-4_6-branch/gcc/Makefile.in
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/Makefile.in	2011-12-13 22:52:15.000000000 -0800
> -+++ gcc-4_6-branch/gcc/Makefile.in	2011-12-13 22:52:21.933635767 -0800
> +--- gcc-4_6-branch.orig/gcc/Makefile.in	2012-03-04 09:33:36.000000000 -0800
> ++++ gcc-4_6-branch/gcc/Makefile.in	2012-03-04 09:41:06.858672113 -0800
>   @@ -587,6 +587,7 @@
>    build_tooldir = $(exec_prefix)/$(target_noncanonical)
>    # Directory in which the compiler finds target-independent g++ includes.
> @@ -78,8 +78,8 @@ Index: gcc-4_6-branch/gcc/Makefile.in
>      -DLOCAL_INCLUDE_DIR=\"$(local_includedir)\" \
>   Index: gcc-4_6-branch/gcc/configure.ac
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/configure.ac	2011-12-13 22:52:15.000000000 -0800
> -+++ gcc-4_6-branch/gcc/configure.ac	2011-12-13 22:52:21.937635526 -0800
> +--- gcc-4_6-branch.orig/gcc/configure.ac	2012-03-04 09:33:36.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure.ac	2012-03-04 09:41:06.862671939 -0800
>   @@ -144,6 +144,15 @@
>      fi
>    fi
> @@ -96,7 +96,7 @@ Index: gcc-4_6-branch/gcc/configure.ac
>    AC_ARG_WITH(cpp_install_dir,
>    [  --with-cpp-install-dir=DIR
>                              install the user visible C preprocessor in DIR
> -@@ -4737,6 +4746,7 @@
> +@@ -4727,6 +4736,7 @@
>    AC_SUBST(float_h_file)
>    AC_SUBST(gcc_config_arguments)
>    AC_SUBST(gcc_gxx_include_dir)
> @@ -106,8 +106,8 @@ Index: gcc-4_6-branch/gcc/configure.ac
>    AC_SUBST(host_xm_include_list)
>   Index: gcc-4_6-branch/gcc/cppdefault.c
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/cppdefault.c	2011-12-13 22:51:28.000000000 -0800
> -+++ gcc-4_6-branch/gcc/cppdefault.c	2011-12-13 22:52:21.937635526 -0800
> +--- gcc-4_6-branch.orig/gcc/cppdefault.c	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/cppdefault.c	2012-03-04 09:41:06.862671939 -0800
>   @@ -48,15 +48,18 @@
>    = {
>    #ifdef GPLUSPLUS_INCLUDE_DIR
> @@ -132,8 +132,8 @@ Index: gcc-4_6-branch/gcc/cppdefault.c
>        /* This is the dir for gcc's private headers.  */
>   Index: gcc-4_6-branch/gcc/configure
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/configure	2011-12-13 22:52:15.000000000 -0800
> -+++ gcc-4_6-branch/gcc/configure	2011-12-13 22:52:33.185690436 -0800
> +--- gcc-4_6-branch.orig/gcc/configure	2012-03-04 09:33:36.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure	2012-03-04 09:41:12.462671816 -0800
>   @@ -636,6 +636,7 @@
>    host_xm_include_list
>    host_xm_file_list
> @@ -158,25 +158,25 @@ Index: gcc-4_6-branch/gcc/configure
>
>    # Check whether --with-cpp_install_dir was given.
>    if test "${with_cpp_install_dir+set}" = set; then :
> -@@ -17514,7 +17524,7 @@
> +@@ -17504,7 +17514,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17517 "configure"
> -+#line 17527 "configure"
> +-#line 17507 "configure"
> ++#line 17517 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -17620,7 +17630,7 @@
> +@@ -17610,7 +17620,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17623 "configure"
> -+#line 17633 "configure"
> +-#line 17613 "configure"
> ++#line 17623 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -26151,6 +26161,7 @@
> +@@ -26141,6 +26151,7 @@
>
>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch
> index 9cba50d..5eaeb05 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-flags-for-build.patch
> @@ -1,10 +1,10 @@
>   Upstream-Status: Pending
>
> -Index: gcc-4.6.0/Makefile.def
> +Index: gcc-4_6-branch/Makefile.def
>   ===================================================================
> ---- gcc-4.6.0.orig/Makefile.def
> -+++ gcc-4.6.0/Makefile.def
> -@@ -243,6 +243,7 @@ flags_to_pass = { flag= AWK ; };
> +--- gcc-4_6-branch.orig/Makefile.def	2012-03-03 01:08:03.000000000 -0800
> ++++ gcc-4_6-branch/Makefile.def	2012-03-04 09:19:02.430607447 -0800
> +@@ -242,6 +242,7 @@
>    flags_to_pass = { flag= BISON ; };
>    flags_to_pass = { flag= CC_FOR_BUILD ; };
>    flags_to_pass = { flag= CFLAGS_FOR_BUILD ; };
> @@ -12,11 +12,11 @@ Index: gcc-4.6.0/Makefile.def
>    flags_to_pass = { flag= CXX_FOR_BUILD ; };
>    flags_to_pass = { flag= EXPECT ; };
>    flags_to_pass = { flag= FLEX ; };
> -Index: gcc-4.6.0/gcc/Makefile.in
> +Index: gcc-4_6-branch/gcc/Makefile.in
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/Makefile.in
> -+++ gcc-4.6.0/gcc/Makefile.in
> -@@ -770,7 +770,7 @@ BUILD_LINKERFLAGS = $(BUILD_CFLAGS)
> +--- gcc-4_6-branch.orig/gcc/Makefile.in	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/Makefile.in	2012-03-04 09:19:02.430607447 -0800
> +@@ -770,7 +770,7 @@
>
>    # Native linker and preprocessor flags.  For x-fragment overrides.
>    BUILD_LDFLAGS=@BUILD_LDFLAGS@
> @@ -25,11 +25,11 @@ Index: gcc-4.6.0/gcc/Makefile.in
>
>    # Actual name to use when installing a native compiler.
>    GCC_INSTALL_NAME := $(shell echo gcc|sed '$(program_transform_name)')
> -Index: gcc-4.6.0/gcc/configure.ac
> +Index: gcc-4_6-branch/gcc/configure.ac
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/configure.ac
> -+++ gcc-4.6.0/gcc/configure.ac
> -@@ -1784,16 +1784,18 @@ AC_SUBST(inhibit_libc)
> +--- gcc-4_6-branch.orig/gcc/configure.ac	2012-03-03 01:17:45.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure.ac	2012-03-04 09:19:02.430607447 -0800
> +@@ -1774,16 +1774,18 @@
>    # Also, we cannot run fixincludes.
>
>    # These are the normal (build=host) settings:
> @@ -52,11 +52,11 @@ Index: gcc-4.6.0/gcc/configure.ac
>    fi
>
>    # Expand extra_headers to include complete path.
> -Index: gcc-4.6.0/Makefile.in
> +Index: gcc-4_6-branch/Makefile.in
>   ===================================================================
> ---- gcc-4.6.0.orig/Makefile.in
> -+++ gcc-4.6.0/Makefile.in
> -@@ -338,6 +338,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> +--- gcc-4_6-branch.orig/Makefile.in	2012-03-03 01:08:03.000000000 -0800
> ++++ gcc-4_6-branch/Makefile.in	2012-03-04 09:19:02.446607448 -0800
> +@@ -338,6 +338,7 @@
>    AS_FOR_BUILD = @AS_FOR_BUILD@
>    CC_FOR_BUILD = @CC_FOR_BUILD@
>    CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
> @@ -64,7 +64,7 @@ Index: gcc-4.6.0/Makefile.in
>    CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
>    CXX_FOR_BUILD = @CXX_FOR_BUILD@
>    DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
> -@@ -691,6 +692,7 @@ BASE_FLAGS_TO_PASS = \
> +@@ -691,6 +692,7 @@
>    	"BISON=$(BISON)" \
>    	"CC_FOR_BUILD=$(CC_FOR_BUILD)" \
>    	"CFLAGS_FOR_BUILD=$(CFLAGS_FOR_BUILD)" \
> @@ -72,11 +72,11 @@ Index: gcc-4.6.0/Makefile.in
>    	"CXX_FOR_BUILD=$(CXX_FOR_BUILD)" \
>    	"EXPECT=$(EXPECT)" \
>    	"FLEX=$(FLEX)" \
> -Index: gcc-4.6.0/gcc/configure
> +Index: gcc-4_6-branch/gcc/configure
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/configure
> -+++ gcc-4.6.0/gcc/configure
> -@@ -703,6 +703,7 @@ SED
> +--- gcc-4_6-branch.orig/gcc/configure	2012-03-03 01:17:45.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure	2012-03-04 09:19:15.638608087 -0800
> +@@ -703,6 +703,7 @@
>    LIBTOOL
>    collect2
>    STMP_FIXINC
> @@ -84,7 +84,16 @@ Index: gcc-4.6.0/gcc/configure
>    BUILD_LDFLAGS
>    BUILD_CFLAGS
>    CC_FOR_BUILD
> -@@ -11382,6 +11383,7 @@ fi
> +@@ -4842,7 +4843,7 @@
> + { $as_echo "$as_me:${as_lineno-$LINENO}: result: $acx_cv_cc_gcc_supports_ada">&5
> + $as_echo "$acx_cv_cc_gcc_supports_ada">&6; }
> +
> +-if test x$GNATBIND != xno&&  test x$GNATMAKE != xno&&  test x$acx_cv_cc_gcc_supports_ada != xno; then
> ++if test "x$GNATBIND" != xno&&  test "x$GNATMAKE" != xno&&  test x$acx_cv_cc_gcc_supports_ada != xno; then
> +   have_gnat=yes
> + else
> +   have_gnat=no
> +@@ -11372,6 +11373,7 @@
>    CC_FOR_BUILD='$(CC)'
>    BUILD_CFLAGS='$(ALL_CFLAGS)'
>    BUILD_LDFLAGS='$(LDFLAGS)'
> @@ -92,7 +101,7 @@ Index: gcc-4.6.0/gcc/configure
>    STMP_FIXINC=stmp-fixinc
>
>    # And these apply if build != host, or we are generating coverage data
> -@@ -11389,6 +11391,7 @@ if test x$build != x$host || test "x$cov
> +@@ -11379,6 +11381,7 @@
>    then
>        BUILD_CFLAGS='$(INTERNAL_CFLAGS) $(T_CFLAGS) $(CFLAGS_FOR_BUILD)'
>        BUILD_LDFLAGS='$(LDFLAGS_FOR_BUILD)'
> @@ -100,29 +109,29 @@ Index: gcc-4.6.0/gcc/configure
>    fi
>
>    # Expand extra_headers to include complete path.
> -@@ -17505,7 +17508,7 @@ else
> +@@ -17495,7 +17498,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17508 "configure"
> -+#line 17511 "configure"
> +-#line 17498 "configure"
> ++#line 17501 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -17611,7 +17614,7 @@ else
> +@@ -17601,7 +17604,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17614 "configure"
> -+#line 17617 "configure"
> +-#line 17604 "configure"
> ++#line 17607 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -Index: gcc-4.6.0/Makefile.tpl
> +Index: gcc-4_6-branch/Makefile.tpl
>   ===================================================================
> ---- gcc-4.6.0.orig/Makefile.tpl
> -+++ gcc-4.6.0/Makefile.tpl
> -@@ -341,6 +341,7 @@ AR_FOR_BUILD = @AR_FOR_BUILD@
> +--- gcc-4_6-branch.orig/Makefile.tpl	2012-03-03 01:08:03.000000000 -0800
> ++++ gcc-4_6-branch/Makefile.tpl	2012-03-04 09:19:02.454607448 -0800
> +@@ -341,6 +341,7 @@
>    AS_FOR_BUILD = @AS_FOR_BUILD@
>    CC_FOR_BUILD = @CC_FOR_BUILD@
>    CFLAGS_FOR_BUILD = @CFLAGS_FOR_BUILD@
> @@ -130,11 +139,11 @@ Index: gcc-4.6.0/Makefile.tpl
>    CXXFLAGS_FOR_BUILD = @CXXFLAGS_FOR_BUILD@
>    CXX_FOR_BUILD = @CXX_FOR_BUILD@
>    DLLTOOL_FOR_BUILD = @DLLTOOL_FOR_BUILD@
> -Index: gcc-4.6.0/configure.ac
> +Index: gcc-4_6-branch/configure.ac
>   ===================================================================
> ---- gcc-4.6.0.orig/configure.ac
> -+++ gcc-4.6.0/configure.ac
> -@@ -3154,6 +3154,7 @@ esac
> +--- gcc-4_6-branch.orig/configure.ac	2012-03-03 01:17:45.000000000 -0800
> ++++ gcc-4_6-branch/configure.ac	2012-03-04 09:19:02.454607448 -0800
> +@@ -3123,6 +3123,7 @@
>    # our build compiler if desired.
>    if test x"${build}" = x"${host}" ; then
>      CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
> @@ -142,7 +151,7 @@ Index: gcc-4.6.0/configure.ac
>      CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
>      LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
>    fi
> -@@ -3220,6 +3221,7 @@ AC_SUBST(AR_FOR_BUILD)
> +@@ -3189,6 +3190,7 @@
>    AC_SUBST(AS_FOR_BUILD)
>    AC_SUBST(CC_FOR_BUILD)
>    AC_SUBST(CFLAGS_FOR_BUILD)
> @@ -150,11 +159,11 @@ Index: gcc-4.6.0/configure.ac
>    AC_SUBST(CXXFLAGS_FOR_BUILD)
>    AC_SUBST(CXX_FOR_BUILD)
>    AC_SUBST(DLLTOOL_FOR_BUILD)
> -Index: gcc-4.6.0/configure
> +Index: gcc-4_6-branch/configure
>   ===================================================================
> ---- gcc-4.6.0.orig/configure
> -+++ gcc-4.6.0/configure
> -@@ -617,6 +617,7 @@ GCJ_FOR_BUILD
> +--- gcc-4_6-branch.orig/configure	2012-03-03 01:17:45.000000000 -0800
> ++++ gcc-4_6-branch/configure	2012-03-04 09:19:02.458607448 -0800
> +@@ -617,6 +617,7 @@
>    DLLTOOL_FOR_BUILD
>    CXX_FOR_BUILD
>    CXXFLAGS_FOR_BUILD
> @@ -162,7 +171,7 @@ Index: gcc-4.6.0/configure
>    CFLAGS_FOR_BUILD
>    CC_FOR_BUILD
>    AS_FOR_BUILD
> -@@ -7675,6 +7676,7 @@ esac
> +@@ -7644,6 +7645,7 @@
>    # our build compiler if desired.
>    if test x"${build}" = x"${host}" ; then
>      CFLAGS_FOR_BUILD=${CFLAGS_FOR_BUILD-${CFLAGS}}
> @@ -170,7 +179,7 @@ Index: gcc-4.6.0/configure
>      CXXFLAGS_FOR_BUILD=${CXXFLAGS_FOR_BUILD-${CXXFLAGS}}
>      LDFLAGS_FOR_BUILD=${LDFLAGS_FOR_BUILD-${LDFLAGS}}
>    fi
> -@@ -7740,6 +7742,7 @@ done
> +@@ -7709,6 +7711,7 @@
>
>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch
> index 3902a35..a44e86c 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-poison-system-directories.patch
> @@ -27,11 +27,11 @@ Upstream-Status: Inappropriate [distribution: codesourcery]
>          ENABLE_POISON_SYSTEM_DIRECTORIES defined, warn for use of
>          /usr/include, /usr/local/include or /usr/X11R6/include.
>
> -Index: gcc-4.6.0/gcc/common.opt
> +Index: gcc-4_6-branch/gcc/common.opt
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/common.opt
> -+++ gcc-4.6.0/gcc/common.opt
> -@@ -558,6 +558,10 @@ Wpadded
> +--- gcc-4_6-branch.orig/gcc/common.opt	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/common.opt	2012-03-04 09:24:54.410624483 -0800
> +@@ -567,6 +567,10 @@
>    Common Var(warn_padded) Warning
>    Warn when padding is required to align structure members
>
> @@ -42,10 +42,10 @@ Index: gcc-4.6.0/gcc/common.opt
>    Wshadow
>    Common Var(warn_shadow) Warning
>    Warn when one local variable shadows another
> -Index: gcc-4.6.0/gcc/config.in
> +Index: gcc-4_6-branch/gcc/config.in
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/config.in
> -+++ gcc-4.6.0/gcc/config.in
> +--- gcc-4_6-branch.orig/gcc/config.in	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/config.in	2012-03-04 09:24:54.410624483 -0800
>   @@ -144,6 +144,12 @@
>    #endif
>
> @@ -59,11 +59,11 @@ Index: gcc-4.6.0/gcc/config.in
>    /* Define if you want all operations on RTL (the basic data structure of the
>       optimizer and back end) to be checked for dynamic type safety at runtime.
>       This is quite expensive. */
> -Index: gcc-4.6.0/gcc/configure.ac
> +Index: gcc-4_6-branch/gcc/configure.ac
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/configure.ac
> -+++ gcc-4.6.0/gcc/configure.ac
> -@@ -4694,6 +4694,16 @@ else
> +--- gcc-4_6-branch.orig/gcc/configure.ac	2012-03-04 09:22:07.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure.ac	2012-03-04 09:24:54.410624483 -0800
> +@@ -4692,6 +4692,16 @@
>    fi)
>    AC_SUBST(slibdir)
>
> @@ -80,11 +80,11 @@ Index: gcc-4.6.0/gcc/configure.ac
>    # Substitute configuration variables
>    AC_SUBST(subdirs)
>    AC_SUBST(srcdir)
> -Index: gcc-4.6.0/gcc/doc/invoke.texi
> +Index: gcc-4_6-branch/gcc/doc/invoke.texi
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/doc/invoke.texi
> -+++ gcc-4.6.0/gcc/doc/invoke.texi
> -@@ -257,6 +257,7 @@ Objective-C and Objective-C++ Dialects}.
> +--- gcc-4_6-branch.orig/gcc/doc/invoke.texi	2012-03-03 00:46:39.000000000 -0800
> ++++ gcc-4_6-branch/gcc/doc/invoke.texi	2012-03-04 09:24:54.414624482 -0800
> +@@ -257,6 +257,7 @@
>    -Woverlength-strings  -Wpacked  -Wpacked-bitfield-compat  -Wpadded @gol
>    -Wparentheses  -Wpedantic-ms-format -Wno-pedantic-ms-format @gol
>    -Wpointer-arith  -Wno-pointer-to-int-cast @gol
> @@ -92,7 +92,7 @@ Index: gcc-4.6.0/gcc/doc/invoke.texi
>    -Wredundant-decls @gol
>    -Wreturn-type  -Wsequence-point  -Wshadow @gol
>    -Wsign-compare  -Wsign-conversion  -Wstack-protector @gol
> -@@ -3773,6 +3774,14 @@ headers---for that, @option{-Wunknown-pr
> +@@ -3782,6 +3783,14 @@
>     for most targets, it is made up of code and thus requires the stack
>     to be made executable in order for the program to work properly.
>
> @@ -107,11 +107,11 @@ Index: gcc-4.6.0/gcc/doc/invoke.texi
>    @item -Wfloat-equal
>    @opindex Wfloat-equal
>    @opindex Wno-float-equal
> -Index: gcc-4.6.0/gcc/gcc.c
> +Index: gcc-4_6-branch/gcc/gcc.c
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/gcc.c
> -+++ gcc-4.6.0/gcc/gcc.c
> -@@ -659,6 +659,8 @@ proper position among the other output f
> +--- gcc-4_6-branch.orig/gcc/gcc.c	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/gcc.c	2012-03-04 09:24:54.418624482 -0800
> +@@ -659,6 +659,8 @@
>        %{flto} %{flto=*} %l " LINK_PIE_SPEC \
>       "%X %{o*} %{e*} %{N} %{n} %{r}\
>        %{s} %{t} %{u*} %{z} %{Z} %{!nostdlib:%{!nostartfiles:%S}}\
> @@ -120,11 +120,11 @@ Index: gcc-4.6.0/gcc/gcc.c
>        %{static:} %{L*} %(mfwrap) %(link_libgcc) %o\
>        %{fopenmp|ftree-parallelize-loops=*:%:include(libgomp.spec)%(link_gomp)}\
>        %(mflib) " STACK_SPLIT_SPEC "\
> -Index: gcc-4.6.0/gcc/incpath.c
> +Index: gcc-4_6-branch/gcc/incpath.c
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/incpath.c
> -+++ gcc-4.6.0/gcc/incpath.c
> -@@ -353,6 +353,24 @@ merge_include_chains (const char *sysroo
> +--- gcc-4_6-branch.orig/gcc/incpath.c	2012-03-03 01:03:17.000000000 -0800
> ++++ gcc-4_6-branch/gcc/incpath.c	2012-03-04 09:24:54.418624482 -0800
> +@@ -353,6 +353,24 @@
>    	}
>          fprintf (stderr, _("End of search list.\n"));
>        }
> @@ -149,11 +149,11 @@ Index: gcc-4.6.0/gcc/incpath.c
>    }
>
>    /* Use given -I paths for #include "..." but not #include<...>, and
> -Index: gcc-4.6.0/gcc/Makefile.in
> +Index: gcc-4_6-branch/gcc/Makefile.in
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/Makefile.in
> -+++ gcc-4.6.0/gcc/Makefile.in
> -@@ -2179,7 +2179,7 @@ attribs.o : attribs.c $(CONFIG_H) $(SYST
> +--- gcc-4_6-branch.orig/gcc/Makefile.in	2012-03-04 09:22:05.000000000 -0800
> ++++ gcc-4_6-branch/gcc/Makefile.in	2012-03-04 09:24:54.418624482 -0800
> +@@ -2179,7 +2179,7 @@
>
>    incpath.o: incpath.c incpath.h $(CONFIG_H) $(SYSTEM_H) $(CPPLIB_H) \
>    		intl.h prefix.h coretypes.h $(TM_H) cppdefault.h $(TARGET_H) \
> @@ -162,11 +162,11 @@ Index: gcc-4.6.0/gcc/Makefile.in
>
>    prefix.o: prefix.c $(CONFIG_H) $(SYSTEM_H) coretypes.h $(TM_H) prefix.h \
>    	Makefile $(BASEVER)
> -Index: gcc-4.6.0/gcc/configure
> +Index: gcc-4_6-branch/gcc/configure
>   ===================================================================
> ---- gcc-4.6.0.orig/gcc/configure
> -+++ gcc-4.6.0/gcc/configure
> -@@ -912,6 +912,7 @@ with_system_zlib
> +--- gcc-4_6-branch.orig/gcc/configure	2012-03-04 09:22:07.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure	2012-03-04 09:25:31.502626277 -0800
> +@@ -912,6 +912,7 @@
>    enable_maintainer_mode
>    enable_version_specific_runtime_libs
>    with_slibdir
> @@ -174,7 +174,7 @@ Index: gcc-4.6.0/gcc/configure
>    enable_plugin
>    enable_libquadmath_support
>    '
> -@@ -1623,6 +1624,8 @@ Optional Features:
> +@@ -1623,6 +1624,8 @@
>      --enable-version-specific-runtime-libs
>                              specify that runtime libraries should be
>                              installed in a compiler-specific directory
> @@ -183,25 +183,25 @@ Index: gcc-4.6.0/gcc/configure
>      --enable-plugin         enable plugin support
>      --disable-libquadmath-support
>                              disable libquadmath support for Fortran
> -@@ -17508,7 +17511,7 @@ else
> +@@ -17498,7 +17501,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17511 "configure"
> -+#line 17514 "configure"
> +-#line 17501 "configure"
> ++#line 17504 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -17614,7 +17617,7 @@ else
> +@@ -17604,7 +17607,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17617 "configure"
> -+#line 17620 "configure"
> +-#line 17607 "configure"
> ++#line 17610 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -26127,6 +26130,19 @@ fi
> +@@ -26125,6 +26128,19 @@
>
>
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
> index 4fa3cbe..94b61cd 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
> +++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch
> @@ -21,8 +21,8 @@ Date:   Wed May 11 18:28:14 2011 +0000
>
>   Index: gcc-4_6-branch/gcc/config.in
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/config.in	2011-09-09 08:26:10.000000000 -0700
> -+++ gcc-4_6-branch/gcc/config.in	2011-09-09 08:27:14.142981164 -0700
> +--- gcc-4_6-branch.orig/gcc/config.in	2012-03-04 09:30:04.000000000 -0800
> ++++ gcc-4_6-branch/gcc/config.in	2012-03-04 09:32:30.878646575 -0800
>   @@ -1583,6 +1583,12 @@
>    #endif
>
> @@ -38,8 +38,8 @@ Index: gcc-4_6-branch/gcc/config.in
>    #ifndef USED_FOR_TARGET
>   Index: gcc-4_6-branch/gcc/configure
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/configure	2011-09-09 08:26:15.000000000 -0700
> -+++ gcc-4_6-branch/gcc/configure	2011-09-09 08:27:42.793023181 -0700
> +--- gcc-4_6-branch.orig/gcc/configure	2012-03-04 09:30:05.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure	2012-03-04 09:32:39.918647011 -0800
>   @@ -915,6 +915,7 @@
>    enable_poison_system_directories
>    enable_plugin
> @@ -57,25 +57,25 @@ Index: gcc-4_6-branch/gcc/configure
>
>    Some influential environment variables:
>      CC          C compiler command
> -@@ -17511,7 +17514,7 @@
> +@@ -17501,7 +17504,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17514 "configure"
> -+#line 17517 "configure"
> +-#line 17504 "configure"
> ++#line 17507 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -17617,7 +17620,7 @@
> +@@ -17607,7 +17610,7 @@
>      lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
>      lt_status=$lt_dlunknown
>      cat>  conftest.$ac_ext<<_LT_EOF
> --#line 17620 "configure"
> -+#line 17623 "configure"
> +-#line 17610 "configure"
> ++#line 17613 "configure"
>    #include "confdefs.h"
>
>    #if HAVE_DLFCN_H
> -@@ -26434,6 +26437,36 @@
> +@@ -26432,6 +26435,36 @@
>    fi
>
>
> @@ -114,9 +114,9 @@ Index: gcc-4_6-branch/gcc/configure
>
>   Index: gcc-4_6-branch/gcc/configure.ac
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/configure.ac	2011-09-09 08:26:15.000000000 -0700
> -+++ gcc-4_6-branch/gcc/configure.ac	2011-09-09 08:27:14.162981193 -0700
> -@@ -4907,6 +4907,30 @@
> +--- gcc-4_6-branch.orig/gcc/configure.ac	2012-03-04 09:30:05.000000000 -0800
> ++++ gcc-4_6-branch/gcc/configure.ac	2012-03-04 09:32:30.890646574 -0800
> +@@ -4905,6 +4905,30 @@
>    fi
>
>
> @@ -149,8 +149,8 @@ Index: gcc-4_6-branch/gcc/configure.ac
>
>   Index: gcc-4_6-branch/gcc/doc/install.texi
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/doc/install.texi	2011-06-24 08:13:00.000000000 -0700
> -+++ gcc-4_6-branch/gcc/doc/install.texi	2011-09-09 08:27:14.172981215 -0700
> +--- gcc-4_6-branch.orig/gcc/doc/install.texi	2012-03-03 00:46:39.000000000 -0800
> ++++ gcc-4_6-branch/gcc/doc/install.texi	2012-03-04 09:32:30.894646574 -0800
>   @@ -1665,6 +1665,11 @@
>    support @option{--build-id} option, a warning is issued and the
>    @option{--enable-linker-build-id} option is ignored.  The default is off.
> @@ -165,8 +165,8 @@ Index: gcc-4_6-branch/gcc/doc/install.texi
>    Tells GCC to use the gnu_unique_object relocation for C++ template
>   Index: gcc-4_6-branch/gcc/gcc.c
>   ===================================================================
> ---- gcc-4_6-branch.orig/gcc/gcc.c	2011-09-09 08:26:14.000000000 -0700
> -+++ gcc-4_6-branch/gcc/gcc.c	2011-09-09 08:27:14.172981215 -0700
> +--- gcc-4_6-branch.orig/gcc/gcc.c	2012-03-04 09:30:04.000000000 -0800
> ++++ gcc-4_6-branch/gcc/gcc.c	2012-03-04 09:32:30.894646574 -0800
>   @@ -1427,7 +1427,8 @@
>      }
>    #endif
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch b/meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch
> deleted file mode 100644
> index 9c86817..0000000
> --- a/meta/recipes-devtools/gcc/gcc-4.6/volatile_access_backport.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Pulled from http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Saul Wold<sgw@linux.intel.com>
> -
> -    gcc/
> -    * expr.c (expand_expr_real_1): Only use BLKmode for volatile
> -    accesses which are not naturally aligned.
> -
> -Index: gcc-4.6.0/gcc/expr.c
> -===================================================================
> ---- gcc-4.6.0.orig/gcc/expr.c	2011-06-01 15:28:55.000000000 -0700
> -+++ gcc-4.6.0/gcc/expr.c	2011-06-01 15:41:17.154848182 -0700
> -@@ -9178,8 +9178,11 @@
> - 		&&  modifier != EXPAND_CONST_ADDRESS
> - 		&&  modifier != EXPAND_INITIALIZER)
> - 	    /* If the field is volatile, we always want an aligned
> --	       access.  */
> --	    || (volatilep&&  flag_strict_volatile_bitfields>  0)
> -+	       access.  Only do this if the access is not already naturally
> -+	       aligned, otherwise "normal" (non-bitfield) volatile fields
> -+	       become non-addressable.  */
> -+	    || (volatilep&&  flag_strict_volatile_bitfields>  0
> -+		&&  (bitpos % GET_MODE_ALIGNMENT (mode) != 0))
> - 	    /* If the field isn't aligned enough to fetch as a memref,
> - 	       fetch it as a bit field.  */
> - 	    || (mode1 != BLKmode


