Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMr-00065Z-Ci
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:21 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292945"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:52 -0700
Message-Id: <f991e06de95a9e24e4db606c4400483179098723.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 38/41] connman: ship the empty plugins directory in the connman package
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:22 -0000

From: Ross Burton <ross.burton@intel.com>

Otherwise we get a QA warning that /usr/lib/connman/packages isn't shipped.
---
 meta/recipes-connectivity/connman/connman.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 73e7818..12378e9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -99,7 +99,7 @@ python populate_packages_prepend() {
 	hook = lambda file,pkg,b,c,d:packages.append((file,pkg))
 	plugin_dir = d.expand('${libdir}/connman/plugins/')
 	plugin_name = d.expand('${PN}-plugin-%s')
-	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook )
+	do_split_packages(d, plugin_dir, '^(.*).so$', plugin_name, '${PN} plugin for %s', extra_depends='', hook=hook, prepend=True )
 	for (file, package) in packages:
 		plugintype = package.split( '-' )[-1]
 		if plugintype in depmap:
@@ -116,6 +116,7 @@ FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
 RDEPENDS_${PN}-tests = "python-dbus"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
+            ${libdir}/connman/plugins \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
             ${datadir}/dbus-1/system-services/*"
-- 
1.7.7.6



