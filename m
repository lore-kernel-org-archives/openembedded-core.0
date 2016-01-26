Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D1A5A7717B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 02:54:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2016 18:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,347,1449561600"; d="scan'208";a="36152736"
Received: from wkhoh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.195])
	by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2016 18:54:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jan 2016 15:53:54 +1300
Message-Id: <f0d6af6cc36a915e3fa5419de800d51c30162c37.1453776397.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453776397.git.paul.eggleton@linux.intel.com>
References: <cover.1453776397.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/5] devtool: add configure-help subcommand
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
X-List-Received-Date: Tue, 26 Jan 2016 02:54:33 -0000

When you need to set EXTRA_OECONF for a recipe, you need to know what
options the configure script actually supports; the configure script
however is only accessible from within a devshell and (at least in the
case of autotooled software fetched from an SCM repository) may not
actually exist until do_configure has run. Thus, provide a "devtool
configure-help" subcommand that runs the configure script for a recipe
with --help and shows you the output through a pager (e.g. less),
prefaced by a header describing the current options being specified.

There is basic support for autotools, cmake and bare configure scripts.
The cmake support is a little hacky since cmake doesn't really have a
concise help option that lists user-defined knobs (without actually
running through the configure process), however that being a design
feature of cmake there's not much I can think of to do about that at
the moment.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |   9 ++-
 scripts/lib/devtool/utilcmds.py | 170 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 175 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 0405d22..ff97dfc 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -129,7 +129,7 @@ def get_recipe_file(cooker, pn):
             logger.error("Unable to find any recipe file matching %s" % pn)
     return recipefile
 
-def parse_recipe(config, tinfoil, pn, appends):
+def parse_recipe(config, tinfoil, pn, appends, filter_workspace=True):
     """Parse recipe of a package"""
     import oe.recipeutils
     recipefile = get_recipe_file(tinfoil.cooker, pn)
@@ -138,9 +138,10 @@ def parse_recipe(config, tinfoil, pn, appends):
         return None
     if appends:
         append_files = tinfoil.cooker.collection.get_file_appends(recipefile)
