Return-Path: <chee.yang.lee@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C546D7D68F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 07:11:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2019 00:11:54 -0700
X-ExtLoop1: 1
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 00:11:53 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 14:40:59 +0800
Message-Id: <1557297662-16300-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
References: <1557297662-16300-1-git-send-email-chee.yang.lee@intel.com>
Subject: [PATCH 1/4] wic: add new installer-partition plugin
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
X-List-Received-Date: Wed, 08 May 2019 07:11:52 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

This patch implement 'installer-partition.py' source plugin for wic.
The plugin create an image with systemd-boot and rootfs.
The generated image can be use to create wic based image installer.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../lib/wic/plugins/source/installer-partition.py  | 192 +++++++++++++++++++++
 1 file changed, 192 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/installer-partition.py

diff --git a/scripts/lib/wic/plugins/source/installer-partition.py b/scripts/lib/wic/plugins/source/installer-partition.py
new file mode 100644
index 0000000..4d8343f
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/installer-partition.py
@@ -0,0 +1,192 @@
+# Copyright (c) 2019, Intel Corporation.
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
+# This implements the 'installer-partition' source plugin class for 'wic'
+# This plugin prepare partition with content to be install on target machine.
+#
+# AUTHORS
+# Lee Chee Yang <Chee.Yang.Lee (at] intel.com>
+#
+
+import logging
+import os
+
+from wic import WicError
+from wic.engine import get_custom_config
+from wic.pluginbase import SourcePlugin
+from wic.misc import (exec_cmd, exec_native_cmd, get_bitbake_var)
+
+logger = logging.getLogger('wic')
+
+class InstallerImagePlugin(SourcePlugin):
+    """
+    Populate content for wic image based installer
+    """
+
+    name = 'installer-partition'
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates loader-specific config
+        """
+        if not kernel_dir:
+            kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE")
+            if not kernel_dir:
+                raise WicError("Couldn't find DEPLOY_DIR_IMAGE, exiting")
+        staging_kernel_dir = kernel_dir
+
+        partition_dir = "%s/%s-%s" % (cr_workdir, part.label, part.lineno)
+
+        install_cmd = "install -d %s/EFI/BOOT" % partition_dir
+        exec_cmd(install_cmd)
+
+        install_cmd = "install -d %s/loader/entries" % partition_dir
+        exec_cmd(install_cmd)
+
+        bootloader = creator.ks.bootloader
+
+        loader_conf = ""
+        loader_conf += "default boot\n"
+        loader_conf += "timeout %d\n" % bootloader.timeout
+
+        initrd = source_params.get('initrd')
+
+        if initrd:
+            cp_cmd = "cp %s/%s %s" % (kernel_dir, initrd, partition_dir)
+            exec_cmd(cp_cmd, True)
+        else:
+            logger.debug("Ignoring missing initrd")
+
+        logger.debug("Writing systemd-boot config "
+                     "%s/loader/loader.conf", partition_dir)
+        cfg = open("%s/loader/loader.conf" % partition_dir, "w")
+        cfg.write(loader_conf)
+        cfg.close()
+
+        kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+        if not kernel:
+            kernel = "bzImage"
+
+        install_cmd = "install -m 0644 %s/%s %s/%s" % \
+            (staging_kernel_dir, kernel, partition_dir, kernel)
+        exec_cmd(install_cmd)
+
+        configfile = creator.ks.bootloader.configfile
+        custom_cfg = None
+        if configfile:
+            custom_cfg = get_custom_config(configfile)
+            if custom_cfg:
+                # Use a custom configuration for systemd-boot
+                boot_conf = custom_cfg
+                logger.debug("Using custom configuration file "
+                             "%s for systemd-boots's boot.conf", configfile)
+            else:
+                raise WicError("configfile is specified but failed to "
+                               "get it from %s.", configfile)
+
+        if not custom_cfg:
+            # Create systemd-boot configuration using parameters from wks file
+            title = source_params.get('title')
+
+            boot_conf = ""
+            boot_conf += "title %s\n" % (title if title else "boot")
+            boot_conf += "linux /%s\n" % kernel
+            boot_conf += "options LABEL=Boot %s\n" % (bootloader.append)
+
+            if initrd:
+                boot_conf += "initrd /%s\n" % initrd
+
+        for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
+            cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, partition_dir, mod[8:])
+            exec_cmd(cp_cmd, True)
+
+        logger.debug("Writing systemd-boot config "
+                     "%s/loader/entries/boot.conf", partition_dir)
+        cfg = open("%s//loader/entries/boot.conf" % partition_dir, "w")
+        cfg.write(boot_conf)
+        cfg.close()
+
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition,
+        prepare systemd bootloader and rootfs image
+        """
+        partition_dir = "%s/%s-%s" % (cr_workdir, part.label, part.lineno)
+
+        rootfs = "%s/fs_%s.%s.%s" % (cr_workdir, part.label, part.lineno, part.fstype)
+
+        image_deploy_dir = get_bitbake_var("IMGDEPLOYDIR")
+        if not image_deploy_dir:
+            raise WicError("Couldn't find IMGDEPLOYDIR, exiting")
+
+        rootfs_img = "%s/%s.%s" % (image_deploy_dir,
+            get_bitbake_var("IMAGE_LINK_NAME"), part.fstype )
+        if not os.path.isfile(rootfs_img):
+            raise WicError("Couldn't find %s, exiting" % rootfs_img)
+
+        install_cmd = "install -m 0644 %s %s/rootfs.img" % \
+            (rootfs_img, partition_dir)
+        exec_cmd(install_cmd)
+
+        #look for actual size required for the partition
+        du_cmd = "du -ks %s" % partition_dir
+        out = exec_cmd(du_cmd)
+        part.size = cls.get_partition_size(part, int(out.split()[0]))
+        logger.debug("Set partition size to %d ", part.size)
+
+        with open(rootfs, 'w') as sparse:
+            os.ftruncate(sparse.fileno(), part.size * 1024)
+
+        extraopts = part.mkfs_extraopts or "-i 8192"
+
+        label_str = ""
+        if part.label:
+            label_str = "-L %s" % part.label
+
+        mkfs_cmd = "mkfs.%s -F %s %s -U %s %s -d %s" % \
+            (part.fstype, extraopts, label_str, part.fsuuid, rootfs, partition_dir)
+        exec_native_cmd(mkfs_cmd, native_sysroot)
+
+        part.source_file = rootfs
+
+
+    def get_partition_size(part, actual_partition_size=0):
+        """
+        Calculate the required size of the partition, taking into consideration
+        --size/--fixed-size/--extra-space flags specified in kickstart file.
+        Raises an error if the `actual_partition_size` is larger than fixed-size.
+        """
+        if part.fixed_size:
+            partition_size = part.fixed_size
+            if actual_partition_size > partition_size:
+                raise WicError("Actual partition size (%d kB) is larger than "
+                               "allowed size %d kB" %
+                               (actual_partition_size, partition_size))
+        else:
+            extra_space = 0
+            if extra_space < part.extra_space:
+                extra_space = part.extra_space
+            partition_size = actual_partition_size + extra_space
+
+        return partition_size
-- 
2.7.4


