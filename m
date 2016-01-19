Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E8B3A731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 18:48:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jan 2016 10:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,318,1449561600"; d="scan'208";a="864043432"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 19 Jan 2016 10:48:51 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 230202C8001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:36:46 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 18:51:07 +0200
Message-Id: <d8552bc509c33f71af02009ec9c508d99bc2c2f2.1453222163.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453222163.git.ed.bartosh@linux.intel.com>
References: <cover.1453222163.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 5/9] wic: refactor get_boot_config
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
X-List-Received-Date: Tue, 19 Jan 2016 18:48:51 -0000

This function is going to be used by ks parser to find include .wks
files. get_boot_config name is a bit confusing as function is quite
generic. It looks if file is present in the canned wks directories.

Renamed get_boot_config -> get_canned.
Renamed parameter file_boot -> file_name.
Updated description.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/misc.py | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index d886d75..1415ae9 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -58,25 +58,23 @@ def build_name(kscfg, release=None, prefix=None, suffix=None):
 
     return ret
 
-def find_boot_config(scripts_path, boot_file):
+def find_canned(scripts_path, file_name):
     """
-    Find a config file with the given name in the canned files dir.
+    Find a file either by its path or by name in the canned files dir.
 
-    Return False if not found
+    Return None if not found
     """
-    if os.path.exists(boot_file):
-        return boot_file
+    if os.path.exists(file_name):
+        return file_name
 
     layers_canned_wks_dir = wic.engine.build_canned_image_list(scripts_path)
     for canned_wks_dir in layers_canned_wks_dir:
         for root, dirs, files in os.walk(canned_wks_dir):
             for fname in files:
-                if fname == boot_file:
+                if fname == file_name:
                     fullpath = os.path.join(canned_wks_dir, fname)
                     return fullpath
 
-    return None
-
 def get_custom_config(boot_file):
     """
     Get the custom configuration to be used for the bootloader.
@@ -88,7 +86,7 @@ def get_custom_config(boot_file):
     for x in range(0, 3):
         scripts_path = os.path.dirname(scripts_path)
 
-    cfg_file = find_boot_config(scripts_path, boot_file)
+    cfg_file = find_canned(scripts_path, boot_file)
     if cfg_file:
         with open(cfg_file, "r") as f:
             config = f.read()
-- 
2.1.4


