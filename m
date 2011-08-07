Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpvYk-0008UK-Qb
	for openembedded-core@lists.openembedded.org;
	Sun, 07 Aug 2011 07:05:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,331,1309762800"; d="scan'208";a="36580338"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2011 22:01:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Aug 2011 22:01:10 -0700
Message-Id: <af6471958a390f94e79d95818ee73dc7dc355a74.1312692935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312692935.git.sgw@linux.intel.com>
References: <cover.1312692935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (Updated) 08/15] lttng-ust: Update to 0.15
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
X-List-Received-Date: Sun, 07 Aug 2011 05:05:59 -0000

This address [YOCTO #1005] which was waiting for upstream updates
from the lttng and GDB teams.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 --------------------
 meta/recipes-kernel/lttng/lttng-ust_0.15.bb        |   31 ++++++++++++
 2 files changed, 31 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.15.bb

diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
deleted file mode 100644
index f4ea196..0000000
--- a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-uClibc does not have sched_getcpu() implemented. So we create a wrapper
-to getcpu syscall when compiling for uclibc.
-
-So far execinfo.h does not exist on uclibc but it turns out to be that
-this header is not needed even in eglibc case so it can be removed
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Accepted
-
-Index: ust-0.12/libust/tracer.h
-===================================================================
---- ust-0.12.orig/libust/tracer.h
-+++ ust-0.12/libust/tracer.h
-@@ -342,14 +342,22 @@ static __inline__ void ltt_write_trace_h
- 	header->start_freq = trace->start_freq;
- 	header->freq_scale = trace->freq_scale;
- }
--
-+#ifdef __UCLIBC__
-+#define sched_getcpu(cpu, node, cache) syscall(__NR_getcpu, cpu, node, cache)
-+#endif
- #ifndef UST_VALGRIND
- 
- static __inline__ int ust_get_cpu(void)
- {
- 	int cpu;
- 
-+#ifdef __UCLIBC__
-+	int c, s;
-+	s = syscall(__NR_getcpu, &c, NULL, NULL);
-+	cpu = (s == -1) ? s : c;
-+#else
- 	cpu = sched_getcpu();
-+#endif
- 	if (likely(cpu >= 0))
- 		return cpu;
- 	/*
-Index: ust-0.12/libustcomm/ustcomm.c
-===================================================================
---- ust-0.12.orig/libustcomm/ustcomm.c
-+++ ust-0.12/libustcomm/ustcomm.c
-@@ -31,7 +31,6 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
--#include <execinfo.h>
- 
- #include "ustcomm.h"
- #include "usterr.h"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.15.bb b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
new file mode 100644
index 0000000..915e619
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
@@ -0,0 +1,31 @@
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
+PR = "r2"
+
+SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "86c71486a70695dc0b2171ad16fc82b3" 
+SRC_URI[sha256sum] = "7ff7ecdc051c0649d5fd21b5ceff4895ca95dc34f14cdc04e50de13cfd1903c5"
+
+
+S = "${WORKDIR}/ust-${PV}"
+
+inherit autotools
+
+#EXTRA_OECONF = "ac_cv_lib_urcu_bp_synchronize_rcu_bp=no"
+
+# Due to liburcu not building on MIPS currently this recipe needs to
+# be limited also.
+# So here let us first suppport x86/arm/powerpc platforms now.
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-linux'
+
-- 
1.7.3.4



