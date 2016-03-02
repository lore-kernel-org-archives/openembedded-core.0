Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5E35675E80
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 10:45:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 02 Mar 2016 02:45:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,528,1449561600"; d="scan'208";a="756622429"
Received: from sgominde-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.23])
	by orsmga003.jf.intel.com with ESMTP; 02 Mar 2016 02:45:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 23:44:21 +1300
Message-Id: <50f4ae4320d3e988b1fd0c84d7c237fe288c28e9.1456915391.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456915391.git.paul.eggleton@linux.intel.com>
References: <cover.1456915391.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] devtool: add build-sdk subcommand
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
X-List-Received-Date: Wed, 02 Mar 2016 10:45:04 -0000

Add a build-sdk command which is only available within the extensible
SDK that builds a derivative extensible SDK. The idea is recipes in the
workspace become a part of the new SDK - for example, this allows taking
a vendor provided SDK, adding a few libs and then producing a new SDK
with those included.

When normally building the extensible SDK, the workspace is excluded;
here we need to copy into the new SDK (renaming it in the process); the
recipes' task signatures become locked and thus the sources are no
longer needed, so they are removed along with the workspace bbappends
which would interfere with the locked signatures. Additionally we need
to just copy the configuration files (i.e. local.conf and auto.conf)
rather than filtering and appending to them since that work has already
been done when constructing the original SDK. The extra sstate artifacts
from workspace recipes are also determined and copied into the new SDK
in minimal mode (on the assumption that you won't set up a new sstate
mirror).

This reuses some code from build-image, so that needed to be
generalised to allow that.

