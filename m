Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD3A576AB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 11:56:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2015 04:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="545357912"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 04:56:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id DEAF86A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 04:56:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:56:21 +0300
Message-Id: <ea2bc767f3666e2798294df52f4b3c8a723eec83.1440071413.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440071413.git.ed.bartosh@linux.intel.com>
References: <cover.1440071413.git.ed.bartosh@linux.intel.com>
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
X-List-Received-Date: Thu, 20 Aug 2015 11:56:52 -0000

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


