Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.2996.1598311774883984249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07ONTUA7010752
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 18:29:32 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH 5/5] buildhistory.bbclass: Rework to use read_subpackage_metadata
Date: Mon, 24 Aug 2020 18:29:30 -0500
Message-Id: <20200824232930.150388-6-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>
References: <20200824232930.150388-1-mark.hatle@kernel.crashing.org>

Using this mechanism ensures that we have a single point to implement
the loading of the package and subpackage meta data.  This also then
allows the buildhistory class to use the regular datastore vs it's
own custom arrays for processing history items.

Without this refactoring PRSERV_PV_AUTOINC and sometimes PRAUTO do not
get expanded properly within the buildhistory which can leave to
error messages about package versions/releases going backwards.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/buildhistory.bbclass | 60 +++++++++++--------------------
 1 file changed, 21 insertions(+), 39 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 2bccdfc953..5d478f38b5 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -99,7 +99,6 @@ python buildhistory_emit_pkghistory() {
     import json
     import shlex
     import errno
-    import oe.packagedata
 
     pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
     oldpkghistdir = d.getVar('BUILDHISTORY_OLD_DIR_PACKAGE')
@@ -128,7 +127,6 @@ python buildhistory_emit_pkghistory() {
             self.pkge = ""
             self.pkgv = ""
             self.pkgr = ""
-            self.extendprauto = ""
             self.size = 0
             self.depends = ""
             self.rprovides = ""
@@ -165,8 +163,6 @@ python buildhistory_emit_pkghistory() {
                     pkginfo.pkgv = value
                 elif name == "PKGR":
                     pkginfo.pkgr = value
-                elif name == "EXTENDPRAUTO":
-                    pkginfo.extendprauto = value
                 elif name == "RPROVIDES":
                     pkginfo.rprovides = value
                 elif name == "RDEPENDS":
@@ -262,26 +258,15 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
     write_recipehistory(rcpinfo, d)
 
-    pkgdest = d.getVar('PKGDEST')
-    for pkg in packagelist:
-        pkgdata = oe.packagedata.read_pkgdatafile(os.path.join(pkgdata_dir, 'runtime', pkg))
-
-        npkgdata = {}
-        for key in pkgdata.keys():
-            if key.endswith('_' + pkg):
-                nkey = key[:-len(pkg)-1]
-                npkgdata[nkey] = pkgdata[key]
+    bb.build.exec_func("read_subpackage_metadata", d)
 
-        for key in npkgdata.keys():
-          pkgdata[key] = npkgdata[key]
+    for pkg in packagelist:
+        localdata = d.createCopy()
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
 
-        pkge = pkgdata.get('PKGE', '0')
-        pkgv = pkgdata['PKGV']
-        pkgr = pkgdata['PKGR']
-        try:
-            extendprauto = pkgdata['EXTENDPRAUTO']
-        except IndexError:
-            extendprauto = d.getVar('EXTENDPRAUTO')
+        pkge = localdata.getVar("PKGE") or '0'
+        pkgv = localdata.getVar("PKGV")
+        pkgr = localdata.getVar("PKGR")
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -298,32 +283,31 @@ python buildhistory_emit_pkghistory() {
 
         pkginfo = PackageInfo(pkg)
         # Apparently the version can be different on a per-package basis (see Python)
-        pkginfo.pe = pkgdata.get('PE', '0')
-        pkginfo.pv = pkgdata['PV']
-        pkginfo.pr = pkgdata['PR']
-        pkginfo.pkg = pkgdata['PKG']
+        pkginfo.pe = localdata.getVar("PE") or '0'
+        pkginfo.pv = localdata.getVar("PV")
+        pkginfo.pr = localdata.getVar("PR")
+        pkginfo.pkg = localdata.getVar("PKG")
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
-        pkginfo.extendprauto = extendprauto
-        pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(pkgdata.get('RPROVIDES', "")))
-        pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RDEPENDS', "")))
-        pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(pkgdata.get('RRECOMMENDS', "")))
-        pkginfo.rsuggests = sortpkglist(oe.utils.squashspaces(pkgdata.get('RSUGGESTS', "")))
-        pkginfo.rreplaces = sortpkglist(oe.utils.squashspaces(pkgdata.get('RREPLACES', "")))
-        pkginfo.rconflicts = sortpkglist(oe.utils.squashspaces(pkgdata.get('RCONFLICTS', "")))
-        pkginfo.files = oe.utils.squashspaces(pkgdata.get('FILES', ""))
+        pkginfo.rprovides = sortpkglist(oe.utils.squashspaces(localdata.getVar("RPROVIDES") or ""))
+        pkginfo.rdepends = sortpkglist(oe.utils.squashspaces(localdata.getVar("RDEPENDS") or ""))
+        pkginfo.rrecommends = sortpkglist(oe.utils.squashspaces(localdata.getVar("RRECOMMENDS") or ""))
+        pkginfo.rsuggests = sortpkglist(oe.utils.squashspaces(localdata.getVar("RSUGGESTS") or ""))
+        pkginfo.replaces = sortpkglist(oe.utils.squashspaces(localdata.getVar("RREPLACES") or ""))
+        pkginfo.rconflicts = sortpkglist(oe.utils.squashspaces(localdata.getVar("RCONFLICTS") or ""))
+        pkginfo.files = sortpkglist(oe.utils.squashspaces(localdata.getVar("FILES") or ""))
         for filevar in pkginfo.filevars:
-            pkginfo.filevars[filevar] = pkgdata.get(filevar, "")
+            pkginfo.filevars[filevar] = localdata.getVar(filevar) or ""
 
         # Gather information about packaged files
-        val = pkgdata.get('FILES_INFO', '')
+        val = localdata.getVar('FILES_INFO') or ''
         dictval = json.loads(val)
         filelist = list(dictval.keys())
         filelist.sort()
         pkginfo.filelist = " ".join([shlex.quote(x) for x in filelist])
 
-        pkginfo.size = int(pkgdata['PKGSIZE'])
+        pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
 
         write_pkghistory(pkginfo, d)
 
@@ -409,8 +393,6 @@ def write_pkghistory(pkginfo, d):
             f.write(u"PKGV = %s\n" % pkginfo.pkgv)
         if pkginfo.pkgr != pkginfo.pr:
             f.write(u"PKGR = %s\n" % pkginfo.pkgr)
-        if pkginfo.extendprauto:
-            f.write(u"EXTENDPRAUTO = %s\n" % pkginfo.extendprauto)
         f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
         f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
         f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
-- 
2.17.1

