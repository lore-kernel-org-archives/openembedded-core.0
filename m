Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id C168B731AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:52 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 15 Feb 2017 01:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="934089819"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Feb 2017 01:01:52 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 383ED6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:50 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:25 +0200
Message-Id: <0e3ea80546c60858bbbb4a3bd72f1a1c4ae32558.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 02/11] wic: use wic logger in core modules
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:53 -0000

Replaced msger with wic logger in the core wic modules.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py       | 19 ++++++-----
 scripts/lib/wic/help.py         |  8 +++--
 scripts/lib/wic/ksparser.py     |  7 ++--
 scripts/lib/wic/partition.py    | 72 +++++++++++++++++++++++------------------
 scripts/lib/wic/plugin.py       | 19 +++++------
 scripts/lib/wic/pluginbase.py   | 12 ++++---
 scripts/lib/wic/utils/misc.py   | 32 ++++++++++--------
 scripts/lib/wic/utils/runner.py | 12 ++++---
 8 files changed, 104 insertions(+), 77 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 1aa8f65..b64714c 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -28,6 +28,7 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
+import logging
 import os
 import sys
 
@@ -35,6 +36,7 @@ from wic import msger
 from wic.plugin import pluginmgr
 from wic.utils.misc import get_bitbake_var
 
+logger = logging.getLogger('wic')
 
 def verify_build_env():
     """
@@ -43,7 +45,7 @@ def verify_build_env():
     Returns True if it is, false otherwise
     """
     if not os.environ.get("BUILDDIR"):
