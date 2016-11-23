Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2962271ACD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:08:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP; 23 Nov 2016 15:08:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,540,1473145200"; d="scan'208";a="34905238"
Received: from unknown (HELO aehernan-MOBL1.zpn.intel.com) ([10.219.18.92])
	by orsmga005.jf.intel.com with ESMTP; 23 Nov 2016 15:08:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Nov 2016 17:08:38 -0600
Message-Id: <96af72889ea11f0cd68962a045cdd8378edf96ec.1479942307.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1479942307.git.alejandro.hernandez@linux.intel.com>
References: <cover.1479942307.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/2] systemd-boot: Completely replaces gummiboot with systemd-boot
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
X-List-Received-Date: Wed, 23 Nov 2016 23:08:40 -0000

After systemd-boot was introduced, its been tested for a while with no major
issues being found until now, this patch completely replaces all gummiboot
instances with systemd-boot ones, taking the next step into cleaning
up systemd-boot/gummiboot.

[YOCTO #10332]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/fs-uuid.bbclass                       |  2 +-
 meta/classes/systemd-boot.bbclass                  |  4 +---
 meta/conf/distro/include/distro_alias.inc          |  2 +-
 meta/lib/oeqa/controllers/masterimage.py           |  4 ++--
 meta/lib/oeqa/selftest/wic.py                      |  6 ++---
 meta/recipes-bsp/systemd-boot/systemd-boot.bb      |  2 +-
 .../initrdscripts/files/init-install-efi-testfs.sh | 12 +++++-----
 .../initrdscripts/files/init-install-efi.sh        | 12 +++++-----
 scripts/contrib/mkefidisk.sh                       | 26 +++++++++++-----------
 scripts/lib/wic/plugins/source/bootimg-efi.py      | 22 +++++++++---------
 10 files changed, 44 insertions(+), 48 deletions(-)

diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
index bd2613c..1d5d0c3 100644
--- a/meta/classes/fs-uuid.bbclass
+++ b/meta/classes/fs-uuid.bbclass
@@ -13,7 +13,7 @@ def get_rootfs_uuid(d):
     bb.fatal('Could not determine filesystem UUID of %s' % rootfs)
 
 # Replace the special <<uuid-of-rootfs>> inside a string (like the
-# root= APPEND string in a syslinux.cfg or gummiboot entry) with the
+# root= APPEND string in a syslinux.cfg or systemd-boot entry) with the
 # actual UUID of the rootfs. Does nothing if the special string
 # is not used.
 def replace_rootfs_uuid(d, string):
diff --git a/meta/classes/systemd-boot.bbclass b/meta/classes/systemd-boot.bbclass
index 05244c7..3398218 100644
--- a/meta/classes/systemd-boot.bbclass
+++ b/meta/classes/systemd-boot.bbclass
@@ -4,9 +4,7 @@
 
 # systemd-boot.bbclass - The "systemd-boot" is essentially the gummiboot merged into systemd.
 #                        The original standalone gummiboot project is dead without any more
-#                        maintenance. As a start point, we replace all gummitboot occurrences
-#                        with systemd-boot in gummiboot.bbclass to have a base version of this
-#                        systemd-boot.bbclass.
+#                        maintenance.
 #
 # Set EFI_PROVIDER = "systemd-boot" to use systemd-boot on your live images instead of grub-efi
 # (images built by image-live.bbclass or image-vm.bbclass)
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 10efb09..9c82854 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -135,7 +135,7 @@ DISTRO_PN_ALIAS_pn-gtk-doc = "Fedora=gtk-doc Ubuntu=gtk-doc"
 DISTRO_PN_ALIAS_pn-gtk-engines = "Fedora=gtk2-engines OpenSuSE=gtk2-engines Ubuntu=gtk2-engines Mandriva=gtk-engines2 Debian=gtk2-engines"
 DISTRO_PN_ALIAS_pn-gtk-sato-engine = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gtk-icon-utils-native = "OSPDT"
-DISTRO_PN_ALIAS_pn-gummiboot = "Debian=gummiboot Fedora=gummiboot"
+DISTRO_PN_ALIAS_pn-systemd-boot = "Ubuntu=systemd-boot Fedora=systemd-boot"
 DISTRO_PN_ALIAS_pn-hello-mod = "OE-Core"
 DISTRO_PN_ALIAS_pn-hostap-conf = "OE-Core"
 DISTRO_PN_ALIAS_pn-hwlatdetect = "OSPDT"
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 9ce3bf8..7fcbb6d 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -159,10 +159,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         self.power_cycle(self.connection)
 
 
-class GummibootTarget(MasterImageHardwareTarget):
+class SystemdbootTarget(MasterImageHardwareTarget):
 
     def __init__(self, d):
-        super(GummibootTarget, self).__init__(d)
+        super(SystemdbootTarget, self).__init__(d)
         # this the value we need to set in the LoaderEntryOneShot EFI variable
         # so the system boots the 'test' bootloader label and not the default
         # The first four bytes are EFI bits, and the rest is an utf-16le string
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..61081cc 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -243,9 +243,9 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
 
     @testcase(1349)
-    def test_mkgummidisk(self):
-        """Test creation of mkgummidisk image"""
-        image = "mkgummidisk"
+    def test_systemd-bootdisk(self):
+        """Test creation of systemd-bootdisk image"""
+        image = "systemd-bootdisk"
         self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
                                    % image).status)
         self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
