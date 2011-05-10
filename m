Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVF-0001SG-FS
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163178"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:16 -0700
Message-Id: <7e2a6da1d675b962aa7c52207dcac4dc5ca76f00.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Fri, 6 May 2011 15:17:25 -0700
Date: Mon, 09 May 2011 22:26:16 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/30] lttng-ust_0.12.bb: Fix compilation on uclibc
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
X-List-Received-Date: Tue, 10 May 2011 05:29:01 -0000

From: Khem Raj <raj.khem@gmail.com>

We provide alternative implementation of sched_getcpu()
when compiling for uclibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
 2 files changed, 53 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch

diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
new file mode 100644
index 0000000..7102a69
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
@@ -0,0 +1,50 @@
+uClibc does not have sched_getcpu() implemented. So we create a wrapper
+to getcpu syscall when compiling for uclibc.
+
+So far execinfo.h does not exist on uclibc but it turns out to be that
+this header is not needed even in eglibc case so it can be removed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-status: Pending
+
+Index: ust-0.12/libust/tracer.h
+===================================================================
+--- ust-0.12.orig/libust/tracer.h
++++ ust-0.12/libust/tracer.h
+@@ -342,14 +342,22 @@ static __inline__ void ltt_write_trace_h
+ 	header->start_freq = trace->start_freq;
+ 	header->freq_scale = trace->freq_scale;
+ }
+-
++#ifdef __UCLIBC__
++#define sched_getcpu(cpu, node, cache) syscall(__NR_getcpu, cpu, node, cache)
++#endif
+ #ifndef UST_VALGRIND
+ 
+ static __inline__ int ust_get_cpu(void)
+ {
+ 	int cpu;
+ 
++#ifdef __UCLIBC__
++	int c, s;
++	s = syscall(__NR_getcpu, &c, NULL, NULL);
++	cpu = (s == -1) ? s : c;
++#else
+ 	cpu = sched_getcpu();
++#endif
+ 	if (likely(cpu >= 0))
+ 		return cpu;
+ 	/*
+Index: ust-0.12/libustcomm/ustcomm.c
+===================================================================
+--- ust-0.12.orig/libustcomm/ustcomm.c
++++ ust-0.12/libustcomm/ustcomm.c
+@@ -31,7 +31,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <execinfo.h>
+ 
+ #include "ustcomm.h"
+ #include "usterr.h"
diff --git a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
index 7dadc04..5fca949 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_0.12.bb
@@ -12,7 +12,9 @@ DEPENDS = "liburcu"
 
 PR = "r0"
 
-SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz"
+SRC_URI = "http://lttng.org/files/ust/releases/ust-${PV}.tar.gz \
+           file://uclibc-sched_getcpu.patch \
+          "
 
 SRC_URI[md5sum] = "fae6e324a56016658c5b83ec14ba0043"
 SRC_URI[sha256sum] = "215b05f47d0c9e3a2934926a7d14fa9c67025db917c3a1f641df40b08314ab0c"
-- 
1.7.1.1



