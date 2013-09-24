Return-Path: <ddalex@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 541156C994
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:36:08 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2013 09:36:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="364940161"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by azsmga001.ch.intel.com with ESMTP; 24 Sep 2013 09:36:08 -0700
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 2C44F560FA0; Tue, 24 Sep 2013 17:36:11 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 17:36:06 +0100
Message-Id: <3145da4c2b158fd0e2684b66cd68dd769a1c94de.1380040307.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
	<c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/3] package.bbclass: trigger event when collecting package info
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
X-List-Received-Date: Tue, 24 Sep 2013 16:36:08 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Adding an event that contains the package details,
which is triggered when the emit_pkgdata runs.
This is used to collect package information in the UI clients.

Slight rewrite of the file-writing section as to make
the code easier to maintain.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/package.bbclass | 41 +++++++++++++----------------------------
 1 file changed, 13 insertions(+), 28 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fbb6839..624a1ab 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1106,10 +1106,11 @@ python emit_pkgdata() {
         val = d.getVar('%s_%s' % (var, pkg), True)
         if val:
             f.write('%s_%s: %s\n' % (var, pkg, encode(val)))
-            return
+            return encode(val)
         val = d.getVar('%s' % (var), True)
         if val:
             f.write('%s: %s\n' % (var, encode(val)))
+            return encode(val)
         return
 
     def get_directory_size(dir):
@@ -1175,41 +1176,25 @@ python emit_pkgdata() {
 
         d.setVar('FILES_INFO', str(items))
 
+        lpkgdata = {}
+
         sf = open(subdata_file, 'w')
-        write_if_exists(sf, pkg, 'PN')
-        write_if_exists(sf, pkg, 'PV')
-        write_if_exists(sf, pkg, 'PR')
-        write_if_exists(sf, pkg, 'PKGV')
-        write_if_exists(sf, pkg, 'PKGR')
-        write_if_exists(sf, pkg, 'LICENSE')
-        write_if_exists(sf, pkg, 'DESCRIPTION')
-        write_if_exists(sf, pkg, 'SUMMARY')
-        write_if_exists(sf, pkg, 'RDEPENDS')
-        write_if_exists(sf, pkg, 'RPROVIDES')
-        write_if_exists(sf, pkg, 'RRECOMMENDS')
-        write_if_exists(sf, pkg, 'RSUGGESTS')
-        write_if_exists(sf, pkg, 'RREPLACES')
-        write_if_exists(sf, pkg, 'RCONFLICTS')
-        write_if_exists(sf, pkg, 'SECTION')
-        write_if_exists(sf, pkg, 'PKG')
-        write_if_exists(sf, pkg, 'ALLOW_EMPTY')
-        write_if_exists(sf, pkg, 'FILES')
-        write_if_exists(sf, pkg, 'pkg_postinst')
-        write_if_exists(sf, pkg, 'pkg_postrm')
-        write_if_exists(sf, pkg, 'pkg_preinst')
-        write_if_exists(sf, pkg, 'pkg_prerm')
-        write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
-        write_if_exists(sf, pkg, 'FILES_INFO')
+        for vn in ('PN',  'PV',  'PR',  'PKGV',  'PKGR',  'LICENSE',  'DESCRIPTION',  'SUMMARY',  'RDEPENDS',  'RPROVIDES',  'RRECOMMENDS',  'RSUGGESTS',  'RREPLACES',  'RCONFLICTS',  'SECTION',  'PKG',  'ALLOW_EMPTY',  'FILES',  'pkg_postinst',  'pkg_postrm',  'pkg_preinst',  'pkg_prerm',  'FILERPROVIDESFLIST',  'FILES_INFO', 'FILERDEPENDSFLIST'):
+            lpkgdata[vn] = write_if_exists(sf, pkg, vn)
+
         for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or "").split():
-            write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+            lpkgdata['FILERDEPENDSFLIST_'+dfile] = write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
 
-        write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
         for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
-            write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+            lpkgdata['FILERDEPENDS_'+dfile] = write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
         sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
         sf.close()
 
+        # Fire an event containing the pkg data
+        bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
+
+
         # Symlinks needed for reverse lookups (from the final package name)
         subdata_sym = pkgdatadir + "/runtime-reverse/%s" % pkgval
         oe.path.symlink("../runtime/%s" % pkg, subdata_sym, True)
-- 
1.8.1.2


