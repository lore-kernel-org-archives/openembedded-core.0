Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 364BF6FF5D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 20:56:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 02 Oct 2016 13:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,434,1473145200"; d="scan'208";a="15557192"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga005.jf.intel.com with ESMTP; 02 Oct 2016 13:56:16 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2016 13:55:06 -0700
Message-Id: <20161002205506.124239-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Sun, 02 Oct 2016 20:56:16 -0000

With recent changes to recipeutils, the list of local files returned
by get_recipe_local_files could possibly include source files. This
only happens when the recipe contains a SRC_URI using subdir= to put
files in the source tree. These files should be ignored when
populating the list of local files for oe-local-files directory.

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8319145..c7a5712 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -568,8 +568,12 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         recipe_patches = [os.path.basename(patch) for patch in
                           oe.recipeutils.get_recipe_patches(crd)]
         local_files = oe.recipeutils.get_recipe_local_files(crd)
+
+        # Ignore local files with subdir={BP}
+        srcdirname = os.path.basename(os.path.normpath(srcsubdir))
         local_files = [fname for fname in local_files if
-                       os.path.exists(os.path.join(workdir, fname))]
+                       os.path.exists(os.path.join(workdir, fname)) and
+                       srcdirname not in fname]
         if local_files:
             for fname in local_files:
                 _move_file(os.path.join(workdir, fname),
-- 
2.10.0


