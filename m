Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qbkpf-0006b9-O8
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 04:48:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 19:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,441,1304319600"; d="scan'208";a="21316922"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 19:45:07 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 10:59:31 +0800
Message-Id: <d9f0c06179efc583c3beb771ef3fb76ff2fc735b.1309315723.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1309315723.git.dongxiao.xu@intel.com>
References: <cover.1309315723.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/6] connman: Upgrade to version 0.75
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
X-List-Received-Date: Wed, 29 Jun 2011 02:48:53 -0000

Enable ofono plugin.
Adopt some logic in meta-oe on connman plugin runtime dependency.
Remove the fix-shutdown-ap-disconnect.patch since the original logic no longer exists.
Add Upstream-Status information for patches.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman-0.65/fix-shutdown-ap-disconnect.patch  |   42 --------------------
 .../add_xuser_dbus_permission.patch                |    2 +
 .../connman/{connman-0.65 => connman-0.75}/connman |    0
 .../{connman-0.65 => connman-0.75}/dbusperms.patch |    2 +
 meta/recipes-connectivity/connman/connman.inc      |   14 ++++++-
 .../connman/{connman_0.65.bb => connman_0.75.bb}   |    8 ++--
 6 files changed, 20 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/add_xuser_dbus_permission.patch (94%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/connman (100%)
 rename meta/recipes-connectivity/connman/{connman-0.65 => connman-0.75}/dbusperms.patch (91%)
 rename meta/recipes-connectivity/connman/{connman_0.65.bb => connman_0.75.bb} (74%)

diff --git a/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch b/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
deleted file mode 100644
index a0ad099..0000000
--- a/meta/recipes-connectivity/connman/connman-0.65/fix-shutdown-ap-disconnect.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Schedule delayed scan when being disconnected from an AP
-
-When being disconnected from an AP, a delayed scan is scheduled to make
-sure the AP is still there. wpa_supplicant removes a BSS from its bss list
-when it disappears from the scan results twice in a row.
-
-Author: Samuel Ortiz <sameo@linux.intel.com>
-Ported by Dongxiao Xu <dongxiao.xu@intel.com>
-
-diff -ruN connman-0.56-orig/plugins/supplicant.c connman-0.56/plugins/supplicant.c
---- connman-0.56-orig/plugins/supplicant.c	2010-09-25 15:08:21.242927383 +0800
-+++ connman-0.56/plugins/supplicant.c	2010-09-25 15:12:46.346136858 +0800
-@@ -2184,6 +2184,15 @@
- 				scanning == TRUE ? "started" : "finished");
- }
- 
-+static gboolean delayed_scan(gpointer user_data)
-+{
-+	struct supplicant_task *task = user_data;
-+
-+	supplicant_scan(task->device);
-+
-+	return FALSE;
-+}
-+
- static void state_change(struct supplicant_task *task, DBusMessage *msg)
- {
- 	DBusError error;
-@@ -2277,7 +2286,13 @@
- 				task_connect(task);
- 			} else
- 				task->network = NULL;
-+		} else {
-+			if (task->state == WPA_DISCONNECTED)
-+				g_timeout_add_seconds(10, delayed_scan, task);
-+
-+			remove_network(task);
- 		}
-+
- 		break;
- 
- 	default:
diff --git a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
similarity index 94%
rename from meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch
rename to meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
index 787d49b..764c689 100644
--- a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch
+++ b/meta/recipes-connectivity/connman/connman-0.75/add_xuser_dbus_permission.patch
@@ -1,6 +1,8 @@
 Some platform (like atom-pc) enables rootless X,
 thus we need to add the xuser in the list.
 
+Upstream-Status: Inappropriate [configuration]
+
 Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
 
 diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connman-dbus.conf
diff --git a/meta/recipes-connectivity/connman/connman-0.65/connman b/meta/recipes-connectivity/connman/connman-0.75/connman
similarity index 100%
rename from meta/recipes-connectivity/connman/connman-0.65/connman
rename to meta/recipes-connectivity/connman/connman-0.75/connman
diff --git a/meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch b/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
similarity index 91%
rename from meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch
rename to meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
index 100af03..c331654 100644
--- a/meta/recipes-connectivity/connman/connman-0.65/dbusperms.patch
+++ b/meta/recipes-connectivity/connman/connman-0.75/dbusperms.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/src/connman-dbus.conf
 ===================================================================
 --- git.orig/src/connman-dbus.conf	2009-05-26 00:34:35.000000000 +0100
diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index fb970ed..ccff573 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -14,7 +14,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
 
 DEPENDS  = "libgdbus dbus glib-2.0 hal iptables"
-RDEPENDS_${PN} = "wpa-supplicant resolvconf"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -40,7 +39,18 @@ FILES_${PN}-dbg += "${libdir}/connman/plugins/.debug \
                     ${libdir}/connman/scripts/.debug"
 
 python populate_packages_prepend() {
+	depmap = dict( wifi="wpa-supplicant", bluetooth="bluez4", ofono="ofono" )
+	packages = []
+	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
+
 	plugin_dir = bb.data.expand('${libdir}/connman/plugins/', d)
 	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
-	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='' )
+
+	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
+
+	for (file, package) in packages:
+		plugintype = package.split( '-' )[-1]
+		if plugintype in depmap:
+			bb.note( "Adding rdependency on %s to package %s" % ( depmap[plugintype], package ) )
+			bb.data.setVar("RDEPENDS_%s" % package, depmap[plugintype], d)
 }
diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
similarity index 74%
rename from meta/recipes-connectivity/connman/connman_0.65.bb
rename to meta/recipes-connectivity/connman/connman_0.75.bb
index 852f8dc..75ef5b5 100644
--- a/meta/recipes-connectivity/connman/connman_0.65.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r1"
+PR = "r0"
 
 EXTRA_OECONF += "\
   ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
@@ -16,14 +16,14 @@ EXTRA_OECONF += "\
   --disable-udev \
   --disable-polkit \
   --enable-client \
+  --enable-ofono \
   --prefix=/usr --sysconfdir=/etc --localstatedir=/var"
 
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/connman/connman-${PV}.tar.gz \
-  file://fix-shutdown-ap-disconnect.patch \
   file://add_xuser_dbus_permission.patch \
   file://connman \
 "
 
-SRC_URI[md5sum] = "bd714da295ed2d2d91a49539f4c4fa3a"
-SRC_URI[sha256sum] = "a1c1d93da6bb4c2d8ae53293b06f237e02f5e796d2bba73ec639a466d05259c3"
+SRC_URI[md5sum] = "9973cb89a11fff6b51fc85b51c13b711"
+SRC_URI[sha256sum] = "b15361237f7ec8092fb0e55d4585550ab35491485edaf10ddd032d6e36299db7"
-- 
1.7.1



