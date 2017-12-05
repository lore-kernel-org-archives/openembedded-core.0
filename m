Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CFE747875F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:41:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="181356079"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by orsmga005.jf.intel.com with ESMTP; 04 Dec 2017 17:41:50 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:41:15 +1300
Message-Id: <14d9372e1dd715028f9ec181ffda89e43c7cb867.1512438000.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512438000.git.paul.eggleton@linux.intel.com>
References: <cover.1512438000.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/12] devtool: modify: pick up commits from previously created source tree
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
X-List-Received-Date: Tue, 05 Dec 2017 01:41:51 -0000

If you use devtool modify, then devtool reset, keep the source tree and
then devtool modify on the same recipe with the -n option to re-use the
existing source tree, we should pick up the commit hashes properly from
the source tree so that later on devtool finish has these to compare to
the commits in the tree at that time. We also need to be careful the
second time around that we only get the original commits rather than the
current HEAD which may be the result of user changes (hence using
"devtool-patched", the tag that was placed at the original HEAD).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a6656e4..ae48406 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -750,13 +750,11 @@ def modify(args, config, basepath, workspace):
         initial_rev = None
         commits = []
         check_commits = False
+        torev = 'HEAD'
         if not args.no_extract:
             ret = _extract_source(srctree, args.keep_temp, args.branch, False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
             initial_rev = ret.initial_rev
             logger.info('Source tree extracted to %s' % srctree)
-            # Get list of commits since this revision
-            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
-            commits = stdout.split()
             check_commits = True
         else:
             if os.path.exists(os.path.join(srctree, '.git')):
@@ -767,6 +765,7 @@ def modify(args, config, basepath, workspace):
                     stdout = ''
                 if stdout:
                     check_commits = True
+                    torev = 'devtool-patched'
                 for line in stdout.splitlines():
                     if line.startswith('*'):
                         (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
@@ -776,6 +775,11 @@ def modify(args, config, basepath, workspace):
                     (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
                     initial_rev = stdout.rstrip()
 
+        if initial_rev:
+            # Get list of commits since this revision
+            (stdout, _) = bb.process.run('git rev-list --reverse %s..%s' % (initial_rev, torev), cwd=srctree)
+            commits = stdout.split()
+
         branch_patches = {}
         if check_commits:
             # Check if there are override branches
-- 
2.9.5


