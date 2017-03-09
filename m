Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 317FD774E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:09:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11so13054825wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=o1kittLxZL9YvWSrsgbFK5DfVsW++WuBQWnBa9ryC4k=;
	b=g1sqA9P4e8SY9K6iq1M8dfYgZADUpSZlcz2362/qq0Cb+66WcqxsBK8EVlGCDjCp1C
	gtx23ZF143R6dEpvMdqFMVh0uC2A0oYu/hG/dwhlq1rUWLUcpTM8N+Z8YON87oOsjbaY
	2rGHKolSEndlSPOD981YgITrZ1XxhL6K05aWq/wRQu2L+UL0O+Dv2T9b5O6j/Ao3hRzz
	nL9r0529vW9q/BtrUyWRV2fpRxF+QWJabOLHjoEk+RPxu58tXy7QFv76+fyjG9GCC4b3
	nH1oBZxhFpqXXyR9pwErVUIzuFrNgZR43XTLZZ5IJmYUBUFpfuU2nxnRAKwBhpoyue5O
	vK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o1kittLxZL9YvWSrsgbFK5DfVsW++WuBQWnBa9ryC4k=;
	b=tYjG5pXJYksTwiefrLGS0GcFLAooAnkBQDJRkA4rLsdDiTR7NtQPF+eq92rLweGoqE
	/L/XPqdEfAG0aeoIf+y98lgLbQ0NOARsKH/YaWUpGl/EjScpAZN/voqP5bRHwLr++gX3
	PPKzeOJMhxDgeRch/tbSNxBw4HW6830+m3v+GgBlFTktx92mPZFWlVFxPC/N4KzQOdKx
	RKoUofUuoSwJoB6Q4QUiZMU+KlrU19oihWsVnsCfAEvoTz5WfAGKLOfwy2HlrFzMgz5s
	iQWB08GXAvZ7pBkai9cTDTTnD6lMzrdd1pw5DwNNEfLIWygE1TBRaeEV1aSJc0uNz91s
	LmNA==
X-Gm-Message-State: AMke39mbjfvgEYJGfAqHR7+wxX4sICs2uv2jlF3OBr6I5PwyoszDyUurX9Hv0MzVEP8N5w==
X-Received: by 10.28.172.68 with SMTP id v65mr28078524wme.49.1489097364246;
	Thu, 09 Mar 2017 14:09:24 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27])
	by smtp.gmail.com with ESMTPSA id 36sm9830671wrk.57.2017.03.09.14.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 14:09:23 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 23:08:44 +0100
Message-Id: <20170309220844.1892-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [meta-oe][PATCH rebased] wic: Fix and update rootfs-pcbios-ext plugin
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
X-List-Received-Date: Thu, 09 Mar 2017 22:09:24 -0000

Resolves #11003
Adds oe-selftest for rootfs-pcbios-ext plugin
---
 .../recipes-test/images/wic-image-single-ext.bb    |  13 ++
 .../recipes-test/images/wic-image-single-ext.wks   |   6 +
 meta/lib/oeqa/selftest/wic.py                      |  21 ++++
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 137 +++++++++------------
 4 files changed, 99 insertions(+), 78 deletions(-)
 create mode 100644 meta-selftest/recipes-test/images/wic-image-single-ext.bb
 create mode 100644 meta-selftest/recipes-test/images/wic-image-single-ext.wks

