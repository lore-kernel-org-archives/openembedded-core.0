Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E466F7064C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:43:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jul 2014 08:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="543671696"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2014 08:43:43 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:36 -0500
Message-Id: <d6a7076713bf7a2f496faffaff4257fb4af33548.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
References: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1405438752.git.tom.zanussi@linux.intel.com>
References: <cover.1405438752.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 3/5] wic: Add wic overview to help system
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
X-List-Received-Date: Tue, 15 Jul 2014 15:43:45 -0000

Add a general overview of wic to the help system as 'wic overview',
along with some introductory examples.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/help.py | 209 ++++++++++++++++++++++++++++++++++++++++++++++
 scripts/wic               |  21 +++--
 2 files changed, 221 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index a4f27ab..bf2f773 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -88,6 +88,7 @@ wic_usage = """
     list              List available values for options and image properties
 
  Help topics:
+    overview           wic overview - General overview of wic
     plugins            wic plugins - Overview and API
 
  See 'wic help <COMMAND or HELP TOPIC>' for more information on a specific
@@ -422,3 +423,211 @@ DESCRIPTION
     with the actual methods. Please see the implementation for
     examples and details.
 """
+
+wic_overview_help = """
+
+NAME
+    wic overview - General overview of wic
+
+DESCRIPTION
+    The 'wic' command generates partitioned images from existing
+    OpenEmbedded build artifacts.  Image generation is driven by
+    partitioning commands contained in an 'Openembedded kickstart'
+    (.wks) file (see 'wic help kickstart') specified either directly
+    on the command-line or as one of a selection of canned .wks files
+    (see 'wic list images').  When applied to a given set of build
+    artifacts, the result is an image or set of images that can be
+    directly written onto media and used on a particular system.
+
+    The 'wic' command and the infrastructure it's based is by
+    definition incomplete - it's designed to allow the generation of
+    customized images, and as such was designed to be completely
+    extensible via a plugin interface (see 'wic help plugins').
+
+  Background and Motivation
+
+    wic is meant to be a completely independent standalone utility
+    that initially provides easier-to-use and more flexible
+    replacements for a couple bits of existing functionality in
+    oe-core: directdisk.bbclass and mkefidisk.sh.  The difference
+    between wic and those examples is that with wic the functionality
+    of those scripts is implemented by a general-purpose partitioning
+    'language' based on Redhat kickstart syntax (with the underlying
+    code borrowed from Tizen mic, which in turn was borrowed from
+    Meego mic, in turn borrowed from Fedora livecd, etc.).
+
+    The initial motivation and design considerations that lead to the
+    current tool are described exhaustively in Yocto Bug #3847
+    (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3847).
+
+    Though the current wic tool only uses the kickstart syntax related
+    to partitioning and bootloaders and only for creating images,
+    because the code is based on the mic/pykickstart code, future
+    deployment efforts such as those partially described by Yocto Bug
+    #4106 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=4106),
+    but also others including package selection (from e.g. binary
+    feeds) and deployment configuration of users/network/services,
+    etc, could be implemented under this framework, considering that
+    all of those are implemented in some form by the base system.
+
+  Implementation and Examples
+
+    wic can be used in two different modes, depending on how much
+    control the user needs in specifying the Openembedded build
+    artifacts that will be used in creating the image: 'raw' and
+    'cooked'.
+
+    If used in 'raw' mode, artifacts are explicitly specified via
+    command-line arguments (see example below).
+
+    The more easily usable 'cooked' mode uses the current MACHINE
+    setting and a specified image name to automatically locate the
+    artifacts used to create the image.
+
+    OE kickstart files (.wks) can of course be specified directly on
+    the command-line, but the user can also choose from a set of
+    'canned' .wks files available via the 'wic list images' command
+    (example below).
+
+    In any case, the prerequisite for generating any image is to have
+    the build artifacts already available.  The below examples assume
+    the user has already build a 'core-image-minimal' for a specific
+    machine (future versions won't require this redundant step, but
+    for now that's typically how build artifacts get generated).
+
+    The other prerequisite is to source the build environment:
+
+      $ source oe-init-build-env
+
+    To start out with, we'll generate an image from one of the canned
+    .wks files.  The following generates a list of availailable
+    images:
+
+      $ wic list images
+        mkefidisk             Create an EFI disk image
+        directdisk            Create a 'pcbios' direct disk image
+
+    You can get more information about any of the available images by
+    typing 'wic list xxx help', where 'xxx' is one of the image names:
+
+      $ wic list mkefidisk help
+
+    Creates a partitioned EFI disk image that the user can directly dd
+    to boot media.
+
+    At any time, you can get help on the 'wic' command or any
+    subcommand (currently 'list' and 'create').  For instance, to get
+    the description of 'wic create' command and its parameters:
+
+      $ wic create
+
+       Usage:
+
+       Create a new OpenEmbedded image
+
+       usage: wic create <wks file or image name> [-o <DIRNAME> | ...]
+            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
+            [-e | --image-name] [-r, --rootfs-dir] [-b, --bootimg-dir]
+            [-k, --kernel-dir] [-n, --native-sysroot] [-s, --skip-build-check]
+
+       This command creates an OpenEmbedded image based on the 'OE
+       kickstart commands' found in the <wks file>.
+
+       The -o option can be used to place the image in a directory
+       with a different name and location.
+
+       See 'wic help create' for more detailed instructions.
+       ...
+
+    As mentioned in the command, you can get even more detailed
+    information by adding 'help' to the above:
+
+      $ wic help create
+
+    So, the easiest way to create an image is to use the -e option
+    with a canned .wks file.  To use the -e option, you need to
+    specify the image used to generate the artifacts and you actually
+    need to have the MACHINE used to build them specified in your
+    local.conf (these requirements aren't necessary if you aren't
+    using the -e options.)  Below, we generate a directdisk image,
+    pointing the process at the core-image-minimal artifacts for the
+    current MACHINE:
+
+      $ wic create directdisk -e core-image-minimal
+
+      Checking basic build environment...
+      Done.
+
+      Creating image(s)...
+
+      Info: The new image(s) can be found here:
+      /var/tmp/wic/build/directdisk-201309252350-sda.direct
+
+      The following build artifacts were used to create the image(s):
+
+      ROOTFS_DIR:      ...
+      BOOTIMG_DIR:     ...
+      KERNEL_DIR:      ...
+      NATIVE_SYSROOT:  ...
+
+      The image(s) were created using OE kickstart file:
+        .../scripts/lib/image/canned-wks/directdisk.wks
+
+    The output shows the name and location of the image created, and
+    so that you know exactly what was used to generate the image, each
+    of the artifacts and the kickstart file used.
+
+    Similarly, you can create a 'mkefidisk' image in the same way
+    (notice that this example uses a different machine - because it's
+    using the -e option, you need to change the MACHINE in your
+    local.conf):
+
+      $ wic create mkefidisk -e core-image-minimal
+      Checking basic build environment...
+      Done.
+
+      Creating image(s)...
+
+      Info: The new image(s) can be found here:
+         /var/tmp/wic/build/mkefidisk-201309260027-sda.direct
+
+      ...
+
+    Here's an example that doesn't take the easy way out and manually
+    specifies each build artifact, along with a non-canned .wks file,
+    and also uses the -o option to have wic create the output
+    somewhere other than the default /var/tmp/wic:
+
+      $ wic create ~/test.wks -o /home/trz/testwic --rootfs-dir
+      /home/trz/yocto/build/tmp/work/crownbay/core-image-minimal/1.0-r0/rootfs
+      --bootimg-dir /home/trz/yocto/build/tmp/sysroots/crownbay/usr/share
+      --kernel-dir /home/trz/yocto/build/tmp/sysroots/crownbay/usr/src/kernel
+      --native-sysroot /home/trz/yocto/build/tmp/sysroots/x86_64-linux
+
+      Creating image(s)...
+
+      Info: The new image(s) can be found here:
+        /home/trz/testwic/build/test-201309260032-sda.direct
+
+      ...
+
+    Finally, here's an example of the actual partition language
+    commands used to generate the mkefidisk image i.e. these are the
+    contents of the mkefidisk.wks OE kickstart file:
+
+      # short-description: Create an EFI disk image
+      # long-description: Creates a partitioned EFI disk image that the user
+      # can directly dd to boot media.
+
+      part /boot --source bootimg-efi --ondisk sda --fstype=efi --active
+
+      part / --source rootfs --ondisk sda --fstype=ext3 --label platform
+
+      part swap --ondisk sda --size 44 --label swap1 --fstype=swap
+
+      bootloader  --timeout=10  --append="rootwait console=ttyPCH0,115200"
+
+    You can get a complete listing and description of all the
+    kickstart commands available for use in .wks files from 'wic help
+    kickstart'.
+"""
diff --git a/scripts/wic b/scripts/wic
index ac3ed16..5453750 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -240,15 +240,18 @@ wic_help_topic_usage = """
 """
 
 subcommands = {
-    "create":  [wic_create_subcommand,
-                wic_create_usage,
-                wic_create_help],
-    "list":    [wic_list_subcommand,
-                wic_list_usage,
-                wic_list_help],
-    "plugins": [wic_help_topic_subcommand,
-                wic_help_topic_usage,
-                wic_plugins_help],
+    "create":   [wic_create_subcommand,
+                 wic_create_usage,
+                 wic_create_help],
+    "list":     [wic_list_subcommand,
+                 wic_list_usage,
+                 wic_list_help],
+    "plugins":  [wic_help_topic_subcommand,
+                 wic_help_topic_usage,
+                 wic_plugins_help],
+    "overview":  [wic_help_topic_subcommand,
+                 wic_help_topic_usage,
+                 wic_overview_help],
 }
 
 
-- 
1.8.3.1


