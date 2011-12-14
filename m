Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ray3D-00074B-0U
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 00:15:51 +0100
Received: by ghrr15 with SMTP id r15so1094487ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2011 15:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=djSB87ZkcdeI8MR7Ol2b4FwuKW/VqVW9Jg80g2W/Q2c=;
	b=buazw4g+ZC65wwWkGjRg0hAY+HBPs3lHlmW8PJ5Z9vmVomd6B5XIUMgOHHON/rEy5A
	2AfNseJ4b8lS8pTWiKylJoXXvpgmESr4A1PRrJ0ipeE27X9lpHs0GzAh/gWFbcGKsnYx
	1NKcUTMUqoFQ0m0L0L0FJ04lXBst0Oi8dmiyc=
Received: by 10.50.149.162 with SMTP id ub2mr423537igb.70.1323904133052;
	Wed, 14 Dec 2011 15:08:53 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id l28sm13569109ibc.3.2011.12.14.15.08.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Dec 2011 15:08:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 15:08:42 -0800
Message-Id: <1323904122-4314-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH V2] gcc-4.6: Let G++ relocate gxx-include-dir when using --sysroot option
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
X-List-Received-Date: Wed, 14 Dec 2011 23:15:51 -0000

Currently we have a problem in our cross compiler since we use
/usr/include/c++ to be default gxx-include-dir and then expect
the patch we did to do the relocation w.r.t. sysroot however it
does not quite work so and we end up gxx-include-dirs not respecting
sysroot. A small test case would be

tst-unique4.cc

and it would fails like

tst-unique4.cc:1:18: fatal error: cstdio: No such file or directory
compilation terminated.

weather we use --sysroot or not it does not matter

arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
--sysroot=/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm

failed in same way.

so we redo the GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch based on upstream
submitted patch which tries to relocate the gxx-include-dir and to
achieve the relocation it has to be specified w.r.t to --with-sysroot
directory. e.g.

--with-sysroot=${SYSROOT}
--with-gxx-include-dir=${SYSROOT}/usr/include/c++

if we configure gcc like above then it becomes relocatable when
we run the compiler and specify --sysroot=<blah> then g++ will search
for gxx-headers under <blah>/usr/include/c++

if sysroot is not defined then it will use the default sysroot
and gxx-include-dir will be w.r.t. default sysroot.

Tested on qemuarm

/arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
--sysroot=/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm
-v
...
 /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm/usr/include/c++
 /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm/usr/include/c++/arm-oe-linux-gnueabi
 /home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm/usr/include/c++/backward
...

and if I now change --sysroot to something else

/arm-oe-linux-gnueabi-g++ -S tst-unique4.cc
--sysroot=/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm4
-v
...

ignoring nonexistent directory
"/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm4/usr/include/c++"
ignoring nonexistent directory
"/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm4/usr/include/c++/arm-oe-linux-gnueabi"
ignoring nonexistent directory
"/home/kraj/work/angstrom/sources/openembedded-core/build/tmp-eglibc/sysroots/qemuarm4/usr/include/c++/backward"
...

See now its looking for them in 'qemuarm4' sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 +-
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |  189 ++++++++++++++++++--
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    2 +-
 4 files changed, 174 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 18e0536..4bbb2d2 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r19"
+PR = "r20"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -62,7 +62,6 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://64bithack.patch \
 	   file://optional_libstdc.patch \
 	   file://disable_relax_pic_calls_flag.patch \
-	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
            file://volatile_access_backport.patch \
            file://use-defaults.h-and-t-oe-in-B.patch \
@@ -73,6 +72,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://pr32219.patch \
 	   file://pr47551.patch \
 	   file://gcc-arm-set-cost.patch \
