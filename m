Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOK-0005br-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351222"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:02 -0800
Message-Id: <6bcb700b6e5e95752f18e247c5c7524e7bbc3118.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 20/33] classes/[gnome|gnomebase|mime]: enhance gnome related classes
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:45 -0000

From: Joshua Lock <josh@linux.intel.com>

This patch pulls in the gnome related classes from oe-core which
adds extra packaging rules and functionality whilst modularising things
so that one can get a subset of gnome functionality without adding a lot
of extra dependencies.

These aren't an exact copy of the classes from meta-openembedded, notable
differences are:
* gnome.bbclass - I dropped the BBCLASSEXTEND
* mime.bbclass:
  - updated coding style
  - use which to find update-mime-database program rather than hard coded
  - fix typo in populate_packges_append such that it's actually called

CC: Koen Kooi <koen@dominion.thruhere.net>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/gnome.bbclass     |   18 +-----------
 meta/classes/gnomebase.bbclass |   30 ++++++++++++++++++++
 meta/classes/mime.bbclass      |   58 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 16 deletions(-)
 create mode 100644 meta/classes/gnomebase.bbclass
 create mode 100644 meta/classes/mime.bbclass

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index 3d68b12..a19dd17 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,17 +1,3 @@
-def gnome_verdir(v):
-	import re
-	m = re.match("^([0-9]+)\.([0-9]+)", v)
-	return "%s.%s" % (m.group(1), m.group(2))
+inherit gnomebase gtk-icon-cache gconf mime
 
-SECTION ?= "x11/gnome"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
-
-DEPENDS += "gnome-common"
-
-FILES_${PN} += "${datadir}/application-registry \
-    ${datadir}/mime-info \
-    ${datadir}/gnome-2.0"
-
-inherit autotools pkgconfig gconf
-
-EXTRA_OEMAKE += "GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1"
+EXTRA_OECONF += "--enable-introspection=no"
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
new file mode 100644
index 0000000..a4209a0
--- /dev/null
+++ b/meta/classes/gnomebase.bbclass
@@ -0,0 +1,30 @@
+def gnome_verdir(v):
+	import re
+	m = re.match("^([0-9]+)\.([0-9]+)", v)
+	return "%s.%s" % (m.group(1), m.group(2))
+
+SECTION ?= "x11/gnome"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.bz2;name=archive"
+
+DEPENDS += "gnome-common"
+
+FILES_${PN} += "${datadir}/application-registry  \
+	${datadir}/mime-info \
+	${datadir}/mime/packages \	
+	${datadir}/mime/application \
+	${datadir}/gnome-2.0 \
+	${datadir}/polkit* \
+	${datadir}/GConf \
+	${datadir}/glib-2.0/schemas \
+"
+
+FILES_${PN}-doc += "${datadir}/devhelp"
+
+inherit autotools pkgconfig
+
+do_install_append() {
+	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
+	rm -rf ${D}${localstatedir}/scrollkeeper/*
+	rm -f ${D}${datadir}/applications/*.cache
+}
+
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
new file mode 100644
index 0000000..4a2ce8b
--- /dev/null
+++ b/meta/classes/mime.bbclass
@@ -0,0 +1,58 @@
+DEPENDS += "shared-mime-info-native shared-mime-info"
+
+mime_postinst() {
+if [ "$1" = configure ]; then
+	UPDATEMIMEDB=`which update-mime-database`
+	if [ -x "$UPDATEMIMEDB" ] ; then
+		echo "Updating MIME database... this may take a while."
+		$UPDATEMIMEDB $D${datadir}/mime
+	else
+		echo "Missing update-mime-database, update of mime database failed!"
+		exit 1
+	fi
+fi
+}
+
+mime_postrm() {
+if [ "$1" = remove ] || [ "$1" = upgrade ]; then
+	UPDATEMIMEDB=`which update-mime-database`
+	if [ -x "$UPDATEMIMEDB" ] ; then
+		echo "Updating MIME database... this may take a while."
+		$UPDATEMIMEDB $D${datadir}/mime
+	else
+		echo "Missing update-mime-database, update of mime database failed!"
+		exit 1
+	fi
+fi
+}
+
+python populate_packages_append () {
+	import re
+	packages = d.getVar('PACKAGES', True).split()
+	pkgdest =  d.getVar('PKGDEST', True)
+
+	for pkg in packages:
+		mime_dir = '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
+		mimes = []
+		mime_re = re.compile(".*\.xml$")
+		if os.path.exists(mime_dir):
+			for f in os.listdir(mime_dir):
+				if mime_re.match(f):
+					mimes.append(f)
+		if mimes:
+			bb.note("adding mime postinst and postrm scripts to %s" % pkg)
+			postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
+			if not postinst:
+				postinst = '#!/bin/sh\n'
+			postinst += d.getVar('mime_postinst', True)
+			d.setVar('pkg_postinst_%s' % pkg, postinst)
+			postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
+			if not postrm:
+				postrm = '#!/bin/sh\n'
+			postrm += d.getVar('mime_postrm', True)
+			d.setVar('pkg_postrm_%s' % pkg, postrm)
+			bb.note("adding shared-mime-info-data dependency to %s" % pkg)
+			rdepends = explode_deps(dgetVar('RDEPENDS_' + pkg, False) or d.getVar('RDEPENDS', False)) or ""
+			rdepends.append("shared-mime-info-data")
+			d.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends))
+}
-- 
1.7.6.4



