Return-Path: <tom.zanussi@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F3D216E8C3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 01:17:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Feb 2014 17:17:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,776,1384329600"; d="scan'208";a="475488002"
Received: from unknown (HELO localhost) ([10.255.13.52])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2014 17:17:10 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 19:16:58 -0600
Message-Id: <3abbbf8e05807be73b729e3da7316cc9c13072f9.1391476329.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
References: <77905d08bc13b7b0e12ee12aa77ccf4f4c4adc00.1391476329.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1391476329.git.tom.zanussi@linux.intel.com>
References: <cover.1391476329.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 5/7] wic: Add BootimgEFIPlugin and BootimgPcbiosPlugin
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
X-List-Received-Date: Tue, 04 Feb 2014 01:17:11 -0000

Implement the BootimgPcbiosPlugin and BootimgEFIPlugin SourcePlugin
classes.  The configure/prepare_partition() methods are implemented
using code derived from similar code in the Wic_PartData class.

These classes have the corresponding names 'bootimg-pcbios' and
'bootimg-efi', which are the names that should be used in the --source
parameters of the .wks partition commands.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 scripts/lib/mic/plugins/source/bootimg-efi.py    | 161 +++++++++++++++++++
 scripts/lib/mic/plugins/source/bootimg-pcbios.py | 187 +++++++++++++++++++++++
 2 files changed, 348 insertions(+)
 create mode 100644 scripts/lib/mic/plugins/source/bootimg-efi.py
 create mode 100644 scripts/lib/mic/plugins/source/bootimg-pcbios.py

