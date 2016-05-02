Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D75E731E6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 00:13:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,564,1455004800"; d="scan'208";a="944102391"
Received: from bitbang.jf.intel.com ([10.7.199.65])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2016 17:13:06 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 May 2016 17:13:03 -0700
Message-Id: <58ebd32dbca98fa81cadf2bf91649beb7bb51210.1462147930.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462147930.git.randy.e.witt@linux.intel.com>
References: <cover.1462147930.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1462147930.git.randy.e.witt@linux.intel.com>
References: <cover.1462147930.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/2] devtool: Fix build-sdk when pn doesn't match filename
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
X-List-Received-Date: Mon, 02 May 2016 00:13:07 -0000

If an image with the filename foo.bb could be built using the name "bar"
instead, then build-sdk would fail to create the derivative sdk.

This was because the code assumed that the file name matched the target,
which is not necessarily the case.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 scripts/devtool                    |  3 +++
 scripts/lib/devtool/build_image.py | 16 ++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

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
index e51d766..0f8ca93 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -72,12 +72,12 @@ def build_image(args, config, basepath, workspace):
     return result
 
 def build_image_task(config, basepath, workspace, image, add_packages=None, task=None, extra_append=None):
-    appendfile = os.path.join(config.workspace_path, 'appends',
-                              '%s.bbappend' % image)
-
     # remove <image>.bbappend to make sure setup_tinfoil doesn't
     # break because of it
-    if os.path.isfile(appendfile):
+    target_basename = config.get('SDK', 'target_basename', '')
+    if target_basename:
+        appendfile = os.path.join(config.workspace_path, 'appends',
+                                  '%s.bbappend' % target_basename)
         os.unlink(appendfile)
 
     tinfoil = setup_tinfoil(basepath=basepath)
@@ -88,6 +88,14 @@ def build_image_task(config, basepath, workspace, image, add_packages=None, task
     if not bb.data.inherits_class('image', rd):
         raise TargetNotImageError()
 
+    # Get the actual filename used and strip the .bb and full path
+    target_basename = rd.getVar('FILE', True)
+    target_basename = os.path.basename(target_basename).rsplit('.', 1)[0]
+    config.set('SDK', 'target_basename', target_basename)
+
+    appendfile = os.path.join(config.workspace_path, 'appends',
+                              '%s.bbappend' % target_basename)
+
     outputdir = None
     try:
         if workspace or add_packages:
-- 
2.5.5


