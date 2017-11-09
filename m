Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D4BC6784E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:57:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:57:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401159"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:57:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:21 +1300
Message-Id: <f88e40e440c9ee6e1e581a2e8a2059f1597edc08.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 20/24] devtool: upgrade: reformat --no-patch warning message
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
X-List-Received-Date: Thu, 09 Nov 2017 01:57:16 -0000

* Only log one warning message instead of one per line
* Be a bit more verbose
* "if list" is more pythonic than "if len(list)"

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 0db2a50..3cb523c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -263,10 +263,8 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
 
     if no_patch:
         patches = oe.recipeutils.get_recipe_patches(crd)
-        if len(patches):
-            logger.warn('By user choice, the following patches will NOT be applied')
-            for patch in patches:
-                logger.warn("%s" % os.path.basename(patch))
+        if patches:
+            logger.warn('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
     else:
         __run('git checkout devtool-patched -b %s' % branch)
         skiptag = False
-- 
2.9.5


