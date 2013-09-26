Return-Path: <ddalex@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C8EE36CBB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 16:01:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2013 09:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,986,1371106800"; d="scan'208";a="383923743"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by orsmga001.jf.intel.com with ESMTP; 26 Sep 2013 09:01:43 -0700
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 0F2AA56064A; Thu, 26 Sep 2013 17:01:43 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 17:01:40 +0100
Message-Id: <1380211301-23898-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/2] package.bbclass: fire an event with package info
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
X-List-Received-Date: Thu, 26 Sep 2013 16:01:45 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

On emit_pkgdata, the code writes a file with all the
package details like PN, PV, PR, LICENSE, etc...

In order to record package information on a remote client,
we also build out a custom event with this information
and fire it.

This will not have any performance impact, and allow
us to retrieve data about built packages from a
remote build server.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/package.bbclass | 67 +++++++++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index fbb6839..67ee138 100644
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
@@ -1175,41 +1176,49 @@ python emit_pkgdata() {
 
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
+        lpkgdata['PN'] = write_if_exists(sf, pkg, 'PN')
+        lpkgdata['PV'] = write_if_exists(sf, pkg, 'PV')
+        lpkgdata['PR'] = write_if_exists(sf, pkg, 'PR')
+        lpkgdata['PKGV'] = write_if_exists(sf, pkg, 'PKGV')
+        lpkgdata['PKGR'] = write_if_exists(sf, pkg, 'PKGR')
+        lpkgdata['LICENSE'] = write_if_exists(sf, pkg, 'LICENSE')
+        lpkgdata['DESCRIPTION'] = write_if_exists(sf, pkg, 'DESCRIPTION')
+        lpkgdata['SUMMARY'] = write_if_exists(sf, pkg, 'SUMMARY')
+        lpkgdata['RDEPENDS'] = write_if_exists(sf, pkg, 'RDEPENDS')
+        lpkgdata['RPROVIDES'] = write_if_exists(sf, pkg, 'RPROVIDES')
+        lpkgdata['RRECOMMENDS'] = write_if_exists(sf, pkg, 'RRECOMMENDS')
+        lpkgdata['RSUGGESTS'] = write_if_exists(sf, pkg, 'RSUGGESTS')
+        lpkgdata['RREPLACES'] = write_if_exists(sf, pkg, 'RREPLACES')
+        lpkgdata['RCONFLICTS'] = write_if_exists(sf, pkg, 'RCONFLICTS')
+        lpkgdata['SECTION'] = write_if_exists(sf, pkg, 'SECTION')
+        lpkgdata['PKG'] = write_if_exists(sf, pkg, 'PKG')
+        lpkgdata['ALLOW_EMPTY'] = write_if_exists(sf, pkg, 'ALLOW_EMPTY')
+        lpkgdata['FILES'] = write_if_exists(sf, pkg, 'FILES')
+        lpkgdata['pkg_postinst'] = write_if_exists(sf, pkg, 'pkg_postinst')
+        lpkgdata['pkg_postrm'] = write_if_exists(sf, pkg, 'pkg_postrm')
+        lpkgdata['pkg_preinst'] = write_if_exists(sf, pkg, 'pkg_preinst')
+        lpkgdata['pkg_prerm'] = write_if_exists(sf, pkg, 'pkg_prerm')
+        lpkgdata['FILERPROVIDESFLIST'] = write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
+        lpkgdata['FILES_INFO'] = write_if_exists(sf, pkg, 'FILES_INFO')
         for dfile in (d.getVar('FILERPROVIDESFLIST_' + pkg, True) or "").split():
-            write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
+            lpkgdata['FILERDEPENDSFLIST_'+dfile] = write_if_exists(sf, pkg, 'FILERPROVIDES_' + dfile)
 
-        write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
+        lpkgdata['FILERDEPENDSFLIST'] = write_if_exists(sf, pkg, 'FILERDEPENDSFLIST')
         for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
-            write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
+            lpkgdata['FILERDEPENDS_'+dfile] = write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
-        sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
+        lsize = get_directory_size(pkgdest + "/%s" % pkg)
+        sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, lsize ))
+        lpkgdata['PKGSIZE'] = lsize
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


