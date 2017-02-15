Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3993F772D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:02:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Feb 2017 01:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="1094972738"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 15 Feb 2017 01:02:02 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BE73B6A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 01:00:59 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 10:38:32 +0200
Message-Id: <3d4bb85259bcb22164011c5387f15e783f75e66a.1487110279.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1487110279.git.ed.bartosh@linux.intel.com>
References: <cover.1487110279.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 09/11] wic: raise WicError in wic plugins
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
X-List-Received-Date: Wed, 15 Feb 2017 09:02:05 -0000

Replaced sys.exit with raising WicError in wic plugins.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py           |  6 +--
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 32 +++++------
 .../lib/wic/plugins/source/bootimg-partition.py    | 11 ++--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   | 20 +++----
 scripts/lib/wic/plugins/source/fsimage.py          |  8 ++-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 63 ++++++++--------------
 scripts/lib/wic/plugins/source/rawcopy.py          |  8 ++-
 scripts/lib/wic/plugins/source/rootfs.py           | 17 +++---
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 34 +++++-------
 9 files changed, 75 insertions(+), 124 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index e51c8be..9c8a230 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -27,13 +27,12 @@
 import logging
 import os
 import shutil
-import sys
 import tempfile
 import uuid
 
 from time import strftime
 
-from wic.errors import ImageError
+from wic.errors import ImageError, WicError
 from wic.filemap import sparse_copy
 from wic.ksparser import KickStart, KickStartError
 from wic.plugin import pluginmgr
@@ -58,8 +57,7 @@ class DirectPlugin(ImagerPlugin):
         try:
             self.ks = KickStart(wks_file)
         except KickStartError as err:
-            logger.error(str(err))
-            sys.exit(1)
+            raise WicError(str(err))
 
         # parse possible 'rootfs=name' items
         self.rootfs_dir = dict(rdir.split('=') for rdir in rootfs_dir.split(' '))
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index e4c8451..1f018fa 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -27,8 +27,8 @@
 import logging
 import os
 import shutil
-import sys
 
+from wic.errors import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd, get_bitbake_var,
@@ -59,9 +59,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 logger.debug("Using custom configuration file "
                              "%s for grub.cfg", configfile)
             else:
-                logger.error("configfile is specified but failed to "
-                             "get it from %s.", configfile)
-                sys.exit(1)
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s." % configfile)
 
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
@@ -108,8 +107,7 @@ class BootimgEFIPlugin(SourcePlugin):
             # obviously we need to have a common common deploy var
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
             cp_cmd = "cp %s/%s %s" % (bootimg_dir, initrd, hdddir)
             exec_cmd(cp_cmd, True)
@@ -132,9 +130,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 logger.debug("Using custom configuration file "
                              "%s for systemd-boots's boot.conf", configfile)
             else:
-                logger.error("configfile is specified but failed to "
-                             "get it from %s.", configfile)
-                sys.exit(1)
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s.", configfile)
 
         if not custom_cfg:
             # Create systemd-boot configuration using parameters from wks file
@@ -174,11 +171,9 @@ class BootimgEFIPlugin(SourcePlugin):
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
             else:
-                logger.error("unrecognized bootimg-efi loader: %s", source_params['loader'])
-                sys.exit(1)
+                raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
-            logger.error("bootimg-efi requires a loader, none specified")
-            sys.exit(1)
+            raise WicError("bootimg-efi requires a loader, none specified")
 
 
     @classmethod
@@ -193,8 +188,7 @@ class BootimgEFIPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
             # just so the result notes display it
             creator.bootimg_dir = bootimg_dir
 
