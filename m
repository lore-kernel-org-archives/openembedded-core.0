Return-Path: <ddalex@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51DDD6CABA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:36:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Sep 2013 09:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="408434348"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2013 09:36:08 -0700
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id A54B1560FA1; Tue, 24 Sep 2013 17:36:11 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 17:36:07 +0100
Message-Id: <c16e34830916976a3344e7671647640fde275756.1380040307.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
	<c05def412d4cd60198d038ad9c20c90e94dcbca7.1380040307.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1380040307.git.alexandru.damian@intel.com>
References: <cover.1380040307.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 3/3] package: fire an event with file sizes
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
X-List-Received-Date: Tue, 24 Sep 2013 16:36:28 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Adding code to fire an event containing
file information for each of the build packages.

This event will be tracked in the UI clients.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/classes/package.bbclass | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 624a1ab..d35aa58 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1025,6 +1025,22 @@ python populate_packages () {
             if ret is False or ret == 0:
                 raise bb.build.FuncFailed("File population failed")
 
+
+
+    for pkg in package_list:
+        pkg_info_data = { 'PKG' : pkg }
+        root = os.path.join(pkgdest, pkg)
+
+        os.chdir(root)
+        pkg_info_data['FILES'] = []
+        import subprocess
+        for path in subprocess.Popen("find . -type f", shell=True, bufsize=16384, stdout=subprocess.PIPE).communicate()[0].rstrip().split("\n"):
+            if len(path) > 0:
+                size = os.stat(path).st_size
+                pkg_info_data['FILES'].append((path, size))
+
+        bb.event.fire(bb.event.MetadataEvent("PackageFileSize",pkg_info_data), d)
+
     os.chdir(workdir)
 
     unshipped = []
@@ -1188,7 +1204,9 @@ python emit_pkgdata() {
         for dfile in (d.getVar('FILERDEPENDSFLIST_' + pkg, True) or "").split():
             lpkgdata['FILERDEPENDS_'+dfile] = write_if_exists(sf, pkg, 'FILERDEPENDS_' + dfile)
 
-        sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
+        lsize = get_directory_size(pkgdest + "/%s" % pkg)
+        sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, lsize ))
+        lpkgdata['PKGSIZE'] = lsize
         sf.close()
 
         # Fire an event containing the pkg data
@@ -1857,7 +1875,7 @@ python do_package () {
     ###########################################################################
 
     # Contunually rexpanding complex expressions is inefficient, particularly when
-    # we write to the datastore and invalidate the expansion cache. This code 
+    # we write to the datastore and invalidate the expansion cache. This code
     # pre-expands some frequently used variables
 
     def expandVar(x, d):
-- 
1.8.1.2


