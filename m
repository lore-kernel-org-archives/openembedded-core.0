Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C860E784E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:10 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171400964"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:03 +1300
Message-Id: <6ed3a251a6dd3630130c7170c2b88761bf646bc7.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/24] recipetool: ignore incidental kernel module source
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:10 -0000

If the source tree happens to contain a kernel module as an example, a
test or under a "contrib" directory then we shouldn't be picking it up
and making the determination that the entire thing is a kernel module.

An example that triggered this is zstd, which ships a kernel module
under contrib/linux-kernel:

  https://github.com/facebook/zstd

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py      | 6 ++++--
 scripts/lib/recipetool/create_kmod.py | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1532735..055bdef 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -156,10 +156,12 @@ class RecipeHandler(object):
                         RecipeHandler.recipebinmap[prog] = pn
 
     @staticmethod
-    def checkfiles(path, speclist, recursive=False):
+    def checkfiles(path, speclist, recursive=False, excludedirs=None):
         results = []
         if recursive:
-            for root, _, files in os.walk(path):
+            for root, dirs, files in os.walk(path, topdown=True):
+                if excludedirs:
+                    dirs[:] = [d for d in dirs if d not in excludedirs]
                 for fn in files:
                     for spec in speclist:
                         if fnmatch.fnmatch(fn, spec):
diff --git a/scripts/lib/recipetool/create_kmod.py b/scripts/lib/recipetool/create_kmod.py
index 7cf188d..4569b53 100644
--- a/scripts/lib/recipetool/create_kmod.py
+++ b/scripts/lib/recipetool/create_kmod.py
@@ -40,7 +40,7 @@ class KernelModuleRecipeHandler(RecipeHandler):
 
         makefiles = []
 
-        files = RecipeHandler.checkfiles(srctree, ['*.c', '*.h'], recursive=True)
+        files = RecipeHandler.checkfiles(srctree, ['*.c', '*.h'], recursive=True, excludedirs=['contrib', 'test', 'examples'])
         if files:
             for cfile in files:
                 # Look in same dir or parent for Makefile
-- 
2.9.5


