Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1T3mxS-0003Iu-HG
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 13:49:19 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by fmsmga102.fm.intel.com with ESMTP; 21 Aug 2012 04:37:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="183459747"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by azsmga001.ch.intel.com with ESMTP; 21 Aug 2012 04:37:12 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 14:39:28 +0300
Message-Id: <1345549168-17747-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] grub-efi-native: Update to version 2.00
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 11:49:19 -0000

Added -Wno-unused-result because of a read() with no result, and causing
error due to -Werror
Updated grub recipe because of a patch name change
Removed unnecessary patches (merged upstream).

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 ...2man.patch => grub-2.00-disable-help2man.patch} |  117 +++-----------------
 ...grub-2.00-fix-enable_execute_stack-check.patch} |    8 +-
 ...ix.patch => grub-2.00-fpmath-sse-387-fix.patch} |    0
 .../grub/files/grub-no-unused-result.patch         |   13 +++
 ...-efi-native_1.99.bb => grub-efi-native_2.00.bb} |   18 ++-
 meta/recipes-bsp/grub/grub_2.00.bb                 |    2 +-
 6 files changed, 42 insertions(+), 116 deletions(-)
 rename meta/recipes-bsp/grub/files/{grub-1.99-disable-help2man.patch => grub-2.00-disable-help2man.patch} (54%)
 rename meta/recipes-bsp/grub/files/{grub-1.99-fix-enable_execute_stack-check.patch => grub-2.00-fix-enable_execute_stack-check.patch} (92%)
 rename meta/recipes-bsp/grub/files/{grub-1.99-fpmath-sse-387-fix.patch => grub-2.00-fpmath-sse-387-fix.patch} (100%)
 create mode 100644 meta/recipes-bsp/grub/files/grub-no-unused-result.patch
 rename meta/recipes-bsp/grub/{grub-efi-native_1.99.bb => grub-efi-native_2.00.bb} (80%)

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch b/meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch
similarity index 54%
rename from meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
rename to meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch
index 3ffefdc..a2e42c2 100644
--- a/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
+++ b/meta/recipes-bsp/grub/files/grub-2.00-disable-help2man.patch
@@ -10,14 +10,14 @@ unnecessarily.
 
 Signed-off-by: Darren Hart <dvhart@linux.intel.com>
 
-Index: grub-1.99/configure.ac
+Index: grub-2.00/configure.ac
 ===================================================================
---- grub-1.99.orig/configure.ac
-+++ grub-1.99/configure.ac
-@@ -275,11 +275,12 @@ if test x$grub_cv_apple_cc = xyes ; then
-   HOST_CFLAGS="$HOST_CFLAGS -fnested-functions"
+--- grub-2.00.orig/configure.ac
++++ grub-2.00/configure.ac
+@@ -310,11 +310,12 @@ if test x$USE_NLS = xno; then
+   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
  fi
-
+ 
 -if test "x$cross_compiling" = xyes; then
 -  AC_MSG_WARN([cannot generate manual pages while cross compiling])
 -else
@@ -32,11 +32,11 @@ Index: grub-1.99/configure.ac
  
  # Check for functions and headers.
  AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
-Index: grub-1.99/configure
+Index: grub-2.00/configure
 ===================================================================
---- grub-1.99.orig/configure
-+++ grub-1.99/configure
-@@ -1172,7 +1172,6 @@ GL_COND_LIBTOOL_FALSE
+--- grub-2.00.orig/configure
++++ grub-2.00/configure
+@@ -1215,7 +1215,6 @@ GL_COND_LIBTOOL_FALSE
  GL_COND_LIBTOOL_TRUE
  BUILD_CC
  LIBUTIL
@@ -44,15 +44,7 @@ Index: grub-1.99/configure
  POSUB
  LTLIBINTL
  LIBINTL
-@@ -1204,6 +1203,7 @@ LEXLIB
- am__fastdepCC_FALSE
- am__fastdepCC_TRUE
- CCDEPMODE
-+am__nodep
- AMDEPBACKSLASH
- AMDEP_FALSE
- AMDEP_TRUE
-@@ -3011,7 +3011,6 @@ _ACEOF
+@@ -3069,7 +3068,6 @@ _ACEOF
  # Let the site file select an alternate cache file if it wants to.
  # Prefer an explicitly selected file to automatically selected ones.
  ac_site_file1=NONE
