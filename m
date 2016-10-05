Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E6D4471A84
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 17:08:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 Oct 2016 10:08:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,449,1473145200"; d="scan'208";a="1060878667"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 05 Oct 2016 10:08:18 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 10:07:17 -0700
Message-Id: <20161005170717.41046-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161005170717.41046-1-stephano.cetola@linux.intel.com>
References: <20161005170717.41046-1-stephano.cetola@linux.intel.com>
Subject: [PATCH V4] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Wed, 05 Oct 2016 17:08:18 -0000

With recent changes to recipeutils, the list of local files returned
by get_recipe_local_files could possibly include source files. This
only happens when the recipe contains a SRC_URI using subdir= to put
files in the source tree. These files should be ignored when
populating the list of local files for oe-local-files directory.

[YOCTO #10326]

introduced in
OE-Core revision 9069fef5dad5a873c8a8f720f7bcbc7625556309

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4b9b173..4eff6f8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -581,8 +581,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         recipe_patches = [os.path.basename(patch) for patch in
                           oe.recipeutils.get_recipe_patches(crd)]
         local_files = oe.recipeutils.get_recipe_local_files(crd)
+
+        # Ignore local files with subdir={BP}
+        srcabspath = os.path.abspath(srcsubdir)
         local_files = [fname for fname in local_files if
-                       os.path.exists(os.path.join(workdir, fname))]
+                       os.path.exists(os.path.join(workdir, fname)) and
+                       (srcabspath == workdir or not
+                       os.path.join(workdir, fname).startswith(srcabspath +
+                           os.sep))]
         if local_files:
             for fname in local_files:
                 _move_file(os.path.join(workdir, fname),
-- 
2.10.0


