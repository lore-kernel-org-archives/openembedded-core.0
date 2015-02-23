Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F913706B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:59:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Feb 2015 09:59:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,632,1418112000"; d="scan'208";a="682127536"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by fmsmga002.fm.intel.com with ESMTP; 23 Feb 2015 09:59:10 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Feb 2015 09:54:01 +0000
Message-Id: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] glibc: 'yes' within the path sets wrong variables
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
X-List-Received-Date: Mon, 23 Feb 2015 17:59:27 -0000

The pre-processed output of conftest.c contains an include dir
and if the path of it contains a 'yes' it will cause some variables
to be wrongly set to yes because of the way it greps for it.
The fix is to use a more elaborated string instead of just 'yes'.
This has to be done at the configure and the configure.ac files,
normally it would only require the configure.ac changes but they
also need modification given the configure files also pop-out of
the source tarball.

[YOCTO #6614]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 meta/recipes-core/glibc/glibc/fix-yesdir.patch | 230 +++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb          |   1 +
 2 files changed, 231 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/fix-yesdir.patch

diff --git a/meta/recipes-core/glibc/glibc/fix-yesdir.patch b/meta/recipes-core/glibc/glibc/fix-yesdir.patch
new file mode 100644
index 0000000..4d014c0
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/fix-yesdir.patch
@@ -0,0 +1,230 @@
+Index: git/sysdeps/arm/configure
+===================================================================
+--- git.orig/sysdeps/arm/configure
++++ git/sysdeps/arm/configure
+@@ -150,12 +150,12 @@ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #ifdef __ARM_PCS_VFP
+-		      yes
++		      use_arm_pcs_vfp
+ 		     #endif
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "use_arm_pcs_vfp" >/dev/null 2>&1; then :
+   libc_cv_arm_pcs_vfp=yes
+ else
+   libc_cv_arm_pcs_vfp=no
+Index: git/sysdeps/arm/configure.ac
+===================================================================
+--- git.orig/sysdeps/arm/configure.ac
++++ git/sysdeps/arm/configure.ac
+@@ -16,8 +16,8 @@ dnl it.  Until we do, don't define it.
+ # the dynamic linker via %ifdef.
+ AC_CACHE_CHECK([whether the compiler is using the ARM hard-float ABI],
+   [libc_cv_arm_pcs_vfp],
+-  [AC_EGREP_CPP(yes,[#ifdef __ARM_PCS_VFP
+-		      yes
++  [AC_EGREP_CPP(use_arm_pcs_vfp,[#ifdef __ARM_PCS_VFP
++		      use_arm_pcs_vfp
+ 		     #endif
+   ], libc_cv_arm_pcs_vfp=yes, libc_cv_arm_pcs_vfp=no)])
+ if test $libc_cv_arm_pcs_vfp = yes; then
+Index: git/sysdeps/aarch64/configure
+===================================================================
+--- git.orig/sysdeps/aarch64/configure
++++ git/sysdeps/aarch64/configure
+@@ -148,12 +148,12 @@ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #ifdef __AARCH64EB__
+-                      yes
++                      is_aarch64_be
+                      #endif
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "is_aarch64_be" >/dev/null 2>&1; then :
+   libc_cv_aarch64_be=yes
+ else
+   libc_cv_aarch64_be=no
+Index: git/sysdeps/aarch64/configure.ac
+===================================================================
+--- git.orig/sysdeps/aarch64/configure.ac
++++ git/sysdeps/aarch64/configure.ac
+@@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the
+ # the dynamic linker via %ifdef.
+ AC_CACHE_CHECK([for big endian],
+   [libc_cv_aarch64_be],
+-  [AC_EGREP_CPP(yes,[#ifdef __AARCH64EB__
+-                      yes
++  [AC_EGREP_CPP(is_aarch64_be,[#ifdef __AARCH64EB__
++                      is_aarch64_be
+                      #endif
+   ], libc_cv_aarch64_be=yes, libc_cv_aarch64_be=no)])
+ if test $libc_cv_aarch64_be = yes; then
+Index: git/sysdeps/mips/configure
+===================================================================
+--- git.orig/sysdeps/mips/configure
++++ git/sysdeps/mips/configure
+@@ -143,11 +143,11 @@ else
+ /* end confdefs.h.  */
+ dnl
+ #ifdef __mips_nan2008
+-yes
++use_mips_nan2008
+ #endif
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
+   libc_cv_mips_nan2008=yes
+ else
+   libc_cv_mips_nan2008=no
+Index: git/sysdeps/mips/configure.ac
+===================================================================
+--- git.orig/sysdeps/mips/configure.ac
++++ git/sysdeps/mips/configure.ac
+@@ -6,9 +6,9 @@ dnl position independent way.
+ dnl AC_DEFINE(PI_STATIC_AND_HIDDEN)
+ 
+ AC_CACHE_CHECK([whether the compiler is using the 2008 NaN encoding],
+-  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes, [dnl
++  libc_cv_mips_nan2008, [AC_EGREP_CPP(use_mips_nan2008, [dnl
+ #ifdef __mips_nan2008
+-yes
++use_mips_nan2008
+ #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
+ if test x$libc_cv_mips_nan2008 = xyes; then
+   AC_DEFINE(HAVE_MIPS_NAN2008)
+Index: git/sysdeps/nios2/configure
+===================================================================
+--- git.orig/sysdeps/nios2/configure
++++ git/sysdeps/nios2/configure
+@@ -142,12 +142,12 @@ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #ifdef __nios2_big_endian__
+-                      yes
++                      is_nios2_be
+                      #endif
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "is_nios2_be" >/dev/null 2>&1; then :
+   libc_cv_nios2_be=yes
+ else
+   libc_cv_nios2_be=no
+Index: git/sysdeps/nios2/configure.ac
+===================================================================
+--- git.orig/sysdeps/nios2/configure.ac
++++ git/sysdeps/nios2/configure.ac
+@@ -4,8 +4,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the
+ # Nios II big endian is not yet supported.
+ AC_CACHE_CHECK([for big endian],
+   [libc_cv_nios2_be],
+-  [AC_EGREP_CPP(yes,[#ifdef __nios2_big_endian__
+-                      yes
++  [AC_EGREP_CPP(is_nios2_be,[#ifdef __nios2_big_endian__
++                      is_nios2_be
+                      #endif
+   ], libc_cv_nios2_be=yes, libc_cv_nios2_be=no)])
+ if test $libc_cv_nios2_be = yes; then
+Index: git/sysdeps/unix/sysv/linux/mips/configure
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mips/configure
++++ git/sysdeps/unix/sysv/linux/mips/configure
+@@ -387,11 +387,11 @@ else
+ /* end confdefs.h.  */
+ dnl
+ #ifdef __mips_nan2008
+-yes
++use_mips_nan2008
+ #endif
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "use_mips_nan2008" >/dev/null 2>&1; then :
+   libc_cv_mips_nan2008=yes
+ else
+   libc_cv_mips_nan2008=no
+Index: git/sysdeps/unix/sysv/linux/mips/configure.ac
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/mips/configure.ac
++++ git/sysdeps/unix/sysv/linux/mips/configure.ac
+@@ -98,9 +98,9 @@ AC_COMPILE_IFELSE(
+ LIBC_CONFIG_VAR([mips-mode-switch],[${libc_mips_mode_switch}])
+ 
+ AC_CACHE_CHECK([whether the compiler is using the 2008 NaN encoding],
+-  libc_cv_mips_nan2008, [AC_EGREP_CPP(yes, [dnl
++  libc_cv_mips_nan2008, [AC_EGREP_CPP(use_mips_nan2008, [dnl
+ #ifdef __mips_nan2008
+-yes
++use_mips_nan2008
+ #endif], libc_cv_mips_nan2008=yes, libc_cv_mips_nan2008=no)])
+ 
+ libc_mips_nan=
+Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
++++ git/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
+@@ -155,12 +155,12 @@ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #if _CALL_ELF == 2
+-                      yes
++                      use_ppc_elfv2_abi
+                      #endif
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "use_ppc_elfv2_abi" >/dev/null 2>&1; then :
+   libc_cv_ppc64_elfv2_abi=yes
+ else
+   libc_cv_ppc64_elfv2_abi=no
+@@ -188,12 +188,12 @@ else
+   cat confdefs.h - <<_ACEOF >conftest.$ac_ext
+ /* end confdefs.h.  */
+ #ifdef _CALL_ELF
+-                         yes
++                         is_def_call_elf
+                        #endif
+ 
+ _ACEOF
+ if (eval "$ac_cpp conftest.$ac_ext") 2>&5 |
+-  $EGREP "yes" >/dev/null 2>&1; then :
++  $EGREP "is_def_call_elf" >/dev/null 2>&1; then :
+   libc_cv_ppc64_def_call_elf=yes
+ else
+   libc_cv_ppc64_def_call_elf=no
+Index: git/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
+===================================================================
+--- git.orig/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
++++ git/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
+@@ -6,8 +6,8 @@ LIBC_SLIBDIR_RTLDDIR([lib64], [lib64])
+ # Define default-abi according to compiler flags.
+ AC_CACHE_CHECK([whether the compiler is using the PowerPC64 ELFv2 ABI],
+   [libc_cv_ppc64_elfv2_abi],
+-  [AC_EGREP_CPP(yes,[#if _CALL_ELF == 2
+-                      yes
++  [AC_EGREP_CPP(use_ppc_elfv2_abi,[#if _CALL_ELF == 2
++                      use_ppc_elfv2_abi
+                      #endif
+   ], libc_cv_ppc64_elfv2_abi=yes, libc_cv_ppc64_elfv2_abi=no)])
+ if test $libc_cv_ppc64_elfv2_abi = yes; then
+@@ -19,8 +19,8 @@ else
+   # Compiler that do not support ELFv2 ABI does not define _CALL_ELF
+   AC_CACHE_CHECK([whether the compiler defines _CALL_ELF],
+     [libc_cv_ppc64_def_call_elf],
+-    [AC_EGREP_CPP(yes,[#ifdef _CALL_ELF
+-                         yes
++    [AC_EGREP_CPP(is_def_call_elf,[#ifdef _CALL_ELF
++                         is_def_call_elf
+                        #endif
+     ], libc_cv_ppc64_def_call_elf=yes, libc_cv_ppc64_def_call_elf=no)])
+   if test $libc_cv_ppc64_def_call_elf = no; then
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 1ef494b..d7aab4b 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://fix_am_rootsbindir.patch \
            file://0001-Add-unused-attribute.patch \
            file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
+           file://fix-yesdir.patch \
            ${EGLIBCPATCHES} \
           "
 EGLIBCPATCHES = "\
-- 
1.8.4.5


