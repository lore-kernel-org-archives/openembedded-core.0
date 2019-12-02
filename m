Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4454A7E3E8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 06:03:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xB263EmW023567
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Dec 2019 22:03:14 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sun, 1 Dec 2019 22:03:13 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Dec 2019 14:03:11 +0800
Message-ID: <20191202060311.17061-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202060311.17061-1-Qi.Chen@windriver.com>
References: <20191202060311.17061-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] devtool: add option to remove backported patch automatically during upgrade
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
X-List-Received-Date: Mon, 02 Dec 2019 06:03:13 -0000
Content-Type: text/plain

When upgrading a package, most likely the backported patches are not
needed any more, so add an option to `devtool upgrade' to handle such
situation.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 scripts/lib/devtool/standard.py | 14 +++++++++++++-
 scripts/lib/devtool/upgrade.py  |  3 ++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1c0cd8ab51..5fe848b6b8 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -487,7 +487,7 @@ def symlink_oelocal_files_srctree(rd,srctree):
             bb.process.run('git %s commit -m "Committing local file symlinks\n\n%s"' % (' '.join(useroptions), oe.patch.GitApplyTree.ignore_commit_prefix), cwd=srctree)
 
 
-def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False):
+def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, workspace, fixed_setup, d, tinfoil, no_overrides=False, no_backported=False):
     """Extract sources of a recipe"""
     import oe.recipeutils
     import oe.patch
@@ -555,6 +555,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
     tempbasedir = d.getVar('WORKDIR')
     bb.utils.mkdirhier(tempbasedir)
     tempdir = tempfile.mkdtemp(prefix='devtooltmp-', dir=tempbasedir)
+    patches = oe.recipeutils.get_recipe_patches(d)
+    backported_patches = []
+    for patch in patches:
+        with open(patch, 'r') as pf:
+            for line in pf.readlines():
+                if 'Upstream-Status: Backport' in line:
+                    backported_patches.append(os.path.basename(patch))
+                    break
     try:
         tinfoil.logger.setLevel(logging.WARNING)
 
@@ -579,6 +587,10 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
                 f.write('DEVTOOL_EXTRA_OVERRIDES = "%s"\n' % ':'.join(extra_overrides))
             f.write('inherit devtool-source\n')
             f.write('###--- _extract_source\n')
+            # deal with backported patches
+            if no_backported and len(backported_patches) > 0:
+                for patch_name in backported_patches:
+                    f.write('SRC_URI_remove = "file://%s"' % patch_name)
 
         update_unlockedsigs(basepath, workspace, fixed_setup, [pn])
 
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index cb6dce378a..d5e04ecdc5 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -549,7 +549,7 @@ def upgrade(args, config, basepath, workspace):
         license_diff = None
         try:
             logger.info('Extracting current version source...')
-            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
+            rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides, no_backported=args.no_backported)
             old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
             logger.info('Extracting upgraded version source...')
             rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
@@ -628,6 +628,7 @@ def register_commands(subparsers, context):
     parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for new development branch to checkout (default "%(default)s")')
     parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not apply patches from the recipe to the new source code')
     parser_upgrade.add_argument('--no-overrides', '-O', action="store_true", help='Do not create branches for other override configurations')
+    parser_upgrade.add_argument('--no-backported', action="store_true", help='Do not apply backported patches to the new source code')
     group = parser_upgrade.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-- 
2.17.1


