Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0F1722AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:29:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Nov 2014 09:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637908765"
Received: from ksperera-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.204])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 09:29:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Nov 2014 17:28:46 +0000
Message-Id: <fa6dfe872e31fbdb2590bc17e39ab5816e288244.1416934754.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1416934753.git.paul.eggleton@linux.intel.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 6/7] scripts/devtool: add development helper tool
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
X-List-Received-Date: Tue, 25 Nov 2014 17:29:57 -0000

Provides an easy means to work on developing applications and system
components with the build system.

You can start by creating a workspace layer (only needs to be done
once):

  $ devtool create-workspace

Then you can use the other functions, for example to "modify" the source
for an existing recipe:

  $ devtool modify -x pango /home/projects/pango
  Parsing recipes..done.
  INFO: Fetching pango...
  INFO: Unpacking...
  INFO: Patching...
  INFO: Source tree extracted to /tmp/woot2/
  INFO: Recipe pango now set up to build from /home/projects/pango

The pango source is now extracted to /home/projects/pango, managed in
git, with each patch as a commit, and a bbappend is created in the
workspace layer to use the source in /home/projects/pango when building.

Additionally, you can add a new piece of software:

  $ devtool add pv /home/projects/pv
  INFO: Recipe /path/to/workspace/recipes/pv/pv.bb has been
  automatically created; further editing may be required to make it
  fully functional

The latter uses recipetool to create a skeleton recipe and again sets up
a bbappend to use the source in /home/projects/pv when building.

