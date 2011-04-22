Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlk-0001pX-Tg
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Apr 2011 00:24:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="423747811"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by azsmga001.ch.intel.com with ESMTP; 22 Apr 2011 00:24:45 -0700
Message-Id: <4774e8db18fca707f31f774103ff7040da939772.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 10:29:53 +0800
Date: Fri, 22 Apr 2011  0:24:45 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 16/33] lttng-ust: upgrade from 0.11 to the latest version 0.12
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:13 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Updated LIC_FILES_CHKSUM as a new Copyright holder was added.
Removed the patch since 0.12 has integrated that.
Added arm into COMPATIBLE_HOST as 0.12 can build on arm now.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...remove_ppc_specific_time_reading_function.patch |   85 --------------------
 meta/recipes-kernel/lttng/lttng-ust_0.11.bb        |   32 --------
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |   28 +++++++
 3 files changed, 28 insertions(+), 117 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.11.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.12.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch b/meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch
deleted file mode 100644
index c5487fd..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-Dexuan Cui <dexuan.cui@intel.com>: I got the following patch from lttng dev
-mailing list:
-http://lists.casi.polymtl.ca/pipermail/ltt-dev/2011-February/003903.html
-The patch looks good and I think it would be in next release. At present,
-let's add it into SRC_URI.
-
------------------------------------------------------------------
-The PPC version of the trace_clock_read64 was using the TB register
-which is not constant accross implementations. The currently
-measured time base on PPC was not accurate.
-So, for now, we rely on the CLOCK_MONOTONIC.
-
-This patch remove a bunch of #ifdef for x86 and PPC, since we now rely on
-the same base clock. It also fix the build on PPC that was currently broken
-
-Signed-off-by: Yannick Brosseau <yannick.brosseau@gmail.com>
------------------------------------------------------------------
-
---- a/include/ust/clock.h
-+++ b/include/ust/clock.h
-@@ -39,7 +39,6 @@
-    precision and monotonicity.
- */
- 
--#if __i386__ || __x86_64__
- /* Only available for x86 arch */
- #define CLOCK_TRACE_FREQ  14
- #define CLOCK_TRACE  15
-@@ -47,36 +46,10 @@
- 	struct timespec ts;
- 	u64 lttng_ts;
- };
--#endif /* __i386__ || __x86_64__ */
- 
- extern int ust_clock_source;
- 
- /* Choosing correct trace clock */
--#if __PPC__
--static __inline__ u64 trace_clock_read64(void)
--{
--	unsigned long tb_l;
--	unsigned long tb_h;
--	unsigned long tb_h2;
--	u64 tb;
--
--	__asm__ (
--		"1:\n\t"
--		"mftbu %[rhigh]\n\t"
--		"mftb %[rlow]\n\t"
--		"mftbu %[rhigh2]\n\t"
--		"cmpw %[rhigh],%[rhigh2]\n\t"
--		"bne 1b\n\t"
--		: [rhigh] "=r" (tb_h), [rhigh2] "=r" (tb_h2), [rlow] "=r" (tb_l));
--
--	tb = tb_h;
--	tb <<= 32;
--	tb |= tb_l;
--
--	return tb;
--}
--
--#else	/* !__PPC__ */
- 
- static __inline__ u64 trace_clock_read64(void)
- {
-@@ -101,17 +74,17 @@
- 	return retval;
- }
- 
--#endif /* __PPC__ */
--
- static __inline__ u64 trace_clock_frequency(void)
- {
- 	struct timespec ts;
- 	union lttng_timespec *lts = (union lttng_timespec *) &ts;
- 
-+#if __i386__ || __x86_64__
- 	if (likely(ust_clock_source == CLOCK_TRACE)) {
- 		clock_gettime(CLOCK_TRACE_FREQ, &ts);
- 		return lts->lttng_ts;
- 	}
-+#endif
- 	return 1000000000LL;
- }
- 
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.11.bb b/meta/recipes-kernel/lttng/lttng-ust_0.11.bb
deleted file mode 100644
index 9d2063a..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust_0.11.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Linux Trace Toolkit Userspace Tracer"
-DESCRIPTION = "The LTTng Userspace Tracer (UST) is a library accompanied by a set of tools to trace userspace code"
-HOMEPAGE = "http://lttng.org/ust"
-BUGTRACKER = "n/a"
-
-LICENSE = "LGPLv2.1+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
-                    file://ustctl/ustctl.c;endline=16;md5=eceeaab8a5574f24d62f7950b9d1adf4 \
-                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
-
-DEPENDS = "liburcu"
-
-PR = "r1"
-
-SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz \
-           file://remove_ppc_specific_time_reading_function.patch \
-           "
-
-SRC_URI[md5sum] = "0a23fa60df4da3fb5188e314001eb49c"
-SRC_URI[sha256sum] = "af8f699019ae260103bb401b6738d5e417e79732a509859b42a52e9a0f5edb35"
-
-S = "${WORKDIR}/ust-${PV}"
-
-inherit autotools
-
-# Due to liburcu not building on ARM or MIPS currently this recipe needs to
-# be limited also.
-# So here let us first suppport x86/powerpc platforms now.
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*)-linux'
-
-
-
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
new file mode 100644
index 0000000..7dadc04
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Linux Trace Toolkit Userspace Tracer"
+DESCRIPTION = "The LTTng Userspace Tracer (UST) is a library accompanied by a set of tools to trace userspace code"
+HOMEPAGE = "http://lttng.org/ust"
+BUGTRACKER = "n/a"
+
+LICENSE = "LGPLv2.1+ & BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
+                    file://ustctl/ustctl.c;endline=16;md5=b50c6fa0307175bb1ce0db49d752c03b \
+                    file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
+
+DEPENDS = "liburcu"
+
+PR = "r0"
+
+SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "fae6e324a56016658c5b83ec14ba0043"
+SRC_URI[sha256sum] = "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f641df40b08314ab0c"
+
+S = "${WORKDIR}/ust-${PV}"
+
+inherit autotools
+
+# Due to liburcu not building on MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
+
-- 
1.7.1



