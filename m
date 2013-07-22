Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 82FDB6A5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 14:06:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 22 Jul 2013 07:06:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,719,1367996400"; d="scan'208";a="335019114"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 22 Jul 2013 07:06:25 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2013 17:08:05 +0300
Message-Id: <1374502085-16914-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] connman: upgrade to v1.16
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
X-List-Received-Date: Mon, 22 Jul 2013 14:06:27 -0000

inet-fix-ip-cleanup-functions.patch no longer nedded;
included in upstream.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../connman/inet-fix-ip-cleanup-functions.patch    |   40 --------------------
 .../connman/{connman_1.15.bb => connman_1.16.bb}   |    5 +--
 2 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.15.bb => connman_1.16.bb} (62%)

diff --git a/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
deleted file mode 100644
index 3071549..0000000
--- a/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 100353e10f60a50ca1ba78daa6bc4dfebf5b3297 Mon Sep 17 00:00:00 2001
-From: Constantin Musca <constantinx.musca@intel.com>
-Date: Wed, 5 Dec 2012 15:07:21 +0200
-Subject: [PATCH] inet: fix ip cleanup functions
-
-Upstream-Status: Pending
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
----
- src/inet.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/inet.c b/src/inet.c
-index be69aca..e76a1f1 100644
---- a/src/inet.c
-+++ b/src/inet.c
-@@ -626,6 +626,10 @@ int connman_inet_clear_ipv6_address(int index, const char *address,
- 
- 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
- 
-+	if (address == NULL) {
-+		return -1;
-+	}
-+
- 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET6,
- 				address, NULL, prefix_len, NULL);
- 	if (err < 0) {
-@@ -649,6 +653,10 @@ int connman_inet_clear_address(int index, struct connman_ipaddress *ipaddress)
- 
- 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
- 
-+	if (address == NULL) {
-+		return -1;
-+	}
-+
- 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET,
- 				address, peer, prefix_len, broadcast);
- 	if (err < 0) {
--- 
-1.7.11.7
-
diff --git a/meta/recipes-connectivity/connman/connman_1.15.bb b/meta/recipes-connectivity/connman/connman_1.16.bb
similarity index 62%
rename from meta/recipes-connectivity/connman/connman_1.15.bb
rename to meta/recipes-connectivity/connman/connman_1.16.bb
index 0ec29c9..7e54bc2 100644
--- a/meta/recipes-connectivity/connman/connman_1.15.bb
+++ b/meta/recipes-connectivity/connman/connman_1.16.bb
@@ -4,11 +4,10 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
-            file://inet-fix-ip-cleanup-functions.patch \
             "
 
-SRC_URI[md5sum] = "e785c0c4564bfffb5215272f1be6f17c"
-SRC_URI[sha256sum] = "8229cc5e3e75197453ba2a644c03860a7cf9f4f27fcbf111bb589530d4efb58f"
+SRC_URI[md5sum] = "d2906816222219e10426442d07c3f4c1"
+SRC_URI[sha256sum] = "7273e88e6a6338be1e51b0e4c685d556386897cba9317cd83370bfb3f009982a"
 
 PR = "${INC_PR}.0"
 
-- 
1.7.10.4