[YOCTO #6561]
[YOCTO #6653]
[YOCTO #6656]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 | 223 +++++++++++++++++++++++
 scripts/lib/devtool/__init__.py |  79 ++++++++
 scripts/lib/devtool/standard.py | 390 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 692 insertions(+)
 create mode 100755 scripts/devtool
 create mode 100644 scripts/lib/devtool/__init__.py
 create mode 100644 scripts/lib/devtool/standard.py

diff --git a/scripts/devtool b/scripts/devtool
new file mode 100755
index 0000000..eea93e0
--- /dev/null
+++ b/scripts/devtool
@@ -0,0 +1,223 @@
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
+import ConfigParser
+import subprocess
+import logging
+
+basepath = ''
+workspace = {}
+config = None
+context = None
+
+def logger_create(name):
+    logger = logging.getLogger(name)
+    loggerhandler = logging.StreamHandler()
+    loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
+    logger.addHandler(loggerhandler)
+    logger.setLevel(logging.INFO)
+    return logger
+logger = logger_create('devtool')
+
+plugins = []
+
+def load_plugins(pluginpath):
+    global plugins
+
+    def load_plugin(name):
+        logger.debug('Loading plugin %s' % name)
+        fp, pathname, description = imp.find_module(name, [pluginpath])
+        try:
+            return imp.load_module(name, fp, pathname, description)
+        finally:
+            if fp:
+                fp.close()
+
+    logger.debug('Loading plugins from %s...' % pluginpath)
+    import imp
+    for fn in glob.glob(os.path.join(pluginpath, '*.py')):
+        name = os.path.splitext(os.path.basename(fn))[0]
+        if name != '__init__':
+            plugin = load_plugin(name)
+            if hasattr(plugin, 'plugin_init'):
+                plugin.plugin_init(plugins)
+                plugins.append(plugin)
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
+
+            self.workspace_path = self.get('General', 'workspace_path', os.path.join(basepath, 'workspace'))
+
+            return True
+        else:
+            self.config_obj.add_section('General')
+            return True
+
+    def write(self):
+        self.config_obj.set('General', 'workspace_path', self.workspace_path)
+        print self.config_file
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
+        else:
+            logger.error("workspace layer not set up - you can create one by running %s create-workspace" % os.path.basename(sys.argv[0]))
+        sys.exit(1)
+
+    logger.debug('Reading workspace in %s' % config.workspace_path)
+    for fn in glob.glob(os.path.join(config.workspace_path, 'appends', '*.bbappend')):
+        pn = os.path.splitext(os.path.basename(fn))[0].split('_')[0]
+        with open(fn, 'r') as f:
+            for line in f:
+                if line.startswith('EXTERNALSRC ='):
+                    splitval = line.split('=', 2)
+                    workspace[pn] = splitval[1].strip('" \n\r\t')
+                    break
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
+    scripts_path = os.path.dirname(os.path.realpath(__file__))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+
+    parser = argparse.ArgumentParser(description="OpenEmbedded development tool")
+    parser.add_argument('--basepath', help='Base directory of SDK / build directory')
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+
+    subparsers = parser.add_subparsers(dest="subparser_name")
+
+    load_plugins(os.path.join(scripts_path, 'lib', 'devtool'))
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
+    config = ConfigHandler(os.path.join(basepath, 'devtool.conf'))
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
index 0000000..3cad708
--- /dev/null
+++ b/scripts/lib/devtool/__init__.py
@@ -0,0 +1,79 @@
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
+    scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+    lib_path = scripts_path + '/lib'
+    sys.path = sys.path + [lib_path]
+
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
index 0000000..82c5b53
--- /dev/null
+++ b/scripts/lib/devtool/standard.py
@@ -0,0 +1,390 @@
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
+from devtool import exec_build_env_command, setup_tinfoil
+
+logger = logging.getLogger('devtool')
+
+def plugin_init(pluginlist):
+    pass
+
+
+def create_workspace(args, config, basepath, workspace):
+    import bb
+
+    if args.directory:
+        workspacedir = os.path.abspath(args.directory)
+    else:
+        workspacedir = os.path.abspath(os.path.join(basepath, 'workspace'))
+
+    confdir = os.path.join(workspacedir, 'conf')
+    if os.path.exists(os.path.join(confdir, 'layer.conf')):
+        logger.info('Specified workspace already set up, leaving as-is')
+    else:
+        bb.utils.mkdirhier(confdir)
+        with open(os.path.join(confdir, 'layer.conf'), 'w') as f:
+            f.write('# ### workspace layer auto-generated by devtool ###\n')
+            f.write('BBPATH =. "$' + '{LAYERDIR}:"\n')
+            f.write('BBFILES += "$' + '{LAYERDIR}/recipes/*/*.bb \\\n')
+            f.write('            $' + '{LAYERDIR}/appends/*.bbappend"\n')
+            f.write('BBFILE_COLLECTIONS += "workspacelayer"\n')
+            f.write('BBFILE_PATTERN_workspacelayer = "^$' + '{LAYERDIR}/"\n')
+            f.write('BBFILE_PRIORITY_workspacelayer = "99"\n')
+    if not args.create_only:
+        # Add the workspace layer to bblayers.conf
+        bblayers_conf = os.path.join(basepath, 'conf', 'bblayers.conf')
+        if not os.path.exists(bblayers_conf):
+            logger.error('Unable to find bblayers.conf')
+            return -1
+        newlines = []
+        with open(bblayers_conf, 'r') as f:
+            bblayers_found = False
+            updated = False
+            in_bblayers = False
+            bblayers = ''
+            for line in f:
+                if in_bblayers:
+                    value = line.rstrip()
+                    bblayers += value[:-1]
+                    if value.endswith('"'):
+                        in_bblayers = False
+                        bblayers = bblayers.split()
+                        if workspacedir not in bblayers:
+                            updated = True
+                            bblayers.append(workspacedir)
+                        if workspacedir != config.workspace_path and config.workspace_path in bblayers:
+                            bblayers.remove(config.workspace_path)
+                        newlines.append('BBLAYERS ?= " \\\n')
+                        for layer in bblayers:
+                            newlines.append('  %s \\\n' % layer)
+                        newlines.append('  "\n')
+                else:
+                    if line.startswith('BBLAYERS '):
+                        bblayers_found = True
+                        in_bblayers = True
+                        value = line.split('"', 1)[1].rstrip()
+                        if value.endswith('\\'):
+                            value = value[:-1]
+                        bblayers = value
+                    else:
+                        newlines.append(line)
+        if not bblayers_found:
+            logger.error('Found bblayers.conf but could not find BBLAYERS value to update')
+            return -1
+        if updated:
+            # Write out the new bblayers.conf
+            with open(bblayers_conf, 'w') as f:
+                f.writelines(newlines)
+        if config.workspace_path != workspacedir:
+            # Update our config to point to the new location
+            config.workspace_path = workspacedir
+            config.write()
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
+    stdout, stderr = exec_build_env_command(config.init_path, basepath, 'recipetool create -o %s %s' % (recipefile, srctree))
+    logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
+
+    _add_md5(config, args.recipename, recipefile)
+
+    appendfile = os.path.join(appendpath, '%s.bbappend' % args.recipename)
+    with open(appendfile, 'w') as f:
+        f.write('inherit externalsrc\n')
+        f.write('EXTERNALSRC = "%s"\n' % srctree)
+        f.write('do_compile[nostamp] = "1"\n')
+
+    _add_md5(config, args.recipename, appendfile)
+
+    return 0
+
+
+def extract(args, config, basepath, workspace):
+    import bb
+    import oe.recipeutils
+
+    tinfoil = setup_tinfoil()
+
+    recipefile = oe.recipeutils.pn_to_recipe(tinfoil.cooker, args.recipename)
+    if not recipefile:
+        logger.error("Unable to find any recipe file matching %s" % args.recipename)
+        return -1
+    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+
+    srctree = os.path.abspath(args.srctree)
+    return _extract_source(srctree, rd)
+
+
+def _extract_source(srctree, d):
+    pn = d.getVar('PN', True)
+
+    if os.path.exists(srctree):
+        if not os.path.isdir(srctree):
+            logger.error("output path %s exists and is not a directory" % srctree)
+            return -1
+        elif os.listdir(srctree):
+            logger.error("output path %s already exists and is non-empty" % srctree)
+            return -1
+
+    # Prepare for shutil.move later on
+    bb.utils.mkdirhier(srctree)
+    os.rmdir(srctree)
+
+    tempdir = tempfile.mkdtemp(prefix='devtool')
+    try:
+        crd = d.createCopy()
+        # Make a subdir so we guard against WORKDIR==S
+        workdir = os.path.join(tempdir, 'workdir')
+        crd.setVar('WORKDIR', workdir)
+        crd.setVar('T', os.path.join(tempdir, 'temp'))
+        logger.info('Fetching %s...' % pn)
+        bb.build.exec_func('do_fetch', crd)
+        logger.info('Unpacking...')
+        bb.build.exec_func('do_unpack', crd)
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
+        if not os.listdir(srcsubdir):
+            logger.error("no source unpacked to S, perhaps the %s recipe doesn't use any source?" % pn)
+            return -1
+
+        if not os.path.exists(os.path.join(srcsubdir, '.git')):
+            bb.process.run('git init', cwd=srcsubdir)
+            bb.process.run('git add .', cwd=srcsubdir)
+            bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
+        logger.info('Patching...')
+        crd.setVar('PATCHTOOL', 'git')
+        bb.build.exec_func('do_patch', crd)
+
+        if os.path.exists(patchdir):
+            shutil.rmtree(patchdir)
+            if haspatches:
+                bb.process.run('git checkout patches', cwd=srcsubdir)
+
+        shutil.move(srcsubdir, srctree)
+        logger.info('Source tree extracted to %s' % srctree)
+    finally:
+        shutil.rmtree(tempdir)
+    return 0
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
+    recipefile = oe.recipeutils.pn_to_recipe(tinfoil.cooker, args.recipename)
+    if not recipefile:
+        logger.error("Unable to find any recipe file matching %s" % args.recipename)
+        return -1
+    rd = oe.recipeutils.parse_recipe(recipefile, tinfoil.config_data)
+
+    srctree = os.path.abspath(args.srctree)
+    if args.extract:
+        ret = _extract_source(args.srctree, rd)
+        if ret:
+            return ret
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
+        f.write('EXTERNALSRC = "%s"\n' % srctree)
+        if bb.data.inherits_class('autotools-brokensep', rd):
+            logger.info('using source tree as build directory since original recipe inherits autotools-brokensep')
+            f.write('EXTERNALSRC_BUILD = "%s"\n' % srctree)
+        f.write('do_compile[nostamp] = "1"\n')
+
+    _add_md5(config, args.recipename, appendfile)
+
+    logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
+
+    return 0
+
+
+def status(args, config, basepath, workspace):
+    for recipe, value in workspace.iteritems():
+        print("%s: %s" % (recipe, value))
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
+    if not context.fixed_setup:
+        parser_create_workspace = subparsers.add_parser('create-workspace', help='Set up a workspace')
+        parser_create_workspace.add_argument('directory', nargs='?', help='Directory for the workspace')
+        parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace, do not alter configuration')
+        parser_create_workspace.set_defaults(func=create_workspace)
+
+    parser_add = subparsers.add_parser('add', help='Add a new recipe')
+    parser_add.add_argument('recipename', help='Name for new recipe to add')
+    parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
+    parser_add.set_defaults(func=add)
+
+    parser_add = subparsers.add_parser('modify', help='Modify the source for an existing recipe')
+    parser_add.add_argument('recipename', help='Name for recipe to edit')
+    parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
+    parser_add.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    parser_add.set_defaults(func=modify)
+
+    parser_add = subparsers.add_parser('extract', help='Extract the source for an existing recipe')
+    parser_add.add_argument('recipename', help='Name for recipe to extract the source for')
+    parser_add.add_argument('srctree', help='Path to where to extract the source tree')
+    parser_add.set_defaults(func=extract)
+
+    parser_status = subparsers.add_parser('status', help='Show status')
+    parser_status.set_defaults(func=status)
+
+    parser_build = subparsers.add_parser('build', help='Build recipe')
+    parser_build.add_argument('recipename', help='Recipe to build')
+    parser_build.set_defaults(func=build)
+
+    parser_reset = subparsers.add_parser('reset', help='Remove a recipe from your workspace')
+    parser_reset.add_argument('recipename', help='Recipe to reset')
+    parser_reset.set_defaults(func=reset)
+
-- 
1.9.3


