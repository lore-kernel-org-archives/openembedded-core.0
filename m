Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1435576AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 25 Aug 2015 02:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="631743431"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 25 Aug 2015 02:04:42 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 0E8176A4083;
	Tue, 25 Aug 2015 02:03:48 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:15 +0300
Message-Id: <fa177df9c0503900f59f2438f1336359f9debc38.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/17] wic: add BitbakeVars class
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
X-List-Received-Date: Tue, 25 Aug 2015 09:04:53 -0000

Moved code of getting bitbake variables into separate class.

Created singleton object of this class in the module namespace.

Preserved existing API get_bitbake_var.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 91 +++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 38 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 9c8f52d..3537a2e 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -124,48 +124,63 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3):
 
 BOOTDD_EXTRA_SPACE = 16384
 
-_BITBAKE_VARS = defaultdict(dict)
+class BitbakeVars(defaultdict):
+    """
+    Container for Bitbake variables.
+    """
+    def __init__(self):
+        defaultdict.__init__(self, dict)
+
+    def get_var(self, var, image=None):
+        """
+        Get bitbake variable value lazy way, i.e. run
+        'bitbake -e' only when variable is requested.
+        """
+        if image not in self:
+            # Get bitbake -e output
+            cmd = "bitbake -e"
+            if image:
+                cmd += " %s" % image
+
+            log_level = msger.get_loglevel()
+            msger.set_loglevel('normal')
+            ret, lines = _exec_cmd(cmd)
+            msger.set_loglevel(log_level)
+
+            if ret:
+                print "Couldn't get '%s' output." % cmd
+                print "Bitbake failed with error:\n%s\n" % lines
+                return
+
+            # Parse bitbake -e output
+            for line in lines.split('\n'):
+                if "=" not in line:
+                    continue
+                try:
+                    key, val = line.split("=")
+                except ValueError:
+                    continue
+                key = key.strip()
+                val = val.strip()
+                if key.replace('_', '').isalnum():
+                    self[image][key] = val.strip('"')
+
+            # Make first image a default set of variables
+            images = [key for key in self if key]
+            if len(images) == 1:
+                self[None] = self[image]
+
+        return self[image].get(var)
+
+# Create BB_VARS singleton
+BB_VARS = BitbakeVars()
 
 def get_bitbake_var(var, image=None):
     """
-    Get bitbake variable value lazy way, i.e. run
-    'bitbake -e' only when variable is requested.
+    Provide old get_bitbake_var API by wrapping
+    get_var method of BB_VARS singleton.
     """
-    if image not in _BITBAKE_VARS:
-        # Get bitbake -e output
-        cmd = "bitbake -e"
-        if image:
-            cmd += " %s" % image
-
-        log_level = msger.get_loglevel()
-        msger.set_loglevel('normal')
-        ret, lines = _exec_cmd(cmd)
-        msger.set_loglevel(log_level)
-
-        if ret:
-            print "Couldn't get '%s' output." % cmd
-            print "Bitbake failed with error:\n%s\n" % lines
-            return
-
-        # Parse bitbake -e output
-        for line in lines.split('\n'):
-            if "=" not in line:
-                continue
-            try:
-                key, val = line.split("=")
-            except ValueError:
-                continue
-            key = key.strip()
-            val = val.strip()
-            if key.replace('_', '').isalnum():
-                _BITBAKE_VARS[image][key] = val.strip('"')
-
-        # Make first image a default set of variables
-        images = [key for key in _BITBAKE_VARS if key]
-        if len(images) == 1:
-            _BITBAKE_VARS[None] = _BITBAKE_VARS[image]
-
-    return _BITBAKE_VARS[image].get(var)
+    return BB_VARS.get_var(var, image)
 
 def parse_sourceparams(sourceparams):
     """
-- 
2.1.4


