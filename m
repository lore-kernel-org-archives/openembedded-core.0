Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 95C217070B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 18:10:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2014 11:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="582500086"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 11:10:11 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 21:10:01 +0300
Message-Id: <4d56a19d0fc2eaae668da41238d369dc578ff134.1409162830.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] connman: upgrade to 1.25
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
X-List-Received-Date: Wed, 27 Aug 2014 18:10:18 -0000

build-libppp-plugin-without-versioning-info.patch
no longer needed, removed.
Changelog:
Fix issue with handling rebind timer for DHCPv6.
Fix issue with handling DHCP renew transaction.
Fix issue with user supplied proxy settings and DHCP.
Fix issue with extra status codes from captive portals.
Fix issue with service idle state reset on failure.
Fix issue with DNS label compression handling.
Add support for experimental P2P Peer service.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...ild-libppp-plugin-without-versioning-info.patch | 32 ----------------------
 .../connman/{connman_1.24.bb => connman_1.25.bb}   |  5 ++--
 2 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
 rename meta/recipes-connectivity/connman/{connman_1.24.bb => connman_1.25.bb} (59%)

diff --git a/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch b/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
deleted file mode 100644
index 8e81f1b..0000000
--- a/meta/recipes-connectivity/connman/connman/build-libppp-plugin-without-versioning-info.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted
-Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
-
-From dd8044ed6ccb468558bab037257e27a409903d86 Mon Sep 17 00:00:00 2001
-From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
-Date: Mon, 21 Jul 2014 15:01:45 +0300
-Subject: [PATCH] scripts: Build libppp-plugin as a plain .so file
-
-There is no need to have module versioning for libppp-plugin.so
-file so build the plugin same way as other vpn plugins.
-
-This issue was seen when building ConnMan for Yocto.
----
- Makefile.plugins | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.plugins b/Makefile.plugins
-index 294cae0..8139967 100644
---- a/Makefile.plugins
-+++ b/Makefile.plugins
-@@ -4,7 +4,7 @@ plugin_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
- plugin_ldflags = -no-undefined -module -avoid-version
- 
- script_cflags = -fvisibility=hidden -I$(srcdir)/gdbus \
--					@DBUS_CFLAGS@
-+		@DBUS_CFLAGS@ $(plugin_ldflags) -shared
- 
- if LOOPBACK
- builtin_modules += loopback
--- 
-1.8.3.1
-
diff --git a/meta/recipes-connectivity/connman/connman_1.24.bb b/meta/recipes-connectivity/connman/connman_1.25.bb
similarity index 59%
rename from meta/recipes-connectivity/connman/connman_1.24.bb
rename to meta/recipes-connectivity/connman/connman_1.25.bb
index 29e239c..1758c95 100644
--- a/meta/recipes-connectivity/connman/connman_1.24.bb
+++ b/meta/recipes-connectivity/connman/connman_1.25.bb
@@ -4,9 +4,8 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
-            file://build-libppp-plugin-without-versioning-info.patch \
             "
-SRC_URI[md5sum] = "dd6e1b4d9b9a28d127edb9f9b58bdec1"
-SRC_URI[sha256sum] = "551df7a5f0c6e4d69523dd2b3aa2c54525b323457d5135f64816215bad3dc24c"
+SRC_URI[md5sum] = "a449d2e49871494506e48765747e6624"
+SRC_URI[sha256sum] = "c1d266d6be18d2f66231f3537a7ed17b57637ca43c27328bc13c508cbeacce6e"
 
 RRECOMMENDS_${PN} = "connman-conf"
-- 
1.9.1


