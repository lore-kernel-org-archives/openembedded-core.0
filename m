Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4E7A576FF6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 14:20:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2015 07:20:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,449,1437462000"; d="scan'208";a="795486717"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2015 07:20:18 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 06:13:42 +0000
Message-Id: <bda72ad4677c0c899fd0dbeec358c168c83b4942.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1441087651.git.leonardo.sandoval.gonzalez@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 2/2] devtool: Allow disabling make parallelism on build command
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
X-List-Received-Date: Tue, 01 Sep 2015 14:20:38 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Through --disable-parallel-make, the user can turn off parallelism
on the make tool. This can be useful when debuging race conditions issues.
A POSTFILE is created under 'build/conf' for further usage. So far, the
file just clears the PARALLEL_MAKE variable. The postfile can be used with
bitbake, including it with the '-R' parameter.

[YOCTO #7589]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 scripts/lib/devtool/build.py | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 0f848e2..9faff27 100644
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
 
@@ -26,18 +29,39 @@ def plugin_init(pluginlist):
     """Plugin initialization"""
     pass
 
+def _create_conf_file(values, conf_file=None):
+    if not conf_file:
+        fd, conf_file = tempfile.mkstemp(suffix='.conf')
+    elif not os.path.exists(os.path.dirname(conf_file)):
+        logger.info("Creating folder %s" % os.path.dirname(conf_file))
+        bb.utils.mkdirhier(os.path.dirname(conf_file))
+    with open(conf_file,'w') as f:
+        for key, value in values.iteritems():
+            f.write('%s="%s"\n' % (key,value))
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
+    postfile_param = postfile = ""
+    if args.disable_parallel_make:
+        logger.info("Disabling 'make' parallelism")
+        postfile = os.path.join(basepath,'conf','disable_parallelism.conf')
+        _create_conf_file({'PARALLEL_MAKE':''}, postfile)
+        postfile_param = "-R %s" % postfile
     try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s %s' % (build_task, postfile_param, args.recipename), watch=True)
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
+    finally:
+        if args.disable_parallel_make:
+            logger.info("POSTFILE placed on %s" % postfile)
 
     return 0
 
@@ -47,4 +71,5 @@ def register_commands(subparsers, context):
                                          description='Builds the specified recipe using bitbake',
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_build.add_argument('recipename', help='Recipe to build')
+    parser_build.add_argument('--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
-- 
1.8.4.5


