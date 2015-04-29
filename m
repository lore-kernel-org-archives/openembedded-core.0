Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A272773D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057407"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:41:57 +0100
Message-Id: <e29ddf1e046b288a01881393ded218d9e8dbb11e.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] devtool: add: add an option to fetch remote source
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
X-List-Received-Date: Wed, 29 Apr 2015 13:42:38 -0000

Add a -f/--fetch option to fetch a remote URI (into the already
specified source tree path) and set this as SRC_URI within the recipe.
This simply wraps around the existing functionality in recipetool.

Implements [YOCTO #7644].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index eb41f28..482c418 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -46,6 +46,19 @@ def add(args, config, basepath, workspace):
         return -1
 
     srctree = os.path.abspath(args.srctree)
+    if os.path.exists(srctree):
+        if args.fetch:
+            if not os.path.isdir(srctree):
+                logger.error("Cannot fetch into source tree path %s as it exists and is not a directory" % srctree)
+                return 1
+            elif os.listdir(srctree):
+                logger.error("Cannot fetch into source tree path %s as it already exists and is non-empty" % srctree)
+                return 1
+    else:
+        if not args.fetch:
+            logger.error("Specified source tree %s could not be found" % srctree)
+            return 1
+
     appendpath = os.path.join(config.workspace_path, 'appends')
     if not os.path.exists(appendpath):
         os.makedirs(appendpath)
@@ -64,7 +77,13 @@ def add(args, config, basepath, workspace):
         color = 'always'
     else:
         color = args.color
-    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s %s' % (color, recipefile, srctree))
+    extracmdopts = ''
+    if args.fetch:
+        source = args.fetch
+        extracmdopts = '-x %s' % srctree
+    else:
+        source = srctree
+    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
     _add_md5(config, args.recipename, recipefile)
@@ -670,11 +689,11 @@ def build(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
-                                       description='Adds a new recipe',
-                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                       description='Adds a new recipe')
     parser_add.add_argument('recipename', help='Name for new recipe to add')
     parser_add.add_argument('srctree', help='Path to external source tree')
     parser_add.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
+    parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
     parser_add.set_defaults(func=add)
 
-- 
2.1.0


