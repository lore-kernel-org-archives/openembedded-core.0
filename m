Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3300D77B4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190216; x=1521726216;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GMcU7QbyFv4Xb+R6OyVXIh4HdNSzSd4vM330+I22064=;
	b=Etjz8ScIulxEOiRrfp4lRT2gk/yh0xCje3FkTVHIlCZ7Yf+hIdH2026I
	svUHFGD8Hkkkl009pKN1skUmmp8cxQ==;
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:43:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="837403440"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2017 06:43:35 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 31F6D2C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:43:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:25 +0200
Message-Id: <30be1f83c647201ee80b2fbf530b666e8454a382.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 01/10] wic: remove rootfs_pcbios_ext plugin
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
X-List-Received-Date: Wed, 22 Mar 2017 13:43:34 -0000

Removed broken unused plugin.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 213 ---------------------
 1 file changed, 213 deletions(-)
 delete mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py

diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
deleted file mode 100644
index 94f80d0..0000000
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ /dev/null
@@ -1,213 +0,0 @@
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-#
-# This program is free software; you can distribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for mo details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# AUTHOR
-# Adrian Freihofer <adrian.freihofer (at] neratec.com>
-#
-
-import logging
-import os
-import re
-
-from wic import WicError
-from wic.utils import runner
-from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
-from wic.pluginbase import SourcePlugin
-
-logger = logging.getLogger('wic')
-
-def serial_console_form_kargs(kernel_args):
-    """
-    Create SERIAL... line from kernel parameters
-
-    syslinux needs a line SERIAL port [baudrate [flowcontrol]]
-    in the syslinux.cfg file. The config line is generated based
-    on kernel boot parameters. The the parameters of the first
-    ttyS console are considered for syslinux config.
-    @param kernel_args kernel command line
-    @return line for syslinux config file e.g. "SERIAL 0 115200"
-    """
-    syslinux_conf = ""
-    for param in kernel_args.split():
-        param_match = re.match("console=ttyS([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
-        if param_match:
-            syslinux_conf += "SERIAL " + param_match.group(1)
-            # baudrate
-            if param_match.group(2):
-                syslinux_conf += " " + param_match.group(2)
-            # parity
-            if param_match.group(3) and param_match.group(3) != 'n':
-                logger.warning("syslinux does not support parity for console. "
-                               "%s is ignored.", param_match.group(3))
-            # number of bits
-            if param_match.group(4) and param_match.group(4) != '8':
-                logger.warning("syslinux supports 8 bit console configuration "
-                               "only. %s is ignored.", param_match.group(4))
-            # flow control
-            if param_match.group(5) and param_match.group(5) != '':
-                logger.warning("syslinux console flowcontrol configuration. "
-                               "%s is ignored.", param_match.group(5))
-            break
-
-    return syslinux_conf
-
-
-# pylint: disable=no-init
-class RootfsPlugin(SourcePlugin):
-    """
-    Create root partition and install syslinux bootloader
-
-    This plugin creates a disk image containing a bootable root partition with
-    syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
-    required.
-
-    Example kickstart file:
-    part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
-    bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
-
-    The first line generates a root file system including a syslinux.cfg file
-    The "--source rootfs-pcbios-ext" in the second line triggers the installation
-    of ldlinux.sys into the image.
-    """
-
-    name = 'rootfs-pcbios-ext'
-
-    @staticmethod
-    def _get_rootfs_dir(rootfs_dir):
-        """
-        Find rootfs pseudo dir
-
-        If rootfs_dir is a directory consider it as rootfs directory.
-        Otherwise ask bitbake about the IMAGE_ROOTFS directory.
-        """
-        if os.path.isdir(rootfs_dir):
-            return rootfs_dir
-
-        image_rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", rootfs_dir)
-        if not os.path.isdir(image_rootfs_dir):
-            raise WicError("No valid artifact IMAGE_ROOTFS from image named %s "
-                           "has been found at %s, exiting." %
-                           (rootfs_dir, image_rootfs_dir))
-
-        return image_rootfs_dir
-
-    # pylint: disable=unused-argument
-    @classmethod
-    def do_configure_partition(cls, part, source_params, image_creator,
-                               image_creator_workdir, oe_builddir, bootimg_dir,
-                               kernel_dir, native_sysroot):
-        """
-        Creates syslinux config in rootfs directory
-
-        Called before do_prepare_partition()
-        """
-        bootloader = image_creator.ks.bootloader
-
-        syslinux_conf = ""
-        syslinux_conf += "PROMPT 0\n"
-
-        syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
-        syslinux_conf += "ALLOWOPTIONS 1\n"
-
-        # Derive SERIAL... line from from kernel boot parameters
-        syslinux_conf += serial_console_form_kargs(options) + "\n"
-
-        syslinux_conf += "DEFAULT linux\n"
-        syslinux_conf += "LABEL linux\n"
-        syslinux_conf += "  KERNEL /boot/bzImage\n"
-
-        syslinux_conf += "  APPEND label=boot root=%s %s\n" % \
-                             (image_creator.rootdev, bootloader.append)
-
-        syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
-        logger.debug("Writing syslinux config %s", syslinux_cfg)
-        with open(syslinux_cfg, "w") as cfg:
-            cfg.write(syslinux_conf)
-
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, image_creator,
-                             image_creator_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, krootfs_dir, native_sysroot):
-        """
-        Creates partition out of rootfs directory
-
-        Prepare content for a rootfs partition i.e. create a partition
-        and fill it from a /rootfs dir.
-        Install syslinux bootloader into root partition image file
-        """
-        def is_exe(exepath):
-            """Verify exepath is an executable file"""
-            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
-
-        # Make sure syslinux-nomtools is available in native sysroot or fail
-        native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
-        if not is_exe(native_syslinux_nomtools):
-            logger.info("building syslinux-native...")
-            exec_cmd("bitbake syslinux-native")
-        if not is_exe(native_syslinux_nomtools):
-            raise WicError("Couldn't find syslinux-nomtools (%s), exiting" %
-                           native_syslinux_nomtools)
-
-        if part.rootfs is None:
-            if 'ROOTFS_DIR' not in krootfs_dir:
-                raise WicError("Couldn't find --rootfs-dir, exiting")
-            rootfs_dir = krootfs_dir['ROOTFS_DIR']
-        else:
-            if part.rootfs in krootfs_dir:
-                rootfs_dir = krootfs_dir[part.rootfs]
-            elif part.rootfs:
-                rootfs_dir = part.rootfs
-            else:
-                raise WicError("Couldn't find --rootfs-dir=%s connection or "
-                               "it is not a valid path, exiting" % part.rootfs)
-
-        real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
-
-        part.rootfs_dir = real_rootfs_dir
-        part.prepare_rootfs(image_creator_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
-
-        # install syslinux into rootfs partition
-        syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
-        exec_native_cmd(syslinux_cmd, native_sysroot)
-
-    @classmethod
-    def do_install_disk(cls, disk, disk_name, image_creator, workdir, oe_builddir,
-                        bootimg_dir, kernel_dir, native_sysroot):
-        """
-        Assemble partitions to disk image
-
-        Called after all partitions have been prepared and assembled into a
-        disk image. In this case, we install the MBR.
-        """
-        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/")
-        if image_creator.ptable_format == 'msdos':
-            mbrfile += "mbr.bin"
-        elif image_creator.ptable_format == 'gpt':
-            mbrfile += "gptmbr.bin"
-        else:
-            raise WicError("Unsupported partition table: %s" %
-                           image_creator.ptable_format)
-
-        if not os.path.exists(mbrfile):
-            raise WicError("Couldn't find %s. Has syslinux-native been baked?",
-                           mbrfile)
-        full_path = disk.path
-        logger.debug("Installing MBR on disk %s as %s with size %s bytes",
-                     disk_name, full_path, disk.min_size)
-
-        ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
-        if ret_code != 0:
-            raise WicError("Unable to set MBR to %s" % full_path)
-- 
2.1.4


