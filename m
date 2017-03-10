Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 2415577846
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:26:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:26:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988269"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:26:08 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:17 +0200
Message-Id: <77fe606e011b51fe2551e2e4e5a2b25f682ebb2c.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 38/44] package_rpm.bbclass: do not strip multilib prefixes from package names, do not add multilib prefix to package arch
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
X-List-Received-Date: Fri, 10 Mar 2017 11:26:07 -0000

This is done for reasons I cannot establish, and greatly complicates the code
that installs packages into rootfs.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 55 ++++++++--------------------------------
 1 file changed, 11 insertions(+), 44 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4f4f8e4e11c..07ab5cdd9e0 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -101,27 +101,6 @@ python write_specfile () {
                 os.chown(f, 0, 0)
                 spec_preamble_top.append('Source%s: %s' % (source_number, source))
                 source_number += 1
-    # We need a simple way to remove the MLPREFIX from the package name,
-    # and dependency information...
-    def strip_multilib(name, d):
-        multilibs = d.getVar('MULTILIBS') or ""
-        for ext in multilibs.split():
-            eext = ext.split(':')
-            if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') >= 0:
-                name = "".join(name.split(eext[1] + '-'))
-        return name
-
-    def strip_multilib_deps(deps, d):
-        depends = bb.utils.explode_dep_versions2(deps or "")
-        newdeps = {}
-        for dep in depends:
-            newdeps[strip_multilib(dep, d)] = depends[dep]
-        return bb.utils.join_deps(newdeps)
-
-#        ml = d.getVar("MLPREFIX")
-#        if ml and name and len(ml) != 0 and name.find(ml) == 0:
-#            return ml.join(name.split(ml, 1)[1:])
-#        return name
 
     # In RPM, dependencies are of the format: pkg <>= Epoch:Version-Release
     # This format is similar to OE, however there are restrictions on the
@@ -283,7 +262,7 @@ python write_specfile () {
         bb.fatal("No OUTSPECFILE")
 
     # Construct the SPEC file...
-    srcname    = strip_multilib(d.getVar('PN'), d)
+    srcname    = d.getVar('PN')
     srcsummary = (d.getVar('SUMMARY') or d.getVar('DESCRIPTION') or ".")
     srcversion = d.getVar('PKGV').replace('-', '+')
     srcrelease = d.getVar('PKGR')
@@ -295,7 +274,7 @@ python write_specfile () {
     srcdescription = d.getVar('DESCRIPTION') or "."
     srccustomtagschunk = get_package_additional_metadata("rpm", d)
 
-    srcdepends     = strip_multilib_deps(d.getVar('DEPENDS'), d)
+    srcdepends     = d.getVar('DEPENDS')
     srcrdepends    = []
     srcrrecommends = []
     srcrsuggests   = []
@@ -340,7 +319,7 @@ python write_specfile () {
         if dirfiles is not None:
             dirfiles = dirfiles.split()
 
-        splitname    = strip_multilib(pkgname, d)
+        splitname    = pkgname
 
         splitsummary = (localdata.getVar('SUMMARY') or localdata.getVar('DESCRIPTION') or ".")
         splitversion = (localdata.getVar('PKGV') or "").replace('-', '+')
@@ -361,12 +340,12 @@ python write_specfile () {
         # Map the dependencies into their final form
         mapping_rename_hook(localdata)
 
-        splitrdepends    = strip_multilib_deps(localdata.getVar('RDEPENDS'), d)
-        splitrrecommends = strip_multilib_deps(localdata.getVar('RRECOMMENDS'), d)
-        splitrsuggests   = strip_multilib_deps(localdata.getVar('RSUGGESTS'), d)
-        splitrprovides   = strip_multilib_deps(localdata.getVar('RPROVIDES'), d)
-        splitrreplaces   = strip_multilib_deps(localdata.getVar('RREPLACES'), d)
-        splitrconflicts  = strip_multilib_deps(localdata.getVar('RCONFLICTS'), d)
+        splitrdepends    = localdata.getVar('RDEPENDS')
+        splitrrecommends = localdata.getVar('RRECOMMENDS')
+        splitrsuggests   = localdata.getVar('RSUGGESTS')
+        splitrprovides   = localdata.getVar('RPROVIDES')
+        splitrreplaces   = localdata.getVar('RREPLACES')
+        splitrconflicts  = localdata.getVar('RCONFLICTS')
         splitrobsoletes  = []
 
         splitrpreinst  = localdata.getVar('pkg_preinst')
@@ -640,14 +619,6 @@ python write_specfile () {
 write_specfile[vardepsexclude] = "OVERRIDES"
 
 python do_package_rpm () {
-    # We need a simple way to remove the MLPREFIX from the package name,
-    # and dependency information...
-    def strip_multilib(name, d):
-        ml = d.getVar("MLPREFIX")
-        if ml and name and len(ml) != 0 and name.find(ml) >= 0:
-            return "".join(name.split(ml))
-        return name
-
     workdir = d.getVar('WORKDIR')
     tmpdir = d.getVar('TMPDIR')
     pkgd = d.getVar('PKGD')
@@ -665,7 +636,7 @@ python do_package_rpm () {
     # If the spec file already exist, and has not been stored into 
     # pseudo's files.db, it maybe cause rpmbuild src.rpm fail,
     # so remove it before doing rpmbuild src.rpm.
-    srcname    = strip_multilib(d.getVar('PN'), d)
+    srcname    = d.getVar('PN')
     outspecfile = workdir + "/" + srcname + ".spec"
     if os.path.isfile(outspecfile):
         os.remove(outspecfile)
@@ -684,11 +655,7 @@ python do_package_rpm () {
     # Let's not fight against this.
     package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_").replace("all", "noarch")
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
-    if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
-        ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
-        d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
-    else:
-        d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
+    d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
     bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
-- 
2.11.0