-        print("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
+        logger.error("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
     return True
@@ -179,7 +181,7 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     try:
         oe_builddir = os.environ["BUILDDIR"]
     except KeyError:
-        print("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
+        logger.error("BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)")
         sys.exit(1)
 
     if options.debug:
@@ -191,14 +193,15 @@ def wic_create(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
     pname = 'direct'
     plugin_class = pluginmgr.get_plugins('imager').get(pname)
     if not plugin_class:
-        msger.error('Unknown plugin: %s' % pname)
+        logger.error('Unknown plugin: %s', pname)
+        sys.exit(1)
 
     plugin = plugin_class(wks_file, rootfs_dir, bootimg_dir, kernel_dir,
                           native_sysroot, oe_builddir, options)
 
     plugin.do_create()
 
-    print("\nThe image(s) were created using OE kickstart file:\n  %s" % wks_file)
+    logger.info("The image(s) were created using OE kickstart file:\n  %s", wks_file)
 
 
 def wic_list(args, scripts_path):
@@ -218,10 +221,10 @@ def wic_list(args, scripts_path):
         wks_file = args[0]
         fullpath = find_canned_image(scripts_path, wks_file)
         if not fullpath:
-            print("No image named %s found, exiting. "\
-                  "(Use 'wic list images' to list available images, or "\
-                  "specify a fully-qualified OE kickstart (.wks) "\
-                  "filename)\n" % wks_file)
+            logger.error("No image named %s found, exiting. "
+                         "(Use 'wic list images' to list available images, or "
+                         "specify a fully-qualified OE kickstart (.wks) "
+                         "filename)\n", wks_file)
             sys.exit(1)
         list_canned_image_help(scripts_path, fullpath)
         return True
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 1bd411d..9b980e7 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -30,8 +30,10 @@ import logging
 
 from wic.plugin import pluginmgr, PLUGIN_TYPES
 
+logger = logging.getLogger('wic')
+
 def subcommand_error(args):
-    logging.info("invalid subcommand %s", args[0])
+    logger.info("invalid subcommand %s", args[0])
 
 
 def display_help(subcommand, subcommands):
@@ -81,13 +83,13 @@ def invoke_subcommand(args, parser, main_command_usage, subcommands):
     Should use argparse, but has to work in 2.6.
     """
     if not args:
-        logging.error("No subcommand specified, exiting")
+        logger.error("No subcommand specified, exiting")
         parser.print_help()
         return 1
     elif args[0] == "help":
         wic_help(args, main_command_usage, subcommands)
     elif args[0] not in subcommands:
-        logging.error("Unsupported subcommand %s, exiting\n", args[0])
+        logger.error("Unsupported subcommand %s, exiting\n", args[0])
         parser.print_help()
         return 1
     else:
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index d9fa805..c840d89 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -27,12 +27,15 @@
 
 import os
 import shlex
+import logging
+
 from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
 
-from wic import msger
 from wic.engine import find_canned
 from wic.partition import Partition
 
+logger = logging.getLogger('wic')
+
 class KickStartError(Exception):
     """Custom exception."""
     pass
@@ -167,7 +170,7 @@ class KickStart():
 
         self._parse(parser, confpath)
         if not self.bootloader:
-            msger.warning('bootloader config not specified, using defaults')
+            logger.warning('bootloader config not specified, using defaults\n')
             self.bootloader = bootloader.parse_args([])
 
     def _parse(self, parser, confpath):
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 754ad75..349054f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -24,13 +24,16 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 # Ed Bartosh <ed.bartosh> (at] linux.intel.com>
 
+import logging
 import os
+import sys
 import tempfile
 
-from wic import msger
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 from wic.plugin import pluginmgr
 
+logger = logging.getLogger('wic')
+
 class Partition():
 
     def __init__(self, args, lineno):
@@ -68,16 +71,16 @@ class Partition():
         number of (1k) blocks we need to add to get to --size, 0 if
         we're already there or beyond.
         """
-        msger.debug("Requested partition size for %s: %d" % \
-                    (self.mountpoint, self.size))
+        logger.debug("Requested partition size for %s: %d",
+                     self.mountpoint, self.size)
 
         if not self.size:
             return 0
 
         requested_blocks = self.size
 
-        msger.debug("Requested blocks %d, current_blocks %d" % \
-                    (requested_blocks, current_blocks))
+        logger.debug("Requested blocks %d, current_blocks %d",
+                     requested_blocks, current_blocks)
 
         if requested_blocks > current_blocks:
             return requested_blocks - current_blocks
@@ -95,8 +98,9 @@ class Partition():
         if self.fixed_size:
             rootfs_size = self.fixed_size
             if actual_rootfs_size > rootfs_size:
-                msger.error("Actual rootfs size (%d kB) is larger than allowed size %d kB" \
-                            %(actual_rootfs_size, rootfs_size))
+                logger.error("Actual rootfs size (%d kB) is larger than allowed size %d kB",
+                             actual_rootfs_size, rootfs_size)
+                sys.exit(1)
         else:
             extra_blocks = self.get_extra_block_count(actual_rootfs_size)
             if extra_blocks < self.extra_space:
@@ -105,8 +109,8 @@ class Partition():
             rootfs_size = actual_rootfs_size + extra_blocks
             rootfs_size *= self.overhead_factor
 
-            msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                        (extra_blocks, self.mountpoint, rootfs_size))
+            logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                         extra_blocks, self.mountpoint, rootfs_size)
 
         return rootfs_size
 
@@ -127,9 +131,10 @@ class Partition():
         """
         if not self.source:
             if not self.size and not self.fixed_size:
-                msger.error("The %s partition has a size of zero. Please "
-                            "specify a non-zero --size/--fixed-size for that partition." % \
-                            self.mountpoint)
+                logger.error("The %s partition has a size of zero. Please "
+                             "specify a non-zero --size/--fixed-size for that "
+                             "partition.", self.mountpoint)
+                sys.exit(1)
             if self.fstype and self.fstype == "swap":
                 self.prepare_swap_partition(cr_workdir, oe_builddir,
                                             native_sysroot)
@@ -151,11 +156,12 @@ class Partition():
         plugins = pluginmgr.get_source_plugins()
 
         if self.source not in plugins:
-            msger.error("The '%s' --source specified for %s doesn't exist.\n\t"
-                        "See 'wic list source-plugins' for a list of available"
-                        " --sources.\n\tSee 'wic help source-plugins' for "
-                        "details on adding a new source plugin." % \
-                        (self.source, self.mountpoint))
+            logger.error("The '%s' --source specified for %s doesn't exist.\n\t"
+                         "See 'wic list source-plugins' for a list of available"
+                         " --sources.\n\tSee 'wic help source-plugins' for "
+                         "details on adding a new source plugin.",
+                         self.source, self.mountpoint)
+            sys.exit(1)
 
         srcparams_dict = {}
         if self.sourceparams:
@@ -185,15 +191,16 @@ class Partition():
         # further processing required Partition.size to be an integer, make
         # sure that it is one
         if not isinstance(self.size, int):
-            msger.error("Partition %s internal size is not an integer. " \
-                          "This a bug in source plugin %s and needs to be fixed." \
-                          % (self.mountpoint, self.source))
+            logger.error("Partition %s internal size is not an integer. "
+                         "This a bug in source plugin %s and needs to be fixed.",
+                         self.mountpoint, self.source)
+            sys.exit(1)
 
         if self.fixed_size and self.size > self.fixed_size:
-            msger.error("File system image of partition %s is larger (%d kB) than its"\
-                        "allowed size %d kB" % (self.mountpoint,
-                                                self.size, self.fixed_size))
-
+            logger.error("File system image of partition %s is larger (%d kB) "
+                         "than its allowed size %d kB",
+                          self.mountpoint, self.size, self.fixed_size)
+            sys.exit(1)
 
     def prepare_rootfs_from_fs_image(self, cr_workdir, oe_builddir,
                                      rootfs_dir):
@@ -233,8 +240,9 @@ class Partition():
             os.remove(rootfs)
 
         if not self.fstype:
-            msger.error("File system for partition %s not specified in kickstart, " \
-                        "use --fstype option" % (self.mountpoint))
+            logger.error("File system for partition %s not specified in kickstart, "
+                         "use --fstype option", self.mountpoint)
+            sys.exit(1)
 
         # Get rootfs size from bitbake variable if it's not set in .ks file
         if not self.size:
@@ -244,10 +252,10 @@ class Partition():
             # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
             rsize_bb = get_bitbake_var('ROOTFS_SIZE')
             if rsize_bb:
-                msger.warning('overhead-factor was specified, but size was not,'
-                              ' so bitbake variables will be used for the size.'
-                              ' In this case both IMAGE_OVERHEAD_FACTOR and '
-                              '--overhead-factor will be applied')
+                logger.warning('overhead-factor was specified, but size was not,'
+                               ' so bitbake variables will be used for the size.'
+                               ' In this case both IMAGE_OVERHEAD_FACTOR and '
+                               '--overhead-factor will be applied')
                 self.size = int(round(float(rsize_bb)))
 
         for prefix in ("ext", "btrfs", "vfat", "squashfs"):
@@ -403,8 +411,8 @@ class Partition():
         """
         Prepare an empty squashfs partition.
         """
-        msger.warning("Creating of an empty squashfs %s partition was attempted. " \
-                      "Proceeding as requested." % self.mountpoint)
+        logger.warning("Creating of an empty squashfs %s partition was attempted. "
+                       "Proceeding as requested.", self.mountpoint)
 
         path = "%s/fs_%s.%s" % (cr_workdir, self.label, self.fstype)
         if os.path.isfile(path):
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index f04a034..70d3377 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -17,8 +17,8 @@
 
 import os
 import sys
+import logging
 
-from wic import msger
 from wic import pluginbase
 from wic.utils import errors
 from wic.utils.misc import get_bitbake_var
@@ -30,6 +30,8 @@ PLUGIN_TYPES = ["imager", "source"]
 PLUGIN_DIR = "/lib/wic/plugins" # relative to scripts
 SCRIPTS_PLUGIN_DIR = "scripts" + PLUGIN_DIR
 
+logger = logging.getLogger('wic')
+
 class PluginMgr():
     plugin_dirs = {}
 
@@ -91,17 +93,16 @@ class PluginMgr():
                 if mod and mod != '__init__':
                     if mod in sys.modules:
                         #self.plugin_dirs[pdir] = True
-                        msger.warning("Module %s already exists, skip" % mod)
+                        logger.warning("Module %s already exists, skip", mod)
                     else:
                         try:
                             pymod = __import__(mod)
                             self.plugin_dirs[pdir] = True
-                            msger.debug("Plugin module %s:%s imported"\
-                                        % (mod, pymod.__file__))
+                            logger.debug("Plugin module %s:%s imported",
+                                         mod, pymod.__file__)
                         except ImportError as err:
-                            msg = 'Failed to load plugin %s/%s: %s' \
-                                % (os.path.basename(pdir), mod, err)
-                            msger.warning(msg)
+                            logger.warning('Failed to load plugin %s/%s: %s',
+                                           os.path.basename(pdir), mod, err)
 
             del sys.path[0]
 
@@ -140,8 +141,8 @@ class PluginMgr():
             if _source_name == source_name:
                 for _method_name in methods:
                     if not hasattr(klass, _method_name):
-                        msger.warning("Unimplemented %s source interface for: %s"\
-                                      % (_method_name, _source_name))
+                        logger.warning("Unimplemented %s source interface for: %s",
+                                       _method_name, _source_name)
                         return None
                     func = getattr(klass, _method_name)
                     methods[_method_name] = func
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index 2f747a9..aea9c02 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -17,9 +17,11 @@
 
 __all__ = ['ImagerPlugin', 'SourcePlugin', 'get_plugins']
 
+import logging
+
 from collections import defaultdict
 
-from wic import msger
+logger = logging.getLogger('wic')
 
 class PluginMeta(type):
     plugins = defaultdict(dict)
@@ -49,7 +51,7 @@ class SourcePlugin(PluginMeta("Plugin", (), {})):
         disk image.  This provides a hook to allow finalization of a
         disk image e.g. to write an MBR to it.
         """
-        msger.debug("SourcePlugin: do_install_disk: disk: %s" % disk_name)
+        logger.debug("SourcePlugin: do_install_disk: disk: %s", disk_name)
 
     @classmethod
     def do_stage_partition(cls, part, source_params, creator, cr_workdir,
@@ -66,7 +68,7 @@ class SourcePlugin(PluginMeta("Plugin", (), {})):
         Not that get_bitbake_var() allows you to acces non-standard
         variables that you might want to use for this.
         """
-        msger.debug("SourcePlugin: do_stage_partition: part: %s" % part)
+        logger.debug("SourcePlugin: do_stage_partition: part: %s", part)
 
     @classmethod
     def do_configure_partition(cls, part, source_params, creator, cr_workdir,
@@ -77,7 +79,7 @@ class SourcePlugin(PluginMeta("Plugin", (), {})):
         custom configuration files for a partition, for example
         syslinux or grub config files.
         """
-        msger.debug("SourcePlugin: do_configure_partition: part: %s" % part)
+        logger.debug("SourcePlugin: do_configure_partition: part: %s", part)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -87,7 +89,7 @@ class SourcePlugin(PluginMeta("Plugin", (), {})):
         Called to do the actual content population for a partition i.e. it
         'prepares' the partition to be incorporated into the image.
         """
-        msger.debug("SourcePlugin: do_prepare_partition: part: %s" % part)
+        logger.debug("SourcePlugin: do_prepare_partition: part: %s", part)
 
 def get_plugins(typen):
     return PluginMeta.plugins.get(typen)
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index edb9c5b..b7b835a 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -26,14 +26,17 @@
 #
 """Miscellaneous functions."""
 
+import logging
 import os
 import re
+
 from collections import defaultdict
 from distutils import spawn
 
-from wic import msger
 from wic.utils import runner
 
+logger = logging.getLogger('wic')
+
 # executable -> recipe pairs for exec_native_cmd
 NATIVE_RECIPES = {"bmaptool": "bmap-tools",
                   "grub-mkimage": "grub-efi",
@@ -61,9 +64,9 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
 
     Need to execute as_shell if the command uses wildcards
     """
-    msger.debug("_exec_cmd: %s" % cmd_and_args)
+    logger.debug("_exec_cmd: %s", cmd_and_args)
     args = cmd_and_args.split()
-    msger.debug(args)
+    logger.debug(args)
 
     if as_shell:
         ret, out = runner.runtool(cmd_and_args, catch)
@@ -71,11 +74,12 @@ def _exec_cmd(cmd_and_args, as_shell=False, catch=3):
         ret, out = runner.runtool(args, catch)
     out = out.strip()
     if ret != 0:
-        msger.error("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
+        logger.error("_exec_cmd: %s returned '%s' instead of 0\noutput: %s" % \
                     (cmd_and_args, ret, out))
+        sys.exit(1)
 
-    msger.debug("_exec_cmd: output for %s (rc = %d): %s" % \
-                (cmd_and_args, ret, out))
+    logger.debug("_exec_cmd: output for %s (rc = %d): %s",
+                 cmd_and_args, ret, out)
 
     return ret, out
 
@@ -97,7 +101,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
     """
     # The reason -1 is used is because there may be "export" commands.
     args = cmd_and_args.split(';')[-1].split()
-    msger.debug(args)
+    logger.debug(args)
 
     if pseudo:
         cmd_and_args = pseudo + cmd_and_args
@@ -106,7 +110,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
         (native_sysroot, native_sysroot, native_sysroot)
     native_cmd_and_args = "export PATH=%s:$PATH;%s" % \
                            (native_paths, cmd_and_args)
-    msger.debug("exec_native_cmd: %s" % cmd_and_args)
+    logger.debug("exec_native_cmd: %s", cmd_and_args)
 
     # If the command isn't in the native sysroot say we failed.
     if spawn.find_executable(args[0], native_paths):
@@ -127,7 +131,7 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch=3, pseudo=""):
         else:
             msg += "Wic failed to find a recipe to build native %s. Please "\
                    "file a bug against wic.\n" % prog
-        msger.error(msg)
+        logger.error(msg)
 
     return ret, out
 
@@ -184,14 +188,14 @@ class BitbakeVars(defaultdict):
                 if image:
                     cmd += " %s" % image
 
-                log_level = msger.get_loglevel()
-                msger.set_loglevel('normal')
+                log_level = logger.getEffectiveLevel()
+                logger.setLevel(logging.INFO)
                 ret, lines = _exec_cmd(cmd)
-                msger.set_loglevel(log_level)
+                logger.setLevel(log_level)
 
                 if ret:
-                    print("Couldn't get '%s' output." % cmd)
-                    print("Bitbake failed with error:\n%s\n" % lines)
+                    logger.error("Couldn't get '%s' output.", cmd)
+                    logger.error("Bitbake failed with error:\n%s\n", lines)
                     return
 
                 # Parse bitbake -e output
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index db536ba..d27dcc7 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -15,10 +15,12 @@
 # with this program; if not, write to the Free Software Foundation, Inc., 59
 # Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 
+import logging
 import os
 import subprocess
+import sys
 
-from wic import msger
+logger = logging.getLogger('wic')
 
 def runtool(cmdln_or_args, catch=1):
     """ wrapper for most of the subprocess calls
@@ -70,7 +72,8 @@ def runtool(cmdln_or_args, catch=1):
     except OSError as err:
         if err.errno == 2:
             # [Errno 2] No such file or directory
-            msger.error('Cannot run command: %s, lost dependency?' % cmd)
+            logger.error('Cannot run command: %s, lost dependency?', cmd)
+            sys.exit(1)
         else:
             raise # relay
     finally:
@@ -80,7 +83,7 @@ def runtool(cmdln_or_args, catch=1):
     return (process.returncode, out)
 
 def show(cmdln_or_args):
-    # show all the message using msger.verbose
+    """Show all messages using logger.debug."""
 
     rcode, out = runtool(cmdln_or_args, catch=3)
 
@@ -99,7 +102,8 @@ def show(cmdln_or_args):
             msg += '\n  | %s' % line
         msg += '\n  +----------------'
 
-    msger.verbose(msg)
+    logger.debug(msg)
+
     return rcode
 
 def outs(cmdln_or_args, catch=1):
-- 
2.1.4


