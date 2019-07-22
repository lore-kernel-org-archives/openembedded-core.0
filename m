Return-Path: <wbourque@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id D45BC7ED36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 20:11:48 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id a186so25577727vsd.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2019 13:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=L+7K9oJZ9oM5kCHmyGvMbkBRJ+VsV2Ny1ifPe9CRsuY=;
	b=UA+KJKMQ4jgQMXXQ+TIi4f52vRqfbKwNASamhR3yGUOTXt07rxKB2f0mwfFbCCctsk
	3GPk9nWTkg4wU7W0/EsM9ymDE5AlJiAtL1n/0h+umoV+rJM62BkLO9Qm5YuiFnf5vqha
	gswNqHPcrt3oW3Y7zLd1Xc6Qzqpba6Xh7YiHxjywFYHqfKIQIZsp6tTMkA8FkXmW2FXW
	7vMWWCWTH/hrSVmBLQlTtY7HfTiRL5937NWoLNROYu3KDN28UJGR19F6HEp2glzqXZFN
	MWhWnv4PV6ZezT2MtePnJaCsvzbmiZlmem5U0lu8SlSSKfyR2Plra/nNh3eFT+AemIdr
	c2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=L+7K9oJZ9oM5kCHmyGvMbkBRJ+VsV2Ny1ifPe9CRsuY=;
	b=OvDpfczoMWKdFl5/Myf62F/detgjisGLAGQ74kX7aW3e9lYtf5md+5pTQD1hwlmjp2
	PiWFLrxB73BuECo2/eEJkJyZtT1es4mJmTN6NDuqcGYSNmA25f1Ie1J0QE88aj7u0G14
	lbD2w1WTzbqimd8MMWwkPAfqbXAiRCUAZELodJC4O0EHUnXfJaQWzDzAAAmNjzMnB12L
	CoDJ3bp1KEN7CdiTAQtKqghGZkEgzbBXl6U/NwhjsvY5buXYiqml7Vo6CVemKwZNRxg2
	3kDr8sryEM3Dg/LABFhoR6laTDLIEUk1pZ5adnI48gxuSjAp343dyVy5PwUhFAS1Pw3G
	YLkQ==
X-Gm-Message-State: APjAAAV25FGKd8WrAsA6Zcsd0qxPzGnvJPW3bOitLIsd2DGJKdIVO1yy
	C9U3+QMuaTp3AAOQ+OB9Cid1/l3+
X-Google-Smtp-Source: APXvYqycj9EmfCekCqoaceZVRsEMYO79MgVJOFDKxQioquBdtL0Nyva5g2IaUoY87oiwOAn6zoVJFA==
X-Received: by 2002:a67:f657:: with SMTP id u23mr9711080vso.154.1563826309468; 
	Mon, 22 Jul 2019 13:11:49 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id 66sm9261884vsh.12.2019.07.22.13.11.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 13:11:49 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2019 16:11:29 -0400
Message-Id: <20190722201130.13656-1-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [[PATCH V3 1/2] wic/plugins: Source that support both EFI and BIOS
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
X-List-Received-Date: Mon, 22 Jul 2019 20:11:49 -0000

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


