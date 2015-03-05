Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 31A6671637
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 16:23:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 05 Mar 2015 08:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,347,1422950400"; d="scan'208";a="694434176"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2015 08:23:54 -0800
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2015 08:17:37 +0000
Message-Id: <1425543457-12938-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1425312122-38561-1-git-send-email-benjamin.esquivel@linux.intel.com>
References: <1425312122-38561-1-git-send-email-benjamin.esquivel@linux.intel.com>
Subject: [PATCH v3] glibc: 'yes' within the path sets wrong variables
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
X-List-Received-Date: Thu, 05 Mar 2015 16:23:54 -0000

The AC_EGREP_CPP macro is looking for a 'yes' string that is likely
to be found in the path where the file is stored. This false positive
match causes variables to be mistakenly set.

The fix is to use a more elaborated string instead.

This has to be done at the configure and the configure.ac files, because
a reconfigure does not happen in the regular build flow.

[YOCTO #6614]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 ...thin-the-path-sets-wrong-config-variables.patch | 245 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |   1 +
 2 files changed, 246 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch b/meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch
new file mode 100644
index 0000000..827e980
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-yes-within-the-path-sets-wrong-config-variables.patch
@@ -0,0 +1,245 @@
+'yes' within the path sets wrong config variables
+
+It seems that the 'AC_EGREP_CPP(yes...' example is quite popular
+but being such a short word to grep it is likely to produce
+false-positive matches with the path it is configured into.
+
+The change is to use a more elaborated string to grep for.
+
+Upstream-Status: Submitted [libc-alpha@sourceware.org]
+
+Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
+---
+diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
+index 5bd355a..3bc5537 100644
+--- a/sysdeps/aarch64/configure
++++ b/sysdeps/aarch64/configure
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
+diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
+index 7851dd4..6e92381 100644
+--- a/sysdeps/aarch64/configure.ac
++++ b/sysdeps/aarch64/configure.ac
+@@ -10,8 +10,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
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
+diff --git a/sysdeps/arm/configure b/sysdeps/arm/configure
+index 45667cc..0b2ef11 100644
+--- a/sysdeps/arm/configure
++++ b/sysdeps/arm/configure
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
+diff --git a/sysdeps/arm/configure.ac b/sysdeps/arm/configure.ac
+index 002b8ef..e1746a7 100644
+--- a/sysdeps/arm/configure.ac
++++ b/sysdeps/arm/configure.ac
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
+diff --git a/sysdeps/mips/configure b/sysdeps/mips/configure
+index 4e13248..f14af95 100644
+--- a/sysdeps/mips/configure
++++ b/sysdeps/mips/configure
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
+diff --git a/sysdeps/mips/configure.ac b/sysdeps/mips/configure.ac
+index bcbdaff..ad3057f 100644
+--- a/sysdeps/mips/configure.ac
++++ b/sysdeps/mips/configure.ac
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
+diff --git a/sysdeps/nios2/configure b/sysdeps/nios2/configure
+index 14c8a3a..dde3814 100644
+--- a/sysdeps/nios2/configure
++++ b/sysdeps/nios2/configure
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
+diff --git a/sysdeps/nios2/configure.ac b/sysdeps/nios2/configure.ac
+index f05f438..dc86399 100644
+--- a/sysdeps/nios2/configure.ac
++++ b/sysdeps/nios2/configure.ac
+@@ -4,8 +4,8 @@ GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
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
+diff --git a/sysdeps/unix/sysv/linux/mips/configure b/sysdeps/unix/sysv/linux/mips/configure
+index 83f8b13..2b6cbee 100644
+--- a/sysdeps/unix/sysv/linux/mips/configure
++++ b/sysdeps/unix/sysv/linux/mips/configure
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
+diff --git a/sysdeps/unix/sysv/linux/mips/configure.ac b/sysdeps/unix/sysv/linux/mips/configure.ac
+index 5039ec9..1035f76 100644
+--- a/sysdeps/unix/sysv/linux/mips/configure.ac
++++ b/sysdeps/unix/sysv/linux/mips/configure.ac
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
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
+index 70bb18a..ffd9e3e 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure
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
+diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
+index 0822915..9a32fdd 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
++++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/configure.ac
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
+-- 
+1.8.4.5
+
diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
index 1ef494b..6a9e482 100644
--- a/meta/recipes-core/glibc/glibc_2.21.bb
+++ b/meta/recipes-core/glibc/glibc_2.21.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://sourceware.org/git/glibc.git;branch=${BRANCH} \
            file://fix_am_rootsbindir.patch \
            file://0001-Add-unused-attribute.patch \
            file://0001-When-disabling-SSE-also-make-sure-that-fpmath-is-not.patch \
+           file://0001-yes-within-the-path-sets-wrong-config-variables.patch \
            ${EGLIBCPATCHES} \
           "
 EGLIBCPATCHES = "\
-- 
1.8.4.5


