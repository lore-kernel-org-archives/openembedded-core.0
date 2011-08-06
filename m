Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabS-0000OD-6s
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:22 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941167"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:44 -0700
Message-Id: <ce602d8e1820d095d0f448908543a17d39f0b489.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 8/9] lttng-ust: Update to 0.15
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:22 -0000

This address [YOCTO #1005] which was waiting for upstream updates
from the lttng and GDB teams.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 --------------------
 meta/recipes-kernel/lttng/lttng-ust_0.15.bb        |   27 +++++++++++
 2 files changed, 27 insertions(+), 50 deletions(-)
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
index 0000000..b0e8596
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.15.bb
@@ -0,0 +1,27 @@
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



