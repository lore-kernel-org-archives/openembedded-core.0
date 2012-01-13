Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RllGw-0007aS-R8
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 18:50:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jan 2012 09:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95565815"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.110])
	by azsmga001.ch.intel.com with ESMTP; 13 Jan 2012 09:43:05 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 17:42:59 +0000
Message-Id: <516d3fd23d27e9d71b2a4d112b9a260136503834.1326476501.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326476501.git.paul.eggleton@linux.intel.com>
References: <cover.1326476501.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/packagehistory: remove now obsolete class
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
X-List-Received-Date: Fri, 13 Jan 2012 17:50:39 -0000

packagehistory.bbclass has been superseded by buildhistory.bbclass,
which gives more detailed output (including information on produced
images) as well as other enhanced functionality.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/packagehistory.bbclass |  249 -----------------------------------
 1 files changed, 0 insertions(+), 249 deletions(-)
 delete mode 100644 meta/classes/packagehistory.bbclass

diff --git a/meta/classes/packagehistory.bbclass b/meta/classes/packagehistory.bbclass
deleted file mode 100644
index 5a1c846..0000000
--- a/meta/classes/packagehistory.bbclass
+++ /dev/null
@@ -1,249 +0,0 @@
-# Must inherit package first before changing PACKAGEFUNCS
-inherit package
-PACKAGEFUNCS += "emit_pkghistory"
-
-PKGHIST_DIR = "${TMPDIR}/pkghistory/${MULTIMACH_TARGET_SYS}/"
-
-#
-# Called during do_package to write out metadata about this package
-# for comparision when writing future packages
-#
-python emit_pkghistory() {
-	import re
-
-	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
-
-	class RecipeInfo:
-		def __init__(self, name):
-			self.name = name
-			self.pe = "0"
-			self.pv = "0"
-			self.pr = "r0"
-			self.depends = ""
-			self.packages = ""
-
-	class PackageInfo:
-		def __init__(self, name):
-			self.name = name
-			self.pe = "0"
-			self.pv = "0"
-			self.pr = "r0"
-			self.size = 0
-			self.depends = ""
-			self.rdepends = ""
-			self.rrecommends = ""
-			self.files = ""
-			self.filelist = ""
-
-	# Should check PACKAGES here to see if anything removed
-
-	def getpkgvar(pkg, var):
-		val = d.getVar('%s_%s' % (var, pkg), True)
-		if val:
-			return val
-		val = d.getVar(var, True)
-
-		return val
-
-	def readRecipeInfo(pn, histfile):
-		rcpinfo = RecipeInfo(pn)
-		f = open(histfile, "r")
-		try:
-			for line in f:
-				lns = line.split('=')
-				name = lns[0].strip()
-				value = lns[1].strip(" \t\r\n").strip('"')
-				if name == "PE":
-					rcpinfo.pe = value
-				elif name == "PV":
-					rcpinfo.pv = value
-				elif name == "PR":
-					rcpinfo.pr = value
-				elif name == "DEPENDS":
-					rcpinfo.depends = value
-				elif name == "PACKAGES":
-					rcpinfo.packages = value
-		finally:
-			f.close()
-		return rcpinfo
-
-	def readPackageInfo(pkg, histfile):
-		pkginfo = PackageInfo(pkg)
-		f = open(histfile, "r")
-		try:
-			for line in f:
-				lns = line.split('=')
-				name = lns[0].strip()
-				value = lns[1].strip(" \t\r\n").strip('"')
-				if name == "PE":
-					pkginfo.pe = value
-				elif name == "PV":
-					pkginfo.pv = value
-				elif name == "PR":
-					pkginfo.pr = value
-				elif name == "RDEPENDS":
-					pkginfo.rdepends = value
-				elif name == "RRECOMMENDS":
-					pkginfo.rrecommends = value
-				elif name == "PKGSIZE":
-					pkginfo.size = long(value)
-				elif name == "FILES":
-					pkginfo.files = value
-				elif name == "FILELIST":
-					pkginfo.filelist = value
-		finally:
-			f.close()
-		return pkginfo
-
-	def getlastrecipeversion(pn):
-		try:
-			histfile = os.path.join(pkghistdir, "latest")
-			return readRecipeInfo(pn, histfile)
-		except EnvironmentError:
-			return None
-
-	def getlastpkgversion(pkg):
-		try:
-			histfile = os.path.join(pkghistdir, pkg, "latest")
-			return readPackageInfo(pkg, histfile)
-		except EnvironmentError:
-			return None
-
-	def squashspaces(string):
-		return re.sub("\s+", " ", string)
-
-	pn = d.getVar('PN', True)
-	pe = d.getVar('PE', True) or "0"
-	pv = d.getVar('PV', True)
-	pr = d.getVar('PR', True)
-	packages = squashspaces(d.getVar('PACKAGES', True))
-
-	rcpinfo = RecipeInfo(pn)
-	rcpinfo.pe = pe
-	rcpinfo.pv = pv
-	rcpinfo.pr = pr
-	rcpinfo.depends = squashspaces(d.getVar('DEPENDS', True) or "")
-	rcpinfo.packages = packages
-	write_recipehistory(rcpinfo, d)
-	write_latestlink(None, pe, pv, pr, d)
-
-	# Apparently the version can be different on a per-package basis (see Python)
-	pkgdest = d.getVar('PKGDEST', True)
-	for pkg in packages.split():
-		pe = getpkgvar(pkg, 'PE') or "0"
-		pv = getpkgvar(pkg, 'PV')
-		pr = getpkgvar(pkg, 'PR')
-		#
-		# Find out what the last version was
-		# Make sure the version did not decrease
-		#
-		lastversion = getlastpkgversion(pkg)
-		if lastversion:
-			last_pe = lastversion.pe
-			last_pv = lastversion.pv
-			last_pr = lastversion.pr
-			r = bb.utils.vercmp((pe, pv, pr), (last_pe, last_pv, last_pr))
-			if r < 0:
-				bb.fatal("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
-
-		pkginfo = PackageInfo(pkg)
-		pkginfo.pe = pe
-		pkginfo.pv = pv
-		pkginfo.pr = pr
-		pkginfo.rdepends = squashspaces(getpkgvar(pkg, 'RDEPENDS') or "")
-		pkginfo.rrecommends = squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or "")
-		pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
-
-		# Gather information about packaged files
-		pkgdestpkg = os.path.join(pkgdest, pkg)
-		filelist = []
-		pkginfo.size = 0
-		for root, dirs, files in os.walk(pkgdestpkg):
-			relpth = os.path.relpath(root, pkgdestpkg)
-			for f in files:
-				fstat = os.lstat(os.path.join(root, f))
-				pkginfo.size += fstat.st_size
-				filelist.append(os.sep + os.path.join(relpth, f))
-		pkginfo.filelist = " ".join(filelist)
-
-		write_pkghistory(pkginfo, d)
-
-		if lastversion:
-			check_pkghistory(pkginfo, lastversion)
-
-		write_latestlink(pkg, pe, pv, pr, d)
-}
-
-
-def check_pkghistory(pkginfo, lastversion):
-
-	bb.debug(2, "Checking package history")
-	# RDEPENDS removed?
-	# PKG changed?
-	# Each file list of each package for file removals?
-
-
-def write_recipehistory(rcpinfo, d):
-	bb.debug(2, "Writing recipe history")
-
-	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
-
-	if not os.path.exists(pkghistdir):
-		os.makedirs(pkghistdir)
-
-	verfile = os.path.join(pkghistdir, "%s:%s-%s" % (rcpinfo.pe, rcpinfo.pv, rcpinfo.pr))
-	f = open(verfile, "w")
-	try:
-		if rcpinfo.pe != "0":
-			f.write("PE = %s\n" %  rcpinfo.pe)
-		f.write("PV = %s\n" %  rcpinfo.pv)
-		f.write("PR = %s\n" %  rcpinfo.pr)
-		f.write("DEPENDS = %s\n" %  rcpinfo.depends)
-		f.write("PACKAGES = %s\n" %  rcpinfo.packages)
-	finally:
-		f.close()
-
-
-def write_pkghistory(pkginfo, d):
-	bb.debug(2, "Writing package history")
-
-	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
-
-	verpath = os.path.join(pkghistdir, pkginfo.name)
-	if not os.path.exists(verpath):
-		os.makedirs(verpath)
-
-	verfile = os.path.join(verpath, "%s:%s-%s" % (pkginfo.pe, pkginfo.pv, pkginfo.pr))
-	f = open(verfile, "w")
-	try:
-		if pkginfo.pe != "0":
-			f.write("PE = %s\n" %  pkginfo.pe)
-		f.write("PV = %s\n" %  pkginfo.pv)
-		f.write("PR = %s\n" %  pkginfo.pr)
-		f.write("RDEPENDS = %s\n" %  pkginfo.rdepends)
-		f.write("RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-		f.write("PKGSIZE = %d\n" %  pkginfo.size)
-		f.write("FILES = %s\n" %  pkginfo.files)
-		f.write("FILELIST = %s\n" %  pkginfo.filelist)
-	finally:
-		f.close()
-
-
-def write_latestlink(pkg, pe, pv, pr, d):
-	import shutil
-
-	pkghistdir = os.path.join(d.getVar('PKGHIST_DIR', True), d.getVar('PN', True))
-
-	def rm_link(path):
-		try: 
-			os.unlink(path)
-		except OSError:
-			return
-
-	if pkg:
-		filedir = os.path.join(pkghistdir, pkg)
-	else:
-		filedir = pkghistdir
-	rm_link(os.path.join(filedir, "latest"))
-	shutil.copy(os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr)), os.path.join(filedir, "latest"))
-
-- 
1.7.5.4



