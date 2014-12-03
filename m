Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A51DF60673
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 01:18:09 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Dec 2014 17:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,691,1406617200"; d="scan'208";a="492641390"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.114])
	by orsmga003.jf.intel.com with ESMTP; 02 Dec 2014 17:14:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Dec 2014 17:18:05 -0800
Message-Id: <8740d1ee8174975ad7b14b888d6358e9340e49f4.1417552133.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
In-Reply-To: <cover.1417552133.git.sgw@linux.intel.com>
References: <cover.1417552133.git.sgw@linux.intel.com>
Subject: [PATCH 1/4] libaio: Upgrade to 3.110
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
X-List-Received-Date: Wed, 03 Dec 2014 01:18:12 -0000

Rebase and delete patches for new release

libaio does not build with PIE flags enabled

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/security_flags.inc        |   1 +
 .../recipes-extended/libaio/libaio/00_arches.patch | 208 ++-------------------
 .../libaio/libaio/libaio-aarch64.patch             |  28 ---
 .../libaio/libaio/libaio_fix_for_mips64.patch      |  68 ++++---
 .../recipes-extended/libaio/libaio/toolchain.patch |  27 ---
 .../{libaio_0.3.109.bb => libaio_0.3.110.bb}       |   9 +-
 6 files changed, 63 insertions(+), 278 deletions(-)
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/toolchain.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.109.bb => libaio_0.3.110.bb} (74%)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 60156c0..bc8a577 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -43,6 +43,7 @@ SECURITY_CFLAGS_pn-gst-plugins-gl = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gstreamer1.0-plugins-good = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-harfbuzz = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index 91f4588..9d6447d 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -2,10 +2,10 @@ Upstream-Status: Inappropriate [embedded specific]
 
 from openembedded, added by Qing He <qing.he@intel.com>
 
-Index: libaio-0.3.109/src/syscall-m68k.h
+Index: libaio-0.3.110/src/syscall-m68k.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-m68k.h
++++ libaio-0.3.110/src/syscall-m68k.h
 @@ -0,0 +1,78 @@
 +#define __NR_io_setup		241
 +#define __NR_io_destroy		242
@@ -85,164 +85,27 @@ Index: libaio-0.3.109/src/syscall-m68k.h
 +return (type) __res; \
 +}
 +
-Index: libaio-0.3.109/src/syscall-sparc.h
+Index: libaio-0.3.110/src/syscall.h
 ===================================================================
---- /dev/null
-+++ libaio-0.3.109/src/syscall-sparc.h
-@@ -0,0 +1,130 @@
-+/* $Id: unistd.h,v 1.74 2002/02/08 03:57:18 davem Exp $ */
-+
-+/*
-+ * System calls under the Sparc.
-+ *
-+ * Don't be scared by the ugly clobbers, it is the only way I can
-+ * think of right now to force the arguments into fixed registers
-+ * before the trap into the system call with gcc 'asm' statements.
-+ *
-+ * Copyright (C) 1995 David S. Miller (davem@caip.rutgers.edu)
-+ *
-+ * SunOS compatibility based upon preliminary work which is:
-+ *
-+ * Copyright (C) 1995 Adrian M. Rodriguez (adrian@remus.rutgers.edu)
-+ */
-+
-+
-+#define __NR_io_setup		268
-+#define __NR_io_destroy		269
-+#define __NR_io_submit		270
-+#define __NR_io_cancel		271
-+#define __NR_io_getevents	272
-+
-+
-+#define io_syscall1(type,fname,sname,type1,arg1) \
-+type fname(type1 arg1) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res >= 0) \
-+	return (type) __res; \
-+return -1; \
-+}
-+
-+#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2) \
-+type fname(type1 arg1,type2 arg2) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res >= 0) \
-+	return (type) __res; \
-+return -1; \
-+}
-+
-+#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3) \
-+type fname(type1 arg1,type2 arg2,type3 arg3) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
-+}
-+
-+#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
-+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+register long __o3 __asm__ ("o3") = (long)(arg4); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__o3), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
-+}
-+
-+#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4, \
-+	  type5,arg5) \
-+type fname(type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5) \
-+{ \
-+long __res; \
-+register long __g1 __asm__ ("g1") = __NR_##sname; \
-+register long __o0 __asm__ ("o0") = (long)(arg1); \
-+register long __o1 __asm__ ("o1") = (long)(arg2); \
-+register long __o2 __asm__ ("o2") = (long)(arg3); \
-+register long __o3 __asm__ ("o3") = (long)(arg4); \
-+register long __o4 __asm__ ("o4") = (long)(arg5); \
-+__asm__ __volatile__ ("t 0x10\n\t" \
-+		      "bcc 1f\n\t" \
-+		      "mov %%o0, %0\n\t" \
-+		      "sub %%g0, %%o0, %0\n\t" \
-+		      "1:\n\t" \
-+		      : "=r" (__res), "=&r" (__o0) \
-+		      : "1" (__o0), "r" (__o1), "r" (__o2), "r" (__o3), "r" (__o4), "r" (__g1) \
-+		      : "cc"); \
-+if (__res < -255 || __res>=0) \
-+	return (type) __res; \
-+return -1; \
-+}
-+
-Index: libaio-0.3.109/src/syscall.h
-===================================================================
---- libaio-0.3.109.orig/src/syscall.h
-+++ libaio-0.3.109/src/syscall.h
-@@ -24,6 +24,14 @@
- #include "syscall-alpha.h"
- #elif defined(__arm__)
- #include "syscall-arm.h"
+--- libaio-0.3.110.orig/src/syscall.h
++++ libaio-0.3.110/src/syscall.h
+@@ -28,6 +28,12 @@
+ #include "syscall-sparc.h"
+ #elif defined(__aarch64__)
+ #include "syscall-arm64.h"
 +#elif defined(__m68k__)
 +#include "syscall-m68k.h"
