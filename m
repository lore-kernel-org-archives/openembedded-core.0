Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 05CFB770F9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 23:34:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 07 Apr 2016 16:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="780431307"
Received: from bitbang.jf.intel.com ([10.7.199.152])
	by orsmga003.jf.intel.com with ESMTP; 07 Apr 2016 16:34:58 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 16:34:52 -0700
Message-Id: <b4567c49b3aba8424e45758579dd283d7e1866b1.1460071932.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1460071932.git.randy.e.witt@linux.intel.com>
References: <cover.1460071932.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 4/5] sstatesig.py: Add a method to "unlock" recipes
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
X-List-Received-Date: Thu, 07 Apr 2016 23:34:59 -0000

In order to support workflows using devtool where a user might want to
modify tasks that exist in locked-sigs.inc, there must be a way to unlock
recipes.

This patch adds that support by allowing the user to add recipes to
SIGGEN_UNLOCKED_RECIPES. Recipes that exist in that variable will have
all their tasks unlocked, as well as any tasks that depend on that
recipe.

For example if foo->bar->baz, if you unlock baz, it will also unlock bar
so that foo can be rebuilt without explicitly specifying bar as being
unlocked.

[YOCTO #9195]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oe/sstatesig.py | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 009adea..01dce66 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -94,6 +94,9 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         self.lockedhashfn = {}
         self.machine = data.getVar("MACHINE", True)
         self.mismatch_msgs = []
+        self.unlockedrecipes = (data.getVar("SIGGEN_UNLOCKED_RECIPES", True) or
+                                "").split()
+        self.unlockedrecipes = { k: "" for k in self.unlockedrecipes }
         pass
 
     def tasks_resolved(self, virtmap, virtpnmap, dataCache):
@@ -136,7 +139,26 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         recipename = dataCache.pkg_fn[fn]
         self.lockedpnmap[fn] = recipename
         self.lockedhashfn[fn] = dataCache.hashfn[fn]
-        if recipename in self.lockedsigs:
+
+        unlocked = False
+        if recipename in self.unlockedrecipes:
+            unlocked = True
+        else:
+            def recipename_from_dep(dep):
+                # The dep entry will look something like
+                # /path/path/recipename.bb.task, virtual:native:/p/foo.bb.task,
+                # ...
+                fn = dep.rsplit('.', 1)[0]
+                return dataCache.pkg_fn[fn]
+
+            # If any unlocked recipe is in the direct dependencies then the
+            # current recipe should be unlocked as well.
+            depnames = [ recipename_from_dep(x) for x in deps ]
+            if any(x in y for y in depnames for x in self.unlockedrecipes):
+                self.unlockedrecipes[recipename] = ''
+                unlocked = True
+
+        if not unlocked and recipename in self.lockedsigs:
             if task in self.lockedsigs[recipename]:
                 k = fn + "." + task
                 h_locked = self.lockedsigs[recipename][task][0]
-- 
2.5.5


