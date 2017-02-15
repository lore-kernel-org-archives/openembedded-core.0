Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9B338772BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:01:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 15 Feb 2017 01:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="934089846"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 Feb 2017 01:01:56 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 27BA36A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:52 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:27 +0200
Message-Id: <40e0c701b85ad3959a92cf466efbe3a1529f6051.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/11] wic: use wic logger in wic source plugins
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
X-List-Received-Date: Wed, 15 Feb 2017 09:01:56 -0000

Replaced msger with wic logger in wic source plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 60 ++++++++------
 .../lib/wic/plugins/source/bootimg-partition.py    | 28 ++++---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 41 +++++----
 scripts/lib/wic/plugins/source/fsimage.py          | 16 ++--
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 96 +++++++++++++---------
 scripts/lib/wic/plugins/source/rawcopy.py          | 14 ++--
 scripts/lib/wic/plugins/source/rootfs.py           | 24 +++---
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 56 +++++++------
 8 files changed, 200 insertions(+), 135 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 95316c8..e4c8451 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -24,15 +24,18 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
+import logging
 import os
 import shutil
+import sys
 
-from wic import msger
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd, get_bitbake_var,
                             BOOTDD_EXTRA_SPACE)
 
+logger = logging.getLogger('wic')
+
 class BootimgEFIPlugin(SourcePlugin):
     """
     Create EFI boot partition.
@@ -53,11 +56,12 @@ class BootimgEFIPlugin(SourcePlugin):
             if custom_cfg:
                 # Use a custom configuration for grub
                 grubefi_conf = custom_cfg
-                msger.debug("Using custom configuration file "
-                            "%s for grub.cfg" % configfile)
+                logger.debug("Using custom configuration file "
+                             "%s for grub.cfg", configfile)
             else:
-                msger.error("configfile is specified but failed to "
-                            "get it from %s." % configfile)
+                logger.error("configfile is specified but failed to "
+                             "get it from %s.", configfile)
+                sys.exit(1)
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
@@ -75,8 +79,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 % (kernel, creator.rootdev, bootloader.append)
             grubefi_conf += "}\n"
 
-        msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
-                        % cr_workdir)
+        logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
+                     cr_workdir)
         cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir, "w")
         cfg.write(grubefi_conf)
         cfg.close()
@@ -104,15 +108,16 @@ class BootimgEFIPlugin(SourcePlugin):
             # obviously we need to have a common common deploy var
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
 
             cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
             exec_cmd(cp_cmd, True)
         else:
-            msger.debug("Ignoring missing initrd")
+            logger.debug("Ignoring missing initrd")
 
-        msger.debug("Writing systemd-boot config %s/hdd/boot/loader/loader.conf" \
-                        % cr_workdir)
+        logger.debug("Writing systemd-boot config "
+                     "%s/hdd/boot/loader/loader.conf", cr_workdir)
         cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
         cfg.write(loader_conf)
         cfg.close()
@@ -124,11 +129,12 @@ class BootimgEFIPlugin(SourcePlugin):
             if custom_cfg:
                 # Use a custom configuration for systemd-boot
                 boot_conf = custom_cfg
-                msger.debug("Using custom configuration file "
-                            "%s for systemd-boots's boot.conf" % configfile)
+                logger.debug("Using custom configuration file "
+                             "%s for systemd-boots's boot.conf", configfile)
             else:
-                msger.error("configfile is specified but failed to "
-                            "get it from %s." % configfile)
+                logger.error("configfile is specified but failed to "
+                             "get it from %s.", configfile)
+                sys.exit(1)
 
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
@@ -143,8 +149,8 @@ class BootimgEFIPlugin(SourcePlugin):
             if initrd:
                 boot_conf += "initrd /%s\n" % initrd
 
-        msger.debug("Writing systemd-boot config %s/hdd/boot/loader/entries/boot.conf" \
-                        % cr_workdir)
+        logger.debug("Writing systemd-boot config "
+                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
         cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
         cfg.write(boot_conf)
         cfg.close()
@@ -168,9 +174,11 @@ class BootimgEFIPlugin(SourcePlugin):
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             else:
-                msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
+                logger.error("unrecognized bootimg-efi loader: %s", source_params['loader'])
+                sys.exit(1)
         except KeyError:
-            msger.error("bootimg-efi requires a loader, none specified")
+            logger.error("bootimg-efi requires a loader, none specified")
+            sys.exit(1)
 
 
     @classmethod
@@ -185,7 +193,8 @@ class BootimgEFIPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
             # just so the result notes display it
             creator.bootimg_dir = bootimg_dir
 
@@ -212,9 +221,12 @@ class BootimgEFIPlugin(SourcePlugin):
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
             else:
-                msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
+                logger.error("unrecognized bootimg-efi loader: %s",
+                             source_params['loader'])
+                sys.exit(1)
         except KeyError:
-            msger.error("bootimg-efi requires a loader, none specified")
+            logger.error("bootimg-efi requires a loader, none specified")
+            sys.exit(1)
 
         startup = os.path.join(bootimg_dir, "startup.nsh")
         if os.path.exists(startup):
@@ -232,8 +244,8 @@ class BootimgEFIPlugin(SourcePlugin):
 
         blocks += extra_blocks
 
-        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                    (extra_blocks, part.mountpoint, blocks))
+        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                     extra_blocks, part.mountpoint, blocks)
 
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index e0d9a50..b486915 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -23,15 +23,18 @@
 # Maciej Borzecki <maciej.borzecki (at] open-rnd.pl>
 #
 
+import logging
 import os
 import re
+import sys
 
 from glob import glob
 
-from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 
+logger = logging.getLogger('wic')
+
 class BootimgPartitionPlugin(SourcePlugin):
     """
     Create an image of boot partition, copying over files