-+#elif defined(__sparc__)
-+#include "syscall-sparc.h"
 +#elif defined(__hppa__)
 +#include "syscall-parisc.h"
 +#elif defined(__mips__)
 +#include "syscall-mips.h"
  #else
- #error "add syscall-arch.h"
- #endif
-Index: libaio-0.3.109/src/syscall-mips.h
+ #warning "using generic syscall method"
+ #include "syscall-generic.h"
+Index: libaio-0.3.110/src/syscall-mips.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-mips.h
++++ libaio-0.3.110/src/syscall-mips.h
 @@ -0,0 +1,223 @@
 +/*
 + * This file is subject to the terms and conditions of the GNU General Public
@@ -467,45 +330,10 @@ Index: libaio-0.3.109/src/syscall-mips.h
 +
 +#endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
 +
-Index: libaio-0.3.109/src/libaio.h
-===================================================================
---- libaio-0.3.109.orig/src/libaio.h
-+++ libaio-0.3.109/src/libaio.h
-@@ -83,6 +83,30 @@ typedef enum io_iocb_cmd {
- #define PADDEDptr(x, y)	x; unsigned y
- #define PADDEDul(x, y)	unsigned long x; unsigned y
- #  endif
-+#elif defined(__m68k__) /* big endian, 32 bits */
-+#define PADDED(x, y)   unsigned y; x
-+#define PADDEDptr(x, y)        unsigned y; x
-+#define PADDEDul(x, y) unsigned y; unsigned long x
-+#elif defined(__sparc__) /* big endian, 32 bits */
-+#define PADDED(x, y)   unsigned y; x
-+#define PADDEDptr(x, y)        unsigned y; x
-+#define PADDEDul(x, y) unsigned y; unsigned long x
-+#elif defined(__hppa__) /* big endian, 32 bits */
-+#define PADDED(x, y)   unsigned y; x
-+#define PADDEDptr(x, y)        unsigned y; x
-+#define PADDEDul(x, y) unsigned y; unsigned long x
-+#elif defined(__mips__)
-+#  if defined (__MIPSEB__) /* big endian, 32 bits */
-+#define PADDED(x, y)   unsigned y; x
-+#define PADDEDptr(x, y)        unsigned y; x
-+#define PADDEDul(x, y) unsigned y; unsigned long x
-+#  elif defined(__MIPSEL__) /* little endian, 32 bits */
-+#define PADDED(x, y)   x; unsigned y
-+#define PADDEDptr(x, y)        x; unsigned y
-+#define PADDEDul(x, y) unsigned long x; unsigned y
-+#  else
-+#    error "neither mipseb nor mipsel?"
-+#  endif
- #else
- #error	endian?
- #endif
-Index: libaio-0.3.109/src/syscall-parisc.h
+Index: libaio-0.3.110/src/syscall-parisc.h
 ===================================================================
 --- /dev/null