+	   file://GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
index 05b2fa9..6ccbeea 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.6/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
@@ -1,35 +1,186 @@
-Upstream-Status: Pending
-
-# by default c++ include directories are not relative to "--sysroot"
-# which brings one trouble when using the toolchain in an environment
-# where the build directory generating that toolchain doesn't exist,
-# e.g. in sstate, machine specific sysroot and relocatable SDK
-# toolchain. This patch now enables c++ include paths under sysroot.
-# This way it's enough as long as "--sysroot" is correctly enabled
-# in the new environment.
-#
-# Signed-off-by Kevin Tian <kevin.tian@intel.com>, 2010-12-30
-
-Index: gcc-4.6.0/gcc/cppdefault.c
+source: http://patchwork.ozlabs.org/patch/129800/
+Upstream-Status: Submitted
+
+ChangeLog
+        * Makefile.in (gcc_gxx_include_dir_add_sysroot): New.
+          (PREPROCESSOR_DEFINES): Define GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT.
+
+        * cppdefault.c (cpp_include_defaults): replace hard coded "1" with
+          GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT for "add_sysroot" field.
+
+        * configure.ac (AC_SUBST): Add gcc_gxx_include_dir_add_sysroot to
+          control whether sysroot should be prepended to gxx include dir.
+
+        * configure: Regenerate.
+
+Hi, this is a follow up for issue "http://codereview.appspot.com/4641076".
+
+The rationale for the patch copied from previous thread:
+=======================================
+The setup:
+
+Configuring a toolchain targeting x86-64 GNU Linux (Ubuntu Lucid), as a
+cross-compiler.  Using a sysroot to provide the Lucid headers+libraries,
+with the sysroot path being within the GCC install tree.  Want to use the
+Lucid system libstdc++ and headers, which means that I'm not
+building/installing libstdc++-v3.
+
+So, configuring with:
+  --with-sysroot="$SYSROOT"
+  --disable-libstdc++-v3 \
+  --with-gxx-include-dir="$SYSROOT/usr/include/c++/4.4" \
+(among other options).
+
+Hoping to support two usage models with this configuration, w.r.t. use of
+the sysroot:
+
+(1) somebody installs the sysroot in the normal location relative to the
+GCC install, and relocates the whole bundle (sysroot+GCC).  This works
+great AFAICT, GCC finds its includes (including the C++ includes) thanks
+to the add_standard_paths iprefix handling.
+
+(2) somebody installs the sysroot in a non-standard location, and uses
+--sysroot to try to access it.  This works fine for the C headers, but
+doesn't work.
+
+For the C headers, add_standard_paths prepends the sysroot location to
+the /usr/include path (since that's what's specified in cppdefault.c for
+that path).  It doesn't do the same for the C++ include path, though
+(again, as specified in cppdefault.c).
+
+add_standard_paths doesn't attempt to relocate built-in include paths that
+start with the compiled-in sysroot location (e.g., the g++ include dir, in
+this case).  This isn't surprising really: normally you either prepend the
+sysroot location or you don't (as specified by cppdefault.c); none of the
+built-in paths normally *start* with the sysroot location and need to be
+relocated.  However, in this odd-ball case of trying to use the C++ headers
+from the sysroot, one of the paths *does* need to be relocated in this way.
+===========================
+Index: gcc-4_6-branch/gcc/Makefile.in
+===================================================================
+--- gcc-4_6-branch.orig/gcc/Makefile.in	2011-12-13 22:52:15.000000000 -0800
++++ gcc-4_6-branch/gcc/Makefile.in	2011-12-13 22:52:21.933635767 -0800
+@@ -587,6 +587,7 @@
+ build_tooldir = $(exec_prefix)/$(target_noncanonical)
+ # Directory in which the compiler finds target-independent g++ includes.
+ gcc_gxx_include_dir = @gcc_gxx_include_dir@
++gcc_gxx_include_dir_add_sysroot = @gcc_gxx_include_dir_add_sysroot@
+ # Directory to search for site-specific includes.
+ local_includedir = $(local_prefix)/include
+ includedir = $(prefix)/include
+@@ -3964,6 +3965,7 @@
+   -DGCC_INCLUDE_DIR=\"$(libsubdir)/include\" \
+   -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
+   -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
++  -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+   -DGPLUSPLUS_TOOL_INCLUDE_DIR=\"$(gcc_gxx_include_dir)/$(target_noncanonical)\" \
+   -DGPLUSPLUS_BACKWARD_INCLUDE_DIR=\"$(gcc_gxx_include_dir)/backward\" \
+   -DLOCAL_INCLUDE_DIR=\"$(local_includedir)\" \
+Index: gcc-4_6-branch/gcc/configure.ac
 ===================================================================
