Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RSsPh-0004TN-GD
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 16:37:39 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2011 06:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,553,1315206000"; d="scan'208";a="94073409"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.177])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2011 06:52:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:52:36 +0000
Message-Id: <9009f3cfcd29fa38128b6c09a6312641822f25b8.1321972798.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1321972798.git.paul.eggleton@linux.intel.com>
References: <cover.1321972798.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1321972798.git.paul.eggleton@linux.intel.com>
References: <cover.1321972798.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/1] classes/packagehistory: fix and extend
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
X-List-Received-Date: Tue, 22 Nov 2011 15:37:39 -0000

* Replace use of BASEPKG_TARGET_SYS which is no longer available
* Change the file structure - use single files within PN/package subdirs
  rather than having a subdir level for each part of the version. There
  is a set of files for each recipe and for each package in directories
  underneath.
* Record more information - PACKAGES, DEPENDS, RDEPENDS, RRECOMMENDS,
  FILES, and the total size and a complete list of the packaged files.
* Record the values in simple text format. The "latest" file, rather
  than a symlink has been changed to a copy of the latest file so that
  if it is tracked in a VCS repository (e.g. git) you can compare it
  easily to the previous version.

Implements [YOCTO #1565].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packagehistory.bbclass |  226 +++++++++++++++++++++++++++++------
 1 files changed, 189 insertions(+), 37 deletions(-)

diff --git a/meta/classes/packagehistory.bbclass b/meta/classes/packagehistory.bbclass
index 2cdf9d8..9acb801 100644
--- a/meta/classes/packagehistory.bbclass
+++ b/meta/classes/packagehistory.bbclass
@@ -2,17 +2,39 @@
 inherit package
 PACKAGEFUNCS += "emit_pkghistory"
 
-PKGHIST_DIR = "${TMPDIR}/pkghistory/${BASEPKG_TARGET_SYS}/"
-
+PKGHIST_DIR = "${TMPDIR}/pkghistory/${MULTIMACH_TARGET_SYS}/"
 
 #
 # Called during do_package to write out metadata about this package
 # for comparision when writing future packages
 #
 python emit_pkghistory() {
-	packages = d.getVar('PACKAGES', True)
-	pkghistdir = d.getVar('PKGHIST_DIR', True)
+	import re
 
+	packages = d.getVar('PACKAGES', True)
+	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
+
+	class RecipeInfo:
+		def __init__(self, name):
+			self.name = name
+			self.pe = "0"
+			self.pv = "0"
+			self.pr = "r0"
+			self.depends = ""
+			self.packages = ""
+
+	class PackageInfo:
+		def __init__(self, name):
+			self.name = name
+			self.pe = "0"
+			self.pv = "0"
+			self.pr = "r0"
+			self.size = 0
+			self.depends = ""
+			self.rdepends = ""
+			self.rrecommends = ""
+			self.files = ""
+			self.filelist = ""
 
 	# Should check PACKAGES here to see if anything removed
 
@@ -24,44 +46,136 @@ python emit_pkghistory() {
 
 		return val
 
-	def getlastversion(pkg):
+	def readRecipeInfo(pn, histfile):
+		rcpinfo = RecipeInfo(pn)
+		f = open(histfile, "r")
 		try:
-			pe = os.path.basename(os.readlink(os.path.join(pkghistdir, pkg, "latest")))
-			pv = os.path.basename(os.readlink(os.path.join(pkghistdir, pkg, pe, "latest")))
-			pr = os.path.basename(os.readlink(os.path.join(pkghistdir, pkg, pe, pv, "latest")))
-			return (pe, pv, pr)
-		except OSError:
-			return (None, None, None)			
+			for line in f:
+				lns = line.split('=')
+				name = lns[0].strip()
+				value = lns[1].strip(" \t\r\n").strip('"')
+				if name == "PE":
+					rcpinfo.pe = value
+				elif name == "PV":
+					rcpinfo.pv = value
+				elif name == "PR":
+					rcpinfo.pr = value
+				elif name == "DEPENDS":
+					rcpinfo.depends = value
+				elif name == "PACKAGES":
+					rcpinfo.packages = value
+		finally:
+			f.close()
+		return rcpinfo
+
+	def readPackageInfo(pkg, histfile):
+		pkginfo = PackageInfo(pkg)
+		f = open(histfile, "r")
+		try:
+			for line in f:
+				lns = line.split('=')
+				name = lns[0].strip()
+				value = lns[1].strip(" \t\r\n").strip('"')
+				if name == "PE":
+					pkginfo.pe = value
+				elif name == "PV":
+					pkginfo.pv = value
+				elif name == "PR":
+					pkginfo.pr = value
+				elif name == "RDEPENDS":
+					pkginfo.rdepends = value
+				elif name == "RRECOMMENDS":
+					pkginfo.rrecommends = value
+				elif name == "PKGSIZE":
+					pkginfo.size = long(value)
+				elif name == "FILES":
+					pkginfo.files = value
+				elif name == "FILELIST":
+					pkginfo.filelist = value
+		finally:
+			f.close()
+		return pkginfo
+
+	def getlastrecipeversion(pn):
+		try:
+			histfile = os.path.join(pkghistdir, "latest")
+			return readRecipeInfo(pn, histfile)
+		except EnvironmentError:
+			return None
 
+	def getlastpkgversion(pkg):
+		try:
+			histfile = os.path.join(pkghistdir, pkg, "latest")
+			return readPackageInfo(pkg, histfile)
+		except EnvironmentError:
+			return None
+
+	def squashspaces(string):
+		return re.sub("\s+", " ", string)
+
+	pn = d.getVar('PN', True)
+	pe = d.getVar('PE', True) or "0"
+	pv = d.getVar('PV', True)
+	pr = d.getVar('PR', True)
+
+	rcpinfo = RecipeInfo(pn)
+	rcpinfo.pe = pe
+	rcpinfo.pv = pv
+	rcpinfo.pr = pr
+	rcpinfo.depends = squashspaces(d.getVar('DEPENDS', True) or "")
+	rcpinfo.packages = packages
+	write_recipehistory(rcpinfo, d)
+	write_latestlink(None, pe, pv, pr, d)
+
+	# Apparently the version can be different on a per-package basis (see Python)
+	pkgdest = d.getVar('PKGDEST', True)
 	for pkg in packages.split():
 		pe = getpkgvar(pkg, 'PE') or "0"
 		pv = getpkgvar(pkg, 'PV')
 		pr = getpkgvar(pkg, 'PR')
-		destdir = os.path.join(pkghistdir, pkg, pe, pv, pr)
-		
 		#
 		# Find out what the last version was
 		# Make sure the version did not decrease
 		#
-		lastversion = getlastversion(pkg)
-		(last_pe, last_pv, last_pr) = lastversion
-
-		if last_pe is not None:
-			r = bb.utils.vercmp((pe, pv, pr), lastversion)
+		lastversion = getlastpkgversion(pkg)
+		if lastversion:
+			last_pe = lastversion.pe
+			last_pv = lastversion.pv
+			last_pr = lastversion.pr
+			r = bb.utils.vercmp((pe, pv, pr), (last_pe, last_pv, last_pr))
 			if r < 0:
 				bb.fatal("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
 
-		write_pkghistory(pkg, pe, pv, pr, d)
-
-		if last_pe is not None:
-			check_pkghistory(pkg, pe, pv, pr, lastversion)
-
-		write_latestlink(pkg, pe, pv, pr, d)		
+		pkginfo = PackageInfo(pkg)
+		pkginfo.pe = pe
+		pkginfo.pv = pv
+		pkginfo.pr = pr
+		pkginfo.rdepends = squashspaces(getpkgvar(pkg, 'RDEPENDS') or "")
+		pkginfo.rrecommends = squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or "")
+		pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
+
+		# Gather information about packaged files
+		pkgdestpkg = os.path.join(pkgdest, pkg)
+		filelist = []
+		pkginfo.size = 0
+		for root, dirs, files in os.walk(pkgdestpkg):
+			relpth = os.path.relpath(root, pkgdestpkg)
+			for f in files:
+				fstat = os.lstat(os.path.join(root, f))
+				pkginfo.size += fstat.st_size
+				filelist.append(os.sep + os.path.join(relpth, f))
+		pkginfo.filelist = " ".join(filelist)
+
+		write_pkghistory(pkginfo, d)
+
+		if lastversion:
+			check_pkghistory(pkginfo, lastversion)
+
+		write_latestlink(pkg, pe, pv, pr, d)
 }
 
 
-def check_pkghistory(pkg, pe, pv, pr, lastversion):
-	(last_pe, last_pv, last_pr) = lastversion
+def check_pkghistory(pkginfo, lastversion):
 
 	bb.debug(2, "Checking package history")
 	# RDEPENDS removed?
@@ -69,17 +183,56 @@ def check_pkghistory(pkg, pe, pv, pr, lastversion):
 	# Each file list of each package for file removals?
 
 
-def write_pkghistory(pkg, pe, pv, pr, d):
+def write_recipehistory(rcpinfo, d):
+	bb.debug(2, "Writing recipe history")
+
+	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
+
+	if not os.path.exists(pkghistdir):
+		os.makedirs(pkghistdir)
+
+	verfile = os.path.join(pkghistdir, "%s:%s-%s" % (rcpinfo.pe, rcpinfo.pv, rcpinfo.pr))
+	f = open(verfile, "w")
+	try:
+		if rcpinfo.pe != "0":
+			f.write("PE = %s\n" %  rcpinfo.pe)
+		f.write("PV = %s\n" %  rcpinfo.pv)
+		f.write("PR = %s\n" %  rcpinfo.pr)
+		f.write("DEPENDS = %s\n" %  rcpinfo.depends)
+		f.write("PACKAGES = %s\n" %  rcpinfo.packages)
+	finally:
+		f.close()
+
+
+def write_pkghistory(pkginfo, d):
 	bb.debug(2, "Writing package history")
 
-	pkghistdir = d.getVar('PKGHIST_DIR', True)
+	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
 
-	verpath = os.path.join(pkghistdir, pkg, pe, pv, pr)
+	verpath = os.path.join(pkghistdir, pkginfo.name)
 	if not os.path.exists(verpath):
 		os.makedirs(verpath)
 
+	verfile = os.path.join(verpath, "%s:%s-%s" % (pkginfo.pe, pkginfo.pv, pkginfo.pr))
+	f = open(verfile, "w")
+	try:
+		if pkginfo.pe != "0":
+			f.write("PE = %s\n" %  pkginfo.pe)
+		f.write("PV = %s\n" %  pkginfo.pv)
+		f.write("PR = %s\n" %  pkginfo.pr)
+		f.write("RDEPENDS = %s\n" %  pkginfo.rdepends)
+		f.write("RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
+		f.write("PKGSIZE = %d\n" %  pkginfo.size)
+		f.write("FILES = %s\n" %  pkginfo.files)
+		f.write("FILELIST = %s\n" %  pkginfo.filelist)
+	finally:
+		f.close()
+
+
 def write_latestlink(pkg, pe, pv, pr, d):
-	pkghistdir = d.getVar('PKGHIST_DIR', True)
+	import shutil
+
+	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
 
 	def rm_link(path):
 		try: 
@@ -87,11 +240,10 @@ def write_latestlink(pkg, pe, pv, pr, d):
 		except OSError:
 			return
 
-	rm_link(os.path.join(pkghistdir, pkg, "latest"))
-	rm_link(os.path.join(pkghistdir, pkg, pe, "latest"))
-	rm_link(os.path.join(pkghistdir, pkg, pe, pv, "latest"))
-
-	os.symlink(os.path.join(pkghistdir, pkg, pe), os.path.join(pkghistdir, pkg, "latest"))
-	os.symlink(os.path.join(pkghistdir, pkg, pe, pv), os.path.join(pkghistdir, pkg, pe, "latest"))
-	os.symlink(os.path.join(pkghistdir, pkg, pe, pv, pr), os.path.join(pkghistdir, pkg, pe, pv, "latest"))
+	if pkg:
+		filedir = os.path.join(pkghistdir, pkg)
+	else:
+		filedir = pkghistdir
+	rm_link(os.path.join(filedir, "latest"))
+	shutil.copy(os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr)), os.path.join(filedir, "latest"))
 
-- 
1.7.5.4



