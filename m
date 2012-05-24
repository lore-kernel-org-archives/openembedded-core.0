Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SXfuO-0002x9-QP
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 23:49:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="148125500"
Received: from sgarman-ws.jf.intel.com ([10.7.199.160])
	by orsmga002.jf.intel.com with ESMTP; 24 May 2012 14:38:48 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 14:38:12 -0700
Message-Id: <3e6e97b40f8cb9568993c5cc65d73189ec6b7b8a.1337892418.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1337892418.git.scott.a.garman@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
Subject: [PATCH 01/32] connman: Fix linking with gold linker
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
X-List-Received-Date: Thu, 24 May 2012 21:49:25 -0000

From: Khem Raj <raj.khem@gmail.com>

Fixes errors like below

/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
error: hidden symbol '__start___debug' is not defined locally
/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.6.3/ld:
error: hidden symbol '__stop___debug' is not defined locally
collect2: ld returned 1 exit status
make[1]: *** [plugins/loopback.la] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ange-visibility-to-default-for-debug-symb.patch |   35 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    3 +-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
new file mode 100644
index 0000000..e6f03e6
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
@@ -0,0 +1,35 @@
+From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 7 Apr 2012 18:52:12 -0700
+Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
+
+gold refuses to link in undefined weak symbols which
+have hidden visibility
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+Upstream-Status: Pending
+---
+ include/plugin.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/plugin.h b/include/plugin.h
+index 692a4e5..a9361c3 100644
+--- a/include/plugin.h
++++ b/include/plugin.h
+@@ -89,9 +89,9 @@ struct connman_plugin_desc {
+ #else
+ #define CONNMAN_PLUGIN_DEFINE(name, description, version, priority, init, exit) \
+ 		extern struct connman_debug_desc __start___debug[] \
+-				__attribute__ ((weak, visibility("hidden"))); \
++				__attribute__ ((weak, visibility("default"))); \
+ 		extern struct connman_debug_desc __stop___debug[] \
+-				__attribute__ ((weak, visibility("hidden"))); \
++				__attribute__ ((weak, visibility("default"))); \
+ 		extern struct connman_plugin_desc connman_plugin_desc \
+ 				__attribute__ ((visibility("default"))); \
+ 		struct connman_plugin_desc connman_plugin_desc = { \
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index f87c4dd..da48e94 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -6,6 +6,7 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://add_xuser_dbus_permission.patch \
             file://ethernet_default.patch \
             file://disable_alg-test.patch \
+            file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r1"
+PR = "r2"
-- 
1.7.9.5



