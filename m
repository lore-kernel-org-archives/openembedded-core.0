Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5A26E268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 21:09:18 +0000 (UTC)
Received: by wgen6 with SMTP id n6so12156124wge.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 14:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ph6LpdqbuIt3k6NlojNt5Bsi2azQ/jAB4WP9Vxsm11A=;
	b=leCGZ4SRGJlqoEs8dkjiRQkkgVSiw8zotZuy/bXH68U5uncWM0QQZ0wSxd+gPXK4DM
	WwIzJyziPH+mlLe7ecJudDS24nncIfCTQwviuJBMtW+azE1tN1wBkpI76bk7L2TfpOds
	QXLr4ZgMPOM1Oy/xjbNVaoOBHh+yfYg/S6ZpKIiVqUNuLoOIqCgqB8NUu5hUr9Q0kpxv
	RLzdtNJ4g7+zJPFc2voNNOLIUnIoKI7RvXPgxrUrHgDq8ZgZMqQyWGcDnZAtLrWnYPjq
	S7zFuHXWsCBIAYHyOQ6La9Db6MSHcIjt2iX7RUgjKCRKSZ4EUCZFhOSkHw7pzoi8LanU
	Y3LQ==
X-Received: by 10.180.82.97 with SMTP id h1mr232wiy.26.1429650559739;
	Tue, 21 Apr 2015 14:09:19 -0700 (PDT)
Received: from wsadrian.lan.ffah.ch (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249]) by mx.google.com with ESMTPSA id
	dz4sm21336914wib.17.2015.04.21.14.09.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Apr 2015 14:09:18 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 23:08:32 +0200
Message-Id: <1429650512-17564-1-git-send-email-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: eduard.bartosh@intel.com, Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [master-next][PATCHv2] wic: Add plugin for single partition disk
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
X-List-Received-Date: Tue, 21 Apr 2015 21:09:20 -0000

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
 scripts/lib/wic/kickstart/__init__.py              |  13 ++
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 185 +++++++++++++++++++++
 scripts/lib/wic/utils/syslinux.py                  |  60 +++++++
 3 files changed, 258 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
 create mode 100644 scripts/lib/wic/utils/syslinux.py

diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 111723b..1530c41 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -104,6 +104,19 @@ def get_kernel_args(ks, default="ro rd.live.image"):
         return default
     return "%s %s" %(default, ks.handler.bootloader.appendLine)
 
