Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RVBn7-0002iP-F4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 01:43:25 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Nov 2011 16:36:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,587,1315206000"; d="scan'208";a="41918010"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Nov 2011 16:36:37 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Nov 2011 16:36:32 -0800
Message-Id: <6b7fb8503d66ee4d4c3d43f3c368b8aa2d010add.1322526931.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322526931.git.nitin.a.kamble@intel.com>
References: <cover.1322526931.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/4] binutils: upgrade from 2.21.1a to 2.22
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
X-List-Received-Date: Tue, 29 Nov 2011 00:43:25 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And rebase the patches to the newer source code

This patch is upstream hence deleting it from the recipe.
	binutils/110-arm-eabi-conf.patch

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ..._2.21.1a.bb => binutils-cross-canadian_2.22.bb} |    2 +-
 ...ils-cross_2.21.1a.bb => binutils-cross_2.22.bb} |    0
 ...osssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} |    2 +-
 .../binutils/binutils/110-arm-eabi-conf.patch      |   24 -
 .../binutils/binutils-2.19.1-ld-sysroot.patch      |   10 +-
 .../binutils/binutils/binutils-poison.patch        |   84 ++-
 .../binutils/binutils/binutils-powerpc-e5500.patch |   52 +-
 .../binutils/binutils-uclibc-100-uclibc-conf.patch |   40 +-
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   16 +-
 ...binutils-uclibc-300-006_better_file_error.patch |    9 +-
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   12 +-
 .../binutils/binutils-uclibc-gas-needs-libm.patch  |   11 +-
 .../binutils/binutils-x86_64_i386_biarch.patch     |   10 +-
 .../binutils/binutils/clone-shadow.patch           |   18 +-
 .../binutils/binutils/libiberty_path_fix.patch     |    8 +-
 .../binutils/binutils/libtool-2.4-update.patch     |  803 ++++++++++----------
 .../binutils/binutils/libtool-rpath-fix.patch      |   11 +-
 .../{binutils_2.21.1a.bb => binutils_2.22.bb}      |    7 +-
 19 files changed, 543 insertions(+), 578 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.21.1a.bb => binutils-cross-canadian_2.22.bb} (86%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.21.1a.bb => binutils-cross_2.22.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.21.1a.bb => binutils-crosssdk_2.22.bb} (96%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
 rename meta/recipes-devtools/binutils/{binutils_2.21.1a.bb => binutils_2.22.bb} (84%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ed722be..c22e7dc 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "4.6%"
 SDKGCCVERSION ?= "4.6%"
-BINUVERSION ?= "2.21.1a"
+BINUVERSION ?= "2.22"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
 LINUXLIBCVERSION ?= "3.1"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
similarity index 86%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
index a49aded..7dad2a6 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.21.1a.bb
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.22.bb
@@ -1,3 +1,3 @@
 require binutils_${PV}.bb
 require binutils-cross-canadian.inc
-PR = "r2"
+PR = "r0"
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.21.1a.bb b/meta/recipes-devtools/binutils/binutils-cross_2.22.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.21.1a.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.22.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1a.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
similarity index 96%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1a.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
index 21289cd..0d6efff 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.21.1a.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.22.bb
@@ -4,7 +4,7 @@ inherit crosssdk
 
 PROVIDES = "virtual/${TARGET_PREFIX}binutils-crosssdk"
 
-PR = "r1"
+PR = "r0"
 
 do_configure_prepend () {
 	sed -i 's#/usr/local/lib /lib /usr/lib#${SDKPATHNATIVE}/lib ${SDKPATHNATIVE}/usr/lib /usr/local/lib /lib /usr/lib#' ${S}/ld/configure.tgt
diff --git a/meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch b/meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
deleted file mode 100644
index dc49613..0000000
--- a/meta/recipes-devtools/binutils/binutils/110-arm-eabi-conf.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
---- /tmp/configure.ac	2008-06-22 14:14:59.000000000 +0200
-+++ binutils-2.18.50.0.7/configure.ac	2008-06-22 14:15:30.000000000 +0200
-@@ -561,7 +561,7 @@
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
---- /tmp/configure	2008-06-22 14:17:11.000000000 +0200
-+++ binutils-2.18.50.0.7/configure	2008-06-22 14:17:56.000000000 +0200
-@@ -2307,7 +2307,7 @@
-     noconfigdirs="$noconfigdirs target-libffi target-qthreads"
-     libgloss_dir=arm
-     ;;
--  arm*-*-linux-gnueabi)
-+  arm*-*-linux-gnueabi | arm*-*-linux-uclibceabi)
-     noconfigdirs="$noconfigdirs target-qthreads"
-     noconfigdirs="$noconfigdirs target-libobjc"
-     case ${with_newlib} in
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch b/meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
index 1a640ea..5e6be3a 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-2.19.1-ld-sysroot.patch
@@ -6,13 +6,13 @@ Signed-off-by: Sven Rebhan <odinshorse@googlemail.com>
 
 Always try to prepend the sysroot prefix to absolute filenames first.
 
-Index: binutils-2.21/ld/ldfile.c
+Index: binutils-2.22/ld/ldfile.c
 ===================================================================
---- binutils-2.21.orig/ld/ldfile.c
-+++ binutils-2.21/ld/ldfile.c
-@@ -372,18 +372,24 @@ ldfile_open_file_search (const char *arc
+--- binutils-2.22.orig/ld/ldfile.c
++++ binutils-2.22/ld/ldfile.c
+@@ -351,18 +351,24 @@ ldfile_open_file_search (const char *arc
       directory first.  */
-   if (! entry->is_archive)
+   if (! entry->maybe_archive)
      {
 -      if (entry->sysrooted && IS_ABSOLUTE_PATH (entry->filename))
 +      /* For absolute pathnames, try to always open the file in the
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
index 759aa88..7f81838 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-poison.patch
@@ -52,9 +52,10 @@ Code Merged from Sourcery G++ binutils 2.19 - 4.4-277
 Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -urN binutils-2.21.orig//ld/config.in binutils-2.21/ld/config.in
---- binutils-2.21.orig//ld/config.in	2010-11-05 03:34:27.000000000 -0700
-+++ binutils-2.21/ld/config.in	2011-01-19 10:48:15.147301022 -0800
+Index: binutils-2.22/ld/config.in
+===================================================================
+--- binutils-2.22.orig/ld/config.in
++++ binutils-2.22/ld/config.in
 @@ -4,6 +4,9 @@
     language is requested. */
  #undef ENABLE_NLS
@@ -65,10 +66,11 @@ diff -urN binutils-2.21.orig//ld/config.in binutils-2.21/ld/config.in
  /* Additional extension a shared object might have. */
  #undef EXTRA_SHLIB_EXTENSION
  
-diff -urN binutils-2.21.orig//ld/configure binutils-2.21/ld/configure
---- binutils-2.21.orig//ld/configure	2011-01-19 10:46:46.997571921 -0800
-+++ binutils-2.21/ld/configure	2011-01-19 11:03:50.577832729 -0800
-@@ -768,6 +768,7 @@
+Index: binutils-2.22/ld/configure
+===================================================================
+--- binutils-2.22.orig/ld/configure
++++ binutils-2.22/ld/configure
+@@ -776,6 +776,7 @@ with_lib_path
  enable_targets
  enable_64_bit_bfd
  with_sysroot
@@ -76,7 +78,7 @@ diff -urN binutils-2.21.orig//ld/configure binutils-2.21/ld/configure
  enable_gold
  enable_got
  enable_werror
-@@ -1418,6 +1419,8 @@
+@@ -1431,6 +1432,8 @@ Optional Features:
  			  (and sometimes confusing) to the casual installer
    --enable-targets        alternative target configurations
    --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
@@ -85,7 +87,7 @@ diff -urN binutils-2.21.orig//ld/configure binutils-2.21/ld/configure
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -4203,7 +4206,18 @@
+@@ -4342,7 +4345,18 @@ else
  fi
  
  
@@ -104,10 +106,11 @@ diff -urN binutils-2.21.orig//ld/configure binutils-2.21/ld/configure
  
  # Check whether --enable-got was given.
  if test "${enable_got+set}" = set; then :
-diff -urN binutils-2.21.orig//ld/configure.in binutils-2.21/ld/configure.in
---- binutils-2.21.orig//ld/configure.in	2010-11-23 05:50:32.000000000 -0800
-+++ binutils-2.21/ld/configure.in	2011-01-19 10:50:57.378398946 -0800
-@@ -69,6 +69,16 @@
+Index: binutils-2.22/ld/configure.in
+===================================================================
+--- binutils-2.22.orig/ld/configure.in
++++ binutils-2.22/ld/configure.in
+@@ -70,6 +70,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -124,10 +127,11 @@ diff -urN binutils-2.21.orig//ld/configure.in binutils-2.21/ld/configure.in
  dnl Use --enable-gold to decide if this linker should be the default.
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
-diff -urN binutils-2.21.orig//ld/ldfile.c binutils-2.21/ld/ldfile.c
---- binutils-2.21.orig//ld/ldfile.c	2011-01-19 10:46:47.157553281 -0800
-+++ binutils-2.21/ld/ldfile.c	2011-01-19 10:58:30.035468447 -0800
-@@ -124,6 +124,23 @@
+Index: binutils-2.22/ld/ldfile.c
+===================================================================
+--- binutils-2.22.orig/ld/ldfile.c
++++ binutils-2.22/ld/ldfile.c
+@@ -125,6 +125,23 @@ ldfile_add_library_path (const char *nam
      {
        new_dirs->name = xstrdup (name);
        new_dirs->sysrooted = is_sysrooted_pathname (name, FALSE);
@@ -151,12 +155,13 @@ diff -urN binutils-2.21.orig//ld/ldfile.c binutils-2.21/ld/ldfile.c
      }
  }
  
-diff -urN binutils-2.21.orig//ld/ld.h binutils-2.21/ld/ld.h
---- binutils-2.21.orig//ld/ld.h	2009-11-26 05:45:25.000000000 -0800
-+++ binutils-2.21/ld/ld.h	2011-01-19 10:52:54.814716478 -0800
-@@ -198,6 +198,14 @@
-      input files.  */
-   bfd_boolean accept_unknown_input_arch;
+Index: binutils-2.22/ld/ld.h
+===================================================================
+--- binutils-2.22.orig/ld/ld.h
++++ binutils-2.22/ld/ld.h
+@@ -203,6 +203,14 @@ typedef struct {
+   /* If TRUE we'll just print the default output on stdout.  */
+   bfd_boolean print_output_format;
  
 +  /* If TRUE (the default) warn for uses of system directories when
 +     cross linking.  */
@@ -169,10 +174,11 @@ diff -urN binutils-2.21.orig//ld/ld.h binutils-2.21/ld/ld.h
    /* Big or little endian as set on command line.  */
    enum endian_enum endian;
  
-diff -urN binutils-2.21.orig//ld/ldmain.c binutils-2.21/ld/ldmain.c
---- binutils-2.21.orig//ld/ldmain.c	2010-11-05 00:20:07.000000000 -0700
-+++ binutils-2.21/ld/ldmain.c	2011-01-19 10:59:18.579767697 -0800
-@@ -259,6 +259,8 @@
+Index: binutils-2.22/ld/ldmain.c
+===================================================================
+--- binutils-2.22.orig/ld/ldmain.c
++++ binutils-2.22/ld/ldmain.c
+@@ -259,6 +259,8 @@ main (int argc, char **argv)
    command_line.warn_search_mismatch = TRUE;
    command_line.check_section_addresses = -1;
    command_line.disable_target_specific_optimizations = -1;
@@ -181,10 +187,11 @@ diff -urN binutils-2.21.orig//ld/ldmain.c binutils-2.21/ld/ldmain.c
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-diff -urN binutils-2.21.orig//ld/ld.texinfo binutils-2.21/ld/ld.texinfo
---- binutils-2.21.orig//ld/ld.texinfo	2010-10-28 04:40:26.000000000 -0700
-+++ binutils-2.21/ld/ld.texinfo	2011-01-19 10:56:04.452567113 -0800
-@@ -2133,6 +2133,18 @@
+Index: binutils-2.22/ld/ld.texinfo
+===================================================================
+--- binutils-2.22.orig/ld/ld.texinfo
++++ binutils-2.22/ld/ld.texinfo
+@@ -2147,6 +2147,18 @@ string identifying the original linked f
  
  Passing @code{none} for @var{style} disables the setting from any
  @code{--build-id} options earlier on the command line.
@@ -203,19 +210,20 @@ diff -urN binutils-2.21.orig//ld/ld.texinfo binutils-2.21/ld/ld.texinfo
  @end table
  
  @c man end
-diff -urN binutils-2.21.orig//ld/lexsup.c binutils-2.21/ld/lexsup.c
---- binutils-2.21.orig//ld/lexsup.c	2010-10-27 23:45:33.000000000 -0700
-+++ binutils-2.21/ld/lexsup.c	2011-01-19 11:02:07.799898432 -0800
-@@ -175,6 +175,8 @@
-   OPTION_PLUGIN_OPT,
+Index: binutils-2.22/ld/lexsup.c
+===================================================================
+--- binutils-2.22.orig/ld/lexsup.c
++++ binutils-2.22/ld/lexsup.c
+@@ -176,6 +176,8 @@ enum option_values
  #endif /* ENABLE_PLUGINS */
    OPTION_DEFAULT_SCRIPT,
+   OPTION_PRINT_OUTPUT_FORMAT,
 +  OPTION_NO_POISON_SYSTEM_DIRECTORIES,
 +  OPTION_ERROR_POISON_SYSTEM_DIRECTORIES
  };
  
  /* The long options.  This structure is used for both the option
-@@ -603,6 +605,14 @@
+@@ -612,6 +614,14 @@ static const struct ld_option ld_options
      TWO_DASHES },
    { {"wrap", required_argument, NULL, OPTION_WRAP},
      '\0', N_("SYMBOL"), N_("Use wrapper functions for SYMBOL"), TWO_DASHES },
@@ -230,7 +238,7 @@ diff -urN binutils-2.21.orig//ld/lexsup.c binutils-2.21/ld/lexsup.c
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1518,6 +1528,14 @@
+@@ -1541,6 +1551,14 @@ parse_args (unsigned argc, char **argv)
                einfo (_("%P%X: --hash-size needs a numeric argument\n"));
            }
            break;
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch b/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
index 1de164d..cd42a77 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-powerpc-e5500.patch
@@ -5,11 +5,11 @@ Add support for FSL PowerPC e5500 core.
 Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
 Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
 
-Index: binutils-2.21.1/bfd/archures.c
+Index: binutils-2.22/bfd/archures.c
 ===================================================================
---- binutils-2.21.1.orig/bfd/archures.c
-+++ binutils-2.21.1/bfd/archures.c
-@@ -231,6 +231,7 @@ DESCRIPTION
+--- binutils-2.22.orig/bfd/archures.c
++++ binutils-2.22/bfd/archures.c
+@@ -239,6 +239,7 @@ DESCRIPTION
  .#define bfd_mach_ppc_e500      500
  .#define bfd_mach_ppc_e500mc    5001
  .#define bfd_mach_ppc_e500mc64  5005
@@ -17,11 +17,11 @@ Index: binutils-2.21.1/bfd/archures.c
  .#define bfd_mach_ppc_titan     83
  .  bfd_arch_rs6000,    {* IBM RS/6000 *}
  .#define bfd_mach_rs6k		6000
-Index: binutils-2.21.1/bfd/bfd-in2.h
+Index: binutils-2.22/bfd/bfd-in2.h
 ===================================================================
---- binutils-2.21.1.orig/bfd/bfd-in2.h
-+++ binutils-2.21.1/bfd/bfd-in2.h
-@@ -1918,6 +1918,7 @@ enum bfd_architecture
+--- binutils-2.22.orig/bfd/bfd-in2.h
++++ binutils-2.22/bfd/bfd-in2.h
+@@ -1946,6 +1946,7 @@ enum bfd_architecture
  #define bfd_mach_ppc_e500      500
  #define bfd_mach_ppc_e500mc    5001
  #define bfd_mach_ppc_e500mc64  5005
@@ -29,10 +29,10 @@ Index: binutils-2.21.1/bfd/bfd-in2.h
  #define bfd_mach_ppc_titan     83
    bfd_arch_rs6000,    /* IBM RS/6000 */
  #define bfd_mach_rs6k          6000
-Index: binutils-2.21.1/bfd/cpu-powerpc.c
+Index: binutils-2.22/bfd/cpu-powerpc.c
 ===================================================================
---- binutils-2.21.1.orig/bfd/cpu-powerpc.c
-+++ binutils-2.21.1/bfd/cpu-powerpc.c
+--- binutils-2.22.orig/bfd/cpu-powerpc.c
++++ binutils-2.22/bfd/cpu-powerpc.c
 @@ -352,6 +352,20 @@ const bfd_arch_info_type bfd_powerpc_arc
      FALSE, /* not the default */
      powerpc_compatible,
@@ -54,11 +54,11 @@ Index: binutils-2.21.1/bfd/cpu-powerpc.c
      0
    }
  };
-Index: binutils-2.21.1/gas/config/tc-ppc.c
+Index: binutils-2.22/gas/config/tc-ppc.c
 ===================================================================
---- binutils-2.21.1.orig/gas/config/tc-ppc.c
-+++ binutils-2.21.1/gas/config/tc-ppc.c
-@@ -1236,6 +1236,7 @@ PowerPC options:\n\
+--- binutils-2.22.orig/gas/config/tc-ppc.c
++++ binutils-2.22/gas/config/tc-ppc.c
+@@ -1265,6 +1265,7 @@ PowerPC options:\n\
  -me500, -me500x2        generate code for Motorola e500 core complex\n\
  -me500mc,               generate code for Freescale e500mc core complex\n\
  -me500mc64,             generate code for Freescale e500mc64 core complex\n\
@@ -66,11 +66,11 @@ Index: binutils-2.21.1/gas/config/tc-ppc.c
  -mspe                   generate code for Motorola SPE instructions\n\
  -mtitan                 generate code for AppliedMicro Titan core complex\n\
  -mregnames              Allow symbolic names for registers\n\
-Index: binutils-2.21.1/gas/doc/as.texinfo
+Index: binutils-2.22/gas/doc/as.texinfo
 ===================================================================
---- binutils-2.21.1.orig/gas/doc/as.texinfo
-+++ binutils-2.21.1/gas/doc/as.texinfo
-@@ -432,7 +432,7 @@ gcc(1), ld(1), and the Info entries for 
+--- binutils-2.22.orig/gas/doc/as.texinfo
++++ binutils-2.22/gas/doc/as.texinfo
+@@ -434,7 +434,7 @@ gcc(1), ld(1), and the Info entries for 
     [@b{-a32}|@b{-a64}]
     [@b{-mpwrx}|@b{-mpwr2}|@b{-mpwr}|@b{-m601}|@b{-mppc}|@b{-mppc32}|@b{-m603}|@b{-m604}|@b{-m403}|@b{-m405}|
      @b{-m440}|@b{-m464}|@b{-m476}|@b{-m7400}|@b{-m7410}|@b{-m7450}|@b{-m7455}|@b{-m750cl}|@b{-mppc64}|
@@ -79,11 +79,11 @@ Index: binutils-2.21.1/gas/doc/as.texinfo
      @b{-mpower4}|@b{-mpr4}|@b{-mpower5}|@b{-mpwr5}|@b{-mpwr5x}|@b{-mpower6}|@b{-mpwr6}|
      @b{-mpower7}|@b{-mpw7}|@b{-ma2}|@b{-mcell}|@b{-mspe}|@b{-mtitan}|@b{-me300}|@b{-mcom}]
     [@b{-many}] [@b{-maltivec}|@b{-mvsx}]
-Index: binutils-2.21.1/gas/doc/c-ppc.texi
+Index: binutils-2.22/gas/doc/c-ppc.texi
 ===================================================================
---- binutils-2.21.1.orig/gas/doc/c-ppc.texi
-+++ binutils-2.21.1/gas/doc/c-ppc.texi
-@@ -85,6 +85,9 @@ Generate code for Freescale e500mc core 
+--- binutils-2.22.orig/gas/doc/c-ppc.texi
++++ binutils-2.22/gas/doc/c-ppc.texi
+@@ -88,6 +88,9 @@ Generate code for Freescale e500mc core 
  @item -me500mc64
  Generate code for Freescale e500mc64 core complex.
  
@@ -93,10 +93,10 @@ Index: binutils-2.21.1/gas/doc/c-ppc.texi
  @item -mspe
  Generate code for Motorola SPE instructions.
  
-Index: binutils-2.21.1/opcodes/ppc-dis.c
+Index: binutils-2.22/opcodes/ppc-dis.c
 ===================================================================
---- binutils-2.21.1.orig/opcodes/ppc-dis.c
-+++ binutils-2.21.1/opcodes/ppc-dis.c
+--- binutils-2.22.orig/opcodes/ppc-dis.c
++++ binutils-2.22/opcodes/ppc-dis.c
 @@ -114,6 +114,12 @@ struct ppc_mopt ppc_opts[] = {
  		| PPC_OPCODE_E500MC | PPC_OPCODE_64 | PPC_OPCODE_POWER5
  		| PPC_OPCODE_POWER6 | PPC_OPCODE_POWER7),
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
index 3f627c6..b5a25c2 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-100-uclibc-conf.patch
@@ -1,28 +1,32 @@
 Upstream-Status: Pending
 
---- binutils-2.18.orig/configure
-+++ binutils-2.18/configure
-@@ -2206,7 +2206,7 @@
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+Index: binutils-2.22/configure
+===================================================================
+--- binutils-2.22.orig/configure
++++ binutils-2.22/configure
+@@ -3130,7 +3130,7 @@ case "${target}" in
      ;;
--  sh-*-linux*)
-+  sh*-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
+   s390-*-* | s390x-*-*)
      ;;
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -2504,7 +2504,7 @@
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
+-  sh-*-* | sh[34]*-*-*)
++  sh*-*-* | sh[34]*-*-*)
+     ;;
+   sh64-*-* | sh5*-*-*)
+     ;;
+@@ -3570,7 +3570,7 @@ case "${target}" in
+   mips*-*-*)
+     noconfigdirs="$noconfigdirs gprof"
      ;;
 -  sh-*-* | sh64-*-*)
 +  sh*-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
