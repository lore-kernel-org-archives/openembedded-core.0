Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UbsTU-0002D5-Ph
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 15:07:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 May 2013 05:47:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,662,1363158000"; d="scan'208";a="312667944"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by orsmga001.jf.intel.com with ESMTP; 13 May 2013 05:49:18 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2013 15:49:13 +0300
Message-Id: <1368449357-3191-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368449357-3191-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 1/5] connman: Add VPN support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 13:08:01 -0000
X-List-Received-Date: Mon, 13 May 2013 13:08:01 -0000
X-List-Received-Date: Mon, 13 May 2013 13:08:01 -0000

One needs to add following statement into local.conf or distro config

PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"

in order to activate support for these VPN technogies in ConnMan.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 48 ++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afc361c..73c7215 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -38,6 +38,10 @@ PACKAGECONFIG ??= "\
                    ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
 "
 
+# If you want ConnMan to support VPN, add following statement into
+# local.conf or distro config
+# PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
+
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
@@ -47,6 +51,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 SYSTEMD_SERVICE_${PN} = "connman.service"
+SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
 
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
@@ -67,6 +72,7 @@ do_configure_append () {
 # both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
+	sed -i -e s:deny:allow:g vpn/vpn-dbus.conf
 }
 
 do_install_append() {
@@ -81,13 +87,18 @@ do_install_append() {
 	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
-	rmdir ${D}${libdir}/connman/scripts
+	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts
 
 	# Automake 1.12 won't install empty directories, but we need the
 	# plugins directory to be present for ownership
 	mkdir -p ${D}${libdir}/connman/plugins
 }
 
+do_install_append_${PN}-vpn() {
+	mkdir -p ${D}${libdir}/connman/scripts
+	mkdir -p ${D}${libdir}/connman/plugins-vpn
+}
+
 # These used to be plugins, but now they are core
 RPROVIDES_${PN} = "\
 	connman-plugin-loopback \
@@ -120,6 +131,17 @@ python populate_packages_prepend() {
             rdepends = map(lambda x: multilib_prefix + x,  depmap[plugintype].split())
             bb.note( "Adding rdependency on %s to %s" % ( rdepends, package ) )
             d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
+
+    packages = []
+    plugin_dir = d.expand('${libdir}/connman/plugins-vpn/')
+    plugin_name = d.expand('${PN}-plugin-vpn-%s')
+    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} VPN plugin for %s', extra_depends='', hook=hook, prepend=True )
+    for (file, package) in packages:
+        plugintype = package.split( '-' )[-1]
+        if plugintype in depmap:
+            rdepends = map(lambda x: multilib_prefix + x,  depmap[plugintype].split())
+            bb.note( "Adding rdependency on %s to %s" % ( rdepends, package ) )
+            d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
 }
 
 PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
@@ -131,12 +153,28 @@ RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-sub
 
 FILES_${PN}-client = "${bindir}/connmanctl"
 
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+FILES_${PN} = "${sbindir}/connmand ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/dbus-1/system-services/*"
+            ${sysconfdir}/connman ${sysconfdir}/dbus-1/system.d/connman.conf \
+            @base_contains('DISTRO_FEATURES','sysvinit','${sysconfdir}/init.d','',d)} \
+            ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* \
+            ${datadir}/${PN}"
 
 FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
 
 FILES_${PN}-dev += "${libdir}/connman/*/*.la"
+
+PACKAGES =+ "${PN}-vpn"
+
+SUMMARY_${PN}-vpn = "A daemon for managing VPN connections within embedded devices"
+DESCRIPTION_${PN}-vpn = "The ConnMan VPN provides a daemon for \
+managing VPN connections within embedded devices running the Linux \
+operating system.  The connman-vpnd handles all the VPN connections \
+and starts/stops VPN client processes when necessary. The connman-vpnd \
+provides a DBus API for managing VPN connections. All the different \
+VPN technogies are implemented using plug-ins."
+FILES_${PN}-vpn += "${sbindir}/connman-vpnd \
+                    ${sysconfdir}/dbus-1/system.d/connman-vpn-dbus.conf \
+                    ${datadir}/dbus-1/system-services/net.connman.vpn.service \
+                    ${systemd_unitdir}/system/connman-vpn.service"
-- 
1.7.11.7



