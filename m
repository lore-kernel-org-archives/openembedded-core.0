Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A76EB65C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 01:34:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2016 18:34:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,564,1455004800"; d="scan'208";a="970490811"
Received: from nuruldix-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.171.74])
	by fmsmga002.fm.intel.com with ESMTP; 01 May 2016 18:34:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 13:34:00 +1200
Message-Id: <1462152840-20223-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <58ebd32dbca98fa81cadf2bf91649beb7bb51210.1462147930.git.randy.e.witt@linux.intel.com>
References: <58ebd32dbca98fa81cadf2bf91649beb7bb51210.1462147930.git.randy.e.witt@linux.intel.com>
Subject: [PATCH v2] devtool: Fix build-sdk when pn doesn't match filename
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
X-List-Received-Date: Mon, 02 May 2016 01:34:40 -0000

From: Randy Witt <randy.e.witt@linux.intel.com>

If an image with the filename foo.bb could be built using the name "bar"
instead, then build-sdk would fail to create the derivative sdk.

This was because the code assumed that the file name matched the target,
which is not necessarily the case.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---

Changes since v1:
 * Ignore bbappend not existing when attempting to delete it, since
   that will be the case if devtool build-sdk is run a second time
 * Call config.write() so setting gets written out at the right time
 * Use os.path.splitext() rather than rsplit() - no difference in
   operation but if there's a function to do this we should use it

 scripts/devtool                    |  3 +++
 scripts/lib/devtool/build_image.py | 24 +++++++++++++++++++-----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 4780390..f090427 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -86,6 +86,9 @@ class ConfigHandler(object):
         with open(self.config_file, 'w') as f:
             self.config_obj.write(f)
 
+    def set(self, section, option, value):
+        self.config_obj.set(section, option, value)
+
 class Context:
     def __init__(self, **kwargs):
         self.__dict__.update(kwargs)
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index e51d766..1e5d09b 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -18,6 +18,7 @@
 """Devtool plugin containing the build-image subcommand."""
 
 import os
+import errno
 import logging
 
 from bb.process import ExecutionError
@@ -72,13 +73,17 @@ def build_image(args, config, basepath, workspace):
     return result
 
 def build_image_task(config, basepath, workspace, image, add_packages=None, task=None, extra_append=None):
-    appendfile = os.path.join(config.workspace_path, 'appends',
-                              '%s.bbappend' % image)
-
     # remove <image>.bbappend to make sure setup_tinfoil doesn't
     # break because of it
-    if os.path.isfile(appendfile):
-        os.unlink(appendfile)
+    target_basename = config.get('SDK', 'target_basename', '')
+    if target_basename:
+        appendfile = os.path.join(config.workspace_path, 'appends',
+                                  '%s.bbappend' % target_basename)
+        try:
+            os.unlink(appendfile)
+        except OSError as exc:
+            if exc.errno != errno.ENOENT:
+                raise
 
     tinfoil = setup_tinfoil(basepath=basepath)
     rd = parse_recipe(config, tinfoil, image, True)
@@ -88,6 +93,15 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
     if not bb.data.inherits_class('image', rd):
         raise TargetNotImageError()
 
+    # Get the actual filename used and strip the .bb and full path
+    target_basename = rd.getVar('FILE', True)
+    target_basename = os.path.splitext(os.path.basename(target_basename))[0]
+    config.set('SDK', 'target_basename', target_basename)
+    config.write()
+
+    appendfile = os.path.join(config.workspace_path, 'appends',
+                              '%s.bbappend' % target_basename)
+
     outputdir = None
     try:
         if workspace or add_packages:
-- 
2.5.5


