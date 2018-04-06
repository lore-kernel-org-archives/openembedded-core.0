Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9A83275307
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 14:13:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 07:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,415,1517904000"; d="scan'208";a="30049835"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga007.fm.intel.com with ESMTP; 06 Apr 2018 07:13:46 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 17:07:22 +0300
Message-Id: <20180406140722.6493-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [PATCH] yocto-check-layer: add a test for correct setting of LAYERSERIES_COMPAT_collection
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
X-List-Received-Date: Fri, 06 Apr 2018 14:13:47 -0000

[YOCTO #12661]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/lib/checklayer/__init__.py     | 2 ++
 scripts/lib/checklayer/cases/common.py | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 288c457822d..2618416fab2 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -56,9 +56,11 @@ def _get_layer_collections(layer_path, lconf=None, data=None):
         priority = ldata.getVar('BBFILE_PRIORITY_%s' % name)
         pattern = ldata.getVar('BBFILE_PATTERN_%s' % name)
         depends = ldata.getVar('LAYERDEPENDS_%s' % name)
+        compat = ldata.getVar('LAYERSERIES_COMPAT_%s' % name)
         collections[name]['priority'] = priority
         collections[name]['pattern'] = pattern
         collections[name]['depends'] = depends
+        collections[name]['compat'] = compat
 
     return collections
 
diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index a13c1088f07..1bef61b0487 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -51,3 +51,8 @@ class CommonCheckLayer(OECheckLayerTestCase):
         msg = compare_signatures(self.td['sigs'], curr_sigs)
         if msg is not None:
             self.fail('Adding layer %s changed signatures.\n%s' % (self.tc.layer['name'], msg))
+
+    def test_layerseries_compat(self):
+        for collection_name, collection_data in self.tc.layer['collections'].items():
+            self.assertTrue(collection_data['compat'], "Collection %s from layer %s does not set compatible oe-core versions via LAYERSERIES_COMPAT_collection." \
+                 % (collection_name, self.tc.layer['name']))
-- 
2.16.1


