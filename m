Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECC36E91D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Feb 2014 17:12:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="449256267"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2014 17:17:04 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:55 -0600
Message-Id: <967948fec09ce9eaf92e5780b45b7feb788bb1cb.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/7] wic: Create and use new functions for getting bitbake variables
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:07 -0000

Add get_bitbake_var() and bitbake_env_lines() functions for use by
plugins, which will need access to them for customization.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/engine.py      | 20 +++++++++++++++-----
 scripts/lib/mic/utils/oe/misc.py | 16 ++++++++++++++++
 scripts/wic                      |  6 ++++++
 3 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
index 0e8b89e..2dd98b9 100644
--- a/scripts/lib/image/engine.py
+++ b/scripts/lib/image/engine.py
@@ -60,16 +60,26 @@ def verify_build_env():
     return True
 
 
-def find_artifacts(image_name):
+def find_bitbake_env_lines(image_name):
     """
-    Gather the build artifacts for the current image (the image_name
-    e.g. core-image-minimal) for the current MACHINE set in local.conf
+    If image_name is empty, plugins might still be able to use the
+    environment, so set it regardless.
     """
     bitbake_env_cmd = "bitbake -e %s" % image_name
     rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
     if rc != 0:
-        print "Couldn't get '%s' output, exiting." % bitbake_env_cmd
-        sys.exit(1)
+        print "Couldn't get '%s' output." % bitbake_env_cmd
+        return None
+
+    return bitbake_env_lines
+
+
+def find_artifacts(image_name):
+    """
+    Gather the build artifacts for the current image (the image_name
+    e.g. core-image-minimal) for the current MACHINE set in local.conf
+    """
+    bitbake_env_lines = get_bitbake_env_lines()
 
     rootfs_dir = kernel_dir = hdddir = staging_data_dir = native_sysroot = ""
 
diff --git a/scripts/lib/mic/utils/oe/misc.py b/scripts/lib/mic/utils/oe/misc.py
index 097d44c..77dfe03 100644
--- a/scripts/lib/mic/utils/oe/misc.py
+++ b/scripts/lib/mic/utils/oe/misc.py
@@ -109,6 +109,15 @@ def add_wks_var(key, val):
 
 BOOTDD_EXTRA_SPACE = 16384
 
+__bitbake_env_lines = ""
+
+def set_bitbake_env_lines(bitbake_env_lines):
+    global __bitbake_env_lines
+    __bitbake_env_lines = bitbake_env_lines
+
+def get_bitbake_env_lines():
+    return __bitbake_env_lines
+
 def get_line_val(line, key):
     """
     Extract the value from the VAR="val" string
@@ -118,3 +127,10 @@ def get_line_val(line, key):
         stripped_line = stripped_line.replace('\"', '')
         return stripped_line
     return None
+
+def get_bitbake_var(key):
+    for line in __bitbake_env_lines.split('\n'):
+        if (get_line_val(line, key)):
+            val = get_line_val(line, key)
+            return val
+    return None
diff --git a/scripts/wic b/scripts/wic
index b6fd16c..4ea5569 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -98,6 +98,12 @@ def wic_create_subcommand(args, usage_str):
 
     print "Creating image(s)...\n"
 
+    bitbake_env_lines = find_bitbake_env_lines(options.image_name)
+    if not bitbake_env_lines:
+        print "Couldn't get bitbake environment, exiting."
+        sys.exit(1)
+    set_bitbake_env_lines(bitbake_env_lines)
+
     bootimg_dir = staging_data_dir = hdddir = ""
 
     if options.image_name:
-- 
1.8.3.1


