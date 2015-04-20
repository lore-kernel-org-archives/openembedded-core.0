Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA9A573D46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 14:54:59 +0000 (UTC)
Received: by wiax7 with SMTP id x7so85544064wia.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c7sT8nlyc2TkH/2lYB+Cyon6m/XEHEsz4A9YboPTqWE=;
	b=rLL4+UE8aeLRohE7/OEsU0yHDtTaudP8i/hDP1MXVFMhASky5Efln7RgyzHuJKKbt7
	Yt0zJO2Dne17sJsr/FhSYhkZy3jhPDS1ydyREJXhvGVsu6tIyy/EtaRAHG+u/tQrKrWS
	Jhzsgzwmp1TaXDy2Z0bVi2fMASc/k1SjiGE3JYii6vSdpaloh94M+a3yxZ0Z6nNeUIx5
	/mEHLRswGLmwljI4kXndY5G1g3CMfF+kKKNEZ4wsdrYmArRM/BDkm96M0Sgrq0KnelwN
	7tBeOcYbbgT3dAeo9txHKY7F3lhJ/Jx2YMQTG3BsXOKbx/7TMXKO9nEh5AmjGNZaK/2I
	966g==
X-Received: by 10.180.97.7 with SMTP id dw7mr26263309wib.74.1429541700135;
	Mon, 20 Apr 2015 07:55:00 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id b5sm15605902wiw.8.2015.04.20.07.54.58
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 07:54:59 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Apr 2015 16:54:23 +0200
Message-Id: <1429541663-5695-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>, eduard.bartosh@intel.com
Subject: [master-next][PATCH] wic: Add plugin for single partition disk
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
X-List-Received-Date: Mon, 20 Apr 2015 14:55:00 -0000

The wic plugin creates a disk image containig one ext2/3/4 partition.
No additional boot partition is required. Syslinux is installed into
the image. The target device is a legacy BIOS PC.

Purpose of this plugin:
Other avaliable plugins create a fat partition for /boot and an ext
partition for rootfs. Current linux-yocto kernel packages are not
compatible with this disk layout. The boot partition is not mounted
by default, hence the kernel is installed into rootfs and not into
boot partition. A kernel update ends up in a bricked device. The old
kernel which is still in boot likely does not even boot with updated
kernel modules from /. Even if the boot partition is mounted during
the kernel update the update will fail. The kernel package installs
a symbolic link which is not supported by the fat partition.
Creating just one ext partition for boot and rootfs solves all issues
related to package based kernel updates on the device.

The plugin depends on syslinux-nomtools a user space installer for
syslinux on ext filesystems.
Thanks to Robert Yang who implemented syslinux-nomtools and supported
the implementation of this plugin.

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/lib/wic/kickstart/__init__.py              |  10 ++
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 198 +++++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py

diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 111723b..eb9def9 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -104,6 +104,16 @@ def get_kernel_args(ks, default="ro rd.live.image"):
         return default
     return "%s %s" %(default, ks.handler.bootloader.appendLine)
 
