Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 76A29607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 20:38:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 12 Aug 2015 13:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,663,1432623600"; d="scan'208";a="624299635"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.5.143])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2015 13:38:34 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 15:38:49 -0500
Message-Id: <1439411929-5844-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qemu-native: Add debugging when qemu fails with qemu_cpu_kick_thread
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
X-List-Received-Date: Wed, 12 Aug 2015 20:38:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are expecting some random failures in QEMU runs one of this is
related to qemu_cpu_kick_thread that ends on exit(1) on qemu.

To improve debug information add patch that prints the backtrace and
the status of qemu cpu.

[YOCTO #8143]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 .../cpus.c-qemu_cpu_kick_thread_debugging.patch    | 75 ++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c3f73d1..8c1e779 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -25,6 +25,7 @@ SRC_URI = "\
 
 SRC_URI_append_class-native = "\
     file://fix-libcap-header-issue-on-some-distro.patch \
+    file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
     "
 
 EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
diff --git a/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
new file mode 100644
index 0000000..91a47c1
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/cpus.c-qemu_cpu_kick_thread_debugging.patch
@@ -0,0 +1,75 @@
+From 697a834c35d19447b7dcdb9e1d9434bc6ce17c21 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Wed, 12 Aug 2015 15:11:30 -0500
+Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fails.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Add custom_debug.h with function for print backtrace information.
+When pthread_kill fails in qemu_cpu_kick_thread display backtrace and
+current cpu information.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ cpus.c         |  5 +++++
+ custom_debug.h | 24 ++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+)
+ create mode 100644 custom_debug.h
+
+diff --git a/cpus.c b/cpus.c
+index a822ce3..7e4786e 100644
+--- a/cpus.c
++++ b/cpus.c
+@@ -1080,6 +1080,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
+     return NULL;
+ }
+ 
++#include "custom_debug.h"
++
+ static void qemu_cpu_kick_thread(CPUState *cpu)
+ {
+ #ifndef _WIN32
+@@ -1088,6 +1090,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
+     err = pthread_kill(cpu->thread->thread, SIG_IPI);
+     if (err) {
+         fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
++        fprintf(stderr, "CPU #%d:\n", cpu->cpu_index);
++        cpu_dump_state(cpu, stderr, fprintf, 0);
++        backtrace_print();
+         exit(1);
+     }
+ #else /* _WIN32 */
+diff --git a/custom_debug.h b/custom_debug.h
+new file mode 100644
+index 0000000..f029e45
+--- /dev/null
++++ b/custom_debug.h
+@@ -0,0 +1,24 @@
++#include <execinfo.h>
++#include <stdio.h>
++#define BACKTRACE_MAX 128
++static void backtrace_print(void)
++{
++	int nfuncs = 0;
++	void *buf[BACKTRACE_MAX];
++	char **symbols;
++	int i;
++
++	nfuncs = backtrace(buf, BACKTRACE_MAX);
++
++	symbols = backtrace_symbols(buf, nfuncs);
++	if (symbols == NULL) {
++		fprintf(stderr, "backtrace_print failed to get symbols");
++		return;
++	}
++
++	fprintf(stderr, "Backtrace ...\n");
++	for (i = 0; i < nfuncs; i++)
++		fprintf(stderr, "%s\n", symbols[i]);
++
++	free(symbols);
++}
+-- 
+1.9.1
+
-- 
1.9.1