diff --git a/scripts/lib/mic/plugins/source/bootimg-efi.py b/scripts/lib/mic/plugins/source/bootimg-efi.py
new file mode 100644
index 0000000..f2bd071
--- /dev/null
+++ b/scripts/lib/mic/plugins/source/bootimg-efi.py
@@ -0,0 +1,161 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
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
+# This implements the 'bootimg-efi' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import os
+import shutil
+import re
+import tempfile
+
+from mic import kickstart, chroot, msger
+from mic.utils import misc, fs_related, errors, runner, cmdln
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.utils.partitionedfs import PartitionedMount
+import mic.imager.direct as direct
+from mic.pluginbase import SourcePlugin
+from mic.utils.oe.misc import *
+from mic.imager.direct import DirectImageCreator
+
+class BootimgEFIPlugin(SourcePlugin):
+    name = 'bootimg-efi'
+
+    @classmethod
+    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
+                               bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before do_prepare_partition(), creates grubefi config
+        """
+        hdddir = "%s/hdd/boot" % cr_workdir
+        rm_cmd = "rm -rf %s" % cr_workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s/EFI/BOOT" % hdddir
+        tmp = exec_cmd(install_cmd)
+
+        splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
+        if os.path.exists(splash):
+            splashline = "menu background splash.jpg"
+        else:
+            splashline = ""
+
+        (rootdev, root_part_uuid) = cr._get_boot_config()
+        options = cr.ks.handler.bootloader.appendLine
+
+        grubefi_conf = ""
+        grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
+        grubefi_conf += "default=boot\n"
+        timeout = kickstart.get_timeout(cr.ks)
+        if not timeout:
+            timeout = 0
+        grubefi_conf += "timeout=%s\n" % timeout
+        grubefi_conf += "menuentry 'boot'{\n"
+
+        kernel = "/vmlinuz"
+
+        if cr._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            if not root_part_uuid:
+                raise MountError("Cannot find the root GPT partition UUID")
+            rootstr = "PARTUUID=%s" % root_part_uuid
+
+        grubefi_conf += "linux %s root=%s rootwait %s\n" \
+            % (kernel, rootstr, options)
+        grubefi_conf += "}\n"
+        if splashline:
+            syslinux_conf += "%s\n" % splashline
+
+        msger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg" \
+                        % cr_workdir)
+        cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir, "w")
+        cfg.write(grubefi_conf)
+        cfg.close()
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for an EFI (grub) boot partition.
+        """
+        if not bootimg_dir:
+            bootimg_dir = get_bitbake_var("HDDDIR")
+            if not bootimg_dir:
+                msger.error("Couldn't find HDDDIR, exiting\n")
+            # just so the result notes display it
+            cr.bootimg_dir = bootimg_dir
+
+        staging_kernel_dir = kernel_dir
+        staging_data_dir = bootimg_dir
+
+        hdddir = "%s/hdd" % cr_workdir
+
+        install_cmd = "install -m 0644 %s/bzImage %s/bzImage" % \
+            (staging_kernel_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
+                        "%s/grub.cfg" % cr_workdir)
+
+        cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (staging_data_dir, hdddir)
+        exec_cmd(cp_cmd, True)
+
+        shutil.move("%s/grub.cfg" % cr_workdir,
+                    "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
+
+        du_cmd = "du -bks %s" % hdddir
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        blocks += BOOTDD_EXTRA_SPACE
+
+        # Ensure total sectors is an integral number of sectors per
+        # track or mcopy will complain. Sectors are 512 bytes, and we
+        # generate images with 32 sectors per track. This calculation is
+        # done in blocks, thus the mod by 16 instead of 32.
+        blocks += (16 - (blocks % 16))
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot.img" % cr_workdir
+
+        dosfs_cmd = "mkdosfs -n efi -C %s %d" % (bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbms %s" % bootimg
+        rc, out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        part.size = bootimg_size
+        part.source_file = bootimg
+
+
diff --git a/scripts/lib/mic/plugins/source/bootimg-pcbios.py b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
new file mode 100644
index 0000000..1da2a41
--- /dev/null
+++ b/scripts/lib/mic/plugins/source/bootimg-pcbios.py
@@ -0,0 +1,187 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Copyright (c) 2014, Intel Corporation.
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
+# This implements the 'bootimg-pcbios' source plugin class for 'wic'
+#
+# AUTHORS
+# Tom Zanussi <tom.zanussi (at] linux.intel.com>
+#
+
+import os
+import shutil
+import re
+import tempfile
+
+from mic import kickstart, chroot, msger
+from mic.utils import misc, fs_related, errors, runner, cmdln
+from mic.conf import configmgr
+from mic.plugin import pluginmgr
+from mic.utils.partitionedfs import PartitionedMount
+import mic.imager.direct as direct
+from mic.pluginbase import SourcePlugin
+from mic.utils.oe.misc import *
+from mic.imager.direct import DirectImageCreator
+
+class BootimgPcbiosPlugin(SourcePlugin):
+    name = 'bootimg-pcbios'
+
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we install the MBR.
+        """
+        mbrfile = "%s/syslinux/" % bootimg_dir
+        if cr._ptable_format == 'gpt':
+            mbrfile += "gptmbr.bin"
+        else:
+            mbrfile += "mbr.bin"
+
+        if not os.path.exists(mbrfile):
+            msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path correct?" % mbrfile)
+
+        full_path = cr._full_path(workdir, disk_name, "direct")
+        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
+                    % (disk_name, full_path, disk['min_size']))
+
+        rc = runner.show(['dd', 'if=%s' % mbrfile,
+                          'of=%s' % full_path, 'conv=notrunc'])
+        if rc != 0:
+            raise MountError("Unable to set MBR to %s" % full_path)
+
+    @classmethod
+    def do_configure_partition(self, part, cr, cr_workdir, oe_builddir,
+                               bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called before do_prepare_partition(), creates syslinux config
+        """
+        hdddir = "%s/hdd/boot" % cr_workdir
+        rm_cmd = "rm -rf " + cr_workdir
+        exec_cmd(rm_cmd)
+
+        install_cmd = "install -d %s" % hdddir
+        tmp = exec_cmd(install_cmd)
+
+        splash = os.path.join(cr_workdir, "/hdd/boot/splash.jpg")
+        if os.path.exists(splash):
+            splashline = "menu background splash.jpg"
+        else:
+            splashline = ""
+
+        (rootdev, root_part_uuid) = cr._get_boot_config()
+        options = cr.ks.handler.bootloader.appendLine
+
+        syslinux_conf = ""
+        syslinux_conf += "PROMPT 0\n"
+        timeout = kickstart.get_timeout(cr.ks)
+        if not timeout:
+            timeout = 0
+        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+        syslinux_conf += "\n"
+        syslinux_conf += "ALLOWOPTIONS 1\n"
+        syslinux_conf += "SERIAL 0 115200\n"
+        syslinux_conf += "\n"
+        if splashline:
+            syslinux_conf += "%s\n" % splashline
+        syslinux_conf += "DEFAULT boot\n"
+        syslinux_conf += "LABEL boot\n"
+
+        kernel = "/vmlinuz"
+        syslinux_conf += "KERNEL " + kernel + "\n"
+
+        if cr._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            if not root_part_uuid:
+                raise MountError("Cannot find the root GPT partition UUID")
+            rootstr = "PARTUUID=%s" % root_part_uuid
+
+        syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
+
+        msger.debug("Writing syslinux config %s/hdd/boot/syslinux.cfg" \
+                    % cr_workdir)
+        cfg = open("%s/hdd/boot/syslinux.cfg" % cr_workdir, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
+
+    @classmethod
+    def do_prepare_partition(self, part, cr, cr_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        In this case, prepare content for legacy bios boot partition.
+        """
+        if not bootimg_dir:
+            bootimg_dir = get_bitbake_var("STAGING_DATADIR")
+            if not bootimg_dir:
+                msger.error("Couldn't find STAGING_DATADIR, exiting\n")
+            # just so the result notes display it
+            cr.bootimg_dir = bootimg_dir
+
+        staging_kernel_dir = kernel_dir
+        staging_data_dir = bootimg_dir
+
+        hdddir = "%s/hdd/boot" % cr_workdir
+
+        install_cmd = "install -m 0644 %s/bzImage %s/vmlinuz" \
+            % (staging_kernel_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        install_cmd = "install -m 444 %s/syslinux/ldlinux.sys %s/ldlinux.sys" \
+            % (staging_data_dir, hdddir)
+        tmp = exec_cmd(install_cmd)
+
+        du_cmd = "du -bks %s" % hdddir
+        rc, out = exec_cmd(du_cmd)
+        blocks = int(out.split()[0])
+
+        blocks += BOOTDD_EXTRA_SPACE
+
+        # Ensure total sectors is an integral number of sectors per
+        # track or mcopy will complain. Sectors are 512 bytes, and we
+        # generate images with 32 sectors per track. This calculation is
+        # done in blocks, thus the mod by 16 instead of 32.
+        blocks += (16 - (blocks % 16))
+
+        # dosfs image, created by mkdosfs
+        bootimg = "%s/boot.img" % cr_workdir
+
+        dosfs_cmd = "mkdosfs -n boot -S 512 -C %s %d" % (bootimg, blocks)
+        exec_native_cmd(dosfs_cmd, native_sysroot)
+
+        mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)
+        exec_native_cmd(mcopy_cmd, native_sysroot)
+
+        syslinux_cmd = "syslinux %s" % bootimg
+        exec_native_cmd(syslinux_cmd, native_sysroot)
+
+        chmod_cmd = "chmod 644 %s" % bootimg
+        exec_cmd(chmod_cmd)
+
+        du_cmd = "du -Lbms %s" % bootimg
+        rc, out = exec_cmd(du_cmd)
+        bootimg_size = out.split()[0]
+
+        part.size = bootimg_size
+        part.source_file = bootimg
+
+
-- 
1.8.3.1


