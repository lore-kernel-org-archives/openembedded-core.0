Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTTbL-0005lt-0G
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 08:47:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jun 2011 23:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,325,1304319600"; 
   d="scan'208";a="7608998"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.187])
	by azsmga001.ch.intel.com with ESMTP; 05 Jun 2011 23:44:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Jun 2011 23:44:14 -0700
Message-Id: <e66fee724ac6efa49cb941a59b2fc7c61bf14405.1307342214.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307342214.git.sgw@linux.intel.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/20] package.bbclass: add support to split Qt translation files
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
X-List-Received-Date: Mon, 06 Jun 2011 06:47:51 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

There're many Qt applications that provide translation files in '.qm'
format however those weren't being splitted as GetText based
ones.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/package.bbclass |   41 +++++++++++++++++++++++++++++++++++++----
 1 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1e6a872..e4be20f 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -343,6 +343,8 @@ python package_do_split_locales() {
 		bb.debug(1, "package requested not splitting locales")
 		return
 
+	import re
+
 	packages = (bb.data.getVar('PACKAGES', d, True) or "").split()
 
 	datadir = bb.data.getVar('datadir', d, True)
@@ -358,12 +360,29 @@ python package_do_split_locales() {
 
 	localedir = os.path.join(dvar + datadir, 'locale')
 
-	if not os.path.isdir(localedir):
+	locales = []
+	if os.path.isdir(localedir):
+		locales = os.listdir(localedir)
+
+	# Check of Qt translation files
+	qm_re = re.compile("(.*)\.qm$")
+	qm_files = {}
+	for root, dirs, files in os.walk(dvar):
+		for file in files:
+			qm_file = qm_re.match(file)
+			if qm_file:
+				locale = qm_file.group(1)
+				relpath = os.path.join(root, file).replace(dvar, '', 1)
+				if relpath:
+					if not qm_files.has_key(locale):
+						qm_files[locale] = []
+
+					qm_files[locale].append(relpath)
+
+	if len(locales) == 0 and len(qm_files) == 0:
 		bb.debug(1, "No locale files in this package")
 		return
 
-	locales = os.listdir(localedir)
-
 	# This is *really* broken
 	mainpkg = packages[0]
 	# At least try and patch it up I guess...
@@ -372,13 +391,27 @@ python package_do_split_locales() {
 	if mainpkg.find('-dev'):
 		mainpkg = mainpkg.replace('-dev', '')
 
+	# Queue Qt locales for spliting
+	for l in qm_files.keys():
+		if l not in locales:
+			locales.append(l)
+
+	# Split the locales into different packages
 	summary = bb.data.getVar('SUMMARY', d, True) or pn
 	description = bb.data.getVar('DESCRIPTION', d, True) or "" 
 	for l in locales:
 		ln = legitimize_package_name(l)
 		pkg = pn + '-locale-' + ln
 		packages.append(pkg)
-		bb.data.setVar('FILES_' + pkg, os.path.join(datadir, 'locale', l), d)
+		files = []
+		files.append(os.path.join(datadir, 'locale', l))
+
+		if qm_files.has_key(l):
+			locale_re = re.compile("^.*([a-z]{2}(_[A-Z]{2})?)$")
+			ln = legitimize_package_name(locale_re.match(l).group(1))
+			files += qm_files[l]
+
+		bb.data.setVar('FILES_' + pkg, " ".join(files), d)
 		bb.data.setVar('RDEPENDS_' + pkg, '%s virtual-locale-%s' % (mainpkg, ln), d)
 		bb.data.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln), d)
 		bb.data.setVar('SUMMARY_' + pkg, '%s - %s translations' % (summary, l), d)
-- 
1.7.3.4



