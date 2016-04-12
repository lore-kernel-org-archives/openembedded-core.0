Return-Path: <brendan.le.foll@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C98156AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 09:58:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 12 Apr 2016 02:58:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,473,1455004800"; d="scan'208";a="943366669"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2016 02:58:24 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 10:58:39 +0100
Message-Id: <1460455119-31363-1-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.8.0
Subject: [PATCH] npm.bbclass: Stop packagenames containing underscores from being generated
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
X-List-Received-Date: Tue, 12 Apr 2016 09:58:25 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

Package names cannot contain underscores yet some npm modules use them as part
of the name, replace them with hyphens in the package name.

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/classes/npm.bbclass | 6 ++++--
 meta/lib/oe/package.py   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 33ff5e3..9843e87 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -28,7 +28,9 @@ python populate_packages_prepend () {
     for pkgname in pkgnames:
         pkgrelpath, pdata = extrapackages[pkgname]
         pkgpath = '${libdir}/node_modules/${PN}/' + pkgrelpath
-        expanded_pkgname = d.expand(pkgname)
+        # package names can't have underscores but npm packages sometimes use them
+        oe_pkg_name = pkgname.replace('_', '-')
+        expanded_pkgname = d.expand(oe_pkg_name)
         d.setVar('FILES_%s' % expanded_pkgname, pkgpath)
         if pdata:
             version = pdata.get('version', None)
@@ -37,7 +39,7 @@ python populate_packages_prepend () {
             description = pdata.get('description', None)
             if description:
                 d.setVar('SUMMARY_%s' % expanded_pkgname, description.replace(u"\u2018", "'").replace(u"\u2019", "'").encode("utf8"))
-    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames))
+    d.appendVar('RDEPENDS_%s' % d.getVar('PN', True), ' %s' % ' '.join(pkgnames).replace('_', '-'))
 }
 
 FILES_${PN} += " \
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index dea443d..2887689 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -143,7 +143,7 @@ def npm_split_package_dirs(pkgdir):
                     if pathitem == 'node_modules':
                         continue
                     pkgitems.append(pathitem)
-                pkgname = '-'.join(pkgitems)
+                pkgname = '-'.join(pkgitems).replace('_', '-')
                 pkgfile = os.path.join(root, dn, 'package.json')
                 data = None
                 if os.path.exists(pkgfile):
-- 
2.8.0