diff --git a/meta-selftest/recipes-test/images/wic-image-single-ext.bb b/meta-selftest/recipes-test/images/wic-image-single-ext.bb
new file mode 100644
index 0000000..5bd4b62
--- /dev/null
+++ b/meta-selftest/recipes-test/images/wic-image-single-ext.bb
@@ -0,0 +1,13 @@
+SUMMARY = "An example of partitioned image."
+
+SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
+
+IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
+
+IMAGE_FSTYPES = "wic"
+
+DEPENDS = "syslinux syslinux-native e2fsprogs-native"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit image
diff --git a/meta-selftest/recipes-test/images/wic-image-single-ext.wks b/meta-selftest/recipes-test/images/wic-image-single-ext.wks
new file mode 100644
index 0000000..af8d2f5
--- /dev/null
+++ b/meta-selftest/recipes-test/images/wic-image-single-ext.wks
@@ -0,0 +1,6 @@
+# short-description: Example of single ext4 partition
+# long-description: This image contains one singel ext4 partition.
+# created from core-image-minimal and wic-image-single-ext image recipes.
+
+part / --source rootfs-pcbios-ext --ondisk vda --fstype=ext4 --active --label rootfs --align 4096 --size 20
+bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait console=tty0 rootfstype=ext4"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index dcb88ba..8797dd5 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -561,3 +561,24 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '3')
+
+    def test_single_ext_qemu(self):
+        """Test wic-image-single-ext under qemu"""
+        config = 'IMAGE_FSTYPES += "wic"\nWKS_FILE = "wic-image-single-ext"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('wic-image-single-ext').status)
+        self.remove_config(config)
+
+        with runqemu('wic-image-single-ext', ssh=False) as qemu:
+            cmd = "grep '/dev/root / ext4' /proc/mounts"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertRegex(output, '^/dev/root +/ +ext4.*')
+
+            cmd = "ls /boot"
+            status, output = qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertRegex(output, '.*ldlinux.c32.*')
+            self.assertRegex(output, '.*ldlinux.sys.*')
+            self.assertRegex(output, '.*syslinux.cfg.*')
+            self.assertRegex(output, '.*vmlinuz.*')
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index 94f80d0..6008cb3 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -14,13 +14,22 @@
 # with this program; if not, write to the Free Software Foundation, Inc.,
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 #
+# DESCRIPTION
+# This plugin creates an ext4 rootfs partition. If the image feature
+# package-management is enabled and even the kernel package needs to be
+# updated on the target device this source plugin might be a good choice.
+# In general a fat boot partition and a second root partition is
+# recommended.
+# Example wks file:
+#   part / --source rootfs-pcbios-ext --ondisk sda --fstype=ext4 --active --label rootfs --align 4096 --size 20
+#   bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait console=ttyS0,115200 rootfstype=ext4"
+#
 # AUTHOR
-# Adrian Freihofer <adrian.freihofer (at] neratec.com>
+# Adrian Freihofer <adrian.freihofer (at] gmail.com>
 #
 
 import logging
 import os
-import re
 
 from wic import WicError
 from wic.utils import runner
@@ -29,44 +38,9 @@ from wic.pluginbase import SourcePlugin
 
 logger = logging.getLogger('wic')
 
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
 
 # pylint: disable=no-init
-class RootfsPlugin(SourcePlugin):
+class RootfsPcBoisExtPlugin(SourcePlugin):
     """
     Create root partition and install syslinux bootloader
 
@@ -106,83 +80,90 @@ class RootfsPlugin(SourcePlugin):
 
     # pylint: disable=unused-argument
     @classmethod
-    def do_configure_partition(cls, part, source_params, image_creator,
-                               image_creator_workdir, oe_builddir, bootimg_dir,
-                               kernel_dir, native_sysroot):
+    def do_prepare_partition(cls, part, source_params, image_creator,
+                             image_creator_workdir, oe_builddir, bootimg_dir,
+                             kernel_dir, krootfs_dir, native_sysroot):
         """
-        Creates syslinux config in rootfs directory
+        Creates partition out of rootfs directory
 
