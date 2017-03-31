Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBE8577C73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 02:30:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2V2Uq38027370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Mar 2017 19:30:52 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 30 Mar 2017 19:30:52 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 21:30:29 -0500
Message-ID: <1490927429-48266-5-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
References: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/4] yocto-compat-layer.py: Fix the signature validation
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
X-List-Received-Date: Fri, 31 Mar 2017 02:30:52 -0000
Content-Type: text/plain

The initial signatures need to be collected -after- the dependency layers have
been added to the system.  Otherwise changes that happen due to dependencies,
outside of the layer being scanned, will show up as signature problems.

The add_layer function was split into two pieces so that we can process
the dependencies first, and then add the layer itself for the comparison.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 scripts/lib/compatlayer/__init__.py |  7 ++++---
 scripts/yocto-compat-layer.py       | 29 +++++++++++++++++++----------
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 24edc88..06c84f4 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -139,9 +139,7 @@ def _find_layer_depends(depend, layers):
                 return layer
     return None
 
-def add_layer(bblayersconf, layer, layers, logger):
-    logger.info('Adding layer %s' % layer['name'])
-
+def add_layer_dependencies(bblayersconf, layer, layers, logger):
     def recurse_dependencies(depends, layer, layers, logger, ret = []):
         logger.debug('Processing dependencies %s for layer %s.' % \
                     (depends, layer['name']))
@@ -191,7 +189,10 @@ def add_layer(bblayersconf, layer, layers, logger):
             logger.info('Adding layer dependency %s' % layer_depend['name'])
             with open(bblayersconf, 'a+') as f:
                 f.write("\nBBLAYERS += \"%s\"\n" % layer_depend['path'])
+    return True
 
+def add_layer(bblayersconf, layer, layers, logger):
+    logger.info('Adding layer %s' % layer['name'])
     with open(bblayersconf, 'a+') as f:
         f.write("\nBBLAYERS += \"%s\"\n" % layer['path'])
 
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index f8a1ac7..22c0c2d 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -22,7 +22,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from compatlayer import LayerType, detect_layers, add_layer, get_signatures
+from compatlayer import LayerType, detect_layers, add_layer, add_layer_dependencies, get_signatures
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-compat-layer'
@@ -116,29 +116,38 @@ def main():
     results = collections.OrderedDict()
     results_status = collections.OrderedDict()
 
-    logger.info('')
-    logger.info('Getting initial bitbake variables ...')
-    td['bbvars'] = get_bb_vars()
-    logger.info('Getting initial signatures ...')
-    td['builddir'] = builddir
-    td['sigs'] = get_signatures(td['builddir'])
-    logger.info('')
-
     layers_tested = 0
     for layer in layers:
         if layer['type'] == LayerType.ERROR_NO_LAYER_CONF or \
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
             continue
 
+        logger.info('')
+        logger.info("Setting up for %s(%s), %s" % (layer['name'], layer['type'],
+            layer['path']))
+
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        if not add_layer(bblayersconf, layer, dep_layers, logger):
+        if not add_layer_dependencies(bblayersconf, layer, dep_layers, logger):
             logger.info('Skipping %s due to missing dependencies.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Missing dependencies)'
             layers_tested = layers_tested + 1
             continue
 
+        logger.info('Getting initial bitbake variables ...')
+        td['bbvars'] = get_bb_vars()
+        logger.info('Getting initial signatures ...')
+        td['builddir'] = builddir
+        td['sigs'] = get_signatures(td['builddir'])
+
+        if not add_layer(bblayersconf, layer, dep_layers, logger):
+            logger.info('Skipping %s ???.' % layer['name'])
+            results[layer['name']] = None
+            results_status[layer['name']] = 'SKIPPED (Unknown)'
+            layers_tested = layers_tested + 1
+            continue
+
         result = test_layer_compatibility(td, layer)
         results[layer['name']] = result
         results_status[layer['name']] = 'PASS' if results[layer['name']].wasSuccessful() else 'FAIL'
-- 
1.8.3.1


