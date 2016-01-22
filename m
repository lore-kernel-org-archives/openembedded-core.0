Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 683BA731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272621"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:49 +1300
Message-Id: <d63ad1eebc1662abf1f00d4b88ed06d7158dbb27.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/14] devtool: build: ensure pkgdata is written out
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:10 -0000

When you run devtool build, you need to have the pkgdata written out at
the end, so that if what you're adding is a library and the next thing
you add is something that depends on that library, the necessary
information to map the dependency back to the recipe is present. In
practical terms all this means is we need do_packagedata to run in
addition to do_populate_sysroot.

This does mean that do_package needs to run which wasn't running before,
and that means that the few package QA tests that run within do_package
such as installed-vs-shipped will now be run. This may be a bit
bothersome, and prompted a fix for one of our oe-selftest tests as a
result, but I don't see an easy way around it. Ultimately if you care
about using the recipe in an image you'll need to fix any such errors
anyway.

Fixes [YOCTO #8887].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  7 ++++++-
 scripts/lib/devtool/build.py      | 16 +++++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 43c7cda..d95cb08 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -226,8 +226,13 @@ class DevtoolTests(DevtoolBase):
         # Clean up anything in the workdir/sysroot/sstate cache (have to do this *after* devtool add since the recipe only exists then)
         bitbake('libftdi -c cleansstate')
         # libftdi's python/CMakeLists.txt is a bit broken, so let's just disable it
+        # There's also the matter of it installing cmake files to a path we don't
+        # normally cover, which triggers the installed-vs-shipped QA test we have
+        # within do_package
         recipefile = '%s/recipes/libftdi/libftdi_%s.bb' % (self.workspacedir, version)
-        result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- "-DPYTHON_BINDINGS=OFF"' % recipefile)
+        result = runCmd('recipetool setvar %s EXTRA_OECMAKE -- \'-DPYTHON_BINDINGS=OFF -DLIBFTDI_CMAKE_CONFIG_DIR=${datadir}/cmake/Modules\'' % recipefile)
+        with open(recipefile, 'a') as f:
+            f.write('\nFILES_${PN}-dev += "${datadir}/cmake/Modules"\n')
         # Test devtool build
         result = runCmd('devtool build libftdi')
         staging_libdir = get_bb_var('STAGING_LIBDIR', 'libftdi')
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index c4c0c9f..b10a6a9 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -46,21 +46,27 @@ def _set_file_values(fn, values):
             f.writelines(newlines)
     return updated
 
-def _get_build_task(config):
-    return config.get('Build', 'build_task', 'populate_sysroot')
+def _get_build_tasks(config):
+    tasks = config.get('Build', 'build_task', 'populate_sysroot,packagedata').split(',')
+    return ['do_%s' % task.strip() for task in tasks]
 
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     workspacepn = check_workspace_recipe(workspace, args.recipename, bbclassextend=True)
 
-    build_task = _get_build_task(config)
+    build_tasks = _get_build_tasks(config)
 
     bbappend = workspace[workspacepn]['bbappend']
     if args.disable_parallel_make:
         logger.info("Disabling 'make' parallelism")
         _set_file_values(bbappend, {'PARALLEL_MAKE': ''})
     try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+        bbargs = []
+        for task in build_tasks:
+            if args.recipename.endswith('-native') and 'package' in task:
+                continue
+            bbargs.append('%s:%s' % (args.recipename, task))
+        exec_build_env_command(config.init_path, basepath, 'bitbake %s' % ' '.join(bbargs), watch=True)
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
@@ -73,7 +79,7 @@ def build(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake (up to and including do_%s)' % _get_build_task(context.config))
+                                         description='Builds the specified recipe using bitbake (up to and including %s)' % ', '.join(_get_build_tasks(context.config)))
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
-- 
2.5.0


