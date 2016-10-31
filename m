Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4958571A49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:22 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576822"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:45 +1300
Message-Id: <e12d7ba1997bad8c2ee1b93624766363062c06b1.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] devtool: finish: fix error if destination layer is not in bblayers.conf
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:22 -0000

If devtool finish is run on a recipe where the recipe file itself is in
the workspace (e.g. where devtool add / devtool upgrade has been used)
and the specified destination layer is not in bblayers.conf, then we
need to avoid running bitbake -c clean at the end because the recipe has
been moved, but the bbappend is still present in the workspace layer at
that point and so if we do it will fail due to the dangling bbappend.
It's difficult to do the clean at the point we'd want to because tinfoil
is holding bitbake.lock for most of the time, but in any case cleaning
the recipe is less important than it used to be since we started
managing the sysroot contents more strictly, so just disable cleaning
under these circumstances to avoid the problem.

Fixes [YOCTO #10484].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8dfd538..9511d56 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1479,6 +1479,7 @@ def finish(args, config, basepath, workspace):
 
     check_workspace_recipe(workspace, args.recipename)
 
+    no_clean = False
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
         rd = parse_recipe(config, tinfoil, args.recipename, True)
@@ -1540,6 +1541,7 @@ def finish(args, config, basepath, workspace):
         if origlayerdir == config.workspace_path and destpath:
             # Recipe file itself is in the workspace - need to move it and any
             # associated files to the specified layer
+            no_clean = True
             logger.info('Moving recipe file to %s' % destpath)
             recipedir = os.path.dirname(rd.getVar('FILE', True))
             for root, _, files in os.walk(recipedir):
@@ -1554,7 +1556,7 @@ def finish(args, config, basepath, workspace):
         tinfoil.shutdown()
 
     # Everything else has succeeded, we can now reset
-    _reset([args.recipename], no_clean=False, config=config, basepath=basepath, workspace=workspace)
+    _reset([args.recipename], no_clean=no_clean, config=config, basepath=basepath, workspace=workspace)
 
     return 0
 
-- 
2.5.5


