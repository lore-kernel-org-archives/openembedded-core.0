Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sln6y-0001md-9o
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:20:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2012 13:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="160667231"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga001.jf.intel.com with ESMTP; 02 Jul 2012 13:09:42 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jul 2012 13:09:39 -0700
Message-Id: <441e9c9457b3f888162fe83793df551a6ee97697.1341259773.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [RFC PATCH] grub-efi: Do not use help2man
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
X-List-Received-Date: Mon, 02 Jul 2012 20:20:44 -0000

Fixes [YOCTO #2527]

Modify configure.ac and the generated configure script to avoid using
help2man during the compilation process. For grub-efi we are only
deploying the EFI payload and are not installing grub on the target
root filesystem. Therefor, we do not need the man pages.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Paul Eggleton <paul.eggleton@linux.intel.com>
CC: Radu Moisan <radu.moisan@intel.com>
---
 .../grub/files/grub-1.99-disable-help2man.patch    |  231 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi-native_1.99.bb      |    3 +-
 2 files changed, 233 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch

diff --git a/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch b/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
new file mode 100644
index 0000000..b007cae
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-1.99-disable-help2man.patch
@@ -0,0 +1,231 @@
+Upstream-Status: Inappropriate (Bitbake build environment)
+
+We do not need the man pages when building just the EFI payload for the target,
+all the tools are built for the host. This does not trigger GRUB's built-in
+cross-compilation check, so force it. After the change to configure.ac,
+autogen.sh was run in devshell and the resulting configure was used to generate
+the configure diff. The configure diff was included to avoid having to add
+autogen.sh to a do_configure_prepend() routine which would slow down the build
+unnecessarily.
+   
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+
+Index: grub-1.99/configure.ac
+===================================================================
+--- grub-1.99.orig/configure.ac
++++ grub-1.99/configure.ac
+@@ -275,11 +275,12 @@ if test x$grub_cv_apple_cc = xyes ; then
+   HOST_CFLAGS="$HOST_CFLAGS -fnested-functions"
+ fi
+ 
+-if test "x$cross_compiling" = xyes; then
+-  AC_MSG_WARN([cannot generate manual pages while cross compiling])
+-else
+-  AC_PATH_PROG(HELP2MAN, help2man)
+-fi
++# Force behaving as though we are cross-compiling with respect to HELP2MAN
++#if test "x$cross_compiling" = xyes; then
++AC_MSG_WARN([cannot generate manual pages while cross compiling])
++#else
++#  AC_PATH_PROG(HELP2MAN, help2man)
++#fi
+ 
+ # Check for functions and headers.
+ AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
+Index: grub-1.99/configure
+===================================================================
+--- grub-1.99.orig/configure
++++ grub-1.99/configure
+@@ -1172,7 +1172,6 @@ GL_COND_LIBTOOL_FALSE
+ GL_COND_LIBTOOL_TRUE
+ BUILD_CC
+ LIBUTIL
+-HELP2MAN
+ POSUB
+ LTLIBINTL
+ LIBINTL
+@@ -1204,6 +1203,7 @@ LEXLIB
+ am__fastdepCC_FALSE
+ am__fastdepCC_TRUE
+ CCDEPMODE
++am__nodep
+ AMDEPBACKSLASH
+ AMDEP_FALSE
+ AMDEP_TRUE
+@@ -3011,7 +3011,6 @@ _ACEOF
+ # Let the site file select an alternate cache file if it wants to.
+ # Prefer an explicitly selected file to automatically selected ones.
+ ac_site_file1=NONE
+-ac_site_file2=NONE
+ if test -n "$CONFIG_SITE"; then
+   # We do not want a PATH search for config.site.
+   case $CONFIG_SITE in #((
+@@ -3019,14 +3018,8 @@ if test -n "$CONFIG_SITE"; then
+     */*) ac_site_file1=$CONFIG_SITE;;
+     *)   ac_site_file1=./$CONFIG_SITE;;
+   esac
+-elif test "x$prefix" != xNONE; then
+-  ac_site_file1=$prefix/share/config.site
+-  ac_site_file2=$prefix/etc/config.site
+-else
+-  ac_site_file1=$ac_default_prefix/share/config.site
+-  ac_site_file2=$ac_default_prefix/etc/config.site
+ fi
+-for ac_site_file in "$ac_site_file1" "$ac_site_file2"
++for ac_site_file in $ac_site_file1
+ do
+   test "x$ac_site_file" = xNONE && continue
+   if test /dev/null != "$ac_site_file" && test -r "$ac_site_file"; then
+@@ -3313,8 +3306,9 @@ case $target_os in *\ *) target_os=`echo
+ # The aliases save the names the user supplied, while $host etc.
+ # will get canonicalized.
+ test -n "$target_alias" &&
+-  test "$program_prefix$program_suffix$program_transform_name" = \
+-    NONENONEs,x,x, &&
++  test "$target_alias" != "$host_alias" &&
++    test "$program_prefix$program_suffix$program_transform_name" = \
++      NONENONEs,x,x, &&
+   program_prefix=${target_alias}-
+ 
+ am__api_version='1.11'
+@@ -3786,11 +3780,11 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}ma
+ 
+ # We need awk for the "check" target.  The system "awk" is bad on
+ # some platforms.
+-# Always define AMTAR for backward compatibility.
+-
+-AMTAR=${AMTAR-"${am_missing_run}tar"}
++# Always define AMTAR for backward compatibility.  Yes, it's still used
++# in the wild :-(  We should find a proper way to deprecate it ...
++AMTAR='$${TAR-tar}'
+ 
+-am__tar='${AMTAR} chof - "$$tardir"'; am__untar='${AMTAR} xf -'
++am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'
+ 
+ 
+ 
+@@ -4256,6 +4250,7 @@ fi
+ if test "x$enable_dependency_tracking" != xno; then
+   am_depcomp="$ac_aux_dir/depcomp"
+   AMDEPBACKSLASH='\'
++  am__nodep='_no'
+ fi
+  if test "x$enable_dependency_tracking" != xno; then
+   AMDEP_TRUE=
+@@ -5069,6 +5064,7 @@ else
+   # instance it was reported that on HP-UX the gcc test will end up
+   # making a dummy file named `D' -- because `-MD' means `put the output
+   # in D'.
++  rm -rf conftest.dir
+   mkdir conftest.dir
+   # Copy depcomp to subdir because otherwise we won't find it if we're
+   # using a relative directory.
+@@ -5128,7 +5124,7 @@ else
+ 	break
+       fi
+       ;;
+-    msvisualcpp | msvcmsys)
++    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
+       # This compiler won't grok `-c -o', but also, the minuso test has
+       # not run yet.  These depmodes are late enough in the game, and
+       # so weak that their functioning should not be impacted.
+@@ -6044,6 +6040,7 @@ else
+   # instance it was reported that on HP-UX the gcc test will end up
+   # making a dummy file named `D' -- because `-MD' means `put the output
+   # in D'.
++  rm -rf conftest.dir
+   mkdir conftest.dir
+   # Copy depcomp to subdir because otherwise we won't find it if we're
+   # using a relative directory.
+@@ -6103,7 +6100,7 @@ else
+ 	break
+       fi
+       ;;
+-    msvisualcpp | msvcmsys)
++    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
+       # This compiler won't grok `-c -o', but also, the minuso test has
+       # not run yet.  These depmodes are late enough in the game, and
+       # so weak that their functioning should not be impacted.
+@@ -6848,6 +6845,7 @@ else
+   # instance it was reported that on HP-UX the gcc test will end up
+   # making a dummy file named `D' -- because `-MD' means `put the output
+   # in D'.
++  rm -rf conftest.dir
+   mkdir conftest.dir
+   # Copy depcomp to subdir because otherwise we won't find it if we're
+   # using a relative directory.
+@@ -6905,7 +6903,7 @@ else
+ 	break
+       fi
+       ;;
+-    msvisualcpp | msvcmsys)
++    msvc7 | msvc7msys | msvisualcpp | msvcmsys)
+       # This compiler won't grok `-c -o', but also, the minuso test has
+       # not run yet.  These depmodes are late enough in the game, and
+       # so weak that their functioning should not be impacted.
+@@ -9529,51 +9527,13 @@ if test x$grub_cv_apple_cc = xyes ; then
+   HOST_CFLAGS="$HOST_CFLAGS -fnested-functions"
+ fi
+ 
+-if test "x$cross_compiling" = xyes; then
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cannot generate manual pages while cross compiling" >&5
++# Force behaving as though we are cross-compiling with respect to HELP2MAN
++#if test "x$cross_compiling" = xyes; then
++{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: cannot generate manual pages while cross compiling" >&5
+ $as_echo "$as_me: WARNING: cannot generate manual pages while cross compiling" >&2;}
+-else
+-  # Extract the first word of "help2man", so it can be a program name with args.
+-set dummy help2man; ac_word=$2
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+-$as_echo_n "checking for $ac_word... " >&6; }
+-if ${ac_cv_path_HELP2MAN+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  case $HELP2MAN in
+-  [\\/]* | ?:[\\/]*)
+-  ac_cv_path_HELP2MAN="$HELP2MAN" # Let the user override the test with a path.
+-  ;;
+-  *)
+-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+-for as_dir in $PATH
+-do
+-  IFS=$as_save_IFS
+-  test -z "$as_dir" && as_dir=.
+-    for ac_exec_ext in '' $ac_executable_extensions; do
+-  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+-    ac_cv_path_HELP2MAN="$as_dir/$ac_word$ac_exec_ext"
+-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+-    break 2
+-  fi
+-done
+-  done
+-IFS=$as_save_IFS
+-
+-  ;;
+-esac
+-fi
+-HELP2MAN=$ac_cv_path_HELP2MAN
+-if test -n "$HELP2MAN"; then
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $HELP2MAN" >&5
+-$as_echo "$HELP2MAN" >&6; }
+-else
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+-$as_echo "no" >&6; }
+-fi
+-
+-
+-fi
++#else
++#  AC_PATH_PROG(HELP2MAN, help2man)
++#fi
+ 
+ # Check for functions and headers.
+ for ac_func in posix_memalign memalign asprintf vasprintf getextmntent
+@@ -20309,6 +20269,7 @@ $as_echo_n "checking whether \`$CC' gene
+ cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ 
++void g (int);
+ void f (int (*p) (void));
+ void g (int i)
+ {
diff --git a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
index 20dcdb9..1083d4c 100644
--- a/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
+++ b/meta/recipes-bsp/grub/grub-efi-native_1.99.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 # FIXME: We should be able to optionally drop freetype as a dependency
 DEPENDS = "help2man-native autogen-native"
 RDEPENDS_${PN} = "diffutils freetype"
-PR = "r9"
+PR = "r10"
 
 # Native packages do not normally rebuild when the target changes.
 # Ensure this is built once per HOST-TARGET pair.
@@ -29,6 +29,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
 	file://grub-1.99-gcc-4.7.0-uninitialized-var-errors.patch \
 	file://grub-1.99-gcc-4.7.0-strict-aliasing-errors.patch \
         file://grub-1.99-fix-enable_execute_stack-check.patch \
+	file://grub-1.99-disable-help2man.patch \
 	"
 
 SRC_URI[md5sum] = "ca9f2a2d571b57fc5c53212d1d22e2b5"
-- 
1.7.5.4



