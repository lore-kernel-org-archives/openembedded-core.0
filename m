Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D0F8878535
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401056"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:42 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:12 +1300
Message-Id: <71bfd0784a66dae48d02fbc3091028779a601b95.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/24] devtool: reset: print source tree base path
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:44 -0000

If S points to a subdirectory of the source rather than the "base" of
the source tree then print that rather than the subdirectory path when
telling the user they need to remove the source tree, since that is the
directory that they will need to remove.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b6e532b..9bd2d86 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1620,16 +1620,16 @@ def _reset(recipes, no_clean, config, basepath, workspace):
         # We don't automatically create this dir next to appends, but the user can
         preservedir(os.path.join(config.workspace_path, 'appends', pn))
 
-        srctree = workspace[pn]['srctree']
-        if os.path.isdir(srctree):
-            if os.listdir(srctree):
+        srctreebase = workspace[pn]['srctreebase']
+        if os.path.isdir(srctreebase):
+            if os.listdir(srctreebase):
                 # We don't want to risk wiping out any work in progress
                 logger.info('Leaving source tree %s as-is; if you no '
                             'longer need it then please delete it manually'
-                            % srctree)
+                            % srctreebase)
             else:
                 # This is unlikely, but if it's empty we can just remove it
-                os.rmdir(srctree)
+                os.rmdir(srctreebase)
 
         clean_preferred_provider(pn, config.workspace_path)
 
-- 
2.9.5


