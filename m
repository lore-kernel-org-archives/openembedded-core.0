Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4745E70523
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 13:11:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jul 2014 06:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,710,1400050800"; d="scan'208";a="576982691"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by orsmga002.jf.intel.com with ESMTP; 22 Jul 2014 06:11:22 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 16:11:20 +0300
Message-Id: <1406034680-5710-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v3] connman: Fix PPTP VPN plugin QA issue
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
X-List-Received-Date: Tue, 22 Jul 2014 13:11:55 -0000

This error was seen when building ConnMan. Fixed by not
building ConnMan pptp plugin with module versioning info.

ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: connman-plugin-vpn-pptp path '/work/core2-32-oe-linux/connman/1.24+gitAUTOINC+42779cd63c-r20/packages-split/connman-plugin-vpn-pptp/usr/lib/connman/scripts/libppp-plugin.so' [dev-so]
ERROR: QA run found fatal errors. Please consider fixing them.
ERROR: Function failed: do_package_qa

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 ...ild-libppp-plugin-without-versioning-info.patch | 48 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.24.bb  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch

diff --git a/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch b/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
new file mode 100644
index 0000000..0cb43b6
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Accepted [Fixed in Version 1.25]
+Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
+
+From c1b9fc4cefb82892f6debe607f5e50ba5fc6aa96 Mon Sep 17 00:00:00 2001
+From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
+Date: Tue, 22 Jul 2014 15:39:39 +0300
+Subject: [PATCH] scripts: Build libppp-plugin without versioning information
+
+There is no need to have module versioning for libppp-plugin.so file
+so build the plugin same way as other vpn plugins.
+
+This issue was seen when building ConnMan for Yocto.
+---
+ Makefile.plugins | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.plugins b/Makefile.plugins
+index 294cae0..e90ad19 100644
+--- a/Makefile.plugins
++++ b/Makefile.plugins
+@@ -3,9 +3,6 @@ plugin_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
+ 					@DBUS_CFLAGS@ @GLIB_CFLAGS@
+ plugin_ldflags = -no-undefined -module -avoid-version
+ 
+-script_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
+-					@DBUS_CFLAGS@
+-
+ if LOOPBACK
+ builtin_modules += loopback
+ builtin_sources += plugins/loopback.c
+@@ -156,12 +153,12 @@ endif
+ 
+ if PPTP
+ script_LTLIBRARIES += scripts/libppp-plugin.la
+-scripts_libppp_plugin_la_LDFLAGS = $(script_cflags) @DBUS_CFLAGS@
++scripts_libppp_plugin_la_LDFLAGS = $(plugin_ldflags)
+ scripts_libppp_plugin_la_LIBADD = @DBUS_LIBS@
+ else
+ if L2TP
+ script_LTLIBRARIES += scripts/libppp-plugin.la
+-scripts_libppp_plugin_la_LDFLAGS = $(script_cflags) @DBUS_CFLAGS@
++scripts_libppp_plugin_la_LDFLAGS = $(plugin_ldflags)
+ scripts_libppp_plugin_la_LIBADD = @DBUS_LIBS@
+ endif
+ endif
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


