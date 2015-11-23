Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D225C6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:40 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213357"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:24 +1300
Message-Id: <95e31d4dfd723c69516834684ba56511dee17d9b.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/18] devtool: upgrade: provide a means to update the source branch
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:41 -0000

If you're upgrading a git recipe to a revision on a release branch
that's different to the branch for the current revision, then you'll
need to update the branch parameter in SRC_URI, so add a --srcbranch/-B
command-line parameter to let you do that easily. It handles both when
the branch is stated verbatim in the recipe, and when a reference to
another variable is used (a common convention is to use a SRCBRANCH
variable for this, though the code doesn't care what variable is used
if any).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 6bac44b..9d9ab0f 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -255,7 +255,7 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
 
     return (rev, md5, sha256)
 
-def _create_new_recipe(newpv, md5, sha256, srcrev, workspace, tinfoil, rd):
+def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, workspace, tinfoil, rd):
     """Creates the new recipe under workspace"""
     crd = rd.createCopy()
 
@@ -276,6 +276,31 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, workspace, tinfoil, rd):
     if srcrev:
         newvalues['SRCREV'] = srcrev
 
+    if srcbranch:
+        src_uri = oe.recipeutils.split_var_value(rd.getVar('SRC_URI', False) or '')
+        changed = False
+        replacing = True
+        new_src_uri = []
+        for entry in src_uri:
+            scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(entry)
+            if replacing and scheme in ['git', 'gitsm']:
+                branch = params.get('branch', 'master')
+                if rd.expand(branch) != srcbranch:
+                    # Handle case where branch is set through a variable
+                    res = re.match(r'\$\{([^}@]+)\}', branch)
+                    if res:
+                        newvalues[res.group(1)] = srcbranch
+                        # We know we won't change SRC_URI now, so break out
+                        break
+                    else:
+                        params['branch'] = srcbranch
+                        entry = bb.fetch2.encodeurl((scheme, network, path, user, passwd, params))
+                        changed = True
+                replacing = False
+            new_src_uri.append(entry)
+        if changed:
+            newvalues['SRC_URI'] = ' '.join(new_src_uri)
+
     if newvalues:
         rd = oe.recipeutils.parse_recipe(fullpath, None, tinfoil.config_data)
         oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
@@ -295,6 +320,8 @@ def upgrade(args, config, basepath, workspace):
         raise DevtoolError("recipe %s is already in your workspace" % args.recipename)
     if not args.version and not args.srcrev:
         raise DevtoolError("You must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option")
+    if args.srcbranch and not args.srcrev:
+        raise DevtoolError("If you specify --srcbranch/-B then you must use --srcrev/-S to specify the revision" % args.recipename)
 
     reason = oe.recipeutils.validate_pn(args.recipename)
     if reason:
@@ -322,7 +349,7 @@ def upgrade(args, config, basepath, workspace):
         rev2, md5, sha256 = _extract_new_source(args.version, args.srctree, args.no_patch,
                                                 args.srcrev, args.branch, args.keep_temp,
                                                 tinfoil, rd)
-        rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, config.workspace_path, tinfoil, rd)
+        rf = _create_new_recipe(args.version, md5, sha256, args.srcrev, args.srcbranch, config.workspace_path, tinfoil, rd)
     except bb.process.CmdError as e:
         _upgrade_error(e, rf, args.srctree)
     except DevtoolError as e:
@@ -343,6 +370,7 @@ def register_commands(subparsers, context):
     parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
     parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (if fetching from an SCM such as git)')
+    parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
     parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for new development branch to checkout (default "%(default)s")')
     parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not apply patches from the recipe to the new source code')
     group = parser_upgrade.add_mutually_exclusive_group()
-- 
2.1.0