Implements [YOCTO #8892].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 148 ++++++++++++++++++++--------------
 meta/lib/oe/copy_buildsystem.py       |  59 ++++++++++++--
 scripts/lib/devtool/build_image.py    |  79 +++++++++++++-----
 scripts/lib/devtool/build_sdk.py      |  65 +++++++++++++++
 4 files changed, 264 insertions(+), 87 deletions(-)
 create mode 100644 scripts/lib/devtool/build_sdk.py

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9e2fc61..192eef2 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -89,7 +89,14 @@ python copy_buildsystem () {
     # Copy in all metadata layers + bitbake (as repositories)
     buildsystem = oe.copy_buildsystem.BuildSystem('extensible SDK', d)
     baseoutpath = d.getVar('SDK_OUTPUT', True) + '/' + d.getVar('SDKPATH', True)
-    layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers')
+
+    # Determine if we're building a derivative extensible SDK (from devtool build-sdk)
+    derivative = (d.getVar('SDK_DERIVATIVE', True) or '') == '1'
+    if derivative:
+        workspace_name = 'orig-workspace'
+    else:
+        workspace_name = None
+    layers_copied = buildsystem.copy_bitbake_and_layers(baseoutpath + '/layers', workspace_name)
 
     sdkbblayers = []
     corebase = os.path.basename(d.getVar('COREBASE', True))
@@ -153,75 +160,81 @@ python copy_buildsystem () {
         f.write('    "\n')
 
     # Create local.conf
-    local_conf_whitelist = (d.getVar('SDK_LOCAL_CONF_WHITELIST', True) or '').split()
-    local_conf_blacklist = (d.getVar('SDK_LOCAL_CONF_BLACKLIST', True) or '').split()
-    def handle_var(varname, origvalue, op, newlines):
-        if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
-            newlines.append('# Removed original setting of %s\n' % varname)
-            return None, op, 0, True
-        else:
-            return origvalue, op, 0, True
-    varlist = ['[^#=+ ]*']
     builddir = d.getVar('TOPDIR', True)
-    with open(builddir + '/conf/local.conf', 'r') as f:
-        oldlines = f.readlines()
-    (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
+    if derivative:
+        shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/conf/local.conf')
+    else:
+        local_conf_whitelist = (d.getVar('SDK_LOCAL_CONF_WHITELIST', True) or '').split()
+        local_conf_blacklist = (d.getVar('SDK_LOCAL_CONF_BLACKLIST', True) or '').split()
+        def handle_var(varname, origvalue, op, newlines):
+            if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
+                newlines.append('# Removed original setting of %s\n' % varname)
+                return None, op, 0, True
+            else:
+                return origvalue, op, 0, True
+        varlist = ['[^#=+ ]*']
+        with open(builddir + '/conf/local.conf', 'r') as f:
+            oldlines = f.readlines()
+        (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
 
-    with open(baseoutpath + '/conf/local.conf', 'w') as f:
-        f.write('# WARNING: this configuration has been automatically generated and in\n')
-        f.write('# most cases should not be edited. If you need more flexibility than\n')
-        f.write('# this configuration provides, it is strongly suggested that you set\n')
-        f.write('# up a proper instance of the full build system and use that instead.\n\n')
-        for line in newlines:
-            if line.strip() and not line.startswith('#'):
-                f.write(line)
-        # Write a newline just in case there's none at the end of the original
-        f.write('\n')
+        with open(baseoutpath + '/conf/local.conf', 'w') as f:
+            f.write('# WARNING: this configuration has been automatically generated and in\n')
+            f.write('# most cases should not be edited. If you need more flexibility than\n')
+            f.write('# this configuration provides, it is strongly suggested that you set\n')
+            f.write('# up a proper instance of the full build system and use that instead.\n\n')
+            for line in newlines:
+                if line.strip() and not line.startswith('#'):
+                    f.write(line)
+            # Write a newline just in case there's none at the end of the original
+            f.write('\n')
 
-        f.write('INHERIT += "%s"\n\n' % 'uninative')
-        f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
+            f.write('INHERIT += "%s"\n\n' % 'uninative')
+            f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
-        # Some classes are not suitable for SDK, remove them from INHERIT
-        f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST', False))
+            # Some classes are not suitable for SDK, remove them from INHERIT
+            f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST', False))
 
-        # Bypass the default connectivity check if any
-        f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
+            # Bypass the default connectivity check if any
+            f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
 
-        # Ensure locked sstate cache objects are re-used without error
-        f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "none"\n\n')
+            # Ensure locked sstate cache objects are re-used without error
+            f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "none"\n\n')
 
-        # Hide the config information from bitbake output (since it's fixed within the SDK)
-        f.write('BUILDCFG_HEADER = ""\n')
+            # Hide the config information from bitbake output (since it's fixed within the SDK)
+            f.write('BUILDCFG_HEADER = ""\n')
 
-        # Allow additional config through sdk-extra.conf
-        fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
-        if fn:
-            with open(fn, 'r') as xf:
-                for line in xf:
-                    f.write(line)
+            # Allow additional config through sdk-extra.conf
+            fn = bb.cookerdata.findConfigFile('sdk-extra.conf', d)
+            if fn:
+                with open(fn, 'r') as xf:
+                    for line in xf:
+                        f.write(line)
 
-        # If you define a sdk_extraconf() function then it can contain additional config
-        # (Though this is awkward; sdk-extra.conf should probably be used instead)
-        extraconf = (d.getVar('sdk_extraconf', True) or '').strip()
-        if extraconf:
-            # Strip off any leading / trailing spaces
-            for line in extraconf.splitlines():
-                f.write(line.strip() + '\n')
+            # If you define a sdk_extraconf() function then it can contain additional config
+            # (Though this is awkward; sdk-extra.conf should probably be used instead)
+            extraconf = (d.getVar('sdk_extraconf', True) or '').strip()
+            if extraconf:
+                # Strip off any leading / trailing spaces
+                for line in extraconf.splitlines():
+                    f.write(line.strip() + '\n')
 
-        f.write('require conf/locked-sigs.inc\n')
+            f.write('require conf/locked-sigs.inc\n')
 
     if os.path.exists(builddir + '/conf/auto.conf'):
-        with open(builddir + '/conf/auto.conf', 'r') as f:
-            oldlines = f.readlines()
-        (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
-        with open(baseoutpath + '/conf/auto.conf', 'w') as f:
-            f.write('# WARNING: this configuration has been automatically generated and in\n')
-            f.write('# most cases should not be edited. If you need more flexibility than\n')
-            f.write('# this configuration provides, it is strongly suggested that you set\n')
-            f.write('# up a proper instance of the full build system and use that instead.\n\n')
-            for line in newlines:
-                if line.strip() and not line.startswith('#'):
-                    f.write(line)
+        if derivative:
+            shutil.copyfile(builddir + '/conf/auto.conf', baseoutpath + '/conf/auto.conf')
+        else:
+            with open(builddir + '/conf/auto.conf', 'r') as f:
+                oldlines = f.readlines()
+            (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
+            with open(baseoutpath + '/conf/auto.conf', 'w') as f:
+                f.write('# WARNING: this configuration has been automatically generated and in\n')
+                f.write('# most cases should not be edited. If you need more flexibility than\n')
+                f.write('# this configuration provides, it is strongly suggested that you set\n')
+                f.write('# up a proper instance of the full build system and use that instead.\n\n')
+                for line in newlines:
+                    if line.strip() and not line.startswith('#'):
+                        f.write(line)
 
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = d.getVar('SDK_TARGETS', True)
@@ -248,7 +261,24 @@ python copy_buildsystem () {
                                              lockedsigs_pruned,
                                              lockedsigs_copy)
 
-    if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
+    if d.getVar('SDK_EXT_TYPE', True) == 'minimal':
+        if derivative:
+            # Assume the user is not going to set up an additional sstate
+            # mirror, thus we need to copy the additional artifacts (from
+            # workspace recipes) into the derivative SDK
+            lockedsigs_orig = d.getVar('TOPDIR', True) + '/conf/locked-sigs.inc'
+            if os.path.exists(lockedsigs_orig):
+                lockedsigs_extra = d.getVar('WORKDIR', True) + '/locked-sigs-extra.inc'
+                oe.copy_buildsystem.merge_lockedsigs(None,
+                                                     lockedsigs_orig,
+                                                     lockedsigs_pruned,
+                                                     None,
+                                                     lockedsigs_extra)
+                oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_extra,
+                                                               d.getVar('SSTATE_DIR', True),
+                                                               sstate_out, d,
+                                                               fixedlsbstring)
+    else:
         oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
                                                        d.getVar('SSTATE_DIR', True),
                                                        sstate_out, d,
diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 5074a43..dd0e664 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -20,7 +20,7 @@ class BuildSystem(object):
         self.layerdirs = d.getVar('BBLAYERS', True).split()
         self.layers_exclude = (d.getVar('SDK_LAYERS_EXCLUDE', True) or "").split()
 
-    def copy_bitbake_and_layers(self, destdir):
+    def copy_bitbake_and_layers(self, destdir, workspace_name=None):
         # Copy in all metadata layers + bitbake (as repositories)
         layers_copied = []
         bb.utils.mkdirhier(destdir)
@@ -34,6 +34,14 @@ class BuildSystem(object):
             if layer_exclude in layers:
                 layers.remove(layer_exclude)
 
+        workspace_newname = workspace_name
+        if workspace_newname:
+            layernames = [os.path.basename(layer) for layer in layers]
+            extranum = 0
+            while workspace_newname in layernames:
+                extranum += 1
+                workspace_newname = '%s-%d' % (workspace_name, extranum)
+
         corebase_files = self.d.getVar('COREBASE_FILES', True).split()
         corebase_files = [corebase + '/' +x for x in corebase_files]
         # Make sure bitbake goes in
@@ -42,18 +50,24 @@ class BuildSystem(object):
 
         for layer in layers:
             layerconf = os.path.join(layer, 'conf', 'layer.conf')
+            layernewname = os.path.basename(layer)
+            workspace = False
             if os.path.exists(layerconf):
                 with open(layerconf, 'r') as f:
                     if f.readline().startswith("# ### workspace layer auto-generated by devtool ###"):
-                        bb.plain("NOTE: Excluding local workspace layer %s from %s" % (layer, self.context))
-                        continue
+                        if workspace_newname:
+                            layernewname = workspace_newname
+                            workspace = True
+                        else:
+                            bb.plain("NOTE: Excluding local workspace layer %s from %s" % (layer, self.context))
+                            continue
 
             # If the layer was already under corebase, leave it there
             # since layers such as meta have issues when moved.
             layerdestpath = destdir
             if corebase == os.path.dirname(layer):
                 layerdestpath += '/' + os.path.basename(corebase)
-            layerdestpath += '/' + os.path.basename(layer)
+            layerdestpath += '/' + layernewname
 
             layer_relative = os.path.relpath(layerdestpath,
                                              destdir)
@@ -73,6 +87,38 @@ class BuildSystem(object):
                 else:
                     _smart_copy(layer, layerdestpath)
 
+            if workspace:
+                # Make some adjustments original workspace layer
+                # Drop sources (recipe tasks will be locked, so we don't need them)
+                srcdir = os.path.join(layerdestpath, 'sources')
+                if os.path.isdir(srcdir):
+                    shutil.rmtree(srcdir)
+                # Drop all bbappends except the one for the image the SDK is being built for
+                # (because of externalsrc, the workspace bbappends will interfere with the
+                # locked signatures if present, and we don't need them anyway)
+                image_bbappend = os.path.splitext(os.path.basename(self.d.getVar('FILE', True)))[0] + '.bbappend'
+                appenddir = os.path.join(layerdestpath, 'appends')
+                if os.path.isdir(appenddir):
+                    for fn in os.listdir(appenddir):
+                        if fn == image_bbappend:
+                            continue
+                        else:
+                            os.remove(os.path.join(appenddir, fn))
+                # Drop README
+                readme = os.path.join(layerdestpath, 'README')
+                if os.path.exists(readme):
+                    os.remove(readme)
+                # Filter out comments in layer.conf and change layer name
+                layerconf = os.path.join(layerdestpath, 'conf', 'layer.conf')
+                with open(layerconf, 'r') as f:
+                    origlines = f.readlines()
+                with open(layerconf, 'w') as f:
+                    for line in origlines:
+                        if line.startswith('#'):
+                            continue
+                        line = line.replace('workspacelayer', workspace_newname)
+                        f.write(line)
+
         return layers_copied
 
 def generate_locked_sigs(sigfile, d):
@@ -123,7 +169,7 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
                 if line.endswith('\\\n'):
                     if not line in merged[invalue]:
                         target, task = line.strip().split(':')[:2]
-                        if task in copy_tasks:
+                        if not copy_tasks or task in copy_tasks:
                             tocopy[invalue].append(line)
                         merged[invalue].append(line)
                 else:
@@ -150,7 +196,8 @@ def merge_lockedsigs(copy_tasks, lockedsigs_main, lockedsigs_extra, merged_outpu
             f.write('SIGGEN_LOCKEDSIGS_TYPES = "%s"\n' % ' '.join(fulltypes))
 
     write_sigs_file(copy_output, tocopy.keys(), tocopy)
-    write_sigs_file(merged_output, arch_order, merged)
+    if merged_output:
+        write_sigs_file(merged_output, arch_order, merged)
 
 def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cache, d, fixedlsbstring=""):
     bb.note('Generating sstate-cache...')
diff --git a/scripts/lib/devtool/build_image.py b/scripts/lib/devtool/build_image.py
index ff764fa..e51d766 100644
--- a/scripts/lib/devtool/build_image.py
+++ b/scripts/lib/devtool/build_image.py
@@ -25,6 +25,9 @@ from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, Devtool
 
 logger = logging.getLogger('devtool')
 
+class TargetNotImageError(Exception):
+    pass
+
 def _get_packages(tinfoil, workspace, config):
     """Get list of packages from recipes in the workspace."""
     result = []
@@ -51,6 +54,24 @@ def build_image(args, config, basepath, workspace):
     if not image:
         raise DevtoolError('Unable to determine image to build, please specify one')
 
+    try:
+        if args.add_packages:
+            add_packages = args.add_packages.split(',')
+        else:
+            add_packages = None
+        result, outputdir = build_image_task(config, basepath, workspace, image, add_packages)
+    except TargetNotImageError:
+        if auto_image:
+            raise DevtoolError('Unable to determine image to build, please specify one')
+        else:
+            raise DevtoolError('Specified recipe %s is not an image recipe' % image)
+
+    if result == 0:
+        logger.info('Successfully built %s. You can find output files in %s'
+                    % (image, outputdir))
+    return result
+
+def build_image_task(config, basepath, workspace, image, add_packages=None, task=None, extra_append=None):
     appendfile = os.path.join(config.workspace_path, 'appends',
                               '%s.bbappend' % image)
 
@@ -63,46 +84,60 @@ def build_image(args, config, basepath, workspace):
     rd = parse_recipe(config, tinfoil, image, True)
     if not rd:
         # Error already shown
-        return 1
+        return (1, None)
     if not bb.data.inherits_class('image', rd):
-        if auto_image:
-            raise DevtoolError('Unable to determine image to build, please specify one')
-        else:
-            raise DevtoolError('Specified recipe %s is not an image recipe' % image)
+        raise TargetNotImageError()
 
+    outputdir = None
     try:
-        if workspace or args.add_packages:
-            if args.add_packages:
-                packages = args.add_packages.split(',')
+        if workspace or add_packages:
+            if add_packages:
+                packages = add_packages
             else:
                 packages = _get_packages(tinfoil, workspace, config)
-            if packages:
-                with open(appendfile, 'w') as afile:
+        else:
+            packages = None
+        if not task:
+            if not packages and not add_packages and workspace:
+                logger.warning('No recipes in workspace, building image %s unmodified', image)
+            elif not packages:
+                logger.warning('No packages to add, building image %s unmodified', image)
+
+        if packages or extra_append:
+            bb.utils.mkdirhier(os.path.dirname(appendfile))
+            with open(appendfile, 'w') as afile:
+                if packages:
                     # include packages from workspace recipes into the image
                     afile.write('IMAGE_INSTALL_append = " %s"\n' % ' '.join(packages))
-                    logger.info('Building image %s with the following '
-                                'additional packages: %s', image, ' '.join(packages))
-            else:
-                logger.warning('No packages to add, building image %s unmodified', image)
+                    if not task:
+                        logger.info('Building image %s with the following '
+                                    'additional packages: %s', image, ' '.join(packages))
+                if extra_append:
+                    for line in extra_append:
+                        afile.write('%s\n' % line)
+
+        if task in ['populate_sdk', 'populate_sdk_ext']:
+            outputdir = rd.getVar('SDK_DEPLOY', True)
         else:
-            logger.warning('No recipes in workspace, building image %s unmodified', image)
-
-        deploy_dir_image = tinfoil.config_data.getVar('DEPLOY_DIR_IMAGE', True)
+            outputdir = rd.getVar('DEPLOY_DIR_IMAGE', True)
 
         tinfoil.shutdown()
 
-        # run bitbake to build image
+        options = ''
+        if task:
+            options += '-c %s' % task
+
+        # run bitbake to build image (or specified task)
         try:
             exec_build_env_command(config.init_path, basepath,
-                                'bitbake %s' % image, watch=True)
+                                   'bitbake %s %s' % (options, image), watch=True)
         except ExecutionError as err:
-            return err.exitcode
+            return (err.exitcode, None)
     finally:
         if os.path.isfile(appendfile):
             os.unlink(appendfile)
+    return (0, outputdir)
 
-    logger.info('Successfully built %s. You can find output files in %s'
-                % (image, deploy_dir_image))
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from the build-image plugin"""
diff --git a/scripts/lib/devtool/build_sdk.py b/scripts/lib/devtool/build_sdk.py
new file mode 100644
index 0000000..b89d65b
--- /dev/null
+++ b/scripts/lib/devtool/build_sdk.py
@@ -0,0 +1,65 @@
+# Development tool - build-sdk command plugin
+#
+# Copyright (C) 2015-2016 Intel Corporation
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
+import subprocess
+import logging
+import glob
+import shutil
+import errno
+import sys
+import tempfile
+from devtool import exec_build_env_command, setup_tinfoil, parse_recipe, DevtoolError
+from devtool import build_image
+
+logger = logging.getLogger('devtool')
+
+
+def build_sdk(args, config, basepath, workspace):
+    """Entry point for the devtool build-sdk command"""
+
+    sdk_targets = config.get('SDK', 'sdk_targets', '').split()
+    if sdk_targets:
+        image = sdk_targets[0]
+    else:
+        raise DevtoolError('Unable to determine image to build SDK for')
+
+    extra_append = ['SDK_DERIVATIVE = "1"']
+    try:
+        result, outputdir = build_image.build_image_task(config,
+                                                         basepath,
+                                                         workspace,
+                                                         image,
+                                                         task='populate_sdk_ext',
+                                                         extra_append=extra_append)
+    except build_image.TargetNotImageError:
+        raise DevtoolError('Unable to determine image to build SDK for')
+
+    if result == 0:
+        logger.info('Successfully built SDK. You can find output files in %s'
+                    % outputdir)
+    return result
+
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands"""
+    if context.fixed_setup:
+        parser_build_sdk = subparsers.add_parser('build-sdk',
+                                                 help='Build a derivative SDK of this one',
+                                                 description='Builds an extensible SDK based upon this one and the items in your workspace',
+                                                 group='advanced')
+        parser_build_sdk.set_defaults(func=build_sdk)
-- 
2.5.0