index 7036664..602052c 100644
--- a/meta/recipes-bsp/systemd-boot/systemd-boot.bb
+++ b/meta/recipes-bsp/systemd-boot/systemd-boot.bb
@@ -15,7 +15,7 @@ EXTRA_OECONF = " --enable-gnuefi \
                  --disable-manpages \
                "
 
-# Imported from gummiboot recipe
+# Imported from the old gummiboot recipe
 TUNE_CCARGS_remove = "-mfpmath=sse"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index b562109..9c4b263 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -171,19 +171,19 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
 fi
 
 if [ -d /run/media/$1/loader ]; then
-    GUMMIBOOT_CFGS="/ssd/loader/entries/*.conf"
-    # copy config files for gummiboot
+    SYSTEMDBOOT_CFGS="/ssd/loader/entries/*.conf"
+    # copy config files for systemd-boot
     cp -dr /run/media/$1/loader /ssd
     # delete the install entry
     rm -f /ssd/loader/entries/install.conf
     # delete the initrd lines
-    sed -i "/initrd /d" $GUMMIBOOT_CFGS
+    sed -i "/initrd /d" $SYSTEMDBOOT_CFGS
     # delete any LABEL= strings
-    sed -i "s/ LABEL=[^ ]*/ /" $GUMMIBOOT_CFGS
+    sed -i "s/ LABEL=[^ ]*/ /" $SYSTEMDBOOT_CFGS
     # delete any root= strings
-    sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
+    sed -i "s/ root=[^ ]*/ /" $SYSTEMDBOOT_CFGS
     # add the root= and other standard boot options
-    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    sed -i "s@options *@options root=$rootfs rw $rootwait quiet @" $SYSTEMDBOOT_CFGS
     # Add the test label
     echo -ne "title test\nlinux /test-kernel\noptions root=$testfs rw $rootwait quiet\n" > /ssd/loader/entries/test.conf
 fi
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index ffb709c..5ad3a60 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -245,19 +245,19 @@ fi
 
 if [ -d /run/media/$1/loader ]; then
     rootuuid=$(blkid -o value -s PARTUUID ${rootfs})
-    GUMMIBOOT_CFGS="/boot/loader/entries/*.conf"
-    # copy config files for gummiboot
+    SYSTEMDBOOT_CFGS="/boot/loader/entries/*.conf"
+    # copy config files for systemd-boot
     cp -dr /run/media/$1/loader /boot
     # delete the install entry
     rm -f /boot/loader/entries/install.conf
     # delete the initrd lines
-    sed -i "/initrd /d" $GUMMIBOOT_CFGS
+    sed -i "/initrd /d" $SYSTEMDBOOT_CFGS
     # delete any LABEL= strings
-    sed -i "s/ LABEL=[^ ]*/ /" $GUMMIBOOT_CFGS
+    sed -i "s/ LABEL=[^ ]*/ /" $SYSTEMDBOOT_CFGS
     # delete any root= strings
-    sed -i "s/ root=[^ ]*/ /" $GUMMIBOOT_CFGS
+    sed -i "s/ root=[^ ]*/ /" $SYSTEMDBOOT_CFGS
     # add the root= and other standard boot options
-    sed -i "s@options *@options root=PARTUUID=$rootuuid rw $rootwait quiet @" $GUMMIBOOT_CFGS
+    sed -i "s@options *@options root=PARTUUID=$rootuuid rw $rootwait quiet @" $SYSTEMDBOOT_CFGS
 fi
 
 umount /tgt_root
diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index a175895..800733f 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -384,7 +384,7 @@ EFIDIR="$BOOTFS_MNT/EFI/BOOT"
 cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy vmlinuz"
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
 cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy EFI dir"
-# Silently ignore a missing gummiboot loader dir (we might just be a GRUB image)
+# Silently ignore a missing systemd-boot loader dir (we might just be a GRUB image)
 cp -r $HDDIMG_MNT/loader $BOOTFS_MNT >$OUT 2>&1
 
 # Update the boot loaders configurations for an installed image
@@ -410,25 +410,25 @@ if [ -e "$GRUB_CFG" ]; then
 	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GRUB_CFG
 fi
 
-# Look for a gummiboot installation
-GUMMI_ENTRIES="$BOOTFS_MNT/loader/entries"
-GUMMI_CFG="$GUMMI_ENTRIES/boot.conf"
-if [ -d "$GUMMI_ENTRIES" ]; then
-	info "Configuring Gummiboot"
+# Look for a systemd-boot installation
+SYSTEMD_BOOT_ENTRIES="$BOOTFS_MNT/loader/entries"
+SYSTEMD_BOOT_CFG="$SYSTEMD_BOOT_ENTRIES/boot.conf"
+if [ -d "$SYSTEMD_BOOT_ENTRIES" ]; then
+	info "Configuring SystemD-boot"
 	# remove the install target if it exists
