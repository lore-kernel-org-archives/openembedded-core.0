Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlye-0001XA-93
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213864"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:51 -0800
Message-Id: <6e253cbf39a14980d9f2009fdbb2314b854934c5.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 16/20] package.bbclass: Optimise the per file rpm handling
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:08 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently a process was being forked off for each individual file
this class wanted to inspect with rpmdeps. This converts it to use
rpmdeps-oecore which allows batch processing of these dependencies.

For do_package for perl, this reduced the time by about 1 minute (33%).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass          |   52 ++++++++++++++++++++------------
 meta/recipes-core/busybox/busybox.inc |    4 +-
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 348c13c..dfabcf8 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1125,7 +1125,7 @@ if [ x"$D" = "x" ]; then
 fi
 }
 
-RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
+RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps-oecore --macros ${STAGING_LIBDIR_NATIVE}/rpm/macros --define '_rpmfc_magic_path ${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc' --rpmpopt ${STAGING_LIBDIR_NATIVE}/rpm/rpmpopt"
 
 # Collect perfile run-time dependency metadata
 # Output:
@@ -1136,7 +1136,7 @@ RPMDEPS = "${STAGING_LIBDIR_NATIVE}/rpm/bin/rpmdeps --macros ${STAGING_LIBDIR_NA
 #  FILERDEPENDS_filepath_pkg - per file dep
 
 python package_do_filedeps() {
-	import os, re
+	import re, subprocess
 
 	pkgdest = d.getVar('PKGDEST', True)
 	packages = d.getVar('PACKAGES', True)
@@ -1145,39 +1145,49 @@ python package_do_filedeps() {
 	r = re.compile(r'[<>=]+ +[^ ]*')
 
 	# Quick routine to process the results of the rpmdeps call...
-	def process_deps(pipe, pkg, f, provides_files, requires_files):
-		provides = []
-		requires = []
-		file = f.replace(pkgdest + "/" + pkg, "")
-		file = file.replace("@", "@at@")
-		file = file.replace(" ", "@space@")
-		file = file.replace("\t", "@tab@")
-		file = file.replace("[", "@openbrace@")
-		file = file.replace("]", "@closebrace@")
-		file = file.replace("_", "@underscore@")
+	def process_deps(pipe, pkg, provides_files, requires_files):
+		provides = {}
+		requires = {}
 
 		for line in pipe:
+			f = line.split(" ", 1)[0].strip()
+			line = line.split(" ", 1)[1].strip()
+
 			if line.startswith("Requires:"):
 				i = requires
 			elif line.startswith("Provides:"):
 				i = provides
 			else:
 				continue
+
+			file = f.replace(pkgdest + "/" + pkg, "")
+			file = file.replace("@", "@at@")
+			file = file.replace(" ", "@space@")
+			file = file.replace("\t", "@tab@")
+			file = file.replace("[", "@openbrace@")
+			file = file.replace("]", "@closebrace@")
+			file = file.replace("_", "@underscore@")
 			value = line.split(":", 1)[1].strip()
 			value = r.sub(r'(\g<0>)', value)
+
 			if value.startswith("rpmlib("):
 				continue
-			i.append(value)
+			if file not in i:
+				i[file] = []
+			i[file].append(value)
 
-		if len(provides) > 0:
+		for file in provides:
 			provides_files.append(file)
 			key = "FILERPROVIDES_" + file + "_" + pkg
-			d.setVar(key, " ".join(provides))
+			d.setVar(key, " ".join(provides[file]))
 
-		if len(requires) > 0:
+		for file in requires:
 			requires_files.append(file)
 			key = "FILERDEPENDS_" + file + "_" + pkg
-			d.setVar(key, " ".join(requires))
+			d.setVar(key, " ".join(requires[file]))
+
+	def chunks(files, n):
+		return [files[i:i+n] for i in range(0, len(files), n)]
 
 	# Determine dependencies
 	for pkg in packages.split():
@@ -1186,13 +1196,15 @@ python package_do_filedeps() {
 
 		provides_files = []
 		requires_files = []
+		rpfiles = []
 		for root, dirs, files in os.walk(pkgdest + "/" + pkg):
 			for file in files:
-				f = os.path.join(root, file)
+				rpfiles.append(os.path.join(root, file))
 
-				dep_pipe = os.popen(rpmdeps + " --provides --requires -v " + f)
+		for files in chunks(rpfiles, 100):
+			dep_pipe = os.popen(rpmdeps + " " + " ".join(files))
 
-				process_deps(dep_pipe, pkg, f, provides_files, requires_files)
+			process_deps(dep_pipe, pkg, provides_files, requires_files)
 
 		d.setVar("FILERDEPENDSFLIST_" + pkg, " ".join(requires_files))
 		d.setVar("FILERPROVIDESFLIST_" + pkg, " ".join(provides_files))
diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f35779d..5fb436e 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -216,9 +216,9 @@ python package_do_filedeps_append () {
 	# Load/backup original set
 	filerprovides = d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
 
-	dep_pipe = os.popen('sed -e "s,^,Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox_links))
+	dep_pipe = os.popen('sed -e "s,^,%s/%s%s Provides: ," %s/%s%s' % (pkgdest, pkg, f_busybox, pkgdest, pkg, f_busybox_links))
 
-	process_deps(dep_pipe, pkg, "%s/%s%s" % (pkgdest, pkg, f_busybox), provides_files, requires_files)
+	process_deps(dep_pipe, pkg, provides_files, requires_files)
 
 	# Add the new set
 	filerprovides += d.getVar('FILERPROVIDES_%s_%s' % (f_busybox, pkg), True) or ""
-- 
1.7.6.5



