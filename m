Return-Path: <tobias.hagelborn@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B2D6A7841E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 11:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E3A1C18970
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id dT5ufCsK1otE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 586E018980
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 453201A06B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A7731A067
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 2ED601DA6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 13:32:52 +0200 (CEST)
Received: from lnxtobiasha.se.axis.com (10.0.5.60) by XBOX02.axis.com
	(10.0.5.16) with Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 25 Aug 2017 13:32:52 +0200
From: Tobias Hagelborn <tobias.hagelborn@axis.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 13:32:38 +0200
Message-ID: <1503660758-10687-3-git-send-email-tobiasha@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1503660758-10687-1-git-send-email-tobiasha@axis.com>
References: <1503660758-10687-1-git-send-email-tobiasha@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX02.axis.com (10.0.5.16)
X-TM-AS-GCONF: 00
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: [PATCH v6 3/3] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Fri, 25 Aug 2017 11:32:53 -0000
Content-Type: text/plain

New devtool deploy-target option --strip which enables deploying
stripped binaries, saving some space on target.

* Copies the files of ${D} into a new directory and strips them in place
* Used oe.package.strip_execs for stripping directory
* Added devtool.conf option "strip" for changing default behavior

Config example:
[Deploy]
strip = true

[YOCTO #11227]

Signed-off-by: Tobias Hagelborn <tobiasha@axis.com>
---
 scripts/lib/devtool/deploy.py | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 04c34cb..7c57174 100644
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
+import oe.types
+
 from devtool import exec_fakeroot, setup_tinfoil, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
@@ -140,11 +144,12 @@ def _prepare_remote_script(deploy, verbose=False, dryrun=False, undeployall=Fals
     return '\n'.join(lines)
 
 
+
 def deploy(args, config, basepath, workspace):
     """Entry point for the devtool 'deploy' subcommand"""
-    import re
     import math
     import oe.recipeutils
+    import oe.package
 
     check_workspace_recipe(workspace, args.recipename, checksrc=False)
 
@@ -170,6 +175,17 @@ def deploy(args, config, basepath, workspace):
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
+            oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP', True), rd.getVar('libdir', True),
+                        rd.getVar('base_libdir', True))
+
         filelist = []
         ftotalsize = 0
         for root, _, files in os.walk(recipe_outdir):
@@ -189,7 +205,6 @@ def deploy(args, config, basepath, workspace):
                 print('  %s' % item)
             return 0
 
-
         extraoptions = ''
         if args.no_host_check:
             extraoptions += '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
@@ -301,6 +316,7 @@ def undeploy(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the deploy plugin"""
+
     parser_deploy = subparsers.add_parser('deploy-target',
                                           help='Deploy recipe output files to live target machine',
                                           description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
@@ -313,6 +329,15 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_deploy.add_argument('-P', '--port', default='22', help='Port to use for connection to the target')
+
+    strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
+    strip_opts.add_argument('-S', '--strip',
+                               help='Strip executables prior to deploying (default: %(default)s). '
+                                    'The default value of this option can be controlled by setting the strip option in the [Deploy] section to True or False.',
+                               default=oe.types.boolean(context.config.get('Deploy', 'strip', default='0')),
+                               action='store_true')
+    strip_opts.add_argument('--no-strip', help='Do not strip executables prior to deploy', dest='strip', action='store_false')
+
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
-- 
2.1.4


