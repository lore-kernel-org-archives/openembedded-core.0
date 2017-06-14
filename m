Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 695C877E9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 06:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8B832184CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id st4ldw5yfF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id AD426184D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95DFB1E07C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AEF41E07B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id 7F6B830B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:25:25 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Wed, 14 Jun 2017 08:25:25 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jun 2017 08:24:40 +0200
Message-ID: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Wed, 14 Jun 2017 06:25:34 -0000
Content-Type: text/plain

New devtool deploy-target option --strip which enables deploying
stripped binaries, saving some space on target.

* Copies the files of ${D} into a new directory and strips them in place
* Based on sysroot_strip from staging.bbclass
* Added devtool.conf option "strip" for changing default behavior
* Added .ko strip support compared to original function sysroot_strip

Config example:
[Deploy]
strip = true

[YOCTO #11227]

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 scripts/lib/devtool/deploy.py | 134 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 04c34cb..9547018 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -16,12 +16,16 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool plugin containing the deploy subcommands"""
 
+import logging
 import os
+import shutil
 import subprocess
-import logging
 import tempfile
-import shutil
+
+import bb.utils
 import argparse_oe
+import oe
+
 from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
@@ -140,9 +144,114 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
     return '\n'.join(lines)
 
 
+def strip_execs(dstdir, strip_cmd, libdir, base_libdir):
+    """
+    Strip executable code (like executables, shared libraries, kernel modules) _in_place_
+    - Based on sysroot_strip in staging.bbclass
+    :param dstdir: directory in which to strip files
+    :param strip_cmd:
+    """
+    import stat, errno, mmap
+
+    # Detect .ko module by searching for "vermagic=" string
+    def is_kernel_module(path):
+        with open(path) as f:
+            return mmap.mmap(f.fileno(), 0, prot=mmap.PROT_READ).find(b"vermagic=") >= 0
+
+    # Return type (bits):
+    # 0 - not elf
+    # 1 - ELF
+    # 2 - stripped
+    # 4 - executable
+    # 8 - shared library
+    # 16 - kernel module
+    def is_elf(path):
+        exec_type = 0
+        ret, result = oe.utils.getstatusoutput(
+            "file \"%s\"" % path.replace("\"", "\\\""))
+
+        if ret:
+            logger.error("split_and_strip_files: 'file %s' failed", path)
+            return exec_type
+
+        # Not stripped
+        if "ELF" in result:
+            exec_type |= 1
+            if "not stripped" not in result:
+                exec_type |= 2
+            if "executable" in result:
+                exec_type |= 4
+            if "shared" in result:
+                exec_type |= 8
+            if "relocatable" in result and is_kernel_module(path):
+                exec_type |= 16
+        return exec_type
+
+    elffiles = {}
+    inodes = {}
+    libdir = os.path.abspath(os.path.join(dstdir, libdir.lstrip(os.sep)))
+    base_libdir = os.path.abspath(os.path.join(dstdir, base_libdir.lstrip(os.sep)))
+    exec_mask = stat.S_IXUSR | stat.S_IXGRP | stat.S_IXOTH
+    #
+    # First lets figure out all of the files we may have to process
+    #
+    for root, dirs, files in os.walk(dstdir):
+        for f in files:
+            file = os.path.join(root, f)
+
+            try:
+                ltarget = oe.path.realpath(file, dstdir, False)
+                s = os.lstat(ltarget)
+            except OSError as e:
+                (err, strerror) = e.args
+                if err != errno.ENOENT:
+                    raise
+                # Skip broken symlinks
+                continue
+            if not s:
+                continue
+            # Check its an excutable
+            if s[stat.ST_MODE] & exec_mask \
+                    or ((file.startswith(libdir) or file.startswith(base_libdir)) and ".so" in f) \
+                    or file.endswith('.ko'):
+                # If it's a symlink, and points to an ELF file, we capture the readlink target
+                if os.path.islink(file):
+                    continue
+
+                # It's a file (or hardlink), not a link
+                # ...but is it ELF, and is it already stripped?
+                elf_file = is_elf(file)
+                if elf_file & 1:
+                    if elf_file & 2:
+                        logger.warn(
+                            "File '%s' is unexpectedly already stripped.",
+                            file[len(dstdir):])
+                        continue
+
+                    if s.st_ino in inodes:
+                        os.unlink(file)
+                        os.link(inodes[s.st_ino], file)
+                    else:
+                        # break hardlinks so that we do not strip the original.
+                        inodes[s.st_ino] = file
+                        # break hardlink
+                        bb.utils.copyfile(file, file)
+                        elffiles[file] = elf_file
+
+    #
+    # Now strip them (in parallel)
+    #
+    sfiles = []
+    for file in elffiles:
+        elf_file = int(elffiles[file])
+        logger.debug("Strip %s",file)
+        sfiles.append((file, elf_file, strip_cmd))
+
+    oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
+
+
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
-    import re
     import math
     import oe.recipeutils
 
@@ -170,6 +279,17 @@ def deploy(args, config, basepath, workspace):
                             'recipe? If so, the install step has not installed '
                             'any files.' % args.recipename)
 
+        if args.strip and not args.dry_run:
+            # Fakeroot copy to new destination
+            srcdir = recipe_outdir
+            recipe_outdir = os.path.join(rd.getVar('WORKDIR', True), 'deploy-target-stripped')
+            if os.path.isdir(recipe_outdir):
+                bb.utils.remove(recipe_outdir, True)
+            exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+            os.environ['PATH'] = ':'.join([os.environ['PATH'], rd.getVar('PATH', True) or ''])
+            strip_execs(recipe_outdir, rd.getVar('STRIP', True), rd.getVar('libdir', True),
+                        rd.getVar('base_libdir', True))
+
         filelist = []
         ftotalsize = 0
         for root, _, files in os.walk(recipe_outdir):
@@ -189,7 +309,6 @@ def deploy(args, config, basepath, workspace):
                 print('  %s' % item)
             return 0
 
-
         extraoptions = ''
         if args.no_host_check:
             extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -301,6 +420,7 @@ def undeploy(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the deploy plugin"""
+
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
                                           description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
@@ -313,6 +433,12 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_deploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
+    parser_deploy.add_argument('-S', '--strip',
+                               help='Strip executables prior to deploying (default: %(default)s). '
+                                    'The default value of this option can be controlled by setting the strip option in the [Deploy] section to True or False.',
+                               default=oe.types.boolean(context.config.get('Deploy', 'strip', default='0')),
+                               action='store_true')
+    parser_deploy.add_argument('--no-strip', help='Do not strip executables prior to deploy', dest='strip', action='store_false')
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
-- 
2.1.4