-+++ libaio-0.3.109/src/syscall-parisc.h
++++ libaio-0.3.110/src/syscall-parisc.h
 @@ -0,0 +1,146 @@
 +/*
 + * Linux system call numbers.
@@ -653,10 +481,10 @@ Index: libaio-0.3.109/src/syscall-parisc.h
 +    return K_INLINE_SYSCALL(sname, 5, arg1, arg2, arg3, arg4, arg5);	\
 +}
 +
-Index: libaio-0.3.109/src/syscall-arm.h
+Index: libaio-0.3.110/src/syscall-arm.h
 ===================================================================
---- libaio-0.3.109.orig/src/syscall-arm.h
-+++ libaio-0.3.109/src/syscall-arm.h
+--- libaio-0.3.110.orig/src/syscall-arm.h
++++ libaio-0.3.110/src/syscall-arm.h
 @@ -114,3 +114,119 @@ type fname(type1 arg1, type2 arg2, type3
    return (type) __res_r0;						\
  }
diff --git a/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch b/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
deleted file mode 100644
index e3d1058..0000000
--- a/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Submitted
-
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
-
----
- harness/cases/16.t |    2 ++
- src/libaio.h       |   10 ++++++++++
- 2 files changed, 12 insertions(+)
-
---- a/src/libaio.h
-+++ b/src/libaio.h
-@@ -107,6 +107,16 @@
- #  else
- #    error "neither mipseb nor mipsel?"
- #  endif
-+#elif defined(__aarch64__)
-+#  if defined (__AARCH64EB__) /* big endian, 64 bits */
-+#define PADDED(x, y)    unsigned y; x
-+#define PADDEDptr(x,y)  x
-+#define PADDEDul(x, y)  unsigned long x
-+#  elif defined(__AARCH64EL__) /* little endian, 64 bits */
-+#define PADDED(x, y)    x, y
-+#define PADDEDptr(x, y) x
-+#define PADDEDul(x, y)  unsigned long x
-+#  endif
- #else
- #error	endian?
- #endif
diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
index 0ef9f14..9d4bb46 100644
--- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
@@ -14,29 +14,45 @@ Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
  src/libaio.h | 12 ++++++++++++
  1 file changed, 12 insertions(+)
 
