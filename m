Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 49BCB605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 15:27:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 10 Jun 2015 08:27:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,588,1427785200"; d="scan'208";a="585440375"
Received: from bspitzba-mobl.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com)
	([10.252.3.151])
	by orsmga003.jf.intel.com with ESMTP; 10 Jun 2015 08:27:02 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 18:27:00 +0300
Message-Id: <1433950020-4316-1-git-send-email-tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] libatomic-ops: 7.2 -> 7.4.2
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
X-List-Received-Date: Wed, 10 Jun 2015 15:27:05 -0000

The backported patch is included in the new version, so dropped the
patch.

Dropped DESCRIPTION, because it was redundant (same as SUMMARY).

Changed HOMEPAGE. libatomic_ops is nowadays maintained by Ivan
Maidanski.

doc/LICENSING.txt changed checksum, but there were only whitespace
changes. COPYING moved from doc/ to the top-level directory, but the
checksum stayed the same.

Dropped PR.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 .../0001-libatomic_ops-Aarch64-basic-port.patch    | 239 ---------------------
 .../pulseaudio/libatomics-ops_7.2.bb               |  32 ---
 .../pulseaudio/libatomics-ops_7.4.2.bb             |  28 +++
 3 files changed, 28 insertions(+), 271 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb

diff --git a/meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch b/meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
deleted file mode 100644
index a563b8b..0000000
--- a/meta/recipes-multimedia/pulseaudio/files/0001-libatomic_ops-Aarch64-basic-port.patch
+++ /dev/null
@@ -1,239 +0,0 @@
-From aac120d778ae5fc619b2fb8ef18ea18d3d5d20cc Mon Sep 17 00:00:00 2001
-From: Yvan Roux <yvan.roux@linaro.org>
-Date: Wed, 23 Jan 2013 17:14:16 +0100
-Subject: [PATCH] Aarch64 basic port
-
-Adapted-for-OpenEmbedded-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
-
-
-Upstream-Status: Backport
-
-It is original from
-https://github.com/ivmai/libatomic_ops/commit/cbbf86330fcb600cfe0f895cb970d922456005d6
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- src/atomic_ops.h                     |    4 
- src/atomic_ops/sysdeps/Makefile.am   |    1 
- src/atomic_ops/sysdeps/gcc/aarch64.h |  184 +++++++++++++++++++++++++++++++++++
- 3 files changed, 189 insertions(+)
- create mode 100644 src/atomic_ops/sysdeps/gcc/aarch64.h
-
---- libatomic_ops-7.2.orig/src/atomic_ops.h
-+++ libatomic_ops-7.2/src/atomic_ops.h
-@@ -242,10 +242,14 @@
- # endif /* __m68k__ */
- # if defined(__powerpc__) || defined(__ppc__) || defined(__PPC__) \
-      || defined(__powerpc64__) || defined(__ppc64__)
- #   include "atomic_ops/sysdeps/gcc/powerpc.h"
- # endif /* __powerpc__ */
-+# if defined(__aarch64__)
-+#   include "atomic_ops/sysdeps/gcc/aarch64.h"
-+#   define AO_CAN_EMUL_CAS
-+# endif /* __aarch64__ */
- # if defined(__arm__) && !defined(AO_USE_PTHREAD_DEFS)
- #   include "atomic_ops/sysdeps/gcc/arm.h"
- #   define AO_CAN_EMUL_CAS
- # endif /* __arm__ */
- # if defined(__cris__) || defined(CRIS)
---- libatomic_ops-7.2.orig/src/atomic_ops/sysdeps/Makefile.am
-+++ libatomic_ops-7.2/src/atomic_ops/sysdeps/Makefile.am
-@@ -24,10 +24,11 @@ nobase_sysdep_HEADERS= generic_pthread.h
- 	  standard_ao_double_t.h \
- 	  README \
- 	\
- 	  armcc/arm_v6.h \
- 	\
-+	  gcc/aarch64.h \
- 	  gcc/alpha.h gcc/arm.h gcc/avr32.h gcc/cris.h \
- 	  gcc/hexagon.h gcc/hppa.h gcc/ia64.h gcc/m68k.h \
- 	  gcc/mips.h gcc/powerpc.h gcc/s390.h \
- 	  gcc/sh.h gcc/sparc.h gcc/x86.h gcc/x86_64.h \
- 	\
---- /dev/null
-+++ libatomic_ops-7.2/src/atomic_ops/sysdeps/gcc/aarch64.h
-@@ -0,0 +1,184 @@
-+/*
-+ * Copyright (c) 1991-1994 by Xerox Corporation.  All rights reserved.
-+ * Copyright (c) 1996-1999 by Silicon Graphics.  All rights reserved.
-+ * Copyright (c) 1999-2003 by Hewlett-Packard Company. All rights reserved.
-+ *
-+ *
-+ * THIS MATERIAL IS PROVIDED AS IS, WITH ABSOLUTELY NO WARRANTY EXPRESSED
-+ * OR IMPLIED.  ANY USE IS AT YOUR OWN RISK.
-+ *
-+ * Permission is hereby granted to use or copy this program
-+ * for any purpose,  provided the above notices are retained on all copies.
-+ * Permission to modify the code and to distribute modified code is granted,
-+ * provided the above notices are retained, and a notice that the code was
-+ * modified is included with the above copyright notice.
-+ *
-+ */
-+
-+#include "../read_ordered.h"
-+
-+#include "../test_and_set_t_is_ao_t.h"
-+
-+AO_INLINE void
-+AO_nop_full(void)
-+{
-+# ifndef AO_UNIPROCESSOR
-+__sync_synchronize ();
-+# endif
-+}
-+#define AO_HAVE_nop_full
-+
-+AO_INLINE AO_t
-+AO_load(const volatile AO_t *addr)
-+{
-+  return  __atomic_load_n (addr, __ATOMIC_RELAXED);
-+}
-+#define AO_HAVE_load
-+
-+AO_INLINE AO_t
-+AO_load_acquire(const volatile AO_t *addr)
-+{
-+  return __atomic_load_n (addr, __ATOMIC_ACQUIRE);
-+}
-+#define AO_HAVE_load_acquire
-+
-+AO_INLINE void
-+ AO_store(volatile AO_t *addr, AO_t value)
-+{
-+  __atomic_store_n(addr, value, __ATOMIC_RELAXED);
-+}
-+#define AO_HAVE_store
-+
-+AO_INLINE void
-+ AO_store_release(volatile AO_t *addr, AO_t value)
-+{
-+  __atomic_store_n(addr, value, __ATOMIC_RELEASE);
-+}
-+#define AO_HAVE_store_release
-+
-+AO_INLINE AO_TS_VAL_t
-+AO_test_and_set(volatile AO_TS_t *addr)
-+{
-+    return __atomic_test_and_set(addr, __ATOMIC_RELAXED);
-+}
-+# define AO_HAVE_test_and_set
-+
-+AO_INLINE AO_TS_VAL_t
-+AO_test_and_set_acquire(volatile AO_TS_t *addr)
-+{
-+    return __atomic_test_and_set(addr, __ATOMIC_ACQUIRE);
-+}
-+# define AO_HAVE_test_and_set_acquire
-+
-+AO_INLINE AO_TS_VAL_t
-+AO_test_and_set_release(volatile AO_TS_t *addr)
-+{
-+    return __atomic_test_and_set(addr, __ATOMIC_RELEASE);
-+}
-+# define AO_HAVE_test_and_set_release
-+
-+AO_INLINE AO_TS_VAL_t
-+AO_test_and_set_full(volatile AO_TS_t *addr)
-+{
-+    return __atomic_test_and_set(addr, __ATOMIC_SEQ_CST);
-+}
-+# define AO_HAVE_test_and_set_full
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add(volatile AO_t *p, AO_t incr)
-+{
-+  return __atomic_fetch_add(p, incr, __ATOMIC_RELAXED);
-+}
-+#define AO_HAVE_fetch_and_add
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add_acquire(volatile AO_t *p, AO_t incr)
-+{
-+  return __atomic_fetch_add(p, incr, __ATOMIC_ACQUIRE);
-+}
-+#define AO_HAVE_fetch_and_add_acquire
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add_release(volatile AO_t *p, AO_t incr)
-+{
-+  return __atomic_fetch_add(p, incr, __ATOMIC_RELEASE);
-+}
-+#define AO_HAVE_fetch_and_add_release
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add_full(volatile AO_t *p, AO_t incr)
-+{
-+  return __atomic_fetch_add(p, incr, __ATOMIC_SEQ_CST);
-+}
-+#define AO_HAVE_fetch_and_add_full
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add1(volatile AO_t *p)
-+{
-+  return __atomic_fetch_add(p, 1, __ATOMIC_RELAXED);
-+}
-+#define AO_HAVE_fetch_and_add1
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add1_acquire(volatile AO_t *p)
-+{
-+  return __atomic_fetch_add(p, 1, __ATOMIC_ACQUIRE);
-+}
-+#define AO_HAVE_fetch_and_add1_acquire
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add1_release(volatile AO_t *p)
-+{
-+  return __atomic_fetch_add(p, 1, __ATOMIC_RELEASE);
-+}
-+#define AO_HAVE_fetch_and_add1_release
-+
-+AO_INLINE AO_t
-+AO_fetch_and_add1_full(volatile AO_t *p)
-+{
-+  return __atomic_fetch_add(p, 1, __ATOMIC_SEQ_CST);
-+}
-+#define AO_HAVE_fetch_and_add1_full
-+
-+AO_INLINE AO_t
-+AO_fetch_and_sub1(volatile AO_t *p)
-+{
-+  return __atomic_fetch_sub(p, 1, __ATOMIC_RELAXED);
-+}
-+#define AO_HAVE_fetch_and_sub1
-+
-+AO_INLINE AO_t
-+AO_fetch_and_sub1_acquire(volatile AO_t *p)
-+{
-+  return __atomic_fetch_sub(p, 1, __ATOMIC_ACQUIRE);
-+}
-+#define AO_HAVE_fetch_and_sub1_acquire
-+
-+AO_INLINE AO_t
-+AO_fetch_and_sub1_release(volatile AO_t *p)
-+{
-+  return __atomic_fetch_sub(p, 1, __ATOMIC_RELEASE);
-+}
-+#define AO_HAVE_fetch_and_sub1_release
-+
-+AO_INLINE AO_t
-+AO_fetch_and_sub1_full(volatile AO_t *p)
-+{
-+  return __atomic_fetch_sub(p, 1, __ATOMIC_SEQ_CST);
-+}
-+#define AO_HAVE_fetch_and_sub1_full
-+
-+/* Returns nonzero if the comparison succeeded.  */
-+AO_INLINE int
-+AO_compare_and_swap(volatile AO_t *addr, AO_t old_val, AO_t new_val)
-+{
-+    return __sync_bool_compare_and_swap(addr, old_val, new_val);
-+}
-+# define AO_HAVE_compare_and_swap
-+
-+AO_INLINE AO_t
-+AO_fetch_compare_and_swap(volatile AO_t *addr, AO_t old_val, AO_t new_val)
-+{
-+    return __sync_val_compare_and_swap(addr, old_val, new_val);
-+}
-+# define AO_HAVE_fetch_compare_and_swap
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
deleted file mode 100644
index 5a58228..0000000
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A library for atomic integer operations"
-DESCRIPTION = "A library for atomic integer operations"
-HOMEPAGE = "http://www.hpl.hp.com/research/linux/atomic_ops/"
-SECTION = "optional"
-LICENSE = "GPLv2 & MIT"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
-		   "
-PR = "r1"
-
-SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
-           file://0001-libatomic_ops-Aarch64-basic-port.patch \
-          "
-
-SRC_URI[md5sum] = "890acdc83a7cd10e2e9536062d3741c8"
-SRC_URI[sha256sum] = "c4ee6e0c304c6f13bcc32968453cdb54b2ec233d8bf4cfcf266ee09dc33b4eb5"
-
-S = "${WORKDIR}/libatomic_ops-${PV}"
-
-ALLOW_EMPTY_${PN} = "1"
-
-ARM_INSTRUCTION_SET = "arm"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-	# those contain only docs, not necessary for now.
-	install -m 0755 -d ${D}${docdir}
-	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${BPN}
-}
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
new file mode 100644
index 0000000..26faabb
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.4.2.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A library for atomic integer operations"
+HOMEPAGE = "https://github.com/ivmai/libatomic_ops/"
+SECTION = "optional"
+LICENSE = "GPLv2 & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
+		   "
+
+SRC_URI = "http://www.ivmaisoft.com/_bin/atomic_ops/libatomic_ops-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "1d6538604b314d2fccdf86915e5c0857"
+SRC_URI[sha256sum] = "04fa615f62992547bcbda562260e28b504bc4c06e2f985f267f3ade30304b5dd"
+
+S = "${WORKDIR}/libatomic_ops-${PV}"
+
+ALLOW_EMPTY_${PN} = "1"
+
+ARM_INSTRUCTION_SET = "arm"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+	# those contain only docs, not necessary for now.
+	install -m 0755 -d ${D}${docdir}
+	mv ${D}${datadir}/libatomic_ops ${D}${docdir}/${BPN}
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.3


