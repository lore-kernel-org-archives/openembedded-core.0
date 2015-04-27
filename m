Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47E4C73C48
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 09:53:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2015 02:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,656,1422950400"; d="scan'208";a="562337942"
Received: from dmoore26-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.4.219])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2015 02:53:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Apr 2015 10:53:21 +0100
Message-Id: <93fc82a4236d31a80d1ddb894c89383161505584.1430128109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430128109.git.paul.eggleton@linux.intel.com>
References: <cover.1430128109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 9/9] devtool: update-recipe: check if source tree is a git repository
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
X-List-Received-Date: Mon, 27 Apr 2015 09:53:40 -0000

If you've done "devtool add" (or "devtool modify" without -x) then it's
possible that the external source tree is not a git repository, so we
should handle that case here instead of printing a traceback.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a642112..94b5e0b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -477,13 +477,19 @@ def update_recipe(args, config, basepath, workspace):
         return updated
 
     srctree = workspace[args.recipename]
-    if mode == 'srcrev':
+
+    # Get HEAD revision
+    try:
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-        srcrev = stdout.strip()
-        if len(srcrev) != 40:
-            logger.error('Invalid hash returned by git: %s' % stdout)
-            return 1
+    except bb.process.ExecutionError as err:
+        print('Failed to get HEAD revision in %s: %s' % (srctree, err))
+        return 1
+    srcrev = stdout.strip()
+    if len(srcrev) != 40:
+        logger.error('Invalid hash returned by git: %s' % stdout)
+        return 1
 
+    if mode == 'srcrev':
         logger.info('Updating SRCREV in recipe %s' % os.path.basename(recipefile))
         patchfields = {}
         patchfields['SRCREV'] = srcrev
-- 
2.1.0


