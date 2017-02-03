Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 584E271A82
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 20:48:32 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Feb 2017 12:48:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,330,1477983600"; d="scan'208";a="221089740"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2017 12:48:33 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0B9E86A4006;
	Fri,  3 Feb 2017 12:47:32 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2017 22:26:06 +0200
Message-Id: <1486153566-20026-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] wic: flatten imager class hierarchy
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
X-List-Received-Date: Fri, 03 Feb 2017 20:48:35 -0000

wic code is hard to follow due to deep and twiggy class
inheritance tree.

Flatten imager tree:
 wic -> wic_create -> Creator -> DirectPlugin -> DirectImageCreator
to
 wic -> wic_create -> DirectPlugin
by
 removing Creator class and creator module
 merging DirectImageCreator into DirectPlugin

Changed APIs to use the same parameters names.

Passed parsed command line options as an object down the stack.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/creator.py               | 106 ------------------------------
 scripts/lib/wic/engine.py                |  32 ++++-----
 scripts/lib/wic/plugins/imager/direct.py | 108 +++++++++++--------------------
 scripts/wic                              |   3 +-
 4 files changed, 56 insertions(+), 193 deletions(-)
 delete mode 100644 scripts/lib/wic/creator.py

diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
deleted file mode 100644
index 74db83c..0000000
--- a/scripts/lib/wic/creator.py
+++ /dev/null
@@ -1,106 +0,0 @@
-#!/usr/bin/env python -tt
-#
-# Copyright (c) 2011 Intel, Inc.
-#
-# This program is free software; you can redistribute it and/or modify it
-# under the terms of the GNU General Public License as published by the Free
-# Software Foundation; version 2 of the License
-#
-# This program is distributed in the hope that it will be useful, but
-# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
-# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
-# for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc., 59
-# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
-
-import os, sys
-from optparse import OptionParser, SUPPRESS_HELP
-
-from wic import msger
-from wic.utils import errors
-from wic.plugin import pluginmgr
-
-class Creator():
-    """${name}: create an image
-
-    Usage:
-        ${name} SUBCOMMAND <ksfile> [OPTS]
-
-    ${command_list}
-    ${option_list}
-    """
-
-    name = 'wic create(cr)'
-
-    def __init__(self, *args, **kwargs):
-        self._subcmds = {}
-
-        # get cmds from pluginmgr
-        # mix-in do_subcmd interface
-        for subcmd, klass in pluginmgr.get_plugins('imager').items():
-            if not hasattr(klass, 'do_create'):
-                msger.warning("Unsupported subcmd: %s" % subcmd)
-                continue
-
-            func = getattr(klass, 'do_create')
-            self._subcmds[subcmd] = func
-
-    def get_optparser(self):
-        optparser = OptionParser()
-        optparser.add_option('-d', '--debug', action='store_true',
-                             dest='debug',
-                             help=SUPPRESS_HELP)
-        optparser.add_option('-v', '--verbose', action='store_true',
-                             dest='verbose',
-                             help=SUPPRESS_HELP)
-        optparser.add_option('', '--logfile', type='string', dest='logfile',
-                             default=None,
-                             help='Path of logfile')
-        optparser.add_option('-c', '--config', type='string', dest='config',
-                             default=None,
-                             help='Specify config file for wic')
-        optparser.add_option('-o', '--outdir', type='string', action='store',
-                             dest='outdir', default=None,
-                             help='Output directory')
-        optparser.add_option('', '--tmpfs', action='store_true', dest='enabletmpfs',
-                             help='Setup tmpdir as tmpfs to accelerate, experimental'
-                                  ' feature, use it if you have more than 4G memory')
-        optparser.add_option('', '--bmap', action='store_true', help='generate .bmap')
-        return optparser
-
-    def postoptparse(self, options):
-        abspath = lambda pth: os.path.abspath(os.path.expanduser(pth))
-
-        if options.verbose:
-            msger.set_loglevel('verbose')
-        if options.debug:
-            msger.set_loglevel('debug')
-
-        if options.logfile:
-            logfile_abs_path = abspath(options.logfile)
-            if os.path.isdir(logfile_abs_path):
-                raise errors.Usage("logfile's path %s should be file"
-                                   % options.logfile)
-            if not os.path.exists(os.path.dirname(logfile_abs_path)):
-                os.makedirs(os.path.dirname(logfile_abs_path))
-            msger.set_interactive(False)
-            msger.set_logfile(logfile_abs_path)
-
-    def main(self, argv=None):
-        if argv is None:
-            argv = sys.argv
-        else:
-            argv = argv[:] # don't modify caller's list
-
-        pname = argv[0]
-        if pname not in self._subcmds:
-            msger.error('Unknown plugin: %s' % pname)
-
-        optparser = self.get_optparser()
-        options, args = optparser.parse_args(argv)
-
-        self.postoptparse(options)
-
-        return self._subcmds[pname](options, *args[1:])
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 7fb6f13..e27598d 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -31,7 +31,7 @@
 import os
 import sys
 
