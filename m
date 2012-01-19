Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rnsdn-00051o-AH
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:06:59 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 05:59:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100399932"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.198])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 05:59:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 13:59:15 +0000
Message-Id: <592d932934f891f3f73dc9630fa9d1a7d94aff56.1326981479.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326981478.git.paul.eggleton@linux.intel.com>
References: <cover.1326981478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1326981478.git.paul.eggleton@linux.intel.com>
References: <cover.1326981478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/patch: avoid backtrace when patch does not apply
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2012 14:06:59 -0000

We don't need to see a Python stack backtrace when a patch does not
apply, just the error output from patch, so trap these kinds of errors
and ensure that we display the message and fail the task and nothing
else.

Fixes [YOCTO #1143]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass |    5 ++++-
 meta/lib/oe/patch.py       |   10 +++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 471c32b..1ea4bc5 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -155,7 +155,10 @@ python patch_do_patch() {
 			patchset.Import({"file":local, "strippath": parm['striplevel']}, True)
 		except Exception as exc:
 			bb.fatal(str(exc))
-		resolver.Resolve()
+		try:
+			resolver.Resolve()
+		except bb.BBHandledException as e:
+			bb.fatal(str(e))
 }
 patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f4ccb3e..6f7f900 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -2,14 +2,14 @@ import oe.path
 import os
 import bb.utils, bb.msg, bb.data, bb.fetch2
 
-class NotFoundError(Exception):
+class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
         self.path = path
 
     def __str__(self):
         return "Error: %s not found." % self.path
 
-class CmdError(Exception):
+class CmdError(bb.BBHandledException):
     def __init__(self, exitstatus, output):
         self.status = exitstatus
         self.output = output
@@ -207,7 +207,7 @@ class QuiltTree(PatchSet):
         # read series -> self.patches
         seriespath = os.path.join(self.dir, 'patches', 'series')
         if not os.path.exists(self.dir):
-            raise Exception("Error: %s does not exist." % self.dir)
+            raise NotFoundError(self.dir)
         if os.path.exists(seriespath):
             series = file(seriespath, 'r')
             for line in series.readlines():
@@ -228,7 +228,7 @@ class QuiltTree(PatchSet):
                 if sys.exc_value.output.strip() == "No patches applied":
                     return
                 else:
-                    raise sys.exc_value
+                    raise
             output = [val for val in output.split('\n') if not val.startswith('#')]
             for patch in self.patches:
                 if os.path.basename(patch["quiltfile"]) == output[-1]:
@@ -336,7 +336,7 @@ class NOOPResolver(Resolver):
         except Exception:
             import sys
             os.chdir(olddir)
-            raise sys.exc_value
+            raise
 
 # Patch resolver which relies on the user doing all the work involved in the
 # resolution, with the exception of refreshing the remote copy of the patch
-- 
1.7.5.4



