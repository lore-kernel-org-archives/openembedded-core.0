Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 003AB719DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 02:00:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 03 Oct 2016 19:00:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,292,1473145200"; d="scan'208";a="1060058335"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2016 19:00:51 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2016 18:59:47 -0700
Message-Id: <20161004015947.127442-2-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161004015947.127442-1-stephano.cetola@linux.intel.com>
References: <20161004015947.127442-1-stephano.cetola@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH V3] devtool: modify command fails to ignore source files
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
X-List-Received-Date: Tue, 04 Oct 2016 02:00:52 -0000

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
 scripts/lib/devtool/standard.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8319145..48b0a5e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -568,8 +568,13 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
         recipe_patches = [os.path.basename(patch) for patch in
                           oe.recipeutils.get_recipe_patches(crd)]
         local_files = oe.recipeutils.get_recipe_local_files(crd)
+
+        # Ignore local files with subdir={BP}
+        srcabspath = os.path.abspath(srcsubdir)
         local_files = [fname for fname in local_files if
-                       os.path.exists(os.path.join(workdir, fname))]
+                       os.path.exists(os.path.join(workdir, fname)) and
+                       not os.path.join(workdir, fname).startswith(srcabspath +
+                           os.sep)]
         if local_files:
             for fname in local_files:
                 _move_file(os.path.join(workdir, fname),
-- 
2.10.0


