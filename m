Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2E89F60685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 20:31:06 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Dec 2016 12:31:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,359,1477983600"; d="scan'208";a="913036779"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 16 Dec 2016 12:31:07 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 611626A4080;
	Fri, 16 Dec 2016 12:30:19 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2016 22:30:45 +0200
Message-Id: <1481920245-21689-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: look for wks files in <layer>/recipes-images
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
X-List-Received-Date: Fri, 16 Dec 2016 20:31:07 -0000

Currently wic looks for wks files in
<layer dir>/scripts/lib/wic/canned-wks/ directories.
This path is too nested and doesn't look consistent with the
naming scheme of layer directories.

Added 'recipes-images' directory to the list of paths
to look for wks files.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 5b10463..8353edb 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -52,6 +52,7 @@ def verify_build_env():
 
 CANNED_IMAGE_DIR = "lib/wic/canned-wks" # relative to scripts
 SCRIPTS_CANNED_IMAGE_DIR = "scripts/" + CANNED_IMAGE_DIR
+RECIPES_IMAGES_DIR = "recipes-images"
 
 def build_canned_image_list(path):
     layers_path = misc.get_bitbake_var("BBLAYERS")
@@ -59,8 +60,10 @@ def build_canned_image_list(path):
 
     if layers_path is not None:
         for layer_path in layers_path.split():
-            cpath = os.path.join(layer_path, SCRIPTS_CANNED_IMAGE_DIR)
-            canned_wks_layer_dirs.append(cpath)
+            for wks_path in (RECIPES_IMAGES_DIR, SCRIPTS_CANNED_IMAGE_DIR):
+                cpath = os.path.join(layer_path, wks_path)
+                if os.path.isdir(cpath):
+                    canned_wks_layer_dirs.append(cpath)
 
     cpath = os.path.join(path, CANNED_IMAGE_DIR)
     canned_wks_layer_dirs.append(cpath)
-- 
2.1.4


