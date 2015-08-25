Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0F78571633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:04:45 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 25 Aug 2015 02:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="775153183"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 25 Aug 2015 02:04:45 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DBC6B6A4083;
	Tue, 25 Aug 2015 02:03:54 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:19 +0300
Message-Id: <55df8b659e537853e918c19b2134a65103a70042.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 08/17] wic: implement getting variables from .env files
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
X-List-Received-Date: Tue, 25 Aug 2015 09:04:48 -0000

Added functionality of getting variables from <image>.env files to
BitbakeVars class. env files will be parsed if the directory with
env files is known, i.e. when vars_dir attribute is set.
Otherwise 'bitbake -e' output will be parsed.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 59 +++++++++++++++++++++++++---------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 040176d..0a8f3f1 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -26,6 +26,7 @@
 #
 """Miscellaneous functions."""
 
+import os
 from collections import defaultdict
 
 from wic import msger
@@ -131,12 +132,13 @@ class BitbakeVars(defaultdict):
     def __init__(self):
         defaultdict.__init__(self, dict)
 
-        # default_image attribute should be set from outside
+        # default_image and vars_dir attributes should be set from outside
         self.default_image = None
+        self.vars_dir = None
 
     def _parse_line(self, line, image):
         """
-        Parse one line from bitbake -e output.
+        Parse one line from bitbake -e output or from .env file.
         Put result key-value pair into the storage.
         """
         if "=" not in line:
@@ -152,31 +154,44 @@ class BitbakeVars(defaultdict):
 
     def get_var(self, var, image=None):
         """
-        Get bitbake variable value lazy way, i.e. run
-        'bitbake -e' only when variable is requested.
+        Get bitbake variable from 'bitbake -e' output or from .env file.
+        This is a lazy method, i.e. it runs bitbake or parses file only when
+        only when variable is requested. It also caches results.
         """
         if not image:
             image = self.default_image
 
         if image not in self:
-            # Get bitbake -e output
-            cmd = "bitbake -e"
-            if image:
-                cmd += " %s" % image
-
-            log_level = msger.get_loglevel()
-            msger.set_loglevel('normal')
-            ret, lines = _exec_cmd(cmd)
-            msger.set_loglevel(log_level)
-
-            if ret:
-                print "Couldn't get '%s' output." % cmd
-                print "Bitbake failed with error:\n%s\n" % lines
-                return
-
-            # Parse bitbake -e output
-            for line in lines.split('\n'):
-                self._parse_line(line, image)
+            if image and self.vars_dir:
+                fname = os.path.join(self.vars_dir, image + '.env')
+                if os.path.isfile(fname):
+                    # parse .env file
+                    with open(fname) as varsfile:
+                        for line in varsfile:
+                            self._parse_line(line, image)
+                else:
+                    print "Couldn't get bitbake variable from %s." % fname
+                    print "File %s doesn't exist." % fname
+                    return
+            else:
+                # Get bitbake -e output
+                cmd = "bitbake -e"
+                if image:
+                    cmd += " %s" % image
+
+                log_level = msger.get_loglevel()
+                msger.set_loglevel('normal')
+                ret, lines = _exec_cmd(cmd)
+                msger.set_loglevel(log_level)
+
+                if ret:
+                    print "Couldn't get '%s' output." % cmd
+                    print "Bitbake failed with error:\n%s\n" % lines
+                    return
+
+                # Parse bitbake -e output
+                for line in lines.split('\n'):
+                    self._parse_line(line, image)
 
             # Make first image a default set of variables
             images = [key for key in self if key]
-- 
2.1.4


