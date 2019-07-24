Return-Path: <wbourque@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id EFCFE7D71B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 13:32:14 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r6so41240155qtt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L+7K9oJZ9oM5kCHmyGvMbkBRJ+VsV2Ny1ifPe9CRsuY=;
	b=uMW0CrCfh2d8afbIV+7DHr+HtEKM+Dqi7TU1bmjRoUOjdTAMxSyw0tDrNW8DBPJnd1
	MZjGoWfwZWca/RAE6aL/e7cd+OvWakJjWedsOSl1jA9cdowtJae34oGeGLWVb5S8zbnw
	GDfL+3zbMLspP+xe3fvw0nArXMAxEf4uBooC9EQCUyyg3+gyVJvBLi3WCsGMgANCmCuV
	U6cpzzYOZXymbDBO3nCVhwDHeVf/JvegZkSvpJmM0VfeRH9leTj4KSwJPXt3AXplTySE
	fbfhitS7j1wev7KWB07pElYiRCTQxDXlC/Z+viVpBaOaz+HYdfhUt5k1nhhbIvzLDzII
	4NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L+7K9oJZ9oM5kCHmyGvMbkBRJ+VsV2Ny1ifPe9CRsuY=;
	b=Ae6TA8HJLTnE4rQ9JAJFwjsEHZb4vxQoNtzuvNQz9nG//JDST2HGvyZ+RPq+ED7Ndp
	U2+GENKV3kWZa+1b3BuHSbrVU+6gwNdrWyNfAgT5L3xyMRVPi4FF/hVJ76+cWXKJasxN
	RSZ36/RBuUlv6510+A83kp+dVviGXX0p0aRg+GeN6KO/TtJznpWg8XiFBTiewSwUFTAQ
	RGFPjKSUyWpy854NEGsishMm1/y2oTB07O2akfp17oNPizJIH7cYO+f6ahkb6zMaN9NE
	xQR42nG5Aj6+sBDBLjXUpzTEv1x3TBJdRBy/sp6VotwfdgfqVZhtjJpgE6NODCz+ZiDB
	wINg==
X-Gm-Message-State: APjAAAUnPP5PKIlWhfKBzj+1fssTYpAcV2cNc72rP9pP8+2nda3kFtXX
	EbkHYmq4n2TwFsihuHCAgYLmSkcyrPk=
X-Google-Smtp-Source: APXvYqw6fZDEMoDqpJkG4zInxrOwHcy6omUnO0nbD0H494Bk5W5e7d8j/Ffs/KDTX9oHACoF4DVKdA==
X-Received: by 2002:a0c:afac:: with SMTP id s41mr59658961qvc.184.1563975135458;
	Wed, 24 Jul 2019 06:32:15 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id
	z50sm24637232qtz.36.2019.07.24.06.32.14
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 06:32:14 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 09:32:04 -0400
Message-Id: <20190724133205.31296-1-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH V4 1/2] wic/plugins: Source that support both EFI and BIOS
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
X-List-Received-Date: Wed, 24 Jul 2019 13:32:15 -0000

Add a source plugin that support both EFI and legacy PC-Bios.
While using this plugin, both bootloaders configurations reside
in the same /boot partitions.
This plugin has very little code : to avoid code duplication,
we simply re-import bootimg-pcbios and bootmg-efi source and
call both their SourcePlugin methods.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 .../wic/plugins/source/bootimg-biosplusefi.py | 213 ++++++++++++++++++
 1 file changed, 213 insertions(+)
 create mode 100644 scripts/lib/wic/plugins/source/bootimg-biosplusefi.py

diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
new file mode 100644
index 0000000000..5bd7390680
--- /dev/null
+++ b/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
@@ -0,0 +1,213 @@
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
+    Plugin "bootimg-pcbios" is used to generate legacy BIOS boot.
+    Plugin "bootimg-efi" is used to generate the UEFI boot. Note that it
+    requires a --sourceparams argument to know which loader to use; refer
+    to "bootimg-efi" code/documentation for the list of loader.
+
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