-	rm $GUMMI_ENTRIES/install.conf >$OUT 2>&1
+	rm $SYSTEMD_BOOT_ENTRIES/install.conf >$OUT 2>&1
 
-	if [ ! -e "$GUMMI_CFG" ]; then
-		echo "ERROR: $GUMMI_CFG not found"
+	if [ ! -e "$SYSTEMD_BOOT_CFG" ]; then
+		echo "ERROR: $SYSTEMD_BOOT_CFG not found"
 	fi
 
-	sed -i "/initrd /d" $GUMMI_CFG
-	sed -i "s@ root=[^ ]*@ @" $GUMMI_CFG
-	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GUMMI_CFG
+	sed -i "/initrd /d" $SYSTEMD_BOOT_CFG
+	sed -i "s@ root=[^ ]*@ @" $SYSTEMD_BOOT_CFG
+	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $SYSTEMD_BOOT_CFG
 fi
 
 # Ensure we have at least one EFI bootloader configured
-if [ ! -e $GRUB_CFG ] && [ ! -e $GUMMI_CFG ]; then
+if [ ! -e $GRUB_CFG ] && [ ! -e $SYSTEMD_BOOT_CFG ]; then
 	die "No EFI bootloader configuration found"
 fi
 
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 4adb80b..305e910 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -36,7 +36,7 @@ from wic.utils.oe.misc import exec_cmd, exec_native_cmd, get_bitbake_var, \
 class BootimgEFIPlugin(SourcePlugin):
     """
     Create EFI boot partition.
-    This plugin supports GRUB 2 and gummiboot bootloaders.
+    This plugin supports GRUB 2 and systemd-boot bootloaders.
     """
 
     name = 'bootimg-efi'
@@ -82,7 +82,7 @@ class BootimgEFIPlugin(SourcePlugin):
         cfg.close()
 
     @classmethod
-    def do_configure_gummiboot(cls, hdddir, creator, cr_workdir):
+    def do_configure_systemdboot(cls, hdddir, creator, cr_workdir):
         """
         Create loader-specific systemd-boot/gummiboot config
         """
@@ -98,7 +98,7 @@ class BootimgEFIPlugin(SourcePlugin):
         loader_conf += "default boot\n"
         loader_conf += "timeout %d\n" % bootloader.timeout
 
-        msger.debug("Writing gummiboot config %s/hdd/boot/loader/loader.conf" \
+        msger.debug("Writing systemd-boot config %s/hdd/boot/loader/loader.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/loader.conf" % cr_workdir, "w")
         cfg.write(loader_conf)
@@ -109,16 +109,16 @@ class BootimgEFIPlugin(SourcePlugin):
         if configfile:
             custom_cfg = get_custom_config(configfile)
             if custom_cfg:
-                # Use a custom configuration for gummiboot
+                # Use a custom configuration for systemd-boot
                 boot_conf = custom_cfg
                 msger.debug("Using custom configuration file "
-                        "%s for gummiboots's boot.conf" % configfile)
+                        "%s for systemd-boots's boot.conf" % configfile)
             else:
                 msger.error("configfile is specified but failed to "
                         "get it from %s." % configfile)
 
         if not custom_cfg:
-            # Create gummiboot configuration using parameters from wks file
+            # Create systemd-boot configuration using parameters from wks file
             kernel = "/bzImage"
 
             boot_conf = ""
@@ -127,7 +127,7 @@ class BootimgEFIPlugin(SourcePlugin):
             boot_conf += "options LABEL=Boot root=%s %s\n" % \
                              (creator.rootdev, bootloader.append)
 
-        msger.debug("Writing gummiboot config %s/hdd/boot/loader/entries/boot.conf" \
+        msger.debug("Writing systemd-boot config %s/hdd/boot/loader/entries/boot.conf" \
                         % cr_workdir)
         cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
         cfg.write(boot_conf)
@@ -149,9 +149,8 @@ class BootimgEFIPlugin(SourcePlugin):
         try:
             if source_params['loader'] == 'grub-efi':
                 cls.do_configure_grubefi(hdddir, creator, cr_workdir)
-            elif source_params['loader'] == 'gummiboot' \
-                 or source_params['loader'] == 'systemd-boot':
-                cls.do_configure_gummiboot(hdddir, creator, cr_workdir)
+            elif source_params['loader'] == 'systemd-boot':
+                cls.do_configure_systemdboot(hdddir, creator, cr_workdir)
             else:
                 msger.error("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -190,8 +189,7 @@ class BootimgEFIPlugin(SourcePlugin):
                 exec_cmd(cp_cmd, True)
                 shutil.move("%s/grub.cfg" % cr_workdir,
                             "%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir)
-            elif source_params['loader'] == 'gummiboot' \
-                 or source_params['loader'] == 'systemd-boot':
+            elif source_params['loader'] == 'systemd-boot':
                 cp_cmd = "cp %s/EFI/BOOT/* %s/EFI/BOOT" % (bootimg_dir, hdddir)
                 exec_cmd(cp_cmd, True)
             else:
-- 
2.10.1


