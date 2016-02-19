Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD4BF771C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:55 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773872"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:57 +1300
Message-Id: <a9987cc091b29c5e450c13c72c2568932b80572d.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/14] devtool: deploy-target: write deployed files list to target
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:56 -0000

When running devtool deploy-target, we save a list of deployed files,
and this list is used by devtool undeploy-target (or the next time
deploy-target is run if the list is present, in case any files have been
renamed or deleted since the first time). We were writing this file to
the host, but it makes more sense to write the list to the target
instead, so that if we for example swap in a different board, or switch
hosts, things will work as expected.

In order to do this properly we have to construct a shell script and
ship it over to the target so we can run it. The manifest is written out
to a hidden directory in the root (/.devtool).

Fixes [YOCTO #7908].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/deploy.py | 144 ++++++++++++++++++++++++++++++------------
 1 file changed, 103 insertions(+), 41 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index d742ed3..d2a314b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -1,6 +1,6 @@
 # Development tool - deploy/undeploy command plugin
 #
-# Copyright (C) 2014-2015 Intel Corporation
+# Copyright (C) 2014-2016 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -19,10 +19,57 @@
 import os
 import subprocess
 import logging
+import tempfile
+import shutil
 from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
+deploylist_path = '/.devtool'
+
+def _prepare_remote_script(deploy, verbose=False):
+    """
+    Prepare a shell script for running on the target to
+    deploy/undeploy files. We have to be careful what we put in this
+    script - only commands that are likely to be available on the
+    target are suitable (the target might be constrained, e.g. using
+    busybox rather than bash with coreutils).
+    """
+    lines = []
+    lines.append('#!/bin/sh')
+    lines.append('set -e')
+    lines.append('manifest="%s/$1.list"' % deploylist_path)
+    lines.append('if [ -f $manifest ] ; then')
+    # Read manifest in reverse and delete files / remove empty dirs
+    lines.append('    sed \'1!G;h;$!d\' $manifest | while read file')
+    lines.append('    do')
+    lines.append('        if [ -d $file ] ; then')
+    lines.append('            rmdir $file > /dev/null 2>&1 || true')
+    lines.append('        else')
+    lines.append('            rm $file')
+    lines.append('        fi')
+    lines.append('    done')
+    lines.append('    rm $manifest')
+    if not deploy:
+        # May as well remove all traces
+        lines.append('    rmdir `dirname $manifest` > /dev/null 2>&1 || true')
+    lines.append('fi')
+
+    if deploy:
+        lines.append('mkdir -p `dirname $manifest`')
+        lines.append('mkdir -p $2')
+        if verbose:
+            lines.append('    tar xv -C $2 -f - | tee $manifest')
+        else:
+            lines.append('    tar xv -C $2 -f - > $manifest')
+        lines.append('sed -i "s!^./!$2!" $manifest')
+    # Delete the script itself
+    lines.append('rm $0')
+    lines.append('')
+
+    return '\n'.join(lines)
+
+
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
     import re
@@ -36,9 +83,8 @@ def deploy(args, config, basepath, workspace):
         destdir = '/'
     else:
         args.target = host
-
-    deploy_dir = os.path.join(basepath, 'target_deploy', args.target)
-    deploy_file = os.path.join(deploy_dir, args.recipename + '.list')
+    if not destdir.endswith('/'):
+        destdir += '/'
 
     tinfoil = setup_tinfoil(basepath=basepath)
     try:
@@ -59,74 +105,90 @@ def deploy(args, config, basepath, workspace):
                 print('  %s' % os.path.join(destdir, os.path.relpath(root, recipe_outdir), fn))
         return 0
 
-    if os.path.exists(deploy_file):
-        if undeploy(args, config, basepath, workspace):
-            # Error already shown
-            return 1
 
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
-    if args.show_status:
-        tarextractopts = 'xv'
-    else:
-        tarextractopts = 'x'
+    if not args.show_status:
         extraoptions += ' -q'
-    # We cannot use scp here, because it doesn't preserve symlinks
-    ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'tar %s -C %s -f -\'' % (extraoptions, args.target, tarextractopts, destdir), cwd=recipe_outdir, shell=True)
+
+    # In order to delete previously deployed files and have the manifest file on
+    # the target, we write out a shell script and then copy it to the target
+    # so we can then run it (piping tar output to it).
+    # (We cannot use scp here, because it doesn't preserve symlinks.)
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        tmpscript = '/tmp/devtool_deploy.sh'
+        shellscript = _prepare_remote_script(deploy=True, verbose=args.show_status)
+        # Write out the script to a file
+        with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
+            f.write(shellscript)
+        # Copy it to the target
+        ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        if ret != 0:
+            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
+                            'get a complete error message' % args.target)
+    finally:
+        shutil.rmtree(tmpdir)
+
+    # Now run the script
+    ret = exec_fakeroot(rd, 'tar cf - . | ssh %s %s \'sh %s %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename, destdir), cwd=recipe_outdir, shell=True)
     if ret != 0:
         raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                            'error message')
 
     logger.info('Successfully deployed %s' % recipe_outdir)
 