-diff --git a/src/libaio.h b/src/libaio.h
-index ff99188..64ea8f3 100644
---- a/src/libaio.h
-+++ b/src/libaio.h
-@@ -95,6 +95,18 @@ typedef enum io_iocb_cmd {
- #define PADDED(x, y)   unsigned y; x
- #define PADDEDptr(x, y)        unsigned y; x
- #define PADDEDul(x, y) unsigned y; unsigned long x
-+#elif defined(__mips64)
-+#  if defined (__MIPSEB__) /* big endian, 64 bits */
-+#define PADDED(x, y)	unsigned y; x
-+#define PADDEDptr(x,y)	x
-+#define PADDEDul(x, y)	unsigned long x
-+#  elif defined(__MIPSEL__) /* little endian, 64 bits */
-+#define PADDED(x, y)	x, y
-+#define PADDEDptr(x, y)	x
-+#define PADDEDul(x, y)	unsigned long x
-+#  else
-+#    error "mips64: neither mipseb nor mipsel?"
-+#  endif
- #elif defined(__mips__)
- #  if defined (__MIPSEB__) /* big endian, 32 bits */
- #define PADDED(x, y)   unsigned y; x
--- 
-1.8.2.1
-
+Index: libaio-0.3.110/src/libaio.h
+===================================================================
+--- libaio-0.3.110.orig/src/libaio.h
++++ libaio-0.3.110/src/libaio.h
+@@ -51,7 +51,7 @@ typedef enum io_iocb_cmd {
+ 
+ /* little endian, 32 bits */
+ #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
+-    defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
++    defined(__sh__) || defined(__bfin__) || (defined(__mips__) && defined(__MIPSEL__)) || \
+     defined(__cris__)
+ #define PADDED(x, y)	x; unsigned y
+ #define PADDEDptr(x, y)	x; unsigned y
+@@ -59,7 +59,8 @@ typedef enum io_iocb_cmd {
+ 
+ /* little endian, 64 bits */
+ #elif defined(__ia64__) || defined(__x86_64__) || defined(__alpha__) || \
+-      (defined(__aarch64__) && defined(__AARCH64EL__))
++      (defined(__aarch64__) && defined(__AARCH64EL__)) || \
++      (defined(__mips64) && defined(__MIPSEL__))
+ #define PADDED(x, y)	x, y
+ #define PADDEDptr(x, y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -67,7 +68,8 @@ typedef enum io_iocb_cmd {
+ /* big endian, 64 bits */
+ #elif defined(__powerpc64__) || defined(__s390x__) || \
+       (defined(__sparc__) && defined(__arch64__)) || \
+-      (defined(__aarch64__) && defined(__AARCH64EB__))
++      (defined(__aarch64__) && defined(__AARCH64EB__)) || \
++      (defined(__mips64) && defined(__MIPSEL__))
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x,y)	x
+ #define PADDEDul(x, y)	unsigned long x
+@@ -75,7 +77,7 @@ typedef enum io_iocb_cmd {
+ /* big endian, 32 bits */
+ #elif defined(__PPC__) || defined(__s390__) || \
+       (defined(__arm__) && defined(__ARMEB__)) || \
+-      defined(__sparc__) || defined(__MIPSEB__) || defined(__m68k__) || \
++      defined(__sparc__) || (defined(__mips__) && defined(__MIPSEB__)) || defined(__m68k__) || \
+       defined(__hppa__) || defined(__frv__) || defined(__avr32__)
+ #define PADDED(x, y)	unsigned y; x
+ #define PADDEDptr(x, y)	unsigned y; x
diff --git a/meta/recipes-extended/libaio/libaio/toolchain.patch b/meta/recipes-extended/libaio/libaio/toolchain.patch
deleted file mode 100644
index 4d88ec1..0000000
--- a/meta/recipes-extended/libaio/libaio/toolchain.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-8/27/2010 - created by Qing He <qing.he@intel.com>
-
-diff --git a/src/Makefile b/src/Makefile
-index 8d134cc..df8e5b6 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -2,7 +2,6 @@ prefix=/usr
- includedir=$(prefix)/include
- libdir=$(prefix)/lib
- 
--ARCH := $(shell uname -m | sed -e s/i.86/i386/)
- CFLAGS := -nostdlib -nostartfiles -Wall -I. -g -fomit-frame-pointer -O2 -fPIC
- SO_CFLAGS=-shared $(CFLAGS)
- L_CFLAGS=$(CFLAGS)
-@@ -44,8 +43,8 @@ $(libaio_objs) $(libaio_sobjs): libaio.h vsys_def.h
- 
- libaio.a: $(libaio_objs)
- 	rm -f libaio.a
--	ar r libaio.a $^
--	ranlib libaio.a
-+	$(AR) r libaio.a $^
-+	$(RANLIB) libaio.a
- 
- $(libname): $(libaio_sobjs) libaio.map
- 	$(CC) $(SO_CFLAGS) -Wl,--version-script=libaio.map -Wl,-soname=$(soname) -o $@ $(libaio_sobjs) $(LINK_FLAGS)
diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.110.bb
similarity index 74%
rename from meta/recipes-extended/libaio/libaio_0.3.109.bb
rename to meta/recipes-extended/libaio/libaio_0.3.110.bb
index 0483c71..5d69282 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.110.bb
@@ -5,21 +5,16 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-PR = "r2"
-
 SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://00_arches.patch \
-           file://toolchain.patch \
            file://destdir.patch \
            file://libaio_fix_for_x32.patch \
-           file://libaio-generic.patch \
-           file://libaio-aarch64.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://libaio_fix_for_mips64.patch \
 "
 
-SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
-SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d"
+SRC_URI[md5sum] = "2a35602e43778383e2f4907a4ca39ab8"
+SRC_URI[sha256sum] = "e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 
-- 
1.8.3.1


