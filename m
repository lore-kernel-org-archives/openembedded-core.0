Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04B847C3DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 09:58:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1C9w7lD029533
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2019 01:58:17 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Tue, 12 Feb 2019 01:57:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2019 18:16:42 +0800
Message-ID: <a5abeb20791dade2fc900ce1940b13f584a8807e.1549966555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1549966555.git.liezhi.yang@windriver.com>
References: <cover.1549966555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] checklayer: Avoid adding the layer if it is already present
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
X-List-Received-Date: Tue, 12 Feb 2019 09:58:26 -0000
Content-Type: text/plain

* Rename add_layer() to add_layers() so that add_layer_dependencies() can
  re-use it.

* Avoid adding the layer if it is already present

[YOCTO #13148]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/lib/checklayer/__init__.py | 36 +++++++++++++++++-------------------
 scripts/yocto-check-layer          |  6 +++---
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index ca7863a..670f0ee 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -196,31 +196,29 @@ def add_layer_dependencies(bblayersconf, layer, layers, logger):
     if layer_depends is None:
         return False
     else:
-        # Don't add a layer that is already present.
-        added = set()
-        output = check_command('Getting existing layers failed.', 'bitbake-layers show-layers').decode('utf-8')
-        for layer, path, pri in re.findall(r'^(\S+) +([^\n]*?) +(\d+)$', output, re.MULTILINE):
-            added.add(path)
-
-        for layer_depend in layer_depends:
-            name = layer_depend['name']
-            path = layer_depend['path']
+        add_layers(bblayersconf, layer_depends, logger)
+
+    return True
+
+def add_layers(bblayersconf, layers, logger):
+    # Don't add a layer that is already present.
+    added = set()
+    output = check_command('Getting existing layers failed.', 'bitbake-layers show-layers').decode('utf-8')
+    for layer, path, pri in re.findall(r'^(\S+) +([^\n]*?) +(\d+)$', output, re.MULTILINE):
+        added.add(path)
+
+    with open(bblayersconf, 'a+') as f:
+        for layer in layers:
+            logger.info('Adding layer %s' % layer['name'])
+            name = layer['name']
+            path = layer['path']
             if path in added:
-                continue
+                logger.info('%s is already in %s' % (name, bblayersconf))
             else:
                 added.add(path)
-            logger.info('Adding layer dependency %s' % name)
-            with open(bblayersconf, 'a+') as f:
                 f.write("\nBBLAYERS += \"%s\"\n" % path)
     return True
 
-def add_layer(bblayersconf, layer, layers, logger):
-    logger.info('Adding layer %s' % layer['name'])
-    with open(bblayersconf, 'a+') as f:
-        f.write("\nBBLAYERS += \"%s\"\n" % layer['path'])
-
-    return True
-
 def check_command(error_msg, cmd, cwd=None):
     '''
     Run a command under a shell, capture stdout and stderr in a single stream,
diff --git a/scripts/yocto-check-layer b/scripts/yocto-check-layer
index 9b7e536..106c955 100755
--- a/scripts/yocto-check-layer
+++ b/scripts/yocto-check-layer
@@ -22,7 +22,7 @@ import scriptpath
 scriptpath.add_oe_lib_path()
 scriptpath.add_bitbake_lib_path()
 
-from checklayer import LayerType, detect_layers, add_layer, add_layer_dependencies, get_signatures
+from checklayer import LayerType, detect_layers, add_layers, add_layer_dependencies, get_signatures
 from oeqa.utils.commands import get_bb_vars
 
 PROGNAME = 'yocto-check-layer'
@@ -157,7 +157,7 @@ def main():
             layers_tested = layers_tested + 1
             continue
 
-        if any(map(lambda additional_layer: not add_layer(bblayersconf, additional_layer, dep_layers, logger),
+        if any(map(lambda additional_layer: not add_layers(bblayersconf, [additional_layer], logger),
                    additional_layers)):
             logger.info('Skipping %s due to missing additional layers.' % layer['name'])
             results[layer['name']] = None
@@ -179,7 +179,7 @@ def main():
             continue
         td['machines'] = args.machines
 
-        if not add_layer(bblayersconf, layer, dep_layers, logger):
+        if not add_layers(bblayersconf, [layer], logger):
             logger.info('Skipping %s ???.' % layer['name'])
             results[layer['name']] = None
             results_status[layer['name']] = 'SKIPPED (Unknown)'
-- 
2.7.4


