Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 60E2777153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773894"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:58 +1300
Message-Id: <d05f247759d5c3f065d14a511b5d235a6642d3b9.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/14] devtool: undeploy-target: support undeploying all recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:58 -0000

If you want to put the target device back to exactly how it was before
devtool deploy-target started poking things into it, then it would make
things easier if you didn't have to figure out which recipes were
deployed. Now that we have the list stored on the target we can
determine this reliably, so add a -a/--all option to undeploy-target to
undeploy everything that has been deployed.

One of the side-effects of this is that the dry-run functionality for
undeploy-target had to be reimplemented to actually run the script on
the target, since we have no way of knowing what's been deployed from
the host side. We don't need to do the same for deploy-target though
since we know exactly which files will be deployed without referring to
the target.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 59 ++++++++++++++++++++++++++++---------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d2a314b..d54f6ba 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -21,13 +21,14 @@ import subprocess
 import logging
 import tempfile
 import shutil
+import argparse_oe
 from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
 deploylist_path = '/.devtool'
 
-def _prepare_remote_script(deploy, verbose=False):
+def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=False):
     """
     Prepare a shell script for running on the target to
     deploy/undeploy files. We have to be careful what we put in this
@@ -38,19 +39,33 @@ def _prepare_remote_script(deploy, verbose=False):
     lines = []
     lines.append('#!/bin/sh')
     lines.append('set -e')
+    if undeployall:
+        # Yes, I know this is crude - but it does work
+        lines.append('for entry in %s/*.list; do' % deploylist_path)
+        lines.append('[ ! -f $entry ] && exit')
+        lines.append('set `basename $entry | sed "s/.list//"`')
+    if dryrun:
+        if not deploy:
+            lines.append('echo "Previously deployed files for $1:"')
     lines.append('manifest="%s/$1.list"' % deploylist_path)
     lines.append('if [ -f $manifest ] ; then')
     # Read manifest in reverse and delete files / remove empty dirs
     lines.append('    sed \'1!G;h;$!d\' $manifest | while read file')
     lines.append('    do')
-    lines.append('        if [ -d $file ] ; then')
-    lines.append('            rmdir $file > /dev/null 2>&1 || true')
-    lines.append('        else')
-    lines.append('            rm $file')
-    lines.append('        fi')
+    if dryrun:
+        lines.append('        if [ ! -d $file ] ; then')
+        lines.append('            echo $file')
+        lines.append('        fi')
+    else:
+        lines.append('        if [ -d $file ] ; then')
+        lines.append('            rmdir $file > /dev/null 2>&1 || true')
+        lines.append('        else')
+        lines.append('            rm $file')
+        lines.append('        fi')
     lines.append('    done')
-    lines.append('    rm $manifest')
-    if not deploy:
+    if not dryrun:
+        lines.append('    rm $manifest')
+    if not deploy and not dryrun:
         # May as well remove all traces
         lines.append('    rmdir `dirname $manifest` > /dev/null 2>&1 || true')
     lines.append('fi')
@@ -63,6 +78,12 @@ def _prepare_remote_script(deploy, verbose=False):
         else:
             lines.append('    tar xv -C $2 -f - > $manifest')
         lines.append('sed -i "s!^./!$2!" $manifest')
+
+    if undeployall:
+        if not dryrun:
+            lines.append('echo "NOTE: Successfully undeployed $1"')
+        lines.append('done')
+
     # Delete the script itself
     lines.append('rm $0')
     lines.append('')
@@ -149,6 +170,11 @@ def deploy(args, config, basepath, workspace):
 
 def undeploy(args, config, basepath, workspace):
     """Entry point for the devtool 'undeploy' subcommand"""
+    if args.all and args.recipename:
+        raise argparse_oe.ArgumentUsageError('Cannot specify -a/--all with a recipe name', 'undeploy-target')
+    elif not args.recipename and not args.all:
+        raise argparse_oe.ArgumentUsageError('If you don\'t specify a recipe, you must specify -a/--all', 'undeploy-target')
+
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -157,19 +183,10 @@ def undeploy(args, config, basepath, workspace):
 
     args.target = args.target.split(':')[0]
 
-    if args.dry_run:
-        listfile = os.path.join(deploylist_path, '%s.list' % args.recipename)
-        print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
-        ret = subprocess.call('ssh %s %s \'[ -f %s ] && cat %s || true\'' % (extraoptions, args.target, listfile, listfile), shell=True)
-        if ret != 0:
-            raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
-                               'error message')
-        return 0
-
     tmpdir = tempfile.mkdtemp(prefix='devtool')
     try:
         tmpscript = '/tmp/devtool_undeploy.sh'
-        shellscript = _prepare_remote_script(deploy=False)
+        shellscript = _prepare_remote_script(deploy=False, dryrun=args.dry_run, undeployall=args.all)
         # Write out the script to a file
         with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
             f.write(shellscript)
@@ -187,7 +204,8 @@ def undeploy(args, config, basepath, workspace):
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
 
-    logger.info('Successfully undeployed %s' % args.recipename)
+    if not args.all and not args.dry_run:
+        logger.info('Successfully undeployed %s' % args.recipename)
     return 0
 
 
@@ -208,9 +226,10 @@ def register_commands(subparsers, context):
                                             help='Undeploy recipe output files in live target machine',
                                             description='Un-deploys recipe output files previously deployed to a live target machine by devtool deploy-target.',
                                             group='testbuild')
-    parser_undeploy.add_argument('recipename', help='Recipe to undeploy')
+    parser_undeploy.add_argument('recipename', help='Recipe to undeploy (if not using -a/--all)', nargs='?')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
     parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
     parser_undeploy.add_argument('-s', '--show-status', help='Show progress/status output', action='store_true')
+    parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.5.0


