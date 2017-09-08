Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AAD1078170
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:34:35 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Sep 2017 06:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,361,1500966000"; d="scan'208";a="147000532"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by orsmga005.jf.intel.com with ESMTP; 08 Sep 2017 06:34:36 -0700
From: juan.m.cruz.alcaraz@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Sep 2017 06:34:34 -0700
Message-Id: <20170908133434.26109-1-juan.m.cruz.alcaraz@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH v4] devtool/standard: set a preferred provider when adding a new recipe with devtool
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
X-List-Received-Date: Fri, 08 Sep 2017 13:34:35 -0000

From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>

A recipe added with "devtool add" requires to be able to take precedence on recipes
previously defined with PREFERRED_PROVIDER.

By adding the parameter "--provides" to "devtool add" it is possible to specify
an element to be provided by the recipe. A devtool recipe can override a previous
PREFERRED_PROVIDER using the layer configuration file in the workspace.

E.g.
    devtool add my-libgl git@git://my-libgl-repository --provides virtual/libgl

[YOCTO #10415]

Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
---
 scripts/lib/devtool/standard.py  | 42 ++++++++++++++++++++++++++++++++++++++++
 scripts/lib/recipetool/create.py |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 174cc861e1..e976161cbb 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -161,6 +161,8 @@ def add(args, config, basepath, workspace):
         extracmdopts += ' --srcrev %s' % args.srcrev
     if args.srcbranch:
         extracmdopts += ' --srcbranch %s' % args.srcbranch
+    if args.provides:
+        extracmdopts += ' --provides %s' % args.provides
 
     tempdir = tempfile.mkdtemp(prefix='devtool')
     try:
@@ -276,6 +278,24 @@ def add(args, config, basepath, workspace):
                 f.write('    done\n')
                 f.write('}\n')
 
+        # Check if the new layer provides recipes whose priorities have been
+        # overriden by PREFERRED_PROVIDER.
+        recipe_name = rd.getVar('PN')
+        provides = rd.getVar('PROVIDES')
+        # Search every item defined in PROVIDES
+        for recipe_provided in provides.split():
+            preferred_provider = 'PREFERRED_PROVIDER_' + recipe_provided
+            current_pprovider = rd.getVar(preferred_provider)
+            if current_pprovider and current_pprovider != recipe_name:
+                if args.fixed_setup:
+                    #if we are inside the eSDK add the new PREFERRED_PROVIDER in the workspace layer.conf
+                    layerconf_file = os.path.join(config.workspace_path, "conf", "layer.conf")
+                    with open(layerconf_file, 'a') as f:
+                        f.write('%s = "%s"\n' % (preferred_provider, recipe_name))
+                else:
+                    logger.warn('Set \'%s\' in order to use the recipe' % preferred_provider)
+                break
+
         _add_md5(config, recipename, appendfile)
 
         logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
@@ -1612,6 +1632,26 @@ def status(args, config, basepath, workspace):
 def _reset(recipes, no_clean, config, basepath, workspace):
     """Reset one or more recipes"""
 
+    def clean_preferred_provider(pn, layerconf_path):
+        """Remove PREFERRED_PROVIDER from layer.conf'"""
+        import re
+        layerconf_file = os.path.join(layerconf_path, 'conf', 'layer.conf')
+        new_layerconf_file = os.path.join(layerconf_path, 'conf', '.layer.conf')
+        pprovider_found = False
+        with open(layerconf_file, 'r') as f:
+            lines = f.readlines()
+            with open(new_layerconf_file, 'a') as nf:
+                for line in lines:
+                    pprovider_exp = r'^PREFERRED_PROVIDER_.*? = "' + pn + r'"$'
+                    if not re.match(pprovider_exp, line):
+                        nf.write(line)
+                    else:
+                        pprovider_found = True
+        if pprovider_found:
+            shutil.move(new_layerconf_file, layerconf_file)
+        else:
+            os.remove(new_layerconf_file)
+
     if recipes and not no_clean:
         if len(recipes) == 1:
             logger.info('Cleaning sysroot for recipe %s...' % recipes[0])
@@ -1664,6 +1704,7 @@ def _reset(recipes, no_clean, config, basepath, workspace):
                 # This is unlikely, but if it's empty we can just remove it
                 os.rmdir(srctree)
 
+        clean_preferred_provider(pn, config.workspace_path)
 
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
@@ -1827,6 +1868,7 @@ def register_commands(subparsers, context):
     parser_add.add_argument('--also-native', help='Also add native variant (i.e. support building recipe for the build host as well as the target machine)', action='store_true')
     parser_add.add_argument('--src-subdir', help='Specify subdirectory within source tree to use', metavar='SUBDIR')
     parser_add.add_argument('--mirrors', help='Enable PREMIRRORS and MIRRORS for source tree fetching (disable by default).', action="store_true")
+    parser_add.add_argument('--provides', '-p', help='Specify an alias for the item provided by the recipe. E.g. virtual/libgl')
     parser_add.set_defaults(func=add, fixed_setup=context.fixed_setup)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4788691cff..ca474fce99 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -699,6 +699,8 @@ def create_recipe(args):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
             srcrev = stdout.rstrip()
         lines_before.append('SRCREV = "%s"' % srcrev)
+    if args.provides:
+        lines_before.append('PROVIDES = "%s"' % args.provides)
     lines_before.append('')
 
     if srcsubdir and not args.binary:
@@ -1300,6 +1302,7 @@ def register_commands(subparsers):
                                           description='Creates a new recipe from a source tree')
     parser_create.add_argument('source', help='Path or URL to source')
     parser_create.add_argument('-o', '--outfile', help='Specify filename for recipe to create')
+    parser_create.add_argument('-p', '--provides', help='Specify an alias for the item provided by the recipe')
     parser_create.add_argument('-m', '--machine', help='Make recipe machine-specific as opposed to architecture-specific', action='store_true')
     parser_create.add_argument('-x', '--extract-to', metavar='EXTRACTPATH', help='Assuming source is a URL, fetch it and extract it to the directory specified as %(metavar)s')
     parser_create.add_argument('-N', '--name', help='Name to use within recipe (PN)')
-- 
2.12.3


