Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 59E376DF36
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 18:51:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2013 10:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,812,1378882800"; d="scan'208";a="445490221"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.184])
	by orsmga002.jf.intel.com with ESMTP; 02 Dec 2013 10:51:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2013 18:50:49 +0000
Message-Id: <b8742f3c9a437b3f91bc76a489e3767c6b17f6de.1386009885.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1386009885.git.paul.eggleton@linux.intel.com>
References: <cover.1386009885.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/8] classes/buildhistory: improve collection of package info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Dec 2013 18:51:02 -0000

Use a function added to SSTATEPOSTINSTFUNCS and read the necessary
information out of pkgdata, instead of using a function executed
during do_package that reads the data directly. This has two benefits:

* The package info collection will now work when the package content is
  restored from shared state

* Adding/removing the inherit of buildhistory will no longer change the
  do_package signatures and force re-execution of that function for
  every recipe.

Fixes [YOCTO #5358]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 91 +++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 43 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 68c81f6..b11e9ba 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -17,25 +17,22 @@ BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
 
-# Must inherit package first before changing PACKAGEFUNCS
-inherit package
-PACKAGEFUNCS += "buildhistory_emit_pkghistory"
-
-# We don't want to force a rerun of do_package for everything
-# if the buildhistory_emit_pkghistory function or any of the
-# variables it refers to changes
-do_package[vardepsexclude] += "buildhistory_emit_pkghistory"
+SSTATEPOSTINSTFUNCS += "buildhistory_emit_pkghistory"
 
 #
-# Called during do_package to write out metadata about this package
-# for comparision when writing future packages
+# Write out metadata about this package for comparision when writing future packages
 #
 python buildhistory_emit_pkghistory() {
-    import re
+    if not d.getVar('BB_CURRENTTASK', True) in ['packagedata', 'packagedata_setscene']:
+        return 0
 
     if not "package" in (d.getVar('BUILDHISTORY_FEATURES', True) or "").split():
         return 0
 
+    import re
+    import json
+    import errno
+
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE', True)
 
     class RecipeInfo:
@@ -75,14 +72,6 @@ python buildhistory_emit_pkghistory() {
 
     # Should check PACKAGES here to see if anything removed
 
-    def getpkgvar(pkg, var):
-        val = bb.data.getVar('%s_%s' % (var, pkg), d, 1)
-        if val:
-            return val
-        val = bb.data.getVar('%s' % (var), d, 1)
-
-        return val
-
     def readPackageInfo(pkg, histfile):
         pkginfo = PackageInfo(pkg)
         with open(histfile, "r") as f:
@@ -156,7 +145,20 @@ python buildhistory_emit_pkghistory() {
     pv = d.getVar('PV', True)
     pr = d.getVar('PR', True)
 
-    packages = squashspaces(d.getVar('PACKAGES', True))
+    pkgdata_dir = d.getVar('PKGDATA_DIR', True)
+    packages = ""
+    try:
+        with open(os.path.join(pkgdata_dir, pn)) as f:
+            for line in f.readlines():
+                if line.startswith('PACKAGES: '):
+                    packages = squashspaces(line.split(': ', 1)[1])
+                    break
+    except IOError as e:
+        if e.errno == errno.ENOENT:
+            # Probably a -cross recipe, just ignore
+            return 0
+        else:
+            raise
 
     packagelist = packages.split()
     if not os.path.exists(pkghistdir):
@@ -181,9 +183,15 @@ python buildhistory_emit_pkghistory() {
 
     pkgdest = d.getVar('PKGDEST', True)
     for pkg in packagelist:
-        pkge = getpkgvar(pkg, 'PKGE') or "0"
-        pkgv = getpkgvar(pkg, 'PKGV')
-        pkgr = getpkgvar(pkg, 'PKGR')
+        pkgdata = {}
+        with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
+            for line in f.readlines():
+                item = line.rstrip('\n').split(': ', 1)
+                pkgdata[item[0]] = item[1].decode('string_escape')
+
+        pkge = pkgdata.get('PKGE', '0')
+        pkgv = pkgdata['PKGV']
+        pkgr = pkgdata['PKGR']
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -200,35 +208,32 @@ python buildhistory_emit_pkghistory() {
 
         pkginfo = PackageInfo(pkg)
         # Apparently the version can be different on a per-package basis (see Python)
-        pkginfo.pe = getpkgvar(pkg, 'PE') or "0"
-        pkginfo.pv = getpkgvar(pkg, 'PV')
-        pkginfo.pr = getpkgvar(pkg, 'PR')
-        pkginfo.pkg = getpkgvar(pkg, 'PKG') or pkg
+        pkginfo.pe = pkgdata.get('PE', '0')
+        pkginfo.pv = pkgdata['PV']
+        pkginfo.pr = pkgdata['PR']
+        pkginfo.pkg = pkgdata['PKG_%s' % pkg]
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
-        pkginfo.rprovides = sortpkglist(squashspaces(getpkgvar(pkg, 'RPROVIDES') or ""))
-        pkginfo.rdepends = sortpkglist(squashspaces(getpkgvar(pkg, 'RDEPENDS') or ""))
-        pkginfo.rrecommends = sortpkglist(squashspaces(getpkgvar(pkg, 'RRECOMMENDS') or ""))
-        pkginfo.rsuggests = sortpkglist(squashspaces(getpkgvar(pkg, 'RSUGGESTS') or ""))
-        pkginfo.rreplaces = sortpkglist(squashspaces(getpkgvar(pkg, 'RREPLACES') or ""))
-        pkginfo.rconflicts = sortpkglist(squashspaces(getpkgvar(pkg, 'RCONFLICTS') or ""))
-        pkginfo.files = squashspaces(getpkgvar(pkg, 'FILES') or "")
+        pkginfo.rprovides = sortpkglist(squashspaces(pkgdata.get('RPROVIDES_%s' % pkg, "")))
+        pkginfo.rdepends = sortpkglist(squashspaces(pkgdata.get('RDEPENDS_%s' % pkg, "")))
+        pkginfo.rrecommends = sortpkglist(squashspaces(pkgdata.get('RRECOMMENDS_%s' % pkg, "")))
+        pkginfo.rsuggests = sortpkglist(squashspaces(pkgdata.get('RSUGGESTS_%s' % pkg, "")))
+        pkginfo.rreplaces = sortpkglist(squashspaces(pkgdata.get('RREPLACES_%s' % pkg, "")))
+        pkginfo.rconflicts = sortpkglist(squashspaces(pkgdata.get('RCONFLICTS_%s' % pkg, "")))
+        pkginfo.files = squashspaces(pkgdata.get('FILES_%s' % pkg, ""))
         for filevar in pkginfo.filevars:
-            pkginfo.filevars[filevar] = getpkgvar(pkg, filevar)
+            pkginfo.filevars[filevar] = pkgdata.get('%s_%s' % (filevar, pkg), "")
 
         # Gather information about packaged files
-        pkgdestpkg = os.path.join(pkgdest, pkg)
-        filelist = []
-        pkginfo.size = 0
-        for f in pkgfiles[pkg]:
-            relpth = os.path.relpath(f, pkgdestpkg)
-            fstat = os.lstat(f)
-            pkginfo.size += fstat.st_size
-            filelist.append(os.sep + relpth)
+        val = pkgdata.get('FILES_INFO', '')
+        dictval = json.loads(val)
+        filelist = dictval.keys()
         filelist.sort()
         pkginfo.filelist = " ".join(filelist)
 
+        pkginfo.size = int(pkgdata['PKGSIZE_%s' % pkg])
+
         write_pkghistory(pkginfo, d)
 }
 
-- 
1.8.1.2


