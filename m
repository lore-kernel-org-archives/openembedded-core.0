Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1672731C7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979140"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:10 +1300
Message-Id: <c2912d40ed94b0e53b39c396912a2f77d56a6f7c.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 17/26] devtool: add: figure out recipe name from recipetool
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:01 -0000

recipetool create now has all the logic in it for auto-detecting the
name and version, and using those in the file name - so we can make the
name an optional parameter for devtool add and we pick up the file name
that recipetool has used after the fact.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 127 ++++++++++++++++++++++++++++------------
 1 file changed, 90 insertions(+), 37 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b129db3..6cdd44c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -37,25 +37,39 @@ def add(args, config, basepath, workspace):
     import bb
     import oe.recipeutils
 
-    if args.recipename in workspace:
-        raise DevtoolError("recipe %s is already in your workspace" %
-                            args.recipename)
+    if args.recipename and not args.srctree:
+        # These are positional arguments, but because we're nice, allow
+        # specifying source tree without name if we can detect that that
+        # is what the user meant
+        if os.sep in args.recipename:
+            args.srctree = args.recipename
+            args.recipename = None
+        elif os.path.isdir(args.recipename):
+            logger.warn('Ambiguous argument %s - assuming you mean it to be the recipe name')
 
-    reason = oe.recipeutils.validate_pn(args.recipename)
-    if reason:
-        raise DevtoolError(reason)
+    if args.recipename:
+        if args.recipename in workspace:
+            raise DevtoolError("recipe %s is already in your workspace" %
+                               args.recipename)
+        reason = oe.recipeutils.validate_pn(args.recipename)
+        if reason:
+            raise DevtoolError(reason)
 
-    # FIXME this ought to be in validate_pn but we're using that in other contexts
-    if '/' in args.recipename:
-        raise DevtoolError('"/" is not a valid character in recipe names')
+        # FIXME this ought to be in validate_pn but we're using that in other contexts
+        if '/' in args.recipename:
+            raise DevtoolError('"/" is not a valid character in recipe names')
 
     if args.srctree:
         srctree = os.path.abspath(args.srctree)
+        srctreeparent = None
+        tmpsrcdir = None
     else:
-        srctree = get_default_srctree(config, args.recipename)
-        logger.info('Using default source tree path %s' % srctree)
+        srctree = None
+        srctreeparent = get_default_srctree(config)
+        bb.utils.mkdirhier(srctreeparent)
+        tmpsrcdir = tempfile.mkdtemp(prefix='devtoolsrc', dir=srctreeparent)
 
