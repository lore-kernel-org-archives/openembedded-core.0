Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 48CB677D76
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 02:30:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2V2UpjE005374
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Mar 2017 19:30:51 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 19:30:51 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 21:30:28 -0500
Message-ID: <1490927429-48266-4-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
References: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 3/4] compatlayer/__init__.py: Allow add_layer to process recursive deps
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
X-List-Received-Date: Fri, 31 Mar 2017 02:30:54 -0000
Content-Type: text/plain

When processing a layer for dependencies, you have to process the layer
itself, it's dependencies, the dependencies dependencies and so forth until
all items have been processed.

i.e.:  LayerA requires LayerB requires LayerC requires layerD

The end result should be LayerB, LayerC and LayerD are all dependencies of
LayerA.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/lib/compatlayer/__init__.py | 40 ++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 58f94b7..24edc88 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -142,10 +142,9 @@ def _find_layer_depends(depend, layers):
 def add_layer(bblayersconf, layer, layers, logger):
     logger.info('Adding layer %s' % layer['name'])
 
-    for collection in layer['collections']:
-        depends = layer['collections'][collection]['depends']
-        if not depends:
-            continue
+    def recurse_dependencies(depends, layer, layers, logger, ret = []):
+        logger.debug('Processing dependencies %s for layer %s.' % \
+                    (depends, layer['name']))
 
         for depend in depends.split():
             # core (oe-core) is suppose to be provided
@@ -156,8 +155,39 @@ def add_layer(bblayersconf, layer, layers, logger):
             if not layer_depend:
                 logger.error('Layer %s depends on %s and isn\'t found.' % \
                         (layer['name'], depend))
-                return False
+                ret = None
+                continue
+
+            # We keep processing, even if ret is None, this allows us to report
+            # multiple errors at once
+            if ret is not None and layer_depend not in ret:
+                ret.append(layer_depend)
+
+            # Recursively process...
+            if 'collections' not in layer_depend:
+                continue
+
+            for collection in layer_depend['collections']:
+                collect_deps = layer_depend['collections'][collection]['depends']
+                if not collect_deps:
+                    continue
+                ret = recurse_dependencies(collect_deps, layer_depend, layers, logger, ret)
+
+        return ret
 
+    layer_depends = []
+    for collection in layer['collections']:
+        depends = layer['collections'][collection]['depends']
+        if not depends:
+            continue
+
+        layer_depends = recurse_dependencies(depends, layer, layers, logger, layer_depends)
+
+    # Note: [] (empty) is allowed, None is not!
+    if layer_depends is None:
+        return False
+    else:
+        for layer_depend in layer_depends:
             logger.info('Adding layer dependency %s' % layer_depend['name'])
             with open(bblayersconf, 'a+') as f:
                 f.write("\nBBLAYERS += \"%s\"\n" % layer_depend['path'])
-- 
1.8.3.1


