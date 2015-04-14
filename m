Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E98BE73912
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 22:05:44 +0000 (UTC)
Received: by wgso17 with SMTP id o17so27514766wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:reply-to:cc:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=OCXrTlQx3zSXapf2bClZuZnPGsoxwOfsM5fG3sYBX8Q=;
	b=sd976XVm9FsmcM4pxsEmetnx3rpzfW1cZzUGWSTXwt1zi1ItiRnMkjvRhbin9T1Xjp
	IuYN6XQaUDhjXGGHeKtKbOLxkyxQw/XtfnrQFixN+1J1UsYor2Xmkw4lz318cM/n/5Sb
	DJut4JplqFPBMO0xwjb/u38qmbxwB1V9l9OAy+hAZULD5r0iwqpaHmV2JIl5v3MeZEu4
	zoMP2NaAh9qS1fewvbS0xbAtZdLwC5mela7LfZ8oP4KY/jM9+XIfbsERpl5da7VdhCxQ
	8y8wMHbIlPfKX+R5LLyBB6U8h800cCXbJKv/pE7D6PNxDHosVwViShO9VhESt8XWt4I3
	ryjA==
X-Received: by 10.180.80.199 with SMTP id t7mr37141801wix.52.1429049144494;
	Tue, 14 Apr 2015 15:05:44 -0700 (PDT)
Received: from chl500346.localnet (c-82-192-249-249.customer.ggaweb.ch.
	[82.192.249.249])
	by mx.google.com with ESMTPSA id ju2sm4528220wid.12.2015.04.14.15.05.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Apr 2015 15:05:43 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: liezhi.yang@windriver.com
Date: Wed, 15 Apr 2015 00:05:41 +0200
Message-ID: <4315128.UxjMQCh9eD@chl500346>
Organization: Privat
User-Agent: KMail/4.13.3 (Linux/3.13.0-49-generic; KDE/4.13.3; x86_64; ; )
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] syslinux: add syslinux-nomtools to PACKAGES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: adrian.freihofer@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Apr 2015 22:05:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

From c0a00e59de0e5dad364b0f260303533bab6388a6 Mon Sep 17 00:00:00 2001
From: Adrian <adrian.freihofer@gmail.com>
Date: Tue, 14 Apr 2015 23:49:05 +0200
Subject: [PATCH] wic: plugin for single ext partition

This is not the final implementatio yet. It is based on a temporary
wrapper script calling extlinux and sudo. The final solution will
call syslinux-nomtools instead of the script.

The wic plugin creates a disk image containig just one ext2/3/4
partition. The target devices are PCs with legacy BIOS. Syslinux
is used as a bootloader.
Creating just one ext partition instead of a fat partiton for boot
and an ext partiton for rootfs solves several issues related to
package based kernel updates on the device.
---
 .../lib/wic/plugins/source/rootfs-pcbios-ext.py    | 165 +++++++++++++++++++++
 scripts/syslinux-e2fs                              |  68 +++++++++
 2 files changed, 233 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/rootfs-pcbios-ext.py
 create mode 100755 scripts/syslinux-e2fs

