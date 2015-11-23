Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8A962131
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:11:13 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:11:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213468"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:11:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:33 +1300
Message-Id: <d4cfb41397e2dba8da65bca025b05031bb9e9a32.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 14/18] devtool: build: enable showing default task in help
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
X-List-Received-Date: Mon, 23 Nov 2015 02:11:13 -0000

Enable access to the configuration object in register_commands() so that
we can read configuration values there; this allows us to show the
task that will be run in the command line help for the build subcommand.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool              | 1 +
 scripts/lib/devtool/build.py | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 2a5a3d4..1fcb42c 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -220,6 +220,7 @@ def main():
     config = ConfigHandler(os.path.join(basepath, 'conf', 'devtool.conf'))
     if not config.read():
         return -1
+    context.config = config
 
     bitbake_subdir = config.get('General', 'bitbake_subdir', '')
     if bitbake_subdir:
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index 14f55e0..0b8e88b 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -46,12 +46,14 @@ def _set_file_values(fn, values):
             f.writelines(newlines)
     return updated
 
+def _get_build_task(config):
+    return config.get('Build', 'build_task', 'populate_sysroot')
 
 def build(args, config, basepath, workspace):
     """Entry point for the devtool 'build' subcommand"""
     check_workspace_recipe(workspace, args.recipename)
 
-    build_task = config.get('Build', 'build_task', 'populate_sysroot')
+    build_task = _get_build_task(config)
 
     bbappend = workspace[args.recipename]['bbappend']
     if args.disable_parallel_make:
@@ -71,7 +73,7 @@ def build(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake',
+                                         description='Builds the specified recipe using bitbake (up to and including do_%s)' % _get_build_task(context.config),
                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
-- 
2.1.0