-        # Filter out appends from the workspace
-        append_files = [path for path in append_files if
-                        not path.startswith(config.workspace_path)]
+        if filter_workspace:
+            # Filter out appends from the workspace
+            append_files = [path for path in append_files if
+                            not path.startswith(config.workspace_path)]
     else:
         append_files = None
     return oe.recipeutils.parse_recipe(recipefile, append_files,
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 375d7a3..a8f5e97 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -61,6 +61,165 @@ def edit_recipe(args, config, basepath, workspace):
     return 0
 
 
+def configure_help(args, config, basepath, workspace):
+    """Entry point for the devtool 'configure-help' subcommand"""
+    import oe.utils
+
+    check_workspace_recipe(workspace, args.recipename)
+    tinfoil = setup_tinfoil(config_only=False, basepath=basepath)
+    try:
+        rd = parse_recipe(config, tinfoil, args.recipename, appends=True, filter_workspace=False)
+        if not rd:
+            return 1
+        b = rd.getVar('B', True)
+        s = rd.getVar('S', True)
+        configurescript = os.path.join(s, 'configure')
+        confdisabled = 'noexec' in rd.getVarFlags('do_configure') or 'do_configure' not in (rd.getVar('__BBTASKS', False) or [])
+        configureopts = oe.utils.squashspaces(rd.getVar('CONFIGUREOPTS', True) or '')
+        extra_oeconf = oe.utils.squashspaces(rd.getVar('EXTRA_OECONF', True) or '')
+        extra_oecmake = oe.utils.squashspaces(rd.getVar('EXTRA_OECMAKE', True) or '')
+        do_configure = rd.getVar('do_configure', True) or ''
+        do_configure_noexpand = rd.getVar('do_configure', False) or ''
+        packageconfig = rd.getVarFlags('PACKAGECONFIG') or []
+        autotools = bb.data.inherits_class('autotools', rd) and ('oe_runconf' in do_configure or 'autotools_do_configure' in do_configure)
+        cmake = bb.data.inherits_class('cmake', rd) and ('cmake_do_configure' in do_configure)
+        cmake_do_configure = rd.getVar('cmake_do_configure', True)
+        pn = rd.getVar('PN', True)
+    finally:
+        tinfoil.shutdown()
+
+    if 'doc' in packageconfig:
+        del packageconfig['doc']
+
+    if autotools and not os.path.exists(configurescript):
+        logger.info('Running do_configure to generate configure script')
+        try:
+            stdout, _ = exec_build_env_command(config.init_path, basepath,
+                                               'bitbake -c configure %s' % msg, args.recipename,
+                                               stderr=subprocess.STDOUT)
+        except bb.process.ExecutionError:
+            pass
+
+    if confdisabled or do_configure.strip() in ('', ':'):
+        raise DevtoolError("do_configure task has been disabled for this recipe")
+    elif args.no_pager and not os.path.exists(configurescript):
+        raise DevtoolError("No configure script found and no other information to display")
+    else:
+        configopttext = ''
+        if autotools and configureopts:
+            configopttext = '''
+Arguments currently passed to the configure script:
+
+%s
+
+Some of those are fixed.''' % (configureopts + ' ' + extra_oeconf)
+            if extra_oeconf:
+                configopttext += ''' The ones that are specified through EXTRA_OECONF (which you can change or add to easily):
+
+%s''' % extra_oeconf
+
+        elif cmake:
+            in_cmake = False
+            cmake_cmd = ''
+            for line in cmake_do_configure.splitlines():
+                if in_cmake:
+                    cmake_cmd = cmake_cmd + ' ' + line.strip().rstrip('\\')
+                    if not line.endswith('\\'):
+                        break
+                if line.lstrip().startswith('cmake '):
+                    cmake_cmd = line.strip().rstrip('\\')
+                    if line.endswith('\\'):
+                        in_cmake = True
+                    else:
+                        break
+            if cmake_cmd:
+                configopttext = '''
+The current cmake command line:
+
+%s
+
+Arguments specified through EXTRA_OECMAKE (which you can change or add to easily)
+
+%s''' % (oe.utils.squashspaces(cmake_cmd), extra_oecmake)
+            else:
+                configopttext = '''
+The current implementation of cmake_do_configure:
+
+cmake_do_configure() {
+%s
+}
+
+Arguments specified through EXTRA_OECMAKE (which you can change or add to easily)
+
+%s''' % (cmake_do_configure.rstrip(), extra_oecmake)
+
+        elif do_configure:
+            configopttext = '''
+The current implementation of do_configure:
+
+do_configure() {
+%s
+}''' % do_configure.rstrip()
+            if '${EXTRA_OECONF}' in do_configure_noexpand:
+                configopttext += '''
+
+Arguments specified through EXTRA_OECONF (which you can change or add to easily):
+
+%s''' % extra_oeconf
+
+        if packageconfig:
+            configopttext += '''
+
+Some of these options may be controlled through PACKAGECONFIG; for more details please see the recipe.'''
+
+        if args.arg:
+            helpargs = ' '.join(args.arg)
+        elif cmake:
+            helpargs = '-LH'
+        else:
+            helpargs = '--help'
+
+        msg = '''configure information for %s
+------------------------------------------
+%s''' % (pn, configopttext)
+
+        if cmake:
+            msg += '''
+
+The cmake %s output for %s follows. After "-- Cache values" you should see a list of variables you can add to EXTRA_OECMAKE (prefixed with -D and suffixed with = followed by the desired value, without any spaces).
+------------------------------------------''' % (helpargs, pn)
+        elif os.path.exists(configurescript):
+            msg += '''
+
+The ./configure %s output for %s follows.
+------------------------------------------''' % (helpargs, pn)
+
+        olddir = os.getcwd()
+        tmppath = tempfile.mkdtemp()
+        with tempfile.NamedTemporaryFile('w', delete=False) as tf:
+            if not args.no_header:
+                tf.write(msg + '\n')
+            tf.close()
+            try:
+                try:
+                    cmd = 'cat %s' % tf.name
+                    if cmake:
+                        cmd += '; cmake %s %s 2>&1' % (helpargs, s)
+                        os.chdir(b)
+                    elif os.path.exists(configurescript):
+                        cmd += '; %s %s' % (configurescript, helpargs)
+                    if sys.stdout.isatty() and not args.no_pager:
+                        pager = os.environ.get('PAGER', 'less')
+                        cmd = '(%s) | %s' % (cmd, pager)
+                    subprocess.check_call(cmd, shell=True)
+                except subprocess.CalledProcessError as e:
+                    return e.returncode
+            finally:
+                os.chdir(olddir)
+                shutil.rmtree(tmppath)
+                os.remove(tf.name)
+
+
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
@@ -68,3 +227,14 @@ def register_commands(subparsers, context):
     parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
     parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
     parser_edit_recipe.set_defaults(func=edit_recipe)
+
+    # NOTE: Needed to override the usage string here since the default
+    # gets the order wrong - recipename must come before --arg
+    parser_configure_help = subparsers.add_parser('configure-help', help='Get help on configure script options',
+                                         usage='devtool configure-help [options] recipename [--arg ...]',
+                                         description='Displays the help for the configure script for the specified recipe (i.e. runs ./configure --help) prefaced by a header describing the current options being specified. Output is piped through less (or whatever PAGER is set to, if set) for easy browsing.')
+    parser_configure_help.add_argument('recipename', help='Recipe to show configure help for')
+    parser_configure_help.add_argument('-p', '--no-pager', help='Disable paged output', action="store_true")
+    parser_configure_help.add_argument('-n', '--no-header', help='Disable explanatory header text', action="store_true")
+    parser_configure_help.add_argument('--arg', help='Pass remaining arguments to the configure script instead of --help (useful if the script has additional help options)', nargs=argparse.REMAINDER)
+    parser_configure_help.set_defaults(func=configure_help)
-- 
2.5.0