@@ -60,7 +52,7 @@ Index: grub-1.99/configure
  if test -n "$CONFIG_SITE"; then
    # We do not want a PATH search for config.site.
    case $CONFIG_SITE in #((
-@@ -3019,14 +3018,8 @@ if test -n "$CONFIG_SITE"; then
+@@ -3077,14 +3075,8 @@ if test -n "$CONFIG_SITE"; then
      */*) ac_site_file1=$CONFIG_SITE;;
      *)   ac_site_file1=./$CONFIG_SITE;;
    esac
@@ -76,7 +68,7 @@ Index: grub-1.99/configure
  do
    test "x$ac_site_file" = xNONE && continue
    if test /dev/null != "$ac_site_file" && test -r "$ac_site_file"; then
-@@ -3313,8 +3306,9 @@ case $target_os in *\ *) target_os=`echo
+@@ -3371,8 +3363,9 @@ case $target_os in *\ *) target_os=`echo
  # The aliases save the names the user supplied, while $host etc.
  # will get canonicalized.
  test -n "$target_alias" &&
@@ -88,83 +80,8 @@ Index: grub-1.99/configure
    program_prefix=${target_alias}-
  
  am__api_version='1.11'
-@@ -3786,11 +3780,11 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}ma
- 
- # We need awk for the "check" target.  The system "awk" is bad on
- # some platforms.
--# Always define AMTAR for backward compatibility.
--
--AMTAR=${AMTAR-"${am_missing_run}tar"}
-+# Always define AMTAR for backward compatibility.  Yes, it's still used
-+# in the wild :-(  We should find a proper way to deprecate it ...
-+AMTAR='$${TAR-tar}'
- 
--am__tar='${AMTAR} chof - "$$tardir"'; am__untar='${AMTAR} xf -'
-+am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
- 
- 
- 
-@@ -4256,6 +4250,7 @@ fi
- if test "x$enable_dependency_tracking" != xno; then
-   am_depcomp="$ac_aux_dir/depcomp"
-   AMDEPBACKSLASH='\'
-+  am__nodep='_no'
- fi
-  if test "x$enable_dependency_tracking" != xno; then
-   AMDEP_TRUE=
-@@ -5069,6 +5064,7 @@ else
-   # instance it was reported that on HP-UX the gcc test will end up
-   # making a dummy file named `D' -- because `-MD' means `put the output
-   # in D'.
-+  rm -rf conftest.dir
-   mkdir conftest.dir
-   # Copy depcomp to subdir because otherwise we won't find it if we're
-   # using a relative directory.
-@@ -5128,7 +5124,7 @@ else
- 	break
-       fi
-       ;;
--    msvisualcpp | msvcmsys)
-+    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
-       # This compiler won't grok `-c -o', but also, the minuso test has
-       # not run yet.  These depmodes are late enough in the game, and
-       # so weak that their functioning should not be impacted.
-@@ -6044,6 +6040,7 @@ else
-   # instance it was reported that on HP-UX the gcc test will end up
-   # making a dummy file named `D' -- because `-MD' means `put the output
-   # in D'.
-+  rm -rf conftest.dir
-   mkdir conftest.dir
-   # Copy depcomp to subdir because otherwise we won't find it if we're
-   # using a relative directory.
-@@ -6103,7 +6100,7 @@ else
- 	break
-       fi
-       ;;
--    msvisualcpp | msvcmsys)
-+    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
-       # This compiler won't grok `-c -o', but also, the minuso test has
-       # not run yet.  These depmodes are late enough in the game, and
-       # so weak that their functioning should not be impacted.
-@@ -6848,6 +6845,7 @@ else
-   # instance it was reported that on HP-UX the gcc test will end up
-   # making a dummy file named `D' -- because `-MD' means `put the output
-   # in D'.
-+  rm -rf conftest.dir
-   mkdir conftest.dir
-   # Copy depcomp to subdir because otherwise we won't find it if we're
-   # using a relative directory.
-@@ -6905,7 +6903,7 @@ else
- 	break
-       fi
-       ;;
--    msvisualcpp | msvcmsys)
-+    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
-       # This compiler won't grok `-c -o', but also, the minuso test has
-       # not run yet.  These depmodes are late enough in the game, and
-       # so weak that their functioning should not be impacted.
-@@ -9529,51 +9527,13 @@ if test x$grub_cv_apple_cc = xyes ; then
-   HOST_CFLAGS="$HOST_CFLAGS -fnested-functions"
+@@ -9633,51 +9626,13 @@ if test x$USE_NLS = xno; then
+   HOST_CFLAGS="$HOST_CFLAGS -fno-builtin-gettext"
  fi
  
 -if test "x$cross_compiling" = xyes; then
@@ -192,7 +109,7 @@ Index: grub-1.99/configure
 -  IFS=$as_save_IFS
 -  test -z "$as_dir" && as_dir=.
 -    for ac_exec_ext in '' $ac_executable_extensions; do
--  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+-  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
 -    ac_cv_path_HELP2MAN="$as_dir/$ac_word$ac_exec_ext"
 -    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
 -    break 2
@@ -221,7 +138,7 @@ Index: grub-1.99/configure
  
  # Check for functions and headers.
  for ac_func in posix_memalign memalign asprintf vasprintf getextmntent
-@@ -20309,6 +20269,7 @@ $as_echo_n "checking whether \`$CC' gene
+@@ -20477,6 +20432,7 @@ $as_echo_n "checking whether \`$CC' gene
  cat confdefs.h - <<_ACEOF >conftest.$ac_ext
  /* end confdefs.h.  */
  
