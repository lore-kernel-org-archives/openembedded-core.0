Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFE1777086
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 08:02:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 01 Oct 2015 01:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,616,1437462000"; d="scan'208";a="781650082"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2015 01:02:14 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 11:04:36 +0300
Message-Id: <a4c636514b96ab97b9b4d3d487099d0fc25aff84.1443686344.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e636475eca83f69162538109ca09176a69d6a21c.1443686344.git.jussi.kukkonen@intel.com>
References: <e636475eca83f69162538109ca09176a69d6a21c.1443686344.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1443686344.git.jussi.kukkonen@intel.com>
References: <cover.1443686344.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 2/2] xuser-account: Take over xuser specific D-Bus policy
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
X-List-Received-Date: Thu, 01 Oct 2015 08:02:15 -0000

Move connmans xuser-related D-Bus policy to a separate file that
xuser-account installs: This way connman does not need to depend on
xuser-account. Add policies for bluez and ofono in the same file.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |  1 -
 .../connman/add_xuser_dbus_permission.patch        | 43 ----------------------
 meta/recipes-connectivity/connman/connman_1.30.bb  |  1 -
 .../user-creation/files/system-xuser.conf          | 11 ++++++
 .../user-creation/xuser-account_0.1.bb             |  6 ++-
 5 files changed, 15 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
 create mode 100644 meta/recipes-support/user-creation/files/system-xuser.conf

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 1712af3..ab7f86d 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -107,7 +107,6 @@ RPROVIDES_${PN} = "\
 
 RDEPENDS_${PN} = "\
 	dbus \
-	xuser-account \
 	"
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
diff --git a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
deleted file mode 100644
index 15a191d..0000000
--- a/meta/recipes-connectivity/connman/connman/add_xuser_dbus_permission.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Because Poky doesn't support at_console we need to
-special-case the session user.
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
----
- src/connman-dbus.conf | 3 +++
- vpn/vpn-dbus.conf     | 3 +++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/connman-dbus.conf b/src/connman-dbus.conf
-index 98a773e..466809c 100644
---- a/src/connman-dbus.conf
-+++ b/src/connman-dbus.conf
-@@ -8,6 +8,9 @@
-         <allow send_interface="net.connman.Counter"/>
-         <allow send_interface="net.connman.Notification"/>
-     </policy>
-+    <policy user="xuser">
-+        <allow send_destination="net.connman"/>
-+    </policy>
-     <policy at_console="true">
-         <allow send_destination="net.connman"/>
-     </policy>
-diff --git a/vpn/vpn-dbus.conf b/vpn/vpn-dbus.conf
-index 0f0c8da..9ad05b9 100644
---- a/vpn/vpn-dbus.conf
-+++ b/vpn/vpn-dbus.conf
-@@ -6,6 +6,9 @@
-         <allow send_destination="net.connman.vpn"/>
-         <allow send_interface="net.connman.vpn.Agent"/>
-     </policy>
-+    <policy user="xuser">
-+        <allow send_destination="net.connman.vpn"/>
-+    </policy>
-     <policy at_console="true">
-         <allow send_destination="net.connman.vpn"/>
-     </policy>
--- 
-2.1.4
-
diff --git a/meta/recipes-connectivity/connman/connman_1.30.bb b/meta/recipes-connectivity/connman/connman_1.30.bb
index 9b512c5..7d65ac9 100644
--- a/meta/recipes-connectivity/connman/connman_1.30.bb
+++ b/meta/recipes-connectivity/connman/connman_1.30.bb
@@ -2,7 +2,6 @@ require connman.inc
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
-            file://add_xuser_dbus_permission.patch \
             file://0001-Detect-backtrace-API-availability-before-using-it.patch \
             file://0002-resolve-musl-does-not-implement-res_ninit.patch \
             file://0003-Fix-header-inclusions-for-musl.patch \
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/meta/recipes-support/user-creation/files/system-xuser.conf
new file mode 100644
index 0000000..d42e3d1
--- /dev/null
+++ b/meta/recipes-support/user-creation/files/system-xuser.conf
@@ -0,0 +1,11 @@
+<!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
+ "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
+<busconfig>
+    <policy user="xuser">
+        <allow send_destination="net.connman"/>
+        <allow send_destination="net.connman.vpn"/>
+        <allow send_destination="org.ofono"/>
+        <allow send_destination="org.bluez"/>
+    </policy>
+</busconfig>
+
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
index 77ba97d..13ba677 100644
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Creates an 'xuser' account used for running X11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-SRC_URI = ""
+SRC_URI = "file://system-xuser.conf"
 
 inherit allarch useradd
 
@@ -15,9 +15,11 @@ do_compile() {
 }
 
 do_install() {
-    :
+    install -D -m 0644 ${WORKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
 }
 
+FILES_${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
+
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system shutdown"
 USERADD_PARAM_${PN} = "--create-home \
-- 
2.1.4


