Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1416D82F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 11:11:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2013 03:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,832,1378882800"; d="scan'208";a="447321981"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.121.191])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2013 03:11:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2013 11:11:47 +0000
Message-Id: <1386241907-16786-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] classes/buildhistory: fix reading of package-specific values from pkgdata
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
X-List-Received-Date: Thu, 05 Dec 2013 11:11:58 -0000

When writing out variable values to pkgdata, if the value has been set
in the datastore with an override for the package, we use the package
name override in the pkgdata key as well; however the recently added
code to read pkgdata in buildhistory.bbclass was just using the override
where we normally expect to have it. However, if a recipe overrides one
of the values that is normally set for the recipe on a per-package basis
(e.g. the external-sourcery-toolchain recipe sets PKGV this way) then
this led to KeyErrors. Re-write the pkgdata loading code to always strip
off the package name override if it is present.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index d25496d..1e6d968 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -187,7 +187,10 @@ python buildhistory_emit_pkghistory() {
         with open(os.path.join(pkgdata_dir, 'runtime', pkg)) as f:
             for line in f.readlines():
                 item = line.rstrip('\n').split(': ', 1)
-                pkgdata[item[0]] = item[1].decode('string_escape')
+                key = item[0]
+                if key.endswith('_' + pkg):
+                    key = key[:-len(pkg)-1]
+                pkgdata[key] = item[1].decode('string_escape')
 
         pkge = pkgdata.get('PKGE', '0')
         pkgv = pkgdata['PKGV']
@@ -211,19 +214,19 @@ python buildhistory_emit_pkghistory() {
         pkginfo.pe = pkgdata.get('PE', '0')
         pkginfo.pv = pkgdata['PV']
         pkginfo.pr = pkgdata['PR']
-        pkginfo.pkg = pkgdata['PKG_%s' % pkg]
+        pkginfo.pkg = pkgdata['PKG']
         pkginfo.pkge = pkge
         pkginfo.pkgv = pkgv
         pkginfo.pkgr = pkgr
-        pkginfo.rprovides = sortpkglist(squashspaces(pkgdata.get('RPROVIDES_%s' % pkg, "")))
-        pkginfo.rdepends = sortpkglist(squashspaces(pkgdata.get('RDEPENDS_%s' % pkg, "")))
-        pkginfo.rrecommends = sortpkglist(squashspaces(pkgdata.get('RRECOMMENDS_%s' % pkg, "")))
-        pkginfo.rsuggests = sortpkglist(squashspaces(pkgdata.get('RSUGGESTS_%s' % pkg, "")))
-        pkginfo.rreplaces = sortpkglist(squashspaces(pkgdata.get('RREPLACES_%s' % pkg, "")))
-        pkginfo.rconflicts = sortpkglist(squashspaces(pkgdata.get('RCONFLICTS_%s' % pkg, "")))
-        pkginfo.files = squashspaces(pkgdata.get('FILES_%s' % pkg, ""))
+        pkginfo.rprovides = sortpkglist(squashspaces(pkgdata.get('RPROVIDES', "")))
+        pkginfo.rdepends = sortpkglist(squashspaces(pkgdata.get('RDEPENDS', "")))
+        pkginfo.rrecommends = sortpkglist(squashspaces(pkgdata.get('RRECOMMENDS', "")))
+        pkginfo.rsuggests = sortpkglist(squashspaces(pkgdata.get('RSUGGESTS', "")))
+        pkginfo.rreplaces = sortpkglist(squashspaces(pkgdata.get('RREPLACES', "")))
+        pkginfo.rconflicts = sortpkglist(squashspaces(pkgdata.get('RCONFLICTS', "")))
+        pkginfo.files = squashspaces(pkgdata.get('FILES', ""))
         for filevar in pkginfo.filevars:
-            pkginfo.filevars[filevar] = pkgdata.get('%s_%s' % (filevar, pkg), "")
+            pkginfo.filevars[filevar] = pkgdata.get(filevar, "")
 
         # Gather information about packaged files
         val = pkgdata.get('FILES_INFO', '')
@@ -232,7 +235,7 @@ python buildhistory_emit_pkghistory() {
         filelist.sort()
         pkginfo.filelist = " ".join(filelist)
 
-        pkginfo.size = int(pkgdata['PKGSIZE_%s' % pkg])
+        pkginfo.size = int(pkgdata['PKGSIZE'])
 
         write_pkghistory(pkginfo, d)
 }
-- 
1.8.1.2


