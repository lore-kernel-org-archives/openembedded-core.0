Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 626D1755C1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2018 18:11:48 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v83-v6so9267780itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jun 2018 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ftpyivPF+TGIlwOPIKHhAnO3zc27AJ/HKGbiJzErA54=;
	b=mdIIjmkDPC7DRdZE3IxqZUHW/gbVUTrm8KfP3n/nT2dDu9vGPh/XbBrqT7cZdiIXwm
	Y87AuF81TFjD9i+GE8BYaXk9j2dkN3ujZt1xSmfii+tdfHKAt7L0dco7CSQw1VYmi37h
	ftmhmuVSTjvnM0gcCyELD0JBaGI+C1JUHHbDmcYOzfUgpJmwoi65J3szqCklUxO6Dqz2
	YYiKfAbLLdOoNfOSuiEknKSlua2An7/TY4/HD12E9/34u8u1U4757hiGb8qvtk2L1p7S
	vYeq90wjNZi3muNtNFJI8IcdoCMJp072EkCQJ1Y6/jF2kP7myCzBuvTUyky0dXW8TBL2
	xciw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ftpyivPF+TGIlwOPIKHhAnO3zc27AJ/HKGbiJzErA54=;
	b=VtWeVdX6va/VGlJqVN8xa9LTCTiC0e0Y9ZTVMHc4Et30Pg1es7lfKiFx3czSY4nGDp
	+xWpjTtdygQRif6qooSaEt5gZE4dnV0X8ZmF86+/v2xExIhdwRkrpIOUZAtKmnBzogoH
	obghu3BmAEdYRPutLokVUecBSpXSz3M3aiG9AJ+eIrqFBoMNmi0NeLGixmm9KL58mQDo
	Z66rOVuaPcusjiqqLse1nUV2/U9/08n1sGTyUVSuiF8nojAl9LZdDm4D38ZC5DzqEjgh
	dgxQ7ujYrRTeAV2IvAqGlfcZ7j86ezbUpMTzPbeEElI3CT/OhgcOhZm+OHu7RYNXLaV2
	tDgA==
X-Gm-Message-State: APt69E09MApnxvMLrH76dYtZRtF5NzOar8Z3CeXww3qfeCNd4e08lhbf
	yuHOj3tkaeue8F14BihUbJmwCjJy
X-Google-Smtp-Source: ADUXVKLg3Dyc6Ie3FGUX/ezhYt8mMl9b+PM0HVUoWONIcGhPoxcuN9L+6GJKTAz8eJnQ63Uw8106Yw==
X-Received: by 2002:a24:c887:: with SMTP id
	w129-v6mr3480676itf.122.1528308708955; 
	Wed, 06 Jun 2018 11:11:48 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	z2-v6sm2153173ita.37.2018.06.06.11.11.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Jun 2018 11:11:47 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2018 14:11:35 -0400
Message-Id: <20180606181135.18490-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Subject: [PATCH v2] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Wed, 06 Jun 2018 18:11:48 -0000

Instead of installing an entire recipe's build output (i.e. ${D}), allow the
user to optionally specify the name of one package at a time from said recipe
to be installed (i.e. ${PKGDEST}/<package>).

NOTE: mixing "deploy-target" commands that have this new --package option and
"deploy-target" commands without --package against the same recipe is not
ideal.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
updates since v1:
 - The behaviour of deploy-target is to start by trying to remove any previous
   such deploy-targets with the same deploy-name which have already been
   deployed on the target. That meant that, with v1, if someone tried to
   deploy two packages from the same recipe, the second deployment would
   undeploy the first deployment, then deploy the second. By incorporating the
   package name into the on-target deploy-name, multiple such deployments can
   exist at the same time from the same recipe.
