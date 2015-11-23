Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B51016012C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 16:10:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 23 Nov 2015 08:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,337,1444719600"; d="scan'208";a="857693128"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Nov 2015 08:10:45 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 50B276A4083
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 08:09:38 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 18:11:47 +0200
Message-Id: <1448295108-8321-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/2] ofono: upgrade to version 1.17
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
X-List-Received-Date: Mon, 23 Nov 2015 16:10:46 -0000

Removed the patch 0001-backtrace-Disable-for-non-glibc-C-libraries.patch,
as it is included in the new sources.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...cktrace-Disable-for-non-glibc-C-libraries.patch | 40 ----------------------
 meta/recipes-connectivity/ofono/ofono_1.16.bb      | 12 -------
 meta/recipes-connectivity/ofono/ofono_1.17.bb      | 11 ++++++
 3 files changed, 11 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.16.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.17.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch b/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
deleted file mode 100644
index 306b6da..0000000
--- a/meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2d729af0897d7d72b83d111876febf9e0eec1a68 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 3 Apr 2015 20:50:56 -0700
-Subject: [PATCH] backtrace: Disable for non-glibc C libraries
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- src/log.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/log.c b/src/log.c
-index febc874..9db4ae7 100644
---- a/src/log.c
-+++ b/src/log.c
-@@ -30,7 +30,9 @@
- #include <stdlib.h>
- #include <string.h>
- #include <syslog.h>
-+#ifdef __GLIBC__
- #include <execinfo.h>
-+#endif
- #include <dlfcn.h>
- 
- #include "ofono.h"
-@@ -219,8 +221,9 @@ static void signal_handler(int signo)
- {
- 	ofono_error("Aborting (signal %d) [%s]", signo, program_exec);
- 
-+#ifdef __GLIBC__
- 	print_backtrace(2);
--
-+#endif
- 	exit(EXIT_FAILURE);
- }
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/ofono/ofono_1.16.bb b/meta/recipes-connectivity/ofono/ofono_1.16.bb
deleted file mode 100644
index fbf13e5..0000000
--- a/meta/recipes-connectivity/ofono/ofono_1.16.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://Revert-test-Convert-to-Python-3.patch \
-  file://0001-backtrace-Disable-for-non-glibc-C-libraries.patch \
-"
-SRC_URI[md5sum] = "c31b5b55a1d68354bff771d3edf02829"
-SRC_URI[sha256sum] = "403b98dadece8bc804c0bd16b96d3db5a3bb0f84af64b3d67924da2d1a754b07"
-
-CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.17.bb b/meta/recipes-connectivity/ofono/ofono_1.17.bb
new file mode 100644
index 0000000..947f9d7
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.17.bb
@@ -0,0 +1,11 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://Revert-test-Convert-to-Python-3.patch \
+"
+SRC_URI[md5sum] = "d280b1d267ba5bf391d2a898fea7c748"
+SRC_URI[sha256sum] = "cbf20f07fd15253c682b23c1786d517f505c3688f7c4ea93da777e1523b89635"
+
+CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.4.0


