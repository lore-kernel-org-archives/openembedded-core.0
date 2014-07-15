Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 336F57064C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:43:44 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jul 2014 08:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="457235052"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO localhost)
	([10.255.13.33])
	by azsmga001.ch.intel.com with ESMTP; 15 Jul 2014 08:43:44 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 10:43:37 -0500
Message-Id: <0b39aa8efa3eac8078452ff1432dab9632065187.1405438752.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
References: <f27d93432eef12967210dfe6dbfdc451371bd1d6.1405438752.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1405438752.git.tom.zanussi@linux.intel.com>
References: <cover.1405438752.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 4/5] wic: Add kickstart reference to help system
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
X-List-Received-Date: Tue, 15 Jul 2014 15:43:44 -0000

Add a 'wic kickstart' help section to make it easy for users to access
the kickstart reference without having to go to an external website.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/image/canned-wks/directdisk.wks |   2 +-
 scripts/lib/image/help.py                   | 114 ++++++++++++++++++++++++++++
 scripts/wic                                 |  27 ++++---
 3 files changed, 130 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/image/canned-wks/directdisk.wks b/scripts/lib/image/canned-wks/directdisk.wks
index 397a929..62dcab1 100644
--- a/scripts/lib/image/canned-wks/directdisk.wks
+++ b/scripts/lib/image/canned-wks/directdisk.wks
@@ -3,7 +3,7 @@
 # can directly dd to boot media.
 
 
-part /boot --source bootimg-pcbios --ondisk sda --fstype=msdos --label boot --active --align 1024
+part /boot --source bootimg-pcbios --ondisk sda --label boot --active --align 1024
 part / --source rootfs --ondisk sda --fstype=ext3 --label platform --align 1024
 
 bootloader  --timeout=0  --append="rootwait rootfstype=ext3 video=vesafb vga=0x318 console=tty0"
diff --git a/scripts/lib/image/help.py b/scripts/lib/image/help.py
index bf2f773..a7e7830 100644
--- a/scripts/lib/image/help.py
+++ b/scripts/lib/image/help.py
@@ -631,3 +631,117 @@ DESCRIPTION
     kickstart commands available for use in .wks files from 'wic help
     kickstart'.
 """
+
+wic_kickstart_help = """
+
+NAME
+    wic kickstart - wic kickstart reference
+
+DESCRIPTION
+    This section provides the definitive reference to the wic
+    kickstart language.  It also provides documentation on the list of
+    --source plugins available for use from the 'part' command (see
+    the 'Platform-specific Plugins' section below).
+
+    The current wic implementation supports only the basic kickstart
+    partitioning commands: partition (or part for short) and
+    bootloader.
+
+    The following is a listing of the commands, their syntax, and
+    meanings. The commands are based on the Fedora kickstart
+    documentation but with modifications to reflect wic capabilities.
+
+      http://fedoraproject.org/wiki/Anaconda/Kickstart#part_or_partition
+      http://fedoraproject.org/wiki/Anaconda/Kickstart#bootloader
+
+  Commands
+
+    * 'part' or 'partition'
+
+       This command creates a partition on the system and uses the
+       following syntax:
+
+         part <mountpoint>
+
+       The <mountpoint> is where the partition will be mounted and
+       must take of one of the following forms:
+
+         /<path>: For example: /, /usr, or /home
+
+         swap: The partition will be used as swap space.
+
+       The following are supported 'part' options:
+
+         --size: The minimum partition size in MBytes. Specify an
+                 integer value such as 500. Do not append the number
+                 with "MB". You do not need this option if you use
+                 --source.
+
+         --source: This option is a wic-specific option that names the
+                   source of the data that will populate the
+                   partition.  The most common value for this option
+                   is 'rootfs', but can be any value which maps to a
+                   valid 'source plugin' (see 'wic help plugins').
+
+                   If '--source rootfs' is used, it tells the wic
+                   command to create a partition as large as needed
+                   and to fill it with the contents of the root
+                   filesystem pointed to by the '-r' wic command-line
+                   option (or the equivalent rootfs derived from the
+                   '-e' command-line option).  The filesystem type
+                   that will be used to create the partition is driven
+                   by the value of the --fstype option specified for
+                   the partition (see --fstype below).
+
+                   If --source <plugin-name>' is used, it tells the
+                   wic command to create a partition as large as
+                   needed and to fill with the contents of the
+                   partition that will be generated by the specified
+                   plugin name using the data pointed to by the '-r'
+                   wic command-line option (or the equivalent rootfs
+                   derived from the '-e' command-line option).
+                   Exactly what those contents and filesystem type end
+                   up being are depend on the given plugin
+                   implementation.
+
+         --ondisk or --ondrive: Forces the partition to be created on
+                                a particular disk.
+
+         --fstype: Sets the file system type for the partition.  These
+           apply to partitions created using '--source rootfs' (see
+           --source above).  Valid values are:
+
+             ext2
+             ext3
+             ext4
+             btrfs
+             swap
+
+         --label label: Specifies the label to give to the filesystem
+                        to be made on the partition. If the given
+                        label is already in use by another filesystem,
+                        a new label is created for the partition.
+
+         --active: Marks the partition as active.
+
+         --align (in KBytes): This option is specific to wic and says
+                              to start a partition on an x KBytes
+                              boundary.
+
+    * bootloader
+
+      This command allows the user to specify various bootloader
+      options.  The following are supported 'bootloader' options:
+
+        --timeout: Specifies the number of seconds before the
+                   bootloader times out and boots the default option.
+
+        --append: Specifies kernel parameters. These will be added to
+                  bootloader command-line - for example, the syslinux
+                  APPEND or grub kernel command line.
+
+      Note that bootloader functionality and boot partitions are
+      implemented by the various --source plugins that implement
+      bootloader functionality; the bootloader command essentially
+      provides a means of modifying bootloader configuration.
+"""
diff --git a/scripts/wic b/scripts/wic
index 5453750..15cc9b3 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -240,18 +240,21 @@ wic_help_topic_usage = """
 """
 
 subcommands = {
-    "create":   [wic_create_subcommand,
-                 wic_create_usage,
-                 wic_create_help],
-    "list":     [wic_list_subcommand,
-                 wic_list_usage,
-                 wic_list_help],
-    "plugins":  [wic_help_topic_subcommand,
-                 wic_help_topic_usage,
-                 wic_plugins_help],
-    "overview":  [wic_help_topic_subcommand,
-                 wic_help_topic_usage,
-                 wic_overview_help],
+    "create":    [wic_create_subcommand,
+                  wic_create_usage,
+                  wic_create_help],
+    "list":      [wic_list_subcommand,
+                  wic_list_usage,
+                  wic_list_help],
+    "plugins":   [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  wic_plugins_help],
+    "overview":   [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  wic_overview_help],
+    "kickstart":  [wic_help_topic_subcommand,
+                  wic_help_topic_usage,
+                  wic_kickstart_help],
 }
 
 
-- 
1.8.3.1