-from wic import msger, creator
+from wic import msger
 from wic.plugin import pluginmgr
 from wic.utils.misc import get_bitbake_var
 
@@ -145,10 +145,10 @@ def list_source_plugins():
         print("  %s" % plugin)
 
 
-def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-               native_sysroot, scripts_path, image_output_dir,
-               compressor, bmap, debug):
-    """Create image
+def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir, native_sysroot,
+               scripts_path, options):
+    """
+    Create image
 
     wks_file - user-defined OE kickstart file
     rootfs_dir - absolute path to the build's /rootfs dir
@@ -157,8 +157,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     native_sysroot - absolute path to the build's native sysroots dir
     scripts_path - absolute path to /scripts dir
     image_output_dir - dirname to create for image
-    compressor - compressor utility to compress the image
-    bmap - enable generation of .bmap
+    options - wic command line options (debug, bmap, etc)
 
     Normally, the values for the build artifacts values are determined
     by 'wic -e' from the output of the 'bitbake -e' command given an
@@ -184,20 +183,21 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
         print("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
-    if debug:
+    if options.debug:
         msger.set_loglevel('debug')
 
-    if not os.path.exists(image_output_dir):
-        os.makedirs(image_output_dir)
+    if not os.path.exists(options.outdir):
+        os.makedirs(options.outdir)
 
-    crobj = creator.Creator()
+    pname = 'direct'
+    plugin_class = pluginmgr.get_plugins('imager').get(pname)
+    if not plugin_class:
+        msger.error('Unknown plugin: %s' % pname)
 
-    cmdline = ["direct", native_sysroot, kernel_dir, bootimg_dir, rootfs_dir,
-               wks_file, image_output_dir, oe_builddir, compressor or ""]
-    if bmap:
-        cmdline.append('--bmap')
+    plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                          native_sysroot, scripts_path, oe_builddir, options)
 
