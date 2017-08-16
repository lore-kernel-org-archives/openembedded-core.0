Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E9B1A784FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 11:49:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 04:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,382,1498546800"; d="scan'208";a="1206279434"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2017 04:49:19 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A3C6258011C;
	Wed, 16 Aug 2017 04:49:18 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Aug 2017 14:49:11 +0300
Message-Id: <1502884151-17561-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] connman: Remove musl patch that's no longer needed
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
X-List-Received-Date: Wed, 16 Aug 2017 11:49:19 -0000

libc headers now have a backported patch that fixes this.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...x-compile-on-musl-with-kernel-4.9-headers.patch | 81 ----------------------
 meta/recipes-connectivity/connman/connman_1.34.bb  |  2 +-
 2 files changed, 1 insertion(+), 82 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch b/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
deleted file mode 100644
index da5756e..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From 594b67df7ca923d13265906a71fbbf748273a5f5 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 23 Jan 2017 17:41:39 +0200
-Subject: [PATCH] Fix compile on musl with kernel 4.9 headers
-
-Kernel headers break when musl defines IFF_LOWER_UP. While
-waiting for more proper fix in musl, add a hack to connman.
-
-Upstream-Status: Inappropriate [Workaround]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/6to4.c              | 4 ++++
- src/firewall-iptables.c | 4 ++++
- src/firewall-nftables.c | 3 +++
- src/iptables.c          | 4 ++++
- 4 files changed, 15 insertions(+)
-
-diff --git a/src/6to4.c b/src/6to4.c
-index 71a2882..1938afb 100644
---- a/src/6to4.c
-+++ b/src/6to4.c
-@@ -24,6 +24,10 @@
- #include <config.h>
- #endif
- 
-+/* hack to make sure kernel headers understand that libc (musl)
-+   does define IFF_LOWER_UP et al. */
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
-+
- #include <errno.h>
- #include <stdio.h>
- #include <stdlib.h>
-diff --git a/src/firewall-iptables.c b/src/firewall-iptables.c
-index 45943a8..e04bb91 100644
---- a/src/firewall-iptables.c
-+++ b/src/firewall-iptables.c
-@@ -23,6 +23,10 @@
- #include <config.h>
- #endif
- 
-+/* hack to make sure kernel headers understand that libc (musl)
-+   does define IFF_LOWER_UP et al. */
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
-+
- #include <errno.h>
- 
- #include <xtables.h>
-diff --git a/src/firewall-nftables.c b/src/firewall-nftables.c
-index 2503ee2..583d1c4 100644
---- a/src/firewall-nftables.c
-+++ b/src/firewall-nftables.c
-@@ -30,6 +30,9 @@
- #ifdef HAVE_CONFIG_H
- #include <config.h>
- #endif
-+/* hack to make sure kernel headers understand that libc (musl)
-+   does define IFF_LOWER_UP et al. */
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
-
- #include <stdlib.h>
- #include <time.h>
-diff --git a/src/iptables.c b/src/iptables.c
-index 82e3ac4..46ad9e2 100644
---- a/src/iptables.c
-+++ b/src/iptables.c
-@@ -23,6 +23,10 @@
- #include <config.h>
- #endif
- 
-+/* hack to make sure kernel headers understand that libc (musl)
-+   does define IFF_LOWER_UP et al. */
-+#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
-+
- #include <getopt.h>
- #include <stdlib.h>
- #include <stdio.h>
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/connman/connman_1.34.bb b/meta/recipes-connectivity/connman/connman_1.34.bb
index d520568..868f940 100644
--- a/meta/recipes-connectivity/connman/connman_1.34.bb
+++ b/meta/recipes-connectivity/connman/connman_1.34.bb
@@ -9,7 +9,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://includes.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-                             file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
+                             "
 
 SRC_URI[md5sum] = "e200028702c831d5f535d20d61e608ef"
 SRC_URI[sha256sum] = "a9a0808c729c1f348fc36d8cecb52d19b72bc34cb411c502608cb0e0190fc71e"
-- 
2.1.4