-    if not os.path.exists(deploy_dir):
-        os.makedirs(deploy_dir)
-
     files_list = []
     for root, _, files in os.walk(recipe_outdir):
         for filename in files:
             filename = os.path.relpath(os.path.join(root, filename), recipe_outdir)
             files_list.append(os.path.join(destdir, filename))
 
-    with open(deploy_file, 'w') as fobj:
-        fobj.write('\n'.join(files_list))
-
     return 0
 
 def undeploy(args, config, basepath, workspace):
     """Entry point for the devtool 'undeploy' subcommand"""
-    deploy_file = os.path.join(basepath, 'target_deploy', args.target, args.recipename + '.list')
-    if not os.path.exists(deploy_file):
-        raise DevtoolError('%s has not been deployed' % args.recipename)
-
-    if args.dry_run:
-        print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
-        with open(deploy_file, 'r') as f:
-            for line in f:
-                print('  %s' % line.rstrip())
-        return 0
-
     extraoptions = ''
     if args.no_host_check:
         extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
     if not args.show_status:
         extraoptions += ' -q'
 
-    ret = subprocess.call("scp %s %s %s:/tmp" % (extraoptions, deploy_file, args.target), shell=True)
-    if ret != 0:
-        raise DevtoolError('Failed to copy file list to %s - rerun with -s to '
-                           'get a complete error message' % args.target)
+    args.target = args.target.split(':')[0]
 
-    ret = subprocess.call("ssh %s %s 'xargs -n1 rm -f </tmp/%s'" % (extraoptions, args.target, os.path.basename(deploy_file)), shell=True)
-    if ret == 0:
-        logger.info('Successfully undeployed %s' % args.recipename)
-        os.remove(deploy_file)
-    else:
+    if args.dry_run:
+        listfile = os.path.join(deploylist_path, '%s.list' % args.recipename)
+        print('Previously deployed files to be un-deployed for %s on target %s:' % (args.recipename, args.target))
+        ret = subprocess.call('ssh %s %s \'[ -f %s ] && cat %s || true\'' % (extraoptions, args.target, listfile, listfile), shell=True)
+        if ret != 0:
+            raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
+                               'error message')
+        return 0
+
+    tmpdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        tmpscript = '/tmp/devtool_undeploy.sh'
+        shellscript = _prepare_remote_script(deploy=False)
+        # Write out the script to a file
+        with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') as f:
+            f.write(shellscript)
+        # Copy it to the target
+        ret = subprocess.call("scp %s %s/* %s:%s" % (extraoptions, tmpdir, args.target, os.path.dirname(tmpscript)), shell=True)
+        if ret != 0:
+            raise DevtoolError('Failed to copy script to %s - rerun with -s to '
+                                'get a complete error message' % args.target)
+    finally:
+        shutil.rmtree(tmpdir)
+
+    # Now run the script
+    ret = subprocess.call('ssh %s %s \'sh %s %s\'' % (extraoptions, args.target, tmpscript, args.recipename), shell=True)
+    if ret != 0:
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
 
-    return ret
+    logger.info('Successfully undeployed %s' % args.recipename)
+    return 0
 
 
 def register_commands(subparsers, context):
-- 
2.5.0


