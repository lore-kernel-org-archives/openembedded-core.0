Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B609D73D9D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 13:42:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2015 06:42:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,671,1422950400"; d="scan'208";a="721057412"
Received: from pkcletus-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.20.230])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2015 06:42:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Apr 2015 14:41:58 +0100
Message-Id: <574823752230cb205dc4ea82afbdd3206226dda6.1430314621.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1430314621.git.paul.eggleton@linux.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] devtool: add: use the appropriate file naming and versioning for SCM recipes
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

* Recipes that fetch from git, svn or hg by OpenEmbedded convention
  should normally be named with this as a suffix, since PV is meant to
  be set appropriately within the recipe, so follow this. In order to
  make this work we need to be able to have the version independent from
  the file name, so add a -V option to recipetool create to allow this
  to be specified.
* If -V is specified on the devtool add command line, ensure at PV gets
  set to include this version.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py  | 14 +++++++++++++-
 scripts/lib/recipetool/create.py | 15 ++++++++++++---
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 482c418..16f737e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -65,11 +65,21 @@ def add(args, config, basepath, workspace):
 
     recipedir = os.path.join(config.workspace_path, 'recipes', args.recipename)
     bb.utils.mkdirhier(recipedir)
+    rfv = None
     if args.version:
         if '_' in args.version or ' ' in args.version:
             logger.error('Invalid version string "%s"' % args.version)
             return -1
-        bp = "%s_%s" % (args.recipename, args.version)
+        rfv = args.version
+    if args.fetch:
+        if args.fetch.startswith('git://'):
+            rfv = 'git'
+        elif args.fetch.startswith('svn://'):
+            rfv = 'svn'
+        elif args.fetch.startswith('hg://'):
+            rfv = 'hg'
+    if rfv:
+        bp = "%s_%s" % (args.recipename, rfv)
     else:
         bp = args.recipename
     recipefile = os.path.join(recipedir, "%s.bb" % bp)
@@ -83,6 +93,8 @@ def add(args, config, basepath, workspace):
         extracmdopts = '-x %s' % srctree
     else:
         source = srctree
+    if args.version:
+        extracmdopts += ' -V %s' % args.version
     stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, recipefile, source, extracmdopts))
     logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 15de694..96062ab 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -187,9 +187,17 @@ def create_recipe(args):
         pn = recipefn
         pv = None
 
+    if args.version:
+        pv = args.version
+
+    if pv and pv not in 'git svn hg'.split():
+        realpv = pv
+    else:
+        realpv = None
+
     if srcuri:
-        if pv and pv not in 'git svn hg'.split():
-            srcuri = srcuri.replace(pv, '${PV}')
+        if realpv:
+            srcuri = srcuri.replace(realpv, '${PV}')
     else:
         lines_before.append('# No information for SRC_URI yet (only an external source tree was specified)')
     lines_before.append('SRC_URI = "%s"' % srcuri)
@@ -201,7 +209,7 @@ def create_recipe(args):
     if srcuri and supports_srcrev(srcuri):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
-        lines_before.append('PV = "1.0+git${SRCPV}"')
+        lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
         lines_before.append('SRCREV = "${AUTOREV}"')
     lines_before.append('')
 
@@ -418,5 +426,6 @@ def register_command(subparsers):
     parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create', required=True)
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
     parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
+    parser_create.add_argument('-V', '--version', help='Version to use within recipe (PV)')
     parser_create.set_defaults(func=create_recipe)
 
-- 
2.1.0


