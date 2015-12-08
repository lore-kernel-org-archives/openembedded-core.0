Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 90C2F60589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:39 +0000 (UTC)
Received: by qgec40 with SMTP id c40so9969194qge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rOb+hP82ctw/wsr1lL3g192Nt+8Z866c/VckgeRCW0k=;
	b=jc90+04llw5lK6lRb2muZWAgWam0+Q2UbD5x4iu7Atebcek9X+jnynXNCIqmAfBppQ
	UPN21zY9Wf9GzIwqqZnYan4JpiyY8Ee8pzCexypOwUJ6UBwdorlClso9spK4Cyjzv3S6
	2jacB+P1ePXPeeb6+nHUatK3WcQtUESjjuQm5vQsoVMsQAZpRW/jmOL6/uosubWWH5F5
	YsawieRxkx3FIkq9FDd7OQurJJXlzdCStpWjjh+q6l0WBCspNbEOFwG8IGbr7q0OFcaP
	lO2TC9DlyMpaSQQgSCEPJdwIyS6BpQI7I5VnsJQHSPCK1dcRTSYTe0SR0eL6fIfGqnbx
	tBFw==
X-Received: by 10.140.98.213 with SMTP id o79mr2872858qge.31.1449562359771;
	Tue, 08 Dec 2015 00:12:39 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	v66sm1023174qkv.32.2015.12.08.00.12.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:21 +0000
Message-Id: <bb86e885996a2878e8d8d8e128f9b9b724ed0227.1449562195.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449562195.git.raj.khem@gmail.com>
References: <cover.1449562195.git.raj.khem@gmail.com>
Subject: [PATCH 01/13] gcc: Add support for building musl configuration
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:39 -0000

