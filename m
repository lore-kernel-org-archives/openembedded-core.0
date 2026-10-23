Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3856.1792750965131725995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=mP/mO8Qm;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B491650;
	Fri, 23 Oct 2026 03:22:41 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 17B5D3F7B4;
	Fri, 23 Oct 2026 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750964; bh=ygnOx1XjOvnAcQ0Cj8iomVIr25giU7dODJXFQ7o7K/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mP/mO8Qm2wcibe0tHZRLPAf/Y7774KpK4FXVpRu27VSAnkcJhBltu9Z3a8fXdzR3h
	 63Xz1VC3jwm+EjUmu37RI9lWcOe5LPCOvMCJQtd/cfP3MejmFW+0jEfP9mr3lReFpW
	 yiTFRwB8m+tp/NIQMXFHYiuL4RCH7JyG0kFfglEI=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 1/5] devtool: Support multiconfig recipe workflows
Date: Fri, 23 Oct 2026 11:22:11 +0100
Message-ID: <20261023102215.4043005-2-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248499
Content-Type: text/plain; charset="utf-8"

Preserve multiconfig-qualified targets when extracting and
configuring sources.

Use the recipe name without the multiconfig prefix for
workspace lookups. Keep the prefix when calling BitBake
from reset, update-recipe, and finish.

