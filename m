Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3601F71975
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 22:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490049668; x=1521585668;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=vAE5Ezi0Pnm1pTxmlRjUK4voki47g5eFLRcGw+IlRkg=;
	b=dIjthqnIgGLxLY4DSUmV4lW1LJQnprKAbi1i+GOgIfZvhq2H/KH1TahY
	y+qhsZAW7F9JVRk+Su4rzdvS8QocxA==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 15:41:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="1110485030"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2017 15:41:07 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	patrick.ohly@intel.com
Date: Mon, 20 Mar 2017 16:44:47 -0600
Message-Id: <1490049887-10712-3-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490049887-10712-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490049887-10712-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] scripts/yocto-compat-layer.py: Handle layer dependencies when test
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
X-List-Received-Date: Mon, 20 Mar 2017 22:41:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If some layer depends on other tries to find layer dependency, if the
layer dependency isn't found avoid to test the layer and notice the
user.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 29 ++++++++++++++++++++++++++++-
 scripts/yocto-compat-layer.py       | 21 +++++++++++++--------
 2 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index b8ce771..435679e 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -132,10 +132,37 @@ def detect_layers(layer_directories, no_auto):
 
     return layers
 
-def add_layer(bblayersconf, layer):
+def _find_layer_depends(depend, layers):
+    for layer in layers:
+        for collection in layer['collections']:
+            if depend == collection:
+                return layer
+    return None
+
+def add_layer(bblayersconf, layer, layers, logger):
+    logger.info('Adding layer %s' % layer['name'])
+
+    for collection in layer['collections']:
+        for depend in layer['collections'][collection]['depends'].split():
+            # core (oe-core) is suppose to be provided
+            if depend == 'core':
+                continue
+
+            layer_depend = _find_layer_depends(depend, layers)
+            if not layer_depend:
+                logger.error('Layer %s depends on %s and isn\'t found.' % \
+                        (layer['name'], depend))
+                return False
+
+            logger.info('Adding layer dependency %s' % layer_depend['name'])
+            with open(bblayersconf, 'a+') as f:
+                f.write("\nBBLAYERS += \"%s\"\n" % layer_depend['path'])
+
     with open(bblayersconf, 'a+') as f:
         f.write("\nBBLAYERS += \"%s\"\n" % layer['path'])
 
+    return True
+
 def get_signatures(builddir, failsafe=False):
     import subprocess
     import re
diff --git a/scripts/yocto-compat-layer.py b/scripts/yocto-compat-layer.py
index b4de84a..9e74033 100755
--- a/scripts/yocto-compat-layer.py
+++ b/scripts/yocto-compat-layer.py
@@ -116,6 +116,7 @@ def main():
     td['sigs'] = get_signatures(td['builddir'])
     logger.info('')
 
+    layers_tested = 0
     for layer in layers:
         if layer['type'] == LayerType.ERROR_NO_LAYER_CONF or \
                 layer['type'] == LayerType.ERROR_BSP_DISTRO:
@@ -123,16 +124,20 @@ def main():
 
         shutil.copyfile(bblayersconf + '.backup', bblayersconf)
 
-        add_layer(bblayersconf, layer)
+        if not add_layer(bblayersconf, layer, layers, logger):
+            continue
+
         result = test_layer_compatibility(td, layer)
         results[layer['name']] = result
-
-    logger.info('')
-    logger.info('Summary of results:')
-    logger.info('')
-    for layer_name in results:
-        logger.info('%s ... %s' % (layer_name, 'PASS' if \
-                results[layer_name].wasSuccessful() else 'FAIL'))
+        layers_tested = layers_tested + 1
+
+    if layers_tested:
+        logger.info('')
+        logger.info('Summary of results:')
+        logger.info('')
+        for layer_name in results:
+            logger.info('%s ... %s' % (layer_name, 'PASS' if \
+                    results[layer_name].wasSuccessful() else 'FAIL'))
 
     cleanup_bblayers(None, None)
 
-- 
2.1.4


