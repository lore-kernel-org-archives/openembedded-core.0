Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7617C7823A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 00:24:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Aug 2017 17:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,410,1498546800"; d="scan'208";a="1186685577"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2017 17:24:42 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 17:24:35 -0700
Message-Id: <20170822002435.39497-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] devtool/standard: set a preferred provider when adding a new recipe with devtool
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
X-List-Received-Date: Tue, 22 Aug 2017 00:24:41 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

A recipe added with "devtool add" requires to be able to take precedence on recipes
previously defined with PREFERRED_PROVIDER.

By adding the parameter "--provides" to "devtool add" it is possible to specify
an element to be provided by the recipe. A devtool recipe can override a previous
PREFERRED_PROVIDER using the layer configuration file in the workspace.

E.g.
    devtool add my-mesa git@git://my-mesa-repository --provides virtual/mesa

[YOCTO #10415]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 scripts/lib/devtool/standard.py  | 20 ++++++++++++++++++++
 scripts/lib/recipetool/create.py |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ec192238ed..02b4ff4d3b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -151,6 +151,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' --fetch-dev'
     if args.mirrors:
         extracmdopts += ' --mirrors'
+    if args.provides:
+        extracmdopts += ' --provides %s' % args.provides
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -266,6 +268,23 @@ def add(args, config, basepath, workspace):
                 f.write('    done\n')
                 f.write('}\n')
 
+        # Check if the new layer provides recipes whose priorities have been
+        # overriden by PREFERRED_PROVIDER.
+        recipe_name = rd.getVar('PN')
+        provides = rd.getVar('PROVIDES')
+        # Search every item defined in PROVIDES
+        for recipe_provided in provides.split():
+            preferred_provider = 'PREFERRED_PROVIDER_' + recipe_provided
+            if rd.getVar(preferred_provider):
+                if args.fixed_setup:
+                    #if we are inside the eSDK add the new PREFERRED_PROVIDER in the workspace layer.conf
+                    layerconf_file = os.path.join(config.workspace_path, "conf", "layer.conf")
+                    with open(layerconf_file, 'a') as f:
+                        f.write('%s="%s"\n' % (preferred_provider, recipe_name))
+                else:
+                    logger.warn('Set \'%s\' in order to use the recipe' % preferred_provider)
+                break
+
         _add_md5(config, recipename, appendfile)
 
         logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
@@ -1810,6 +1829,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_add.add_argument('--mirrors', help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).', action="store_true")
+    parser_add.add_argument('--provides', '-p', help='Specify an alias for the item provided by the recipe. E.g. virtual/mesa')
     parser_add.set_defaults(func=add, fixed_setup=context.fixed_setup)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index e21e2bf298..83c8e4f7b7 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -607,6 +607,8 @@ def create_recipe(args):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
             srcrev = stdout.rstrip()
         lines_before.append('SRCREV = "%s"' % srcrev)
+    if args.provides:
+        lines_before.append('PROVIDES = "%s"' % args.provides)
     lines_before.append('')
 
     if srcsubdir and not args.binary:
@@ -1158,6 +1160,7 @@ def register_commands(subparsers):
                                           description='Creates a new recipe from a source tree')
     parser_create.add_argument('source', help='Path or URL to source')
     parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create')
+    parser_create.add_argument('-p', '--provides', help='Specify an alias for the item provided by the recipe')
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
     parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
     parser_create.add_argument('-N', '--name', help='Name to use within recipe (PN)')
-- 
2.13.2


