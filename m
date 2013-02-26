Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UAO5F-0000ZU-E6
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:13:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Feb 2013 08:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,742,1355126400"; d="scan'208";a="267931968"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 26 Feb 2013 08:56:23 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Feb 2013 18:56:48 +0200
Message-Id: <1361897808-5118-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH V3] connman: enable connman client
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
X-List-Received-Date: Tue, 26 Feb 2013 17:13:24 -0000

connmanctl is available in a new
package: connman-client

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index b61e2af..db4d26c 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r17"
+INC_PR = "r18"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -38,7 +38,7 @@ EXTRA_OECONF += "\
     --enable-tools \
     --enable-test \
     --disable-polkit \
-    --disable-client \
+    --enable-client \
     --enable-fake \
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '', d)} \
 "
@@ -73,6 +73,7 @@ do_install_append() {
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
 	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
 	rmdir ${D}${libdir}/connman/scripts
@@ -116,13 +117,15 @@ python populate_packages_prepend() {
             d.setVar("RDEPENDS_%s" % package, " ".join(rdepends))
 }
 
-PACKAGES =+ "${PN}-tools ${PN}-tests"
+PACKAGES =+ "${PN}-tools ${PN}-tests ${PN}-client"
 
 FILES_${PN}-tools = "${bindir}/wispr"
 
 FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
 RDEPENDS_${PN}-tests = "python-dbus python-pygobject python-textutils python-subprocess python-fcntl python-netclient"
 
+FILES_${PN}-client = "${bindir}/connmanctl"
+
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${libdir}/connman/plugins \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-- 
1.7.10.4



