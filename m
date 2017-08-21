Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E82927827C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 05:40:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Aug 2017 22:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,407,1498546800"; d="scan'208";a="1208228276"
Received: from ssen-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.109])
	by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2017 22:40:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:39:44 +1200
Message-Id: <0df957515454888de7a4fb4a9be66fb9401b4a24.1503293342.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503293342.git.paul.eggleton@linux.intel.com>
References: <cover.1503293342.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/10] devtool: upgrade: enable branch checking when revision is provided
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
X-List-Received-Date: Mon, 21 Aug 2017 05:40:57 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

When devtool upgrade is run on a recipe with revision specified
that is not on master branch, and branch isn't set by --srcbranch or -B,
then we should get the correct branch and append the branch to the URL.

If the revision was found on multiple branches, we will display error
to inform user to provide a correct branch and exit.

[YOCTO #11484]

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index f077f37..1f11d47 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -180,7 +180,7 @@ def _get_uri(rd):
             srcuri = rev_re.sub('', srcuri)
     return srcuri, srcrev
 
-def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tinfoil, rd):
+def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, keep_temp, tinfoil, rd):
     """Extract sources of a recipe with a new version"""
 
     def __run(cmd):
@@ -202,6 +202,23 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
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
     else:
         __run('git checkout devtool-base -b devtool-%s' % newpv)
 
@@ -275,7 +292,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
         else:
             shutil.rmtree(tmpsrctree)
 
-    return (rev, md5, sha256)
+    return (rev, md5, sha256, srcbranch)
 
 def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
@@ -374,10 +391,10 @@ def upgrade(args, config, basepath, workspace):
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
2.9.5


