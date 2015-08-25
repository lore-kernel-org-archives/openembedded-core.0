Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2761A76CA8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 09:05:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 25 Aug 2015 02:04:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,744,1432623600"; d="scan'208";a="790452299"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 25 Aug 2015 02:04:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 849906A4087;
	Tue, 25 Aug 2015 02:03:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Aug 2015 12:04:16 +0300
Message-Id: <e1536dea5804937a3f77c421999fc25b123fc1ec.1440492980.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
References: <65da9b2235891726ab3697e6aaab30453277f2f4.1440492980.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440492980.git.ed.bartosh@linux.intel.com>
References: <cover.1440492980.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/17] wic: create new method _parse_line
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
X-List-Received-Date: Tue, 25 Aug 2015 09:05:07 -0000

Moved code that parses one line of 'bitbake -e' output
to separate method _parse_line.

This method will be also used later to parse lines of .env files.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 3537a2e..41e435f 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -131,6 +131,22 @@ class BitbakeVars(defaultdict):
     def __init__(self):
         defaultdict.__init__(self, dict)
 
+    def _parse_line(self, line, image):
+        """
+        Parse one line from bitbake -e output.
+        Put result key-value pair into the storage.
+        """
+        if "=" not in line:
+            return
+        try:
+            key, val = line.split("=")
+        except ValueError:
+            return
+        key = key.strip()
+        val = val.strip()
+        if key.replace('_', '').isalnum():
+            self[image][key] = val.strip('"')
+
     def get_var(self, var, image=None):
         """
         Get bitbake variable value lazy way, i.e. run
@@ -154,16 +170,7 @@ class BitbakeVars(defaultdict):
 
             # Parse bitbake -e output
             for line in lines.split('\n'):
-                if "=" not in line:
-                    continue
-                try:
-                    key, val = line.split("=")
-                except ValueError:
-                    continue
-                key = key.strip()
-                val = val.strip()
-                if key.replace('_', '').isalnum():
-                    self[image][key] = val.strip('"')
+                self._parse_line(line, image)
 
             # Make first image a default set of variables
             images = [key for key in self if key]
-- 
2.1.4