Most of these patches are already in gcc 6.0/master but we still need them for
older gcc, they have been tested in meta-musl for quite some time

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   4 +
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     | 205 ++++++++++++++++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |  21 ++
 .../gcc/gcc-4.9/0070-libstdc-musl.patch            |  32 +++
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   4 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |  32 +++
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     | 198 +++++++++++++++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |  22 ++
 10 files changed, 1052 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 6ac3685..a602cd1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -82,6 +82,10 @@ SRC_URI = "\
     file://0064-handle-target-sysroot-multilib.patch \
     file://0065-gcc-483-universal-initializer-no-warning.patch \
     file://0066-cxxflags-for-build.patch \
+    file://0067-gcc-musl-support.patch \
+    file://0068-musl-dynamic-linker.patch \
+    file://0069-musl-no-fixincludes.patch \
+    file://0070-libstdc-musl.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch b/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
new file mode 100644
index 0000000..9a0b5ad
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
@@ -0,0 +1,267 @@
+# HG changeset patch
+# Parent e5b4564f249f8634194bdabef4b3057d0e54ee97
+Adding -mmusl as a musl libc specifier, and the necessary hacks for it to know how to find musl's dynamic linker.
+Upstream-Status: backport [partial]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: gcc-4.9.0/gcc/config.gcc
+===================================================================
+--- gcc-4.9.0.orig/gcc/config.gcc	2014-04-22 22:44:17.153567150 -0700
++++ gcc-4.9.0/gcc/config.gcc	2014-04-23 23:54:31.427357051 -0700
+@@ -594,7 +594,7 @@
+ esac
+ 
+ # Common C libraries.
+-tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
++tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
+ 
+ # 32-bit x86 processors supported by --with-arch=.  Each processor
+ # MUST be separated by exactly one space.
+@@ -719,6 +719,9 @@
+     *-*-*uclibc*)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
+       ;;
++    *-*-*musl*)
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
++      ;;
+     *)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
+       ;;
+@@ -2328,6 +2331,11 @@
+ 	    powerpc*-*-linux*paired*)
+ 		tm_file="${tm_file} rs6000/750cl.h" ;;
+ 	esac
++        case ${target} in
++	    *-linux*-musl*)
++		enable_secureplt=yes ;;
++	esac
++
+ 	if test x${enable_secureplt} = xyes; then
+ 		tm_file="rs6000/secureplt.h ${tm_file}"
+ 	fi
+Index: gcc-4.9.0/gcc/config/linux.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/linux.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/linux.h	2014-04-24 00:11:29.034028895 -0700
+@@ -32,10 +32,12 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
+@@ -53,18 +55,21 @@
+    uClibc or Bionic is the default C library and whether
+    -muclibc or -mglibc or -mbionic has been passed to change the default.  */
+ 
+-#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
+-  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
++#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD3, LD4)	\
++  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
+ 
+ #if DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U, B, M)
+ #elif DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G, B, M)
+ #elif DEFAULT_LIBC == LIBC_BIONIC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G, U, M)
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G, U, B)
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif /* DEFAULT_LIBC */
+@@ -84,16 +89,16 @@
+ 
+ #define GNU_USER_DYNAMIC_LINKER						\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
+-			 BIONIC_DYNAMIC_LINKER)
++			 BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+ #define GNU_USER_DYNAMIC_LINKER32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
+-			 BIONIC_DYNAMIC_LINKER32)
++			 BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
+ #define GNU_USER_DYNAMIC_LINKER64					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
+-			 BIONIC_DYNAMIC_LINKER64)
++			 BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
+ #define GNU_USER_DYNAMIC_LINKERX32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKERX32, \
+-			 BIONIC_DYNAMIC_LINKERX32)
++			 BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKERX32)
+ 
+ /* Whether we have Bionic libc runtime */
+ #undef TARGET_HAS_BIONIC
+@@ -127,3 +132,74 @@
+ # define TARGET_LIBC_HAS_FUNCTION linux_libc_has_function
+ 
+ #endif
++
++/* musl avoids problematic includes by rearranging the include directories.
++ * Unfortunately, this is mostly duplicated from cppdefault.c */
++#if DEFAULT_LIBC == LIBC_MUSL
++#define INCLUDE_DEFAULTS_MUSL_GPP			\
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
++
++#ifdef LOCAL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_LOCAL			\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_LOCAL
++#endif
++
++#ifdef PREFIX_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_PREFIX
++#endif
++
++#ifdef CROSS_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_CROSS			\
++    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#ifdef TOOL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_TOOL			\
++    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_TOOL
++#endif
++
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++#define INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_NATIVE
++#endif
++
++#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT)
++# undef INCLUDE_DEFAULTS_MUSL_LOCAL
++# define INCLUDE_DEFAULTS_MUSL_LOCAL
++# undef INCLUDE_DEFAULTS_MUSL_NATIVE
++# define INCLUDE_DEFAULTS_MUSL_NATIVE
++#else
++# undef INCLUDE_DEFAULTS_MUSL_CROSS
++# define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#undef INCLUDE_DEFAULTS
++#define INCLUDE_DEFAULTS				\
++  {							\
++    INCLUDE_DEFAULTS_MUSL_GPP				\
++    INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    INCLUDE_DEFAULTS_MUSL_CROSS				\
++    INCLUDE_DEFAULTS_MUSL_TOOL				\
++    INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
++    { 0, 0, 0, 0, 0, 0 }				\
++  }
++#endif
+Index: gcc-4.9.0/gcc/config/linux.opt
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/linux.opt	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/linux.opt	2014-04-22 22:44:17.280233817 -0700
+@@ -30,3 +30,7 @@
+ muclibc
+ Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
+ Use uClibc C library
++
++mmusl
++Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
++Use musl C library
+Index: gcc-4.9.0/gcc/ginclude/stddef.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/ginclude/stddef.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/ginclude/stddef.h	2014-04-22 22:44:17.280233817 -0700
+@@ -181,6 +181,7 @@
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -197,6 +198,7 @@
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__FreeBSD_kernel__)
+ /* __size_t is a typedef on FreeBSD 5, must not trash it. */
+@@ -214,6 +216,7 @@
+ typedef long ssize_t;
+ #endif /* __BEOS__ */
+ #endif /* !(defined (__GNUG__) && defined (size_t)) */
++#endif /* __DEFINED_size_t */
+ #endif /* __size_t */
+ #endif /* _SIZET_ */
+ #endif /* _GCC_SIZE_T */
+Index: gcc-4.9.0/gcc/config/rs6000/secureplt.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/rs6000/secureplt.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/rs6000/secureplt.h	2014-04-23 23:55:15.114024175 -0700
+@@ -18,3 +18,4 @@
+ <http://www.gnu.org/licenses/>.  */
+ 
+ #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
++#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
+Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/rs6000/sysv4.h	2014-04-23 23:52:13.854023015 -0700
++++ gcc-4.9.0/gcc/config/rs6000/sysv4.h	2014-04-24 00:10:55.550695334 -0700
+@@ -538,6 +538,10 @@
+ #define CC1_SECURE_PLT_DEFAULT_SPEC ""
+ #endif
+ 
++#ifndef LINK_SECURE_PLT_DEFAULT_SPEC
++#define LINK_SECURE_PLT_DEFAULT_SPEC ""
++#endif
++
+ /* Pass -G xxx to the compiler.  */
+ #define	CC1_SPEC "%{G*} %(cc1_cpu)" \
+ "%{meabi: %{!mcall-*: -mcall-sysv }} \
+@@ -585,7 +589,8 @@
+ 
+ /* Override the default target of the linker.  */
+ #define	LINK_TARGET_SPEC \
+-  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "")
++  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "") \
++  "%{!mbss-plt: %{!msecure-plt: %(link_secure_plt_default)}}"
+ 
+ /* Any specific OS flags.  */
+ #define LINK_OS_SPEC "\
+@@ -894,6 +899,7 @@
+   { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
+   { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
+   { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
++  { "link_secure_plt_default",	LINK_SECURE_PLT_DEFAULT_SPEC },		\
+   { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
+   { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
+   { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch b/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
new file mode 100644
index 0000000..605ac66
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
@@ -0,0 +1,205 @@
+# HG changeset patch
+# Parent 6738fd6f6fcc2a72f2ba527bda3325642af26885
+Support for arm-linux-musl.
+Upstream-Status: Backport [partial]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: gcc-4.9.2/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/arm/linux-eabi.h
++++ gcc-4.9.2/gcc/config/arm/linux-eabi.h
+@@ -81,6 +81,23 @@
+ #undef TARGET_FIX_V4BX_SPEC
+ #define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
+ 
++/* For ARM musl currently supports four dynamic linkers:
++   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
++   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
++   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
++   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
++   musl does not support the legacy OABI mode.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, EL. */
++#undef  MUSL_DYNAMIC_LINKER
++#if TARGET_BIG_ENDIAN_DEFAULT
++#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
++#else
++#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
++#endif
++#define MUSL_DYNAMIC_LINKER \
++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+Index: gcc-4.9.2/libitm/config/arm/hwcap.cc
+===================================================================
+--- gcc-4.9.2.orig/libitm/config/arm/hwcap.cc
++++ gcc-4.9.2/libitm/config/arm/hwcap.cc
+@@ -40,7 +40,11 @@ int GTM_hwcap HIDDEN = 0
+ 
+ #ifdef __linux__
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <sys/fcntl.h>
++#else
++#include <fcntl.h>
++#endif
+ #include <elf.h>
+ 
+ static void __attribute__((constructor))
+Index: gcc-4.9.2/gcc/config/i386/linux.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/i386/linux.h
++++ gcc-4.9.2/gcc/config/i386/linux.h
+@@ -21,3 +21,4 @@ along with GCC; see the file COPYING3.
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+ #define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+Index: gcc-4.9.2/gcc/config/i386/linux64.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/i386/linux64.h
++++ gcc-4.9.2/gcc/config/i386/linux64.h
+@@ -30,3 +30,8 @@ see the files COPYING3 and COPYING.RUNTI
+ #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+ #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
+ #define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
++
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
++
+Index: gcc-4.9.2/gcc/config/mips/linux.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/mips/linux.h
++++ gcc-4.9.2/gcc/config/mips/linux.h
+@@ -23,3 +23,6 @@ along with GCC; see the file COPYING3.
+ #undef UCLIBC_DYNAMIC_LINKER
+ #define UCLIBC_DYNAMIC_LINKER \
+   "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
++
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++
+Index: gcc-4.9.2/gcc/config/mips/linux64.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/mips/linux64.h
++++ gcc-4.9.2/gcc/config/mips/linux64.h
+@@ -39,6 +39,11 @@ along with GCC; see the file COPYING3.
+   "%{mnan=2008:" SYSTEMLIBS_DIR "ld-uClibc-mipsn8.so.0;:" SYSTEMLIBS_DIR "ld-uClibc.so.0}"
+ 
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
++
++#define MUSL_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
+-			 BIONIC_DYNAMIC_LINKERN32)
++			 BIONIC_DYNAMIC_LINKERN32, MUSL_DYNAMIC_LINKERN32)
+Index: gcc-4.9.2/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/rs6000/linux64.h
++++ gcc-4.9.2/gcc/config/rs6000/linux64.h
+@@ -375,17 +375,22 @@ extern int dot_symbols;
+ #endif
+ #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-powerpc.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-powerpc64.so.1"
++
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define GNU_USER_DYNAMIC_LINKER32 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
+ #define GNU_USER_DYNAMIC_LINKER64 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
+ 
+ #undef  DEFAULT_ASM_ENDIAN
+ #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
+Index: gcc-4.9.2/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/rs6000/sysv4.h
++++ gcc-4.9.2/gcc/config/rs6000/sysv4.h
+@@ -768,15 +768,19 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEF
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-powerpc.so.1"
++
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
+ #elif !defined (DEFAULT_LIBC) || DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define GNU_USER_DYNAMIC_LINKER \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+ 
+ #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+Index: gcc-4.9.2/libitm/config/linux/x86/tls.h
+===================================================================
+--- gcc-4.9.2.orig/libitm/config/linux/x86/tls.h
++++ gcc-4.9.2/libitm/config/linux/x86/tls.h
+@@ -25,16 +25,19 @@
+ #ifndef LIBITM_X86_TLS_H
+ #define LIBITM_X86_TLS_H 1
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ /* Use slots in the TCB head rather than __thread lookups.
+    GLIBC has reserved words 10 through 13 for TM.  */
+ #define HAVE_ARCH_GTM_THREAD 1
+ #define HAVE_ARCH_GTM_THREAD_DISP 1
+ #endif
++#endif
+ 
+ #include "config/generic/tls.h"
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ namespace GTM HIDDEN {
+ 
+ #ifdef __x86_64__
+@@ -101,5 +104,6 @@ static inline void set_abi_disp(struct a
+ 
+ } // namespace GTM
+ #endif /* >= GLIBC 2.10 */
++#endif
+ 
+ #endif // LIBITM_X86_TLS_H
+Index: gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- gcc-4.9.2.orig/gcc/config/aarch64/aarch64-linux.h
++++ gcc-4.9.2/gcc/config/aarch64/aarch64-linux.h
+@@ -25,6 +25,8 @@
+ 
+ #define CPP_SPEC "%{pthread:-D_REENTRANT}"
+ 
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
++
+ #define LINUX_TARGET_LINK_SPEC  "%{h*}		\
+    %{static:-Bstatic}				\
+    %{shared:-shared}				\
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch b/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
new file mode 100644
index 0000000..e2b18a4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
@@ -0,0 +1,21 @@
+# HG changeset patch
+# Parent 600a8a422ccaf5627ad1f5a138e7398df2b9e9d8
+Get rid of ever-broken fixincludes on musl.
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: gcc-4.9-20140316/fixincludes/mkfixinc.sh
+===================================================================
+--- gcc-4.9-20140316.orig/fixincludes/mkfixinc.sh
++++ gcc-4.9-20140316/fixincludes/mkfixinc.sh
+@@ -19,7 +19,8 @@ case $machine in
+     powerpc-*-eabi*    | \
+     powerpc-*-rtems*   | \
+     powerpcle-*-eabisim* | \
+-    powerpcle-*-eabi* )
++    powerpcle-*-eabi* | \
++    *-musl* )
+ 	#  IF there is no include fixing,
+ 	#  THEN create a no-op fixer and exit
+ 	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch b/meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
new file mode 100644
index 0000000..048e481
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.9-20140316/libstdc++-v3/configure.host
+===================================================================
+--- gcc-4.9-20140316.orig/libstdc++-v3/configure.host	2014-03-26 01:12:19.466008193 -0700
++++ gcc-4.9-20140316/libstdc++-v3/configure.host	2014-03-26 01:43:48.222684357 -0700
+@@ -264,14 +264,24 @@
+     os_include_dir="os/bsd/freebsd"
+     ;;
+   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
++    # check for musl by target
++    case "${host_os}" in
++      *-musl*)
++        os_include_dir="os/generic"
++        ;;
++      *)
+     if [ "$uclibc" = "yes" ]; then
+       os_include_dir="os/uclibc"
+     elif [ "$bionic" = "yes" ]; then
+       os_include_dir="os/bionic"
++    elif [ "$musl" = "yes" ]; then
++      os_include_dir="os/generic"
+     else
+       os_include_dir="os/gnu-linux"
+     fi
+     ;;
++    esac
++    ;;
+   hpux*)
+     os_include_dir="os/hpux"
+     ;;
diff --git a/meta/recipes-devtools/gcc/gcc-5.2.inc b/meta/recipes-devtools/gcc/gcc-5.2.inc
index a6b385a..af9d887 100644
--- a/meta/recipes-devtools/gcc/gcc-5.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.2.inc
@@ -74,6 +74,10 @@ SRC_URI = "\
            file://0040-nativesdk-gcc-support.patch \
            file://0041-handle-target-sysroot-multilib.patch \
            file://0042-cxxflags-for-build.patch \
+           file://0043-libstdc-musl.patch \
+           file://0044-gcc-musl-support.patch \
+           file://0045-musl-dynamic-linker.patch \
+           file://0046-musl-no-fixincludes.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch b/meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
new file mode 100644
index 0000000..048e481
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.9-20140316/libstdc++-v3/configure.host
+===================================================================
+--- gcc-4.9-20140316.orig/libstdc++-v3/configure.host	2014-03-26 01:12:19.466008193 -0700
++++ gcc-4.9-20140316/libstdc++-v3/configure.host	2014-03-26 01:43:48.222684357 -0700
+@@ -264,14 +264,24 @@
+     os_include_dir="os/bsd/freebsd"
+     ;;
+   gnu* | linux* | kfreebsd*-gnu | knetbsd*-gnu)
++    # check for musl by target
++    case "${host_os}" in
++      *-musl*)
++        os_include_dir="os/generic"
++        ;;
++      *)
+     if [ "$uclibc" = "yes" ]; then
+       os_include_dir="os/uclibc"
+     elif [ "$bionic" = "yes" ]; then
+       os_include_dir="os/bionic"
++    elif [ "$musl" = "yes" ]; then
++      os_include_dir="os/generic"
+     else
+       os_include_dir="os/gnu-linux"
+     fi
+     ;;
++    esac
++    ;;
+   hpux*)
+     os_include_dir="os/hpux"
+     ;;
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch b/meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
new file mode 100644
index 0000000..4d1ab87
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
@@ -0,0 +1,267 @@
+# HG changeset patch
+# Parent e5b4564f249f8634194bdabef4b3057d0e54ee97
+Adding -mmusl as a musl libc specifier, and the necessary hacks for it to know how to find musl's dynamic linker.
+
+Upstream-Status: Backport [partial]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: gcc-4.9.0/gcc/config.gcc
+===================================================================
+--- gcc-4.9.0.orig/gcc/config.gcc	2014-04-22 22:44:17.153567150 -0700
++++ gcc-4.9.0/gcc/config.gcc	2014-04-23 23:54:31.427357051 -0700
+@@ -594,7 +594,7 @@
+ esac
+ 
+ # Common C libraries.
+-tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3"
++tm_defines="$tm_defines LIBC_GLIBC=1 LIBC_UCLIBC=2 LIBC_BIONIC=3 LIBC_MUSL=4"
+ 
+ # 32-bit x86 processors supported by --with-arch=.  Each processor
+ # MUST be separated by exactly one space.
+@@ -719,6 +719,9 @@
+     *-*-*uclibc*)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_UCLIBC"
+       ;;
++    *-*-*musl*)
++      tm_defines="$tm_defines DEFAULT_LIBC=LIBC_MUSL"
++      ;;
+     *)
+       tm_defines="$tm_defines DEFAULT_LIBC=LIBC_GLIBC"
+       ;;
+@@ -2328,6 +2331,11 @@
+ 	    powerpc*-*-linux*paired*)
+ 		tm_file="${tm_file} rs6000/750cl.h" ;;
+ 	esac
++        case ${target} in
++	    *-linux*-musl*)
++		enable_secureplt=yes ;;
++	esac
++
+ 	if test x${enable_secureplt} = xyes; then
+ 		tm_file="rs6000/secureplt.h ${tm_file}"
+ 	fi
+Index: gcc-4.9.0/gcc/config/linux.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/linux.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/linux.h	2014-04-24 00:11:29.034028895 -0700
+@@ -32,10 +32,12 @@
+ #define OPTION_GLIBC  (DEFAULT_LIBC == LIBC_GLIBC)
+ #define OPTION_UCLIBC (DEFAULT_LIBC == LIBC_UCLIBC)
+ #define OPTION_BIONIC (DEFAULT_LIBC == LIBC_BIONIC)
++#define OPTION_MUSL   (DEFAULT_LIBC == LIBC_MUSL)
+ #else
+ #define OPTION_GLIBC  (linux_libc == LIBC_GLIBC)
+ #define OPTION_UCLIBC (linux_libc == LIBC_UCLIBC)
+ #define OPTION_BIONIC (linux_libc == LIBC_BIONIC)
++#define OPTION_MUSL   (linux_libc == LIBC_MUSL)
+ #endif
+ 
+ #define GNU_USER_TARGET_OS_CPP_BUILTINS()			\
+@@ -53,18 +55,21 @@
+    uClibc or Bionic is the default C library and whether
+    -muclibc or -mglibc or -mbionic has been passed to change the default.  */
+ 
+-#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LD1, LD2, LD3)	\
+-  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:" LD1 "}}"
++#define CHOOSE_DYNAMIC_LINKER1(LIBC1, LIBC2, LIBC3, LIBC4, LD1, LD2, LD3, LD4)	\
++  "%{" LIBC2 ":" LD2 ";:%{" LIBC3 ":" LD3 ";:%{" LIBC4 ":" LD4 ";:" LD1 "}}}"
+ 
+ #if DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", G, U, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mglibc", "muclibc", "mbionic", "mmusl", G, U, B, M)
+ #elif DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", U, G, B)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("muclibc", "mglibc", "mbionic", "mmusl", U, G, B, M)
+ #elif DEFAULT_LIBC == LIBC_BIONIC
+-#define CHOOSE_DYNAMIC_LINKER(G, U, B) \
+-  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", B, G, U)
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mbionic", "mglibc", "muclibc", "mmusl", B, G, U, M)
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, B, M) \
++  CHOOSE_DYNAMIC_LINKER1 ("mmusl", "mglibc", "muclibc", "mbionic", M, G, U, B)
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif /* DEFAULT_LIBC */
+@@ -84,16 +89,16 @@
+ 
+ #define GNU_USER_DYNAMIC_LINKER						\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER,	\
+-			 BIONIC_DYNAMIC_LINKER)
++			 BIONIC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+ #define GNU_USER_DYNAMIC_LINKER32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, \
+-			 BIONIC_DYNAMIC_LINKER32)
++			 BIONIC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
+ #define GNU_USER_DYNAMIC_LINKER64					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, \
+-			 BIONIC_DYNAMIC_LINKER64)
++			 BIONIC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
+ #define GNU_USER_DYNAMIC_LINKERX32					\
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERX32, UCLIBC_DYNAMIC_LINKERX32, \
+-			 BIONIC_DYNAMIC_LINKERX32)
++			 BIONIC_DYNAMIC_LINKERX32, MUSL_DYNAMIC_LINKERX32)
+ 
+ /* Whether we have Bionic libc runtime */
+ #undef TARGET_HAS_BIONIC
+@@ -127,3 +132,74 @@
+ # define TARGET_LIBC_HAS_FUNCTION linux_libc_has_function
+ 
+ #endif
++
++/* musl avoids problematic includes by rearranging the include directories.
++ * Unfortunately, this is mostly duplicated from cppdefault.c */
++#if DEFAULT_LIBC == LIBC_MUSL
++#define INCLUDE_DEFAULTS_MUSL_GPP			\
++    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
++    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
++      GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
++
++#ifdef LOCAL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_LOCAL			\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
++    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_LOCAL
++#endif
++
++#ifdef PREFIX_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_PREFIX
++#endif
++
++#ifdef CROSS_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_CROSS			\
++    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#ifdef TOOL_INCLUDE_DIR
++#define INCLUDE_DEFAULTS_MUSL_TOOL			\
++    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_TOOL
++#endif
++
++#ifdef NATIVE_SYSTEM_HEADER_DIR
++#define INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
++    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
++#else
++#define INCLUDE_DEFAULTS_MUSL_NATIVE
++#endif
++
++#if defined (CROSS_DIRECTORY_STRUCTURE) && !defined (TARGET_SYSTEM_ROOT)
++# undef INCLUDE_DEFAULTS_MUSL_LOCAL
++# define INCLUDE_DEFAULTS_MUSL_LOCAL
++# undef INCLUDE_DEFAULTS_MUSL_NATIVE
++# define INCLUDE_DEFAULTS_MUSL_NATIVE
++#else
++# undef INCLUDE_DEFAULTS_MUSL_CROSS
++# define INCLUDE_DEFAULTS_MUSL_CROSS
++#endif
++
++#undef INCLUDE_DEFAULTS
++#define INCLUDE_DEFAULTS				\
++  {							\
++    INCLUDE_DEFAULTS_MUSL_GPP				\
++    INCLUDE_DEFAULTS_MUSL_PREFIX			\
++    INCLUDE_DEFAULTS_MUSL_CROSS				\
++    INCLUDE_DEFAULTS_MUSL_TOOL				\
++    INCLUDE_DEFAULTS_MUSL_NATIVE			\
++    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
++    { 0, 0, 0, 0, 0, 0 }				\
++  }
++#endif
+Index: gcc-4.9.0/gcc/config/linux.opt
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/linux.opt	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/linux.opt	2014-04-22 22:44:17.280233817 -0700
+@@ -30,3 +30,7 @@
+ muclibc
+ Target Report RejectNegative Var(linux_libc,LIBC_UCLIBC) Negative(mbionic)
+ Use uClibc C library
++
++mmusl
++Target Report RejectNegative Var(linux_libc,LIBC_MUSL) Negative(mglibc)
++Use musl C library
+Index: gcc-4.9.0/gcc/ginclude/stddef.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/ginclude/stddef.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/ginclude/stddef.h	2014-04-22 22:44:17.280233817 -0700
+@@ -181,6 +181,7 @@
+ #ifndef _GCC_SIZE_T
+ #ifndef _SIZET_
+ #ifndef __size_t
++#ifndef __DEFINED_size_t /* musl */
+ #define __size_t__	/* BeOS */
+ #define __SIZE_T__	/* Cray Unicos/Mk */
+ #define _SIZE_T
+@@ -197,6 +198,7 @@
+ #define ___int_size_t_h
+ #define _GCC_SIZE_T
+ #define _SIZET_
++#define __DEFINED_size_t /* musl */
+ #if (defined (__FreeBSD__) && (__FreeBSD__ >= 5)) \
+   || defined(__FreeBSD_kernel__)
+ /* __size_t is a typedef on FreeBSD 5, must not trash it. */
+@@ -214,6 +216,7 @@
+ typedef long ssize_t;
+ #endif /* __BEOS__ */
+ #endif /* !(defined (__GNUG__) && defined (size_t)) */
++#endif /* __DEFINED_size_t */
+ #endif /* __size_t */
+ #endif /* _SIZET_ */
+ #endif /* _GCC_SIZE_T */
+Index: gcc-4.9.0/gcc/config/rs6000/secureplt.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/rs6000/secureplt.h	2014-01-02 14:23:26.000000000 -0800
++++ gcc-4.9.0/gcc/config/rs6000/secureplt.h	2014-04-23 23:55:15.114024175 -0700
+@@ -18,3 +18,4 @@
+ <http://www.gnu.org/licenses/>.  */
+ 
+ #define CC1_SECURE_PLT_DEFAULT_SPEC "-msecure-plt"
++#define LINK_SECURE_PLT_DEFAULT_SPEC "--secure-plt"
+Index: gcc-4.9.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-4.9.0.orig/gcc/config/rs6000/sysv4.h	2014-04-23 23:52:13.854023015 -0700
++++ gcc-4.9.0/gcc/config/rs6000/sysv4.h	2014-04-24 00:10:55.550695334 -0700
+@@ -538,6 +538,10 @@
+ #define CC1_SECURE_PLT_DEFAULT_SPEC ""
+ #endif
+ 
++#ifndef LINK_SECURE_PLT_DEFAULT_SPEC
++#define LINK_SECURE_PLT_DEFAULT_SPEC ""
++#endif
++
+ /* Pass -G xxx to the compiler.  */
+ #define	CC1_SPEC "%{G*} %(cc1_cpu)" \
+ "%{meabi: %{!mcall-*: -mcall-sysv }} \
+@@ -585,7 +589,8 @@
+ 
+ /* Override the default target of the linker.  */
+ #define	LINK_TARGET_SPEC \
+-  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "")
++  ENDIAN_SELECT("", " --oformat elf32-powerpcle", "") \
++  "%{!mbss-plt: %{!msecure-plt: %(link_secure_plt_default)}}"
+ 
+ /* Any specific OS flags.  */
+ #define LINK_OS_SPEC "\
+@@ -894,6 +899,7 @@
+   { "link_os_openbsd",		LINK_OS_OPENBSD_SPEC },			\
+   { "link_os_default",		LINK_OS_DEFAULT_SPEC },			\
+   { "cc1_secure_plt_default",	CC1_SECURE_PLT_DEFAULT_SPEC },		\
++  { "link_secure_plt_default",	LINK_SECURE_PLT_DEFAULT_SPEC },		\
+   { "cpp_os_ads",		CPP_OS_ADS_SPEC },			\
+   { "cpp_os_yellowknife",	CPP_OS_YELLOWKNIFE_SPEC },		\
+   { "cpp_os_mvme",		CPP_OS_MVME_SPEC },			\
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch b/meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
new file mode 100644
index 0000000..3dadb95
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
@@ -0,0 +1,198 @@
+# HG changeset patch
+# Parent 6738fd6f6fcc2a72f2ba527bda3325642af26885
+Support for arm-linux-musl.
+
+Upstream-Status: backport [partial]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: gcc-5.1.0/gcc/config/arm/linux-eabi.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/arm/linux-eabi.h
++++ gcc-5.1.0/gcc/config/arm/linux-eabi.h
+@@ -81,6 +81,23 @@
+ #undef TARGET_FIX_V4BX_SPEC
+ #define TARGET_FIX_V4BX_SPEC "%{mcpu=arm8|mcpu=arm810|mcpu=strongarm*|march=armv4: --fix-v4bx}"
+ 
++/* For ARM musl currently supports four dynamic linkers:
++   - ld-musl-arm.so.1 - for the EABI-derived soft-float ABI
++   - ld-musl-armhf.so.1 - for the EABI-derived hard-float ABI
++   - ld-musl-armeb.so.1 - for the EABI-derived soft-float ABI, EB
++   - ld-musl-armebhf.so.1 - for the EABI-derived hard-float ABI, EB
++   musl does not support the legacy OABI mode.
++   All the dynamic linkers live in /lib.
++   We default to soft-float, EL. */
++#undef  MUSL_DYNAMIC_LINKER
++#if TARGET_BIG_ENDIAN_DEFAULT
++#define MUSL_DYNAMIC_LINKER_E "%{mlittle-endian:;:eb}"
++#else
++#define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
++#endif
++#define MUSL_DYNAMIC_LINKER \
++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E "%{mfloat-abi=hard:hf}.so.1"
++
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
+    use the GNU/Linux version, not the generic BPABI version.  */
+ #undef  LINK_SPEC
+Index: gcc-5.1.0/libitm/config/arm/hwcap.cc
+===================================================================
+--- gcc-5.1.0.orig/libitm/config/arm/hwcap.cc
++++ gcc-5.1.0/libitm/config/arm/hwcap.cc
+@@ -40,7 +40,11 @@ int GTM_hwcap HIDDEN = 0
+ 
+ #ifdef __linux__
+ #include <unistd.h>
++#ifdef __GLIBC__
+ #include <sys/fcntl.h>
++#else
++#include <fcntl.h>
++#endif
+ #include <elf.h>
+ 
+ static void __attribute__((constructor))
+Index: gcc-5.1.0/gcc/config/i386/linux.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/i386/linux.h
++++ gcc-5.1.0/gcc/config/i386/linux.h
+@@ -21,3 +21,4 @@ along with GCC; see the file COPYING3.
+ 
+ #define GNU_USER_LINK_EMULATION "elf_i386"
+ #define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
+Index: gcc-5.1.0/gcc/config/i386/linux64.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/i386/linux64.h
++++ gcc-5.1.0/gcc/config/i386/linux64.h
+@@ -30,3 +30,8 @@ see the files COPYING3 and COPYING.RUNTI
+ #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+ #define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-linux-x86-64.so.2"
+ #define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
++
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
++
+Index: gcc-5.1.0/gcc/config/mips/linux.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/mips/linux.h
++++ gcc-5.1.0/gcc/config/mips/linux.h
+@@ -21,6 +21,10 @@ along with GCC; see the file COPYING3.
+ #define GNU_USER_LINK_EMULATION64 "elf64%{EB:b}%{EL:l}tsmip"
+ #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
+ 
++#define MUSL_DYNAMIC_LINKERN32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-mips.so.1"
++
+ #define GLIBC_DYNAMIC_LINKER32 \
+   "%{mnan=2008:" SYSTEMLIBS_DIR "ld-linux-mipsn8.so.1;:" SYSTEMLIBS_DIR "ld.so.1}"
+ #define GLIBC_DYNAMIC_LINKER64 \
+@@ -40,4 +44,4 @@ along with GCC; see the file COPYING3.
+ #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
+ #define GNU_USER_DYNAMIC_LINKERN32 \
+   CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKERN32, UCLIBC_DYNAMIC_LINKERN32, \
+-                         BIONIC_DYNAMIC_LINKERN32)
++                         BIONIC_DYNAMIC_LINKERN32,  MUSL_DYNAMIC_LINKERN32)
+Index: gcc-5.1.0/gcc/config/rs6000/linux64.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/rs6000/linux64.h
++++ gcc-5.1.0/gcc/config/rs6000/linux64.h
+@@ -365,17 +365,22 @@ extern int dot_symbols;
+ #endif
+ #define UCLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-uClibc.so.0"
+ #define UCLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64-uClibc.so.0"
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-powerpc.so.1"
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-powerpc64.so.1"
++
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
+ #elif DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define GNU_USER_DYNAMIC_LINKER32 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER32, UCLIBC_DYNAMIC_LINKER32, MUSL_DYNAMIC_LINKER32)
+ #define GNU_USER_DYNAMIC_LINKER64 \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER64, UCLIBC_DYNAMIC_LINKER64, MUSL_DYNAMIC_LINKER64)
+ 
+ #undef  DEFAULT_ASM_ENDIAN
+ #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
+Index: gcc-5.1.0/gcc/config/rs6000/sysv4.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/rs6000/sysv4.h
++++ gcc-5.1.0/gcc/config/rs6000/sysv4.h
+@@ -769,15 +769,19 @@ ENDIAN_SELECT(" -mbig", " -mlittle", DEF
+ 
+ #define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
+ #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
++#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-powerpc.so.1"
++
+ #if DEFAULT_LIBC == LIBC_UCLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{mmusl:" M ";:" U "}}"
++#elif DEFAULT_LIBC == LIBC_MUSL
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{mglibc:" G ";:%{muclibc:" U ";:" M "}}"
+ #elif !defined (DEFAULT_LIBC) || DEFAULT_LIBC == LIBC_GLIBC
+-#define CHOOSE_DYNAMIC_LINKER(G, U) "%{muclibc:" U ";:" G "}"
++#define CHOOSE_DYNAMIC_LINKER(G, U, M) "%{muclibc:" U ";:%{mmusl:" M ";:" G "}}"
+ #else
+ #error "Unsupported DEFAULT_LIBC"
+ #endif
+ #define GNU_USER_DYNAMIC_LINKER \
+-  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER)
++  CHOOSE_DYNAMIC_LINKER (GLIBC_DYNAMIC_LINKER, UCLIBC_DYNAMIC_LINKER, MUSL_DYNAMIC_LINKER)
+ 
+ #define LINK_OS_LINUX_SPEC "-m elf32ppclinux %{!shared: %{!static: \
+   %{rdynamic:-export-dynamic} \
+Index: gcc-5.1.0/libitm/config/linux/x86/tls.h
+===================================================================
+--- gcc-5.1.0.orig/libitm/config/linux/x86/tls.h
++++ gcc-5.1.0/libitm/config/linux/x86/tls.h
+@@ -25,16 +25,19 @@
+ #ifndef LIBITM_X86_TLS_H
+ #define LIBITM_X86_TLS_H 1
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ /* Use slots in the TCB head rather than __thread lookups.
+    GLIBC has reserved words 10 through 13 for TM.  */
+ #define HAVE_ARCH_GTM_THREAD 1
+ #define HAVE_ARCH_GTM_THREAD_DISP 1
+ #endif
++#endif
+ 
+ #include "config/generic/tls.h"
+ 
+-#if defined(__GLIBC_PREREQ) && __GLIBC_PREREQ(2, 10)
++#if defined(__GLIBC_PREREQ)
++#if __GLIBC_PREREQ(2, 10)
+ namespace GTM HIDDEN {
+ 
+ #ifdef __x86_64__
+@@ -101,5 +104,6 @@ static inline void set_abi_disp(struct a
+ 
+ } // namespace GTM
+ #endif /* >= GLIBC 2.10 */
++#endif
+ 
+ #endif // LIBITM_X86_TLS_H
+Index: gcc-5.1.0/gcc/config/aarch64/aarch64-linux.h
+===================================================================
+--- gcc-5.1.0.orig/gcc/config/aarch64/aarch64-linux.h
++++ gcc-5.1.0/gcc/config/aarch64/aarch64-linux.h
+@@ -22,6 +22,7 @@
+ #define GCC_AARCH64_LINUX_H
+ 
+ #define GLIBC_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-linux-aarch64%{mbig-endian:_be}%{mabi=ilp32:_ilp32}.so.1"
++#define MUSL_DYNAMIC_LINKER  SYSTEMLIBS_DIR "ld-musl-aarch64.so.1"
+ 
+ #undef  ASAN_CC1_SPEC
+ #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
diff --git a/meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch b/meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
new file mode 100644
index 0000000..05fe52f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
@@ -0,0 +1,22 @@
+# HG changeset patch
+# Parent 600a8a422ccaf5627ad1f5a138e7398df2b9e9d8
+Get rid of ever-broken fixincludes on musl.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Index: gcc-4.9-20140316/fixincludes/mkfixinc.sh
+===================================================================
+--- gcc-4.9-20140316.orig/fixincludes/mkfixinc.sh
++++ gcc-4.9-20140316/fixincludes/mkfixinc.sh
+@@ -19,7 +19,8 @@ case $machine in
+     powerpc-*-eabi*    | \
+     powerpc-*-rtems*   | \
+     powerpcle-*-eabisim* | \
+-    powerpcle-*-eabi* )
++    powerpcle-*-eabi* | \
++    *-musl* )
+ 	#  IF there is no include fixing,
+ 	#  THEN create a no-op fixer and exit
+ 	(echo "#! /bin/sh" ; echo "exit 0" ) > ${target}
-- 
2.6.3


