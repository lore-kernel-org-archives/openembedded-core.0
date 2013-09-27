Return-Path: <tom.zanussi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 90A266CB8E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 02:18:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Sep 2013 19:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,989,1371106800"; d="scan'208";a="410177407"
Received: from unknown (HELO localhost) ([10.255.15.160])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2013 19:17:54 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2013 21:17:51 -0500
Message-Id: <8dbedc35cbce3319722c012af0dad737773446f6.1380234931.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1380234931.git.tom.zanussi@linux.intel.com>
References: <cover.1380234931.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 1/3] wic: Initial code for wic (OpenEmbedded Image Creator)
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
X-List-Received-Date: Fri, 27 Sep 2013 02:18:08 -0000

Initial implementation of the 'wic' command.

The 'wic' command generates partitioned images from existing
OpenEmbedded build artifacts.  Image generation is driven by
partitioning commands contained in an 'Openembedded kickstart' (.wks)
file specified either directly on the command-line or as one of a
selection of canned .wks files (see 'wic list images').  When applied
to a given set of build artifacts, the result is an image or set of
images that can be directly written onto media and used on a
particular system.

'wic' is based loosely on the 'mic' (Meego Image Creator) framework,
but heavily modified to make direct use of OpenEmbedded build
artifacts instead of package installation and configuration, things
already incorporated int the OE artifacts.

The name 'wic' comes from 'oeic' with the 'oe' diphthong promoted to
the letter 'w', because 'oeic' is impossible to remember or pronounce.

This covers the mechanics of invoking and providing help for the
command and sub-commands; it contains hooks for future commits to
connect with the actual functionality, once implemented.

Help is integrated into the 'wic' command - see that for details on
usage.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/__init__.py |  22 +++
 scripts/lib/image/engine.py   | 256 ++++++++++++++++++++++++++++++++++
 scripts/lib/image/help.py     | 311 ++++++++++++++++++++++++++++++++++++++++++
 scripts/wic                   | 185 +++++++++++++++++++++++++
 4 files changed, 774 insertions(+)
 create mode 100644 scripts/lib/image/__init__.py
 create mode 100644 scripts/lib/image/engine.py
 create mode 100644 scripts/lib/image/help.py
 create mode 100755 scripts/wic