@@ -221,12 +215,10 @@ class BootimgEFIPlugin(SourcePlugin):
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (bootimg_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
             else:
-                logger.error("unrecognized bootimg-efi loader: %s",
-                             source_params['loader'])
-                sys.exit(1)
+                raise WicError("unrecognized bootimg-efi loader: %s" %
+                               source_params['loader'])
         except KeyError:
-            logger.error("bootimg-efi requires a loader, none specified")
-            sys.exit(1)
+            raise WicError("bootimg-efi requires a loader, none specified")
 
         startup = os.path.join(bootimg_dir, "startup.nsh")
         if os.path.exists(startup):
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index b486915..e9724a6 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -26,10 +26,10 @@
 import logging
 import os
 import re
-import sys
 
 from glob import glob
 
+from wic.errors import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 
@@ -81,16 +81,14 @@ class BootimgPartitionPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         logger.debug('Bootimg dir: %s', bootimg_dir)
 
         boot_files = get_bitbake_var("IMAGE_BOOT_FILES")
 
         if not boot_files:
-            logger.error('No boot files defined, IMAGE_BOOT_FILES unset')
-            sys.exit(1)
+            raise WicError('No boot files defined, IMAGE_BOOT_FILES unset')
 
         logger.debug('Boot files: %s', boot_files)
 
@@ -100,8 +98,7 @@ class BootimgPartitionPlugin(SourcePlugin):
             if ';' in src_entry:
                 dst_entry = tuple(src_entry.split(';'))
                 if not dst_entry[0] or not dst_entry[1]:
-                    logger.error('Malformed boot file entry: %s', src_entry)
-                    sys.exit(1)
+                    raise WicError('Malformed boot file entry: %s' % src_entry)
             else:
                 dst_entry = (src_entry, src_entry)
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
index 8f53fa2..2ded2da 100644
--- a/scripts/lib/wic/plugins/source/bootimg-pcbios.py
+++ b/scripts/lib/wic/plugins/source/bootimg-pcbios.py
@@ -26,10 +26,9 @@
 
 import logging
 import os
-import sys
 
 from wic.engine import get_custom_config
-from wic.errors import ImageError
+from wic.errors import ImageError, WicError
 from wic.utils import runner
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import (exec_cmd, exec_native_cmd,
@@ -57,14 +56,13 @@ class BootimgPcbiosPlugin(SourcePlugin):
         elif creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            logger.error("Unsupported partition table: %s", creator.ptable_format)
-            sys.exit(1)
+            raise WicError("Unsupported partition table: %s" %
+                           creator.ptable_format)
 
         if not os.path.exists(mbrfile):
-            logger.error("Couldn't find %s.  If using the -e option, do you "
-                         "have the right MACHINE set in local.conf?  If not, "
-                         "is the bootimg_dir path correct?", mbrfile)
-            sys.exit(1)
+            raise WicError("Couldn't find %s.  If using the -e option, do you "
+                           "have the right MACHINE set in local.conf?  If not, "
+                           "is the bootimg_dir path correct?" % mbrfile)
 
         full_path = creator._full_path(workdir, disk_name, "direct")
         logger.debug("Installing MBR on disk %s as %s with size %s bytes",
@@ -152,11 +150,9 @@ class BootimgPcbiosPlugin(SourcePlugin):
         if not _has_syslinux(bootimg_dir):
             bootimg_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
             if not bootimg_dir:
-                logger.error("Couldn't find STAGING_DATADIR, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find STAGING_DATADIR, exiting")
             if not _has_syslinux(bootimg_dir):
-                logger.error("Please build syslinux first\n")
-                sys.exit(1)
+                raise WicError("Please build syslinux first")
             # just so the result notes display it
             creator.bootimg_dir = bootimg_dir
 
diff --git a/scripts/lib/wic/plugins/source/fsimage.py b/scripts/lib/wic/plugins/source/fsimage.py
index 35fb78b..67fc6d1 100644
--- a/scripts/lib/wic/plugins/source/fsimage.py
+++ b/scripts/lib/wic/plugins/source/fsimage.py
@@ -17,8 +17,8 @@
 
 import logging
 import os
-import sys
 
+from wic.errors import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
@@ -61,14 +61,12 @@ class FSImagePlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         logger.debug('Bootimg dir: %s', bootimg_dir)
 
         if 'file' not in source_params:
-            logger.error("No file specified\n")
-            sys.exit(1)
+            raise WicError("No file specified")
 
         src = os.path.join(bootimg_dir, source_params['file'])
 
diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 33de6d8..df86acc 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -25,8 +25,8 @@ import logging
 import os
 import re
 import shutil
-import sys
 
+from wic.errors import WicError
 from wic.engine import get_custom_config
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, exec_native_cmd, get_bitbake_var
@@ -106,9 +106,8 @@ class IsoImagePlugin(SourcePlugin):
                 logger.debug("Using custom configuration file %s for grub.cfg",
                              configfile)
             else:
-                logger.error("configfile is specified "
-                             "but failed to get it from %s", configfile)
-                sys.exit(1)
+                raise WicError("configfile is specified "
+                               "but failed to get it from %s", configfile)
         else:
             splash = os.path.join(cr_workdir, "EFI/boot/splash.jpg")
             if os.path.exists(splash):
@@ -153,23 +152,19 @@ class IsoImagePlugin(SourcePlugin):
         if not initrd:
             initrd_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not initrd_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting.")
 
             image_name = get_bitbake_var("IMAGE_BASENAME")
             if not image_name:
-                logger.error("Couldn't find IMAGE_BASENAME, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find IMAGE_BASENAME, exiting.")
 
             image_type = get_bitbake_var("INITRAMFS_FSTYPES")
             if not image_type:
-                logger.error("Couldn't find INITRAMFS_FSTYPES, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find INITRAMFS_FSTYPES, exiting.")
 
             target_arch = get_bitbake_var("TRANSLATED_TARGET_ARCH")
             if not target_arch:
-                logger.error("Couldn't find TRANSLATED_TARGET_ARCH, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find TRANSLATED_TARGET_ARCH, exiting.")
 
             initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, target_arch, image_type))[0]
 
@@ -192,8 +187,7 @@ class IsoImagePlugin(SourcePlugin):
                 os.symlink(os.readlink("%s/sbin/init" % rootfs_dir), \
                             "%s/init" % initrd_dir)
             else:
-                logger.error("Couldn't find or build initrd, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find or build initrd, exiting.")
 
             exec_cmd("cd %s && find . | cpio -o -H newc -R +0:+0 >./initrd.cpio " \
                     % initrd_dir, as_shell=True)
@@ -239,8 +233,7 @@ class IsoImagePlugin(SourcePlugin):
 
         if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in rootfs_dir:
-                logger.error("Couldn't find --rootfs-dir, exiting.\n")
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir, exiting.")
             rootfs_dir = rootfs_dir['ROOTFS_DIR']
         else:
             if part.rootfs_dir in rootfs_dir:
@@ -248,16 +241,14 @@ class IsoImagePlugin(SourcePlugin):
             elif part.rootfs_dir:
                 rootfs_dir = part.rootfs_dir
             else:
-                logger.error("Couldn't find --rootfs-dir=%s connection "
-                             "or it is not a valid path, exiting.\n",
-                             part.rootfs_dir)
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir=%s connection "
+                               "or it is not a valid path, exiting." %
+                               part.rootfs_dir)
 
         if not os.path.isdir(rootfs_dir):
             rootfs_dir = get_bitbake_var("IMAGE_ROOTFS")
         if not os.path.isdir(rootfs_dir):
