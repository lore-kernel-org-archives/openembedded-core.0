Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0D2107825A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 22:37:21 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2017 15:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,412,1496127600"; d="scan'208";a="882776162"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jul 2017 15:37:22 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 15:37:17 -0700
Message-Id: <20170725223717.7046-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH] action: new bitbake-layer plugin to create a simple layer
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
X-List-Received-Date: Tue, 25 Jul 2017 22:37:22 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Though the script bitbake-layers (from the bitbake project), this plugin
creates a simple layer with a example recipe, the latter with a single task
(do_build). Layer's license and priority is MIT and 6, respectively. Example
recipe and layer's priority can be specified through the command line.

[YOCTO #11567]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/bblayers/create.py            | 66 ++++++++++++++++++++++++++++++++++
 meta/lib/bblayers/templates/README     | 41 +++++++++++++++++++++
 meta/lib/bblayers/templates/example.bb | 11 ++++++
 meta/lib/bblayers/templates/layer.conf | 10 ++++++
 4 files changed, 128 insertions(+)
 create mode 100644 meta/lib/bblayers/create.py
 create mode 100644 meta/lib/bblayers/templates/README
 create mode 100644 meta/lib/bblayers/templates/example.bb
 create mode 100644 meta/lib/bblayers/templates/layer.conf

diff --git a/meta/lib/bblayers/create.py b/meta/lib/bblayers/create.py
new file mode 100644
index 0000000000..6a41fe0504
--- /dev/null
+++ b/meta/lib/bblayers/create.py
@@ -0,0 +1,66 @@
+import logging
+import os
+import sys
+import shutil
+
+import bb.utils
+
+from bblayers.common import LayerPlugin
+
+logger = logging.getLogger('bitbake-layers')
+
+def plugin_init(plugins):
+    return CreatePlugin()
+
+def read_template(template, template_dir='templates'):
+    lines = str()
+    with open(os.path.join(os.path.dirname(__file__), template_dir, template)) as fd:
+        lines = ''.join(fd.readlines())
+    return lines
+
+class CreatePlugin(LayerPlugin):
+    def do_create_layer(self, args):
+        """Create a basic layer"""
+        layerdir = os.path.abspath(args.layerdir)
+        if os.path.exists(layerdir):
+            sys.stderr.write("Specified layer directory exists\n")
+            return 1
+
+        # create dirs
+        conf = os.path.join(layerdir, 'conf')
+        bb.utils.mkdirhier(conf)
+
+        # Create the README from templates/README
+        readme_template =  read_template('README') % (args.layerdir, args.layerdir, args.layerdir, args.layerdir, args.layerdir, args.layerdir)
+        readme = os.path.join(layerdir, 'README')
+        with open(readme, 'w') as fd:
+            fd.write(readme_template)
+
+        # Copy the MIT license from meta
+        copying = 'COPYING.MIT'
+        dn = os.path.dirname
+        license_src = os.path.join(dn(dn(dn(__file__))), copying)
+        license_dst = os.path.join(layerdir, copying)
+        shutil.copy(license_src, license_dst)
+
+        # Create the layer.conf from templates/layer.conf
+        layerconf_template = read_template('layer.conf') % (args.layerdir, args.layerdir, args.layerdir, args.priority)
+        layerconf = os.path.join(conf, 'layer.conf')
+        with open(layerconf, 'w') as fd:
+            fd.write(layerconf_template)
+
+        # Create the example from templates/example.bb
+        example_template = read_template('example.bb')
+        example = os.path.join(layerdir, 'recipes-' + args.examplerecipe, args.examplerecipe)
+        bb.utils.mkdirhier(example)
+        with open(os.path.join(example, args.examplerecipe + '.bb'), 'w') as fd:
+            fd.write(example_template)
+
+        logger.plain('Add your new layer with \'bitbake-layers add-layer %s\'' % args.layerdir)
+
+    def register_commands(self, sp):
+        parser_create_layer = self.add_command(sp, 'create-layer', self.do_create_layer, parserecipes=False)
+        parser_create_layer.add_argument('layerdir', help='Layer directory to create')
+        parser_create_layer.add_argument('--priority', '-p', default=6, help='Layer directory to create')
+        parser_create_layer.add_argument('--example-recipe-name', '-e', dest='examplerecipe', default='example', help='Filename of the example recipe')
+
diff --git a/meta/lib/bblayers/templates/README b/meta/lib/bblayers/templates/README
new file mode 100644
index 0000000000..5a77f8d347
--- /dev/null
+++ b/meta/lib/bblayers/templates/README
@@ -0,0 +1,41 @@
+This README file contains information on the contents of the %s layer.
+
+Please see the corresponding sections below for details.
+
+Dependencies
+============
+
+  URI: <first dependency>
+  branch: <branch name>
+
+  URI: <second dependency>
+  branch: <branch name>
+
+  .
+  .
+  .
+
+Patches
+=======
+
+Please submit any patches against the %s layer to the xxxx mailing list (xxxx@zzzz.org)
+and cc: the maintainer:
+
+Maintainer: XXX YYYYYY <xxx.yyyyyy@zzzzz.com>
+
+Table of Contents
+=================
+
+  I. Adding the %s layer to your build
+ II. Misc
+
+
+I. Adding the %s layer to your build
+=================================================
+
+Run 'bitbake-layers add-layer %s'
+
+II. Misc
+========
+
+--- replace with specific information about the %s layer ---
diff --git a/meta/lib/bblayers/templates/example.bb b/meta/lib/bblayers/templates/example.bb
new file mode 100644
index 0000000000..c4b873d593
--- /dev/null
+++ b/meta/lib/bblayers/templates/example.bb
@@ -0,0 +1,11 @@
+SUMMARY = "bitbake-layers recipe"
+DESCRIPTION = "Recipe created by bitbake-layers"
+LICENSE = "MIT"
+
+python do_build() {
+    bb.plain("***********************************************");
+    bb.plain("*                                             *");
+    bb.plain("*  Example recipe created by bitbake-layers   *");
+    bb.plain("*                                             *");
+    bb.plain("***********************************************");
+}
diff --git a/meta/lib/bblayers/templates/layer.conf b/meta/lib/bblayers/templates/layer.conf
new file mode 100644
index 0000000000..e0d9ba2fde
--- /dev/null
+++ b/meta/lib/bblayers/templates/layer.conf
@@ -0,0 +1,10 @@
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have recipes-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \\
+            ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "%s"
+BBFILE_PATTERN_%s = "^${LAYERDIR}/"
+BBFILE_PRIORITY_%s = "%s"
-- 
2.12.3


