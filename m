Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5158973919
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:19:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 16 Mar 2015 07:17:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="680778156"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga001.fm.intel.com with ESMTP; 16 Mar 2015 07:19:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:18:50 +0000
Message-Id: <3ef3e2f263b34dffd5262439d450b66b048124d0.1426515313.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1426515313.git.paul.eggleton@linux.intel.com>
References: <cover.1426515313.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/16] devtool: modify: get correct initial revision from previously extracted source tree
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
X-List-Received-Date: Mon, 16 Mar 2015 14:19:12 -0000

If you point devtool modify to a source tree previously created by
devtool modify or devtool extract, then we need to try to pick up the
correct initial revision so that devtool update-recipe knows where to
start looking for commits that match up with patches in the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 32fb3b6..f9369ee 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -326,8 +326,19 @@ def modify(args, config, basepath, workspace):
         commits = stdout.split()
     else:
         if os.path.exists(os.path.join(args.srctree, '.git')):
-            (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
-            initial_rev = stdout.rstrip()
+            # Check if it's a tree previously extracted by us
+            try:
+                (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=args.srctree)
+            except bb.process.ExecutionError:
+                stdout = ''
+            for line in stdout.splitlines():
+                if line.startswith('*'):
+                    (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=args.srctree)
+                    initial_rev = stdout.rstrip()
+            if not initial_rev:
+                # Otherwise, just grab the head revision
+                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
+                initial_rev = stdout.rstrip()
 
     # Check that recipe isn't using a shared workdir
     s = rd.getVar('S', True)
-- 
1.9.3


