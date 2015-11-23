Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE12607AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:14 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213447"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:32 +1300
Message-Id: <0f5304bfed9effb31625b43ce676b6f1f606336a.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/18] devtool: build: use bbappend to set PARALLEL_MAKE
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:14 -0000

Use a bbappend file to set PARALLEL_MAKE instead of a postfile; this
is a bit neater and only affects the specified recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/build.py | 45 +++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 62d8599..14f55e0 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -25,16 +25,27 @@ from devtool import exec_build_env_command, check_workspace_recipe, DevtoolError
 
 logger = logging.getLogger('devtool')
 
-def _create_conf_file(values, conf_file=None):
-    if not conf_file:
-        fd, conf_file = tempfile.mkstemp(suffix='.conf')
-    elif not os.path.exists(os.path.dirname(conf_file)):
-        logger.debug("Creating folder %s" % os.path.dirname(conf_file))
-        bb.utils.mkdirhier(os.path.dirname(conf_file))
-    with open(conf_file, 'w') as f:
-        for key, value in values.iteritems():
-            f.write('%s = "%s"\n' % (key, value))
-    return conf_file
+
+def _set_file_values(fn, values):
+    remaining = values.keys()
+
+    def varfunc(varname, origvalue, op, newlines):
+        newvalue = values.get(varname, origvalue)
+        remaining.remove(varname)
+        return (newvalue, '=', 0, True)
+
+    with open(fn, 'r') as f:
+        (updated, newlines) = bb.utils.edit_metadata(f, values, varfunc)
+
+    for item in remaining:
+        updated = True
+        newlines.append('%s = "%s"' % (item, values[item]))
+
+    if updated:
+        with open(fn, 'w') as f:
+            f.writelines(newlines)
+    return updated
+
 
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
@@ -42,22 +53,18 @@ def build(args, config, basepath, workspace):
 
     build_task = config.get('Build', 'build_task', 'populate_sysroot')
 
-    postfile_param = ""
-    postfile = ""
+    bbappend = workspace[args.recipename]['bbappend']
     if args.disable_parallel_make:
         logger.info("Disabling 'make' parallelism")
-        postfile = os.path.join(basepath, 'conf', 'disable_parallelism.conf')
-        _create_conf_file({'PARALLEL_MAKE':''}, postfile)
-        postfile_param = "-R %s" % postfile
+        _set_file_values(bbappend, {'PARALLEL_MAKE': ''})
     try:
-        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s %s' % (build_task, postfile_param, args.recipename), watch=True)
+        exec_build_env_command(config.init_path, basepath, 'bitbake -c %s %s' % (build_task, args.recipename), watch=True)
     except bb.process.ExecutionError as e:
         # We've already seen the output since watch=True, so just ensure we return something to the user
         return e.exitcode
     finally:
-        if postfile:
-            logger.debug('Removing postfile')
-            os.remove(postfile)
+        if args.disable_parallel_make:
+            _set_file_values(bbappend, {'PARALLEL_MAKE': None})
 
     return 0
 
-- 
2.1.0


