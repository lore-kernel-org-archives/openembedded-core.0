Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web10.26689.1598555231502204939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 12:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 07RJ77lB032508
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 14:07:08 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v6 1/3] buildhistory.bbclass: Rework to use read_subpackage_metadata
Date: Thu, 27 Aug 2020 14:07:04 -0500
Message-Id: <20200827190706.121027-2-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827190706.121027-1-mark.hatle@kernel.crashing.org>
References: <20200827190706.121027-1-mark.hatle@kernel.crashing.org>

Using this mechanism ensures that we have a single point to implement
the loading of the package and subpackage meta data.  This also then
allows the buildhistory class to use the regular datastore vs it's
own custom arrays for processing history items.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/buildhistory.bbclass | 49 ++++++++++++++-----------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 805e976ac5..fbdb1d3161 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -258,20 +258,15 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.config = sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
     write_recipehistory(rcpinfo, d)
 
-    pkgdest = d.getVar('PKGDEST')
+    bb.build.exec_func("read_subpackage_metadata", d)
+
     for pkg in packagelist:
-        pkgdata = {}
-        with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
-            for line in f.readlines():
-                item = line.rstrip('\n').split(': ', 1)
-                key = item[0]
-                if key.endswith('_' + pkg):
-                    key = key[:-len(pkg)-1]
-                pkgdata[key] = item[1].encode('latin-1').decode('unicode_escape')
-
-        pkge = pkgdata.get('PKGE', '0')
-        pkgv = pkgdata['PKGV']
-        pkgr = pkgdata['PKGR']
+        localdata = d.createCopy()
+        localdata.setVar('OVERRIDES', d.getVar("OVERRIDES", False) + ":" + pkg)
+
+        pkge = localdata.getVar("PKGE") or '0'
+        pkgv = localdata.getVar("PKGV")
+        pkgr = localdata.getVar("PKGR")
         #
         # Find out what the last version was
         # Make sure the version did not decrease
@@ -288,31 +283,31 @@ python buildhistory_emit_pkghistory() {
 
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
+        pkginfo.files = oe.utils.squashspaces(localdata.getVar("FILES") or "")
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
 
-- 
2.17.1

