Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5D277D12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 03:24:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Aug 2017 20:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,385,1498546800"; d="scan'208";a="140636264"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga005.fm.intel.com with ESMTP; 16 Aug 2017 20:24:35 -0700
From: rebecca.swee.fun.chang@intel.com
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 11:25:19 +0800
Message-Id: <416dd055d4adbf4b2cd46abc19e0b4ed9f478786.1502939403.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1502939403.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1502939403.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 1/1] devtool: upgrade: enable branch checking when revision is provided
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
X-List-Received-Date: Thu, 17 Aug 2017 03:24:36 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

When devtool upgrade is run on a recipe with revision specified
that is not on master branch, and branch isn't set by --srcbranch or -B,
then we should get the correct branch and append the branch to the URL.

If the revision was found on multiple branches, we will display error
to inform user to provide a correct branch and exit.

[YOCTO #11484]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/devtool/upgrade.py | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f077f37..7adeab5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -180,7 +180,7 @@ def _get_uri(rd):
             srcuri = rev_re.sub('', srcuri)
     return srcuri, srcrev
 
-def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tinfoil, rd):
+def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, keep_temp, tinfoil, rd):
     """Extract sources of a recipe with a new version"""
 
     def __run(cmd):
@@ -202,6 +202,24 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
         __run('git tag -f devtool-base-new')
         md5 = None
         sha256 = None
+        if not srcbranch:
+            check_branch, check_branch_err = __run('git branch -r --contains %s' % srcrev)
+            get_branch = [x.strip() for x in check_branch.splitlines()]
+            # Remove HEAD reference point and drop remote prefix
+            get_branch = [x.split('/', 1)[1] for x in get_branch if not x.startswith('origin/HEAD')]
+            if 'master' in get_branch:
+                # If it is master, we do not need to append 'branch=master' as this is default.
+                # Even with the case where get_branch has multiple objects, if 'master' is one
+                # of them, we should default take from 'master'
+                srcbranch = ''
+            elif len(get_branch) == 1:
+                # If 'master' isn't in get_branch and get_branch contains only ONE object, then store result into 'srcbranch'
+                srcbranch = get_branch[0]
+            else:
+                # If get_branch contains more than one objects, then display error and exit.
+                mbrch = '\n  ' + '\n  '.join(get_branch)
+                raise DevtoolError('Revision %s was found on multiple branches: %s\nPlease provide the correct branch in the devtool command with "--srcbranch" or "-B" option.' % (srcrev, mbrch))
+                sys.exit(1)
     else:
         __run('git checkout devtool-base -b devtool-%s' % newpv)
 
@@ -275,7 +293,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
         else:
             shutil.rmtree(tmpsrctree)
 
-    return (rev, md5, sha256)
+    return (rev, md5, sha256, srcbranch)
 
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
@@ -374,10 +392,10 @@ def upgrade(args, config, basepath, workspace):
         rf = None
         try:
             rev1 = standard._extract_source(srctree, False, 'devtool-orig', False, rd, tinfoil)
-            rev2, md5, sha256 = _extract_new_source(args.version, srctree, args.no_patch,
-                                                    args.srcrev, args.branch, args.keep_temp,
+            rev2, md5, sha256, srcbranch = _extract_new_source(args.version, srctree, args.no_patch,
+                                                    args.srcrev, args.srcbranch, args.branch, args.keep_temp,
                                                     tinfoil, rd)
-            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
+            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, config.workspace_path, tinfoil, rd)
         except bb.process.CmdError as e:
             _upgrade_error(e, rf, srctree)
         except DevtoolError as e:
-- 
2.7.4