-    crobj.main(cmdline)
+    plugin.do_create()
 
     print("\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file)
 
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index b38e876..ae420a6 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -39,50 +39,6 @@ from wic.utils.errors import CreatorError, ImageError
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.partitionedfs import Image
 
-class DirectPlugin(ImagerPlugin):
-    """
-    Install a system into a file containing a partitioned disk image.
-
-    An image file is formatted with a partition table, each partition
-    created from a rootfs or other OpenEmbedded build artifact and dd'ed
-    into the virtual disk. The disk image can subsequently be dd'ed onto
-    media and used on actual hardware.
-    """
-
-    name = 'direct'
-
-    @staticmethod
-    def do_create(opts, *args):
-        """
-        Create direct image, called from creator as 'direct' cmd
-        """
-        native_sysroot, kernel_dir, bootimg_dir, rootfs_dir, ksconf, \
-            outdir, oe_builddir, compressor = args
-
-        try:
-            ksobj = KickStart(ksconf)
-        except KickStartError as err:
-            msger.error(str(err))
-
-        name = "%s-%s" % (os.path.splitext(os.path.basename(ksconf))[0],
-                          strftime("%Y%m%d%H%M"))
-
-        # parse possible 'rootfs=name' items
-        krootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
-
-        creator = DirectImageCreator(name, ksobj, oe_builddir, outdir,
-                                     krootfs_dir, bootimg_dir, kernel_dir,
-                                     native_sysroot, compressor, opts.bmap)
-        try:
-            creator.create()
-            creator.assemble()
-            creator.finalize()
-            creator.print_info()
-        except errors.CreatorError:
-            raise
-        finally:
-            creator.cleanup()
-
 class DiskImage():
     """
     A Disk backed by a file.
@@ -101,43 +57,57 @@ class DiskImage():
 
         self.created = True
 
-class DirectImageCreator:
+class DirectPlugin(ImagerPlugin):
     """
-    Installs a system into a file containing a partitioned disk image.
+    Install a system into a file containing a partitioned disk image.
 
-    DirectImageCreator is an advanced ImageCreator subclass; an image
-    file is formatted with a partition table, each partition created
-    from a rootfs or other OpenEmbedded build artifact and dd'ed into
-    the virtual disk. The disk image can subsequently be dd'ed onto
+    An image file is formatted with a partition table, each partition
+    created from a rootfs or other OpenEmbedded build artifact and dd'ed
+    into the virtual disk. The disk image can subsequently be dd'ed onto
     media and used on actual hardware.
     """
+    name = 'direct'
 
-    def __init__(self, name, ksobj, oe_builddir, outdir,
-                 rootfs_dir, bootimg_dir, kernel_dir,
-                 native_sysroot, compressor, bmap=False):
-        """
-        Initialize a DirectImageCreator instance.
+    def __init__(self, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+                 native_sysroot, scripts_path, oe_builddir, options):
+        try:
+            self.ks = KickStart(wks_file)
+        except KickStartError as err:
+            msger.error(str(err))
 
-        This method takes the same arguments as ImageCreator.__init__()
-        """
-        self.name = name
-        self.outdir = outdir
-        self.workdir = tempfile.mkdtemp(dir=outdir, prefix='tmp.wic.')
-        self.ks = ksobj
+        # parse possible 'rootfs=name' items
+        self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
+        self.bootimg_dir = bootimg_dir
+        self.kernel_dir = kernel_dir
+        self.native_sysroot = native_sysroot
+        self.oe_builddir = oe_builddir
 
+        self.outdir = options.outdir
+        self.compressor = options.compressor
+        self.bmap = options.bmap
+
+        self.name = "%s-%s" % (os.path.splitext(os.path.basename(wks_file))[0],
+                               strftime("%Y%m%d%H%M"))
+        self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
         self._image = None
         self._disks = {}
         self._disk_format = "direct"
         self._disk_names = []
         self.ptable_format = self.ks.bootloader.ptable
 
-        self.oe_builddir = oe_builddir
-        self.rootfs_dir = rootfs_dir
-        self.bootimg_dir = bootimg_dir
-        self.kernel_dir = kernel_dir
-        self.native_sysroot = native_sysroot
-        self.compressor = compressor
-        self.bmap = bmap
+    def do_create(self):
+        """
+        Plugin entry point.
+        """
+        try:
+            self.create()
+            self.assemble()
+            self.finalize()
+            self.print_info()
+        except errors.CreatorError:
+            raise
+        finally:
+            self.cleanup()
 
     def _get_part_num(self, num, parts):
         """calculate the real partition number, accounting for partitions not
@@ -359,7 +329,7 @@ class DirectImageCreator:
             extension = "direct" + {"gzip": ".gz",
                                     "bzip2": ".bz2",
                                     "xz": ".xz",
-                                    "": ""}.get(self.compressor)
+                                    None: ""}.get(self.compressor)
             full_path = self._full_path(self.outdir, disk_name, extension)
             msg += '  %s\n\n' % full_path
 
diff --git a/scripts/wic b/scripts/wic
index 17e8231..8a959a0 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -250,8 +250,7 @@ def wic_create_subcommand(args, usage_str):
 
     print("Creating image(s)...\n")
     engine.wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
-                      native_sysroot, scripts_path, options.outdir,
-                      options.compressor, options.bmap, options.debug)
+                      native_sysroot, scripts_path, options)
 
 
 def wic_list_subcommand(args, usage_str):
-- 
2.1.4