+def get_kernel_args_console_serial(kargs):
+    """
+    Extract kernel parameters related to serial consoles
+    """
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
index 0000000..b0ad299
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -0,0 +1,185 @@
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
+# AUTHOR
+# Adrian Freihofer <adrian.freihofer (at] neratec.com>
+#
+
+import os
+from wic import kickstart
+from wic import msger
+from wic.utils import syslinux
+from wic.utils import runner
+from wic.utils.oe import misc
+from wic.utils.errors import ImageError
+from wic.pluginbase import SourcePlugin
+
+
+# pylint: disable=no-init
+class RootfsPlugin(SourcePlugin):
+    """
+    Create root partition and install syslinux bootloader
+
+    This plugin creates a disk image containing a bootable root partition with
+    syslinux installed. The filesystem is ext2/3/4, no extra boot partition is
+    required.
+
+    Example kickstart file:
+    part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --label rootfs --align 1024
+    bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait rootfstype=ext4"
+
+    The first line generates a root file system including a syslinux.cfg file
+    The "--source rootfs-pcbios-ext" in the second line triggers the installation
+    of ldlinux.sys into the image.
+    """
+
+    name = 'rootfs-pcbios-ext'
+
+    @staticmethod
+    def __get_rootfs_dir(rootfs_dir):
+        """
+        Find rootfs pseudo dir
+
+        If rootfs_dir is a directory consider it as rootfs directory.
+        Otherwise ask bitbake about the IMAGE_ROOTFS directory.
+        """
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
+    # pylint: disable=unused-argument
+    @classmethod
+    def do_configure_partition(self, part, source_params, cr, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Creates syslinux config in rootfs directory
+
+        Called before do_prepare_partition()
+        """
+        rootdev = cr._get_boot_config()[0]
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
+        # Derive SERIAL... line from from kernel boot parameters
+        syslinux_conf += syslinux.serial_console_form_kargs(options)
+
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
+        Creates partition out of rootfs directory
+
+        Prepare content for a rootfs partition i.e. create a partition
+        and fill it from a /rootfs dir.
+        Install syslinux bootloader into root partition image file
+        """
+        def is_exe(exepath):
+            """Verify exepath is an executable file"""
+            return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
+
+        # Make sure syslinux-nomtools is available in native sysroot or fail
+        native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
+        if not is_exe(native_syslinux_nomtools):
+            msger.info("building syslinux-native...")
+            misc.exec_cmd("bitbake syslinux-native")
+        if not is_exe(native_syslinux_nomtools):
+            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" %
+                        native_syslinux_nomtools)
+
+        if part.rootfs is None:
+            if 'ROOTFS_DIR' not in krootfs_dir:
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
+        Assemble partitions to disk image
+
+        Called after all partitions have been prepared and assembled into a
+        disk image. In this case, we install the MBR.
+        """
+        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
+        if not os.path.exists(mbrfile):
+            msger.error("Couldn't find %s. Has syslinux-native been baked?" % mbrfile)
+
+        full_path = disk['disk'].device
+        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
+                    % (disk_name, full_path, disk['min_size']))
+
+        rc = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
+        if rc != 0:
+            raise ImageError("Unable to set MBR to %s" % full_path)
diff --git a/scripts/lib/wic/utils/syslinux.py b/scripts/lib/wic/utils/syslinux.py
new file mode 100644
index 0000000..24d8c4e
--- /dev/null
+++ b/scripts/lib/wic/utils/syslinux.py
@@ -0,0 +1,60 @@
+# This program is free software; you can redistribute it and/or modify it
+# under the terms of the GNU General Public License as published by the Free
+# Software Foundation; version 2 of the License
+#
+# This program is distributed in the hope that it will be useful, but
+# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
+# for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc., 59
+# Temple Place - Suite 330, Boston, MA 02111-1307, USA.
+#
+# AUTHOR
+# Adrian Freihofer <adrian.freihofer (at] neratec.com>
+
+
+from wic import msger
+from wic import kickstart
+
+
+def serial_console_form_kargs(kernel_args):
+    """
+    Create SERIAL... line from kernel parameters
+
+    syslinux needs a line SERIAL port [baudrate [flowcontrol]]
+    in the syslinux.cfg file. The config line is generated based
+    on kernel boot parameters.
+    @param kernel_args kernel command line
+    @return line for syslinux config file e.g. "SERIAL 0 115200"
+    """
+    syslinux_conf = ""
+
+    serial_args = kickstart.get_kernel_args_console_serial(kernel_args)
+    try:
+        if serial_args[0][1] == 'ttyS':
+            syslinux_conf += "SERIAL " + serial_args[0][2]
+            try:  # baudrate
+                syslinux_conf += serial_args[0][2]
+            except IndexError:
+                pass
+            try:  # parity
+                if serial_args[0][2] != 'n':
+                    msger.warning("syslinux does not support parity for console")
+            except IndexError:
+                pass
+            try:  # number of bits
+                if serial_args[0][3] != '8':
+                    msger.warning("syslinux supports 8 bit console configuration only")
+            except IndexError:
+                pass
+            try:  # flow control
+                if serial_args[0][4] != '':
+                    msger.warning("syslinux console flowcontrol configuration is ignored")
+            except IndexError:
+                pass
+    except IndexError:
+        pass
+
+    return syslinux_conf + "\n"
-- 
2.1.0