-            logger.error("Couldn't find IMAGE_ROOTFS, exiting.\n")
-            sys.exit(1)
+            raise WicError("Couldn't find IMAGE_ROOTFS, exiting.")
 
         part.rootfs_dir = rootfs_dir
 
@@ -296,8 +287,7 @@ class IsoImagePlugin(SourcePlugin):
         if source_params.get('initrd'):
             initrd = source_params['initrd']
             if not deploy_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
             cp_cmd = "cp %s/%s %s" % (deploy_dir, initrd, cr_workdir)
             exec_cmd(cp_cmd)
         else:
@@ -340,8 +330,7 @@ class IsoImagePlugin(SourcePlugin):
                 # didn't contains it
                 target_arch = get_bitbake_var("TARGET_SYS")
                 if not target_arch:
-                    logger.error("Coludn't find target architecture\n")
-                    sys.exit(1)
+                    raise WicError("Coludn't find target architecture")
 
                 if re.match("x86_64", target_arch):
                     grub_target = 'x86_64-efi'
@@ -350,21 +339,18 @@ class IsoImagePlugin(SourcePlugin):
                     grub_target = 'i386-efi'
                     grub_image = "bootia32.efi"
                 else:
-                    logger.error("grub-efi is incompatible with target %s\n",
-                                 target_arch)
-                    sys.exit(1)
+                    raise WicError("grub-efi is incompatible with target %s" %
+                                   target_arch)
 
                 if not os.path.isfile("%s/EFI/BOOT/%s" \
                                 % (bootimg_dir, grub_image)):
                     grub_path = get_bitbake_var("STAGING_LIBDIR", "wic-tools")
                     if not grub_path:
