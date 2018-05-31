Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CB70574F72
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 20:07:11 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id q72-v6so29597654itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=C5JtKoE4JAVsG7t6kLYMWpdB2Q4xWtwBC2O1QcSyeeQ=;
	b=aL8cbSA2DcNiiVfs6DD9rbq3HpvmhL4e2CeQDucgTLlAfoclLQNKZ4QpHqkjH3r5pn
	QAeYHj9K9z1Ac6/wnpkVWMhB7byIE78D1eL/BqLVnKguPepl8Kn4iKERWzHLXcJfkjAF
	Iha1S3kgyH9Q6U28bjLBorbV6JjXP1mivy3rbMMjYfmgwiebKRYnYMYBh3UTg49N5OMH
	LrI7KwaNVwcQLG3Qwca8Ps0d+oyzjXwtpz3gxde1pmifPI7UVmVImkhnhEu2S5Ghrgdn
	L/2zRRMmh+Fq+Ls7t8VmtmjVprsoaVOKydBs3C4CN+QYkMEedXCgP3P+ICUHc+a7jXRM
	Gu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=C5JtKoE4JAVsG7t6kLYMWpdB2Q4xWtwBC2O1QcSyeeQ=;
	b=ItWdzGzQfaj1mMXl7QAwP/A0IPa39wLhcQ1iAtvb5HTVInzFn1BgYPpAoNH7kWt6f7
	hd2/CekjbcKBjcpQMUjXTnJrojk0da+n/OLt2vET3ZOuFYPGjz6XJMtYt3o551hcAeVq
	f1nXWKkJiWXJF9eTUWTLgVuxtGeoWdAfuyZTk2j1AJxXkDA6ZvnUL83OIEoY7H+75vkI
	8fMZBlatovakto1ceZJNZX5bHqounJ3JDYEgAHMq3dm8cnOPW5yV0ZhLP/P646vr2I4i
	XaOOLGZxGtTqvIPFkMO/MoFrxpBNKReTo+ogljMwbskx7v3sqXZqp9sbAO5aBW9K5ysG
	E2Uw==
X-Gm-Message-State: APt69E0L2QBTd8/Fpo3AW0d1t4tT3olaRt+yajR2/sIftFyUJoNhxWIo
	9hq+oFYHh3MpXqvGW40XGMtyka5H
X-Google-Smtp-Source: ADUXVKK1tPexEqIBtK2eiJn8pbBC251/p3aAqzFQDEyUmdDPC88JruMKp1BlJeiIw2qc4wrdsOSdsA==
X-Received: by 2002:a24:c887:: with SMTP id
	w129-v6mr1373733itf.122.1527797232316; 
	Thu, 31 May 2018 13:07:12 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	o1-v6sm101869ite.37.2018.05.31.13.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 May 2018 13:07:11 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 May 2018 16:06:59 -0400
Message-Id: <20180531200659.28877-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
Cc: paul.eggleton@linux.intel.com
Subject: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Thu, 31 May 2018 20:07:12 -0000

Instead of installing an entire recipe's build output (i.e. ${D}), allow the
user to optionally specify a package from said recipe to be installed
exclusively (i.e. ${PKGDEST}/<package>).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 scripts/lib/devtool/deploy.py | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 52e261d560..c022757519 100644
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
@@ -314,8 +323,8 @@ def register_commands(subparsers, context):
     """Register devtool subcommands from the deploy plugin"""
 
     parser_deploy = subparsers.add_parser('deploy-target',
-                                          help='Deploy recipe output files to live target machine',
-                                          description='Deploys a recipe\'s build output (i.e. the output of the do_install task) to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the recipe itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
+                                          help='Deploy build output to a live target machine',
+                                          description='Deploys either the full recipe\'s build output (i.e. the output of the do_install task) or a package of a recipe to a live target machine over ssh. By default, any existing files will be preserved instead of being overwritten and will be restored if you run devtool undeploy-target. Note: this only deploys the specified item itself and not any runtime dependencies, so it is assumed that those have been installed on the target beforehand.',
                                           group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
@@ -325,6 +334,7 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-p', '--no-preserve', help='Do not preserve existing files', action='store_true')
     parser_deploy.add_argument('--no-check-space', help='Do not check for available space before deploying', action='store_true')
     parser_deploy.add_argument('-P', '--port', help='Specify port to use for connection to the target')
+    parser_deploy.add_argument('--package', help='Specify a recipe\'s package to deploy', dest='package')
 
     strip_opts = parser_deploy.add_mutually_exclusive_group(required=False)
     strip_opts.add_argument('-S', '--strip',
@@ -337,8 +347,8 @@ def register_commands(subparsers, context):
     parser_deploy.set_defaults(func=deploy)
 
     parser_undeploy = subparsers.add_parser('undeploy-target',
-                                            help='Undeploy recipe output files in live target machine',
-                                            description='Un-deploys recipe output files previously deployed to a live target machine by devtool deploy-target.',
+                                            help='Undeploy output files from a live target machine',
+                                            description='Un-deploys output files previously deployed to a live target machine by devtool deploy-target.',
                                             group='testbuild')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy (if not using -a/--all)', nargs='?')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
-- 
2.17.0.582.gccdcbd54c