Fixes [YOCTO #13933]

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 scripts/lib/devtool/standard.py | 78 +++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 0d933e68b1..84fa19c7aa 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -23,6 +23,7 @@ from collections import OrderedDict
 from devtool import exec_build_env_command, setup_tinfoil, check_workspa=
ce_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbcl=
assextend_targets, update_unlockedsigs, check_prerelease_version, check_g=
it_repo_dirty, check_git_repo_op, DevtoolError
 from devtool import parse_recipe
=20
+import bb.runqueue
 import bb.utils
=20
 logger =3D logging.getLogger('devtool')
@@ -30,6 +31,21 @@ logger =3D logging.getLogger('devtool')
 override_branch_prefix =3D 'devtool-override-'
=20
=20
+def _prefix_multiconfig_targets(mc, targets):
+    """Add a multiconfig prefix to build targets."""
+    if not mc:
+        return targets
+
+    return ' '.join(target if target.startswith('mc:') else
+                    'mc:%s:%s' % (mc, target)
+                    for target in targets.split())
+
+
+def _get_multiconfig_targets(d, targets):
+    """Add the recipe datastore's multiconfig prefix to build targets.""=
"
+    return _prefix_multiconfig_targets(d.getVar('BB_CURRENT_MC'), target=
s)
+
+
 def add(args, config, basepath, workspace):
     """Entry point for the devtool 'add' subcommand"""
     import bb.data
@@ -596,7 +612,7 @@ def _extract_source(srctree, keep_temp, devbranch, sy=
nc, config, basepath, works
                         task =3D None
=20
             # Run the fetch + unpack tasks
-            res =3D tinfoil.build_targets(pn,
+            res =3D tinfoil.build_targets(_get_multiconfig_targets(d, pn=
),
                                         task,
                                         handle_events=3DTrue)
         finally:
@@ -829,7 +845,8 @@ def modify(args, config, basepath, workspace):
                             f.write('%s\n' % fname)
=20
                 task =3D 'do_configure'
-                res =3D tinfoil.build_targets(pn, task, handle_events=3D=
True)
+                target =3D _get_multiconfig_targets(rd, pn)
+                res =3D tinfoil.build_targets(target, task, handle_event=
s=3DTrue)
=20
                 # Copy .config to workspace
                 kconfpath =3D rd.getVar('B')
@@ -1919,7 +1936,7 @@ def _update_recipe(recipename, workspace, rd, mode,=
 appendlayerdir, wildcard_ver
=20
 def update_recipe(args, config, basepath, workspace):
     """Entry point for the devtool 'update-recipe' subcommand"""
-    check_workspace_recipe(workspace, args.recipename)
+    workspacepn =3D check_workspace_recipe(workspace, args.recipename)
=20
     if args.append:
         if not os.path.exists(args.append):
@@ -1941,7 +1958,11 @@ def update_recipe(args, config, basepath, workspac=
e):
         if args.dry_run:
             dry_run_output =3D tempfile.TemporaryDirectory(prefix=3D'dev=
tool')
             dry_run_outdir =3D dry_run_output.name
-        updated, _, _ =3D _update_recipe(args.recipename, workspace, rd,=
 args.mode, args.append, args.wildcard_version, args.no_remove, args.init=
ial_rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_override=
s, force_patch_refresh=3Dargs.force_patch_refresh)
+        updated, _, _ =3D _update_recipe(
+            workspacepn, workspace, rd, args.mode, args.append,
+            args.wildcard_version, args.no_remove, args.initial_rev,
+            dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_over=
rides,
+            force_patch_refresh=3Dargs.force_patch_refresh)
=20
         if updated:
             rf =3D rd.getVar('FILE')
@@ -1968,11 +1989,17 @@ def status(args, config, basepath, workspace):
     return 0
=20
=20
-def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
+def _reset(recipes, no_clean, remove_work, config, basepath, workspace,
+           bitbake_targets=3DNone):
     """Reset one or more recipes"""
     import bb.process
     import oe.path
=20
+    if bitbake_targets is None:
+        bitbake_targets =3D recipes
+    if len(bitbake_targets) !=3D len(recipes):
+        raise DevtoolError('Reset recipes and BitBake targets do not mat=
ch')
+
     def clean_preferred_provider(pn, layerconf_path):
         """Remove PREFERRED_PROVIDER from layer.conf'"""
         import re
@@ -2002,11 +2029,15 @@ def _reset(recipes, no_clean, remove_work, config=
, basepath, workspace):
         # it uses BBCLASSEXTEND, then we need to also clean the other
         # variants
         targets =3D []
-        for recipe in recipes:
-            targets.append(recipe)
+        for recipe, bitbake_target in zip(recipes, bitbake_targets):
+            targets.append(bitbake_target)
             recipefile =3D workspace[recipe]['recipefile']
             if recipefile and os.path.exists(recipefile):
-                targets.extend(get_bbclassextend_targets(recipefile, rec=
ipe))
+                variants =3D get_bbclassextend_targets(recipefile, recip=
e)
+                mc, _ =3D bb.runqueue.split_mc(bitbake_target)
+                variants =3D _prefix_multiconfig_targets(mc,
+                                                       ' '.join(variants=
))
+                targets.extend(variants.split())
         try:
             exec_build_env_command(config.init_path, basepath, 'bitbake =
-c clean %s' % ' '.join(targets))
         except bb.process.ExecutionError as e:
@@ -2086,23 +2117,27 @@ def _reset(recipes, no_clean, remove_work, config=
, basepath, workspace):
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
=20
-    recipes =3D ""
+    recipes =3D []
+    bitbake_targets =3D []
=20
     if args.recipename:
         if args.all:
             raise DevtoolError("Recipe cannot be specified if -a/--all i=
s used")
         else:
             for recipe in args.recipename:
-                check_workspace_recipe(workspace, recipe, checksrc=3DFal=
se)
+                workspacepn =3D check_workspace_recipe(workspace, recipe=
,
+                                                     checksrc=3DFalse)
+                recipes.append(workspacepn)
+                bitbake_targets.append(recipe)
     elif not args.all:
         raise DevtoolError("Recipe must be specified, or specify -a/--al=
l to "
                            "reset all recipes")
     if args.all:
         recipes =3D list(workspace.keys())
-    else:
-        recipes =3D args.recipename
+        bitbake_targets =3D recipes
=20
-    _reset(recipes, args.no_clean, args.remove_work, config, basepath, w=
orkspace)
+    _reset(recipes, args.no_clean, args.remove_work, config, basepath, w=
orkspace,
+           bitbake_targets=3Dbitbake_targets)
=20
     return 0
=20
@@ -2137,14 +2172,14 @@ def finish(args, config, basepath, workspace):
     import bb
     import oe.recipeutils
=20
-    check_workspace_recipe(workspace, args.recipename)
+    workspacepn =3D check_workspace_recipe(workspace, args.recipename)
=20
     dry_run_suffix =3D ' (dry-run)' if args.dry_run else ''
=20
     # Grab the equivalent of COREBASE without having to initialise tinfo=
il
     corebasedir =3D os.path.abspath(os.path.join(os.path.dirname(__file_=
_), '..', '..', '..'))
=20
-    srctree =3D workspace[args.recipename]['srctree']
+    srctree =3D workspace[workspacepn]['srctree']
     check_git_repo_op(srctree, [corebasedir])
     dirty =3D check_git_repo_dirty(srctree)
     if dirty:
@@ -2175,7 +2210,7 @@ def finish(args, config, basepath, workspace):
         # If it's an upgrade, grab the original path
         origpath =3D None
         origfilelist =3D None
-        append =3D workspace[args.recipename]['bbappend']
+        append =3D workspace[workspacepn]['bbappend']
         with open(append, 'r') as f:
             for line in f:
                 if line.startswith('# original_path:'):
@@ -2217,7 +2252,12 @@ def finish(args, config, basepath, workspace):
         if args.dry_run:
             dry_run_output =3D tempfile.TemporaryDirectory(prefix=3D'dev=
tool')
             dry_run_outdir =3D dry_run_output.name
-        updated, appendfile, removed =3D _update_recipe(args.recipename,=
 workspace, rd, args.mode, appendlayerdir, wildcard_version=3DTrue, no_re=
move=3DFalse, no_report_remove=3Dremoving_original, initial_rev=3Dargs.in=
itial_rev, dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_overri=
des, force_patch_refresh=3Dargs.force_patch_refresh)
+        updated, appendfile, removed =3D _update_recipe(
+            workspacepn, workspace, rd, args.mode, appendlayerdir,
+            wildcard_version=3DTrue, no_remove=3DFalse,
+            no_report_remove=3Dremoving_original, initial_rev=3Dargs.ini=
tial_rev,
+            dry_run_outdir=3Ddry_run_outdir, no_overrides=3Dargs.no_over=
rides,
+            force_patch_refresh=3Dargs.force_patch_refresh)
         removed =3D [os.path.relpath(pth, recipedir) for pth in removed]
=20
         # Remove any old files in the case of an upgrade
@@ -2306,7 +2346,9 @@ def finish(args, config, basepath, workspace):
     if args.dry_run:
         logger.info('Resetting recipe (dry-run)')
     else:
-        _reset([args.recipename], no_clean=3Dno_clean, remove_work=3Drem=
ove_work, config=3Dconfig, basepath=3Dbasepath, workspace=3Dworkspace)
+        _reset([workspacepn], no_clean=3Dno_clean, remove_work=3Dremove_=
work,
+               config=3Dconfig, basepath=3Dbasepath, workspace=3Dworkspa=
ce,
+               bitbake_targets=3D[args.recipename])
=20
     return 0
=20