diff --git a/meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch b/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
similarity index 92%
rename from meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
rename to meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
index 9d7272b..09ef4db 100644
--- a/meta/recipes-bsp/grub/files/grub-1.99-fix-enable_execute_stack-check.patch
+++ b/meta/recipes-bsp/grub/files/grub-2.00-fix-enable_execute_stack-check.patch
@@ -13,14 +13,14 @@ configure:20327: error: ccache i586-poky-linux-gcc  -m32    -march=core2 -msse3
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
 2012/04/13
 
-Index: grub-1.99/acinclude.m4
+Index: grub-2.00/acinclude.m4
 ===================================================================
---- grub-1.99.orig/acinclude.m4
-+++ grub-1.99/acinclude.m4
+--- grub-2.00.orig/acinclude.m4
++++ grub-2.00/acinclude.m4
 @@ -317,6 +317,7 @@ dnl Check if the C compiler generates ca
  AC_DEFUN([grub_CHECK_ENABLE_EXECUTE_STACK],[
  AC_MSG_CHECKING([whether `$CC' generates calls to `__enable_execute_stack()'])
- AC_LANG_CONFTEST([[
+ AC_LANG_CONFTEST([AC_LANG_SOURCE([[
 +void g (int);
  void f (int (*p) (void));
  void g (int i)
diff --git a/meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch b/meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
similarity index 100%
rename from meta/recipes-bsp/grub/files/grub-1.99-fpmath-sse-387-fix.patch
rename to meta/recipes-bsp/grub/files/grub-2.00-fpmath-sse-387-fix.patch
diff --git a/meta/recipes-bsp/grub/files/grub-no-unused-result.patch b/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
new file mode 100644
index 0000000..16f99ed
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-no-unused-result.patch
@@ -0,0 +1,13 @@
+Index: grub-2.00/configure.ac
+===================================================================
+--- grub-2.00.orig/configure.ac	2012-08-13 16:32:33.000000000 +0300
++++ grub-2.00/configure.ac	2012-08-13 16:38:22.000000000 +0300
+@@ -394,7 +394,7 @@
+ LIBS=""
+ 
+ # debug flags.
+-WARN_FLAGS="-Wall -W -Wshadow -Wold-style-definition -Wpointer-arith -Wundef -Wextra -Waddress -Wattributes -Wcast-align -Wchar-subscripts -Wcomment -Wdeprecated-declarations -Wdisabled-optimization -Wdiv-by-zero -Wempty-body -Wendif-labels -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int -Winit-self -Wint-to-pointer-cast -Winvalid-pch -Wmain -Wmissing-braces -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-noreturn -Wmultichar -Wnonnull -Woverflow -Wparentheses -Wpointer-arith -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wswitch -Wtrigraphs -Wundef -Wunknown-pragmas -Wunused -Wunused-function -Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable -Wvariadic-macros -Wvolatile-register-var -Wwrite-strings -Wnested-externs -Wstrict-prototypes -Wpointer-sign"
++WARN_FLAGS="-Wall -W -Wshadow -Wold-style-definition -Wpointer-arith -Wundef -Wextra -Waddress -Wattributes -Wcast-align -Wchar-subscripts -Wcomment -Wdeprecated-declarations -Wdisabled-optimization -Wdiv-by-zero -Wempty-body -Wendif-labels -Wfloat-equal -Wformat-extra-args -Wformat-security -Wformat-y2k -Wimplicit -Wimplicit-function-declaration -Wimplicit-int -Winit-self -Wint-to-pointer-cast -Winvalid-pch -Wmain -Wmissing-braces -Wmissing-field-initializers -Wmissing-format-attribute -Wmissing-noreturn -Wmultichar -Wnonnull -Woverflow -Wparentheses -Wpointer-arith -Wpointer-to-int-cast -Wreturn-type -Wsequence-point -Wshadow -Wsign-compare -Wstrict-aliasing -Wswitch -Wtrigraphs -Wundef -Wunknown-pragmas -Wunused -Wunused-function -Wunused-label -Wunused-parameter -Wunused-value  -Wunused-variable -Wno-unused-result -Wvariadic-macros -Wvolatile-register-var -Wwrite-strings -Wnested-externs -Wstrict-prototypes -Wpointer-sign"
+ HOST_CFLAGS="$HOST_CFLAGS $WARN_FLAGS"
+ TARGET_CFLAGS="$TARGET_CFLAGS $WARN_FLAGS -g -Wredundant-decls -Wmissing-prototypes -Wmissing-declarations"
+ TARGET_CCASFLAGS="$TARGET_CCASFLAGS -g"
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
similarity index 80%
rename from meta/recipes-bsp/grub/grub-efi-native_1.99.bb
rename to meta/recipes-bsp/grub/grub-efi-native_2.00.bb
index 9e923bd..776bf23 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_2.00.bb
@@ -16,24 +16,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r10"
+PR = "r0"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
 PN := "grub-efi-${TRANSLATED_TARGET_ARCH}-native"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
-           file://grub-1.99_fix_for_automake_1.11.2.patch \
-           file://grub-1.99-fpmath-sse-387-fix.patch \
-           file://grub-1.99-gcc-4.7.0.patch \
-           file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
-           file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
-           file://grub-1.99-fix-enable_execute_stack-check.patch \
-           file://grub-1.99-disable-help2man.patch \
+           file://grub-2.00-fpmath-sse-387-fix.patch \
+	   file://grub-2.00-fix-enable_execute_stack-check.patch \
+           file://grub-2.00-disable-help2man.patch \
+	   file://grub-no-unused-result.patch \
           "
-
-SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-SRC_URI[sha256sum] = "b91f420f2c51f6155e088e34ff99bea09cc1fb89585cf7c0179644e57abd28ff"
+SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
+SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
diff --git a/meta/recipes-bsp/grub/grub_2.00.bb b/meta/recipes-bsp/grub/grub_2.00.bb
index 73004d2..2f44d15 100644
--- a/meta/recipes-bsp/grub/grub_2.00.bb
+++ b/meta/recipes-bsp/grub/grub_2.00.bb
@@ -17,7 +17,7 @@ PR = "r0"
 
 SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
           file://grub-install.in.patch \
-          file://grub-1.99-fpmath-sse-387-fix.patch \
+          file://grub-2.00-fpmath-sse-387-fix.patch \
           file://remove-gets.patch \
           file://40_custom"
 
-- 
1.7.9.5



