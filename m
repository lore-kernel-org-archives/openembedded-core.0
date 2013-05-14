Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UcAbW-0003Zp-0h
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 10:29:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 May 2013 01:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,667,1363158000"; d="scan'208";a="302127700"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by azsmga001.ch.intel.com with ESMTP; 14 May 2013 01:10:47 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2013 11:10:41 +0300
Message-Id: <1368519045-8266-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368519045-8266-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368519045-8266-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v3 1/5] connman: Add VPN support
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
X-List-Received-Date: Tue, 14 May 2013 08:29:42 -0000

One needs to add following statement into local.conf or distro config

PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"

in order to activate support for these VPN technogies in ConnMan.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 52 +++++++++++++++++++++------
 1 file changed, 42 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afc361c..137deed 100644
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
@@ -81,7 +87,7 @@ do_install_append() {
 	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
-	rmdir ${D}${libdir}/connman/scripts
+	rmdir --ignore-fail-on-non-empty ${D}${libdir}/connman/scripts
 
 	# Automake 1.12 won't install empty directories, but we need the
 	# plugins directory to be present for ownership
@@ -106,20 +112,32 @@ RDEPENDS_${PN} = "\
 
 PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
+def add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, add_insane_skip):
+    plugintype = pkg.split( '-' )[-1]
+    if plugintype in depmap:
+        rdepends = map(lambda x: multilib_prefix + x, \
+                       depmap[plugintype].split())
+        d.setVar("RDEPENDS_%s" % pkg, " ".join(rdepends))
+    if add_insane_skip:
+        d.appendVar("INSANE_SKIP_%s" % pkg, "dev-so")
+
 python populate_packages_prepend() {
     depmap = dict(pppd="ppp")
-    packages = []
     multilib_prefix = (d.getVar("MLPREFIX", True) or "")
-    hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
+
+    hook = lambda file,pkg,x,y,z: \
+        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, False)
     plugin_dir = d.expand('${libdir}/connman/plugins/')
     plugin_name = d.expand('${PN}-plugin-%s')
-    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
-    for (file, package) in packages:
-        plugintype = package.split( '-' )[-1]
-        if plugintype in depmap:
-            rdepends = map(lambda x: multilib_prefix + x,  depmap[plugintype].split())
-            bb.note( "Adding rdependency on %s to %s" % ( rdepends, package ) )
-            d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
+    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
+        '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
+
+    hook = lambda file,pkg,x,y,z: \
+        add_rdepends(bb, d, file, pkg, depmap, multilib_prefix, True)
+    plugin_dir = d.expand('${libdir}/connman/plugins-vpn/')
+    plugin_name = d.expand('${PN}-plugin-vpn-%s')
+    do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, \
+        '${PN} VPN plugin for %s', extra_depends='', hook=hook, prepend=True )
 }
 
 PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
@@ -140,3 +158,17 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
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



