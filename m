Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DFC766FF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 13:16:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 May 2016 06:16:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,610,1455004800"; d="scan'208";a="964464880"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 May 2016 06:16:38 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 685456A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:04:10 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 16:16:52 +0300
Message-Id: <1463059013-4222-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
References: <1463059013-4222-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] connman: update to version 1.32
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
X-List-Received-Date: Thu, 12 May 2016 13:16:47 -0000

Removed following upstreamed/backported patches:
        a) 0001-Detect-backtrace-API-availability-before-using-it.patch
        b) 0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch

Rearranged musl related patches.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...acktrace-API-availability-before-using-it.patch | 55 ----------------------
 ...d-missing-function-item-of-xtables-to-mat.patch | 42 -----------------
 meta/recipes-connectivity/connman/connman_1.31.bb  | 15 ------
 meta/recipes-connectivity/connman/connman_1.32.bb  | 15 ++++++
 4 files changed, 15 insertions(+), 112 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman_1.31.bb
 create mode 100644 meta/recipes-connectivity/connman/connman_1.32.bb

diff --git a/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch b/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
deleted file mode 100644
index 5dc6fd6..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 00d4447395725abaa651e12ed40095081e04011e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 13 Sep 2015 13:22:01 -0700
-Subject: [PATCH 1/3] Detect backtrace() API availability before using it
-
-C libraries besides glibc do not have backtrace() implemented
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac | 2 ++
- src/log.c    | 5 ++---
- 2 files changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 69c0eeb..90099f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -171,6 +171,8 @@ fi
- AM_CONDITIONAL(PPTP, test "${enable_pptp}" != "no")
- AM_CONDITIONAL(PPTP_BUILTIN, test "${enable_pptp}" = "builtin")
- 
-+AC_CHECK_HEADERS([execinfo.h])
-+
- AC_CHECK_HEADERS(resolv.h, dummy=yes,
- 	AC_MSG_ERROR(resolver header files are required))
- AC_CHECK_LIB(resolv, ns_initparse, dummy=yes, [
-diff --git a/src/log.c b/src/log.c
-index a693bd0..5b40c1f 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -30,7 +30,6 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
--#include <execinfo.h>
- #include <dlfcn.h>
- 
- #include "connman.h"
-@@ -215,9 +214,9 @@ static void print_backtrace(unsigned int offset)
- static void signal_handler(int signo)
- {
- 	connman_error("Aborting (signal %d) [%s]", signo, program_exec);
--
-+#ifdef HAVE_EXECINFO_H
- 	print_backtrace(2);
--
-+#endif /* HAVE_EXECINFO_H */
- 	exit(EXIT_FAILURE);
- }
- 
--- 
-2.5.1
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch b/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch
deleted file mode 100644
index 1b5a3e4..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From acea08a0e4234a4c1a87bedc087c73ff36de0c7b Mon Sep 17 00:00:00 2001
-From: Wu Zheng <wu.zheng@intel.com>
-Date: Thu, 28 Jan 2016 18:04:17 +0800
-Subject: [PATCH] iptables: Add missing function item of xtables to match
- iptables 1.6
-
-The struct of xtables_globals has been modified in iptables 1.6.
-If connman runs with iptables 1.6, it can crash.
-
-Program received signal SIGSEGV, Segmentation fault.
-0x00000000 in ?? ()
-0xb7dea89c in xtables_find_target () from /usr/lib/libxtables.so.11
-0xb7deac1c in ?? () from /usr/lib/libxtables.so.11
-0xb7dea793 in xtables_find_target () from /usr/lib/libxtables.so.11
-
-The the missing function item of xtables is added to xtables_globals.
-
-Upstream-Status: Backport
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-Signed-off-by: Wu Zheng <wu.zheng@intel.com>
----
- src/iptables.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/iptables.c b/src/iptables.c
-index bc0c763..5ef757a 100644
---- a/src/iptables.c
-+++ b/src/iptables.c
-@@ -1566,6 +1566,9 @@ struct xtables_globals iptables_globals = {
- 	.option_offset = 0,
- 	.opts = iptables_opts,
- 	.orig_opts = iptables_opts,
-+#if XTABLES_VERSION_CODE > 10
-+	.compat_rev = xtables_compatible_revision,
-+#endif
- };
- 
- static struct xtables_target *prepare_target(struct connman_iptables *table,
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/connman/connman_1.31.bb b/meta/recipes-connectivity/connman/connman_1.31.bb
deleted file mode 100644
index e71d221..0000000
--- a/meta/recipes-connectivity/connman/connman_1.31.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require connman.inc
-
-SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://0001-Detect-backtrace-API-availability-before-using-it.patch \
-            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-            file://0003-Fix-header-inclusions-for-musl.patch \
-            file://0001-iptables-Add-missing-function-item-of-xtables-to-mat.patch \
-            file://connman \
-            "
-SRC_URI[md5sum] = "cb1c413fcc4f49430294bbd7a92f5f3c"
-SRC_URI[sha256sum] = "88fcf0b6df334796b90e2fd2e434d6f5b36cd6f13b886a119b8c90276b72b8e2"
-
-RRECOMMENDS_${PN} = "connman-conf"
-
diff --git a/meta/recipes-connectivity/connman/connman_1.32.bb b/meta/recipes-connectivity/connman/connman_1.32.bb
new file mode 100644
index 0000000..532b17c
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman_1.32.bb
@@ -0,0 +1,15 @@
+require connman.inc
+
+SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://connman \
+            "
+SRC_URI_append_libc-musl = "file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                            file://0003-Fix-header-inclusions-for-musl.patch \
+                           "
+
+SRC_URI[md5sum] = "d0c3071c1d8dec9cd17b760f862de2ad"
+SRC_URI[sha256sum] = "3185864c73206a6033d12e9f583689dcd03f714a40a58333709d3f74a4e0934c"
+
+RRECOMMENDS_${PN} = "connman-conf"
+
-- 
2.4.0