---- binutils-2.18.orig/gprof/configure
-+++ binutils-2.18/gprof/configure
-@@ -4124,6 +4124,11 @@
+     case "${target}" in
+       sh*-*-elf)
+          ;;
+Index: binutils-2.22/gprof/configure
+===================================================================
+--- binutils-2.22.orig/gprof/configure
++++ binutils-2.22/gprof/configure
+@@ -6103,6 +6103,11 @@ linux* | k*bsd*-gnu | kopensolaris*-gnu)
    lt_cv_deplibs_check_method=pass_all
    ;;
  
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
index 07312d7..c6e1efc 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-001_ld_makefile_patch.patch
@@ -27,9 +27,11 @@ exit 0
 Upstream-Status: Inappropriate [debian patch]
 
 @DPATCH@
---- binutils-2.16.91.0.1/ld/Makefile.am
-+++ binutils-2.16.91.0.1/ld/Makefile.am
-@@ -20,7 +20,7 @@
+Index: binutils-2.22/ld/Makefile.am
+===================================================================
+--- binutils-2.22.orig/ld/Makefile.am
++++ binutils-2.22/ld/Makefile.am
+@@ -37,7 +37,7 @@ endif
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
@@ -38,9 +40,11 @@ Upstream-Status: Inappropriate [debian patch]
  
  EMUL = @EMUL@
  EMULATION_OFILES = @EMULATION_OFILES@
---- binutils-2.16.91.0.1/ld/Makefile.in
-+++ binutils-2.16.91.0.1/ld/Makefile.in
-@@ -268,7 +268,7 @@
+Index: binutils-2.22/ld/Makefile.in
+===================================================================
+--- binutils-2.22.orig/ld/Makefile.in
++++ binutils-2.22/ld/Makefile.in
+@@ -366,7 +366,7 @@ AM_CFLAGS = $(WARN_CFLAGS)
  # We put the scripts in the directory $(scriptdir)/ldscripts.
  # We can't put the scripts in $(datadir) because the SEARCH_DIR
  # directives need to be different for native and cross linkers.
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
index 35835b3..47bd8ff 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-006_better_file_error.patch
@@ -25,10 +25,11 @@ exit 0
 Upstream-Status: Inappropriate [debian patch]
 
 @DPATCH@
