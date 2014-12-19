Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B1E6A7290C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 11:42:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Dec 2014 03:42:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,606,1413270000"; d="scan'208";a="640244404"
Received: from khamid-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.31.61])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2014 03:42:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Dec 2014 11:41:55 +0000
Message-Id: <966a619e71080dd7ceadb7c9376629886f033875.1418984743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1418984743.git.paul.eggleton@linux.intel.com>
References: <cover.1418984743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/15] scripts/devtool: add development helper tool
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
X-List-Received-Date: Fri, 19 Dec 2014 11:42:19 -0000

Provides an easy means to work on developing applications and system
components with the build system.

For example to "modify" the source for an existing recipe:

  $ devtool modify -x pango /home/projects/pango
  Parsing recipes..done.
  NOTE: Fetching pango...
  NOTE: Unpacking...
  NOTE: Patching...
  NOTE: Source tree extracted to /home/projects/pango
  NOTE: Recipe pango now set up to build from /home/paul/projects/pango

The pango source is now extracted to /home/paul/projects/pango, managed
in git, with each patch as a commit, and a bbappend is created in the
workspace layer to use the source in /home/paul/projects/pango when
building.

Additionally, you can add a new piece of software:

  $ devtool add pv /home/projects/pv
  NOTE: Recipe /path/to/workspace/recipes/pv/pv.bb has been
  automatically created; further editing may be required to make it
  fully functional

The latter uses recipetool to create a skeleton recipe and again sets up
a bbappend to use the source in /home/projects/pv when building.

Having done a "devtool modify", can also write any changes to the
external git repository back as patches next to the recipe:

  $ devtool update-recipe mdadm
  Parsing recipes..done.
  NOTE: Removing patch mdadm-3.2.2_fix_for_x32.patch
  NOTE: Removing patch gcc-4.9.patch
  NOTE: Updating recipe mdadm_3.3.1.bb

