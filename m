Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jukka.rissanen@linux.intel.com>) id 1UamoJ-0004yv-9b
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 14:52:58 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 05:33:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,647,1363158000"; d="scan'208";a="331933749"
Received: from sorvi.fi.intel.com ([10.237.72.154])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 05:33:20 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 15:33:14 +0300
Message-Id: <1368189198-1294-2-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH 1/5] connman: Enable VPN support
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
X-List-Received-Date: Fri, 10 May 2013 12:53:02 -0000
X-List-Received-Date: Fri, 10 May 2013 12:53:02 -0000

If DISTRO_FEATURES contains vpn, then enable vpn support in ConnMan.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index afc361c..3f01803 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -49,6 +49,8 @@ INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-/usr/lib/connman/wired-setup"
 
+SYSTEMD_SERVICE_${PN} += " ${@base_contains('DISTRO_FEATURES', 'vpn', 'connman-vpn.service', '', d)}"
+
 # IMPORTANT: because xuser is shared with rootless X, please make sure the
 # USERADD_PARAM is in sync with the one in xserver-nodm-init.bb
 USERADD_PACKAGES = "${PN}"
@@ -67,6 +69,10 @@ do_configure_append () {
 # both this and the xuser patch can be dropped.
 do_compile_append() {
 	sed -i -e s:deny:allow:g src/connman-dbus.conf
+
+	if ${@base_contains('DISTRO_FEATURES','vpn','true','false',d)}; then
+		sed -i -e s:deny:allow:g vpn/vpn-dbus.conf
+	fi
 }
 
 do_install_append() {
@@ -80,12 +86,17 @@ do_install_append() {
 	install -m 0755 ${S}/tools/wispr ${D}${bindir}
 	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
-	# We don't need to package an empty directory
-	rmdir ${D}${libdir}/connman/scripts
+	# We don't need to package an empty directory if vpn is not in use
+	if ${@base_contains('DISTRO_FEATURES','vpn','false','true',d)}; then
+		rmdir ${D}${libdir}/connman/scripts
+	fi
 
 	# Automake 1.12 won't install empty directories, but we need the
 	# plugins directory to be present for ownership
 	mkdir -p ${D}${libdir}/connman/plugins
+	if ${@base_contains('DISTRO_FEATURES','vpn','true','false',d)}; then
+		mkdir -p ${D}${libdir}/connman/plugins-vpn
+	fi
 }
 
 # These used to be plugins, but now they are core
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
@@ -133,6 +155,7 @@ FILES_${PN}-client = "${bindir}/connmanctl"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
+            ${libdir}/connman/plugins-vpn \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
             ${datadir}/dbus-1/system-services/*"
-- 
1.7.11.7



