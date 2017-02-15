Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A9F7571E14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 19:13:02 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u63so9691209wmu.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6zae018KdzyFU3rsywZ9/B3wh4UtYxkWKJF5WLD8zd0=;
	b=TXiqbMk6zD1AKNTRq0La9IF8SLpn7hy1l2rnB55TiLOdBlkodw10V52Q3HzX1xGBw4
	gKexGZDvOhO4A8/bF07IQ4D9XOrl0d2aWLFTa2ei9L7KkOGSbqZzPanuFZouggIMknDS
	f8LcS34NFCybfCbfIvVbE/ieVQWHYeGHdaQfnQsKG/JqQyMqGsZ0CLogENSNs2N2rerF
	3oNIJWbJ43Q1CX6TvlvVuI6cUiZPARK0dsCNcTcI5U6VcckC4I7CypoGb0z0dhUZiyfo
	mLqZ/rGhemhPhoh1mT9h3ASs1O6IgvslWxhRw02bcRwrxlN5qKFN4OAmi0NufBMoDBMU
	UvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6zae018KdzyFU3rsywZ9/B3wh4UtYxkWKJF5WLD8zd0=;
	b=oPSOxl2/MC0zxPXsTdozU5zPhkCui82liN0S9t+pooQFsknySQD1T00gI63Z21dFko
	RRt9msYqHkzckvbakMF73k4Sl8EWeGvJEYaeGdxKSTZLoJjBtkRd5Le0XgeyLW6Ik271
	wJQlalWtCiGUJc1LWRwvDyh5V9NH/FQcEHFWAg3HL2f4GD3r7Xxv8dJ15zjvpZAX2OCI
	5fT1wfqhM0wVW0Fqf3EIOP6o2TLf706naFo873dlFngLh1PWeJFDrV49JUrSW01AStn9
	K90/9MCO5hBxCccjjpMr6NJEk/w4aI6iQnl9Srgywzga5j+30KEy0PYuR23pIQzMaEwl
	qXvw==
X-Gm-Message-State: AMke39noK0IiHSLbpPRxVW4eVGxZABiDeLjHOCI1iIqbkF9r2uI0dDWk6M2C60yRGxno0w==
X-Received: by 10.28.68.6 with SMTP id r6mr9120906wma.57.1487185982306;
	Wed, 15 Feb 2017 11:13:02 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	z134sm503896wmc.20.2017.02.15.11.13.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Feb 2017 11:13:01 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 20:12:53 +0100
Message-Id: <20170215191253.3087-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH] wic: Fix and update rootfs-pcbios-ext plugin
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
X-List-Received-Date: Wed, 15 Feb 2017 19:13:03 -0000

Resolves #11003
Adds oe-selftest for rootfs-pcbios-ext plugin
---
 .../recipes-test/images/wic-image-single-ext.bb    |  13 ++
 .../recipes-test/images/wic-image-single-ext.wks   |   6 +
 meta/lib/oeqa/selftest/wic.py                      |  22 ++++
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 144 +++++++++------------
 4 files changed, 105 insertions(+), 80 deletions(-)
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
index 417ba3d..2928ea0 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -442,3 +442,25 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+
+    @testcase(1565)
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
\ No newline at end of file
diff --git a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
index cb1da93..68fa656 100644
--- a/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
+++ b/scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py
@@ -14,12 +14,21 @@
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
+#   bootloader --source rootfs-pcbios-ext --timeout=0 --append="rootwait console=ttyS0,115200n8 rootfstype=ext4"
+#
 # AUTHOR
-# Adrian Freihofer <adrian.freihofer (at] neratec.com>
+# Adrian Freihofer <adrian.freihofer (at] gmail.com>
 #
 
 import os
-import re
 
 from wic import msger
 from wic.utils import runner
@@ -27,44 +36,9 @@ from wic.utils.misc import get_bitbake_var, exec_cmd, exec_native_cmd
 from wic.utils.errors import ImageError
 from wic.pluginbase import SourcePlugin
 
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
-                msger.warning("syslinux does not support parity for console. {} is ignored."
-                              .format(param_match.group(3)))
-            # number of bits
-            if param_match.group(4) and param_match.group(4) != '8':
-                msger.warning("syslinux supports 8 bit console configuration only. {} is ignored."
-                              .format(param_match.group(4)))
-            # flow control
-            if param_match.group(5) and param_match.group(5) != '':
-                msger.warning("syslinux console flowcontrol configuration. {} is ignored."
-                              .format(param_match.group(5)))
-            break
-
-    return syslinux_conf
-
 
 # pylint: disable=no-init
-class RootfsPlugin(SourcePlugin):
+class RootfsPcBoisExtPlugin(SourcePlugin):
     """
     Create root partition and install syslinux bootloader
 
@@ -105,84 +79,94 @@ class RootfsPlugin(SourcePlugin):
 
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
-        msger.debug("Writing syslinux config %s" % syslinux_cfg)
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
-            msger.info("building syslinux-native...")
-            exec_cmd("bitbake syslinux-native")
-        if not is_exe(native_syslinux_nomtools):
-            msger.error("Couldn't find syslinux-nomtools (%s), exiting\n" %
+            msger.error("Cannot find syslinux-nomtools (%s), exiting\n" %
                         native_syslinux_nomtools)
 
-        if part.rootfs is None:
-            if 'ROOTFS_DIR' not in krootfs_dir:
-                msger.error("Couldn't find --rootfs-dir, exiting")
+        if part.rootfs_dir is None:
+            if not 'ROOTFS_DIR' in krootfs_dir:
+                msg = "Couldn't find --rootfs-dir, exiting"
+                msger.error(msg)
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
                 msg = "Couldn't find --rootfs-dir=%s connection"
                 msg += " or it is not a valid path, exiting"
-                msger.error(msg % part.rootfs)
 
-        real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
+                msger.error(msg % part.rootfs_dir)
 
+        real_rootfs_dir = cls._get_rootfs_dir(rootfs_dir)
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
@@ -210,4 +194,4 @@ class RootfsPlugin(SourcePlugin):
 
         ret_code = runner.show(['dd', 'if=%s' % mbrfile, 'of=%s' % full_path, 'conv=notrunc'])
         if ret_code != 0:
-            raise ImageError("Unable to set MBR to %s" % full_path)
+            raise ImageError("Unable to set MBR to %s" % full_path)
\ No newline at end of file
-- 
2.9.3


