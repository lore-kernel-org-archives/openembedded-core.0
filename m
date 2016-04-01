Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD2B762B4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 15:04:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Apr 2016 08:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="679226892"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2016 08:02:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 18:02:41 +0300
Message-Id: <1459522962-30866-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 1/2] oe/patch: more detailed error reporting
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
X-List-Received-Date: Fri, 01 Apr 2016 15:04:10 -0000

Show the actual command that failed when raising a CmdError. Makes
figuring out what actually failed much easier.

[YOCTO #9344]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/patch.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 2464efd..6ab4427 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -8,12 +8,14 @@ class NotFoundError(bb.BBHandledException):
         return "Error: %s not found." % self.path
 
 class CmdError(bb.BBHandledException):
-    def __init__(self, exitstatus, output):
+    def __init__(self, command, exitstatus, output):
+        self.command = command
         self.status = exitstatus
         self.output = output
 
     def __str__(self):
-        return "Command Error: exit status: %d  Output:\n%s" % (self.status, self.output)
+        return "Command Error: '%s' exited with %d  Output:\n%s" % \
+                (self.command, self.status, self.output)
 
 
 def runcmd(args, dir = None):
@@ -32,7 +34,7 @@ def runcmd(args, dir = None):
         # print("cmd: %s" % cmd)
         (exitstatus, output) = oe.utils.getstatusoutput(cmd)
         if exitstatus != 0:
-            raise CmdError(exitstatus >> 8, output)
+            raise CmdError(cmd, exitstatus >> 8, output)
         return output
 
     finally:
-- 
2.6.2