@@ -78,16 +81,18 @@ class BootimgPartitionPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
 
-        msger.debug('Bootimg dir: %s' % bootimg_dir)
+        logger.debug('Bootimg dir: %s', bootimg_dir)
 
         boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
 
         if not boot_files:
-            msger.error('No boot files defined, IMAGE_BOOT_FILES unset')
+            logger.error('No boot files defined, IMAGE_BOOT_FILES unset')
+            sys.exit(1)
 
-        msger.debug('Boot files: %s' % boot_files)
+        logger.debug('Boot files: %s', boot_files)
 
         # list of tuples (src_name, dst_name)
         deploy_files = []
@@ -95,11 +100,12 @@ class BootimgPartitionPlugin(SourcePlugin):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
                 if not dst_entry[0] or not dst_entry[1]:
-                    msger.error('Malformed boot file entry: %s' % (src_entry))
+                    logger.error('Malformed boot file entry: %s', src_entry)
+                    sys.exit(1)
             else:
                 dst_entry = (src_entry, src_entry)
 
-            msger.debug('Destination entry: %r' % (dst_entry,))
+            logger.debug('Destination entry: %r', dst_entry)
             deploy_files.append(dst_entry)
 
         for deploy_entry in deploy_files:
@@ -117,7 +123,7 @@ class BootimgPartitionPlugin(SourcePlugin):
 
                 srcs = glob(os.path.join(bootimg_dir, src))
 
