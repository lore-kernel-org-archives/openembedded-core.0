Return-Path: <wbourque@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 75A096BBE6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 18:24:11 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id m29so19667597qtu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jul 2019 11:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dZGVXeYIPnb0NM0xDy7KxbrpdVKdy2hOjFj0tHCSDB4=;
	b=k1i1LbG6EQHBoDK+dO4afVZHIUDnb914jFFr4a/5l0HOQD1rPAGwRbgH/WkBFc448N
	/WpASmRwxr2MLbE+AYfHHDSOqiKqJKgiCm93BEIyGy6v2hRSf0n7NFpuQtmvM7SrsHdi
	V6SrWMOM/V1PsjZkBljMCUck6K3nHXcj/3nyWiJuhTv4BX+9Q3QFjlmg/SA/fNiGPMcT
	r1POTcKKhcu8ugf9L/4sDhtfzG+/oI9U7nBXTY6dSfoVGS3RTDkAUyr6TdcU/gJXbCn4
	taoh1sULCv2GSdCiwnWMjuwKT6EspBXNv2nwpEgM75knOo31Zf/DvZaed3CmfYM7zI64
	JF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dZGVXeYIPnb0NM0xDy7KxbrpdVKdy2hOjFj0tHCSDB4=;
	b=fAC+gdCYAyDsEg0JaDTv1sGLXS48qNUwi1Emaumt80fWS6h0vU+UzExQwVKWjNSZDZ
	rDoMTsSNMG+8NHvLY1cWK4Bf9uNWrk1o3ZA3pNxs/8KP1BaABOA0Zkp8jaxFW5FhF/6O
	Z5NO7BhMukX5/QU3AnCqCdY4VQqx76GErDdAkU07mYTg771zhHskszOdtxnEBawwbA+c
	78vycclkenTtaN2dSOOqIE7hLwq5xX8x+2IufjowLroo3TnIsI5veFvUbs8r/zKxdC34
	utXKXS6PDpq+B7BlPO8KSfhbA+lhowYJzvjiPMK12ILYKazAXV9tkwNgLVeoJSmU5fuv
	kFOA==
X-Gm-Message-State: APjAAAUy/uoFPNtSbzZcmVwKUpxwXH8JWqeLUSVxwjk+EKbZyC9A6x3j
	LZ/psVAqYLxflDZEYAO51lS53/gV
X-Google-Smtp-Source: APXvYqwCNuSNaa57OPSTmTgVmCOKJm0NTLo8CO4sJ5n8H9+Ruw5OLSnhNeAH3UW3gYALelKlIrL5TQ==
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr27037936qtc.300.1562091851988;
	Tue, 02 Jul 2019 11:24:11 -0700 (PDT)
Received: from localhost.localdomain
	(node-1w7jra92bc7udiocr8qgswi1d.ipv6.telus.net.
	[2001:56b:dc69:7b00:5530:d8e3:3173:9f51])
	by smtp.gmail.com with ESMTPSA id e8sm6537400qkn.95.2019.07.02.11.24.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Jul 2019 11:24:11 -0700 (PDT)
From: wbourque@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 14:24:03 -0400
Message-Id: <20190702182403.24099-1-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic/plugins: Source that support both EFI and BIOS
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
X-List-Received-Date: Tue, 02 Jul 2019 18:24:11 -0000

From: William Bourque <wbourque@gmail.com>

Add a source plugin that support both EFI and legacy PC-Bios.
While using this plugin, both bootloaders configurations reside
in the same /boot partitions.
This plugin has very little code : to avoid code duplication,
we simply re-import bootimg-pcbios and bootmg-efi source and
call both their SourcePlugin methods.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 .../wic/plugins/source/bootimg-biosplusefi.py | 210 ++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosplusefi.py

diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
new file mode 100644
index 0000000000..b7bd8a7fe2
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
@@ -0,0 +1,210 @@
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
+# This implements the 'bootimg-biosplusefi' source plugin class for 'wic'
+#
+# AUTHORS
+# William Bourque <wbourque [at) gmail.com>
+
+import types
+
+from wic.pluginbase import SourcePlugin
+from importlib.machinery import SourceFileLoader
+
+class BootimgBiosPlusEFIPlugin(SourcePlugin):
+    """
+    Create MBR + EFI boot partition
+
+    This plugin creates a boot partition that contains both
+    legacy BIOS and EFI content. It will be able to boot from both.
+    This is useful when managing PC fleet with some older machines
+    without EFI support.
+
+    Note it is possible to create an image that can boot from both
+    legacy BIOS and EFI by defining two partitions : one with arg
+    --source bootimg-efi  and another one with --source bootimg-pcbios.
+    However, this method has the obvious downside that it requires TWO
+    partitions to be created on the storage device.
+    Both partitions will also be marked as "bootable" which does not work on
+    most BIOS, has BIOS often uses the "bootable" flag to determine 
+    what to boot. If you have such a BIOS, you need to manually remove the 
+    "bootable" flag from the EFI partition for the drive to be bootable.
+    Having two partitions also seems to confuse wic : the content of
+    the first partition will be duplicated into the second, even though it
+    will not be used at all.
+
+    Also, unlike "isoimage-isohybrid" that also does BIOS and EFI, this plugin
+    allows you to have more than only a single rootfs partitions and does
+    not turn the rootfs into an initramfs RAM image.
+
+    This plugin is made to put everything into a single /boot partition so it
+    does not have the limitations listed above.
+
+    The plugin is made so it does tries not to reimplement what's already
+    been done in other plugins; as such it imports "bootimg-pcbios"
+    and "bootimg-efi".
+    Plugin "bootimg-pcbios" is used to generate legacy BIOS boot and
+    plugin "bootimg-efi" is used to generate the UEFI boot.
+    Imports are handled with "SourceFileLoader" from importlib as it is
+    otherwise very difficult to import module that has hyphen "-" in their
+    filename.
+    The SourcePlugin() methods used in the plugins (do_install_disk,
+    do_configure_partition, do_prepare_partition) are then called on both,
+    beginning by "bootimg-efi".
+    
+    Plugin options, such as "--sourceparams" can still be passed to a
+    plugin, as long they does not cause issue in the other plugin.
+
+    Example wic configuration:
+    part /boot --source bootimg-biosplusefi --sourceparams="loader=grub-efi"\\
+               --ondisk sda --label os_boot --active --align 1024 --use-uuid
+    """
+
+    name = 'bootimg-biosplusefi'
+
+    __PCBIOS_MODULE_NAME = "bootimg-pcbios"
+    __EFI_MODULE_NAME = "bootimg-efi"
+
+    __imgEFIObj = None
+    __imgBiosObj = None
+
+    @classmethod
+    def __init__(cls):
+        """
+        Constructor (init)
+        """
+
+        # XXX
+        # For some reasons, __init__ constructor is never called.
+        # Something to do with how pluginbase works?
+        cls.__instanciateSubClasses()
+
+    @classmethod
+    def __instanciateSubClasses(cls):
+        """
+
+        """
+
+        # Import bootimg-pcbios (class name "BootimgPcbiosPlugin")
+        modulePath = os.path.join(os.path.dirname(os.path.realpath(__file__)),
+                                  cls.__PCBIOS_MODULE_NAME + ".py")
+        loader = SourceFileLoader(cls.__PCBIOS_MODULE_NAME, modulePath)
+        mod = types.ModuleType(loader.name)
+        loader.exec_module(mod)
+        cls.__imgBiosObj = mod.BootimgPcbiosPlugin()
+
+        # Import bootimg-efi (class name "BootimgEFIPlugin")
+        modulePath = os.path.join(os.path.dirname(os.path.realpath(__file__)),
+                                  cls.__EFI_MODULE_NAME + ".py")
+        loader = SourceFileLoader(cls.__EFI_MODULE_NAME, modulePath)
+        mod = types.ModuleType(loader.name)
+        loader.exec_module(mod)
+        cls.__imgEFIObj = mod.BootimgEFIPlugin()
+
+    @classmethod
+    def do_install_disk(cls, disk, disk_name, creator, workdir, oe_builddir,
+                        bootimg_dir, kernel_dir, native_sysroot):
+        """
+        Called after all partitions have been prepared and assembled into a
+        disk image.
+        """
+
+        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+            cls.__instanciateSubClasses()
+
+        cls.__imgEFIObj.do_install_disk(
+            disk,
+            disk_name,
+            creator,
+            workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            native_sysroot)
+
+        cls.__imgBiosObj.do_install_disk(
+            disk,
+            disk_name,
+            creator,
+            workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            native_sysroot)
+
+    @classmethod
+    def do_configure_partition(cls, part, source_params, creator, cr_workdir,
+                               oe_builddir, bootimg_dir, kernel_dir,
+                               native_sysroot):
+        """
+        Called before do_prepare_partition()
+        """
+
+        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+            cls.__instanciateSubClasses()
+
+        cls.__imgEFIObj.do_configure_partition(
+            part,
+            source_params,
+            creator,
+            cr_workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            native_sysroot)
+
+        cls.__imgBiosObj.do_configure_partition(
+            part,
+            source_params,
+            creator,
+            cr_workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            native_sysroot)
+
+    @classmethod
+    def do_prepare_partition(cls, part, source_params, creator, cr_workdir,
+                             oe_builddir, bootimg_dir, kernel_dir,
+                             rootfs_dir, native_sysroot):
+        """
+        Called to do the actual content population for a partition i.e. it
+        'prepares' the partition to be incorporated into the image.
+        """
+
+        if ( (not cls.__imgEFIObj) or (not cls.__imgBiosObj) ):
+            cls.__instanciateSubClasses()
+
+        cls.__imgEFIObj.do_prepare_partition(
+            part,
+            source_params,
+            creator,
+            cr_workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            rootfs_dir,
+            native_sysroot)
+
+        cls.__imgBiosObj.do_prepare_partition(
+            part,
+            source_params,
+            creator,
+            cr_workdir,
+            oe_builddir,
+            bootimg_dir,
+            kernel_dir,
+            rootfs_dir,
+            native_sysroot)
-- 
2.17.1


