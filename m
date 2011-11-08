Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RNZNG-0003Cy-6X
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 01:17:10 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="72146542"
Received: from unknown (HELO shamshir.jf.intel.com) ([10.7.199.75])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2011 16:10:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2011 16:10:43 -0800
Message-Id: <bf140b91851fdaf45e2069923bad02f92ac3f2e7.1320709417.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
In-Reply-To: <cover.1320709417.git.josh@linux.intel.com>
References: <cover.1320709417.git.josh@linux.intel.com>
Subject: [PATCH 06/12] classes/[gnome|gnomebase|mime]: merge meta-oe's enhance gnome related classes
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
X-List-Received-Date: Tue, 08 Nov 2011 00:17:10 -0000

This patch pulls in the gnome related classes from meta-openembedded which
adds extra packaging rules and functionality whilst modularising things
so that one can get a subset of the gnome classes functionality without adding
all of the extra dependencies.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/gnome-base.bbclass |   15 ++++++++++
 meta/classes/gnome.bbclass      |   19 ++-----------
 meta/classes/gnomebase.bbclass  |   32 ++++++++++++++++++++++
 meta/classes/mime.bbclass       |   56 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 106 insertions(+), 16 deletions(-)
 create mode 100644 meta/classes/gnome-base.bbclass
 create mode 100644 meta/classes/gnomebase.bbclass
 create mode 100644 meta/classes/mime.bbclass

diff --git a/meta/classes/gnome-base.bbclass b/meta/classes/gnome-base.bbclass
new file mode 100644
index 0000000..378731d
--- /dev/null
+++ b/meta/classes/gnome-base.bbclass
@@ -0,0 +1,15 @@
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
+FILES_${PN} += "${datadir}/application-registry \
+    ${datadir}/mime-info \
+    ${datadir}/gnome-2.0"
+
+inherit autotools pkgconfig
\ No newline at end of file
diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index 3d68b12..0a32a77 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,17 +1,4 @@
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
+BBCLASSEXTEND += "native"
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
new file mode 100644
index 0000000..5a332a0
--- /dev/null
+++ b/meta/classes/gnomebase.bbclass
@@ -0,0 +1,32 @@
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
+AUTOTOOLS_STAGE_PKGCONFIG = "1"
+
+do_install_append() {
+	rm -rf ${D}${localstatedir}/lib/scrollkeeper/*
+	rm -rf ${D}${localstatedir}/scrollkeeper/*
+	rm -f ${D}${datadir}/applications/*.cache
+}
+
diff --git a/meta/classes/mime.bbclass b/meta/classes/mime.bbclass
new file mode 100644
index 0000000..b9cdd7b
--- /dev/null
+++ b/meta/classes/mime.bbclass
@@ -0,0 +1,56 @@
+DEPENDS += "shared-mime-info-native shared-mime-info"
+
+mime_postinst() {
+if [ "$1" = configure ]; then
+	if [ -x ${bindir}/update-mime-database ] ; then
+		echo "Updating MIME database... this may take a while."
+		update-mime-database $D${datadir}/mime
+	else
+		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
+		exit 1
+	fi
+fi
+}
+
+mime_postrm() {
+if [ "$1" = remove ] || [ "$1" = upgrade ]; then
+	if [ -x ${bindir}/update-mime-database ] ; then
+		echo "Updating MIME database... this may take a while."
+		update-mime-database $D${datadir}/mime
+	else
+		echo "Missing ${bindir}/update-mime-database, update of mime database failed!"
+		exit 1
+	fi
+fi
+}
+
+python ppopulate_packages_append () {
+	import os.path, re
+	packages = bb.data.getVar('PACKAGES', d, 1).split()
+	pkgdest =  bb.data.getVar('PKGDEST', d, 1)
+	
+	for pkg in packages:
+		mime_dir = '%s/%s/usr/share/mime/packages' % (pkgdest, pkg)
+		mimes = []
+		mime_re = re.compile(".*\.xml$")
+		if os.path.exists(mime_dir):
+			for f in os.listdir(mime_dir):
+				if mime_re.match(f):
+					mimes.append(f)
+		if mimes != []:
+			bb.note("adding mime postinst and postrm scripts to %s" % pkg)
+			postinst = bb.data.getVar('pkg_postinst_%s' % pkg, d, 1) or bb.data.getVar('pkg_postinst', d, 1)
+			if not postinst:
+				postinst = '#!/bin/sh\n'
+			postinst += bb.data.getVar('mime_postinst', d, 1)
+			bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+			postrm = bb.data.getVar('pkg_postrm_%s' % pkg, d, 1) or bb.data.getVar('pkg_postrm', d, 1)
+			if not postrm:
+				postrm = '#!/bin/sh\n'
+			postrm += bb.data.getVar('mime_postrm', d, 1)
+			bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
+			bb.note("adding freedesktop-mime-info dependency to %s" % pkg)
+			rdepends = explode_deps(bb.data.getVar('RDEPENDS_' + pkg, d, 0) or bb.data.getVar('RDEPENDS', d, 0) or "")
+			rdepends.append("freedesktop-mime-info")
+			bb.data.setVar('RDEPENDS_' + pkg, " " + " ".join(rdepends), d)
+}
-- 
1.7.7