[YOCTO #6561]
[YOCTO #6653]
[YOCTO #6656]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 255 +++++++++++++++++++
 scripts/lib/devtool/__init__.py |  78 ++++++
 scripts/lib/devtool/standard.py | 545 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 878 insertions(+)
 create mode 100755 scripts/devtool
 create mode 100644 scripts/lib/devtool/__init__.py
 create mode 100644 scripts/lib/devtool/standard.py

diff --git a/scripts/devtool b/scripts/devtool
new file mode 100755
index 0000000..d6e1b97
--- /dev/null
+++ b/scripts/devtool
@@ -0,0 +1,255 @@
+#!/usr/bin/env python
+
+# OpenEmbedded Development tool
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import sys
+import os
+import argparse
+import glob
+import re
+import ConfigParser
+import subprocess
+import logging
+
+basepath = ''
+workspace = {}
+config = None
+context = None
+
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import scriptutils
+logger = scriptutils.logger_create('devtool')
+
+plugins = []
+
+
+class ConfigHandler(object):
+    config_file = ''
+    config_obj = None
+    init_path = ''
+    workspace_path = ''
+
+    def __init__(self, filename):
+        self.config_file = filename
+        self.config_obj = ConfigParser.SafeConfigParser()
+
+    def get(self, section, option, default=None):
+        try:
+            ret = self.config_obj.get(section, option)
+        except (ConfigParser.NoOptionError, ConfigParser.NoSectionError):
+            if default != None:
+                ret = default
+            else:
+                raise
+        return ret
+
+    def read(self):
+        if os.path.exists(self.config_file):
+            self.config_obj.read(self.config_file)
+
+            if self.config_obj.has_option('General', 'init_path'):
+                pth = self.get('General', 'init_path')
+                self.init_path = os.path.join(basepath, pth)
+                if not os.path.exists(self.init_path):
+                    logger.error('init_path %s specified in config file cannot be found' % pth)
+                    return False
+        else:
+            self.config_obj.add_section('General')
+
+        self.workspace_path = self.get('General', 'workspace_path', os.path.join(basepath, 'workspace'))
+        return True
+
+
+    def write(self):
+        logger.debug('writing to config file %s' % self.config_file)
+        self.config_obj.set('General', 'workspace_path', self.workspace_path)
+        with open(self.config_file, 'w') as f:
+            self.config_obj.write(f)
+
+class Context:
+    def __init__(self, **kwargs):
+        self.__dict__.update(kwargs)
+
+
+def read_workspace():
+    global workspace
+    workspace = {}
+    if not os.path.exists(os.path.join(config.workspace_path, 'conf', 'layer.conf')):
+        if context.fixed_setup:
+            logger.error("workspace layer not set up")
+            sys.exit(1)
+        else:
+            logger.info('Creating workspace layer in %s' % config.workspace_path)
+            _create_workspace(config.workspace_path, config, basepath)
+
+    logger.debug('Reading workspace in %s' % config.workspace_path)
+    externalsrc_re = re.compile(r'^EXTERNALSRC(_pn-[a-zA-Z0-9-]*)? =.*$')
+    for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
+        pn = os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+        with open(fn, 'r') as f:
+            for line in f:
+                if externalsrc_re.match(line.rstrip()):
+                    splitval = line.split('=', 2)
+                    workspace[pn] = splitval[1].strip('" \n\r\t')
+                    break
+
+def create_workspace(args, config, basepath, workspace):
+    if args.directory:
+        workspacedir = os.path.abspath(args.directory)
+    else:
+        workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
+    _create_workspace(workspacedir, config, basepath, args.create_only)
+
+def _create_workspace(workspacedir, config, basepath, create_only=False):
+    import bb
+
+    confdir = os.path.join(workspacedir, 'conf')
+    if os.path.exists(os.path.join(confdir, 'layer.conf')):
+        logger.info('Specified workspace already set up, leaving as-is')
+    else:
+        # Add a config file
+        bb.utils.mkdirhier(confdir)
+        with open(os.path.join(confdir, 'layer.conf'), 'w') as f:
+            f.write('# ### workspace layer auto-generated by devtool ###\n')
+            f.write('BBPATH =. "$' + '{LAYERDIR}:"\n')
+            f.write('BBFILES += "$' + '{LAYERDIR}/recipes/*/*.bb \\\n')
+            f.write('            $' + '{LAYERDIR}/appends/*.bbappend"\n')
+            f.write('BBFILE_COLLECTIONS += "workspacelayer"\n')
+            f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
+            f.write('BBFILE_PATTERN_IGNORE_EMPTY_workspacelayer = "1"\n')
+            f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
+        # Add a README file
+        with open(os.path.join(workspacedir, 'README'), 'w') as f:
+            f.write('This layer was created by the OpenEmbedded devtool utility in order to\n')
+            f.write('contain recipes and bbappends. In most instances you should use the\n')
+            f.write('devtool utility to manage files within it rather than modifying files\n')
+            f.write('directly (although recipes added with "devtool add" will often need\n')
+            f.write('direct modification.)\n')
+            f.write('\nIf you no longer need to use devtool you can remove the path to this\n')
+            f.write('workspace layer from your conf/bblayers.conf file (and then delete the\n')
+            f.write('layer, if you wish).\n')
+    if not create_only:
+        # Add the workspace layer to bblayers.conf
+        bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
+        if not os.path.exists(bblayers_conf):
+            logger.error('Unable to find bblayers.conf')
+            return -1
+        bb.utils.edit_bblayers_conf(bblayers_conf, workspacedir, config.workspace_path)
+        if config.workspace_path != workspacedir:
+            # Update our config to point to the new location
+            config.workspace_path = workspacedir
+            config.write()
+
+
+def main():
+    global basepath
+    global config
+    global context
+
+    context = Context(fixed_setup=False)
+
+    # Default basepath
+    basepath = os.path.dirname(os.path.abspath(__file__))
+    pth = basepath
+    while pth != '' and pth != os.sep:
+        if os.path.exists(os.path.join(pth, '.devtoolbase')):
+            context.fixed_setup = True
+            basepath = pth
+            break
+        pth = os.path.dirname(pth)
+
+    parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
+                                     epilog="Use %(prog)s <command> --help to get help on a specific command")
+    parser.add_argument('--basepath', help='Base directory of SDK / build directory')
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    parser.add_argument('--color', help='Colorize output', choices=['auto', 'always', 'never'], default='auto')
+
+    subparsers = parser.add_subparsers(dest="subparser_name")
+
+    if not context.fixed_setup:
+        parser_create_workspace = subparsers.add_parser('create-workspace', help='Set up a workspace')
+        parser_create_workspace.add_argument('directory', nargs='?', help='Directory for the workspace')
+        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace, do not alter configuration')
+        parser_create_workspace.set_defaults(func=create_workspace)
+
+    scriptutils.load_plugins(logger, plugins, os.path.join(scripts_path, 'lib', 'devtool'))
+    for plugin in plugins:
+        if hasattr(plugin, 'register_commands'):
+            plugin.register_commands(subparsers, context)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    if args.basepath:
+        # Override
+        basepath = args.basepath
+    elif not context.fixed_setup:
+        basepath = os.environ.get('BUILDDIR')
+        if not basepath:
+            logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+            sys.exit(1)
+
+    logger.debug('Using basepath %s' % basepath)
+
+    config = ConfigHandler(os.path.join(basepath, 'conf', 'devtool.conf'))
+    if not config.read():
+        return -1
+
+    bitbake_subdir = config.get('General', 'bitbake_subdir', '')
+    if bitbake_subdir:
+        # Normally set for use within the SDK
+        logger.debug('Using bitbake subdir %s' % bitbake_subdir)
+        sys.path.insert(0, os.path.join(basepath, bitbake_subdir, 'lib'))
+        core_meta_subdir = config.get('General', 'core_meta_subdir')
+        sys.path.insert(0, os.path.join(basepath, core_meta_subdir, 'lib'))
+    else:
+        # Standard location
+        import scriptpath
+        bitbakepath = scriptpath.add_bitbake_lib_path()
+        if not bitbakepath:
+            logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+            sys.exit(1)
+        logger.debug('Using standard bitbake path %s' % bitbakepath)
+        scriptpath.add_oe_lib_path()
+
+    scriptutils.logger_setup_color(logger, args.color)
+
+    if args.subparser_name != 'create-workspace':
+        read_workspace()
+
+    ret = args.func(args, config, basepath, workspace)
+
+    return ret
+
+
+if __name__ == "__main__":
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc(5)
+    sys.exit(ret)
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
new file mode 100644
index 0000000..3f8158e
--- /dev/null
+++ b/scripts/lib/devtool/__init__.py
@@ -0,0 +1,78 @@
+#!/usr/bin/env python
+
+# Development tool - utility functions for plugins
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+
+import os
+import sys
+import subprocess
+import logging
+
+logger = logging.getLogger('devtool')
+
+def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
+    import bb
+    if not 'cwd' in options:
+        options["cwd"] = builddir
+    if init_path:
+        logger.debug('Executing command: "%s" using init path %s' % (cmd, init_path))
+        init_prefix = '. %s %s > /dev/null && ' % (init_path, builddir)
+    else:
+        logger.debug('Executing command "%s"' % cmd)
+        init_prefix = ''
+    if watch:
+        if sys.stdout.isatty():
+            # Fool bitbake into thinking it's outputting to a terminal (because it is, indirectly)
+            cmd = 'script -q -c "%s" /dev/null' % cmd
+        return exec_watch('%s%s' % (init_prefix, cmd), **options)
+    else:
+        return bb.process.run('%s%s' % (init_prefix, cmd), **options)
+
+def exec_watch(cmd, **options):
+    if isinstance(cmd, basestring) and not "shell" in options:
+        options["shell"] = True
+
+    process = subprocess.Popen(
+        cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, **options
+    )
+
+    buf = ''
+    while True:
+        out = process.stdout.read(1)
+        if out:
+            sys.stdout.write(out)
+            sys.stdout.flush()
+            buf += out
+        elif out == '' and process.poll() != None:
+            break
+    return buf
+
+def setup_tinfoil():
+    import scriptpath
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        sys.exit(1)
+
+    import bb.tinfoil
+    import logging
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare(False)
+    tinfoil.logger.setLevel(logging.WARNING)
+    return tinfoil
+
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
new file mode 100644
index 0000000..69bb228
--- /dev/null
+++ b/scripts/lib/devtool/standard.py
@@ -0,0 +1,545 @@
+# Development tool - standard commands plugin
+#
+# Copyright (C) 2014 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+
+import os
+import sys
+import re
+import shutil
+import glob
+import tempfile
+import logging
+import argparse
+from devtool import exec_build_env_command, setup_tinfoil
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    pass
+
+
+def add(args, config, basepath, workspace):
+    import bb
+    import oe.recipeutils
+
+    if args.recipename in workspace:
+        logger.error("recipe %s is already in your workspace" % args.recipename)
+        return -1
+
+    reason = oe.recipeutils.validate_pn(args.recipename)
+    if reason:
+        logger.error(reason)
+        return -1
+
+    srctree = os.path.abspath(args.srctree)
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    if not os.path.exists(appendpath):
+        os.makedirs(appendpath)
+
+    recipedir = os.path.join(config.workspace_path, 'recipes', args.recipename)
+    bb.utils.mkdirhier(recipedir)
+    if args.version:
+        if '_' in args.version or ' ' in args.version:
+            logger.error('Invalid version string "%s"' % args.version)
+            return -1
+        bp = "%s_%s" % (args.recipename, args.version)
+    else:
+        bp = args.recipename
+    recipefile = os.path.join(recipedir, "%s.bb" % bp)
+    if sys.stdout.isatty():
+        color = 'always'
+    else:
+        color = args.color
+    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s %s' % (color, recipefile, srctree))
+    logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+
+    _add_md5(config, args.recipename, recipefile)
+
+    initial_rev = None
+    if os.path.exists(os.path.join(srctree, '.git')):
+        (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
+        initial_rev = stdout.rstrip()
+
+    appendfile = os.path.join(appendpath, '%s.bbappend' % args.recipename)
+    with open(appendfile, 'w') as f:
+        f.write('inherit externalsrc\n')
+        f.write('EXTERNALSRC = "%s"\n' % srctree)
+        if initial_rev:
+            f.write('\n# initial_rev: %s\n' % initial_rev)
+
+    _add_md5(config, args.recipename, appendfile)
+
+    return 0
+
+
+def _get_recipe_file(cooker, pn):
+    import oe.recipeutils
+    recipefile = oe.recipeutils.pn_to_recipe(cooker, pn)
+    if not recipefile:
+        skipreasons = oe.recipeutils.get_unavailable_reasons(cooker, pn)
+        if skipreasons:
+            logger.error('\n'.join(skipreasons))
+        else:
+            logger.error("Unable to find any recipe file matching %s" % pn)
+    return recipefile
+
+
+def extract(args, config, basepath, workspace):
+    import bb
+    import oe.recipeutils
+
+    tinfoil = setup_tinfoil()
+
+    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
+    if not recipefile:
+        # Error already logged
+        return -1
+    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+
+    srctree = os.path.abspath(args.srctree)
+    initial_rev = _extract_source(srctree, args.keep_temp, args.branch, rd)
+    if initial_rev:
+        return 0
+    else:
+        return -1
+
+
+def _extract_source(srctree, keep_temp, devbranch, d):
+    import bb.event
+
+    def eventfilter(name, handler, event, d):
+        if name == 'base_eventhandler':
+            return True
+        else:
+            return False
+
+    if hasattr(bb.event, 'set_eventfilter'):
+        bb.event.set_eventfilter(eventfilter)
+
+    pn = d.getVar('PN', True)
+
+    if pn == 'perf':
+        logger.error("The perf recipe does not actually check out source and thus cannot be supported by this tool")
+        return None
+
+    if 'work-shared' in d.getVar('S', True):
+        logger.error("The %s recipe uses a shared workdir which this tool does not currently support" % pn)
+        return None
+
+    if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
+        logger.error("externalsrc is currently enabled for the %s recipe. This prevents the normal do_patch task from working. You will need to disable this first." % pn)
+        return None
+
+    if os.path.exists(srctree):
+        if not os.path.isdir(srctree):
+            logger.error("output path %s exists and is not a directory" % srctree)
+            return None
+        elif os.listdir(srctree):
+            logger.error("output path %s already exists and is non-empty" % srctree)
+            return None
+
+    # Prepare for shutil.move later on
+    bb.utils.mkdirhier(srctree)
+    os.rmdir(srctree)
+
+    initial_rev = None
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        crd = d.createCopy()
+        # Make a subdir so we guard against WORKDIR==S
+        workdir = os.path.join(tempdir, 'workdir')
+        crd.setVar('WORKDIR', workdir)
+        crd.setVar('T', os.path.join(tempdir, 'temp'))
+
+        # FIXME: This is very awkward. Unfortunately it's not currently easy to properly
+        # execute tasks outside of bitbake itself, until then this has to suffice if we
+        # are to handle e.g. linux-yocto's extra tasks
+        executed = []
+        def exec_task_func(func, report):
+            if not func in executed:
+                deps = crd.getVarFlag(func, 'deps')
+                if deps:
+                    for taskdepfunc in deps:
+                        exec_task_func(taskdepfunc, True)
+                if report:
+                    logger.info('Executing %s...' % func)
+                fn = d.getVar('FILE', True)
+                localdata = bb.build._task_data(fn, func, crd)
+                bb.build.exec_func(func, localdata)
+                executed.append(func)
+
+        logger.info('Fetching %s...' % pn)
+        exec_task_func('do_fetch', False)
+        logger.info('Unpacking...')
+        exec_task_func('do_unpack', False)
+        srcsubdir = crd.getVar('S', True)
+        if srcsubdir != workdir and os.path.dirname(srcsubdir) != workdir:
+            # Handle if S is set to a subdirectory of the source
+            srcsubdir = os.path.join(workdir, os.path.relpath(srcsubdir, workdir).split(os.sep)[0])
+
+        patchdir = os.path.join(srcsubdir, 'patches')
+        haspatches = False
+        if os.path.exists(patchdir):
+            if os.listdir(patchdir):
+                haspatches = True
+            else:
+                os.rmdir(patchdir)
+
+        if not bb.data.inherits_class('kernel-yocto', d):
+            if not os.listdir(srcsubdir):
+                logger.error("no source unpacked to S, perhaps the %s recipe doesn't use any source?" % pn)
+                return None
+
+            if not os.path.exists(os.path.join(srcsubdir, '.git')):
+                bb.process.run('git init', cwd=srcsubdir)
+                bb.process.run('git add .', cwd=srcsubdir)
+                bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
+
+            (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
+            initial_rev = stdout.rstrip()
+
+            bb.process.run('git checkout -b %s' % devbranch, cwd=srcsubdir)
+            bb.process.run('git tag -f devtool-base', cwd=srcsubdir)
+
+            crd.setVar('PATCHTOOL', 'git')
+
+        logger.info('Patching...')
+        exec_task_func('do_patch', False)
+
+        bb.process.run('git tag -f devtool-patched', cwd=srcsubdir)
+
+        if os.path.exists(patchdir):
+            shutil.rmtree(patchdir)
+            if haspatches:
+                bb.process.run('git checkout patches', cwd=srcsubdir)
+
+        shutil.move(srcsubdir, srctree)
+        logger.info('Source tree extracted to %s' % srctree)
+    finally:
+        if keep_temp:
+            logger.info('Preserving temporary directory %s' % tempdir)
+        else:
+            shutil.rmtree(tempdir)
+    return initial_rev
+
+def _add_md5(config, recipename, filename):
+    import bb.utils
+    md5 = bb.utils.md5_file(filename)
+    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
+        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
+
+def _check_preserve(config, recipename):
+    import bb.utils
+    origfile = os.path.join(config.workspace_path, '.devtool_md5')
+    newfile = os.path.join(config.workspace_path, '.devtool_md5_new')
+    preservepath = os.path.join(config.workspace_path, 'attic')
+    with open(origfile, 'r') as f:
+        with open(newfile, 'w') as tf:
+            for line in f.readlines():
+                splitline = line.rstrip().split('|')
+                if splitline[0] == recipename:
+                    removefile = os.path.join(config.workspace_path, splitline[1])
+                    md5 = bb.utils.md5_file(removefile)
+                    if splitline[2] != md5:
+                        bb.utils.mkdirhier(preservepath)
+                        preservefile = os.path.basename(removefile)
+                        logger.warn('File %s modified since it was written, preserving in %s' % (preservefile, preservepath))
+                        shutil.move(removefile, os.path.join(preservepath, preservefile))
+                    else:
+                        os.remove(removefile)
+                else:
+                    tf.write(line)
+    os.rename(newfile, origfile)
+
+    return False
+
+
+def modify(args, config, basepath, workspace):
+    import bb
+    import oe.recipeutils
+
+    if args.recipename in workspace:
+        logger.error("recipe %s is already in your workspace" % args.recipename)
+        return -1
+
+    if not args.extract:
+        if not os.path.isdir(args.srctree):
+            logger.error("directory %s does not exist or not a directory (specify -x to extract source from recipe)" % args.srctree)
+            return -1
+
+    tinfoil = setup_tinfoil()
+
+    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
+    if not recipefile:
+        # Error already logged
+        return -1
+    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+
+    initial_rev = None
+    commits = []
+    srctree = os.path.abspath(args.srctree)
+    if args.extract:
+        initial_rev = _extract_source(args.srctree, False, args.branch, rd)
+        if not initial_rev:
+            return -1
+        # Get list of commits since this revision
+        (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
+        commits = stdout.split()
+    else:
+        if os.path.exists(os.path.join(args.srctree, '.git')):
+            (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
+            initial_rev = stdout.rstrip()
+
+    # Handle if S is set to a subdirectory of the source
+    s = rd.getVar('S', True)
+    workdir = rd.getVar('WORKDIR', True)
+    if s != workdir and os.path.dirname(s) != workdir:
+        srcsubdir = os.sep.join(os.path.relpath(s, workdir).split(os.sep)[1:])
+        srctree = os.path.join(srctree, srcsubdir)
+
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    if not os.path.exists(appendpath):
+        os.makedirs(appendpath)
+
+    appendname = os.path.splitext(os.path.basename(recipefile))[0]
+    if args.wildcard:
+        appendname = re.sub(r'_.*', '_%', appendname)
+    appendfile = os.path.join(appendpath, appendname + '.bbappend')
+    with open(appendfile, 'w') as f:
+        f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n\n')
+        f.write('inherit externalsrc\n')
+        f.write('# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND\n')
+        f.write('EXTERNALSRC_pn-%s = "%s"\n' % (args.recipename, srctree))
+        if bb.data.inherits_class('autotools-brokensep', rd):
+            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+            f.write('EXTERNALSRC_BUILD_pn-%s = "%s"\n' % (args.recipename, srctree))
+        if initial_rev:
+            f.write('\n# initial_rev: %s\n' % initial_rev)
+            for commit in commits:
+                f.write('# commit: %s\n' % commit)
+
+    _add_md5(config, args.recipename, appendfile)
+
+    logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
+
+    return 0
+
+
+def update_recipe(args, config, basepath, workspace):
+    if not args.recipename in workspace:
+        logger.error("no recipe named %s in your workspace" % args.recipename)
+        return -1
+
+    # Get initial revision from bbappend
+    appends = glob.glob(os.path.join(config.workspace_path, 'appends', '%s_*.bbappend' % args.recipename))
+    if not appends:
+        logger.error('unable to find workspace bbappend for recipe %s' % args.recipename)
+        return -1
+
+    tinfoil = setup_tinfoil()
+    import bb
+    from oe.patch import GitApplyTree
+    import oe.recipeutils
+
+    srctree = workspace[args.recipename]
+    commits = []
+    update_rev = None
+    if args.initial_rev:
+        initial_rev = args.initial_rev
+    else:
+        initial_rev = None
+        with open(appends[0], 'r') as f:
+            for line in f:
+                if line.startswith('# initial_rev:'):
+                    initial_rev = line.split(':')[-1].strip()
+                elif line.startswith('# commit:'):
+                    commits.append(line.split(':')[-1].strip())
+
+        if initial_rev:
+            # Find first actually changed revision
+            (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
+            newcommits = stdout.split()
+            for i in xrange(min(len(commits), len(newcommits))):
+                if newcommits[i] == commits[i]:
+                    update_rev = commits[i]
+
+    if not initial_rev:
+        logger.error('Unable to find initial revision - please specify it with --initial-rev')
+        return -1
+
+    if not update_rev:
+        update_rev = initial_rev
+
+    # Find list of existing patches in recipe file
+    recipefile = _get_recipe_file(tinfoil.cooker, args.recipename)
+    if not recipefile:
+        # Error already logged
+        return -1
+    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+    existing_patches = oe.recipeutils.get_recipe_patches(rd)
+
+    removepatches = []
+    if not args.no_remove:
+        # Get all patches from source tree and check if any should be removed
+        tempdir = tempfile.mkdtemp(prefix='devtool')
+        try:
+            GitApplyTree.extractPatches(srctree, initial_rev, tempdir)
+            newpatches = os.listdir(tempdir)
+            for patch in existing_patches:
+                patchfile = os.path.basename(patch)
+                if patchfile not in newpatches:
+                    removepatches.append(patch)
+        finally:
+            shutil.rmtree(tempdir)
+
+    # Get updated patches from source tree
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        GitApplyTree.extractPatches(srctree, update_rev, tempdir)
+
+        # Match up and replace existing patches with corresponding new patches
+        updatepatches = False
+        updaterecipe = False
+        newpatches = os.listdir(tempdir)
+        for patch in existing_patches:
+            patchfile = os.path.basename(patch)
+            if patchfile in newpatches:
+                logger.info('Updating patch %s' % patchfile)
+                shutil.move(os.path.join(tempdir, patchfile), patch)
+                newpatches.remove(patchfile)
+                updatepatches = True
+        srcuri = (rd.getVar('SRC_URI', False) or '').split()
+        if newpatches:
+            # Add any patches left over
+            patchdir = os.path.join(os.path.dirname(recipefile), rd.getVar('BPN', True))
+            bb.utils.mkdirhier(patchdir)
+            for patchfile in newpatches:
+                logger.info('Adding new patch %s' % patchfile)
+                shutil.move(os.path.join(tempdir, patchfile), os.path.join(patchdir, patchfile))
+                srcuri.append('file://%s' % patchfile)
+                updaterecipe = True
+        if removepatches:
+            # Remove any patches that we don't need
+            for patch in removepatches:
+                patchfile = os.path.basename(patch)
+                for i in xrange(len(srcuri)):
+                    if srcuri[i].startswith('file://') and os.path.basename(srcuri[i]).split(';')[0] == patchfile:
+                        logger.info('Removing patch %s' % patchfile)
+                        srcuri.pop(i)
+                        # FIXME "git rm" here would be nice if the file in question is tracked
+                        # FIXME there's a chance that this file is referred to by another recipe, in which case deleting wouldn't be the right thing to do
+                        os.remove(patch)
+                        updaterecipe = True
+                        break
+        if updaterecipe:
+            logger.info('Updating recipe %s' % os.path.basename(recipefile))
+            oe.recipeutils.patch_recipe(rd, recipefile, {'SRC_URI': ' '.join(srcuri)})
+        elif not updatepatches:
+            # Neither patches nor recipe were updated
+            logger.info('No patches need updating')
+    finally:
+        shutil.rmtree(tempdir)
+
+    return 0
+
+
+def status(args, config, basepath, workspace):
+    if workspace:
+        for recipe, value in workspace.iteritems():
+            print("%s: %s" % (recipe, value))
+    else:
+        logger.info('No recipes currently in your workspace - you can use "devtool modify" to work on an existing recipe or "devtool add" to add a new one')
+    return 0
+
+
+def reset(args, config, basepath, workspace):
+    import bb.utils
+    if not args.recipename in workspace:
+        logger.error("no recipe named %s in your workspace" % args.recipename)
+        return -1
+    _check_preserve(config, args.recipename)
+
+    preservepath = os.path.join(config.workspace_path, 'attic', args.recipename)
+    def preservedir(origdir):
+        if os.path.exists(origdir):
+            for fn in os.listdir(origdir):
+                logger.warn('Preserving %s in %s' % (fn, preservepath))
+                bb.utils.mkdirhier(preservepath)
+                shutil.move(os.path.join(origdir, fn), os.path.join(preservepath, fn))
+            os.rmdir(origdir)
+
+    preservedir(os.path.join(config.workspace_path, 'recipes', args.recipename))
+    # We don't automatically create this dir next to appends, but the user can
+    preservedir(os.path.join(config.workspace_path, 'appends', args.recipename))
+    return 0
+
+
+def build(args, config, basepath, workspace):
+    import bb
+    if not args.recipename in workspace:
+        logger.error("no recipe named %s in your workspace" % args.recipename)
+        return -1
+    exec_build_env_command(config.init_path, basepath, 'bitbake -c install %s' % args.recipename, watch=True)
+
+    return 0
+
+
+def register_commands(subparsers, context):
+    parser_add = subparsers.add_parser('add', help='Add a new recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_add.add_argument('recipename', help='Name for new recipe to add')
+    parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
+    parser_add.set_defaults(func=add)
+
+    parser_add = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_add.add_argument('recipename', help='Name for recipe to edit')
+    parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
+    parser_add.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_add.set_defaults(func=modify)
+
+    parser_add = subparsers.add_parser('extract', help='Extract the source for an existing recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_add.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_add.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_add.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
+    parser_add.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
+    parser_add.set_defaults(func=extract)
+
+    parser_add = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_add.add_argument('recipename', help='Name of recipe to update')
+    parser_add.add_argument('--initial-rev', help='Starting revision for patches')
+    parser_add.add_argument('--no-remove', '-n', action="store_true", help='Don\'t remove patches, only add or update')
+    parser_add.set_defaults(func=update_recipe)
+
+    parser_status = subparsers.add_parser('status', help='Show status',
+                                          formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_status.set_defaults(func=status)
+
+    parser_build = subparsers.add_parser('build', help='Build recipe',
+                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_build.add_argument('recipename', help='Recipe to build')
+    parser_build.set_defaults(func=build)
+
+    parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace',
+                                         formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+    parser_reset.add_argument('recipename', help='Recipe to reset')
+    parser_reset.set_defaults(func=reset)
+
-- 
1.9.3