-diff -urNad /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c binutils-2.14.90.0.6/bfd/opncls.c
---- /home/james/debian/packages/binutils/binutils-2.14.90.0.6/bfd/opncls.c	2003-07-23 16:08:09.000000000 +0100
-+++ binutils-2.14.90.0.6/bfd/opncls.c	2003-09-10 22:35:00.000000000 +0100
-@@ -150,6 +150,13 @@
+Index: binutils-2.22/bfd/opncls.c
+===================================================================
+--- binutils-2.22.orig/bfd/opncls.c
++++ binutils-2.22/bfd/opncls.c
+@@ -197,6 +197,13 @@ bfd_fopen (const char *filename, const c
  {
    bfd *nbfd;
    const bfd_target *target_vec;
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
index 3944f2e..d31f80c 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-300-012_check_ldrunpath_length.patch
@@ -25,11 +25,11 @@ exit 0
 Upstream-Status: Inappropriate [debian patch]
 
 @DPATCH@
-Index: src/ld/emultempl/elf32.em
+Index: binutils-2.22/ld/emultempl/elf32.em
 ===================================================================
---- src.orig/ld/emultempl/elf32.em	2009-09-23 06:54:28.000000000 -0700
-+++ src/ld/emultempl/elf32.em	2009-10-06 10:58:16.883414592 -0700
-@@ -1237,6 +1237,8 @@ fragment <<EOF
+--- binutils-2.22.orig/ld/emultempl/elf32.em
++++ binutils-2.22/ld/emultempl/elf32.em
+@@ -1273,6 +1273,8 @@ fragment <<EOF
  	      && command_line.rpath == NULL)
  	    {
  	      lib_path = (const char *) getenv ("LD_RUN_PATH");
@@ -38,7 +38,7 @@ Index: src/ld/emultempl/elf32.em
  	      if (gld${EMULATION_NAME}_search_needed (lib_path, &n,
  						      force))
  		break;
-@@ -1463,6 +1465,8 @@ gld${EMULATION_NAME}_before_allocation (
+@@ -1500,6 +1502,8 @@ gld${EMULATION_NAME}_before_allocation (
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
@@ -46,4 +46,4 @@ Index: src/ld/emultempl/elf32.em
 +    rpath = NULL;
  
    for (abfd = link_info.input_bfds; abfd; abfd = abfd->link_next)
-     {
+     if (bfd_get_flavour (abfd) == bfd_target_elf_flavour)
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
index 5831579..3869faf 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-uclibc-gas-needs-libm.patch
@@ -19,11 +19,11 @@ floatformat.c:(.text+0x43e): undefined reference to `ldexp'
 collect2: ld returned 1 exit status
 make[4]: *** [as-new] Error 1
 
-Index: binutils-2.17.50/gas/configure.tgt
+Index: binutils-2.22/gas/configure.tgt
 ===================================================================
---- binutils-2.17.50.orig/gas/configure.tgt
-+++ binutils-2.17.50/gas/configure.tgt
-@@ -408,6 +408,12 @@ case ${generic_target} in
+--- binutils-2.22.orig/gas/configure.tgt
++++ binutils-2.22/gas/configure.tgt
+@@ -428,6 +428,12 @@ case ${generic_target} in
    *-*-netware)				fmt=elf em=netware ;;
  esac
  
@@ -34,6 +34,5 @@ Index: binutils-2.17.50/gas/configure.tgt
 +esac
 +
  case ${cpu_type} in
-   alpha | arm | i386 | ia64 | mips | ns32k | pdp11 | ppc | sparc | z80 | z8k)
+   alpha | arm | i386 | ia64 | microblaze | mips | ns32k | pdp11 | ppc | sparc | z80 | z8k)
      bfd_gas=yes
-
diff --git a/meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch b/meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
index 16c775c..c09578a 100644
--- a/meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
+++ b/meta/recipes-devtools/binutils/binutils/binutils-x86_64_i386_biarch.patch
@@ -9,11 +9,13 @@
 # Adapted to binutils 2.18.50.0.7
 Upstream-Status: Inappropriate [embedded specific]
 
---- binutils/ld/emulparams/elf_i386.sh
-+++ binutils/ld/emulparams/elf_i386.sh
-@@ -12,3 +12,13 @@
+Index: binutils-2.22/ld/emulparams/elf_i386.sh
+===================================================================
+--- binutils-2.22.orig/ld/emulparams/elf_i386.sh
++++ binutils-2.22/ld/emulparams/elf_i386.sh
+@@ -14,3 +14,13 @@ GENERATE_PIE_SCRIPT=yes
+ NO_SMALL_DATA=yes
  SEPARATE_GOTPLT=12
- SHARABLE_SECTIONS=yes
  IREL_IN_PLT=
 +
 +# Linux modify the default library search path to first include
diff --git a/meta/recipes-devtools/binutils/binutils/clone-shadow.patch b/meta/recipes-devtools/binutils/binutils/clone-shadow.patch
index 2939011..73d9db2 100644
--- a/meta/recipes-devtools/binutils/binutils/clone-shadow.patch
+++ b/meta/recipes-devtools/binutils/binutils/clone-shadow.patch
@@ -11,11 +11,11 @@ binutils.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: binutils-2.21.1/gas/config/obj-elf.c
+Index: binutils-2.22/gas/config/obj-elf.c
 ===================================================================
---- binutils-2.21.1.orig/gas/config/obj-elf.c	2011-03-23 07:14:03.000000000 -0700
-+++ binutils-2.21.1/gas/config/obj-elf.c	2011-07-16 19:05:57.003831035 -0700
-@@ -741,10 +741,10 @@
+--- binutils-2.22.orig/gas/config/obj-elf.c
++++ binutils-2.22/gas/config/obj-elf.c
+@@ -741,10 +741,10 @@ obj_elf_change_section (const char *name
  }
  
  static bfd_vma
@@ -28,7 +28,7 @@ Index: binutils-2.21.1/gas/config/obj-elf.c
  
    while (len > 0)
      {
-@@ -775,7 +775,7 @@
+@@ -775,7 +775,7 @@ obj_elf_parse_section_letters (char *str
  	  attr |= SHF_TLS;
  	  break;
  	case '?':
@@ -37,7 +37,7 @@ Index: binutils-2.21.1/gas/config/obj-elf.c
  	  break;
  	/* Compatibility.  */
  	case 'm':
-@@ -978,7 +978,7 @@
+@@ -978,7 +978,7 @@ obj_elf_section (int push)
  
        if (*input_line_pointer == '"')
  	{
@@ -46,7 +46,7 @@ Index: binutils-2.21.1/gas/config/obj-elf.c
  
  	  beg = demand_copy_C_string (&dummy);
  	  if (beg == NULL)
-@@ -986,7 +986,7 @@
+@@ -986,7 +986,7 @@ obj_elf_section (int push)
  	      ignore_rest_of_line ();
  	      return;
  	    }
@@ -55,7 +55,7 @@ Index: binutils-2.21.1/gas/config/obj-elf.c
  
  	  SKIP_WHITESPACE ();
  	  if (*input_line_pointer == ',')
-@@ -1038,10 +1038,10 @@
+@@ -1038,10 +1038,10 @@ obj_elf_section (int push)
  	      attr &= ~SHF_MERGE;
  	    }
  
@@ -68,7 +68,7 @@ Index: binutils-2.21.1/gas/config/obj-elf.c
  	    }
  	  if ((attr & SHF_GROUP) != 0 && *input_line_pointer == ',')
  	    {
-@@ -1063,7 +1063,7 @@
+@@ -1063,7 +1063,7 @@ obj_elf_section (int push)
  	      attr &= ~SHF_GROUP;
  	    }
  
diff --git a/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch b/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
index 3772dfb..6e732fb 100644
--- a/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
+++ b/meta/recipes-devtools/binutils/binutils/libiberty_path_fix.patch
@@ -6,11 +6,11 @@ Thanks to RP for helping find the source code causing the issue.
 
 2010/08/13
 Nitin A Kamble <nitin.a.kamble@intel.com>
-Index: binutils-2.20.1/libiberty/Makefile.in
+Index: binutils-2.22/libiberty/Makefile.in
 ===================================================================
---- binutils-2.20.1.orig/libiberty/Makefile.in
-+++ binutils-2.20.1/libiberty/Makefile.in
-@@ -327,7 +327,8 @@ install: install_to_$(INSTALL_DEST) inst
+--- binutils-2.22.orig/libiberty/Makefile.in
++++ binutils-2.22/libiberty/Makefile.in
+@@ -350,7 +350,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
diff --git a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
index fc1735e..0f27361 100644
--- a/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
+++ b/meta/recipes-devtools/binutils/binutils/libtool-2.4-update.patch
@@ -1,9 +1,9 @@
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: binutils-2.21.1/libtool.m4
+Index: binutils-2.22/libtool.m4
 ===================================================================
---- binutils-2.21.1.orig/libtool.m4
-+++ binutils-2.21.1/libtool.m4
+--- binutils-2.22.orig/libtool.m4
++++ binutils-2.22/libtool.m4
 @@ -1,7 +1,8 @@
  # libtool.m4 - Configure libtool for the host system. -*-Autoconf-*-
  #
@@ -371,7 +371,7 @@ Index: binutils-2.21.1/libtool.m4
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -2333,7 +2474,7 @@ haiku*)
+@@ -2329,7 +2470,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -380,7 +380,7 @@ Index: binutils-2.21.1/libtool.m4
    hardcode_into_libs=yes
    ;;
  
-@@ -2941,6 +3082,11 @@ case $reload_flag in
+@@ -2937,6 +3078,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -392,7 +392,7 @@ Index: binutils-2.21.1/libtool.m4
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -3007,7 +3153,8 @@ mingw* | pw32*)
+@@ -3003,7 +3149,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -402,7 +402,7 @@ Index: binutils-2.21.1/libtool.m4
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -3158,6 +3305,21 @@ tpf*)
+@@ -3154,6 +3301,21 @@ tpf*)
    ;;
  esac
  ])
@@ -424,7 +424,7 @@ Index: binutils-2.21.1/libtool.m4
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -3165,7 +3327,11 @@ test -z "$deplibs_check_method" && depli
+@@ -3161,7 +3323,11 @@ test -z "$deplibs_check_method" && depli
  _LT_DECL([], [deplibs_check_method], [1],
      [Method to check whether dependent libraries are shared objects])
  _LT_DECL([], [file_magic_cmd], [1],
@@ -437,7 +437,7 @@ Index: binutils-2.21.1/libtool.m4
  ])# _LT_CHECK_MAGIC_METHOD
  
  
-@@ -3268,6 +3434,67 @@ dnl aclocal-1.4 backwards compatibility:
+@@ -3264,6 +3430,67 @@ dnl aclocal-1.4 backwards compatibility:
  dnl AC_DEFUN([AM_PROG_NM], [])
  dnl AC_DEFUN([AC_PROG_NM], [])
  
@@ -505,7 +505,7 @@ Index: binutils-2.21.1/libtool.m4
  
  # LT_LIB_M
  # --------
-@@ -3394,8 +3621,8 @@ esac
+@@ -3390,8 +3617,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -516,7 +516,7 @@ Index: binutils-2.21.1/libtool.m4
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -3431,6 +3658,7 @@ for ac_symprfx in "" "_"; do
+@@ -3427,6 +3654,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[[	 ]]\($symcode$symcode*\)[[	 ]][[	 ]]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -524,7 +524,7 @@ Index: binutils-2.21.1/libtool.m4
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -3464,6 +3692,18 @@ _LT_EOF
+@@ -3460,6 +3688,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -543,7 +543,7 @@ Index: binutils-2.21.1/libtool.m4
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -3475,7 +3715,7 @@ _LT_EOF
+@@ -3471,7 +3711,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -552,7 +552,7 @@ Index: binutils-2.21.1/libtool.m4
    const char *name;
    void       *address;
  }
-@@ -3501,15 +3741,15 @@ static const void *lt_preloaded_setup() 
+@@ -3497,15 +3737,15 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -572,7 +572,7 @@ Index: binutils-2.21.1/libtool.m4
  	else
  	  echo "cannot find nm_test_func in $nlist" >&AS_MESSAGE_LOG_FD
  	fi
-@@ -3542,6 +3782,13 @@ else
+@@ -3538,6 +3778,13 @@ else
    AC_MSG_RESULT(ok)
  fi
  
@@ -586,7 +586,7 @@ Index: binutils-2.21.1/libtool.m4
  _LT_DECL([global_symbol_pipe], [lt_cv_sys_global_symbol_pipe], [1],
      [Take the output of nm and produce a listing of raw symbols and C names])
  _LT_DECL([global_symbol_to_cdecl], [lt_cv_sys_global_symbol_to_cdecl], [1],
-@@ -3552,6 +3799,8 @@ _LT_DECL([global_symbol_to_c_name_addres
+@@ -3548,6 +3795,8 @@ _LT_DECL([global_symbol_to_c_name_addres
  _LT_DECL([global_symbol_to_c_name_address_lib_prefix],
      [lt_cv_sys_global_symbol_to_c_name_address_lib_prefix], [1],
      [Transform the output of nm in a C name address pair when lib prefix is needed])
@@ -595,7 +595,7 @@ Index: binutils-2.21.1/libtool.m4
  ]) # _LT_CMD_GLOBAL_SYMBOLS
  
  
-@@ -3563,7 +3812,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
+@@ -3559,7 +3808,6 @@ _LT_TAGVAR(lt_prog_compiler_wl, $1)=
  _LT_TAGVAR(lt_prog_compiler_pic, $1)=
  _LT_TAGVAR(lt_prog_compiler_static, $1)=
  
@@ -603,7 +603,7 @@ Index: binutils-2.21.1/libtool.m4
  m4_if([$1], [CXX], [
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -3668,6 +3916,12 @@ m4_if([$1], [CXX], [
+@@ -3664,6 +3912,12 @@ m4_if([$1], [CXX], [
  	  ;;
  	esac
  	;;
@@ -616,7 +616,7 @@ Index: binutils-2.21.1/libtool.m4
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -3820,7 +4074,7 @@ m4_if([$1], [CXX], [
+@@ -3816,7 +4070,7 @@ m4_if([$1], [CXX], [
  	;;
        solaris*)
  	case $cc_basename in
@@ -625,7 +625,7 @@ Index: binutils-2.21.1/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
  	    _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
-@@ -4042,6 +4296,12 @@ m4_if([$1], [CXX], [
+@@ -4038,6 +4292,12 @@ m4_if([$1], [CXX], [
  	_LT_TAGVAR(lt_prog_compiler_pic, $1)='--shared'
  	_LT_TAGVAR(lt_prog_compiler_static, $1)='--static'
  	;;
@@ -638,7 +638,7 @@ Index: binutils-2.21.1/libtool.m4
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -4104,7 +4364,7 @@ m4_if([$1], [CXX], [
+@@ -4100,7 +4360,7 @@ m4_if([$1], [CXX], [
        _LT_TAGVAR(lt_prog_compiler_pic, $1)='-KPIC'
        _LT_TAGVAR(lt_prog_compiler_static, $1)='-Bstatic'
        case $cc_basename in
@@ -647,7 +647,7 @@ Index: binutils-2.21.1/libtool.m4
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Qoption ld ';;
        *)
  	_LT_TAGVAR(lt_prog_compiler_wl, $1)='-Wl,';;
-@@ -4161,9 +4421,11 @@ case $host_os in
+@@ -4157,9 +4417,11 @@ case $host_os in
      _LT_TAGVAR(lt_prog_compiler_pic, $1)="$_LT_TAGVAR(lt_prog_compiler_pic, $1)@&t@m4_if([$1],[],[ -DPIC],[m4_if([$1],[CXX],[ -DPIC],[])])"
      ;;
  esac
@@ -662,7 +662,7 @@ Index: binutils-2.21.1/libtool.m4
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -4182,6 +4444,8 @@ fi
+@@ -4178,6 +4440,8 @@ fi
  _LT_TAGDECL([pic_flag], [lt_prog_compiler_pic], [1],
  	[Additional compiler flags for building library objects])
  
@@ -671,7 +671,7 @@ Index: binutils-2.21.1/libtool.m4
  #
  # Check to make sure the static flag actually works.
  #
-@@ -4202,6 +4466,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
+@@ -4198,6 +4462,7 @@ _LT_TAGDECL([link_static_flag], [lt_prog
  m4_defun([_LT_LINKER_SHLIBS],
  [AC_REQUIRE([LT_PATH_LD])dnl
  AC_REQUIRE([LT_PATH_NM])dnl
@@ -679,7 +679,7 @@ Index: binutils-2.21.1/libtool.m4
  m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
  m4_require([_LT_DECL_SED])dnl
-@@ -4210,6 +4475,7 @@ m4_require([_LT_TAG_COMPILER])dnl
+@@ -4206,6 +4471,7 @@ m4_require([_LT_TAG_COMPILER])dnl
  AC_MSG_CHECKING([whether the $compiler linker ($LD) supports shared libraries])
  m4_if([$1], [CXX], [
    _LT_TAGVAR(export_symbols_cmds, $1)='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -687,7 +687,7 @@ Index: binutils-2.21.1/libtool.m4
    case $host_os in
    aix[[4-9]]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -4224,15 +4490,20 @@ m4_if([$1], [CXX], [
+@@ -4220,15 +4486,20 @@ m4_if([$1], [CXX], [
      ;;
    pw32*)
      _LT_TAGVAR(export_symbols_cmds, $1)="$ltdll_cmds"
@@ -713,7 +713,7 @@ Index: binutils-2.21.1/libtool.m4
  ], [
    runpath_var=
    _LT_TAGVAR(allow_undefined_flag, $1)=
-@@ -4400,7 +4671,8 @@ _LT_EOF
+@@ -4396,7 +4667,8 @@ _LT_EOF
        _LT_TAGVAR(allow_undefined_flag, $1)=unsupported
        _LT_TAGVAR(always_export_symbols, $1)=no
        _LT_TAGVAR(enable_shared_with_static_runtimes, $1)=yes
@@ -723,7 +723,7 @@ Index: binutils-2.21.1/libtool.m4
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          _LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -4448,7 +4720,7 @@ _LT_EOF
+@@ -4444,7 +4716,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -732,7 +732,7 @@ Index: binutils-2.21.1/libtool.m4
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -4499,12 +4771,12 @@ _LT_EOF
+@@ -4495,12 +4767,12 @@ _LT_EOF
  	  _LT_TAGVAR(whole_archive_flag_spec, $1)='--whole-archive$convenience --no-whole-archive'
  	  _LT_TAGVAR(hardcode_libdir_flag_spec, $1)=
  	  _LT_TAGVAR(hardcode_libdir_flag_spec_ld, $1)='-rpath $libdir'
@@ -747,7 +747,7 @@ Index: binutils-2.21.1/libtool.m4
  	  fi
  	  ;;
  	esac
-@@ -4518,8 +4790,8 @@ _LT_EOF
+@@ -4514,8 +4786,8 @@ _LT_EOF
  	_LT_TAGVAR(archive_cmds, $1)='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -758,7 +758,7 @@ Index: binutils-2.21.1/libtool.m4
        fi
        ;;
  
-@@ -4537,8 +4809,8 @@ _LT_EOF
+@@ -4533,8 +4805,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -769,7 +769,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4584,8 +4856,8 @@ _LT_EOF
+@@ -4580,8 +4852,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -780,7 +780,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	_LT_TAGVAR(ld_shlibs, $1)=no
        fi
-@@ -4715,7 +4987,7 @@ _LT_EOF
+@@ -4711,7 +4983,7 @@ _LT_EOF
  	_LT_TAGVAR(allow_undefined_flag, $1)='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -789,7 +789,7 @@ Index: binutils-2.21.1/libtool.m4
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
          _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
        else
-@@ -4726,7 +4998,7 @@ _LT_EOF
+@@ -4722,7 +4994,7 @@ _LT_EOF
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -798,7 +798,7 @@ Index: binutils-2.21.1/libtool.m4
  	 _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
  	  # -berok will link without error, but may produce a broken library.
-@@ -4770,20 +5042,63 @@ _LT_EOF
+@@ -4766,20 +5038,63 @@ _LT_EOF
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -876,7 +876,7 @@ Index: binutils-2.21.1/libtool.m4
        ;;
  
      darwin* | rhapsody*)
-@@ -4821,7 +5136,7 @@ _LT_EOF
+@@ -4813,7 +5128,7 @@ _LT_EOF
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -885,7 +885,7 @@ Index: binutils-2.21.1/libtool.m4
        _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='-R$libdir'
        _LT_TAGVAR(hardcode_direct, $1)=yes
        _LT_TAGVAR(hardcode_shlibpath_var, $1)=no
-@@ -4829,7 +5144,7 @@ _LT_EOF
+@@ -4821,7 +5136,7 @@ _LT_EOF
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -894,7 +894,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -4845,7 +5160,7 @@ _LT_EOF
+@@ -4837,7 +5152,7 @@ _LT_EOF
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -903,7 +903,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -4869,10 +5184,10 @@ _LT_EOF
+@@ -4861,10 +5176,10 @@ _LT_EOF
  	  _LT_TAGVAR(archive_cmds, $1)='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -916,7 +916,7 @@ Index: binutils-2.21.1/libtool.m4
  	  ;;
  	esac
        else
-@@ -4919,16 +5234,31 @@ _LT_EOF
+@@ -4911,16 +5226,31 @@ _LT_EOF
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -955,7 +955,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	_LT_TAGVAR(archive_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	_LT_TAGVAR(archive_expsym_cmds, $1)='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -5013,7 +5343,7 @@ _LT_EOF
+@@ -5005,7 +5335,7 @@ _LT_EOF
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	_LT_TAGVAR(allow_undefined_flag, $1)=' ${wl}-expect_unresolved ${wl}\*'
@@ -964,7 +964,7 @@ Index: binutils-2.21.1/libtool.m4
  	_LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
        else
  	_LT_TAGVAR(allow_undefined_flag, $1)=' -expect_unresolved \*'
-@@ -5032,9 +5362,9 @@ _LT_EOF
+@@ -5024,9 +5354,9 @@ _LT_EOF
        _LT_TAGVAR(no_undefined_flag, $1)=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -976,7 +976,7 @@ Index: binutils-2.21.1/libtool.m4
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -5306,8 +5636,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
+@@ -5298,8 +5628,6 @@ _LT_TAGDECL([], [inherit_rpath], [0],
      to runtime path list])
  _LT_TAGDECL([], [link_all_deplibs], [0],
      [Whether libtool must link a program against all its dependency libraries])
@@ -985,7 +985,7 @@ Index: binutils-2.21.1/libtool.m4
  _LT_TAGDECL([], [always_export_symbols], [0],
      [Set to "yes" if exported symbols are required])
  _LT_TAGDECL([], [export_symbols_cmds], [2],
-@@ -5318,6 +5646,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
+@@ -5310,6 +5638,8 @@ _LT_TAGDECL([], [include_expsyms], [1],
      [Symbols that must always be exported])
  _LT_TAGDECL([], [prelink_cmds], [2],
      [Commands necessary for linking programs (against libraries) with templates])
@@ -994,7 +994,7 @@ Index: binutils-2.21.1/libtool.m4
  _LT_TAGDECL([], [file_list_spec], [1],
      [Specify filename containing input files])
  dnl FIXME: Not yet implemented
-@@ -5419,6 +5749,7 @@ CC="$lt_save_CC"
+@@ -5411,6 +5741,7 @@ CC="$lt_save_CC"
  m4_defun([_LT_LANG_CXX_CONFIG],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
  m4_require([_LT_DECL_EGREP])dnl
@@ -1002,7 +1002,7 @@ Index: binutils-2.21.1/libtool.m4
  if test -n "$CXX" && ( test "X$CXX" != "Xno" &&
      ( (test "X$CXX" = "Xg++" && `g++ -v >/dev/null 2>&1` ) ||
      (test "X$CXX" != "Xg++"))) ; then
-@@ -5480,6 +5811,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5472,6 +5803,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -1010,7 +1010,7 @@ Index: binutils-2.21.1/libtool.m4
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -5497,6 +5829,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5489,6 +5821,7 @@ if test "$_lt_caught_CXX_error" != yes; 
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -1018,7 +1018,7 @@ Index: binutils-2.21.1/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -5518,8 +5851,8 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5510,8 +5843,8 @@ if test "$_lt_caught_CXX_error" != yes; 
        # Check if GNU C++ uses GNU ld as the underlying linker, since the
        # archiving commands below assume that GNU ld is being used.
        if test "$with_gnu_ld" = yes; then
@@ -1029,7 +1029,7 @@ Index: binutils-2.21.1/libtool.m4
  
          _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-rpath ${wl}$libdir'
          _LT_TAGVAR(export_dynamic_flag_spec, $1)='${wl}--export-dynamic'
-@@ -5660,7 +5993,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5652,7 +5985,7 @@ if test "$_lt_caught_CXX_error" != yes; 
            _LT_TAGVAR(allow_undefined_flag, $1)='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -1038,7 +1038,7 @@ Index: binutils-2.21.1/libtool.m4
            _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  
            _LT_TAGVAR(archive_expsym_cmds, $1)='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -5672,7 +6005,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5664,7 +5997,7 @@ if test "$_lt_caught_CXX_error" != yes; 
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -1047,7 +1047,7 @@ Index: binutils-2.21.1/libtool.m4
  	    _LT_TAGVAR(hardcode_libdir_flag_spec, $1)='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
  	    # -berok will link without error, but may produce a broken library.
-@@ -5714,29 +6047,75 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5706,29 +6039,75 @@ if test "$_lt_caught_CXX_error" != yes; 
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -1146,7 +1146,7 @@ Index: binutils-2.21.1/libtool.m4
        darwin* | rhapsody*)
          _LT_DARWIN_LINKER_FEATURES($1)
  	;;
-@@ -5811,7 +6190,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5803,7 +6182,7 @@ if test "$_lt_caught_CXX_error" != yes; 
              ;;
            *)
              if test "$GXX" = yes; then
@@ -1155,7 +1155,7 @@ Index: binutils-2.21.1/libtool.m4
              else
                # FIXME: insert proper C++ library support
                _LT_TAGVAR(ld_shlibs, $1)=no
-@@ -5882,10 +6261,10 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5874,10 +6253,10 @@ if test "$_lt_caught_CXX_error" != yes; 
  	            _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -1168,7 +1168,7 @@ Index: binutils-2.21.1/libtool.m4
  	            ;;
  	        esac
  	      fi
-@@ -5926,9 +6305,9 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5918,9 +6297,9 @@ if test "$_lt_caught_CXX_error" != yes; 
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -1180,7 +1180,7 @@ Index: binutils-2.21.1/libtool.m4
  	      fi
  	    fi
  	    _LT_TAGVAR(link_all_deplibs, $1)=yes
-@@ -5998,20 +6377,20 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -5990,20 +6369,20 @@ if test "$_lt_caught_CXX_error" != yes; 
  	      _LT_TAGVAR(prelink_cmds, $1)='tpldir=Template.dir~
  		rm -rf $tpldir~
  		$CC --prelink_objects --instantiation_dir $tpldir $objs $libobjs $compile_deplibs~
@@ -1205,7 +1205,7 @@ Index: binutils-2.21.1/libtool.m4
  	      ;;
  	    *) # Version 6 and above use weak symbols
  	      _LT_TAGVAR(archive_cmds, $1)='$CC -shared $pic_flag $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname -o $lib'
-@@ -6206,7 +6585,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -6198,7 +6577,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  	          _LT_TAGVAR(archive_cmds, $1)='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -1214,7 +1214,7 @@ Index: binutils-2.21.1/libtool.m4
  		  ;;
  	      esac
  
-@@ -6252,7 +6631,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -6244,7 +6623,7 @@ if test "$_lt_caught_CXX_error" != yes; 
  
        solaris*)
          case $cc_basename in
@@ -1223,7 +1223,7 @@ Index: binutils-2.21.1/libtool.m4
  	    # Sun C++ 4.2, 5.x and Centerline C++
              _LT_TAGVAR(archive_cmds_need_lc,$1)=yes
  	    _LT_TAGVAR(no_undefined_flag, $1)=' -zdefs'
-@@ -6293,9 +6672,9 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -6285,9 +6664,9 @@ if test "$_lt_caught_CXX_error" != yes; 
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      _LT_TAGVAR(no_undefined_flag, $1)=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -1235,7 +1235,7 @@ Index: binutils-2.21.1/libtool.m4
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -6424,6 +6803,7 @@ if test "$_lt_caught_CXX_error" != yes; 
+@@ -6416,6 +6795,7 @@ if test "$_lt_caught_CXX_error" != yes; 
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -1243,7 +1243,7 @@ Index: binutils-2.21.1/libtool.m4
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -6438,6 +6818,29 @@ AC_LANG_POP
+@@ -6430,6 +6810,29 @@ AC_LANG_POP
  ])# _LT_LANG_CXX_CONFIG
  
  
@@ -1273,7 +1273,7 @@ Index: binutils-2.21.1/libtool.m4
  # _LT_SYS_HIDDEN_LIBDEPS([TAGNAME])
  # ---------------------------------
  # Figure out "hidden" library dependencies from verbose
-@@ -6446,6 +6849,7 @@ AC_LANG_POP
+@@ -6438,6 +6841,7 @@ AC_LANG_POP
  # objects, libraries and library flags.
  m4_defun([_LT_SYS_HIDDEN_LIBDEPS],
  [m4_require([_LT_FILEUTILS_DEFAULTS])dnl
@@ -1281,7 +1281,7 @@ Index: binutils-2.21.1/libtool.m4
  # Dependencies to place before and after the object being linked:
  _LT_TAGVAR(predep_objects, $1)=
  _LT_TAGVAR(postdep_objects, $1)=
-@@ -6496,6 +6900,13 @@ public class foo {
+@@ -6488,6 +6892,13 @@ public class foo {
  };
  _LT_EOF
  ])
@@ -1295,7 +1295,7 @@ Index: binutils-2.21.1/libtool.m4
  dnl Parse the compiler output and extract the necessary
  dnl objects, libraries and library flags.
  if AC_TRY_EVAL(ac_compile); then
-@@ -6507,7 +6918,7 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6499,7 +6910,7 @@ if AC_TRY_EVAL(ac_compile); then
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -1304,7 +1304,7 @@ Index: binutils-2.21.1/libtool.m4
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -6516,13 +6927,22 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6508,13 +6919,22 @@ if AC_TRY_EVAL(ac_compile); then
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -1331,7 +1331,7 @@ Index: binutils-2.21.1/libtool.m4
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -6542,8 +6962,10 @@ if AC_TRY_EVAL(ac_compile); then
+@@ -6534,8 +6954,10 @@ if AC_TRY_EVAL(ac_compile); then
  	   _LT_TAGVAR(postdeps, $1)="${_LT_TAGVAR(postdeps, $1)} ${prev}${p}"
  	 fi
         fi
@@ -1342,7 +1342,7 @@ Index: binutils-2.21.1/libtool.m4
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -6579,6 +7001,7 @@ else
+@@ -6571,6 +6993,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -1350,7 +1350,7 @@ Index: binutils-2.21.1/libtool.m4
  
  # PORTME: override above test on systems where it is broken
  m4_if([$1], [CXX],
-@@ -6615,7 +7038,7 @@ linux*)
+@@ -6607,7 +7030,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -1359,7 +1359,7 @@ Index: binutils-2.21.1/libtool.m4
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -6728,7 +7151,9 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6720,7 +7143,9 @@ if test "$_lt_disable_F77" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1369,7 +1369,7 @@ Index: binutils-2.21.1/libtool.m4
    compiler=$CC
    _LT_TAGVAR(compiler, $1)=$CC
    _LT_CC_BASENAME([$compiler])
-@@ -6782,6 +7207,7 @@ if test "$_lt_disable_F77" != yes; then
+@@ -6774,6 +7199,7 @@ if test "$_lt_disable_F77" != yes; then
  
    GCC=$lt_save_GCC
    CC="$lt_save_CC"
@@ -1377,7 +1377,7 @@ Index: binutils-2.21.1/libtool.m4
  fi # test "$_lt_disable_F77" != yes
  
  AC_LANG_POP
-@@ -6858,7 +7284,9 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6850,7 +7276,9 @@ if test "$_lt_disable_FC" != yes; then
    # Allow CC to be a program name with arguments.
    lt_save_CC="$CC"
    lt_save_GCC=$GCC
@@ -1387,7 +1387,7 @@ Index: binutils-2.21.1/libtool.m4
    compiler=$CC
    GCC=$ac_cv_fc_compiler_gnu
  
-@@ -6914,7 +7342,8 @@ if test "$_lt_disable_FC" != yes; then
+@@ -6906,7 +7334,8 @@ if test "$_lt_disable_FC" != yes; then
    fi # test -n "$compiler"
  
    GCC=$lt_save_GCC
@@ -1397,7 +1397,7 @@ Index: binutils-2.21.1/libtool.m4
  fi # test "$_lt_disable_FC" != yes
  
  AC_LANG_POP
-@@ -6951,10 +7380,12 @@ _LT_COMPILER_BOILERPLATE
+@@ -6943,10 +7372,12 @@ _LT_COMPILER_BOILERPLATE
  _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
@@ -1411,7 +1411,7 @@ Index: binutils-2.21.1/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_TAGVAR(LD, $1)="$LD"
-@@ -6985,7 +7416,8 @@ fi
+@@ -6977,7 +7408,8 @@ fi
  AC_LANG_RESTORE
  
  GCC=$lt_save_GCC
@@ -1421,7 +1421,7 @@ Index: binutils-2.21.1/libtool.m4
  ])# _LT_LANG_GCJ_CONFIG
  
  
-@@ -7020,9 +7452,11 @@ _LT_LINKER_BOILERPLATE
+@@ -7012,9 +7444,11 @@ _LT_LINKER_BOILERPLATE
  
  # Allow CC to be a program name with arguments.
  lt_save_CC="$CC"
@@ -1433,7 +1433,7 @@ Index: binutils-2.21.1/libtool.m4
  compiler=$CC
  _LT_TAGVAR(compiler, $1)=$CC
  _LT_CC_BASENAME([$compiler])
-@@ -7035,7 +7469,8 @@ fi
+@@ -7027,7 +7461,8 @@ fi
  
  GCC=$lt_save_GCC
  AC_LANG_RESTORE
@@ -1443,7 +1443,7 @@ Index: binutils-2.21.1/libtool.m4
  ])# _LT_LANG_RC_CONFIG
  
  
-@@ -7094,6 +7529,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object 
+@@ -7086,6 +7521,15 @@ _LT_DECL([], [OBJDUMP], [1], [An object 
  AC_SUBST([OBJDUMP])
  ])
  
@@ -1459,7 +1459,7 @@ Index: binutils-2.21.1/libtool.m4
  
  # _LT_DECL_SED
  # ------------
-@@ -7187,8 +7631,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
+@@ -7179,8 +7623,8 @@ m4_defun([_LT_CHECK_SHELL_FEATURES],
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -1470,7 +1470,7 @@ Index: binutils-2.21.1/libtool.m4
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -7227,206 +7671,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
+@@ -7219,206 +7663,162 @@ _LT_DECL([NL2SP], [lt_NL2SP], [1], [turn
  ])# _LT_CHECK_SHELL_FEATURES
  
  
@@ -1823,10 +1823,10 @@ Index: binutils-2.21.1/libtool.m4
 +_LT_DECL([to_tool_file_cmd], [lt_cv_to_tool_file_cmd],
 +         [0], [convert $build files to toolchain format])dnl
 +])# _LT_PATH_CONVERSION_FUNCTIONS
-Index: binutils-2.21.1/ltmain.sh
+Index: binutils-2.22/ltmain.sh
 ===================================================================
---- binutils-2.21.1.orig/ltmain.sh
-+++ binutils-2.21.1/ltmain.sh
+--- binutils-2.22.orig/ltmain.sh
++++ binutils-2.22/ltmain.sh
 @@ -1,10 +1,9 @@
 -# Generated from ltmain.m4sh.
  
@@ -7053,10 +7053,10 @@ Index: binutils-2.21.1/ltmain.sh
  
  if test -n "$exec_cmd"; then
    eval exec "$exec_cmd"
-Index: binutils-2.21.1/ltoptions.m4
+Index: binutils-2.22/ltoptions.m4
 ===================================================================
---- binutils-2.21.1.orig/ltoptions.m4
-+++ binutils-2.21.1/ltoptions.m4
+--- binutils-2.22.orig/ltoptions.m4
++++ binutils-2.22/ltoptions.m4
 @@ -8,7 +8,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7066,10 +7066,10 @@ Index: binutils-2.21.1/ltoptions.m4
  
  # This is to help aclocal find these macros, as it can't see m4_define.
  AC_DEFUN([LTOPTIONS_VERSION], [m4_if([1])])
-Index: binutils-2.21.1/ltversion.m4
+Index: binutils-2.22/ltversion.m4
 ===================================================================
---- binutils-2.21.1.orig/ltversion.m4
-+++ binutils-2.21.1/ltversion.m4
+--- binutils-2.22.orig/ltversion.m4
++++ binutils-2.22/ltversion.m4
 @@ -7,17 +7,17 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7094,10 +7094,10 @@ Index: binutils-2.21.1/ltversion.m4
  _LT_DECL(, macro_version, 0, [Which release of libtool.m4 was used?])
  _LT_DECL(, macro_revision, 0)
  ])
-Index: binutils-2.21.1/lt~obsolete.m4
+Index: binutils-2.22/lt~obsolete.m4
 ===================================================================
---- binutils-2.21.1.orig/lt~obsolete.m4
-+++ binutils-2.21.1/lt~obsolete.m4
+--- binutils-2.22.orig/lt~obsolete.m4
++++ binutils-2.22/lt~obsolete.m4
 @@ -7,7 +7,7 @@
  # unlimited permission to copy and/or distribute it, with or without
  # modifications, as long as this notice is preserved.
@@ -7107,38 +7107,11 @@ Index: binutils-2.21.1/lt~obsolete.m4
  
  # These exist entirely to fool aclocal when bootstrapping libtool.
  #
-Index: binutils-2.21.1/configure
+Index: binutils-2.22/configure
 ===================================================================
---- binutils-2.21.1.orig/configure
-+++ binutils-2.21.1/configure
-@@ -2670,7 +2670,7 @@ host_libs="intl mmalloc libiberty opcode
- # binutils, gas and ld appear in that order because it makes sense to run
- # "make check" in that particular order.
- # If --enable-gold is used, "gold" may replace "ld".
--host_tools="texinfo byacc flex bison binutils gas ld fixincludes gcc cgen sid sim gdb make patch prms send-pr gprof etc expect dejagnu ash bash bzip2 m4 autoconf automake libtool diff rcs fileutils shellutils time textutils wdiff find uudecode hello tar gzip indent recode release sed utils guile perl gawk findutils gettext zip fastjar gnattools"
-+host_tools="byacc flex bison binutils gas ld fixincludes gcc cgen sid sim gdb make patch prms send-pr gprof etc expect dejagnu ash bash bzip2 m4 autoconf automake libtool diff rcs fileutils shellutils time textutils wdiff find uudecode hello tar gzip indent recode release sed utils guile perl gawk findutils gettext zip fastjar gnattools"
- 
- # libgcj represents the runtime libraries only used by gcj.
- libgcj="target-libffi \
-@@ -3148,7 +3148,7 @@ case "${target}" in
-   am33_2.0-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
--  sh*-*-linux*)
-+  sh-*-linux*)
-     noconfigdirs="$noconfigdirs ${libgcj} target-newlib target-libgloss"
-     ;;
-   sh*-*-pe|mips*-*-pe|*arm-wince-pe)
-@@ -3487,7 +3487,7 @@ case "${target}" in
-   romp-*-*)
-     noconfigdirs="$noconfigdirs bfd binutils ld gas opcodes target-libgloss ${libgcj}"
-     ;;
--  sh*-*-* | sh64-*-*)
-+  sh-*-* | sh64-*-*)
-     case "${host}" in
-       i[3456789]86-*-vsta) ;; # don't add gprof back in
-       i[3456789]86-*-go32*) ;; # don't add gprof back in
-@@ -7597,7 +7597,7 @@ case " $build_configdirs " in
+--- binutils-2.22.orig/configure
++++ binutils-2.22/configure
+@@ -7788,7 +7788,7 @@ case " $build_configdirs " in
      # For an installed makeinfo, we require it to be from texinfo 4.7 or
      # higher, else we use the "missing" dummy.
      if ${MAKEINFO} --version \
@@ -7147,10 +7120,10 @@ Index: binutils-2.21.1/configure
        :
      else
        MAKEINFO="$MISSING makeinfo"
-Index: binutils-2.21.1/bfd/configure
+Index: binutils-2.22/bfd/configure
 ===================================================================
---- binutils-2.21.1.orig/bfd/configure
-+++ binutils-2.21.1/bfd/configure
+--- binutils-2.22.orig/bfd/configure
++++ binutils-2.22/bfd/configure
 @@ -667,6 +667,9 @@ OTOOL
  LIPO
  NMEDIT
@@ -8236,7 +8209,7 @@ Index: binutils-2.21.1/bfd/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9652,7 +10235,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9648,7 +10231,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -8245,7 +8218,7 @@ Index: binutils-2.21.1/bfd/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9660,7 +10243,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9656,7 +10239,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -8254,7 +8227,7 @@ Index: binutils-2.21.1/bfd/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9676,7 +10259,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9672,7 +10255,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -8263,7 +8236,7 @@ Index: binutils-2.21.1/bfd/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9700,10 +10283,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9696,10 +10279,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -8276,7 +8249,7 @@ Index: binutils-2.21.1/bfd/configure
  	  ;;
  	esac
        else
-@@ -9782,23 +10365,36 @@ fi
+@@ -9778,23 +10361,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -8321,7 +8294,7 @@ Index: binutils-2.21.1/bfd/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9883,7 +10479,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9879,7 +10475,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -8330,7 +8303,7 @@ Index: binutils-2.21.1/bfd/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9902,9 +10498,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9898,9 +10494,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -8342,7 +8315,7 @@ Index: binutils-2.21.1/bfd/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10480,8 +11076,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10476,8 +11072,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -8354,7 +8327,7 @@ Index: binutils-2.21.1/bfd/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10514,13 +11111,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10510,13 +11107,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -8427,7 +8400,7 @@ Index: binutils-2.21.1/bfd/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10616,7 +11271,7 @@ haiku*)
+@@ -10608,7 +11263,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -8436,16 +8409,16 @@ Index: binutils-2.21.1/bfd/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11412,7 +12067,7 @@ else
+@@ -11404,7 +12059,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11415 "configure"
+-#line 11407 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11456,10 +12111,10 @@ else
+@@ -11448,10 +12103,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8458,16 +8431,16 @@ Index: binutils-2.21.1/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11518,7 +12173,7 @@ else
+@@ -11510,7 +12165,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11521 "configure"
+-#line 11513 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11562,10 +12217,10 @@ else
+@@ -11554,10 +12209,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -8480,7 +8453,7 @@ Index: binutils-2.21.1/bfd/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15045,7 +15700,7 @@ SHARED_LDFLAGS=
+@@ -15037,7 +15692,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -8489,7 +8462,7 @@ Index: binutils-2.21.1/bfd/configure
    fi
  
  # More hacks to build DLLs on Windows.
-@@ -16619,13 +17274,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -16629,13 +17284,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -8510,7 +8483,7 @@ Index: binutils-2.21.1/bfd/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -16640,14 +17302,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -16650,14 +17312,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -8529,7 +8502,7 @@ Index: binutils-2.21.1/bfd/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -16680,12 +17345,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -16690,12 +17355,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -8543,7 +8516,7 @@ Index: binutils-2.21.1/bfd/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -16740,8 +17405,13 @@ reload_flag \
+@@ -16750,8 +17415,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -8557,7 +8530,7 @@ Index: binutils-2.21.1/bfd/configure
  STRIP \
  RANLIB \
  CC \
-@@ -16751,12 +17421,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16761,12 +17431,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -8573,7 +8546,7 @@ Index: binutils-2.21.1/bfd/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -16772,7 +17444,6 @@ no_undefined_flag \
+@@ -16782,7 +17454,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -8581,7 +8554,7 @@ Index: binutils-2.21.1/bfd/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -16808,6 +17479,7 @@ module_cmds \
+@@ -16818,6 +17489,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -8589,7 +8562,7 @@ Index: binutils-2.21.1/bfd/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -17587,7 +18259,8 @@ $as_echo X"$file" |
+@@ -17597,7 +18269,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -8599,7 +8572,7 @@ Index: binutils-2.21.1/bfd/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -17690,19 +18363,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17700,19 +18373,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -8643,7 +8616,7 @@ Index: binutils-2.21.1/bfd/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -17732,6 +18428,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -17742,6 +18438,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -8656,7 +8629,7 @@ Index: binutils-2.21.1/bfd/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -17741,6 +18443,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17751,6 +18453,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -8666,7 +8639,7 @@ Index: binutils-2.21.1/bfd/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -17855,12 +18560,12 @@ with_gcc=$GCC
+@@ -17865,12 +18570,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -8682,7 +8655,7 @@ Index: binutils-2.21.1/bfd/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -17947,9 +18652,6 @@ inherit_rpath=$inherit_rpath
+@@ -17957,9 +18662,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -8692,7 +8665,7 @@ Index: binutils-2.21.1/bfd/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -17965,6 +18667,9 @@ include_expsyms=$lt_include_expsyms
+@@ -17975,6 +18677,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -8702,7 +8675,7 @@ Index: binutils-2.21.1/bfd/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -17997,210 +18702,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18007,210 +18712,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -9073,10 +9046,10 @@ Index: binutils-2.21.1/bfd/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/opcodes/configure
+Index: binutils-2.22/opcodes/configure
 ===================================================================
---- binutils-2.21.1.orig/opcodes/configure
-+++ binutils-2.21.1/opcodes/configure
+--- binutils-2.22.orig/opcodes/configure
++++ binutils-2.22/opcodes/configure
 @@ -647,6 +647,9 @@ OTOOL
  LIPO
  NMEDIT
@@ -10165,7 +10138,7 @@ Index: binutils-2.21.1/opcodes/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9382,7 +9965,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9378,7 +9961,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -10174,7 +10147,7 @@ Index: binutils-2.21.1/opcodes/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9390,7 +9973,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9386,7 +9969,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -10183,7 +10156,7 @@ Index: binutils-2.21.1/opcodes/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9406,7 +9989,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9402,7 +9985,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -10192,7 +10165,7 @@ Index: binutils-2.21.1/opcodes/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9430,10 +10013,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9426,10 +10009,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -10205,7 +10178,7 @@ Index: binutils-2.21.1/opcodes/configure
  	  ;;
  	esac
        else
-@@ -9512,23 +10095,36 @@ fi
+@@ -9508,23 +10091,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -10250,7 +10223,7 @@ Index: binutils-2.21.1/opcodes/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9613,7 +10209,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9609,7 +10205,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -10259,7 +10232,7 @@ Index: binutils-2.21.1/opcodes/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9632,9 +10228,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9628,9 +10224,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -10271,7 +10244,7 @@ Index: binutils-2.21.1/opcodes/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10210,8 +10806,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10206,8 +10802,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -10283,7 +10256,7 @@ Index: binutils-2.21.1/opcodes/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10244,13 +10841,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10240,13 +10837,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -10356,7 +10329,7 @@ Index: binutils-2.21.1/opcodes/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10346,7 +11001,7 @@ haiku*)
+@@ -10338,7 +10993,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -10365,16 +10338,16 @@ Index: binutils-2.21.1/opcodes/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11142,7 +11797,7 @@ else
+@@ -11134,7 +11789,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11145 "configure"
+-#line 11137 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11186,10 +11841,10 @@ else
+@@ -11178,10 +11833,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10387,16 +10360,16 @@ Index: binutils-2.21.1/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11248,7 +11903,7 @@ else
+@@ -11240,7 +11895,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11251 "configure"
+-#line 11243 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11292,10 +11947,10 @@ else
+@@ -11284,10 +11939,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -10409,7 +10382,7 @@ Index: binutils-2.21.1/opcodes/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12328,7 +12983,7 @@ if test "$enable_shared" = "yes"; then
+@@ -12320,7 +12975,7 @@ if test "$enable_shared" = "yes"; then
  # since libbfd may not pull in the entirety of libiberty.
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -10418,7 +10391,7 @@ Index: binutils-2.21.1/opcodes/configure
    fi
  
    case "${host}" in
-@@ -13289,13 +13944,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -13283,13 +13938,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -10439,7 +10412,7 @@ Index: binutils-2.21.1/opcodes/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13310,14 +13972,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -13304,14 +13966,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -10458,7 +10431,7 @@ Index: binutils-2.21.1/opcodes/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13350,12 +14015,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -13344,12 +14009,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -10472,7 +10445,7 @@ Index: binutils-2.21.1/opcodes/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13410,8 +14075,13 @@ reload_flag \
+@@ -13404,8 +14069,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -10486,7 +10459,7 @@ Index: binutils-2.21.1/opcodes/configure
  STRIP \
  RANLIB \
  CC \
-@@ -13421,12 +14091,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13415,12 +14085,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -10502,7 +10475,7 @@ Index: binutils-2.21.1/opcodes/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13442,7 +14114,6 @@ no_undefined_flag \
+@@ -13436,7 +14108,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -10510,7 +10483,7 @@ Index: binutils-2.21.1/opcodes/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13478,6 +14149,7 @@ module_cmds \
+@@ -13472,6 +14143,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -10518,7 +10491,7 @@ Index: binutils-2.21.1/opcodes/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14234,7 +14906,8 @@ $as_echo X"$file" |
+@@ -14228,7 +14900,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -10528,7 +10501,7 @@ Index: binutils-2.21.1/opcodes/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14337,19 +15010,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14331,19 +15004,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -10572,7 +10545,7 @@ Index: binutils-2.21.1/opcodes/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14379,6 +15075,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -14373,6 +15069,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -10585,7 +10558,7 @@ Index: binutils-2.21.1/opcodes/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14388,6 +15090,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14382,6 +15084,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -10595,7 +10568,7 @@ Index: binutils-2.21.1/opcodes/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14502,12 +15207,12 @@ with_gcc=$GCC
+@@ -14496,12 +15201,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -10611,7 +10584,7 @@ Index: binutils-2.21.1/opcodes/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14594,9 +15299,6 @@ inherit_rpath=$inherit_rpath
+@@ -14588,9 +15293,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10621,7 +10594,7 @@ Index: binutils-2.21.1/opcodes/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14612,6 +15314,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14606,6 +15308,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10631,7 +10604,7 @@ Index: binutils-2.21.1/opcodes/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14644,210 +15349,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14638,210 +15343,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -11002,11 +10975,11 @@ Index: binutils-2.21.1/opcodes/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/binutils/configure
+Index: binutils-2.22/binutils/configure
 ===================================================================
---- binutils-2.21.1.orig/binutils/configure
-+++ binutils-2.21.1/binutils/configure
-@@ -654,8 +654,11 @@ OTOOL
+--- binutils-2.22.orig/binutils/configure
++++ binutils-2.22/binutils/configure
+@@ -655,8 +655,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -11018,7 +10991,7 @@ Index: binutils-2.21.1/binutils/configure
  OBJDUMP
  LN_S
  NM
-@@ -768,6 +771,7 @@ enable_static
+@@ -769,6 +772,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -11026,7 +10999,7 @@ Index: binutils-2.21.1/binutils/configure
  enable_libtool_lock
  enable_targets
  enable_werror
-@@ -1429,6 +1433,8 @@ Optional Packages:
+@@ -1430,6 +1434,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -11035,7 +11008,7 @@ Index: binutils-2.21.1/binutils/configure
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
    --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
    --without-libiconv-prefix     don't search for libiconv in includedir and libdir
-@@ -5146,8 +5152,8 @@ esac
+@@ -5147,8 +5153,8 @@ esac
  
  
  
@@ -11046,7 +11019,7 @@ Index: binutils-2.21.1/binutils/configure
  
  
  
-@@ -5187,7 +5193,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5188,7 +5194,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -11055,7 +11028,7 @@ Index: binutils-2.21.1/binutils/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5873,8 +5879,8 @@ $as_echo_n "checking whether the shell u
+@@ -5874,8 +5880,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -11066,7 +11039,7 @@ Index: binutils-2.21.1/binutils/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5923,6 +5929,80 @@ esac
+@@ -5924,6 +5930,80 @@ esac
  
  
  
@@ -11147,7 +11120,7 @@ Index: binutils-2.21.1/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -5939,6 +6019,11 @@ case $reload_flag in
+@@ -5940,6 +6020,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -11159,7 +11132,7 @@ Index: binutils-2.21.1/binutils/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6107,7 +6192,8 @@ mingw* | pw32*)
+@@ -6108,7 +6193,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -11169,7 +11142,7 @@ Index: binutils-2.21.1/binutils/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6261,6 +6347,21 @@ esac
+@@ -6262,6 +6348,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -11191,7 +11164,7 @@ Index: binutils-2.21.1/binutils/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6276,9 +6377,162 @@ test -z "$deplibs_check_method" && depli
+@@ -6277,9 +6378,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -11356,7 +11329,7 @@ Index: binutils-2.21.1/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -6294,7 +6548,7 @@ do
+@@ -6295,7 +6549,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -11365,7 +11338,7 @@ Index: binutils-2.21.1/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6314,11 +6568,15 @@ $as_echo "no" >&6; }
+@@ -6315,11 +6569,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -11384,7 +11357,7 @@ Index: binutils-2.21.1/binutils/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -6334,7 +6592,7 @@ do
+@@ -6335,7 +6593,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -11393,7 +11366,7 @@ Index: binutils-2.21.1/binutils/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6353,6 +6611,10 @@ else
+@@ -6354,6 +6612,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -11404,7 +11377,7 @@ Index: binutils-2.21.1/binutils/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6364,12 +6626,10 @@ ac_tool_warned=yes ;;
+@@ -6365,12 +6627,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -11419,7 +11392,7 @@ Index: binutils-2.21.1/binutils/configure
  
  
  
-@@ -6381,6 +6641,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6382,6 +6642,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -11484,7 +11457,7 @@ Index: binutils-2.21.1/binutils/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6715,8 +7033,8 @@ esac
+@@ -6716,8 +7034,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -11495,7 +11468,7 @@ Index: binutils-2.21.1/binutils/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6752,6 +7070,7 @@ for ac_symprfx in "" "_"; do
+@@ -6753,6 +7071,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -11503,7 +11476,7 @@ Index: binutils-2.21.1/binutils/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6793,6 +7112,18 @@ _LT_EOF
+@@ -6794,6 +7113,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -11522,7 +11495,7 @@ Index: binutils-2.21.1/binutils/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6804,7 +7135,7 @@ _LT_EOF
+@@ -6805,7 +7136,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -11531,7 +11504,7 @@ Index: binutils-2.21.1/binutils/configure
    const char *name;
    void       *address;
  }
-@@ -6830,8 +7161,8 @@ static const void *lt_preloaded_setup() 
+@@ -6831,8 +7162,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -11542,7 +11515,7 @@ Index: binutils-2.21.1/binutils/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6841,8 +7172,8 @@ _LT_EOF
+@@ -6842,8 +7173,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -11553,7 +11526,7 @@ Index: binutils-2.21.1/binutils/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6879,6 +7210,19 @@ else
+@@ -6880,6 +7211,19 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -11573,7 +11546,7 @@ Index: binutils-2.21.1/binutils/configure
  
  
  
-@@ -6899,6 +7243,42 @@ fi
+@@ -6900,6 +7244,42 @@ fi
  
  
  
@@ -11616,7 +11589,7 @@ Index: binutils-2.21.1/binutils/configure
  
  # Check whether --enable-libtool-lock was given.
  if test "${enable_libtool_lock+set}" = set; then :
-@@ -7093,6 +7473,123 @@ esac
+@@ -7094,6 +7474,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -11740,7 +11713,7 @@ Index: binutils-2.21.1/binutils/configure
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7656,6 +8153,8 @@ _LT_EOF
+@@ -7657,6 +8154,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -11749,7 +11722,7 @@ Index: binutils-2.21.1/binutils/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7851,7 +8350,8 @@ fi
+@@ -7852,7 +8351,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -11759,7 +11732,7 @@ Index: binutils-2.21.1/binutils/configure
  
  
  
-@@ -7940,7 +8440,7 @@ aix3*)
+@@ -7941,7 +8441,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -11768,7 +11741,7 @@ Index: binutils-2.21.1/binutils/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -8238,8 +8738,6 @@ fi
+@@ -8239,8 +8739,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -11777,7 +11750,7 @@ Index: binutils-2.21.1/binutils/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8404,6 +8902,12 @@ $as_echo_n "checking for $compiler optio
+@@ -8405,6 +8903,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -11790,7 +11763,7 @@ Index: binutils-2.21.1/binutils/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8466,7 +8970,7 @@ $as_echo_n "checking for $compiler optio
+@@ -8467,7 +8971,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -11799,7 +11772,7 @@ Index: binutils-2.21.1/binutils/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8523,13 +9027,17 @@ case $host_os in
+@@ -8524,13 +9028,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -11823,7 +11796,7 @@ Index: binutils-2.21.1/binutils/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8590,6 +9098,11 @@ fi
+@@ -8591,6 +9099,11 @@ fi
  
  
  
@@ -11835,7 +11808,7 @@ Index: binutils-2.21.1/binutils/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8940,7 +9453,8 @@ _LT_EOF
+@@ -8941,7 +9454,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -11845,7 +11818,7 @@ Index: binutils-2.21.1/binutils/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8988,7 +9502,7 @@ _LT_EOF
+@@ -8989,7 +9503,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -11854,7 +11827,7 @@ Index: binutils-2.21.1/binutils/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9039,12 +9553,12 @@ _LT_EOF
+@@ -9040,12 +9554,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -11869,7 +11842,7 @@ Index: binutils-2.21.1/binutils/configure
  	  fi
  	  ;;
  	esac
-@@ -9058,8 +9572,8 @@ _LT_EOF
+@@ -9059,8 +9573,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -11880,7 +11853,7 @@ Index: binutils-2.21.1/binutils/configure
        fi
        ;;
  
-@@ -9077,8 +9591,8 @@ _LT_EOF
+@@ -9078,8 +9592,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11891,7 +11864,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9124,8 +9638,8 @@ _LT_EOF
+@@ -9125,8 +9639,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -11902,7 +11875,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	ld_shlibs=no
        fi
-@@ -9255,7 +9769,13 @@ _LT_EOF
+@@ -9256,7 +9770,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -11917,7 +11890,7 @@ Index: binutils-2.21.1/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9268,22 +9788,29 @@ main ()
+@@ -9269,22 +9789,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -11960,7 +11933,7 @@ Index: binutils-2.21.1/binutils/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9295,7 +9822,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9296,7 +9823,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -11975,7 +11948,7 @@ Index: binutils-2.21.1/binutils/configure
  /* end confdefs.h.  */
  
  int
-@@ -9308,22 +9841,29 @@ main ()
+@@ -9309,22 +9842,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -12018,7 +11991,7 @@ Index: binutils-2.21.1/binutils/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9368,20 +9908,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9369,20 +9909,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -12096,7 +12069,7 @@ Index: binutils-2.21.1/binutils/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9446,7 +10029,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9443,7 +10026,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -12105,7 +12078,7 @@ Index: binutils-2.21.1/binutils/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9454,7 +10037,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9451,7 +10034,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -12114,7 +12087,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9470,7 +10053,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9467,7 +10050,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -12123,7 +12096,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9494,10 +10077,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9491,10 +10074,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -12136,7 +12109,7 @@ Index: binutils-2.21.1/binutils/configure
  	  ;;
  	esac
        else
-@@ -9576,23 +10159,36 @@ fi
+@@ -9573,23 +10156,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -12181,7 +12154,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9677,7 +10273,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9674,7 +10270,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -12190,7 +12163,7 @@ Index: binutils-2.21.1/binutils/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9696,9 +10292,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9693,9 +10289,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -12202,7 +12175,7 @@ Index: binutils-2.21.1/binutils/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10274,8 +10870,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10271,8 +10867,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -12214,7 +12187,7 @@ Index: binutils-2.21.1/binutils/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10308,13 +10905,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10305,13 +10902,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -12287,7 +12260,7 @@ Index: binutils-2.21.1/binutils/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10410,7 +11065,7 @@ haiku*)
+@@ -10403,7 +11058,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -12296,16 +12269,16 @@ Index: binutils-2.21.1/binutils/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11206,7 +11861,7 @@ else
+@@ -11199,7 +11854,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11209 "configure"
+-#line 11202 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11250,10 +11905,10 @@ else
+@@ -11243,10 +11898,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12318,16 +12291,16 @@ Index: binutils-2.21.1/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11312,7 +11967,7 @@ else
+@@ -11305,7 +11960,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11315 "configure"
+-#line 11308 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11356,10 +12011,10 @@ else
+@@ -11349,10 +12004,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -12340,7 +12313,7 @@ Index: binutils-2.21.1/binutils/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14754,13 +15409,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -14784,13 +15439,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -12361,7 +12334,7 @@ Index: binutils-2.21.1/binutils/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14775,14 +15437,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -14805,14 +15467,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -12380,7 +12353,7 @@ Index: binutils-2.21.1/binutils/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14815,12 +15480,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -14845,12 +15510,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -12394,7 +12367,7 @@ Index: binutils-2.21.1/binutils/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -14875,8 +15540,13 @@ reload_flag \
+@@ -14905,8 +15570,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -12408,7 +12381,7 @@ Index: binutils-2.21.1/binutils/configure
  STRIP \
  RANLIB \
  CC \
-@@ -14886,12 +15556,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -14916,12 +15586,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -12424,7 +12397,7 @@ Index: binutils-2.21.1/binutils/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -14907,7 +15579,6 @@ no_undefined_flag \
+@@ -14937,7 +15609,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -12432,7 +12405,7 @@ Index: binutils-2.21.1/binutils/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -14943,6 +15614,7 @@ module_cmds \
+@@ -14973,6 +15644,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -12440,7 +12413,7 @@ Index: binutils-2.21.1/binutils/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15700,7 +16372,8 @@ $as_echo X"$file" |
+@@ -15730,7 +16402,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -12450,7 +12423,7 @@ Index: binutils-2.21.1/binutils/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15803,19 +16476,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15833,19 +16506,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -12494,7 +12467,7 @@ Index: binutils-2.21.1/binutils/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15845,6 +16541,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -15875,6 +16571,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -12507,7 +12480,7 @@ Index: binutils-2.21.1/binutils/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15854,6 +16556,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -15884,6 +16586,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -12517,7 +12490,7 @@ Index: binutils-2.21.1/binutils/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15968,12 +16673,12 @@ with_gcc=$GCC
+@@ -15998,12 +16703,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -12533,7 +12506,7 @@ Index: binutils-2.21.1/binutils/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16060,9 +16765,6 @@ inherit_rpath=$inherit_rpath
+@@ -16090,9 +16795,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -12543,7 +12516,7 @@ Index: binutils-2.21.1/binutils/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16078,6 +16780,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16108,6 +16810,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -12553,7 +12526,7 @@ Index: binutils-2.21.1/binutils/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16110,210 +16815,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16140,210 +16845,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -12924,10 +12897,10 @@ Index: binutils-2.21.1/binutils/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/gas/configure
+Index: binutils-2.22/gas/configure
 ===================================================================
---- binutils-2.21.1.orig/gas/configure
-+++ binutils-2.21.1/gas/configure
+--- binutils-2.22.orig/gas/configure
++++ binutils-2.22/gas/configure
 @@ -645,8 +645,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -14015,7 +13988,7 @@ Index: binutils-2.21.1/gas/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9435,7 +10018,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9431,7 +10014,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14024,7 +13997,7 @@ Index: binutils-2.21.1/gas/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9443,7 +10026,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9439,7 +10022,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14033,7 +14006,7 @@ Index: binutils-2.21.1/gas/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9459,7 +10042,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9455,7 +10038,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14042,7 +14015,7 @@ Index: binutils-2.21.1/gas/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9483,10 +10066,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9479,10 +10062,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14055,7 +14028,7 @@ Index: binutils-2.21.1/gas/configure
  	  ;;
  	esac
        else
-@@ -9565,23 +10148,36 @@ fi
+@@ -9561,23 +10144,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14100,7 +14073,7 @@ Index: binutils-2.21.1/gas/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9666,7 +10262,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9662,7 +10258,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14109,7 +14082,7 @@ Index: binutils-2.21.1/gas/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9685,9 +10281,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9681,9 +10277,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14121,7 +14094,7 @@ Index: binutils-2.21.1/gas/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10263,8 +10859,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10259,8 +10855,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14133,7 +14106,7 @@ Index: binutils-2.21.1/gas/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10297,13 +10894,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10293,13 +10890,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14206,7 +14179,7 @@ Index: binutils-2.21.1/gas/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10399,7 +11054,7 @@ haiku*)
+@@ -10391,7 +11046,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -14215,16 +14188,16 @@ Index: binutils-2.21.1/gas/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11195,7 +11850,7 @@ else
+@@ -11187,7 +11842,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11198 "configure"
+-#line 11190 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11239,10 +11894,10 @@ else
+@@ -11231,10 +11886,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14237,16 +14210,16 @@ Index: binutils-2.21.1/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11301,7 +11956,7 @@ else
+@@ -11293,7 +11948,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11304 "configure"
+-#line 11296 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11345,10 +12000,10 @@ else
+@@ -11337,10 +11992,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14259,7 +14232,7 @@ Index: binutils-2.21.1/gas/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14941,13 +15596,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -14939,13 +15594,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -14280,7 +14253,7 @@ Index: binutils-2.21.1/gas/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14962,14 +15624,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -14960,14 +15622,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -14299,7 +14272,7 @@ Index: binutils-2.21.1/gas/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15002,12 +15667,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -15000,12 +15665,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -14313,7 +14286,7 @@ Index: binutils-2.21.1/gas/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15062,8 +15727,13 @@ reload_flag \
+@@ -15060,8 +15725,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -14327,7 +14300,7 @@ Index: binutils-2.21.1/gas/configure
  STRIP \
  RANLIB \
  CC \
-@@ -15073,12 +15743,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -15071,12 +15741,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -14343,7 +14316,7 @@ Index: binutils-2.21.1/gas/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15094,7 +15766,6 @@ no_undefined_flag \
+@@ -15092,7 +15764,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -14351,7 +14324,7 @@ Index: binutils-2.21.1/gas/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15130,6 +15801,7 @@ module_cmds \
+@@ -15128,6 +15799,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -14359,7 +14332,7 @@ Index: binutils-2.21.1/gas/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15894,7 +16566,8 @@ $as_echo X"$file" |
+@@ -15892,7 +16564,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -14369,7 +14342,7 @@ Index: binutils-2.21.1/gas/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15997,19 +16670,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15995,19 +16668,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -14413,7 +14386,7 @@ Index: binutils-2.21.1/gas/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16039,6 +16735,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -16037,6 +16733,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -14426,7 +14399,7 @@ Index: binutils-2.21.1/gas/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16048,6 +16750,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -16046,6 +16748,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -14436,7 +14409,7 @@ Index: binutils-2.21.1/gas/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16162,12 +16867,12 @@ with_gcc=$GCC
+@@ -16160,12 +16865,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -14452,7 +14425,7 @@ Index: binutils-2.21.1/gas/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16254,9 +16959,6 @@ inherit_rpath=$inherit_rpath
+@@ -16252,9 +16957,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -14462,7 +14435,7 @@ Index: binutils-2.21.1/gas/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16272,6 +16974,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16270,6 +16972,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -14472,7 +14445,7 @@ Index: binutils-2.21.1/gas/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16304,210 +17009,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16302,210 +17007,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -14843,10 +14816,10 @@ Index: binutils-2.21.1/gas/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/gprof/configure
+Index: binutils-2.22/gprof/configure
 ===================================================================
---- binutils-2.21.1.orig/gprof/configure
-+++ binutils-2.21.1/gprof/configure
+--- binutils-2.22.orig/gprof/configure
++++ binutils-2.22/gprof/configure
 @@ -629,8 +629,11 @@ OTOOL
  LIPO
  NMEDIT
@@ -15946,7 +15919,7 @@ Index: binutils-2.21.1/gprof/configure
        ;;
  
      darwin* | rhapsody*)
-@@ -9370,7 +9948,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9366,7 +9944,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -15955,7 +15928,7 @@ Index: binutils-2.21.1/gprof/configure
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9378,7 +9956,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9374,7 +9952,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -15964,7 +15937,7 @@ Index: binutils-2.21.1/gprof/configure
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9394,7 +9972,7 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9390,7 +9968,7 @@ if test -z "$aix_libpath"; then aix_libp
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -15973,7 +15946,7 @@ Index: binutils-2.21.1/gprof/configure
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9418,10 +9996,10 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -9414,10 +9992,10 @@ if test -z "$aix_libpath"; then aix_libp
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -15986,7 +15959,7 @@ Index: binutils-2.21.1/gprof/configure
  	  ;;
  	esac
        else
-@@ -9500,23 +10078,36 @@ fi
+@@ -9496,23 +10074,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -16031,7 +16004,7 @@ Index: binutils-2.21.1/gprof/configure
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9601,7 +10192,7 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9597,7 +10188,7 @@ rm -f core conftest.err conftest.$ac_obj
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -16040,7 +16013,7 @@ Index: binutils-2.21.1/gprof/configure
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9620,9 +10211,9 @@ rm -f core conftest.err conftest.$ac_obj
+@@ -9616,9 +10207,9 @@ rm -f core conftest.err conftest.$ac_obj
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -16052,7 +16025,7 @@ Index: binutils-2.21.1/gprof/configure
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10198,8 +10789,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10194,8 +10785,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -16064,7 +16037,7 @@ Index: binutils-2.21.1/gprof/configure
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10232,13 +10824,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10228,13 +10820,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -16137,7 +16110,7 @@ Index: binutils-2.21.1/gprof/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10334,7 +10984,7 @@ haiku*)
+@@ -10326,7 +10976,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -16146,16 +16119,16 @@ Index: binutils-2.21.1/gprof/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -11130,7 +11780,7 @@ else
+@@ -11122,7 +11772,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11128 "configure"
+-#line 11120 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11174,10 +11824,10 @@ else
+@@ -11166,10 +11816,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16168,16 +16141,16 @@ Index: binutils-2.21.1/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11236,7 +11886,7 @@ else
+@@ -11228,7 +11878,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11234 "configure"
+-#line 11226 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11280,10 +11930,10 @@ else
+@@ -11272,10 +11922,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -16190,7 +16163,7 @@ Index: binutils-2.21.1/gprof/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12825,13 +13475,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -12817,13 +13467,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -16211,7 +16184,7 @@ Index: binutils-2.21.1/gprof/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -12846,14 +13503,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -12838,14 +13495,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -16230,7 +16203,7 @@ Index: binutils-2.21.1/gprof/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -12886,12 +13546,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -12878,12 +13538,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -16244,7 +16217,7 @@ Index: binutils-2.21.1/gprof/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -12946,8 +13606,13 @@ reload_flag \
+@@ -12938,8 +13598,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -16258,7 +16231,7 @@ Index: binutils-2.21.1/gprof/configure
  STRIP \
  RANLIB \
  CC \
-@@ -12957,12 +13622,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -12949,12 +13614,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -16274,7 +16247,7 @@ Index: binutils-2.21.1/gprof/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -12978,7 +13645,6 @@ no_undefined_flag \
+@@ -12970,7 +13637,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -16282,7 +16255,7 @@ Index: binutils-2.21.1/gprof/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13014,6 +13680,7 @@ module_cmds \
+@@ -13006,6 +13672,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -16290,7 +16263,7 @@ Index: binutils-2.21.1/gprof/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -13770,7 +14437,8 @@ $as_echo X"$file" |
+@@ -13762,7 +14429,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -16300,7 +16273,7 @@ Index: binutils-2.21.1/gprof/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -13873,19 +14541,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -13865,19 +14533,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -16344,7 +16317,7 @@ Index: binutils-2.21.1/gprof/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -13915,6 +14606,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -13907,6 +14598,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -16357,7 +16330,7 @@ Index: binutils-2.21.1/gprof/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -13924,6 +14621,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -13916,6 +14613,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -16367,7 +16340,7 @@ Index: binutils-2.21.1/gprof/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14038,12 +14738,12 @@ with_gcc=$GCC
+@@ -14030,12 +14730,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -16383,7 +16356,7 @@ Index: binutils-2.21.1/gprof/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14130,9 +14830,6 @@ inherit_rpath=$inherit_rpath
+@@ -14122,9 +14822,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -16393,7 +16366,7 @@ Index: binutils-2.21.1/gprof/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14148,6 +14845,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14140,6 +14837,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -16403,7 +16376,7 @@ Index: binutils-2.21.1/gprof/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14180,210 +14880,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14172,210 +14872,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -16774,11 +16747,11 @@ Index: binutils-2.21.1/gprof/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/ld/configure
+Index: binutils-2.22/ld/configure
 ===================================================================
---- binutils-2.21.1.orig/ld/configure
-+++ binutils-2.21.1/ld/configure
-@@ -644,8 +644,11 @@ OTOOL
+--- binutils-2.22.orig/ld/configure
++++ binutils-2.22/ld/configure
+@@ -645,8 +645,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -16790,15 +16763,15 @@ Index: binutils-2.21.1/ld/configure
  OBJDUMP
  LN_S
  NM
-@@ -783,6 +786,7 @@ enable_static
+@@ -784,6 +787,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
 +with_libtool_sysroot
  enable_libtool_lock
  enable_nls
- '
-@@ -1447,6 +1451,8 @@ Optional Packages:
+ enable_initfini_array
+@@ -1450,6 +1454,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -16807,7 +16780,7 @@ Index: binutils-2.21.1/ld/configure
  
  Some influential environment variables:
    CC          C compiler command
-@@ -6081,8 +6087,8 @@ esac
+@@ -6085,8 +6091,8 @@ esac
  
  
  
@@ -16818,7 +16791,7 @@ Index: binutils-2.21.1/ld/configure
  
  
  
-@@ -6122,7 +6128,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -6126,7 +6132,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -16827,7 +16800,7 @@ Index: binutils-2.21.1/ld/configure
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6808,8 +6814,8 @@ $as_echo_n "checking whether the shell u
+@@ -6812,8 +6818,8 @@ $as_echo_n "checking whether the shell u
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -16838,7 +16811,7 @@ Index: binutils-2.21.1/ld/configure
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6858,6 +6864,80 @@ esac
+@@ -6862,6 +6868,80 @@ esac
  
  
  
@@ -16919,7 +16892,7 @@ Index: binutils-2.21.1/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if test "${lt_cv_ld_reload_flag+set}" = set; then :
-@@ -6874,6 +6954,11 @@ case $reload_flag in
+@@ -6878,6 +6958,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -16931,7 +16904,7 @@ Index: binutils-2.21.1/ld/configure
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -7042,7 +7127,8 @@ mingw* | pw32*)
+@@ -7046,7 +7131,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -16941,7 +16914,7 @@ Index: binutils-2.21.1/ld/configure
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -7196,6 +7282,21 @@ esac
+@@ -7200,6 +7286,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -16963,7 +16936,7 @@ Index: binutils-2.21.1/ld/configure
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -7211,9 +7312,162 @@ test -z "$deplibs_check_method" && depli
+@@ -7215,9 +7316,162 @@ test -z "$deplibs_check_method" && depli
  
  
  
@@ -17128,7 +17101,7 @@ Index: binutils-2.21.1/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_AR+set}" = set; then :
-@@ -7229,7 +7483,7 @@ do
+@@ -7233,7 +7487,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17137,7 +17110,7 @@ Index: binutils-2.21.1/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7249,11 +7503,15 @@ $as_echo "no" >&6; }
+@@ -7253,11 +7507,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -17156,7 +17129,7 @@ Index: binutils-2.21.1/ld/configure
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if test "${ac_cv_prog_ac_ct_AR+set}" = set; then :
-@@ -7269,7 +7527,7 @@ do
+@@ -7273,7 +7531,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
@@ -17165,7 +17138,7 @@ Index: binutils-2.21.1/ld/configure
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -7288,6 +7546,10 @@ else
+@@ -7292,6 +7550,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -17176,7 +17149,7 @@ Index: binutils-2.21.1/ld/configure
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -7299,12 +7561,10 @@ ac_tool_warned=yes ;;
+@@ -7303,12 +7565,10 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -17191,7 +17164,7 @@ Index: binutils-2.21.1/ld/configure
  
  
  
-@@ -7316,6 +7576,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -7320,6 +7580,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -17256,7 +17229,7 @@ Index: binutils-2.21.1/ld/configure
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -7650,8 +7968,8 @@ esac
+@@ -7654,8 +7972,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -17267,7 +17240,7 @@ Index: binutils-2.21.1/ld/configure
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7687,6 +8005,7 @@ for ac_symprfx in "" "_"; do
+@@ -7691,6 +8009,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -17275,7 +17248,7 @@ Index: binutils-2.21.1/ld/configure
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7728,6 +8047,18 @@ _LT_EOF
+@@ -7732,6 +8051,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -17294,7 +17267,7 @@ Index: binutils-2.21.1/ld/configure
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7739,7 +8070,7 @@ _LT_EOF
+@@ -7743,7 +8074,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -17303,7 +17276,7 @@ Index: binutils-2.21.1/ld/configure
    const char *name;
    void       *address;
  }
-@@ -7765,8 +8096,8 @@ static const void *lt_preloaded_setup() 
+@@ -7769,8 +8100,8 @@ static const void *lt_preloaded_setup() 
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -17314,7 +17287,7 @@ Index: binutils-2.21.1/ld/configure
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7776,8 +8107,8 @@ _LT_EOF
+@@ -7780,8 +8111,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -17325,7 +17298,7 @@ Index: binutils-2.21.1/ld/configure
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7814,6 +8145,21 @@ else
+@@ -7818,6 +8149,21 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -17347,7 +17320,7 @@ Index: binutils-2.21.1/ld/configure
  
  
  
-@@ -7832,6 +8178,40 @@ fi
+@@ -7836,6 +8182,40 @@ fi
  
  
  
@@ -17388,7 +17361,7 @@ Index: binutils-2.21.1/ld/configure
  
  
  
-@@ -8022,11 +8402,128 @@ sparc*-*solaris*)
+@@ -8026,11 +8406,128 @@ sparc*-*solaris*)
        ;;
      esac
    fi
@@ -17520,7 +17493,7 @@ Index: binutils-2.21.1/ld/configure
  
  
    case $host_os in
-@@ -8591,6 +9088,8 @@ _LT_EOF
+@@ -8595,6 +9092,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -17529,7 +17502,7 @@ Index: binutils-2.21.1/ld/configure
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8787,7 +9286,8 @@ fi
+@@ -8791,7 +9290,8 @@ fi
  LIBTOOL_DEPS="$ltmain"
  
  # Always use our own libtool.
@@ -17539,7 +17512,7 @@ Index: binutils-2.21.1/ld/configure
  
  
  
-@@ -8876,7 +9376,7 @@ aix3*)
+@@ -8880,7 +9380,7 @@ aix3*)
  esac
  
  # Global variables:
@@ -17548,7 +17521,7 @@ Index: binutils-2.21.1/ld/configure
  can_build_shared=yes
  
  # All known linkers require a `.a' archive for static linking (except MSVC,
-@@ -9174,8 +9674,6 @@ fi
+@@ -9178,8 +9678,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -17557,7 +17530,7 @@ Index: binutils-2.21.1/ld/configure
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -9340,6 +9838,12 @@ $as_echo_n "checking for $compiler optio
+@@ -9344,6 +9842,12 @@ $as_echo_n "checking for $compiler optio
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -17570,7 +17543,7 @@ Index: binutils-2.21.1/ld/configure
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -9402,7 +9906,7 @@ $as_echo_n "checking for $compiler optio
+@@ -9406,7 +9910,7 @@ $as_echo_n "checking for $compiler optio
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -17579,7 +17552,7 @@ Index: binutils-2.21.1/ld/configure
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9459,13 +9963,17 @@ case $host_os in
+@@ -9463,13 +9967,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -17603,7 +17576,7 @@ Index: binutils-2.21.1/ld/configure
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9526,6 +10034,11 @@ fi
+@@ -9530,6 +10038,11 @@ fi
  
  
  
@@ -17615,7 +17588,7 @@ Index: binutils-2.21.1/ld/configure
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9876,7 +10389,8 @@ _LT_EOF
+@@ -9880,7 +10393,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -17625,7 +17598,7 @@ Index: binutils-2.21.1/ld/configure
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9924,7 +10438,7 @@ _LT_EOF
+@@ -9928,7 +10442,7 @@ _LT_EOF
        if $LD --help 2>&1 | $EGREP ': supported targets:.* elf' > /dev/null \
  	 && test "$tmp_diet" = no
        then
@@ -17634,7 +17607,7 @@ Index: binutils-2.21.1/ld/configure
  	tmp_sharedflag='-shared'
  	case $cc_basename,$host_cpu in
          pgcc*)				# Portland Group C compiler
-@@ -9975,12 +10489,12 @@ _LT_EOF
+@@ -9979,12 +10493,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -17649,7 +17622,7 @@ Index: binutils-2.21.1/ld/configure
  	  fi
  	  ;;
  	esac
-@@ -9994,8 +10508,8 @@ _LT_EOF
+@@ -9998,8 +10512,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -17660,7 +17633,7 @@ Index: binutils-2.21.1/ld/configure
        fi
        ;;
  
-@@ -10013,8 +10527,8 @@ _LT_EOF
+@@ -10017,8 +10531,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17671,7 +17644,7 @@ Index: binutils-2.21.1/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -10060,8 +10574,8 @@ _LT_EOF
+@@ -10064,8 +10578,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -17682,7 +17655,7 @@ Index: binutils-2.21.1/ld/configure
        else
  	ld_shlibs=no
        fi
-@@ -10191,7 +10705,13 @@ _LT_EOF
+@@ -10195,7 +10709,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -17697,7 +17670,7 @@ Index: binutils-2.21.1/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -10204,22 +10724,29 @@ main ()
+@@ -10208,22 +10728,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17740,7 +17713,7 @@ Index: binutils-2.21.1/ld/configure
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -10231,7 +10758,13 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10235,7 +10762,13 @@ if test -z "$aix_libpath"; then aix_libp
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -17755,7 +17728,7 @@ Index: binutils-2.21.1/ld/configure
  /* end confdefs.h.  */
  
  int
-@@ -10244,22 +10777,29 @@ main ()
+@@ -10248,22 +10781,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -17798,7 +17771,7 @@ Index: binutils-2.21.1/ld/configure
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -10304,20 +10844,63 @@ if test -z "$aix_libpath"; then aix_libp
+@@ -10308,20 +10848,63 @@ if test -z "$aix_libpath"; then aix_libp
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -18067,7 +18040,7 @@ Index: binutils-2.21.1/ld/configure
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11346,7 +12001,7 @@ haiku*)
+@@ -11342,7 +11997,7 @@ haiku*)
    soname_spec='${libname}${release}${shared_ext}$major'
    shlibpath_var=LIBRARY_PATH
    shlibpath_overrides_runpath=yes
@@ -18076,16 +18049,16 @@ Index: binutils-2.21.1/ld/configure
    hardcode_into_libs=yes
    ;;
  
-@@ -12142,7 +12797,7 @@ else
+@@ -12138,7 +12793,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12145 "configure"
+-#line 12141 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12186,10 +12841,10 @@ else
+@@ -12182,10 +12837,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18098,16 +18071,16 @@ Index: binutils-2.21.1/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12248,7 +12903,7 @@ else
+@@ -12244,7 +12899,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 12251 "configure"
+-#line 12247 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -12292,10 +12947,10 @@ else
+@@ -12288,10 +12943,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -18120,7 +18093,7 @@ Index: binutils-2.21.1/ld/configure
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17606,13 +18261,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
+@@ -17646,13 +18301,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -18141,7 +18114,7 @@ Index: binutils-2.21.1/ld/configure
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17627,14 +18289,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
+@@ -17667,14 +18329,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$l
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -18160,7 +18133,7 @@ Index: binutils-2.21.1/ld/configure
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17667,12 +18332,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
+@@ -17707,12 +18372,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcod
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -18174,7 +18147,7 @@ Index: binutils-2.21.1/ld/configure
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17782,8 +18447,13 @@ reload_flag \
+@@ -17822,8 +18487,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -18188,7 +18161,7 @@ Index: binutils-2.21.1/ld/configure
  STRIP \
  RANLIB \
  CC \
-@@ -17793,12 +18463,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17833,12 +18503,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -18204,7 +18177,7 @@ Index: binutils-2.21.1/ld/configure
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17814,7 +18486,6 @@ no_undefined_flag \
+@@ -17854,7 +18526,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -18212,7 +18185,7 @@ Index: binutils-2.21.1/ld/configure
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17883,6 +18554,7 @@ module_cmds \
+@@ -17923,6 +18594,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -18220,7 +18193,7 @@ Index: binutils-2.21.1/ld/configure
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18690,7 +19362,8 @@ $as_echo X"$file" |
+@@ -18730,7 +19402,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -18230,7 +18203,7 @@ Index: binutils-2.21.1/ld/configure
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18793,19 +19466,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18833,19 +19506,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -18274,7 +18247,7 @@ Index: binutils-2.21.1/ld/configure
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18835,6 +19531,12 @@ global_symbol_to_c_name_address=$lt_lt_c
+@@ -18875,6 +19571,12 @@ global_symbol_to_c_name_address=$lt_lt_c
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -18287,7 +18260,7 @@ Index: binutils-2.21.1/ld/configure
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18844,6 +19546,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18884,6 +19586,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -18297,7 +18270,7 @@ Index: binutils-2.21.1/ld/configure
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18958,12 +19663,12 @@ with_gcc=$GCC
+@@ -18998,12 +19703,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -18313,7 +18286,7 @@ Index: binutils-2.21.1/ld/configure
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19050,9 +19755,6 @@ inherit_rpath=$inherit_rpath
+@@ -19090,9 +19795,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -18323,7 +18296,7 @@ Index: binutils-2.21.1/ld/configure
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19068,6 +19770,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19108,6 +19810,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -18333,7 +18306,7 @@ Index: binutils-2.21.1/ld/configure
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19114,210 +19819,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19154,210 +19859,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -18704,10 +18677,10 @@ Index: binutils-2.21.1/ld/configure
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-Index: binutils-2.21.1/bfd/configure.in
+Index: binutils-2.22/bfd/configure.in
 ===================================================================
---- binutils-2.21.1.orig/bfd/configure.in
-+++ binutils-2.21.1/bfd/configure.in
+--- binutils-2.22.orig/bfd/configure.in
++++ binutils-2.22/bfd/configure.in
 @@ -536,7 +536,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
@@ -18717,10 +18690,10 @@ Index: binutils-2.21.1/bfd/configure.in
    fi
  
  # More hacks to build DLLs on Windows.
-Index: binutils-2.21.1/opcodes/configure.in
+Index: binutils-2.22/opcodes/configure.in
 ===================================================================
---- binutils-2.21.1.orig/opcodes/configure.in
-+++ binutils-2.21.1/opcodes/configure.in
+--- binutils-2.22.orig/opcodes/configure.in
++++ binutils-2.22/opcodes/configure.in
 @@ -134,7 +134,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
diff --git a/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch b/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
index 2666d31..4fcffa4 100644
--- a/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
+++ b/meta/recipes-devtools/binutils/binutils/libtool-rpath-fix.patch
@@ -8,10 +8,11 @@ upstream.
 Fix suggested by Richard Purdie <richard.purdie@linuxfoundation.org> 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -urN binutils-2.21.orig//ltmain.sh binutils-2.21/ltmain.sh
---- binutils-2.21.orig//ltmain.sh	2011-01-18 11:50:40.821710085 -0800
-+++ binutils-2.21/ltmain.sh	2011-01-18 11:51:38.774952785 -0800
-@@ -8035,9 +8035,11 @@
+Index: binutils-2.22/ltmain.sh
+===================================================================
+--- binutils-2.22.orig/ltmain.sh
++++ binutils-2.22/ltmain.sh
+@@ -8035,9 +8035,11 @@ EOF
  	  test "$opt_mode" != relink && rpath="$compile_rpath$rpath"
  	  for libdir in $rpath; do
  	    if test -n "$hardcode_libdir_flag_spec"; then
@@ -25,7 +26,7 @@ diff -urN binutils-2.21.orig//ltmain.sh binutils-2.21/ltmain.sh
  		if test -z "$hardcode_libdirs"; then
  		  hardcode_libdirs="$libdir"
  		else
-@@ -8770,6 +8772,10 @@
+@@ -8770,6 +8772,10 @@ EOF
        hardcode_libdirs=
        for libdir in $compile_rpath $finalize_rpath; do
  	if test -n "$hardcode_libdir_flag_spec"; then
diff --git a/meta/recipes-devtools/binutils/binutils_2.21.1a.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
similarity index 84%
rename from meta/recipes-devtools/binutils/binutils_2.21.1a.bb
rename to meta/recipes-devtools/binutils/binutils_2.22.bb
index 2d4ed27..f0ed5e8 100644
--- a/meta/recipes-devtools/binutils/binutils_2.21.1a.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
@@ -18,7 +18,6 @@ LIC_FILES_CHKSUM="\
 SRC_URI = "\
      ${GNU_MIRROR}/binutils/binutils-${PV}.tar.bz2 \
      file://binutils-uclibc-100-uclibc-conf.patch \
-     file://110-arm-eabi-conf.patch \
      file://binutils-uclibc-300-001_ld_makefile_patch.patch \
      file://binutils-uclibc-300-006_better_file_error.patch \
      file://binutils-uclibc-300-012_check_ldrunpath_length.patch \
@@ -33,10 +32,8 @@ SRC_URI = "\
      file://binutils-powerpc-e5500.patch \
      "
 
-SRC_URI[md5sum] = "bde820eac53fa3a8d8696667418557ad"
-SRC_URI[sha256sum] = "cdecfa69f02aa7b05fbcdf678e33137151f361313b2f3e48aba925f64eabf654"
+SRC_URI[md5sum] = "ee0f10756c84979622b992a4a61ea3f5"
+SRC_URI[sha256sum] = "6c7af8ed1c8cf9b4b9d6e6fe09a3e1d3d479fe63984ba8b9b26bf356b6313ca9"
 
-# 2.21.1a has a mismatched dir name within the tarball
-S = "${WORKDIR}/binutils-2.21.1"
 
 BBCLASSEXTEND = "native"
-- 
1.7.6.4



