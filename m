Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7E65275E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537249"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:11 +0100
Message-Id: <3963383ec2932e7d1167282805eb7284d68a1912.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441706523.git.paul.eggleton@linux.intel.com>
References: <cover.1441706523.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/9] devtool: Allow disabling make parallelism on build command
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:39 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Through -s/--disable-parallel-make, the user can turn off parallelism
on the make tool. This can be useful when debuging race condition issues.
In order to set PARALLEL_MAKE = "" a post-config file created and then
passed into the build.

[YOCTO #7589]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build.py | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 0f848e2..335aff5 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -16,9 +16,12 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 """Devtool build plugin"""
 
+import os
+import bb
 import logging
 import argparse
-from devtool import exec_build_env_command
+import tempfile
+from devtool import exec_build_env_command, DevtoolError
 
 logger = logging.getLogger('devtool')
 
@@ -26,18 +29,41 @@ def plugin_init(pluginlist):
     """Plugin initialization"""
     pass
 
+def _create_conf_file(values, conf_file=None):
+    if not conf_file:
+        fd, conf_file = tempfile.mkstemp(suffix='.conf')
+    elif not os.path.exists(os.path.dirname(conf_file)):
+        logger.debug("Creating folder %s" % os.path.dirname(conf_file))
+        bb.utils.mkdirhier(os.path.dirname(conf_file))
+    with open(conf_file, 'w') as f:
+        for key, value in values.iteritems():
+            f.write('%s = "%s"\n' % (key, value))
+    return conf_file
+
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
-    import bb
     if not args.recipename in workspace:
         raise DevtoolError("no recipe named %s in your workspace" %
                            args.recipename)
+
     build_task = config.get('Build', 'build_task', 'populate_sysroot')
+
+    postfile_param = ""
+    postfile = ""
+    if args.disable_parallel_make:
+        logger.info("Disabling 'make' parallelism")
+        postfile = os.path.join(basepath, 'conf', 'disable_parallelism.conf')
+        _create_conf_file({'PARALLEL_MAKE':''}, postfile)
+        postfile_param = "-R %s" % postfile
     try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s %s' % (build_task, postfile_param, args.recipename), watch=True)
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
+    finally:
+        if postfile:
+            logger.debug('Removing postfile')
+            os.remove(postfile)
 
     return 0
 
@@ -47,4 +73,5 @@ def register_commands(subparsers, context):
                                          description='Builds the specified recipe using bitbake',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_build.add_argument('recipename', help='Recipe to build')
+    parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
-- 
2.1.0