-        Called before do_prepare_partition()
+        Prepare content for a rootfs partition i.e. create a partition
+        and fill it from a /rootfs dir.
+        Install syslinux bootloader into root partition image file
         """
         bootloader = image_creator.ks.bootloader
+        syslinux_serial = get_bitbake_var('SYSLINUX_SERIAL')
 
         syslinux_conf = ""
         syslinux_conf += "PROMPT 0\n"
-
-        syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
+        if bootloader.timeout is not None:
+            syslinux_conf += "TIMEOUT " + str(bootloader.timeout) + "\n"
         syslinux_conf += "ALLOWOPTIONS 1\n"
-
-        # Derive SERIAL... line from from kernel boot parameters
-        syslinux_conf += serial_console_form_kargs(options) + "\n"
-
+        if syslinux_serial:
+            syslinux_conf += "SERIAL " + syslinux_serial
         syslinux_conf += "DEFAULT linux\n"
         syslinux_conf += "LABEL linux\n"
-        syslinux_conf += "  KERNEL /boot/bzImage\n"
+        syslinux_conf += "  KERNEL /boot/vmlinuz\n"
 
         syslinux_conf += "  APPEND label=boot root=%s %s\n" % \
-                             (image_creator.rootdev, bootloader.append)
+                            (image_creator.rootdev, bootloader.append)
 
-        syslinux_cfg = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot", "syslinux.cfg")
-        logger.debug("Writing syslinux config %s", syslinux_cfg)
-        with open(syslinux_cfg, "w") as cfg:
+        # Write syslinux config file into target sysroot dir
+        tmp_syslinux_cfg_file = os.path.join(image_creator_workdir, "syslinux.cfg")
+        with open(tmp_syslinux_cfg_file, "w") as cfg:
             cfg.write(syslinux_conf)
 
-    @classmethod
-    def do_prepare_partition(cls, part, source_params, image_creator,
-                             image_creator_workdir, oe_builddir, bootimg_dir,
-                             kernel_dir, krootfs_dir, native_sysroot):
-        """
-        Creates partition out of rootfs directory
+        hdd_boot_dir = os.path.join(image_creator.rootfs_dir['ROOTFS_DIR'], "boot")
+        p_prefix = os.environ.get("PSEUDO_PREFIX", "%s/usr" % native_sysroot)
+        p_localstatedir = os.environ.get("PSEUDO_LOCALSTATEDIR",
+                                         "%s/../pseudo" % hdd_boot_dir)
+        p_passwd = os.environ.get("PSEUDO_PASSWD", hdd_boot_dir)
+        p_nosymlinkexp = os.environ.get("PSEUDO_NOSYMLINKEXP", "1")
+        pseudo = "export PSEUDO_PREFIX=%s;" % p_prefix
+        pseudo += "export PSEUDO_LOCALSTATEDIR=%s;" % p_localstatedir
+        pseudo += "export PSEUDO_PASSWD=%s;" % p_passwd
+        pseudo += "export PSEUDO_NOSYMLINKEXP=%s;" % p_nosymlinkexp
+        pseudo += "%s/usr/bin/pseudo " % native_sysroot
+
+        install_cmd = "%s install -m 0744 -d %s" % (pseudo, hdd_boot_dir)
+        exec_cmd(install_cmd, as_shell=True)
+        install_cmd = "%s install -m 0644 %s %s" % (pseudo, tmp_syslinux_cfg_file, hdd_boot_dir)
+        exec_cmd(install_cmd, as_shell=True)
+        install_cmd = "%s install -m 0644 %s/bzImage %s/vmlinuz" % (pseudo, kernel_dir, hdd_boot_dir)
+        exec_cmd(install_cmd, as_shell=True)
+
+        os.remove(tmp_syslinux_cfg_file)
 
-        Prepare content for a rootfs partition i.e. create a partition
-        and fill it from a /rootfs dir.
-        Install syslinux bootloader into root partition image file
-        """
         def is_exe(exepath):
             """Verify exepath is an executable file"""
             return os.path.isfile(exepath) and os.access(exepath, os.X_OK)
 
-        # Make sure syslinux-nomtools is available in native sysroot or fail
+        # Verify syslinux-nomtools is available in native sysroot or fail
         native_syslinux_nomtools = os.path.join(native_sysroot, "usr/bin/syslinux-nomtools")
         if not is_exe(native_syslinux_nomtools):
-            logger.info("building syslinux-native...")
-            exec_cmd("bitbake syslinux-native")
-        if not is_exe(native_syslinux_nomtools):
-            raise WicError("Couldn't find syslinux-nomtools (%s), exiting" %
-                           native_syslinux_nomtools)
+            raise WicError("Cannot find syslinux-nomtools (%s), exiting" % native_syslinux_nomtools)
 
-        if part.rootfs is None:
-            if 'ROOTFS_DIR' not in krootfs_dir:
+        if part.rootfs_dir is None:
+            if not 'ROOTFS_DIR' in krootfs_dir:
                 raise WicError("Couldn't find --rootfs-dir, exiting")
             rootfs_dir = krootfs_dir['ROOTFS_DIR']
         else:
-            if part.rootfs in krootfs_dir:
-                rootfs_dir = krootfs_dir[part.rootfs]
-            elif part.rootfs:
-                rootfs_dir = part.rootfs
+            if part.rootfs_dir in krootfs_dir:
+                rootfs_dir = krootfs_dir[part.rootfs_dir]
+            elif part.rootfs_dir:
+                rootfs_dir = part.rootfs_dir
             else:
                 raise WicError("Couldn't find --rootfs-dir=%s connection or "
                                "it is not a valid path, exiting" % part.rootfs)
 
         real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
-
         part.rootfs_dir = real_rootfs_dir
         part.prepare_rootfs(image_creator_workdir, oe_builddir, real_rootfs_dir, native_sysroot)
 
-        # install syslinux into rootfs partition
+        # install syslinux into rootfs partition (add ldlinux.c32 ldlinux.sys)
         syslinux_cmd = "syslinux-nomtools -d /boot -i %s" % part.source_file
         exec_native_cmd(syslinux_cmd, native_sysroot)
 
+    # pylint: disable=unused-argument
     @classmethod
     def do_install_disk(cls, disk, disk_name, image_creator, workdir, oe_builddir,
                         bootimg_dir, kernel_dir, native_sysroot):
-- 
2.9.3


