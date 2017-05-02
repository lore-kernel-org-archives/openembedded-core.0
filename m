Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id AD57E72F47
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 14:52:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 May 2017 07:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,405,1488873600"; d="scan'208";a="96292204"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 02 May 2017 07:52:09 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 18E416A4080
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 07:51:55 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 May 2017 17:38:18 +0300
Message-Id: <1b6f97c16f7bead653aafd0b448232b5db1fa84c.1493735327.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1493735327.git.ed.bartosh@linux.intel.com>
References: <cover.1493735327.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/3] wic: Use argparse instead of optparse
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
X-List-Received-Date: Tue, 02 May 2017 14:52:07 -0000

From: "Andreas J. Reichel" <andreas.reichel@tngtech.com>

* optparse is deprecated and will not be developed further
    (see: https://docs.python.org/2/library/optparse.html)
* argparse supports subcommands, which simplifies definition of
    arguments and options
* reimplement help mechanism through sub-subcommands

[YOCTO #9636]

Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py |  11 +--
 scripts/lib/wic/help.py   |  23 +++--
 scripts/wic               | 213 ++++++++++++++++++++++++++++------------------
 3 files changed, 154 insertions(+), 93 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index f59821f..6473582 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -201,17 +201,18 @@ def wic_list(args, scripts_path):
     """
     Print the list of images or source plugins.
     """
-    if len(args) < 1:
+    if args.list_type is None:
         return False
 
-    if args == ["images"]:
+    if args.list_type == "images":
+
         list_canned_images(scripts_path)
         return True
-    elif args == ["source-plugins"]:
+    elif args.list_type == "source-plugins":
         list_source_plugins()
         return True
-    elif len(args) == 2 and args[1] == "help":
-        wks_file = args[0]
+    elif len(args.help_for) == 1 and args.help_for[0] == 'help':
+        wks_file = args.list_type
         fullpath = find_canned_image(scripts_path, wks_file)
         if not fullpath:
             raise WicError("No image named %s found, exiting. "
diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index d6e027d..74db05c 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -56,7 +56,7 @@ def wic_help(args, usage_str, subcommands):
     """
     Subcommand help dispatcher.
     """
-    if len(args) == 1 or not display_help(args[1], subcommands):
+    if args.help_topic == None or not display_help(args.help_topic, subcommands):
         print(usage_str)
 
 
@@ -82,19 +82,20 @@ def invoke_subcommand(args, parser, main_command_usage, subcommands):
     Dispatch to subcommand handler borrowed from combo-layer.
     Should use argparse, but has to work in 2.6.
     """
-    if not args:
+    if not args.command:
         logger.error("No subcommand specified, exiting")
         parser.print_help()
         return 1
-    elif args[0] == "help":
+    elif args.command == "help":
         wic_help(args, main_command_usage, subcommands)
-    elif args[0] not in subcommands:
-        logger.error("Unsupported subcommand %s, exiting\n", args[0])
+    elif args.command not in subcommands:
+        logger.error("Unsupported subcommand %s, exiting\n", args.command)
         parser.print_help()
         return 1
     else:
-        usage = subcommands.get(args[0], subcommand_error)[1]
-        subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
+        subcmd = subcommands.get(args.command, subcommand_error)
+        usage = subcmd[1]
+        subcmd[0](args, usage)
 
 
 ##
@@ -795,3 +796,11 @@ DESCRIPTION
       .wks files.
 
 """
+
+wic_help_help = """
+NAME
+    wic help - display a help topic
+
+DESCRIPTION
+    Specify a help topic to display it. Topics are shown above.
+"""
diff --git a/scripts/wic b/scripts/wic
index a5f2dbf..49cad86 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -33,7 +33,7 @@ __version__ = "0.2.0"
 # Python Standard Library modules
 import os
 import sys
-import optparse
+import argparse
 import logging
 from distutils import spawn
 
@@ -85,66 +85,30 @@ def rootfs_dir_to_args(krootfs_dir):
         rootfs_dir += '='.join([key, val])
     return rootfs_dir.strip()
 
-def callback_rootfs_dir(option, opt, value, parser):
-    """
-    Build a dict using --rootfs_dir connection=dir
-    """
-    if not type(parser.values.rootfs_dir) is dict:
-        parser.values.rootfs_dir = dict()
 
-    if '=' in value:
-        (key, rootfs_dir) = value.split('=')
-    else:
-        key = 'ROOTFS_DIR'
-        rootfs_dir = value
+class RootfsArgAction(argparse.Action):
+    def __init__(self, **kwargs):
+        super().__init__(**kwargs)
+
+    def __call__(self, parser, namespace, value, option_string=None):
+        if not "rootfs_dir" in vars(namespace) or \
+           not type(namespace.__dict__['rootfs_dir']) is dict:
+            namespace.__dict__['rootfs_dir'] = {}
+
+        if '=' in value:
+            (key, rootfs_dir) = value.split('=')
+        else:
+            key = 'ROOTFS_DIR'
+            rootfs_dir = value
 
-    parser.values.rootfs_dir[key] = rootfs_dir
+        namespace.__dict__['rootfs_dir'][key] = rootfs_dir
 
-def wic_create_subcommand(args, usage_str):
+
+def wic_create_subcommand(options, usage_str):
     """
     Command-line handling for image creation.  The real work is done
     by image.engine.wic_create()
     """
-    parser = optparse.OptionParser(usage=usage_str)
-
-    parser.add_option("-o", "--outdir", dest="outdir", default='.',
-                      help="name of directory to create image in")
-    parser.add_option("-e", "--image-name", dest="image_name",
-                      help="name of the image to use the artifacts from "
-                           "e.g. core-image-sato")
-    parser.add_option("-r", "--rootfs-dir", dest="rootfs_dir", type="string",
-                      action="callback", callback=callback_rootfs_dir,
-                      help="path to the /rootfs dir to use as the "
-                           ".wks rootfs source")
-    parser.add_option("-b", "--bootimg-dir", dest="bootimg_dir",
-                      help="path to the dir containing the boot artifacts "
-                           "(e.g. /EFI or /syslinux dirs) to use as the "
-                           ".wks bootimg source")
-    parser.add_option("-k", "--kernel-dir", dest="kernel_dir",
-                      help="path to the dir containing the kernel to use "
-                           "in the .wks bootimg")
-    parser.add_option("-n", "--native-sysroot", dest="native_sysroot",
-                      help="path to the native sysroot containing the tools "
-                           "to use to build the image")
-    parser.add_option("-s", "--skip-build-check", dest="build_check",
-                      action="store_false", default=True, help="skip the build check")
-    parser.add_option("-f", "--build-rootfs", action="store_true", help="build rootfs")
-    parser.add_option("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
-                      dest='compressor',
-                      help="compress image with specified compressor")
-    parser.add_option("-m", "--bmap", action="store_true", help="generate .bmap")
-    parser.add_option("-v", "--vars", dest='vars_dir',
-                      help="directory with <image>.env files that store "
-                           "bitbake variables")
-    parser.add_option("-D", "--debug", dest="debug", action="store_true",
-                      default=False, help="output debug information")
-
-    (options, args) = parser.parse_args(args)
-
-    if len(args) != 1:
-        parser.print_help()
-        raise WicError("Wrong number of arguments, exiting")
-
     if options.build_rootfs and not bitbake_main:
         raise WicError("Can't build rootfs as bitbake is not in the $PATH")
 
@@ -206,14 +170,14 @@ def wic_create_subcommand(args, usage_str):
             raise WicError("Unable to find the location of the native "
                            "tools sysroot to use")
 
-    wks_file = args[0]
+    wks_file = options.wks_file
 
     if not wks_file.endswith(".wks"):
         wks_file = engine.find_canned_image(scripts_path, wks_file)
         if not wks_file:
             raise WicError("No image named %s found, exiting.  (Use 'wic list images' "
                            "to list available images, or specify a fully-qualified OE "
-                           "kickstart (.wks) filename)" % args[0])
+                           "kickstart (.wks) filename)" % options.wks_file)
 
     if not options.image_name:
         rootfs_dir = ''
@@ -264,59 +228,146 @@ def wic_list_subcommand(args, usage_str):
     Command-line handling for listing available images.
     The real work is done by image.engine.wic_list()
     """
-    parser = optparse.OptionParser(usage=usage_str)
-    args = parser.parse_args(args)[1]
-
     if not engine.wic_list(args, scripts_path):
-        parser.print_help()
         raise WicError("Bad list arguments, exiting")
 
 
-def wic_help_topic_subcommand(args, usage_str):
+def wic_help_subcommand(args, usage_str):
     """
-    Command-line handling for help-only 'subcommands'.  This is
-    essentially a dummy command that doesn nothing but allow users to
-    use the existing subcommand infrastructure to display help on a
-    particular topic not attached to any particular subcommand.
+    Command-line handling for help subcommand to keep the current
+    structure of the function definitions.
     """
     pass
 
 
+def wic_help_topic_subcommand(usage_str, help_str):
+    """
+    Display function for help 'sub-subcommands'.
+    """
+    print(help_str)
+    return
+
+
 wic_help_topic_usage = """
 """
 
-subcommands = {
-    "create":    [wic_create_subcommand,
-                  hlp.wic_create_usage,
-                  hlp.wic_create_help],
-    "list":      [wic_list_subcommand,
-                  hlp.wic_list_usage,
-                  hlp.wic_list_help],
+helptopics = {
     "plugins":   [wic_help_topic_subcommand,
                   wic_help_topic_usage,
-                  hlp.get_wic_plugins_help],
+                  hlp.wic_plugins_help],
     "overview":  [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_overview_help],
     "kickstart": [wic_help_topic_subcommand,
                   wic_help_topic_usage,
                   hlp.wic_kickstart_help],
+    "create":    [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_create_help],
+    "list":      [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_list_help]
 }
 
 
+def wic_init_parser_create(subparser):
+    subparser.add_argument("wks_file")
+
+    subparser.add_argument("-o", "--outdir", dest="outdir", default='.',
+                      help="name of directory to create image in")
+    subparser.add_argument("-e", "--image-name", dest="image_name",
+                      help="name of the image to use the artifacts from "
+                           "e.g. core-image-sato")
+    subparser.add_argument("-r", "--rootfs-dir", action=RootfsArgAction,
+                      help="path to the /rootfs dir to use as the "
+                           ".wks rootfs source")
+    subparser.add_argument("-b", "--bootimg-dir", dest="bootimg_dir",
+                      help="path to the dir containing the boot artifacts "
+                           "(e.g. /EFI or /syslinux dirs) to use as the "
+                           ".wks bootimg source")
+    subparser.add_argument("-k", "--kernel-dir", dest="kernel_dir",
+                      help="path to the dir containing the kernel to use "
+                           "in the .wks bootimg")
+    subparser.add_argument("-n", "--native-sysroot", dest="native_sysroot",
+                      help="path to the native sysroot containing the tools "
+                           "to use to build the image")
+    subparser.add_argument("-s", "--skip-build-check", dest="build_check",
+                      action="store_false", default=True, help="skip the build check")
+    subparser.add_argument("-f", "--build-rootfs", action="store_true", help="build rootfs")
+    subparser.add_argument("-c", "--compress-with", choices=("gzip", "bzip2", "xz"),
+                      dest='compressor',
+                      help="compress image with specified compressor")
+    subparser.add_argument("-m", "--bmap", action="store_true", help="generate .bmap")
+    subparser.add_argument("-v", "--vars", dest='vars_dir',
+                      help="directory with <image>.env files that store "
+                           "bitbake variables")
+    subparser.add_argument("-D", "--debug", dest="debug", action="store_true",
+                      default=False, help="output debug information")
+    return
+
+
+def wic_init_parser_list(subparser):
+    subparser.add_argument("list_type",
+                        help="can be 'images' or 'source-plugins' "
+                             "to obtain a list. "
+                             "If value is a valid .wks image file")
+    subparser.add_argument("help_for", default=[], nargs='*',
+                        help="If 'list_type' is a valid .wks image file "
+                             "this value can be 'help' to show the help information "
+                             "defined inside the .wks file")
+    return
+
+
+def wic_init_parser_help(subparser):
+    helpparsers = subparser.add_subparsers(dest='help_topic', help=hlp.wic_usage)
+    for helptopic in helptopics:
+        helpparsers.add_parser(helptopic, help=helptopics[helptopic][2])
+    return
+
+
+subcommands = {
+    "create":    [wic_create_subcommand,
+                  hlp.wic_create_usage,
+                  hlp.wic_create_help,
+                  wic_init_parser_create],
+    "list":      [wic_list_subcommand,
+                  hlp.wic_list_usage,
+                  hlp.wic_list_help,
+                  wic_init_parser_list],
+    "help":      [wic_help_subcommand,
+                  wic_help_topic_usage,
+                  hlp.wic_help_help,
+                  wic_init_parser_help]
+}
+
+
+def init_parser(parser):
+    parser.add_argument("--version", action="version",
+        version="%(prog)s {version}".format(version=__version__))
+    subparsers = parser.add_subparsers(dest='command', help=hlp.wic_usage)
+    for subcmd in subcommands:
+        subparser = subparsers.add_parser(subcmd, help=subcommands[subcmd][2])
+        subcommands[subcmd][3](subparser)
+
+
 def main(argv):
-    parser = optparse.OptionParser(version="wic version %s" % __version__,
-                                   usage=hlp.wic_usage)
+    parser = argparse.ArgumentParser(
+        description="wic version %s" % __version__)
 
-    parser.disable_interspersed_args()
+    init_parser(parser)
 
-    args = parser.parse_args(argv)[1]
+    args = parser.parse_args(argv)
 
-    if len(args):
-        if args[0] == "help":
-            if len(args) == 1:
+    if "command" in vars(args):
+        if args.command == "help":
+            if args.help_topic is None:
                 parser.print_help()
-                raise WicError("help command requires parameter")
+                print()
+                print("Please specify a help topic")
+            elif args.help_topic in helptopics:
+                hlpt = helptopics[args.help_topic]
+                hlpt[0](hlpt[1], hlpt[2])
+            return 0
 
     return hlp.invoke_subcommand(args, parser, hlp.wic_help_usage, subcommands)
 
-- 
2.1.4


