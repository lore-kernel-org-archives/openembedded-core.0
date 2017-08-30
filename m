Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2E848783A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Aug 2017 23:55:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2017 16:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,450,1498546800"; d="scan'208";a="146494492"
Received: from ekooi-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.249])
	by fmsmga006.fm.intel.com with ESMTP; 30 Aug 2017 16:55:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 11:54:11 +1200
Message-Id: <9e8252c3af5778736faf4abb4e2810db5bcb86c1.1504137086.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1504137086.git.paul.eggleton@linux.intel.com>
References: <cover.1504137086.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/13] devtool: add: add explicit srcrev/branch options
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
X-List-Received-Date: Wed, 30 Aug 2017 23:55:19 -0000

At the moment when fetching source from a git repository you have to
know that you can specify the revision and branch in the URL with
';rev=' and ';branch=' respectively, and you can also get thrown off by
the shell splitting on the ; character if you forget to surround the URL
in quotes. Add explicit -S/--srcrev and -B/--srcbranch options
(consistent with devtool upgrade) to make this easier for the user to
discover and use. (The rev and branch URL parameters will continue to
work, however.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  | 17 +++++++++++++++--
 scripts/lib/recipetool/create.py | 25 ++++++++++++++++++++++---
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d79ebf1..174cc86 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1,6 +1,6 @@
 # Development tool - standard commands plugin
 #
-# Copyright (C) 2014-2016 Intel Corporation
+# Copyright (C) 2014-2017 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -66,6 +66,12 @@ def add(args, config, basepath, workspace):
         elif os.path.isdir(args.recipename):
             logger.warn('Ambiguous argument "%s" - assuming you mean it to be the recipe name' % args.recipename)
 
+    if not args.fetchuri:
+        if args.srcrev:
+            raise DevtoolError('The -S/--srcrev option is only valid when fetching from an SCM repository')
+        if args.srcbranch:
+            raise DevtoolError('The -B/--srcbranch option is only valid when fetching from an SCM repository')
+
     if args.srctree and os.path.isfile(args.srctree):
         args.fetchuri = 'file://' + os.path.abspath(args.srctree)
         args.srctree = ''
@@ -151,6 +157,10 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' --fetch-dev'
     if args.mirrors:
         extracmdopts += ' --mirrors'
+    if args.srcrev:
+        extracmdopts += ' --srcrev %s' % args.srcrev
+    if args.srcbranch:
+        extracmdopts += ' --srcbranch %s' % args.srcbranch
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -1809,7 +1819,10 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--fetch-dev', help='For npm, also fetch devDependencies', action="store_true")
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
-    parser_add.add_argument('--autorev', '-a', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
+    group = parser_add.add_mutually_exclusive_group()
+    group.add_argument('--srcrev', '-S', help='Source revision to fetch if fetching from an SCM such as git (default latest)')
+    group.add_argument('--autorev', '-a', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
+    parser_add.add_argument('--srcbranch', '-B', help='Branch in source repository if fetching from an SCM such as git (default master)')
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 2601145..8346336 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1,6 +1,6 @@
 # Recipe creation tool - create command plugin
 #
-# Copyright (C) 2014-2016 Intel Corporation
+# Copyright (C) 2014-2017 Intel Corporation
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 2 as
@@ -440,14 +440,30 @@ def create_recipe(args):
         rev_re = re.compile(';rev=([^;]+)')
         res = rev_re.search(srcuri)
         if res:
+            if args.srcrev:
+                logger.error('rev= parameter and -S/--srcrev option cannot both be specified - use one or the other')
+                sys.exit(1)
+            if args.autorev:
+                logger.error('rev= parameter and -a/--autorev option cannot both be specified - use one or the other')
+                sys.exit(1)
             srcrev = res.group(1)
             srcuri = rev_re.sub('', srcuri)
+        elif args.srcrev:
+            srcrev = args.srcrev
 
         # Check whether users provides any branch info in fetchuri.
         # If true, we will skip all branch checking process to honor all user's input.
         scheme, network, path, user, passwd, params = bb.fetch2.decodeurl(fetchuri)
         srcbranch = params.get('branch')
+        if args.srcbranch:
+            if srcbranch:
+                logger.error('branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other')
+                sys.exit(1)
+            srcbranch = args.srcbranch
         nobranch = params.get('nobranch')
+        if nobranch and srcbranch:
+            logger.error('nobranch= cannot be used if you specify a branch')
+            sys.exit(1)
         tag = params.get('tag')
         if not srcbranch and not nobranch and srcrev != '${AUTOREV}':
             # Append nobranch=1 in the following conditions:
@@ -523,7 +539,7 @@ def create_recipe(args):
             else:
                 # If get_branch contains more than one objects, then display error and exit.
                 mbrch = '\n  ' + '\n  '.join(get_branch)
-                logger.error('Revision %s was found on multiple branches: %s\nPlease provide the correct branch in the source URL with ;branch=<branch> (and ensure you use quotes around the URL to avoid the shell interpreting the ";")' % (srcrev, mbrch))
+                logger.error('Revision %s was found on multiple branches: %s\nPlease provide the correct branch with -B/--srcbranch' % (srcrev, mbrch))
                 sys.exit(1)
 
         # Since we might have a value in srcbranch, we need to
@@ -1277,7 +1293,10 @@ def register_commands(subparsers):
     parser_create.add_argument('-b', '--binary', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure)', action='store_true')
     parser_create.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
-    parser_create.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
+    group = parser_create.add_mutually_exclusive_group()
+    group.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
+    group.add_argument('-S', '--srcrev', help='Source revision to fetch if fetching from an SCM such as git (default latest)')
+    parser_create.add_argument('-B', '--srcbranch', help='Branch in source repository if fetching from an SCM such as git (default master)')
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
     parser_create.add_argument('--fetch-dev', action="store_true", help='For npm, also fetch devDependencies')
     parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
-- 
2.9.5


