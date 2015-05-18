Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BA02765C9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2015 08:15:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; d="scan'208";a="731190769"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 08:15:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 May 2015 16:15:05 +0100
Message-Id: <77161cbef0d31108ed8bc3ac4a619462c09a22ea.1431961859.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431961859.git.paul.eggleton@linux.intel.com>
References: <cover.1431961859.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] lib/oe/patch: use with open() for all file operations
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
X-List-Received-Date: Mon, 18 May 2015 15:15:15 -0000

with open(...)... is preferred for reading/writing files as it is neater
and takes care of closing the file for you.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 40 +++++++++++++++++++---------------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f68d40f..e1f1c53 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -115,7 +115,8 @@ class PatchTree(PatchSet):
     def _removePatchFile(self, all = False):
         if not os.path.exists(self.seriespath):
             return
-        patches = open(self.seriespath, 'r+').readlines()
+        with open(self.seriespath, 'r+') as f:
+            patches = f.readlines()
         if all:
             for p in reversed(patches):
                 self._removePatch(os.path.join(self.patchdir, p.strip()))
@@ -405,16 +406,15 @@ class QuiltTree(PatchSet):
         if not os.path.exists(self.dir):
             raise NotFoundError(self.dir)
         if os.path.exists(seriespath):
-            series = file(seriespath, 'r')
-            for line in series.readlines():
-                patch = {}
-                parts = line.strip().split()
-                patch["quiltfile"] = self._quiltpatchpath(parts[0])
-                patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
-                if len(parts) > 1:
-                    patch["strippath"] = parts[1][2:]
-                self.patches.append(patch)
-            series.close()
+            with open(seriespath, 'r') as f:
+                for line in f.readlines():
+                    patch = {}
+                    parts = line.strip().split()
+                    patch["quiltfile"] = self._quiltpatchpath(parts[0])
+                    patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
+                    if len(parts) > 1:
+                        patch["strippath"] = parts[1][2:]
+                    self.patches.append(patch)
 
             # determine which patches are applied -> self._current
             try:
@@ -436,9 +436,8 @@ class QuiltTree(PatchSet):
             self.InitFromDir()
         PatchSet.Import(self, patch, force)
         oe.path.symlink(patch["file"], self._quiltpatchpath(patch["file"]), force=True)
-        f = open(os.path.join(self.dir, "patches","series"), "a");
-        f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"]+"\n")
-        f.close()
+        with open(os.path.join(self.dir, "patches", "series"), "a") as f:
+            f.write(os.path.basename(patch["file"]) + " -p" + patch["strippath"] + "\n")
         patch["quiltfile"] = self._quiltpatchpath(patch["file"])
         patch["quiltfilemd5"] = bb.utils.md5_file(patch["quiltfile"])
 
@@ -559,13 +558,12 @@ class UserResolver(Resolver):
             bb.utils.mkdirhier(t)
             import random
             rcfile = "%s/bashrc.%s.%s" % (t, str(os.getpid()), random.random())
-            f = open(rcfile, "w")
-            f.write("echo '*** Manual patch resolution mode ***'\n")
-            f.write("echo 'Dropping to a shell, so patch rejects can be fixed manually.'\n")
-            f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
-            f.write("echo ''\n")
-            f.write(" ".join(patchcmd) + "\n")
-            f.close()
+            with open(rcfile, "w") as f:
+                f.write("echo '*** Manual patch resolution mode ***'\n")
+                f.write("echo 'Dropping to a shell, so patch rejects can be fixed manually.'\n")
+                f.write("echo 'Run \"quilt refresh\" when patch is corrected, press CTRL+D to exit.'\n")
+                f.write("echo ''\n")
+                f.write(" ".join(patchcmd) + "\n")
             os.chmod(rcfile, 0775)
 
             self.terminal("bash --rcfile " + rcfile, 'Patch Rejects: Please fix patch rejects manually', self.patchset.d)
-- 
2.1.0