-    if os.path.exists(srctree):
+    if srctree and os.path.exists(srctree):
         if args.fetch:
             if not os.path.isdir(srctree):
                 raise DevtoolError("Cannot fetch into source tree path %s as "
@@ -69,33 +83,21 @@ def add(args, config, basepath, workspace):
         if args.srctree:
             raise DevtoolError("Specified source tree %s could not be found" %
                                args.srctree)
-        else:
+        elif srctree:
             raise DevtoolError("No source tree exists at default path %s - "
                                "either create and populate this directory, "
                                "or specify a path to a source tree, or use "
                                "the -f/--fetch option to fetch source code "
                                "and extract it to the source directory" %
                                srctree)
+        else:
+            raise DevtoolError("You must either specify a source tree "
+                               "or -f to fetch source")
 
-    recipedir = os.path.join(config.workspace_path, 'recipes', args.recipename)
-    bb.utils.mkdirhier(recipedir)
-    rfv = None
     if args.version:
         if '_' in args.version or ' ' in args.version:
             raise DevtoolError('Invalid version string "%s"' % args.version)
-        rfv = args.version
-    if args.fetch:
-        if args.fetch.startswith('git://'):
-            rfv = 'git'
-        elif args.fetch.startswith('svn://'):
-            rfv = 'svn'
-        elif args.fetch.startswith('hg://'):
-            rfv = 'hg'
-    if rfv:
-        bp = "%s_%s" % (args.recipename, rfv)
-    else:
-        bp = args.recipename
-    recipefile = os.path.join(recipedir, "%s.bb" % bp)
+
     if args.color == 'auto' and sys.stdout.isatty():
         color = 'always'
     else:
@@ -103,19 +105,71 @@ def add(args, config, basepath, workspace):
     extracmdopts = ''
     if args.fetch:
         source = args.fetch
-        extracmdopts = '-x %s' % srctree
+        if srctree:
+            extracmdopts += ' -x %s' % srctree
+        else:
+            extracmdopts += ' -x %s' % tmpsrcdir
     else:
         source = srctree
+    if args.recipename:
+        extracmdopts += ' -N %s' % args.recipename
     if args.version:
         extracmdopts += ' -V %s' % args.version
     if args.binary:
         extracmdopts += ' -b'
+
+    tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
-        stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
-    except bb.process.ExecutionError as e:
-        raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        try:
+            stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
+        except bb.process.ExecutionError as e:
+            if e.exitcode == 15:
+                raise DevtoolError('Unable to auto-determine name from source tree, please specify it with -N/--name')
+            else:
+                raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+
+        recipes = glob.glob(os.path.join(tempdir, '*.bb'))
+        if recipes:
+            recipename = os.path.splitext(os.path.basename(recipes[0]))[0].split('_')[0]
+            if recipename in workspace:
+                raise DevtoolError('A recipe with the same name as the one being created (%s) already exists in your workspace' % recipename)
+            recipedir = os.path.join(config.workspace_path, 'recipes', recipename)
+            bb.utils.mkdirhier(recipedir)
+            recipefile = os.path.join(recipedir, os.path.basename(recipes[0]))
+            appendfile = recipe_to_append(recipefile, config)
+            if os.path.exists(appendfile):
+                # This shouldn't be possible, but just in case
+                raise DevtoolError('A recipe with the same name as the one being created already exists in your workspace')
+            if os.path.exists(recipefile):
+                raise DevtoolError('A recipe file %s already exists in your workspace; this shouldn\'t be there - please delete it before continuing' % recipefile)
+            if tmpsrcdir:
+                srctree = os.path.join(srctreeparent, recipename)
+                if os.path.exists(tmpsrcdir):
+                    if os.path.exists(srctree):
+                        if os.path.isdir(srctree):
+                            try:
+                                os.rmdir(srctree)
+                            except OSError as e:
+                                if e.errno == errno.ENOTEMPTY:
+                                    raise DevtoolError('Source tree path %s already exists and is not empty' % srctree)
+                                else:
+                                    raise
+                        else:
+                            raise DevtoolError('Source tree path %s already exists and is not a directory' % srctree)
+                    logger.info('Using default source tree path %s' % srctree)
+                    shutil.move(tmpsrcdir, srctree)
+                else:
+                    raise DevtoolError('Couldn\'t find source tree created by recipetool')
+            bb.utils.mkdirhier(recipedir)
+            shutil.move(recipes[0], recipefile)
+        else:
+            raise DevtoolError('Command \'%s\' did not create any recipe file:\n%s' % (e.command, e.stdout))
+    finally:
+        if tmpsrcdir and os.path.exists(tmpsrcdir):
+            shutil.rmtree(tmpsrcdir)
+        shutil.rmtree(tempdir)
 
-    _add_md5(config, args.recipename, recipefile)
+    _add_md5(config, recipename, recipefile)
 
     if args.fetch and not args.no_git:
         setup_git_repo(srctree, args.version, 'devtool')
@@ -130,7 +184,6 @@ def add(args, config, basepath, workspace):
     if not rd:
         return 1
 
-    appendfile = recipe_to_append(recipefile, config)
     bb.utils.mkdirhier(os.path.dirname(appendfile))
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
@@ -148,7 +201,7 @@ def add(args, config, basepath, workspace):
             f.write('    rm -f ${D}/singletask.lock\n')
             f.write('}\n')
 
-    _add_md5(config, args.recipename, appendfile)
+    _add_md5(config, recipename, appendfile)
 
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
@@ -1195,7 +1248,7 @@ def register_commands(subparsers, context):
     defsrctree = get_default_srctree(context.config)
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
                                        description='Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.')
-    parser_add.add_argument('recipename', help='Name for new recipe to add (just name - no version, path or extension)')
+    parser_add.add_argument('recipename', nargs='?', help='Name for new recipe to add (just name - no version, path or extension). If not specified, will attempt to auto-detect it.')
     parser_add.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     group = parser_add.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
-- 
2.5.0


