Return-Path: <jussi.kukkonen@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 44A1C771D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 16:00:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 23 Jan 2017 08:00:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="34307143"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2017 08:00:37 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 43D8E6A4080;
	Mon, 23 Jan 2017 07:59:40 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 18:00:16 +0200
Message-Id: <1485187216-17666-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] connman: Add workaround to build with musl & 4.9 headers
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
X-List-Received-Date: Mon, 23 Jan 2017 16:00:44 -0000

Kernel headers break when musl defines IFF_LOWER_UP. While
waiting for more proper fix in musl, add a workaround to connman.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This was tested on top of ross/mut.


 ...x-compile-on-musl-with-kernel-4.9-headers.patch | 64 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |  3 +-
 2 files changed, 66 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
new file mode 100644
index 0000000..bf3b86d
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
@@ -0,0 +1,64 @@
+From c8bfad4ee9d2c505c00ccbb8b2139543b5ad6fcb Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 23 Jan 2017 17:41:39 +0200
+Subject: [PATCH] Fix compile on musl with kernel 4.9 headers
+
+Kernel headers break when musl defines IFF_LOWER_UP. While
+waiting for more proper fix in musl, add a hack to connman.
+
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ src/6to4.c     | 4 ++++
+ src/firewall.c | 4 ++++
+ src/iptables.c | 4 ++++
+ 3 files changed, 12 insertions(+)
+
+diff --git a/src/6to4.c b/src/6to4.c
+index 71a2882..1938afb 100644
+--- a/src/6to4.c
++++ b/src/6to4.c
+@@ -24,6 +24,10 @@
+ #include <config.h>
+ #endif
+ 
++/* hack to make sure kernel headers understand that libc (musl)
++   does define IFF_LOWER_UP et al. */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
++
+ #include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/src/firewall.c b/src/firewall.c
+index c440df6..c83def9 100644
+--- a/src/firewall.c
++++ b/src/firewall.c
+@@ -23,6 +23,10 @@
+ #include <config.h>
+ #endif
+ 
++/* hack to make sure kernel headers understand that libc (musl)
++   does define IFF_LOWER_UP et al. */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
++
+ #include <errno.h>
+ 
+ #include <xtables.h>
+diff --git a/src/iptables.c b/src/iptables.c
+index 82e3ac4..46ad9e2 100644
+--- a/src/iptables.c
++++ b/src/iptables.c
+@@ -23,6 +23,10 @@
+ #include <config.h>
+ #endif
+ 
++/* hack to make sure kernel headers understand that libc (musl)
++   does define IFF_LOWER_UP et al. */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
++
+ #include <getopt.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+-- 
+2.1.4
+
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 56a0a0f..4129b05 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -7,7 +7,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://includes.patch \
             file://0003-stats-Fix-bad-file-descriptor-initialisation.patch \
             "
-SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
+SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+                             file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
 
 SRC_URI[md5sum] = "c51903fd3e7a6a371d12ac5d72a1fa01"
 SRC_URI[sha256sum] = "bc8946036fa70124d663136f9f6b6238d897ca482782df907b07a428b09df5a0"
-- 
2.1.4


