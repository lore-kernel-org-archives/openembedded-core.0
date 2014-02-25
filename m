Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 092716F0E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 12:36:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Feb 2014 04:32:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,540,1389772800"; d="scan'208";a="461888410"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 25 Feb 2014 04:36:24 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2014 14:36:17 +0200
Message-Id: <ae8627a6eb1d76b1535a222d9011093bdee79cdb.1393331716.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1393331716.git.laurentiu.palcu@intel.com>
References: <cover.1393331716.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1393331716.git.laurentiu.palcu@intel.com>
References: <cover.1393331716.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] package_manager.py: create index files for all backends in PACKAGE_CLASSES
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
X-List-Received-Date: Tue, 25 Feb 2014 12:36:24 -0000

The previous implementation was checking IMAGE_PKGTYPE and created the
index files just for the backend used to create the image. Apparently,
'bitbake package-index' should attempt to create the index files for all
backends specified in PACKAGE_CLASSES.

[YOCTO #5827]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/lib/oe/package_manager.py |   24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index d29adac..ff4f1de 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1519,19 +1519,25 @@ class DpkgPM(PackageManager):
 
 
 def generate_index_files(d):
-    img_type = d.getVar('IMAGE_PKGTYPE', True)
+    classes = d.getVar('PACKAGE_CLASSES', True).replace("package_", "").split()
+
+    indexer_map = {
+        "rpm": (RpmIndexer, d.getVar('DEPLOY_DIR_RPM', True)),
+        "ipk": (OpkgIndexer, d.getVar('DEPLOY_DIR_IPK', True)),
+        "deb": (DpkgIndexer, d.getVar('DEPLOY_DIR_DEB', True))
+    }
 
     result = None
 
-    if img_type == "rpm":
-        result = RpmIndexer(d, d.getVar('DEPLOY_DIR_RPM', True)).write_index()
-    elif img_type == "ipk":
-        result = OpkgIndexer(d, d.getVar('DEPLOY_DIR_IPK', True)).write_index()
-    elif img_type == "deb":
-        result = DpkgIndexer(d, d.getVar('DEPLOY_DIR_DEB', True)).write_index()
+    for pkg_class in classes:
+        if not pkg_class in indexer_map:
+            continue
+
+        if os.path.exists(indexer_map[pkg_class][1]):
+            result = indexer_map[pkg_class][0](d, indexer_map[pkg_class][1]).write_index()
 
-    if result is not None:
-        bb.fatal(result)
+            if result is not None:
+                bb.fatal(result)
 
 if __name__ == "__main__":
     """
-- 
1.7.9.5


