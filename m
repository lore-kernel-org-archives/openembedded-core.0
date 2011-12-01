Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RWGaq-00005F-1s
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 01:03:08 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Dec 2011 15:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="97666310"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.234])
	by fmsmga002.fm.intel.com with ESMTP; 01 Dec 2011 15:56:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 23:56:02 +0000
Message-Id: <8afb5fd67ea37c1ff2ff4513f797f409a0e8a556.1322782677.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1322782677.git.paul.eggleton@linux.intel.com>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1322782677.git.paul.eggleton@linux.intel.com>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 2/2] classes/buildhistory: merge in package history functionality
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
X-List-Received-Date: Fri, 02 Dec 2011 00:03:08 -0000

Include package history collection from packagehistory.bbclass (thus
superseding it), with the following changes:

* Store package history under BUILDHISTORY_DIR/packages
* Disable storing package history as version named files unless
  BUILDHISTORY_KEEP_VERSIONS is set to 1; otherwise the adds of these
  files that duplicate what is already in git anyway is just noise in
  the git log.
* Rename emit_pkghistory to buildhistory_emit_pkghistory

Implements [YOCTO #1565].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |  256 ++++++++++++++++++++++++++++++++++++-
 1 files changed, 255 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 79a074c..9303486 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -1,7 +1,7 @@
 #
 # Records history of build output in order to detect regressions
 #
-# Based in part on testlab.bbclass
+# Based in part on testlab.bbclass and packagehistory.bbclass
 #
 # Copyright (C) 2011 Intel Corporation
 # Copyright (C) 2007, 2008 Koen Kooi <koen@openembedded.org>
@@ -9,10 +9,264 @@
 
 BUILDHISTORY_DIR ?= "${TMPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
+BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
+# Must inherit package first before changing PACKAGEFUNCS
+inherit package
+PACKAGEFUNCS += "buildhistory_emit_pkghistory"
+
+#
+# Called during do_package to write out metadata about this package
+# for comparision when writing future packages
+#
+python buildhistory_emit_pkghistory() {
+	import re
+
+	pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
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
+
+	# Should check PACKAGES here to see if anything removed
+
+	def getpkgvar(pkg, var):
+		val = bb.data.getVar('%s_%s' % (var, pkg), d, 1)
+		if val:
+			return val
+		val = bb.data.getVar('%s' % (var), d, 1)
+
+		return val
+
+	def readRecipeInfo(pn, histfile):
+		rcpinfo = RecipeInfo(pn)
+		f = open(histfile, "r")
+		try:
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
+
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
+	packages = squashspaces(d.getVar('PACKAGES', True))
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
+	for pkg in packages.split():
+		pe = getpkgvar(pkg, 'PE') or "0"
+		pv = getpkgvar(pkg, 'PV')
+		pr = getpkgvar(pkg, 'PR')
+		#
+		# Find out what the last version was
+		# Make sure the version did not decrease
+		#
+		lastversion = getlastpkgversion(pkg)
+		if lastversion:
+			last_pe = lastversion.pe
+			last_pv = lastversion.pv
+			last_pr = lastversion.pr
+			r = bb.utils.vercmp((pe, pv, pr), (last_pe, last_pv, last_pr))
+			if r < 0:
+				bb.fatal("Package version for package %s went backwards which would break package feeds from (%s:%s-%s to %s:%s-%s)" % (pkg, last_pe, last_pv, last_pr, pe, pv, pr))
+
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
+}
+
+
+def check_pkghistory(pkginfo, lastversion):
+
+	bb.debug(2, "Checking package history")
+	# RDEPENDS removed?
+	# PKG changed?
+	# Each file list of each package for file removals?
+
+
+def write_recipehistory(rcpinfo, d):
+	bb.debug(2, "Writing recipe history")
+
+	pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
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
+	bb.debug(2, "Writing package history")
+
+	pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+
+	verpath = os.path.join(pkghistdir, pkginfo.name)
+	if not os.path.exists(verpath):
+		os.makedirs(verpath)
+
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
+def write_latestlink(pkg, pe, pv, pr, d):
+	import shutil
+
+	pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
+
+	def rm_link(path):
+		try:
+			os.unlink(path)
+		except OSError:
+			return
+
+	if pkg:
+		filedir = os.path.join(pkghistdir, pkg)
+	else:
+		filedir = pkghistdir
+	latest_file = os.path.join(filedir, "latest")
+	ver_file = os.path.join(filedir, "%s:%s-%s" % (pe, pv, pr))
+	rm_link(latest_file)
+	if d.getVar('BUILDHISTORY_KEEP_VERSIONS', True) == '1':
+		shutil.copy(ver_file, latest_file)
+	else:
+		shutil.move(ver_file, latest_file)
+
+
 buildhistory_get_image_installed() {
 	# Anything requiring the use of the packaging system should be done in here
 	# in case the packaging files are going to be removed for this image
-- 
1.7.5.4



