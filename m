Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2C6171A49
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 04:00:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP; 30 Oct 2016 21:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25576819"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 21:00:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:59:44 +1300
Message-Id: <ff7acf433079f921881e6b0d58daf10361b1e1d1.1477886344.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1477886344.git.paul.eggleton@linux.intel.com>
References: <cover.1477886344.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] devtool: add: show recipetool create output
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
X-List-Received-Date: Mon, 31 Oct 2016 04:00:20 -0000

When running devtool add, instead of hiding the recipetool create
output, change it so that it's appropriate to show in the devtool
context and show it in real-time. This means that you get status output
such as when a URL is being fetched (though currently no progress
information.) recipetool create now has a hidden --devtool option to
enable this display mode.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  |  5 +++--
 scripts/lib/recipetool/create.py | 25 +++++++++++++++++++------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 4eff6f8..8dfd538 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -155,7 +155,7 @@ def add(args, config, basepath, workspace):
     try:
         while True:
             try:
-                stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
+                stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create --devtool -o %s \'%s\' %s' % (color, tempdir, source, extracmdopts), watch=True)
             except bb.process.ExecutionError as e:
                 if e.exitcode == 14:
                     # FIXME this is a horrible hack that is unfortunately
@@ -164,11 +164,12 @@ def add(args, config, basepath, workspace):
                     # with references to it throughout the code, so we have
                     # to exit out and come back here to do it.
                     ensure_npm(config, basepath, args.fixed_setup)
+                    logger.info('Re-running recipe creation process after building nodejs')
                     continue
                 elif e.exitcode == 15:
                     raise DevtoolError('Could not auto-determine recipe name, please specify it on the command line')
                 else:
-                    raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+                    raise DevtoolError('Command \'%s\' failed' % e.command)
             break
 
         recipes = glob.glob(os.path.join(tempdir, '*.bb'))
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index d427d32..c1819b6 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -32,6 +32,18 @@ logger = logging.getLogger('recipetool')
 tinfoil = None
 plugins = None
 
+def log_error_cond(message, debugonly):
+    if debugonly:
+        logger.debug(message)
+    else:
+        logger.error(message)
+
+def log_info_cond(message, debugonly):
+    if debugonly:
+        logger.debug(message)
+    else:
+        logger.info(message)
+
 def plugin_init(pluginlist):
     # Take a reference to the list so we can use it later
     global plugins
@@ -406,7 +418,7 @@ def create_recipe(args):
         srctree = tempsrc
         if fetchuri.startswith('npm://'):
             # Check if npm is available
-            check_npm(tinfoil.config_data)
+            check_npm(tinfoil.config_data, args.devtool)
         logger.info('Fetching %s...' % srcuri)
         try:
             checksums = scriptutils.fetch_uri(tinfoil.config_data, fetchuri, srctree, srcrev)
@@ -640,7 +652,7 @@ def create_recipe(args):
 
     if not outfile:
         if not pn:
-            logger.error('Unable to determine short program name from source tree - please specify name with -N/--name or output file name with -o/--outfile')
+            log_error_cond('Unable to determine short program name from source tree - please specify name with -N/--name or output file name with -o/--outfile', args.devtool)
             # devtool looks for this specific exit code, so don't change it
             sys.exit(15)
         else:
@@ -736,7 +748,7 @@ def create_recipe(args):
         shutil.move(srctree, args.extract_to)
         if tempsrc == srctree:
             tempsrc = None
-        logger.info('Source extracted to %s' % args.extract_to)
+        log_info_cond('Source extracted to %s' % args.extract_to, args.devtool)
 
     if outfile == '-':
         sys.stdout.write('\n'.join(outlines) + '\n')
@@ -749,7 +761,7 @@ def create_recipe(args):
                     continue
                 f.write('%s\n' % line)
                 lastline = line
-        logger.info('Recipe %s has been created; further editing may be required to make it fully functional' % outfile)
+        log_info_cond('Recipe %s has been created; further editing may be required to make it fully functional' % outfile, args.devtool)
 
     if tempsrc:
         if args.keep_temp:
@@ -1073,9 +1085,9 @@ def convert_rpm_xml(xmlfile):
     return values
 
 
-def check_npm(d):
+def check_npm(d, debugonly=False):
     if not os.path.exists(os.path.join(d.getVar('STAGING_BINDIR_NATIVE', True), 'npm')):
-        logger.error('npm required to process specified source, but npm is not available - you need to build nodejs-native first')
+        log_error_cond('npm required to process specified source, but npm is not available - you need to build nodejs-native first', debugonly)
         sys.exit(14)
 
 def register_commands(subparsers):
@@ -1093,5 +1105,6 @@ def register_commands(subparsers):
     parser_create.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_create.add_argument('-a', '--autorev', help='When fetching from a git repository, set SRCREV in the recipe to a floating revision instead of fixed', action="store_true")
     parser_create.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_create.add_argument('--devtool', action="store_true", help=argparse.SUPPRESS)
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.5.5