-                        logger.error("Couldn't find STAGING_LIBDIR, exiting.\n")
-                        sys.exit(1)
+                        raise WicError("Couldn't find STAGING_LIBDIR, exiting.")
 
                     grub_core = "%s/grub/%s" % (grub_path, grub_target)
                     if not os.path.exists(grub_core):
-                        logger.error("Please build grub-efi first\n")
-                        sys.exit(1)
+                        raise WicError("Please build grub-efi first")
 
                     grub_cmd = "grub-mkimage -p '/EFI/BOOT' "
                     grub_cmd += "-d %s "  % grub_core
@@ -380,12 +366,10 @@ class IsoImagePlugin(SourcePlugin):
                     exec_native_cmd(grub_cmd, native_sysroot)
 
             else:
-                logger.error("unrecognized bootimg-efi loader: %s",
-                             source_params['loader'])
-                sys.exit(1)
+                raise WicError("unrecognized bootimg-efi loader: %s" %
+                               source_params['loader'])
         except KeyError:
-            logger.error("bootimg-efi requires a loader, none specified")
-            sys.exit(1)
+            raise WicError("bootimg-efi requires a loader, none specified")
 
         if os.path.exists("%s/EFI/BOOT" % isodir):
             shutil.rmtree("%s/EFI/BOOT" % isodir)
@@ -431,8 +415,7 @@ class IsoImagePlugin(SourcePlugin):
         # Prepare files for legacy boot
         syslinux_dir = get_bitbake_var("STAGING_DATADIR", "wic-tools")
         if not syslinux_dir:
-            logger.error("Couldn't find STAGING_DATADIR, exiting.\n")
-            sys.exit(1)
+            raise WicError("Couldn't find STAGING_DATADIR, exiting.")
 
         if os.path.exists("%s/isolinux" % isodir):
             shutil.rmtree("%s/isolinux" % isodir)
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index c5c3be3..5612809 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -17,8 +17,8 @@
 
 import logging
 import os
-import sys
 
+from wic.errors import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import exec_cmd, get_bitbake_var
 from wic.filemap import sparse_copy
@@ -62,14 +62,12 @@ class RawCopyPlugin(SourcePlugin):
         if not bootimg_dir:
             bootimg_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
-                logger.error("Couldn't find DEPLOY_DIR_IMAGE, exiting\n")
-                sys.exit(1)
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
 
         logger.debug('Bootimg dir: %s', bootimg_dir)
 
         if 'file' not in source_params:
