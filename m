Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 54C666011F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 17:50:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 09:50:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,369,1444719600"; 
   d="scan'208";a="5628185"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2015 09:50:58 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Dec 2015 09:39:00 +0000
Message-Id: <ef744a3c8a6be05b02dd033463f2a57770280b93.1448961756.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1448961756.git.mariano.lopez@linux.intel.com>
References: <cover.1448961756.git.mariano.lopez@linux.intel.com>
Subject: [PATCHv2 2/6] wic/utils/misc.py: Added function to search for files in canned-wks
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
X-List-Received-Date: Tue, 01 Dec 2015 17:50:57 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This change add two new function to search for files in the
canned-wks folder for all the layers included in bblayers.conf.
This will be used to search for custom configuration files for
the bootloaders.

There are similar functions in the wic engine, but these are
focused in wks files only, so it was needed to create new ones.

[YOCTO #8728]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 9d75069..d886d75 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -17,6 +17,7 @@
 
 import os
 import time
+import wic.engine
 
 def build_name(kscfg, release=None, prefix=None, suffix=None):
     """Construct and return an image name string.
@@ -56,3 +57,41 @@ def build_name(kscfg, release=None, prefix=None, suffix=None):
     ret = prefix + name + suffix
 
     return ret
+
+def find_boot_config(scripts_path, boot_file):
+    """
+    Find a config file with the given name in the canned files dir.
+
+    Return False if not found
+    """
+    if os.path.exists(boot_file):
+        return boot_file
+
+    layers_canned_wks_dir = wic.engine.build_canned_image_list(scripts_path)
+    for canned_wks_dir in layers_canned_wks_dir:
+        for root, dirs, files in os.walk(canned_wks_dir):
+            for fname in files:
+                if fname == boot_file:
+                    fullpath = os.path.join(canned_wks_dir, fname)
+                    return fullpath
+
+    return None
+
+def get_custom_config(boot_file):
+    """
+    Get the custom configuration to be used for the bootloader.
+
+    Return None if the file can't be found.
+    """
+    scripts_path = os.path.abspath(os.path.dirname(__file__))
+    # Get the scripts path of poky
+    for x in range(0, 3):
+        scripts_path = os.path.dirname(scripts_path)
+
+    cfg_file = find_boot_config(scripts_path, boot_file)
+    if cfg_file:
+        with open(cfg_file, "r") as f:
+            config = f.read()
+        return config
+
+    return None
-- 
1.8.4.5


