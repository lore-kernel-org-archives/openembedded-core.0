Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D532073DA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963933"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:09 +0100
Message-Id: <84f92fc78b5a15478b24c052c3221765ff197b5f.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 6/9] devtool: fix build env command execution error handling
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
X-List-Received-Date: Thu, 14 May 2015 17:45:56 -0000

If we execute an external command, we ought to prepare for the
possibility that it can fail and handle the failure appropriately. We
can especially expect this to happen when running bitbake in this
scenario. Ensure we return the appropriate exit code to the calling
process.

Fixes [YOCTO #7757].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |  9 +++++++--
 scripts/lib/devtool/standard.py | 22 +++++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 8866512..5a06c78 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -44,13 +44,14 @@ def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
     if watch:
         if sys.stdout.isatty():
             # Fool bitbake into thinking it's outputting to a terminal (because it is, indirectly)
-            cmd = 'script -q -c "%s" /dev/null' % cmd
+            cmd = 'script -e -q -c "%s" /dev/null' % cmd
         return exec_watch('%s%s' % (init_prefix, cmd), **options)
     else:
         return bb.process.run('%s%s' % (init_prefix, cmd), **options)
 
 def exec_watch(cmd, **options):
     """Run program with stdout shown on sys.stdout"""
+    import bb
     if isinstance(cmd, basestring) and not "shell" in options:
         options["shell"] = True
 
@@ -67,7 +68,11 @@ def exec_watch(cmd, **options):
             buf += out
         elif out == '' and process.poll() != None:
             break
-    return buf
+
+    if process.returncode != 0:
+        raise bb.process.ExecutionError(cmd, process.returncode, buf, None)
+
+    return buf, None
 
 def setup_tinfoil():
     """Initialize tinfoil api from bitbake"""
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 2f8b194..61c0df9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -97,8 +97,12 @@ def add(args, config, basepath, workspace):
         source = srctree
     if args.version:
         extracmdopts += ' -V %s' % args.version
-    stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
-    logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+    try:
+        stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
+        logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+    except bb.process.ExecutionError as e:
+        logger.error('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        return 1
 
     _add_md5(config, args.recipename, recipefile)
 
@@ -688,7 +692,7 @@ def status(args, config, basepath, workspace):
 
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
-    import bb.utils
+    import bb
     if args.recipename:
         if args.all:
             logger.error("Recipe cannot be specified if -a/--all is used")
@@ -708,7 +712,11 @@ def reset(args, config, basepath, workspace):
     for pn in recipes:
         if not args.no_clean:
             logger.info('Cleaning sysroot for recipe %s...' % pn)
-            exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % pn)
+            try:
+                exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % pn)
+            except bb.process.ExecutionError as e:
+                logger.error('Command \'%s\' failed, output:\n%s\nIf you wish, you may specify -n/--no-clean to skip running this command when resetting' % (e.command, e.stdout))
+                return 1
 
         _check_preserve(config, pn)
 
@@ -735,7 +743,11 @@ def build(args, config, basepath, workspace):
         logger.error("no recipe named %s in your workspace" % args.recipename)
         return -1
     build_task = config.get('Build', 'build_task', 'populate_sysroot')
-    exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+    try:
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+    except bb.process.ExecutionError as e:
+        # We've already seen the output since watch=True, so just ensure we return something to the user
+        return e.exitcode
 
     return 0
 
-- 
2.1.0


