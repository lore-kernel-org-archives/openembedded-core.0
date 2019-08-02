Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D35D67CDE4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 12:33:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Aug 2019 05:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="256971077"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga001.jf.intel.com with ESMTP; 02 Aug 2019 05:33:04 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Aug 2019 20:33:03 +0800
Message-Id: <1564749183-3162-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] systemd-boot:grub-efi:wic: add variable APPENDS for multiple boot configuration
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
X-List-Received-Date: Fri, 02 Aug 2019 12:33:05 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

introduce new variable APPENDS to define multiple
boot configuration for systemd-boot and grub-efi.

APPENDS set the different in kernel option for each .conf
file(for systemd-boot) or menuentry(for grub-efi).
Include the differences in the title.
Separate each configuration with ";".

e.g.:
APPEND = "console=tty0 rootwait"
APPENDS = " i915.enable_guc=0; i915.enable_guc=2"

for systemd-boot, above setting will produce 2 .conf,
boot-1.conf and boot-2.conf which set with below title and option:

boot-1.conf -
	title boot-1 i915.enable_guc=0
	option console=tty0 rootwait i915.enable_guc=0

boot-2.conf -
	title boot-2 i915.enable_guc=2
	option console=tty0 rootwait i915.enable_guc=2


also update oeqa/selftest/wic testcase to fit the new variable.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/classes/grub-efi-cfg.bbclass             | 46 +++++++-------
 meta/classes/image_types_wic.bbclass          |  2 +-
 meta/classes/systemd-boot-cfg.bbclass         | 75 +++++++++++++----------
 meta/lib/oeqa/selftest/cases/wic.py           |  2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py | 86 +++++++++++++++------------
 5 files changed, 118 insertions(+), 93 deletions(-)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index f661a69..811c78f 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -89,29 +89,31 @@ python build_efi_cfg() {
     for label in labels.split():
         localdata = d.createCopy()
 
+        initrd = localdata.getVar('INITRD')
+        append = localdata.getVar('APPEND')
+        appends = localdata.getVar('APPENDS') if localdata.getVar('APPENDS') else ""
         for btype in btypes:
-            cfgfile.write('\nmenuentry \'%s%s\'{\n' % (label, btype[0]))
-            lb = label
-            if label == "install":
-                lb = "install-efi"
-            kernel = localdata.getVar('KERNEL_IMAGETYPE')
-            cfgfile.write('linux /%s LABEL=%s' % (kernel, lb))
-
-            cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
-
-            append = localdata.getVar('APPEND')
-            initrd = localdata.getVar('INITRD')
-
-            if append:
-                append = replace_rootfs_uuid(d, append)
-                cfgfile.write(' %s' % (append))
-
-            cfgfile.write(' %s' % btype[1])
-            cfgfile.write('\n')
-
-            if initrd:
-                cfgfile.write('initrd /initrd')
-            cfgfile.write('\n}\n')
+            for apd in appends.split(';'):
+                cfgfile.write('\nmenuentry \'%s%s %s\'{\n' % (label, btype[0],apd))
+                lb = label
+                if label == "install":
+                    lb = "install-efi"
+                kernel = localdata.getVar('KERNEL_IMAGETYPE')
+                cfgfile.write('linux /%s LABEL=%s' % (kernel, lb))
+
+                cfgfile.write(' %s' % replace_rootfs_uuid(d, root))
+
+                ap = append + apd
+                if ap:
+                    append = replace_rootfs_uuid(d, ap)
+                    cfgfile.write(' %s' % (ap))
+
+                cfgfile.write(' %s' % btype[1])
+                cfgfile.write('\n')
+
+                if initrd:
+                    cfgfile.write('initrd /initrd')
+                cfgfile.write('\n}\n')
 
     cfgfile.close()
 }
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 519aeb1..4f2bdcc 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -3,7 +3,7 @@
 WICVARS ?= "\
            BBLAYERS IMGDEPLOYDIR DEPLOY_DIR_IMAGE FAKEROOTCMD IMAGE_BASENAME IMAGE_BOOT_FILES \
            IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD INITRD_LIVE ISODIR RECIPE_SYSROOT_NATIVE \
-           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS \
+           ROOTFS_SIZE STAGING_DATADIR STAGING_DIR STAGING_LIBDIR TARGET_SYS APPENDS \
            KERNEL_IMAGETYPE MACHINE INITRAMFS_IMAGE INITRAMFS_IMAGE_BUNDLE INITRAMFS_LINK_NAME"
 
 inherit ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