diff --git a/scripts/lib/image/__init__.py b/scripts/lib/image/__init__.py
new file mode 100644
index 0000000..1ff814e
--- /dev/null
+++ b/scripts/lib/image/__init__.py
@@ -0,0 +1,22 @@
+#
+# OpenEmbedded Image tools library
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
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
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
diff --git a/scripts/lib/image/engine.py b/scripts/lib/image/engine.py
new file mode 100644
index 0000000..a9b530c
--- /dev/null
+++ b/scripts/lib/image/engine.py
@@ -0,0 +1,256 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
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
+#
+# DESCRIPTION
+
+# This module implements the image creation engine used by 'wic' to
+# create images.  The engine parses through the OpenEmbedded kickstart
+# (wks) file specified and generates images that can then be directly
+# written onto media.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import os
+import sys
+from abc import ABCMeta, abstractmethod
+import shlex
+import json
+import subprocess
+import shutil
+
+import os, sys, errno
+
+
+def verify_build_env():
+    """
+    Verify that the build environment is sane.
+
+    Returns True if it is, false otherwise
+    """
+    try:
+        builddir = os.environ["BUILDDIR"]
+    except KeyError:
+        print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
+        sys.exit(1)
+
+    return True
+
+
+def get_line_val(line, key):
+    """
+    Extract the value from the VAR="val" string
+    """
+    if line.startswith(key + "="):
+        stripped_line = line.split('=')[1]
+        stripped_line = stripped_line.replace('\"', '')
+        return stripped_line
+    return None
+
+
+def find_artifacts(image_name):
+    """
+    Gather the build artifacts for the current image (the image_name
+    e.g. core-image-minimal) for the current MACHINE set in local.conf
+    """
+    bitbake_env_cmd = "bitbake -e %s" % image_name
+    rc, bitbake_env_lines = exec_cmd(bitbake_env_cmd)
+    if rc != 0:
+        print "Couldn't get '%s' output, exiting." % bitbake_env_cmd
+        sys.exit(1)
+
+    for line in bitbake_env_lines.split('\n'):
+        if (get_line_val(line, "IMAGE_ROOTFS")):
+            rootfs_dir = get_line_val(line, "IMAGE_ROOTFS")
+            continue
+        if (get_line_val(line, "STAGING_KERNEL_DIR")):
+            kernel_dir = get_line_val(line, "STAGING_KERNEL_DIR")
+            continue
+        if (get_line_val(line, "HDDDIR")):
+            hdddir = get_line_val(line, "HDDDIR")
+            continue
+        if (get_line_val(line, "STAGING_DATADIR")):
+            staging_data_dir = get_line_val(line, "STAGING_DATADIR")
+            continue
+        if (get_line_val(line, "STAGING_DIR_NATIVE")):
+            native_sysroot = get_line_val(line, "STAGING_DIR_NATIVE")
+            continue
+
+    return (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot)
+
+
+CANNED_IMAGE_DIR = "lib/image/canned-wks" # relative to scripts
+
+def find_canned_image(scripts_path, wks_file):
+    """
+    Find a .wks file with the given name in the canned files dir.
+
+    Return False if not found
+    """
+    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
+
+    for root, dirs, files in os.walk(canned_wks_dir):
+        for file in files:
+            if file.endswith("~") or file.endswith("#"):
+                continue
+            if file.endswith(".wks") and wks_file + ".wks" == file:
+                fullpath = os.path.join(canned_wks_dir, file)
+                return fullpath
+    return None
+
+
+def list_canned_images(scripts_path):
+    """
+    List the .wks files in the canned image dir, minus the extension.
+    """
+    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
+
+    for root, dirs, files in os.walk(canned_wks_dir):
+        for file in files:
+            if file.endswith("~") or file.endswith("#"):
+                continue
+            if file.endswith(".wks"):
+                fullpath = os.path.join(canned_wks_dir, file)
+                f = open(fullpath, "r")
+                lines = f.readlines()
+                for line in lines:
+                    desc = ""
+                    idx = line.find("short-description:")
+                    if idx != -1:
+                        desc = line[idx + len("short-description:"):].strip()
+                        break
+                basename = os.path.splitext(file)[0]
+                print "  %s\t\t%s" % (basename, desc)
+
+
+def list_canned_image_help(scripts_path, fullpath):
+    """
+    List the help and params in the specified canned image.
+    """
+    canned_wks_dir = os.path.join(scripts_path, CANNED_IMAGE_DIR)
+
+    f = open(fullpath, "r")
+    lines = f.readlines()
+    found = False
+    for line in lines:
+        if not found:
+            idx = line.find("long-description:")
+            if idx != -1:
+                print
+                print line[idx + len("long-description:"):].strip()
+                found = True
+            continue
+        if not line.strip():
+            break
+        idx = line.find("#")
+        if idx != -1:
+            print line[idx + len("#:"):].rstrip()
+        else:
+            break
+
+
+def wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+               native_sysroot, hdddir, staging_data_dir, scripts_path,
+               image_output_dir, properties_file, properties=None):
+    """
+    Create image
+
+    wks_file - user-defined OE kickstart file
+    rootfs_dir - absolute path to the build's /rootfs dir
+    bootimg_dir - absolute path to the build's boot artifacts directory
+    kernel_dir - absolute path to the build's kernel directory
+    native_sysroot - absolute path to the build's native sysroots dir
+    hdddir - absolute path to the build's HDDDIR dir
+    staging_data_dir - absolute path to the build's STAGING_DATA_DIR dir
+    scripts_path - absolute path to /scripts dir
+    image_output_dir - dirname to create for image
+    properties_file - use values from this file if nonempty i.e no prompting
+    properties - use values from this string if nonempty i.e no prompting
+
+    Normally, the values for the build artifacts values are determined
+    by 'wic -e' from the output of the 'bitbake -e' command given an
+    image name e.g. 'core-image-minimal' and a given machine set in
+    local.conf.  If that's the case, the variables get the following
+    values from the output of 'bitbake -e':
+
+    rootfs_dir:        IMAGE_ROOTFS
+    kernel_dir:        STAGING_KERNEL_DIR
+    native_sysroot:    STAGING_DIR_NATIVE
+    hdddir:            HDDDIR
+    staging_data_dir:  STAGING_DATA_DIR
+
+    In the above case, bootimg_dir remains unset and the image
+    creation code determines which of the passed-in directories to
+    use.
+
+    In the case where the values are passed in explicitly i.e 'wic -e'
+    is not used but rather the individual 'wic' options are used to
+    explicitly specify these values, hdddir and staging_data_dir will
+    be unset, but bootimg_dir must be explicit i.e. explicitly set to
+    either hdddir or staging_data_dir, depending on the image being
+    generated.  The other values (rootfs_dir, kernel_dir, and
+    native_sysroot) correspond to the same values found above via
+    'bitbake -e').
+
+    """
+    try:
+        oe_builddir = os.environ["BUILDDIR"]
+    except KeyError:
+        print "BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)"
+        sys.exit(1)
+
+
+def wic_list(args, scripts_path, properties_file):
+    """
+    Print the complete list of properties defined by the image, or the
+    possible values for a particular image property.
+    """
+    if len(args) < 1:
+        return False
+
+    if len(args) == 1:
+        if args[0] == "images":
+            list_canned_images(scripts_path)
+            return True
+        elif args[0] == "properties":
+            return True
+        else:
+            return False
+
+    if len(args) == 2:
+        if args[0] == "properties":
+            wks_file = args[1]
+            print "print properties contained in wks file: %s" % wks_file
+            return True
+        elif args[0] == "property":
+            print "print property values for property: %s" % args[1]
+            return True
+        elif args[1] == "help":
+            wks_file = args[0]
+            fullpath = find_canned_image(scripts_path, wks_file)
+            if not fullpath:
+                print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
+                sys.exit(1)
+            list_canned_image_help(scripts_path, fullpath)
+            return True
+        else:
+            return False
+
+    return False
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
new file mode 100644
index 0000000..cb3112c
--- /dev/null
+++ b/scripts/lib/image/help.py
@@ -0,0 +1,311 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
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
+#
+# DESCRIPTION
+# This module implements some basic help invocation functions along
+# with the bulk of the help topic text for the OE Core Image Tools.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import subprocess
+import logging
+
+
+def subcommand_error(args):
+    logging.info("invalid subcommand %s" % args[0])
+
+
+def display_help(subcommand, subcommands):
+    """
+    Display help for subcommand.
+    """
+    if subcommand not in subcommands:
+        return False
+
+    help = subcommands.get(subcommand, subcommand_error)[2]
+    pager = subprocess.Popen('less', stdin=subprocess.PIPE)
+    pager.communicate(help)
+
+    return True
+
+
+def wic_help(args, usage_str, subcommands):
+    """
+    Subcommand help dispatcher.
+    """
+    if len(args) == 1 or not display_help(args[1], subcommands):
+        print(usage_str)
+
+
+def invoke_subcommand(args, parser, main_command_usage, subcommands):
+    """
+    Dispatch to subcommand handler borrowed from combo-layer.
+    Should use argparse, but has to work in 2.6.
+    """
+    if not args:
+        logging.error("No subcommand specified, exiting")
+        parser.print_help()
+    elif args[0] == "help":
+        wic_help(args, main_command_usage, subcommands)
+    elif args[0] not in subcommands:
+        logging.error("Unsupported subcommand %s, exiting\n" % (args[0]))
+        parser.print_help()
+    else:
+        usage = subcommands.get(args[0], subcommand_error)[1]
+        subcommands.get(args[0], subcommand_error)[0](args[1:], usage)
+
+
+##
+# wic help and usage strings
+##
+
+wic_usage = """
+
+ Create a customized OpenEmbedded image
+
+ usage: wic [--version] [--help] COMMAND [ARGS]
+
+ Current 'wic' commands are:
+    create            Create a new OpenEmbedded image
+    list              List available values for options and image properties
+
+ See 'wic help COMMAND' for more information on a specific command.
+"""
+
+wic_help_usage = """
+
+ usage: wic help <subcommand>
+
+ This command displays detailed help for the specified subcommand.
+"""
+
+wic_create_usage = """
+
+ Create a new OpenEmbedded image
+
+ usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
+            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+
+ This command creates an OpenEmbedded image based on the 'OE kickstart
+ commands' found in the <wks file>.
+
+ The -o option can be used to place the image in a directory with a
+ different name and location.
+
+ See 'wic help create' for more detailed instructions.
+"""
+
+wic_create_help = """
+
+NAME
+    wic create - Create a new OpenEmbedded image
+
+SYNOPSIS
+    wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
+        [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+        [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
+        [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+
+DESCRIPTION
+    This command creates an OpenEmbedded image based on the 'OE
+    kickstart commands' found in the <wks file>.
+
+    In order to do this, wic needs to know the locations of the
+    various build artifacts required to build the image.
+
+    Users can explicitly specify the build artifact locations using
+    the -r, -b, -k, and -n options.  See below for details on where
+    the corresponding artifacts are typically found in a normal
+    OpenEmbedded build.
+
+    Alternatively, users can use the -e option to have 'mic' determine
+    those locations for a given image.  If the -e option is used, the
+    user needs to have set the appropriate MACHINE variable in
+    local.conf, and have sourced the build environment.
+
+    The -e option is used to specify the name of the image to use the
+    artifacts from e.g. core-image-sato.
+
+    The -r option is used to specify the path to the /rootfs dir to
+    use as the .wks rootfs source.
+
+    The -b option is used to specify the path to the dir containing
+    the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the
+    .wks bootimg source.
+
+    The -k option is used to specify the path to the dir containing
+    the kernel to use in the .wks bootimg.
+
+    The -n option is used to specify the path to the native sysroot
+    containing the tools to use to build the image.
+
+    The -s option is used to skip the build check.  The build check is
+    a simple sanity check used to determine whether the user has
+    sourced the build environment so that the -e option can operate
+    correctly.  If the user has specified the build artifact locations
+    explicitly, 'wic' assumes the user knows what he or she is doing
+    and skips the build check.
+
+    When 'wic -e' is used, the locations for the build artifacts
+    values are determined by 'wic -e' from the output of the 'bitbake
+    -e' command given an image name e.g. 'core-image-minimal' and a
+    given machine set in local.conf.  In that case, the image is
+    created as if the following 'bitbake -e' variables were used:
+
+    -r:        IMAGE_ROOTFS
+    -k:        STAGING_KERNEL_DIR
+    -n:        STAGING_DIR_NATIVE
+    -b:        HDDDIR and STAGING_DATA_DIR (handlers decide which to use)
+
+    If 'wic -e' is not used, the user needs to select the appropriate
+    value for -b (as well as -r, -k, and -n).
+
+    The -o option can be used to place the image in a directory with a
+    different name and location.
+
+    As an alternative to the wks file, the image-specific properties
+    that define the values that will be used to generate a particular
+    image can be specified on the command-line using the -i option and
+    supplying a JSON object consisting of the set of name:value pairs
+    needed by image creation.
+
+    The set of properties available for a given image type can be
+    listed using the 'wic list' command.
+"""
+
+wic_list_usage = """
+
+ List available OpenEmbedded image properties and values
+
+ usage: wic list images
+        wic list <image> help
+        wic list properties
+        wic list properties <wks file>
+        wic list property <property>
+                [-o <JSON PROPERTY FILE> | --outfile <JSON PROPERTY_FILE>]
+
+ This command enumerates the set of available canned images as well as
+ help for those images.  It also can be used to enumerate the complete
+ set of possible values for a specified option or property needed by
+ the image creation process.
+
+ The first form enumerates all the available 'canned' images.
+
+ The second form lists the detailed help information for a specific
+ 'canned' image.
+
+ The third form enumerates all the possible values that exist and can
+ be specified in an OE kickstart (wks) file.
+
+ The fourth form enumerates all the possible options that exist for
+ the set of properties specified in a given OE kickstart (ks) file.
+
+ The final form enumerates all the possible values that exist and can
+ be specified for any given OE kickstart (wks) property.
+
+ See 'wic help list' for more details.
+"""
+
+wic_list_help = """
+
+NAME
+    wic list - List available OpenEmbedded image properties and values
+
+SYNOPSIS
+    wic list images
+    wic list <image> help
+    wic list properties
+    wic list properties <wks file>
+    wic list property <property>
+            [-o <JSON PROPERTY FILE> | --outfile <JSON PROPERTY_FILE>]
+
+DESCRIPTION
+    This command enumerates the complete set of possible values for a
+    specified option or property needed by the image creation process.
+
+    This command enumerates the set of available canned images as well
+    as help for those images.  It also can be used to enumerate the
+    complete set of possible values for a specified option or property
+    needed by the image creation process.
+
+    The first form enumerates all the available 'canned' images.
+    These are actually just the set of .wks files that have been moved
+    into the /scripts/lib/image/canned-wks directory).
+
+    The second form lists the detailed help information for a specific
+    'canned' image.
+
+    The third form enumerates all the possible values that exist and
+    can be specified in a OE kickstart (wks) file.  The output of this
+    can be used by the third form to print the description and
+    possible values of a specific property.
+
+    The fourth form enumerates all the possible options that exist for
+    the set of properties specified in a given OE kickstart (wks)
+    file.  If the -o option is specified, the list of properties, in
+    addition to being displayed, will be written to the specified file
+    as a JSON object.  In this case, the object will consist of the
+    set of name:value pairs corresponding to the (possibly nested)
+    dictionary of properties defined by the input statements used by
+    the image.  Some example output for the 'list <wks file>' command:
+
+    $ wic list test.ks
+    "part" : {
+        "mountpoint" : "/"
+        "fstype" : "ext3"
+    }
+    "part" : {
+        "mountpoint" : "/home"
+        "fstype" : "ext3"
+        "offset" : "10000"
+    }
+    "bootloader" : {
+        "type" : "efi"
+    }
+    .
+    .
+    .
+
+    Each entry in the output consists of the name of the input element
+    e.g. "part", followed by the properties defined for that
+    element enclosed in braces.  This information should provide
+    sufficient information to create a complete user interface with.
+
+    The final form enumerates all the possible values that exist and
+    can be specified for any given OE kickstart (wks) property.  If
+    the -o option is specified, the list of values for the given
+    property, in addition to being displayed, will be written to the
+    specified file as a JSON object.  In this case, the object will
+    consist of the set of name:value pairs corresponding to the array
+    of property values associated with the property.
+
+    $ wic list property part
+        ["mountpoint", "where the partition should be mounted"]
+        ["fstype", "filesytem type of the partition"]
+            ["ext3"]
+            ["ext4"]
+            ["btrfs"]
+            ["swap"]
+        ["offset", "offset of the partition within the image"]
+
+"""
diff --git a/scripts/wic b/scripts/wic
new file mode 100755
index 0000000..06e72bb
--- /dev/null
+++ b/scripts/wic
@@ -0,0 +1,185 @@
+#!/usr/bin/env python
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2013, Intel Corporation.
+# All rights reserved.
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
+#
+# DESCRIPTION 'wic' is the OpenEmbedded Image Creator that users can
+# use to generate bootable images.  Invoking it without any arguments
+# will display help screens for the 'wic' command and list the
+# available 'wic' subcommands.  Invoking a subcommand without any
+# arguments will likewise display help screens for the specified
+# subcommand.  Please use that interface for detailed help.
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+__version__ = "0.1.0"
+
+import os
+import sys
+import optparse
+import logging
+
+scripts_path = os.path.abspath(os.path.dirname(os.path.abspath(sys.argv[0])))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+
+from image.help import *
+from image.engine import *
+
+
+def wic_create_subcommand(args, usage_str):
+    """
+    Command-line handling for image creation.  The real work is done
+    by image.engine.wic_create()
+    """
+    parser = optparse.OptionParser(usage = usage_str)
+
+    parser.add_option("-o", "--outdir", dest = "outdir",
+                      action = "store", help = "name of directory to create image in")
+    parser.add_option("-i", "--infile", dest = "properties_file",
+                      action = "store", help = "name of file containing the values for image properties as a JSON file")
+    parser.add_option("-e", "--image-name", dest = "image_name",
+                      action = "store", help = "name of the image to use the artifacts from e.g. core-image-sato")
+    parser.add_option("-r", "--rootfs-dir", dest = "rootfs_dir",
+                      action = "store", help = "path to the /rootfs dir to use as the .wks rootfs source")
+    parser.add_option("-b", "--bootimg-dir", dest = "bootimg_dir",
+                      action = "store", help = "path to the dir containing the boot artifacts (e.g. /EFI or /syslinux dirs) to use as the .wks bootimg source")
+    parser.add_option("-k", "--kernel-dir", dest = "kernel_dir",
+                      action = "store", help = "path to the dir containing the kernel to use in the .wks bootimg")
+    parser.add_option("-n", "--native-sysroot", dest = "native_sysroot",
+                      action = "store", help = "path to the native sysroot containing the tools to use to build the image")
+    parser.add_option("-p", "--skip-build-check", dest = "build_check",
+                      action = "store_false", default = True, help = "skip the build check")
+
+    (options, args) = parser.parse_args(args)
+
+    if len(args) != 1:
+        logging.error("Wrong number of arguments, exiting\n")
+        parser.print_help()
+        sys.exit(1)
+
+    if not options.image_name:
+        options.build_check = False
+
+    if options.build_check and not options.properties_file:
+        print "Checking basic build environment..."
+        if not verify_build_env():
+            print "Couldn't verify build environment, exiting\n"
+            sys.exit(1)
+        else:
+            print "Done.\n"
+
+    print "Creating image(s)...\n"
+
+    bootimg_dir = staging_data_dir = hdddir = ""
+
+    if options.image_name:
+        (rootfs_dir, kernel_dir, hdddir, staging_data_dir, native_sysroot) = \
+            find_artifacts(options.image_name)
+
+    wks_file = args[0]
+
+    if not wks_file.endswith(".wks"):
+        wks_file = find_canned_image(scripts_path, wks_file)
+        if not wks_file:
+            print "No image named %s found, exiting.  (Use 'wic list images' to list available images, or specify a fully-qualified OE kickstart (.wks) filename)\n" % wks_file
+            sys.exit(1)
+
+    image_output_dir = ""
+    if options.outdir:
+        image_output_dir = options.outdir
+
+    if not options.image_name:
+        rootfs_dir = options.rootfs_dir
+        bootimg_dir = options.bootimg_dir
+        kernel_dir = options.kernel_dir
+        native_sysroot = options.native_sysroot
+
+    wic_create(args, wks_file, rootfs_dir, bootimg_dir, kernel_dir,
+               native_sysroot, hdddir, staging_data_dir, scripts_path,
+               image_output_dir, options.properties_file)
+
+
+def wic_list_subcommand(args, usage_str):
+    """
+    Command-line handling for listing available image properties and
+    values.  The real work is done by image.engine.wic_list()
+    """
+    parser = optparse.OptionParser(usage = usage_str)
+
+    parser.add_option("-o", "--outfile", action = "store",
+                      dest = "properties_file",
+                      help = "dump the possible values for image properties to a JSON file")
+
+    (options, args) = parser.parse_args(args)
+
+    if not wic_list(args, scripts_path, options.properties_file):
+        logging.error("Bad list arguments, exiting\n")
+        parser.print_help()
+        sys.exit(1)
+
+
+subcommands = {
+    "create": [wic_create_subcommand,
+               wic_create_usage,
+               wic_create_help],
+    "list":   [wic_list_subcommand,
+               wic_list_usage,
+               wic_list_help],
+}
+
+
+def start_logging(loglevel):
+    logging.basicConfig(filname = 'wic.log', filemode = 'w', level=loglevel)
+
+
+def main():
+    parser = optparse.OptionParser(version = "wic version %s" % __version__,
+                                   usage = wic_usage)
+
+    parser.disable_interspersed_args()
+    parser.add_option("-D", "--debug", dest = "debug", action = "store_true",
+                      default = False, help = "output debug information")
+
+    (options, args) = parser.parse_args()
+
+    loglevel = logging.INFO
+    if options.debug:
+        loglevel = logging.DEBUG
+    start_logging(loglevel)
+
+    if len(args):
+        if args[0] == "help":
+            if len(args) == 1:
+                parser.print_help()
+                sys.exit(1)
+
+    invoke_subcommand(args, parser, wic_help_usage, subcommands)
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
+
-- 
1.7.11.4


