Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C89477153
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773765"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:53 +1300
Message-Id: <4fb064b610234ebf106ea0e2aa4c55d96d985c1e.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/14] devtool: categorise and order subcommands in help output
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:46 -0000

The listing of subcommands in the --help output for devtool was starting
to get difficult to follow, with commands appearing in no particular
order (due to some being in separate modules and the order of those
modules being parsed). Logically grouping the subcommands as well as
being able to exercise some control over the order of the subcommands
and groups would help, if we do so without losing the dynamic nature of
the list (i.e. that it comes from the plugins). Argparse provides no
built-in way to handle this and really, really makes it a pain to add,
but with some subclassing and hacking it's now possible, and can be
extended by any plugin as desired.

To put a subcommand into a group, all you need to do is specify a group=
parameter in the call to subparsers.add_parser(). you can also specify
an order= parameter to make the subcommand sort higher or lower in the
list (higher order numbers appear first, so use negative numbers to
force items to the end if that's what you want). To add a new group, use
subparsers.add_subparser_group(), supplying the name, description and
optionally an order number for the group itself (again, higher numbers
appear first).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                    | 10 ++++++-
 scripts/lib/argparse_oe.py         | 59 ++++++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/build-image.py |  3 +-
 scripts/lib/devtool/build.py       |  3 +-
 scripts/lib/devtool/deploy.py      |  8 ++++--
 scripts/lib/devtool/package.py     |  5 +++-
 scripts/lib/devtool/runqemu.py     |  3 +-
 scripts/lib/devtool/sdk.py         | 10 +++++--
 scripts/lib/devtool/search.py      |  3 +-
 scripts/lib/devtool/standard.py    | 21 +++++++++-----
 scripts/lib/devtool/upgrade.py     |  3 +-
 scripts/lib/devtool/utilcmds.py    |  6 ++--
 12 files changed, 114 insertions(+), 20 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 2d57da0b..ed8f3a1 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -271,10 +271,18 @@ def main():
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
 
+    subparsers.add_subparser_group('sdk', 'SDK maintenance', -2)
+    subparsers.add_subparser_group('advanced', 'Advanced', -1)
+    subparsers.add_subparser_group('starting', 'Beginning work on a recipe', 100)
+    subparsers.add_subparser_group('info', 'Getting information')
+    subparsers.add_subparser_group('working', 'Working on a recipe in the workspace')
+    subparsers.add_subparser_group('testbuild', 'Testing changes on target')
+
     if not context.fixed_setup:
         parser_create_workspace = subparsers.add_parser('create-workspace',
                                                         help='Set up workspace in an alternative location',
-                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
+                                                        description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.',
+                                                        group='advanced')
         parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
         parser_create_workspace.set_defaults(func=create_workspace, no_workspace=True)
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index fd86692..744cfe3 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -1,5 +1,6 @@
 import sys
 import argparse
+from collections import defaultdict, OrderedDict
 
 class ArgumentUsageError(Exception):
     """Exception class you can raise (and catch) in order to show the help"""
@@ -9,6 +10,10 @@ class ArgumentUsageError(Exception):
 
 class ArgumentParser(argparse.ArgumentParser):
     """Our own version of argparse's ArgumentParser"""
+    def __init__(self, *args, **kwargs):
+        kwargs.setdefault('formatter_class', OeHelpFormatter)
+        self._subparser_groups = OrderedDict()
+        super(ArgumentParser, self).__init__(*args, **kwargs)
 
     def error(self, message):
         sys.stderr.write('ERROR: %s\n' % message)
@@ -27,10 +32,26 @@ class ArgumentParser(argparse.ArgumentParser):
 
     def add_subparsers(self, *args, **kwargs):
         ret = super(ArgumentParser, self).add_subparsers(*args, **kwargs)
+        # Need a way of accessing the parent parser
+        ret._parent_parser = self
+        # Ensure our class gets instantiated
         ret._parser_class = ArgumentSubParser
+        # Hacky way of adding a method to the subparsers object
+        ret.add_subparser_group = self.add_subparser_group
         return ret
 
+    def add_subparser_group(self, groupname, groupdesc, order=0):
+        self._subparser_groups[groupname] = (groupdesc, order)
+
+
 class ArgumentSubParser(ArgumentParser):
+    def __init__(self, *args, **kwargs):
+        if 'group' in kwargs:
+            self._group = kwargs.pop('group')
+        if 'order' in kwargs:
+            self._order = kwargs.pop('order')
+        super(ArgumentSubParser, self).__init__(*args, **kwargs)
+
     def parse_known_args(self, args=None, namespace=None):
         # This works around argparse not handling optional positional arguments being
         # intermixed with other options. A pretty horrible hack, but we're not left
@@ -64,3 +85,41 @@ class ArgumentSubParser(ArgumentParser):
             if hasattr(action, 'save_nargs'):
                 action.nargs = action.save_nargs
         return super(ArgumentParser, self).format_help()
+
+
+class OeHelpFormatter(argparse.HelpFormatter):
+    def _format_action(self, action):
+        if hasattr(action, '_get_subactions'):
+            # subcommands list
+            groupmap = defaultdict(list)
+            ordermap = {}
+            subparser_groups = action._parent_parser._subparser_groups
+            groups = sorted(subparser_groups.keys(), key=lambda item: subparser_groups[item][1], reverse=True)
+            for subaction in self._iter_indented_subactions(action):
+                parser = action._name_parser_map[subaction.dest]
+                group = getattr(parser, '_group', None)
+                groupmap[group].append(subaction)
+                if group not in groups:
+                    groups.append(group)
+                order = getattr(parser, '_order', 0)
+                ordermap[subaction.dest] = order
+
+            lines = []
+            if len(groupmap) > 1:
+                groupindent = '  '
+            else:
+                groupindent = ''
+            for group in groups:
+                subactions = groupmap[group]
+                if not subactions:
+                    continue
+                if groupindent:
+                    if not group:
+                        group = 'other'
+                    groupdesc = subparser_groups.get(group, (group, 0))[0]
+                    lines.append('  %s:' % groupdesc)
+                for subaction in sorted(subactions, key=lambda item: ordermap[item.dest], reverse=True):
+                    lines.append('%s%s' % (groupindent, self._format_action(subaction).rstrip()))
+            return '\n'.join(lines)
+        else:
+            return super(OeHelpFormatter, self)._format_action(action)
diff --git a/scripts/lib/devtool/build-image.py b/scripts/lib/devtool/build-image.py
index 48c3a11..ff764fa 100644
--- a/scripts/lib/devtool/build-image.py
+++ b/scripts/lib/devtool/build-image.py
@@ -109,7 +109,8 @@ def register_commands(subparsers, context):
     parser = subparsers.add_parser('build-image',
                                    help='Build image including workspace recipe packages',
                                    description='Builds an image, extending it to include '
-                                   'packages from recipes in the workspace')
+                                   'packages from recipes in the workspace',
+                                   group='testbuild', order=-10)
     parser.add_argument('imagename', help='Image recipe to build', nargs='?')
     parser.add_argument('-p', '--add-packages', help='Instead of adding packages for the '
                         'entire workspace, specify packages to be added to the image '
diff --git a/scripts/lib/devtool/build.py b/scripts/lib/devtool/build.py
index b10a6a9..48f6fe1 100644
--- a/scripts/lib/devtool/build.py
+++ b/scripts/lib/devtool/build.py
@@ -79,7 +79,8 @@ def build(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_build = subparsers.add_parser('build', help='Build a recipe',
-                                         description='Builds the specified recipe using bitbake (up to and including %s)' % ', '.join(_get_build_tasks(context.config)))
+                                         description='Builds the specified recipe using bitbake (up to and including %s)' % ', '.join(_get_build_tasks(context.config)),
+                                         group='working')
     parser_build.add_argument('recipename', help='Recipe to build')
     parser_build.add_argument('-s', '--disable-parallel-make', action="store_true", help='Disable make parallelism')
     parser_build.set_defaults(func=build)
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index c90c6b1..0236c53 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -131,7 +131,9 @@ def undeploy(args, config, basepath, workspace):
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the deploy plugin"""
-    parser_deploy = subparsers.add_parser('deploy-target', help='Deploy recipe output files to live target machine')
+    parser_deploy = subparsers.add_parser('deploy-target',
+                                          help='Deploy recipe output files to live target machine',
+                                          group='testbuild')
     parser_deploy.add_argument('recipename', help='Recipe to deploy')
     parser_deploy.add_argument('target', help='Live target machine running an ssh server: user@hostname[:destdir]')
     parser_deploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
@@ -139,7 +141,9 @@ def register_commands(subparsers, context):
     parser_deploy.add_argument('-n', '--dry-run', help='List files to be deployed only', action='store_true')
     parser_deploy.set_defaults(func=deploy)
 
-    parser_undeploy = subparsers.add_parser('undeploy-target', help='Undeploy recipe output files in live target machine')
+    parser_undeploy = subparsers.add_parser('undeploy-target',
+                                            help='Undeploy recipe output files in live target machine',
+                                            group='testbuild')
     parser_undeploy.add_argument('recipename', help='Recipe to undeploy')
     parser_undeploy.add_argument('target', help='Live target machine running an ssh server: user@hostname')
     parser_undeploy.add_argument('-c', '--no-host-check', help='Disable ssh host key checking', action='store_true')
diff --git a/scripts/lib/devtool/package.py b/scripts/lib/devtool/package.py
index a296fce..afb5809 100644
--- a/scripts/lib/devtool/package.py
+++ b/scripts/lib/devtool/package.py
@@ -54,6 +54,9 @@ def package(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from the package plugin"""
     if context.fixed_setup:
-        parser_package = subparsers.add_parser('package', help='Build packages for a recipe', description='Builds packages for a recipe\'s output files')
+        parser_package = subparsers.add_parser('package',
+                                               help='Build packages for a recipe',
+                                               description='Builds packages for a recipe\'s output files',
+                                               group='testbuild', order=-5)
         parser_package.add_argument('recipename', help='Recipe to package')
         parser_package.set_defaults(func=package)
diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index 5282afb..daee7fb 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -57,7 +57,8 @@ def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     if context.fixed_setup:
         parser_runqemu = subparsers.add_parser('runqemu', help='Run QEMU on the specified image',
-                                               description='Runs QEMU to boot the specified image')
+                                               description='Runs QEMU to boot the specified image',
+                                               group='testbuild', order=-20)
         parser_runqemu.add_argument('imagename', help='Name of built image to boot within QEMU', nargs='?')
         parser_runqemu.add_argument('args', help='Any remaining arguments are passed to the runqemu script (pass --help after imagename to see what these are)',
                                     nargs=argparse.REMAINDER)
diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index 12de942..f6c5434 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -296,10 +296,16 @@ def sdk_install(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from the sdk plugin"""
     if context.fixed_setup:
-        parser_sdk = subparsers.add_parser('sdk-update', help='Update SDK components from a nominated location')
+        parser_sdk = subparsers.add_parser('sdk-update',
+                                           help='Update SDK components from a nominated location',
+                                           group='sdk')
         parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from', nargs='?')
         parser_sdk.add_argument('--skip-prepare', action="store_true", help='Skip re-preparing the build system after updating (for debugging only)')
         parser_sdk.set_defaults(func=sdk_update)
-        parser_sdk_install = subparsers.add_parser('sdk-install', help='Install additional SDK components', description='Installs additional recipe development files into the SDK. (You can use "devtool search" to find available recipes.)')
+
+        parser_sdk_install = subparsers.add_parser('sdk-install',
+                                                   help='Install additional SDK components',
+                                                   description='Installs additional recipe development files into the SDK. (You can use "devtool search" to find available recipes.)',
+                                                   group='sdk')
         parser_sdk_install.add_argument('recipename', help='Name of the recipe to install the development artifacts for', nargs='+')
         parser_sdk_install.set_defaults(func=sdk_install)
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index 2ea4462..b44bed7 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -82,6 +82,7 @@ def search(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_search = subparsers.add_parser('search', help='Search available recipes',
-                                            description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.')
+                                            description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.',
+                                            group='info')
     parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed)')
     parser_search.set_defaults(func=search, no_workspace=True)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 804c127..084039a 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1303,7 +1303,8 @@ def register_commands(subparsers, context):
 
     defsrctree = get_default_srctree(context.config)
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
-                                       description='Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.')
+                                       description='Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.',
+                                       group='starting', order=100)
     parser_add.add_argument('recipename', nargs='?', help='Name for new recipe to add (just name - no version, path or extension). If not specified, will attempt to auto-detect it.')
     parser_add.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_add.add_argument('fetchuri', nargs='?', help='Fetch the specified URI and extract it to create the source tree')
@@ -1319,7 +1320,8 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-                                       description='Enables modifying the source for an existing recipe. You can either provide your own pre-prepared source tree, or specify -x/--extract to extract the source being fetched by the recipe.')
+                                       description='Enables modifying the source for an existing recipe. You can either provide your own pre-prepared source tree, or specify -x/--extract to extract the source being fetched by the recipe.',
+                                       group='starting', order=90)
     parser_modify.add_argument('recipename', help='Name of existing recipe to edit (just name - no version, path or extension)')
     parser_modify.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
@@ -1333,7 +1335,8 @@ def register_commands(subparsers, context):
     parser_modify.set_defaults(func=modify)
 
     parser_extract = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
-                                       description='Extracts the source for an existing recipe')
+                                       description='Extracts the source for an existing recipe',
+                                       group='advanced')
     parser_extract.add_argument('recipename', help='Name of recipe to extract the source for')
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
     parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout (default "%(default)s")')
@@ -1342,7 +1345,8 @@ def register_commands(subparsers, context):
 
     parser_sync = subparsers.add_parser('sync', help='Synchronize the source tree for an existing recipe',
                                        description='Synchronize the previously extracted source tree for an existing recipe',
-                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       group='advanced')
     parser_sync.add_argument('recipename', help='Name of recipe to sync the source for')
     parser_sync.add_argument('srctree', help='Path to the source tree')
     parser_sync.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
@@ -1350,7 +1354,8 @@ def register_commands(subparsers, context):
     parser_sync.set_defaults(func=sync)
 
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
-                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV). Note that these changes need to have been committed to the git repository in order to be recognised.')
+                                       description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV). Note that these changes need to have been committed to the git repository in order to be recognised.',
+                                       group='working', order=-90)
     parser_update_recipe.add_argument('recipename', help='Name of recipe to update')
     parser_update_recipe.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_update_recipe.add_argument('--initial-rev', help='Override starting revision for patches')
@@ -1360,11 +1365,13 @@ def register_commands(subparsers, context):
     parser_update_recipe.set_defaults(func=update_recipe)
 
     parser_status = subparsers.add_parser('status', help='Show workspace status',
-                                          description='Lists recipes currently in your workspace and the paths to their respective external source trees')
+                                          description='Lists recipes currently in your workspace and the paths to their respective external source trees',
+                                          group='info', order=100)
     parser_status.set_defaults(func=status)
 
     parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
-                                         description='Removes the specified recipe from your workspace (resetting its state)')
+                                         description='Removes the specified recipe from your workspace (resetting its state)',
+                                         group='working', order=-100)
     parser_reset.add_argument('recipename', nargs='?', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e2be38e..0e53c82 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -339,7 +339,8 @@ def upgrade(args, config, basepath, workspace):
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_upgrade = subparsers.add_parser('upgrade', help='Upgrade an existing recipe',
-                                           description='Upgrades an existing recipe to a new upstream version. Puts the upgraded recipe file into the workspace along with any associated files, and extracts the source tree to a specified location (in case patches need rebasing or adding to as a result of the upgrade).')
+                                           description='Upgrades an existing recipe to a new upstream version. Puts the upgraded recipe file into the workspace along with any associated files, and extracts the source tree to a specified location (in case patches need rebasing or adding to as a result of the upgrade).',
+                                           group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree', help='Path to where to extract the source tree')
     parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 18eddb7..905d6d2 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -214,7 +214,8 @@ The ./configure %s output for %s follows.
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
     parser_edit_recipe = subparsers.add_parser('edit-recipe', help='Edit a recipe file in your workspace',
-                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.')
+                                         description='Runs the default editor (as specified by the EDITOR variable) on the specified recipe. Note that the recipe file itself must be in the workspace (i.e. as a result of "devtool add" or "devtool upgrade"); you can override this with the -a/--any-recipe option.',
+                                         group='working')
     parser_edit_recipe.add_argument('recipename', help='Recipe to edit')
     parser_edit_recipe.add_argument('--any-recipe', '-a', action="store_true", help='Edit any recipe, not just where the recipe file itself is in the workspace')
     parser_edit_recipe.set_defaults(func=edit_recipe)
@@ -223,7 +224,8 @@ def register_commands(subparsers, context):
     # gets the order wrong - recipename must come before --arg
     parser_configure_help = subparsers.add_parser('configure-help', help='Get help on configure script options',
                                          usage='devtool configure-help [options] recipename [--arg ...]',
-                                         description='Displays the help for the configure script for the specified recipe (i.e. runs ./configure --help) prefaced by a header describing the current options being specified. Output is piped through less (or whatever PAGER is set to, if set) for easy browsing.')
+                                         description='Displays the help for the configure script for the specified recipe (i.e. runs ./configure --help) prefaced by a header describing the current options being specified. Output is piped through less (or whatever PAGER is set to, if set) for easy browsing.',
+                                         group='working')
     parser_configure_help.add_argument('recipename', help='Recipe to show configure help for')
     parser_configure_help.add_argument('-p', '--no-pager', help='Disable paged output', action="store_true")
     parser_configure_help.add_argument('-n', '--no-header', help='Disable explanatory header text', action="store_true")
-- 
2.5.0


