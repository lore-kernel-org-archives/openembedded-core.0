Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7J-0005je-5s
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167830"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:44:59 -0700
Message-Id: <a105eaa189e6b062a3b0a2e5f48a53dcabe4056a.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/43] update-alternatives.bbclass: Ensure alternatives end up in per file deps
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:30 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Ensure that alternatives end up in per file provides, associated with the
source of the alternative.

Add a way to specify MANUAL_ALTERNATIVE_LINKS in order for programs that
manage their own alternatives to be more easily added to the per file
provides.

Add a function, package_do_filedeps_append to handle the setup of these
automatic per file dependencies.  The method is based on the code in the
busybox package that does similar work.  It replaces the brute force RPM
method that just adds a "Provides:" for each alternative.  This version
of the code was written by Richard Purdie and modified by me.

Add a check before moving the item to see if the destination already exists,
if it does, assume the package already performed the rename.  This is
necessary to deal with some packages that have symlinks pointing to renamed
items.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass             |   16 +++++---
 meta/classes/package_rpm.bbclass         |    4 --
 meta/classes/update-alternatives.bbclass |   59 +++++++++++++++++++++++++++++-
 3 files changed, 68 insertions(+), 11 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c3f077a..99c945d 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1162,6 +1162,15 @@ python package_do_filedeps() {
 	rpmdeps = d.expand("${RPMDEPS}")
 	r = re.compile(r'[<>=]+ +[^ ]*')
 
+	def file_translate(file):
+		ft = file.replace("@", "@at@")
+		ft = ft.replace(" ", "@space@")
+		ft = ft.replace("\t", "@tab@")
+		ft = ft.replace("[", "@openbrace@")
+		ft = ft.replace("]", "@closebrace@")
+		ft = ft.replace("_", "@underscore@")
+		return ft
+
 	# Quick routine to process the results of the rpmdeps call...
 	def process_deps(pipe, pkg, provides_files, requires_files):
 		provides = {}
@@ -1179,12 +1188,7 @@ python package_do_filedeps() {
 				continue
 
 			file = f.replace(pkgdest + "/" + pkg, "")
-			file = file.replace("@", "@at@")
-			file = file.replace(" ", "@space@")
-			file = file.replace("\t", "@tab@")
-			file = file.replace("[", "@openbrace@")
-			file = file.replace("]", "@closebrace@")
-			file = file.replace("_", "@underscore@")
+			file = file_translate(file)
 			value = line.split(":", 1)[1].strip()
 			value = r.sub(r'(\g<0>)', value)
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index ffe3b31..30bb08b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -720,10 +720,6 @@ python write_specfile () {
 		splitrconflicts  = strip_multilib(localdata.getVar('RCONFLICTS', True), d) or ""
 		splitrobsoletes  = []
 
-		# For now we need to manually supplement RPROVIDES with any update-alternatives links
-		if pkg == d.getVar("PN", True):
-			splitrprovides = splitrprovides + " " + (d.getVar('ALTERNATIVE_LINK', True) or '') + " " + (d.getVar('ALTERNATIVE_LINKS', True) or '')
-
 		# Gather special src/first package data
 		if srcname == splitname:
 			srcrdepends    = splitrdepends
diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 7b0518d..46136c8 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -35,6 +35,14 @@
 #
 # If above assumption breaks your requirement, then you still need to use
 # your own update-alternatives command directly.
+#
+# Even if you specify your update-alternatives manually, you need to
+# use MANUAL_ALTERNATIVE_LINKS to specify each of the target linked items.
+# This ensures that package dependencies/provides are set appropriately.
+#
+# MANUAL_ALTERNATIVE_LINKS = "<target>:<source>"
+#
+# If no source is specified, it is assumed to be <target>.${PN}
 
 # defaults
 ALTERNATIVE_PRIORITY = "10"
@@ -71,7 +79,11 @@ done
 update_alternatives_batch_doinstall() {
 	for link in ${ALTERNATIVE_LINKS}
 	do
-		mv ${D}${link} ${D}${link}.${PN}
+		# Only do this if not already done..
+		# There are a few cases where a package will do this manually
+		if [ ! -e ${D}${link}.${PN} ]; then
+			mv ${D}${link} ${D}${link}.${PN}
+		fi
 	done
 }
 
@@ -85,6 +97,9 @@ def update_alternatives_after_parse(d):
         d.setVar('do_install', doinstall)
         return
 
+    if d.getVar('MANUAL_ALTERNATIVE_LINKS') != None:
+	return
+
     if d.getVar('ALTERNATIVE_NAME') == None:
         raise bb.build.FuncFailed, "%s inherits update-alternatives but doesn't set ALTERNATIVE_NAME" % d.getVar('FILE')
     if d.getVar('ALTERNATIVE_PATH') == None:
@@ -114,3 +129,45 @@ python populate_packages_prepend () {
 		postrm += d.getVar('update_alternatives_postrm', True)
 	d.setVar('pkg_postrm_%s' % pkg, postrm)
 }
+
+python package_do_filedeps_append () {
+	# We need to load the provides for each manually updated alternative
+	# This function sets up the provides only, it's up to the pkg_postinst
+	# to setup the actual links...
+
+	alt_links = {}
+
+	target = d.getVar('ALTERNATIVE_LINK', True)
+	source = d.getVar('ALTERNATIVE_PATH', True)
+	if target and source:
+		if source[0] != '/':
+			source = os.path.dirname(target) + '/' + source
+		alt_links[target] = source
+
+	pn = d.getVar('PN', True)
+	links = ((d.getVar('ALTERNATIVE_LINKS', True) or "") + " " + (d.getVar('MANUAL_ALTERNATIVE_LINKS', True) or "")).split()
+	for target in links:
+		# Generate the filename we need to set the dependency in
+		if ':' in target:
+			source = target.split(':')[1]
+			target = target.split(':')[0]
+		else:
+			source = target + '.' + pn
+		alt_links[target] = source
+
+	pkgdest = d.getVar('PKGDEST', True)
+	for target in alt_links:
+		link = alt_links[target]
+		source = file_translate(link)
+
+		for pkg in d.getVar('PACKAGES', True).split():
+			if not os.path.lexists('%s/%s/%s' % (pkgdest, pkg, link)):
+				bb.note('%s: NOT Adding alternative provide %s to package %s' % (link, target, pkg))
+				continue
+
+			bb.note('%s: Adding alternative provide %s to package %s' % (link, target, pkg))
+	
+			d.appendVar('FILERPROVIDES_%s_%s' % (source, pkg), " " + target)
+			if not source in (d.getVar('FILERPROVIDESFLIST_%s' % pkg, True) or "").split():
+				d.appendVar('FILERPROVIDESFLIST_%s' % pkg, " " + source)
+}
-- 
1.7.7.6