-            logger.error("No file specified\n")
-            sys.exit(1)
+            raise WicError("No file specified")
 
         src = os.path.join(bootimg_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index cfc90f6..e58469a 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -27,8 +27,8 @@
 
 import logging
 import os
-import sys
 
+from wic.errors import WicError
 from wic.pluginbase import SourcePlugin
 from wic.utils.misc import get_bitbake_var
 
@@ -48,10 +48,9 @@ class RootfsPlugin(SourcePlugin):
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
-            logger.error("No valid artifact IMAGE_ROOTFS from image named %s "
-                         "has been found at %s, exiting.\n",
-                         rootfs_dir, image_rootfs_dir)
-            sys.exit(1)
+            raise WicError("No valid artifact IMAGE_ROOTFS from image "
+                           "named %s has been found at %s, exiting." %
+                           (rootfs_dir, image_rootfs_dir))
 
         return image_rootfs_dir
 
@@ -66,8 +65,7 @@ class RootfsPlugin(SourcePlugin):
         """
         if part.rootfs_dir is None:
             if not 'ROOTFS_DIR' in krootfs_dir:
-                logger.error("Couldn't find --rootfs-dir, exiting")
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir, exiting")
 
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
@@ -76,9 +74,8 @@ class RootfsPlugin(SourcePlugin):
             elif part.rootfs_dir:
                 rootfs_dir = part.rootfs_dir
             else:
-                logger.error("Couldn't find --rootfs-dir=%s connection or "
-                             "it is not a valid path, exiting", part.rootfs_dir)
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir=%s connection or "
+                               "it is not a valid path, exiting" % part.rootfs_dir)
 
         real_rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
 
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 850aa5a..4cc3a39 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -21,9 +21,8 @@
 import logging
 import os
 import re
-import sys
 
-from wic.errors import ImageError
+from wic.errors import ImageError, WicError
 from wic.utils import runner
 from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.pluginbase import SourcePlugin
@@ -99,10 +98,9 @@ class RootfsPlugin(SourcePlugin):
 
         image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
         if not os.path.isdir(image_rootfs_dir):
-            logger.error("No valid artifact IMAGE_ROOTFS from image named %s "
-                         "has been found at %s, exiting.\n",
-                         rootfs_dir, image_rootfs_dir)
-            sys.exit(1)
+            raise WicError("No valid artifact IMAGE_ROOTFS from image named %s "
+                           "has been found at %s, exiting." %
+                           (rootfs_dir, image_rootfs_dir))
 
         return image_rootfs_dir
 
@@ -160,14 +158,12 @@ class RootfsPlugin(SourcePlugin):
             logger.info("building syslinux-native...")
             exec_cmd("bitbake syslinux-native")
         if not is_exe(native_syslinux_nomtools):
-            logger.error("Couldn't find syslinux-nomtools (%s), exiting\n",
-                         native_syslinux_nomtools)
-            sys.exit(1)
+            raise WicError("Couldn't find syslinux-nomtools (%s), exiting" %
+                           native_syslinux_nomtools)
 
         if part.rootfs is None:
             if 'ROOTFS_DIR' not in krootfs_dir:
-                logger.error("Couldn't find --rootfs-dir, exiting")
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir, exiting")
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
             if part.rootfs in krootfs_dir:
@@ -175,9 +171,8 @@ class RootfsPlugin(SourcePlugin):
             elif part.rootfs:
                 rootfs_dir = part.rootfs
             else:
-                logger.error("Couldn't find --rootfs-dir=%s connection or "
-                             "it is not a valid path, exiting", part.rootfs)
-                sys.exit(1)
+                raise WicError("Couldn't find --rootfs-dir=%s connection or "
+                               "it is not a valid path, exiting" % part.rootfs)
 
         real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
 
@@ -203,15 +198,12 @@ class RootfsPlugin(SourcePlugin):
         elif image_creator.ptable_format == 'gpt':
             mbrfile += "gptmbr.bin"
         else:
-            logger.error("Unsupported partition table: %s",
-                         image_creator.ptable_format)
-            sys.exit(1)
+            raise WicError("Unsupported partition table: %s" %
+                           image_creator.ptable_format)
 
         if not os.path.exists(mbrfile):
-            logger.error("Couldn't find %s. Has syslinux-native been baked?",
-                         mbrfile)
-            sys.exit(1)
-
+            raise WicError("Couldn't find %s. Has syslinux-native been baked?",
+                           mbrfile)
         full_path = disk.path
         logger.debug("Installing MBR on disk %s as %s with size %s bytes",
                      disk_name, full_path, disk.min_size)
-- 
2.1.4