---- gcc-4.6.0.orig/gcc/cppdefault.c
-+++ gcc-4.6.0/gcc/cppdefault.c
-@@ -48,15 +48,15 @@ const struct default_include cpp_include
+--- gcc-4_6-branch.orig/gcc/configure.ac	2011-12-13 22:52:15.000000000 -0800
++++ gcc-4_6-branch/gcc/configure.ac	2011-12-13 22:52:21.937635526 -0800
+@@ -144,6 +144,15 @@
+   fi
+ fi
+ 
++gcc_gxx_include_dir_add_sysroot=0
++if test "${with_sysroot+set}" = set; then :
++  gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
++  if test "${gcc_gxx_without_sysroot}"; then :
++    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    gcc_gxx_include_dir_add_sysroot=1
++  fi
++fi
++
+ AC_ARG_WITH(cpp_install_dir,
+ [  --with-cpp-install-dir=DIR
+                           install the user visible C preprocessor in DIR
+@@ -4737,6 +4746,7 @@
+ AC_SUBST(float_h_file)
+ AC_SUBST(gcc_config_arguments)
+ AC_SUBST(gcc_gxx_include_dir)
++AC_SUBST(gcc_gxx_include_dir_add_sysroot)
+ AC_SUBST(host_exeext)
+ AC_SUBST(host_xm_file_list)
+ AC_SUBST(host_xm_include_list)
+Index: gcc-4_6-branch/gcc/cppdefault.c
+===================================================================
+--- gcc-4_6-branch.orig/gcc/cppdefault.c	2011-12-13 22:51:28.000000000 -0800
++++ gcc-4_6-branch/gcc/cppdefault.c	2011-12-13 22:52:21.937635526 -0800
+@@ -48,15 +48,18 @@
  = {
  #ifdef GPLUSPLUS_INCLUDE_DIR
      /* Pick up GNU C++ generic include files.  */
 -    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
-+    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
  #ifdef GPLUSPLUS_TOOL_INCLUDE_DIR
      /* Pick up GNU C++ target-dependent include files.  */
 -    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 0, 1 },
-+    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1, 1, 1 },
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },
  #endif
  #ifdef GPLUSPLUS_BACKWARD_INCLUDE_DIR
      /* Pick up GNU C++ backward and deprecated include files.  */
 -    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 0, 0 },
-+    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1, 1, 0 },
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
  #endif
  #ifdef GCC_INCLUDE_DIR
      /* This is the dir for gcc's private headers.  */
+Index: gcc-4_6-branch/gcc/configure
+===================================================================
+--- gcc-4_6-branch.orig/gcc/configure	2011-12-13 22:52:15.000000000 -0800
++++ gcc-4_6-branch/gcc/configure	2011-12-13 22:52:33.185690436 -0800
+@@ -636,6 +636,7 @@
+ host_xm_include_list
+ host_xm_file_list
+ host_exeext
++gcc_gxx_include_dir_add_sysroot
+ gcc_gxx_include_dir
+ gcc_config_arguments
+ float_h_file
+@@ -3313,6 +3314,15 @@
+   fi
+ fi
+ 
++gcc_gxx_include_dir_add_sysroot=0
++if test "${with_sysroot+set}" = set; then :
++  gcc_gxx_without_sysroot=`expr "${gcc_gxx_include_dir}" : "${with_sysroot}"'\(.*\)'`
++  if test "${gcc_gxx_without_sysroot}"; then :
++    gcc_gxx_include_dir="${gcc_gxx_without_sysroot}"
++    gcc_gxx_include_dir_add_sysroot=1
++  fi
++fi
++
+ 
+ # Check whether --with-cpp_install_dir was given.
+ if test "${with_cpp_install_dir+set}" = set; then :
+@@ -17514,7 +17524,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17517 "configure"
++#line 17527 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -17620,7 +17630,7 @@
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 17623 "configure"
++#line 17633 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -26151,6 +26161,7 @@
+ 
+ 
+ 
++
+ 
+ 
+ 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-cross.inc b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
index d2d9081..5816768 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-cross.inc
@@ -10,7 +10,7 @@ EXTRA_OECONF += " --enable-poison-system-directories \
 INHIBIT_DEFAULT_DEPS = "1"
 
 EXTRA_OECONF_PATHS = "--with-local-prefix=${STAGING_DIR_TARGET}${target_exec_prefix} \
-		      --with-gxx-include-dir=${target_includedir}/c++ \
+		      --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \
                       --with-sysroot=${STAGING_DIR_TARGET} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
 
diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
index f130b47..eb6757c 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
@@ -5,7 +5,7 @@ USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibc", "no", "", d )}'
 USE_NLS = '${@base_conditional( "TARGET_OS", "linux-uclibceabi", "no", "", d )}'
 
 EXTRA_OECONF_PATHS = "--with-local-prefix=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_exec_prefix} \
-                      --with-gxx-include-dir=${target_includedir}/c++ \
+                      --with-gxx-include-dir=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS}${target_includedir}/c++ \
                       --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
                       --with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                       --with-build-sysroot=${STAGING_DIR_TARGET}"
-- 
1.7.5.4



