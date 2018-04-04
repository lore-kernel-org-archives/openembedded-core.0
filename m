Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 18EAB74858
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 11:20:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 04:20:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="40599845"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 04 Apr 2018 04:20:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 14:13:15 +0300
Message-Id: <20180404111321.10824-16-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 16/22] libaio: update to 0.3.111
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
X-List-Received-Date: Wed, 04 Apr 2018 11:20:12 -0000

Remove:
generic-arch-dectection-for-padding-defines.patch (was a backport)
libaio_fix_for_x32.patch (is patching source code that no longer exists)

Rebase:
00_arches.patch (drop the arm bits, as they no longer exist upstream either)

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-extended/libaio/libaio/00_arches.patch | 194 +++++----------------
 ...neric-arch-dectection-for-padding-defines.patch |  65 -------
 .../libaio/libaio/libaio_fix_for_x32.patch         |  61 -------
 .../{libaio_0.3.110.bb => libaio_0.3.111.bb}       |  11 +-
 4 files changed, 47 insertions(+), 284 deletions(-)
 delete mode 100644 meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
 delete mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
 rename meta/recipes-extended/libaio/{libaio_0.3.110.bb => libaio_0.3.111.bb} (57%)

diff --git a/meta/recipes-extended/libaio/libaio/00_arches.patch b/meta/recipes-extended/libaio/libaio/00_arches.patch
index 9d6447d98a2..bec189f87ca 100644
--- a/meta/recipes-extended/libaio/libaio/00_arches.patch
+++ b/meta/recipes-extended/libaio/libaio/00_arches.patch
@@ -1,11 +1,27 @@
+From ceba1e03e5b57cdae0b3b2d2c9afebc085c986d8 Mon Sep 17 00:00:00 2001
+From: Qing He <qing.he@intel.com>
+Date: Fri, 27 Aug 2010 10:15:31 +0800
+Subject: [PATCH] libaio: add new recipe
+
 Upstream-Status: Inappropriate [embedded specific]
 
 from openembedded, added by Qing He <qing.he@intel.com>
 
-Index: libaio-0.3.110/src/syscall-m68k.h
-===================================================================
+---
+ src/syscall-m68k.h   |  78 ++++++++++++++++++
+ src/syscall-mips.h   | 223 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/syscall-parisc.h | 146 +++++++++++++++++++++++++++++++++
+ src/syscall.h        |   6 ++
+ 4 files changed, 453 insertions(+)
+ create mode 100644 src/syscall-m68k.h
+ create mode 100644 src/syscall-mips.h
+ create mode 100644 src/syscall-parisc.h
+
+diff --git a/src/syscall-m68k.h b/src/syscall-m68k.h
+new file mode 100644
+index 0000000..f440412
 --- /dev/null
-+++ libaio-0.3.110/src/syscall-m68k.h
++++ b/src/syscall-m68k.h
 @@ -0,0 +1,78 @@
 +#define __NR_io_setup		241
 +#define __NR_io_destroy		242
@@ -85,27 +101,11 @@ Index: libaio-0.3.110/src/syscall-m68k.h
 +return (type) __res; \
 +}
 +
-Index: libaio-0.3.110/src/syscall.h
-===================================================================
---- libaio-0.3.110.orig/src/syscall.h
-+++ libaio-0.3.110/src/syscall.h
-@@ -28,6 +28,12 @@
- #include "syscall-sparc.h"
- #elif defined(__aarch64__)
- #include "syscall-arm64.h"
-+#elif defined(__m68k__)
-+#include "syscall-m68k.h"
-+#elif defined(__hppa__)
-+#include "syscall-parisc.h"
-+#elif defined(__mips__)
-+#include "syscall-mips.h"
- #else
- #warning "using generic syscall method"
- #include "syscall-generic.h"
-Index: libaio-0.3.110/src/syscall-mips.h
-===================================================================
+diff --git a/src/syscall-mips.h b/src/syscall-mips.h
+new file mode 100644
+index 0000000..4142499
 --- /dev/null
-+++ libaio-0.3.110/src/syscall-mips.h
++++ b/src/syscall-mips.h
 @@ -0,0 +1,223 @@
 +/*
 + * This file is subject to the terms and conditions of the GNU General Public
@@ -330,10 +330,11 @@ Index: libaio-0.3.110/src/syscall-mips.h
 +
 +#endif /* (_MIPS_SIM == _MIPS_SIM_NABI32) || (_MIPS_SIM == _MIPS_SIM_ABI64) */
 +
-Index: libaio-0.3.110/src/syscall-parisc.h
-===================================================================
+diff --git a/src/syscall-parisc.h b/src/syscall-parisc.h
+new file mode 100644
+index 0000000..ff61746
 --- /dev/null
