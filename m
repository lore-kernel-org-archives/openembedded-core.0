Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7518465F03
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 12:59:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jul 2014 05:59:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,701,1400050800"; d="scan'208";a="576419035"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by orsmga002.jf.intel.com with ESMTP; 21 Jul 2014 05:59:11 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 15:59:09 +0300
Message-Id: <1405947549-13240-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] connman: Fix PPTP VPN plugin QA issue
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
X-List-Received-Date: Mon, 21 Jul 2014 12:59:14 -0000

This error was seen when building ConnMan. Fixed by not
building ConnMan pptp plugin with module versioning info.

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: connman-plugin-vpn-pptp path '/work/core2-32-oe-linux/connman/1.24+gitAUTOINC+42779cd63c-r20/packages-split/connman-plugin-vpn-pptp/usr/lib/connman/scripts/libppp-plugin.so' [dev-so]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 ...ild-libppp-plugin-without-versioning-info.patch | 32 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.24.bb  |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch

diff --git a/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch b/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
new file mode 100644
index 0000000..8e81f1b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted
+Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
+
+From dd8044ed6ccb468558bab037257e27a409903d86 Mon Sep 17 00:00:00 2001
+From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
+Date: Mon, 21 Jul 2014 15:01:45 +0300
+Subject: [PATCH] scripts: Build libppp-plugin as a plain .so file
+
+There is no need to have module versioning for libppp-plugin.so
+file so build the plugin same way as other vpn plugins.
+
+This issue was seen when building ConnMan for Yocto.
+---
+ Makefile.plugins | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.plugins b/Makefile.plugins
+index 294cae0..8139967 100644
+--- a/Makefile.plugins
++++ b/Makefile.plugins
+@@ -4,7 +4,7 @@ plugin_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
+ plugin_ldflags = -no-undefined -module -avoid-version
+ 
+ script_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
+-					@DBUS_CFLAGS@
++		@DBUS_CFLAGS@ $(plugin_ldflags) -shared
+ 
+ if LOOPBACK
+ builtin_modules += loopback
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-connectivity/connman/connman_1.24.bb b/meta/recipes-connectivity/connman/connman_1.24.bb
index 66a8c58..29e239c 100644
--- a/meta/recipes-connectivity/connman/connman_1.24.bb
+++ b/meta/recipes-connectivity/connman/connman_1.24.bb
@@ -4,6 +4,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
+            file://build-libppp-plugin-without-versioning-info.patch \
             "
 SRC_URI[md5sum] = "dd6e1b4d9b9a28d127edb9f9b58bdec1"
 SRC_URI[sha256sum] = "551df7a5f0c6e4d69523dd2b3aa2c54525b323457d5135f64816215bad3dc24c"
-- 
1.8.3.1