+def get_kernel_args_console_serial(kargs):
+    consoles = []
+    for param in kargs.split():
+        param_match = re.match("console=(ttyS|ttyUSB)([0-9]+),?([0-9]*)([noe]?)([0-9]?)(r?)", param)
+        if param_match:
+            # console name without index, console index, baudrate, parity, number of bits, flow control
+            consoles.append((param_match.group(1), param_match.group(2), param_match.group(3),
+                             param_match.group(4), param_match.group(5), param_match.group(6)))
+    return consoles
+
 def get_menu_args(ks, default=""):
     if not hasattr(ks.handler.bootloader, "menus"):
         return default
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
new file mode 100644
index 0000000..a05ddcf
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -0,0 +1,198 @@
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# This program is free software; you can distribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for mo details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+# DESCRIPTION
+# This plugin creates a disk image containing a bootable root partition with
+# syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
+# required.
+#
+# Example kickstart file:
+# part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
+# bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
+#
+# The first line generates a root file system including a syslinux.cfg file
+# The "--source rootfs-pcbios-ext" in the second line triggers the ldlinux.sys
+# installation into the image.
+#
+# AUTHOR
+# Adrian Freihofer <adrian.freihofer (at] neratec.com>
+#
+
+import os
+from wic.utils.errors import ImageError
+from wic import kickstart
+from wic import msger
+from wic.utils import runner
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe import misc
+
+
+class RootfsPlugin(SourcePlugin):
+    name = 'rootfs-pcbios-ext'
+
+    @staticmethod
+    def __get_rootfs_dir(rootfs_dir):
+        if os.path.isdir(rootfs_dir):
+            return rootfs_dir
+
+        bitbake_env_lines = misc.find_bitbake_env_lines(rootfs_dir)
+        if not bitbake_env_lines:
+            msg = "Couldn't get bitbake environment, exiting."
+            msger.error(msg)
+
+        image_rootfs_dir = misc.find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
+        if not os.path.isdir(image_rootfs_dir):
+            msg = "No valid artifact IMAGE_ROOTFS from image named"
+            msg += " %s has been found at %s, exiting.\n" % \
+                (rootfs_dir, image_rootfs_dir)
+            msger.error(msg)
+
+        return image_rootfs_dir
+
+    @classmethod
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition(), creates syslinux config
+        """
+        (rootdev, root_part_uuid) = cr._get_boot_config()
+        options = cr.ks.handler.bootloader.appendLine
+
+        syslinux_conf = ""
+        syslinux_conf += "PROMPT 0\n"
+
+        timeout = kickstart.get_timeout(cr.ks)
+        if not timeout:
+            timeout = 0
+        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+        syslinux_conf += "ALLOWOPTIONS 1\n"
+
+        # Derive bootloader serial console configuration from kernel parameters
+        serial_args = kickstart.get_kernel_args_console_serial(options)
+        try:
+            if serial_args[0][1] == 'ttyS':
+                syslinux_conf += "SERIAL " + serial_args[0][2]
+                try:  # baudrate
+                    syslinux_conf += serial_args[0][2]
+                except IndexError:
+                    pass
+                try:  # parity
+                    if serial_args[0][2] != 'n':
+                        msger.warning("syslinux does not support parity for console")
+                except IndexError:
+                    pass
+                try:  # number of bits
+                    if serial_args[0][3] != '8':
+                        msger.warning("syslinux supports 8 bit console configuration only")
+                except IndexError:
+                    pass
+                try:  # flow control
+                    if serial_args[0][4] != '':
+                        msger.warning("syslinux console flowcontrol configuration is ignored")
+                except IndexError:
+                    pass
+        except IndexError:
+            pass
+
+        syslinux_conf += "\n"
+        syslinux_conf += "DEFAULT linux\n"
+        syslinux_conf += "LABEL linux\n"
+        syslinux_conf += "  KERNEL /boot/bzImage\n"
+
+        if cr._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            raise ImageError("Unsupported partition table format found")
+
+        syslinux_conf += "  APPEND label=boot root=%s %s\n" % (rootstr, options)
+
+        syslinux_cfg = os.path.join(cr.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
+        msger.debug("Writing syslinux config %s" % syslinux_cfg)
+        cfg = open(syslinux_cfg, "w")
+        cfg.write(syslinux_conf)
+        cfg.close()
+
+    @classmethod
+    def do_prepare_partition(self, part, source_params, cr, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             krootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+        def is_exe(exepath):
+            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
+        
+        # Make sure parted is available in native sysroot or fail
+        native_parted = os.path.join(native_sysroot ,"usr/sbin/parted")
+        if not is_exe(native_parted):
+            msger.info("building parted-native...")
+            misc.exec_cmd("bitbake parted-native")
+        if not is_exe(native_parted):
+            msger.error("Couldn't find parted (%s), exiting\n" % native_parted)
+        
+        # Make sure syslinux-nomtools is available in native sysroot or fail
+        native_syslinux_nomtools = os.path.join(native_sysroot ,"usr/bin/syslinux-nomtools")
+        if not is_exe(native_syslinux_nomtools):
+            msger.info("building syslinux-native...")
+            misc.exec_cmd("bitbake syslinux-native")
+        if not is_exe(native_syslinux_nomtools):
+            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" % native_syslinux_nomtools)
+
+        if part.rootfs is None:
+            if not 'ROOTFS_DIR' in krootfs_dir:
+                msg = "Couldn't find --rootfs-dir, exiting"
+                msger.error(msg)
+            rootfs_dir = krootfs_dir['ROOTFS_DIR']
+        else:
+            if part.rootfs in krootfs_dir:
+                rootfs_dir = krootfs_dir[part.rootfs]
+            elif part.rootfs:
+                rootfs_dir = part.rootfs
+            else:
+                msg = "Couldn't find --rootfs-dir=%s connection"
+                msg += " or it is not a valid path, exiting"
+                msger.error(msg % part.rootfs)
+
+        real_rootfs_dir = self.__get_rootfs_dir(rootfs_dir)
+
+        part.set_rootfs(real_rootfs_dir)
+        part.prepare_rootfs(cr_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
+
+        # install syslinux into rootfs partition
+        syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
+        misc.exec_native_cmd(syslinux_cmd, native_sysroot)
+
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image. In this case, we install the MBR.
+        """
+        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
+        if not os.path.exists(mbrfile):
+            msger.error("Couldn't find %s. If using the -e option, do you have the right MACHINE set in local.conf? If not, is the bootimg_dir path correct?" % mbrfile)
+
+        full_path = disk['disk'].device
+        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
+                    % (disk_name, full_path, disk['min_size']))
+
+        rc = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
+        if rc != 0:
+            raise ImageError("Unable to set MBR to %s" % full_path)
+
-- 
2.1.0


