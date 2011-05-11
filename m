Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QK2CV-0006Sa-1n
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 07:43:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 May 2011 22:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; d="scan'208";a="745528503"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2011 22:40:20 -0700
Message-Id: <e8d13624e79e861125fd3b49613499dcb0f9bff8.1305092349.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305092348.git.nitin.a.kamble@intel.com>
References: <cover.1305092348.git.nitin.a.kamble@intel.com>
Old-Date: Tue, 10 May 2011 21:59:19 -0700
Date: Tue, 10 May 2011 22:40:20 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/5] libunique: Fix for compilation with gcc 4.6.0
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
X-List-Received-Date: Wed, 11 May 2011 05:43:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libunique/fix_for_compile_with_gcc-4.6.0.patch |   36 ++++++++++++++++++++
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    5 ++-
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch

diff --git a/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch b/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
new file mode 100644
index 0000000..d75de93
--- /dev/null
+++ b/meta/recipes-gnome/libunique/libunique/fix_for_compile_with_gcc-4.6.0.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Pending
+
+Fix Following compilation errors with gcc 4.6.0
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/10
+
+| uniquebackend-dbus.c: In function 'unique_backend_dbus_request_name':
+| uniquebackend-dbus.c:87:22: error: variable 'backend_dbus' set but not used [-Werror=unused-but-set-variable]
+| uniquebackend-dbus.c: In function 'unique_backend_dbus_send_message':
+| uniquebackend-dbus.c:189:12: error: variable 'res' set but not used [-Werror=unused-but-set-variable]
+| cc1: all warnings being treated as errors
+| 
+| make[5]: *** [libunique_dbus_la-uniquebackend-dbus.lo] Error 1
+
+Index: libunique-1.1.6/unique/dbus/uniquebackend-dbus.c
+===================================================================
+--- libunique-1.1.6.orig/unique/dbus/uniquebackend-dbus.c
++++ libunique-1.1.6/unique/dbus/uniquebackend-dbus.c
+@@ -84,7 +84,7 @@ unique_backend_dbus_register_proxy (Uniq
+ static gboolean
+ unique_backend_dbus_request_name (UniqueBackend *backend)
+ {
+-  UniqueBackendDBus *backend_dbus;
++  UniqueBackendDBus __attribute__((__unused__)) *backend_dbus;
+   const gchar *name;
+   DBusGConnection *connection;
+   DBusGProxy *proxy;
+@@ -186,7 +186,7 @@ unique_backend_dbus_send_message (Unique
+   GValueArray *data;
+   gchar *cmd;
+   gchar *resp;
+-  gboolean res;
++  gboolean __attribute__((__unused__)) res;
+   GError *error;
+   UniqueResponse response;
+ 
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index cbf085e..4f3cdb6 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "Unique is a library for writing single instance application. If y
 HOMEPAGE = "http://live.gnome.org/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 
-SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
+	file://fix_for_compile_with_gcc-4.6.0.patch"
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "glib-2.0 gtk+ dbus"
 
-- 
1.7.3.4