-+++ libaio-0.3.110/src/syscall-parisc.h
++++ b/src/syscall-parisc.h
 @@ -0,0 +1,146 @@
 +/*
 + * Linux system call numbers.
@@ -481,127 +482,20 @@ Index: libaio-0.3.110/src/syscall-parisc.h
 +    return K_INLINE_SYSCALL(sname, 5, arg1, arg2, arg3, arg4, arg5);	\
 +}
 +
-Index: libaio-0.3.110/src/syscall-arm.h
-===================================================================
---- libaio-0.3.110.orig/src/syscall-arm.h
-+++ libaio-0.3.110/src/syscall-arm.h
-@@ -114,3 +114,119 @@ type fname(type1 arg1, type2 arg2, type3
-   return (type) __res_r0;						\
- }
- 
-+/*
-+ *  linux/include/asm-arm/unistd.h
-+ *
-+ *  Copyright (C) 2001-2005 Russell King
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ * Please forward _all_ changes to this file to rmk@arm.linux.org.uk,
-+ * no matter what the change is.  Thanks!
-+ */
-+
-+#define __NR_OABI_SYSCALL_BASE	0x900000
-+
-+#if defined(__thumb__) || defined(__ARM_EABI__)
-+#define __NR_SYSCALL_BASE	0
-+#else
-+#define __NR_SYSCALL_BASE	__NR_OABI_SYSCALL_BASE
-+#endif
-+
-+#define __NR_io_setup			(__NR_SYSCALL_BASE+243)
-+#define __NR_io_destroy			(__NR_SYSCALL_BASE+244)
-+#define __NR_io_getevents		(__NR_SYSCALL_BASE+245)
-+#define __NR_io_submit			(__NR_SYSCALL_BASE+246)
-+#define __NR_io_cancel			(__NR_SYSCALL_BASE+247)
-+
-+#define __sys2(x) #x
-+#define __sys1(x) __sys2(x)
-+
-+#if defined(__thumb__) || defined(__ARM_EABI__)
-+#define __SYS_REG(name) register long __sysreg __asm__("r7") = __NR_##name;
-+#define __SYS_REG_LIST(regs...) "r" (__sysreg) , ##regs
-+#define __syscall(name) "swi\t0"
-+#else
-+#define __SYS_REG(name)
-+#define __SYS_REG_LIST(regs...) regs
-+#define __syscall(name) "swi\t" __sys1(__NR_##name) ""
-+#endif
-+
-+#define io_syscall1(type,fname,sname,type1,arg1)			\
-+type fname(type1 arg1) {						\
-+  __SYS_REG(sname)							\
-+  register long __r0 __asm__("r0") = (long)arg1;			\
-+  register long __res_r0 __asm__("r0");					\
-+  __asm__ __volatile__ (						\
-+  __syscall(sname)							\
-+	: "=r" (__res_r0)						\
-+	: __SYS_REG_LIST( "0" (__r0) )					\
-+	: "memory" );							\
-+  return (type) __res_r0;						\
-+}
-+
-+#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2)		\
-+type fname(type1 arg1,type2 arg2) {					\
-+  __SYS_REG(sname)							\
-+  register long __r0 __asm__("r0") = (long)arg1;			\
-+  register long __r1 __asm__("r1") = (long)arg2;			\
-+  register long __res_r0 __asm__("r0");					\
-+  __asm__ __volatile__ (						\
-+  __syscall(sname)							\
-+	: "=r" (__res_r0)						\
-+	: __SYS_REG_LIST( "0" (__r0), "r" (__r1) )			\
-+	: "memory" );							\
-+  return (type) __res_r0;						\
-+}
-+
-+#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3)	\
-+type fname(type1 arg1,type2 arg2,type3 arg3) {				\
-+  __SYS_REG(sname)							\
-+  register long __r0 __asm__("r0") = (long)arg1;			\
-+  register long __r1 __asm__("r1") = (long)arg2;			\
-+  register long __r2 __asm__("r2") = (long)arg3;			\
-+  register long __res_r0 __asm__("r0");					\
-+  __asm__ __volatile__ (						\
-+  __syscall(sname)							\
-+	: "=r" (__res_r0)						\
-+	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2) )		\
-+	: "memory" );							\
-+  return (type) __res_r0;						\
-+}
-+
-+#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4)\
-+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4) {		\
-+  __SYS_REG(sname)							\
-+  register long __r0 __asm__("r0") = (long)arg1;			\
-+  register long __r1 __asm__("r1") = (long)arg2;			\
-+  register long __r2 __asm__("r2") = (long)arg3;			\
-+  register long __r3 __asm__("r3") = (long)arg4;			\
-+  register long __res_r0 __asm__("r0");					\
-+  __asm__ __volatile__ (						\
-+  __syscall(sname)							\
-+	: "=r" (__res_r0)						\
-+	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2), "r" (__r3) ) \
-+	: "memory" );							\
-+  return (type) __res_r0;						\
-+}
-+
-+#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4,type5,arg5)	\
-+type fname(type1 arg1, type2 arg2, type3 arg3, type4 arg4, type5 arg5) {\
-+  __SYS_REG(sname)							\
-+  register long __r0 __asm__("r0") = (long)arg1;			\
-+  register long __r1 __asm__("r1") = (long)arg2;			\
-+  register long __r2 __asm__("r2") = (long)arg3;			\
-+  register long __r3 __asm__("r3") = (long)arg4;			\
-+  register long __r4 __asm__("r4") = (long)arg5;			\
-+  register long __res_r0 __asm__("r0");					\
-+  __asm__ __volatile__ (						\
-+  __syscall(sname)							\
-+	: "=r" (__res_r0)						\
-+	: __SYS_REG_LIST( "0" (__r0), "r" (__r1), "r" (__r2),		\
-+			  "r" (__r3), "r" (__r4) )			\
-+	: "memory" );							\
-+  return (type) __res_r0;						\
-+}
-+
+diff --git a/src/syscall.h b/src/syscall.h
+index 9b9e9c1..9ecd3b4 100644
+--- a/src/syscall.h
++++ b/src/syscall.h
+@@ -29,6 +29,12 @@
+ #include "syscall-sparc.h"
+ #elif defined(__aarch64__) || defined(__riscv)
+ #include "syscall-generic.h"
++#elif defined(__m68k__)
++#include "syscall-m68k.h"
++#elif defined(__hppa__)
++#include "syscall-parisc.h"
++#elif defined(__mips__)
++#include "syscall-mips.h"
+ #else
+ #warning "using system call numbers from sys/syscall.h"
+ #endif
diff --git a/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch b/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
deleted file mode 100644
index bba7e554af3..00000000000
--- a/meta/recipes-extended/libaio/libaio/generic-arch-dectection-for-padding-defines.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From: Nathan Rossi <nathan.rossi@xilinx.com>
-Date: Tue, 27 Jan 2015 14:59:35 +1000
-Subject: [PATCH] Generic arch dectection for padding defines
-
-When available use the GNU C defines for endian and bitwidth to
-determine the padding required. This reduces the need to define the
-padding selection for every architecture.
-
-Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
-Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
-Upstream-Status: Backport
----
- src/libaio.h | 16 ++++++++++++----
- 1 file changed, 12 insertions(+), 4 deletions(-)
-
-diff --git a/src/libaio.h b/src/libaio.h
-index 1223146..4a4e0f5 100644
---- a/src/libaio.h
-+++ b/src/libaio.h
-@@ -52,14 +52,18 @@ typedef enum io_iocb_cmd {
- /* little endian, 32 bits */
- #if defined(__i386__) || (defined(__arm__) && !defined(__ARMEB__)) || \
-     defined(__sh__) || defined(__bfin__) || defined(__MIPSEL__) || \
--    defined(__cris__)
-+    defined(__cris__) || \
-+    (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
-+         __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ && __SIZEOF_LONG__ == 4)
- #define PADDED(x, y)	x; unsigned y
- #define PADDEDptr(x, y)	x; unsigned y
- #define PADDEDul(x, y)	unsigned long x; unsigned y
- 
- /* little endian, 64 bits */
- #elif defined(__ia64__) || defined(__x86_64__) || defined(__alpha__) || \
--      (defined(__aarch64__) && defined(__AARCH64EL__))
-+      (defined(__aarch64__) && defined(__AARCH64EL__)) || \
-+      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
-+          __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__ && __SIZEOF_LONG__ == 8)
- #define PADDED(x, y)	x, y
- #define PADDEDptr(x, y)	x
- #define PADDEDul(x, y)	unsigned long x
-@@ -67,7 +71,9 @@ typedef enum io_iocb_cmd {
- /* big endian, 64 bits */
- #elif defined(__powerpc64__) || defined(__s390x__) || \
-       (defined(__sparc__) && defined(__arch64__)) || \
--      (defined(__aarch64__) && defined(__AARCH64EB__))
-+      (defined(__aarch64__) && defined(__AARCH64EB__)) || \
-+      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
-+           __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ && __SIZEOF_LONG__ == 8)
- #define PADDED(x, y)	unsigned y; x
- #define PADDEDptr(x,y)	x
- #define PADDEDul(x, y)	unsigned long x
-@@ -76,7 +82,9 @@ typedef enum io_iocb_cmd {
- #elif defined(__PPC__) || defined(__s390__) || \
-       (defined(__arm__) && defined(__ARMEB__)) || \
-       defined(__sparc__) || defined(__MIPSEB__) || defined(__m68k__) || \
--      defined(__hppa__) || defined(__frv__) || defined(__avr32__)
-+      defined(__hppa__) || defined(__frv__) || defined(__avr32__) || \
-+      (defined(__GNUC__) && defined(__BYTE_ORDER__) && \
-+           __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__ && __SIZEOF_LONG__ == 4)
- #define PADDED(x, y)	unsigned y; x
- #define PADDEDptr(x, y)	unsigned y; x
- #define PADDEDul(x, y)	unsigned y; unsigned long x
--- 
-2.1.1
-
diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
deleted file mode 100644
index dc4ba505b97..00000000000
--- a/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Pending
-
-Properly load arguments 5 an 6 for x86-64 syscall
-Use asm ("r10") and asm ("r8") to load arguments 5 an 6 for x86-64
-syscall so that it works with both x32 and x86-64.
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/02
-
---- libaio-0.3.109/src/syscall-x86_64.h.x32	2009-10-09 11:17:02.000000000 -0700
-+++ libaio-0.3.109/src/syscall-x86_64.h	2011-12-02 09:09:07.537603224 -0800
-@@ -1,8 +1,18 @@
-+#ifndef __NR_io_setup
- #define __NR_io_setup		206
-+#endif
-+#ifndef __NR_io_destroy
- #define __NR_io_destroy		207
-+#endif
-+#ifndef __NR_io_getevents
- #define __NR_io_getevents	208
-+#endif
-+#ifndef __NR_io_submit
- #define __NR_io_submit		209
-+#endif
-+#ifndef __NR_io_cancel
- #define __NR_io_cancel		210
-+#endif
- 
- #define __syscall_clobber "r11","rcx","memory" 
- #define __syscall "syscall"
-@@ -42,10 +52,11 @@ return __res;								\
- type fname (type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
- {									\
- long __res;								\
--__asm__ volatile ("movq %5,%%r10 ;" __syscall				\
-+register long __a4 asm ("r10") = (long) arg4;				\
-+__asm__ volatile (__syscall						\
- 	: "=a" (__res)							\
- 	: "0" (__NR_##sname),"D" ((long)(arg1)),"S" ((long)(arg2)),	\
--	  "d" ((long)(arg3)),"g" ((long)(arg4)) : __syscall_clobber,"r10" ); \
-+	  "d" ((long)(arg3)),"r" (__a4)); \
- return __res;								\
- } 
- 
-@@ -54,10 +65,11 @@ return __res;								\
- type fname (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5)	\
- {									\
- long __res;								\
--__asm__ volatile ("movq %5,%%r10 ; movq %6,%%r8 ; " __syscall		\
-+register long __a4 asm ("r10") = (long) arg4;				\
-+register long __a5 asm ("r8") = (long) arg5;				\
-+__asm__ volatile ( __syscall						\
- 	: "=a" (__res)							\
- 	: "0" (__NR_##sname),"D" ((long)(arg1)),"S" ((long)(arg2)),	\
--	  "d" ((long)(arg3)),"g" ((long)(arg4)),"g" ((long)(arg5)) :	\
--	__syscall_clobber,"r8","r10" );					\
-+	  "d" ((long)(arg3)),"r" (__a4),"r" (__a5));			\
- return __res;								\
- }
diff --git a/meta/recipes-extended/libaio/libaio_0.3.110.bb b/meta/recipes-extended/libaio/libaio_0.3.111.bb
similarity index 57%
rename from meta/recipes-extended/libaio/libaio_0.3.110.bb
rename to meta/recipes-extended/libaio/libaio_0.3.111.bb
index 75975d4ab7d..5bd83078acc 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.110.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.111.bb
@@ -5,19 +5,14 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/liba/${BPN}/${BPN}_${PV}.orig.tar.gz \
-           file://generic-arch-dectection-for-padding-defines.patch \
+SRC_URI = "git://pagure.io/libaio.git;protocol=https \
            file://00_arches.patch \
            file://destdir.patch \
-           file://libaio_fix_for_x32.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
            "
-
-SRC_URI[md5sum] = "2a35602e43778383e2f4907a4ca39ab8"
-SRC_URI[sha256sum] = "e019028e631725729376250e32b473012f7cb68e1f7275bfc1bbcdd0f8745f7e"
-
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/liba/libaio/"
+SRCREV = "f66be22ab0a59a39858900ab72a8c6a6e8b0b7ec"
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE =+ "prefix=${prefix} includedir=${includedir} libdir=${libdir}"
 
-- 
2.16.1