diff --git a/scripts/lib/wic/plugins/source/rootfs-pcbios-ext.py b/scripts/lib/wic/plugins/source/rootfs-pcbios-ext.py
new file mode 100644
index 0000000..e455036
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/rootfs-pcbios-ext.py
@@ -0,0 +1,165 @@
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
+# bootloader --timeout=0 --append="rootwait rootfstype=ext4" --source rootfs-pcbios-ext
+#
+# The first line generates a root file system including a syslinux.cfg file
+# The "--source rootfs-pcbios-ext" in the second line triggers the ldlinux.sys
+# installation into the image.
+#
+# AUTHOR
+# Adrian Freihofer <adrian.freihofer (at] gmail.com>
+#
+
+import os
+from wic import kickstart, msger
+from wic.utils import runner
+from wic.pluginbase import SourcePlugin
+from wic.utils.oe.misc import *
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
+        bitbake_env_lines = find_bitbake_env_lines(rootfs_dir)
+        if not bitbake_env_lines:
+            msg = "Couldn't get bitbake environment, exiting."
+            msger.error(msg)
+
+        image_rootfs_dir = find_artifact(bitbake_env_lines, "IMAGE_ROOTFS")
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
+        timeout = kickstart.get_timeout(cr.ks)
+        if not timeout:
+            timeout = 0
+        syslinux_conf += "TIMEOUT " + str(timeout) + "\n"
+        syslinux_conf += "\n"
+        syslinux_conf += "ALLOWOPTIONS 1\n"
+        syslinux_conf += "SERIAL 0 115200\n"
+        syslinux_conf += "\n"
+        syslinux_conf += "DEFAULT boot\n"
+        syslinux_conf += "LABEL boot\n"
+        syslinux_conf += "KERNEL /boot/bzImage\n"
+
+        if cr._ptable_format == 'msdos':
+            rootstr = rootdev
+        else:
+            raise ImageError("Unsupported partition table format found")
+
+        syslinux_conf += "APPEND label=boot root=%s %s\n" % (rootstr, options)
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
+        def _has_syslinux(dir):
+            if dir:
+                syslinux = "%s/syslinux" % dir
+                if os.path.exists(syslinux):
+                    return True
+            return False
+
+        if not _has_syslinux(bootimg_dir):
+            bootimg_dir = get_bitbake_var("STAGING_DATADIR_NATIVE")
+            if not bootimg_dir:
+                msger.error("Couldn't find STAGING_DATADIR_NATIVE, exiting\n")
+            if not _has_syslinux(bootimg_dir):
+                msger.error("Please build syslinux-native before calling wic\n")
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
+    @classmethod
+    def do_install_disk(self, disk, disk_name, cr, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.  In this case, we install the MBR.
+        """
+        mbrfile = os.path.join(native_sysroot, "usr/share/syslinux/mbr.bin")
+        if not os.path.exists(mbrfile):
+            msger.error("Couldn't find %s.  If using the -e option, do you have the right MACHINE set in local.conf?  If not, is the bootimg_dir path corct?" % mbrfile)
+
+        full_path = disk['disk'].device
+        msger.debug("Installing MBR on disk %s as %s with size %s bytes" \
+                    % (disk_name, full_path, disk['min_size']))
+
+        rc = runner.show(['dd', 'if=%s' % mbrfile,
+                          'of=%s' % full_path, 'conv=notrunc'])
+        if rc != 0:
+            raise ImageError("Unable to set MBR to %s" % full_path)
+
+        # install syslinux
+        syslinux_cmd = "syslinux-e2fs -t %d -d /boot -i %s" % (2048*512, full_path)
+        # syslinux_cmd = "syslinux-nomtools -t %d -d /boot -i %s" % (2048*512, full_path)
+        exec_cmd(syslinux_cmd)
diff --git a/scripts/syslinux-e2fs b/scripts/syslinux-e2fs
new file mode 100755
index 0000000..f0f563e
--- /dev/null
+++ b/scripts/syslinux-e2fs
@@ -0,0 +1,68 @@
+#!/bin/bash
+# Temporary solution
+# This is a wrapper around extlinux providing similar functionality like syslinux-e2fs will
+# do in future. syslinux-e2fs will be part of future syslinux versions. When this update of
+# syslinux will be released this script will be obsolete.
+#
+# Background:
+# The binary installed on the target device (ldlinux.sys) is the same for syslinux and for
+# extlinux. The difference is the installation procedure. Where extlinux needs a mounted
+# filesystem syslinux-e2fs will work on an image file. In other words, extlinux uses the kernel
+# capabilities to modify the filesystem where syslinux-e2fs will be based on a user space
+# library providing an ext2/3/4 implementation. The purpose of the installer in general is to
+# store the file ldlinux.sys in the first blocks of the filesystem. A regular file cannot be
+# found by mbr.bin since there are not fat or ext algorithm integrated there.
+#
+# Usage:
+# export PATH="$BUILDDIR/tmp/sysroots/x86_64-linux/usr/sbin:$PATH"
+
+
+P_OFFSET=""
+P_INSTALL=0
+P_DIRECTORY="/boot/syslinux"
+
+[ "$#" -ge 1 ] || { echo "pass at least the image name"; exit 1; }
+
+
+# options may be followed by one colon to indicate they have a required argument
+if ! options=$(getopt -o t:id: -l offset:,install,directory: -- "$@")
+then
+    # something went wrong, getopt will put out an error message for us
+    exit 1
+fi
+
+eval set -- $options
+
+while [ $# -gt 0 ]
+do
+    case $1 in
+    -t|--offset) 
+        P_OFFSET="-o $2"; shift;;
+    -i|--install)
+        P_INSTALL=1;;
+    -d|--directory)
+        P_DIRECTORY="$2"; shift;;
+    (--) shift; break;;
+    (-*) echo "$0: error - unrecognized option $1" 1>&2; exit 1;;
+    (*) echo $1; break;;
+    esac
+    shift
+done
+
+# consider last command line parameter as image name
+IMAGE_FILE_NAME="$1"
+test -f $IMAGE_FILE_NAME || { echo "pass valid image file name"; exit 1; }
+
+if [ $P_INSTALL -eq 1 ]; then
+    LOOP_DEVICE=$(sudo losetup -f)
+    TMP_MOUNT_POINT=$(mktemp -d)
+
+    sudo losetup ${P_OFFSET} ${LOOP_DEVICE} ${IMAGE_FILE_NAME} || { echo "losetup failed"; exit 1; }
+    sudo mount ${LOOP_DEVICE} ${TMP_MOUNT_POINT} || { echo "mount failed"; exit 1; }
+    ex_val=0
+    sudo env "PATH=$PATH" extlinux -i ${TMP_MOUNT_POINT}/${P_DIRECTORY} || { echo "extlinux failed"; ex_val=1; }
+    sudo umount ${TMP_MOUNT_POINT} || { echo "umount failed"; ex_val=1; }
+    sudo losetup -d ${LOOP_DEVICE} || { echo "losetup -d failed"; ex_val=1; }
+    rmdir ${TMP_MOUNT_POINT}
+    exit $ex_val
+fi
\ No newline at end of file
-- 
-M



