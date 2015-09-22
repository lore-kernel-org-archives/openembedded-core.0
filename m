Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2B40977030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520504"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:37 +0100
Message-Id: <377f20c2f00b506b4e65d678fa8322e1889a0c3b.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 23/27] devtool: build-image: improve image recipe handling
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:19 -0000

* Make image optional for the extensible SDK (auto-determine it based on
  the targets the SDK was built for)
* Check that specified recipe is in fact an image

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build-image.py | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 5759bec..a6c7d81 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -21,7 +21,7 @@ import os
 import logging
 
 from bb.process import ExecutionError
-from devtool import exec_build_env_command, setup_tinfoil, parse_recipe
+from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -40,7 +40,17 @@ def _get_packages(tinfoil, workspace, config):
 
 def build_image(args, config, basepath, workspace):
     """Entry point for the devtool 'build-image' subcommand."""
-    image = args.recipe
+
+    image = args.imagename
+    auto_image = False
+    if not image:
+        sdk_targets = config.get('SDK', 'sdk_targets', '').split()
+        if sdk_targets:
+            image = sdk_targets[0]
+            auto_image = True
+    if not image:
+        raise DevtoolError('Unable to determine image to build, please specify one')
+
     appendfile = os.path.join(config.workspace_path, 'appends',
                               '%s.bbappend' % image)
 
@@ -50,6 +60,16 @@ def build_image(args, config, basepath, workspace):
         os.unlink(appendfile)
 
     tinfoil = setup_tinfoil()
+    rd = parse_recipe(config, tinfoil, image, True)
+    if not rd:
+        # Error already shown
+        return 1
+    if not bb.data.inherits_class('image', rd):
+        if auto_image:
+            raise DevtoolError('Unable to determine image to build, please specify one')
+        else:
+            raise DevtoolError('Specified recipe %s is not an image recipe' % image)
+
     if workspace:
         packages = _get_packages(tinfoil, workspace, config)
         if packages:
@@ -94,5 +114,5 @@ def register_commands(subparsers, context):
                                    help='Build image including workspace recipe packages',
                                    description='Builds an image, extending it to include '
                                    'packages from recipes in the workspace')
-    parser.add_argument('recipe', help='Image recipe to build')
+    parser.add_argument('imagename', help='Image recipe to build', nargs='?')
     parser.set_defaults(func=build_image)
-- 
2.1.0


