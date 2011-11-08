Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNH-0003Cy-VJ
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:12 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146547"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:47 -0800
Message-Id: <f0de6470dfb84e7939234cd516cd1a340bd71588.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 10/12] connman: split scripts into separate package
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:12 -0000

The connman scripts are useless without a Python interpreter so split
them into a separate package and add Python to its RDEPENDS.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 480b59c..e86bd9f 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -30,6 +30,9 @@ do_install_append() {
     install -m 0755 ${WORKDIR}/connman ${D}${sysconfdir}/init.d/connman
 }
 
+PACKAGES += "${PN}-scripts"
+RDEPENDS_${PN}-scripts += "python"
+
 PACKAGES_DYNAMIC = "${PN}-plugin-*"
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
@@ -37,7 +40,6 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${datadir}/pixmaps ${datadir}/applications \
             ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
             ${libdir}/bonobo/servers \
-            ${libdir}/${PN}/test/* \
             ${datadir}/dbus-1/system-services/* \
             ${libdir}/connman/scripts/dhclient*"
 FILES_${PN}-dbg += "${libdir}/connman/plugins/.debug \
@@ -45,6 +47,8 @@ FILES_${PN}-dbg += "${libdir}/connman/plugins/.debug \
 
 FILES_${PN}-dev += "${libdir}/connman/plugins/*.la"
 
+FILES_${PN}-scripts += "${libdir}/${PN}/test/*"
+
 python populate_packages_prepend() {
 	prefix = (d.getVar("MLPREFIX", True) or "")
 	depmap = dict( wifi=prefix+"wpa-supplicant", bluetooth=prefix+"bluez4", ofono=prefix+"ofono" )
-- 
1.7.7