---
 scripts/lib/devtool/deploy.py | 42 ++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 52e261d560..0bd2a9f63b 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -169,11 +169,20 @@ def deploy(args, config, basepath, workspace):
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
-        recipe_outdir = rd.getVar('D')
+        if args.package:
+            recipe_outdir = os.path.join(rd.getVar('PKGDEST'), args.package)
+        else:
+            recipe_outdir = rd.getVar('D')
         if not os.path.exists(recipe_outdir) or not os.listdir(recipe_outdir):
-            raise DevtoolError('No files to deploy - have you built the %s '
-                            'recipe? If so, the install step has not installed '
-                            'any files.' % args.recipename)
+            if args.package:
+                raise DevtoolError('No files to deploy - have you built the %s '
+                                'package of the %s recipe? If so, the install '
+                                'step has not installed any files.'
+                                % (args.package, args.recipename))
+            else:
+                raise DevtoolError('No files to deploy - have you built the %s '
+                                'recipe? If so, the install step has not installed '
+                                'any files.' % args.recipename)
 
         if args.strip and not args.dry_run:
             # Fakeroot copy to new destination
@@ -246,7 +255,10 @@ def deploy(args, config, basepath, workspace):
             shutil.rmtree(tmpdir)
 
         # Now run the script
-        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
+        filename = args.recipename
+        if args.package:
+            filename = filename + '.' + args.package
+        ret = exec_fakeroot(rd, 'tar cf - . | ssh  %s %s %s \'sh %s %s %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, filename, destdir, tmpfilelist), cwd=recipe_outdir, shell=True)
         if ret != 0:
             raise DevtoolError('Deploy failed - rerun with -s to get a complete '
                             'error message')
@@ -300,13 +312,19 @@ def undeploy(args, config, basepath, workspace):
         shutil.rmtree(tmpdir)
 
     # Now run the script
-    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, args.recipename), shell=True)
+    filename = args.recipename
+    if args.package:
+        filename = filename + '.' + args.package
+    ret = subprocess.call('ssh %s %s %s \'sh %s %s\'' % (ssh_port, extraoptions, args.target, tmpscript, filename), shell=True)
     if ret != 0:
         raise DevtoolError('Undeploy failed - rerun with -s to get a complete '
                            'error message')
 
     if not args.all and not args.dry_run:
-        logger.info('Successfully undeployed %s' % args.recipename)
+        if args.package:
+            logger.info('Successfully undeployed %s' % args.package)
+        else:
+            logger.info('Successfully undeployed %s' % args.recipename)
     return 0
 
 
@@ -314,8 +332,8 @@ def register_commands(subparsers, context):
     """Register devtool subcommands from the deploy plugin"""
 
     parser_deploy = subparsers.add_parser('deploy-target',
-                                          help='Deploy recipe output files to live target machine',
-                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
+                                          help='Deploy build output to a live target machine',
+                                          description='Deploys either the full recipe\'s build output (i.e. the output of the do_install task) or a package of a recipe to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the specified item itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
                                           group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
@@ -325,6 +343,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
+    parser_deploy.add_argument('--package', help='Specify a recipe\'s package to deploy', dest='package')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
@@ -337,8 +356,8 @@ def register_commands(subparsers, context):
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
-                                            help='Undeploy recipe output files in live target machine',
-                                            description='Un-deploys recipe output files previously deployed to a live target machine by devtool deploy-target.',
+                                            help='Undeploy output files from a live target machine',
+                                            description='Un-deploys output files previously deployed to a live target machine by devtool deploy-target.',
                                             group='testbuild')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy (if not using -a/--all)', nargs='?')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
@@ -347,4 +366,5 @@ def register_commands(subparsers, context):
     parser_undeploy.add_argument('-a', '--all', help='Undeploy all recipes deployed on the target', action='store_true')
     parser_undeploy.add_argument('-n', '--dry-run', help='List files to be undeployed only', action='store_true')
     parser_undeploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
+    parser_undeploy.add_argument('--package', help='Specify a recipe\'s package to undeploy', dest='package')
     parser_undeploy.set_defaults(func=undeploy)
-- 
2.17.0.582.gccdcbd54c