diff --git a/meta/classes/systemd-boot-cfg.bbclass b/meta/classes/systemd-boot-cfg.bbclass
index b3e0e6a..fddbfad 100644
--- a/meta/classes/systemd-boot-cfg.bbclass
+++ b/meta/classes/systemd-boot-cfg.bbclass
@@ -19,6 +19,12 @@ python build_efi_cfg() {
         bb.debug(1, "No labels, nothing to do")
         return
 
+    #remove conf file from previous build
+    files = os.listdir(s)
+    for file in files:
+        if file.endswith(".conf"):
+            os.unlink(file)
+
     cfile = d.getVar('SYSTEMD_BOOT_CFG')
     cdir = os.path.dirname(cfile)
     if not os.path.exists(cdir):
@@ -37,35 +43,44 @@ python build_efi_cfg() {
         cfgfile.write('timeout 10\n')
     cfgfile.close()
 
+    appends = d.getVar('APPENDS') if d.getVar('APPENDS') else ""
+
     for label in labels.split():
-        localdata = d.createCopy()
-
-        entryfile = "%s/%s.conf" % (s, label)
-        if not os.path.exists(s):
-            os.makedirs(s)
-        d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
-        try:
-            entrycfg = open(entryfile, "w")
-        except OSError:
-            bb.fatal('Unable to open %s' % entryfile)
-
-        entrycfg.write('title %s\n' % label)
-
-        kernel = localdata.getVar("KERNEL_IMAGETYPE")
-        entrycfg.write('linux /%s\n' % kernel)
-
-        append = localdata.getVar('APPEND')
-        initrd = localdata.getVar('INITRD')
-
-        if initrd:
-            entrycfg.write('initrd /initrd\n')
-        lb = label
-        if label == "install":
-            lb = "install-efi"
-        entrycfg.write('options LABEL=%s ' % lb)
-        if append:
-            append = replace_rootfs_uuid(d, append)
-            entrycfg.write('%s' % append)
-        entrycfg.write('\n')
-        entrycfg.close()
+        conf_count = 0
+        for apd in appends.split(';'):
+            conf_title = "%s-%s" % ( label, conf_count) if apd else label
+            localdata = d.createCopy()
+
+            entryfile = "%s/%s.conf" % (s, conf_title)
+            if not os.path.exists(s):
+                os.makedirs(s)
+            d.appendVar("SYSTEMD_BOOT_ENTRIES", " " + entryfile)
+            try:
+                entrycfg = open(entryfile, "w")
+            except OSError:
+                bb.fatal('Unable to open %s' % entryfile)
+
+            entrycfg.write('title %s %s\n' % (conf_title, apd) )
+
+            kernel = localdata.getVar("KERNEL_IMAGETYPE")
+            entrycfg.write('linux /%s\n' % kernel)
+
+            append = localdata.getVar('APPEND')
+            initrd = localdata.getVar('INITRD')
+
+            if initrd:
+                entrycfg.write('initrd /initrd\n')
+            lb = label
+            if label == "install":
+                lb = "install-efi"
+            entrycfg.write('options LABEL=%s ' % lb)
+
+            ap = append + apd
+            if ap:
+                append = replace_rootfs_uuid(d, ap)
+                entrycfg.write('%s' % ap)
+
+            entrycfg.write('\n')
+            entrycfg.close()
+            conf_count += 1
 }
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index fcdd550..cee8776 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -498,7 +498,7 @@ class Wic2(WicTestCase):
 
         wicvars = set(bb_vars['WICVARS'].split())
         # filter out optional variables
-        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES',
+        wicvars = wicvars.difference(('DEPLOY_DIR_IMAGE', 'IMAGE_BOOT_FILES', 'APPENDS',
                                       'INITRD', 'INITRD_LIVE', 'ISODIR','INITRAMFS_IMAGE',
                                       'INITRAMFS_IMAGE_BUNDLE', 'INITRAMFS_LINK_NAME'))
         with open(path) as envfile:
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10..5977ab0 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -65,37 +65,39 @@ class BootimgEFIPlugin(SourcePlugin):
         if not custom_cfg:
             # Create grub configuration using parameters from wks file
             bootloader = creator.ks.bootloader
-            title = source_params.get('title')
+            title = source_params.get('title') if source_params.get('title') else "boot"
 
             grubefi_conf = ""
             grubefi_conf += "serial --unit=0 --speed=115200 --word=8 --parity=no --stop=1\n"
             grubefi_conf += "default=boot\n"
             grubefi_conf += "timeout=%s\n" % bootloader.timeout
-            grubefi_conf += "menuentry '%s'{\n" % (title if title else "boot")
 
-            kernel = get_bitbake_var("KERNEL_IMAGETYPE")
-            if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
-                if get_bitbake_var("INITRAMFS_IMAGE"):
-                    kernel = "%s-%s.bin" % \
-                        (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
+            appends = get_bitbake_var("APPENDS") if get_bitbake_var("APPENDS") else ""
+            for apd in appends.split(';'):
+                grubefi_conf += "menuentry '%s %s'{\n" % (title, apd )
 
-            label = source_params.get('label')
-            label_conf = "root=%s" % creator.rootdev
-            if label:
-                label_conf = "LABEL=%s" % label
+                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+                if get_bitbake_var("INITRAMFS_IMAGE_BUNDLE") == "1":
+                    if get_bitbake_var("INITRAMFS_IMAGE"):
+                        kernel = "%s-%s.bin" % \
+                            (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
-            grubefi_conf += "linux /%s %s rootwait %s\n" \
-                % (kernel, label_conf, bootloader.append)
+                label = source_params.get('label')
+                label_conf = "root=%s" % creator.rootdev
+                if label:
+                    label_conf = "LABEL=%s" % label
 
-            if initrd:
-                initrds = initrd.split(';')
-                grubefi_conf += "initrd"
-                for rd in initrds:
-                    grubefi_conf += " /%s" % rd
-                grubefi_conf += "\n"
+                grubefi_conf += "linux /%s %s rootwait %s %s\n" \
+                    % (kernel, label_conf, bootloader.append, apd)
 
-            grubefi_conf += "}\n"
+                if initrd:
+                    initrds = initrd.split(';')
+                    grubefi_conf += "initrd"
+                    for rd in initrds:
+                        grubefi_conf += " /%s" % rd
+                    grubefi_conf += "\n"
 
+                grubefi_conf += "}\n"
         logger.debug("Writing grubefi config %s/hdd/boot/EFI/BOOT/grub.cfg",
                      cr_workdir)
         cfg = open("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir, "w")
@@ -161,30 +163,36 @@ class BootimgEFIPlugin(SourcePlugin):
                     kernel = "%s-%s.bin" % \
                         (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_var("INITRAMFS_LINK_NAME"))
 
-            title = source_params.get('title')
+            title = source_params.get('title') if source_params.get('title') else "boot"
+            appends = get_bitbake_var("APPENDS") if get_bitbake_var("APPENDS") else ""
+            conf_count = 0
+            for apd in appends.split(';'):
+                conf_title = "%s-%s" % ( title, conf_count) if apd else title
 
-            boot_conf = ""
-            boot_conf += "title %s\n" % (title if title else "boot")
-            boot_conf += "linux /%s\n" % kernel
+                boot_conf = ""
+                boot_conf += "title %s %s\n" % ( conf_title, apd )
+                boot_conf += "linux /%s\n" % kernel
 
-            label = source_params.get('label')
-            label_conf = "LABEL=Boot root=%s" % creator.rootdev
-            if label:
-                label_conf = "LABEL=%s" % label
+                label = source_params.get('label')
+                label_conf = "LABEL=Boot root=%s" % creator.rootdev
+                if label:
+                    label_conf = "LABEL=%s" % label
 
-            boot_conf += "options %s %s\n" % \
-                             (label_conf, bootloader.append)
+                boot_conf += "options %s %s %s\n" % \
+                                 (label_conf, bootloader.append, apd)
 
-            if initrd:
-                initrds = initrd.split(';')
-                for rd in initrds:
-                    boot_conf += "initrd /%s\n" % rd
+                if initrd:
+                    initrds = initrd.split(';')
+                    for rd in initrds:
+                        boot_conf += "initrd /%s\n" % rd
 
-        logger.debug("Writing systemd-boot config "
-                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
-        cfg = open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir, "w")
-        cfg.write(boot_conf)
-        cfg.close()
+                conf_count += 1
+
+                logger.debug("Writing systemd-boot config "
+                             "%s/hdd/boot/loader/entries/%s.conf" % (cr_workdir, conf_title))
+                cfg = open("%s/hdd/boot/loader/entries/%s.conf" % (cr_workdir, conf_title), "w")
+                cfg.write(boot_conf)
+                cfg.close()
 
 
     @classmethod
-- 
2.7.4