-                msger.debug('Globbed sources: %s' % (', '.join(srcs)))
+                logger.debug('Globbed sources: %s', ', '.join(srcs))
                 for entry in srcs:
                     entry_dst_name = entry_name_fn(entry)
                     install_task.append((entry,
@@ -129,12 +135,12 @@ class BootimgPartitionPlugin(SourcePlugin):
 
             for task in install_task:
                 src_path, dst_path = task
-                msger.debug('Install %s as %s' % (os.path.basename(src_path),
-                                                  dst_path))
+                logger.debug('Install %s as %s',
+                             os.path.basename(src_path), dst_path)
                 install_cmd = "install -m 0644 -D %s %s" \
                               % (src_path, dst_path)
                 exec_cmd(install_cmd)
 
-        msger.debug('Prepare boot partition using rootfs in %s' % (hdddir))
+        logger.debug('Prepare boot partition using rootfs in %s', hdddir)
         part.prepare_rootfs(cr_workdir, oe_builddir, hdddir,
                             native_sysroot)
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index e5f6a32..590d3d6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -24,9 +24,10 @@
 # Tom Zanussi <tom.zanussi (at] linux.intel.com>
 #
 
+import logging
 import os
+import sys
 
-from wic import msger
 from wic.engine import get_custom_config
 from wic.utils import runner
 from wic.utils.errors import ImageError
@@ -34,6 +35,8 @@ from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd,
                             get_bitbake_var, BOOTDD_EXTRA_SPACE)
 
+logger = logging.getLogger('wic')
+
 class BootimgPcbiosPlugin(SourcePlugin):
     """
     Create MBR boot partition and install syslinux on it.
@@ -54,16 +57,18 @@ class BootimgPcbiosPlugin(SourcePlugin):
         elif creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            msger.error("Unsupported partition table: %s" % creator.ptable_format)
+            logger.error("Unsupported partition table: %s", creator.ptable_format)
+            sys.exit(1)
 
         if not os.path.exists(mbrfile):
-            msger.error("Couldn't find %s.  If using the -e option, do you "
-                        "have the right MACHINE set in local.conf?  If not, "
-                        "is the bootimg_dir path correct?" % mbrfile)
+            logger.error("Couldn't find %s.  If using the -e option, do you "
+                         "have the right MACHINE set in local.conf?  If not, "
+                         "is the bootimg_dir path correct?", mbrfile)
+            sys.exit(1)
 
         full_path = creator._full_path(workdir, disk_name, "direct")
-        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
-                    % (disk_name, full_path, disk.min_size))
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
 
         rcode = runner.show(['dd', 'if=%s' % mbrfile,
                              'of=%s' % full_path, 'conv=notrunc'])
@@ -90,11 +95,11 @@ class BootimgPcbiosPlugin(SourcePlugin):
             if custom_cfg:
                 # Use a custom configuration for grub
                 syslinux_conf = custom_cfg
-                msger.debug("Using custom configuration file "
-                            "%s for syslinux.cfg" % bootloader.configfile)
+                logger.debug("Using custom configuration file %s "
+                             "for syslinux.cfg", bootloader.configfile)
             else:
-                msger.error("configfile is specified but failed to "
-                            "get it from %s." % bootloader.configfile)
+                logger.error("configfile is specified but failed to "
+                             "get it from %s.", bootloader.configfile)
 
         if not custom_cfg:
             # Create syslinux configuration using parameters from wks file
@@ -122,8 +127,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
             syslinux_conf += "APPEND label=boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
-        msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
-                    % cr_workdir)
+        logger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg",
+                     cr_workdir)
         cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
         cfg.write(syslinux_conf)
         cfg.close()
@@ -147,9 +152,11 @@ class BootimgPcbiosPlugin(SourcePlugin):
         if not _has_syslinux(bootimg_dir):
             bootimg_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
             if not bootimg_dir:
-                msger.error("Couldn't find STAGING_DATADIR, exiting\n")
+                logger.error("Couldn't find STAGING_DATADIR, exiting\n")
+                sys.exit(1)
             if not _has_syslinux(bootimg_dir):
-                msger.error("Please build syslinux first\n")
+                logger.error("Please build syslinux first\n")
+                sys.exit(1)
             # just so the result notes display it
             creator.bootimg_dir = bootimg_dir
 
@@ -176,8 +183,8 @@ class BootimgPcbiosPlugin(SourcePlugin):
 
         blocks += extra_blocks
 
-        msger.debug("Added %d extra blocks to %s to get to %d total blocks" % \
-                    (extra_blocks, part.mountpoint, blocks))
+        logger.debug("Added %d extra blocks to %s to get to %d total blocks",
+                     extra_blocks, part.mountpoint, blocks)
 
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 9193892..35fb78b 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -15,12 +15,15 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 
+import logging
 import os
+import sys
 
-from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
+logger = logging.getLogger('wic')
+
 class FSImagePlugin(SourcePlugin):
     """
     Add an already existing filesystem image to the partition layout.
@@ -58,16 +61,17 @@ class FSImagePlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
 
-        msger.debug('Bootimg dir: %s' % bootimg_dir)
+        logger.debug('Bootimg dir: %s', bootimg_dir)
 
         if 'file' not in source_params:
-            msger.error("No file specified\n")
-            return
+            logger.error("No file specified\n")
+            sys.exit(1)
 
         src = os.path.join(bootimg_dir, source_params['file'])
 
 
-        msger.debug('Preparing partition using image %s' % (src))
+        logger.debug('Preparing partition using image %s', src)
         part.prepare_rootfs_from_fs_image(cr_workdir, src, "")
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index fb34235..33de6d8 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -20,16 +20,19 @@
 # AUTHORS
 # Mihaly Varga <mihaly.varga (at] ni.com>
 
+import glob
+import logging
 import os
 import re
 import shutil
-import glob
+import sys
 
-from wic import msger
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
 
+logger = logging.getLogger('wic')
+
 class IsoImagePlugin(SourcePlugin):
     """
     Create a bootable ISO image
@@ -85,8 +88,9 @@ class IsoImagePlugin(SourcePlugin):
         syslinux_conf += "APPEND initrd=/initrd LABEL=boot %s\n" \
                              % bootloader.append
 
-        msger.debug("Writing syslinux config %s/ISO/isolinux/isolinux.cfg" \
-                    % cr_workdir)
+        logger.debug("Writing syslinux config %s/ISO/isolinux/isolinux.cfg",
+                     cr_workdir)
+
         with open("%s/ISO/isolinux/isolinux.cfg" % cr_workdir, "w") as cfg:
             cfg.write(syslinux_conf)
 
@@ -99,11 +103,12 @@ class IsoImagePlugin(SourcePlugin):
         if configfile:
             grubefi_conf = get_custom_config(configfile)
             if grubefi_conf:
-                msger.debug("Using custom configuration file "
-                            "%s for grub.cfg" % configfile)
+                logger.debug("Using custom configuration file %s for grub.cfg",
+                             configfile)
             else:
-                msger.error("configfile is specified but failed to "
-                            "get it from %s." % configfile)
+                logger.error("configfile is specified "
+                             "but failed to get it from %s", configfile)
+                sys.exit(1)
         else:
             splash = os.path.join(cr_workdir, "EFI/boot/splash.jpg")
             if os.path.exists(splash):
@@ -133,8 +138,8 @@ class IsoImagePlugin(SourcePlugin):
             if splashline:
                 grubefi_conf += "%s\n" % splashline
 
-        msger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg" \
-                        % cr_workdir)
+        logger.debug("Writing grubefi config %s/EFI/BOOT/grub.cfg", cr_workdir)
+
         with open("%s/EFI/BOOT/grub.cfg" % cr_workdir, "w") as cfg:
             cfg.write(grubefi_conf)
 
@@ -148,19 +153,23 @@ class IsoImagePlugin(SourcePlugin):
         if not initrd:
             initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not initrd_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting.\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting.\n")
+                sys.exit(1)
 
             image_name = get_bitbake_var("IMAGE_BASENAME")
             if not image_name:
-                msger.error("Couldn't find IMAGE_BASENAME, exiting.\n")
+                logger.error("Couldn't find IMAGE_BASENAME, exiting.\n")
+                sys.exit(1)
 
             image_type = get_bitbake_var("INITRAMFS_FSTYPES")
             if not image_type:
-                msger.error("Couldn't find INITRAMFS_FSTYPES, exiting.\n")
+                logger.error("Couldn't find INITRAMFS_FSTYPES, exiting.\n")
+                sys.exit(1)
 
             target_arch = get_bitbake_var("TRANSLATED_TARGET_ARCH")
             if not target_arch:
-                msger.error("Couldn't find TRANSLATED_TARGET_ARCH, exiting.\n")
+                logger.error("Couldn't find TRANSLATED_TARGET_ARCH, exiting.\n")
+                sys.exit(1)
 
             initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, target_arch, image_type))[0]
 
@@ -183,7 +192,8 @@ class IsoImagePlugin(SourcePlugin):
                 os.symlink(os.readlink("%s/sbin/init" % rootfs_dir), \
                             "%s/init" % initrd_dir)
             else:
-                msger.error("Couldn't find or build initrd, exiting.\n")
+                logger.error("Couldn't find or build initrd, exiting.\n")
+                sys.exit(1)
 
             exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
                     % initrd_dir, as_shell=True)
@@ -209,11 +219,11 @@ class IsoImagePlugin(SourcePlugin):
         exec_cmd(install_cmd)
 
         # Overwrite the name of the created image
-        msger.debug("%s" % source_params)
+        logger.debug(source_params)
         if 'image_name' in source_params and \
                     source_params['image_name'].strip():
             creator.name = source_params['image_name'].strip()
-            msger.debug("The name of the image is: %s" % creator.name)
+            logger.debug("The name of the image is: %s", creator.name)
 
     @classmethod
     def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
@@ -229,7 +239,8 @@ class IsoImagePlugin(SourcePlugin):
 
         if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in rootfs_dir:
-                msger.error("Couldn't find --rootfs-dir, exiting.\n")
+                logger.error("Couldn't find --rootfs-dir, exiting.\n")
+                sys.exit(1)
             rootfs_dir = rootfs_dir['ROOTFS_DIR']
         else:
             if part.rootfs_dir in rootfs_dir:
@@ -237,14 +248,16 @@ class IsoImagePlugin(SourcePlugin):
             elif part.rootfs_dir:
                 rootfs_dir = part.rootfs_dir
             else:
-                msg = "Couldn't find --rootfs-dir=%s connection "
-                msg += "or it is not a valid path, exiting.\n"
-                msger.error(msg % part.rootfs_dir)
+                logger.error("Couldn't find --rootfs-dir=%s connection "
+                             "or it is not a valid path, exiting.\n",
+                             part.rootfs_dir)
+                sys.exit(1)
 
         if not os.path.isdir(rootfs_dir):
             rootfs_dir = get_bitbake_var("IMAGE_ROOTFS")
         if not os.path.isdir(rootfs_dir):
-            msger.error("Couldn't find IMAGE_ROOTFS, exiting.\n")
+            logger.error("Couldn't find IMAGE_ROOTFS, exiting.\n")
+            sys.exit(1)
 
         part.rootfs_dir = rootfs_dir
 
@@ -283,7 +296,8 @@ class IsoImagePlugin(SourcePlugin):
         if source_params.get('initrd'):
             initrd = source_params['initrd']
             if not deploy_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
             cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
             exec_cmd(cp_cmd)
         else:
@@ -326,7 +340,8 @@ class IsoImagePlugin(SourcePlugin):
                 # didn't contains it
                 target_arch = get_bitbake_var("TARGET_SYS")
                 if not target_arch:
-                    msger.error("Coludn't find target architecture\n")
+                    logger.error("Coludn't find target architecture\n")
+                    sys.exit(1)
 
                 if re.match("x86_64", target_arch):
                     grub_target = 'x86_64-efi'
@@ -335,18 +350,21 @@ class IsoImagePlugin(SourcePlugin):
                     grub_target = 'i386-efi'
                     grub_image = "bootia32.efi"
                 else:
-                    msger.error("grub-efi is incompatible with target %s\n" \
-                                % target_arch)
+                    logger.error("grub-efi is incompatible with target %s\n",
+                                 target_arch)
+                    sys.exit(1)
 
                 if not os.path.isfile("%s/EFI/BOOT/%s" \
                                 % (bootimg_dir, grub_image)):
                     grub_path = get_bitbake_var("STAGING_LIBDIR", "wic-tools")
                     if not grub_path:
-                        msger.error("Couldn't find STAGING_LIBDIR, exiting.\n")
+                        logger.error("Couldn't find STAGING_LIBDIR, exiting.\n")
+                        sys.exit(1)
 
                     grub_core = "%s/grub/%s" % (grub_path, grub_target)
                     if not os.path.exists(grub_core):
-                        msger.error("Please build grub-efi first\n")
+                        logger.error("Please build grub-efi first\n")
+                        sys.exit(1)
 
                     grub_cmd = "grub-mkimage -p '/EFI/BOOT' "
                     grub_cmd += "-d %s "  % grub_core
@@ -362,10 +380,12 @@ class IsoImagePlugin(SourcePlugin):
                     exec_native_cmd(grub_cmd, native_sysroot)
 
             else:
-                msger.error("unrecognized bootimg-efi loader: %s" \
-                            % source_params['loader'])
+                logger.error("unrecognized bootimg-efi loader: %s",
+                             source_params['loader'])
+                sys.exit(1)
         except KeyError:
-            msger.error("bootimg-efi requires a loader, none specified")
+            logger.error("bootimg-efi requires a loader, none specified")
+            sys.exit(1)
 
         if os.path.exists("%s/EFI/BOOT" % isodir):
             shutil.rmtree("%s/EFI/BOOT" % isodir)
@@ -388,9 +408,8 @@ class IsoImagePlugin(SourcePlugin):
             blocks = int(out.split()[0])
             # Add some extra space for file system overhead
             blocks += 100
-            msg = "Added 100 extra blocks to %s to get to %d total blocks" \
-                    % (part.mountpoint, blocks)
-            msger.debug(msg)
+            logger.debug("Added 100 extra blocks to %s to get to %d "
+                         "total blocks", part.mountpoint, blocks)
 
             # dosfs image for EFI boot
             bootimg = "%s/efi.img" % isodir
@@ -412,7 +431,8 @@ class IsoImagePlugin(SourcePlugin):
         # Prepare files for legacy boot
         syslinux_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
         if not syslinux_dir:
-            msger.error("Couldn't find STAGING_DATADIR, exiting.\n")
+            logger.error("Couldn't find STAGING_DATADIR, exiting.\n")
+            sys.exit(1)
 
         if os.path.exists("%s/isolinux" % isodir):
             shutil.rmtree("%s/isolinux" % isodir)
@@ -452,7 +472,7 @@ class IsoImagePlugin(SourcePlugin):
         mkisofs_cmd += "-eltorito-platform 0xEF -eltorito-boot %s " % efi_img
         mkisofs_cmd += "-no-emul-boot %s " % isodir
 
-        msger.debug("running command: %s" % mkisofs_cmd)
+        logger.debug("running command: %s", mkisofs_cmd)
         exec_native_cmd(mkisofs_cmd, native_sysroot)
 
         shutil.rmtree(isodir)
@@ -478,14 +498,14 @@ class IsoImagePlugin(SourcePlugin):
         full_path_iso = creator._full_path(workdir, disk_name, "iso")
 
         isohybrid_cmd = "isohybrid -u %s" % iso_img
-        msger.debug("running command: %s" % isohybrid_cmd)
+        logger.debug("running command: %s", isohybrid_cmd)
         exec_native_cmd(isohybrid_cmd, native_sysroot)
 
         # Replace the image created by direct plugin with the one created by
         # mkisofs command. This is necessary because the iso image created by
         # mkisofs has a very specific MBR is system area of the ISO image, and
         # direct plugin adds and configures an another MBR.
-        msger.debug("Replaceing the image created by direct plugin\n")
+        logger.debug("Replaceing the image created by direct plugin\n")
         os.remove(disk.path)
         shutil.copy2(iso_img, full_path_iso)
         shutil.copy2(full_path_iso, full_path)
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 4e42e3e..c5c3be3 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -15,13 +15,16 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
 
+import logging
 import os
+import sys
 
-from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 from wic.filemap import sparse_copy
 
+logger = logging.getLogger('wic')
+
 class RawCopyPlugin(SourcePlugin):
     """
     Populate partition content from raw image file.
@@ -59,13 +62,14 @@ class RawCopyPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                msger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
+                sys.exit(1)
 
-        msger.debug('Bootimg dir: %s' % bootimg_dir)
+        logger.debug('Bootimg dir: %s', bootimg_dir)
 
         if 'file' not in source_params:
-            msger.error("No file specified\n")
-            return
+            logger.error("No file specified\n")
+            sys.exit(1)
 
         src = os.path.join(bootimg_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 9d959fa..cfc90f6 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -25,12 +25,15 @@
 # Joao Henrique Ferreira de Freitas <joaohf (at] gmail.com>
 #
 
+import logging
 import os
+import sys
 
-from wic import msger
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
+logger = logging.getLogger('wic')
+
 class RootfsPlugin(SourcePlugin):
     """
     Populate partition content from a rootfs directory.
@@ -45,10 +48,10 @@ class RootfsPlugin(SourcePlugin):
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
-            msg = "No valid artifact IMAGE_ROOTFS from image named"
-            msg += " %s has been found at %s, exiting.\n" % \
-                (rootfs_dir, image_rootfs_dir)
-            msger.error(msg)
+            logger.error("No valid artifact IMAGE_ROOTFS from image named %s "
+                         "has been found at %s, exiting.\n",
+                         rootfs_dir, image_rootfs_dir)
+            sys.exit(1)
 
         return image_rootfs_dir
 
@@ -63,8 +66,9 @@ class RootfsPlugin(SourcePlugin):
         """
         if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in krootfs_dir:
-                msg = "Couldn't find --rootfs-dir, exiting"
-                msger.error(msg)
+                logger.error("Couldn't find --rootfs-dir, exiting")
+                sys.exit(1)
+
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
             if part.rootfs_dir in krootfs_dir:
@@ -72,9 +76,9 @@ class RootfsPlugin(SourcePlugin):
             elif part.rootfs_dir:
                 rootfs_dir = part.rootfs_dir
             else:
-                msg = "Couldn't find --rootfs-dir=%s connection"
-                msg += " or it is not a valid path, exiting"
-                msger.error(msg % part.rootfs_dir)
+                logger.error("Couldn't find --rootfs-dir=%s connection or "
+                             "it is not a valid path, exiting", part.rootfs_dir)
+                sys.exit(1)
 
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 9e79a13..ed5fbdf 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -18,15 +18,18 @@
 # Adrian Freihofer <adrian.freihofer (at] neratec.com>
 #
 
+import logging
 import os
 import re
+import sys
 
-from wic import msger
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 
+logger = logging.getLogger('wic')
+
 def serial_console_form_kargs(kernel_args):
     """
     Create SERIAL... line from kernel parameters
@@ -48,16 +51,16 @@ def serial_console_form_kargs(kernel_args):
                 syslinux_conf += " " + param_match.group(2)
             # parity
             if param_match.group(3) and param_match.group(3) != 'n':
-                msger.warning("syslinux does not support parity for console. {} is ignored."
-                              .format(param_match.group(3)))
+                logger.warning("syslinux does not support parity for console. "
+                               "%s is ignored.", param_match.group(3))
             # number of bits
             if param_match.group(4) and param_match.group(4) != '8':
-                msger.warning("syslinux supports 8 bit console configuration only. {} is ignored."
-                              .format(param_match.group(4)))
+                logger.warning("syslinux supports 8 bit console configuration "
+                               "only. %s is ignored.", param_match.group(4))
             # flow control
             if param_match.group(5) and param_match.group(5) != '':
-                msger.warning("syslinux console flowcontrol configuration. {} is ignored."
-                              .format(param_match.group(5)))
+                logger.warning("syslinux console flowcontrol configuration. "
+                               "%s is ignored.", param_match.group(5))
             break
 
     return syslinux_conf
@@ -96,10 +99,10 @@ class RootfsPlugin(SourcePlugin):
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
-            msg = "No valid artifact IMAGE_ROOTFS from image named"
-            msg += " %s has been found at %s, exiting.\n" % \
-                (rootfs_dir, image_rootfs_dir)
-            msger.error(msg)
+            logger.error("No valid artifact IMAGE_ROOTFS from image named %s "
+                         "has been found at %s, exiting.\n",
+                         rootfs_dir, image_rootfs_dir)
+            sys.exit(1)
 
         return image_rootfs_dir
 
@@ -132,7 +135,7 @@ class RootfsPlugin(SourcePlugin):
                              (image_creator.rootdev, bootloader.append)
 
         syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
-        msger.debug("Writing syslinux config %s" % syslinux_cfg)
+        logger.debug("Writing syslinux config %s", syslinux_cfg)
         with open(syslinux_cfg, "w") as cfg:
             cfg.write(syslinux_conf)
 
@@ -154,15 +157,17 @@ class RootfsPlugin(SourcePlugin):
         # Make sure syslinux-nomtools is available in native sysroot or fail
         native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
         if not is_exe(native_syslinux_nomtools):
-            msger.info("building syslinux-native...")
+            logger.info("building syslinux-native...")
             exec_cmd("bitbake syslinux-native")
         if not is_exe(native_syslinux_nomtools):
-            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" %
-                        native_syslinux_nomtools)
+            logger.error("Couldn't find syslinux-nomtools (%s), exiting\n",
+                         native_syslinux_nomtools)
+            sys.exit(1)
 
         if part.rootfs is None:
             if 'ROOTFS_DIR' not in krootfs_dir:
-                msger.error("Couldn't find --rootfs-dir, exiting")
+                logger.error("Couldn't find --rootfs-dir, exiting")
+                sys.exit(1)
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
             if part.rootfs in krootfs_dir:
@@ -170,9 +175,9 @@ class RootfsPlugin(SourcePlugin):
             elif part.rootfs:
                 rootfs_dir = part.rootfs
             else:
-                msg = "Couldn't find --rootfs-dir=%s connection"
-                msg += " or it is not a valid path, exiting"
-                msger.error(msg % part.rootfs)
+                logger.error("Couldn't find --rootfs-dir=%s connection or "
+                             "it is not a valid path, exiting", part.rootfs)
+                sys.exit(1)
 
         real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
 
@@ -198,15 +203,18 @@ class RootfsPlugin(SourcePlugin):
         elif image_creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            msger.error("Unsupported partition table: %s" % \
-                        image_creator.ptable_format)
+            logger.error("Unsupported partition table: %s",
+                         image_creator.ptable_format)
+            sys.exit(1)
 
         if not os.path.exists(mbrfile):
-            msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
+            logger.error("Couldn't find %s. Has syslinux-native been baked?",
+                         mbrfile)
+            sys.exit(1)
 
         full_path = disk.path
-        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
-                    % (disk_name, full_path, disk.min_size))
+        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
+                     disk_name, full_path, disk.min_size)
 
         ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
         if ret_code != 0:
-- 
2.1.4


