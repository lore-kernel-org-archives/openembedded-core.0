Return-Path: <kristian@klausen.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB0CC433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 12:44:30 +0000 (UTC)
Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web12.13296.1632833068038439187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Sep 2021 05:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk
 header.s=dkim header.b=2z3V8QIC;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29,
 mailfrom: kristian@klausen.dk)
From: Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1632833064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j/irD0eNKR1OA/xn86pdKbSnHrqvD7qMv1goNETB02g=;
	b=2z3V8QICLjmjO7owj5VnkBIIksrTOE6i0OjqVdPoKZXfRTD5bmtzx7pI590VY1t7KfW21S
	aE9CI9z6Xyc1clhpBP2CT9qBr19U5AS+ot37WUr3MPbZIMnQGvwjvKw1GWwtTqrdkPeabV
	Iiwqkxd6rZWciuSNhtGRCunbxKv7DCM=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>,
	richard.purdie@linuxfoundation.org
Subject: [PATCH v3] wic/bootimg-efi: Add Unified Kernel Image option
Date: Tue, 28 Sep 2021 14:44:16 +0200
Message-Id: <20210928124416.33804-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 12:44:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156416

"A unified kernel image is a single EFI PE executable combining an EFI
stub loader, a kernel image, an initramfs image, and the kernel command
line.

[...]

Images of this type have the advantage that all metadata and payload
that makes up the boot entry is monopolized in a single PE file that can
be signed cryptographically as one for the purpose of EFI
SecureBoot."[1]

This commit adds a create-unified-kernel-image=3Dtrue option to the
bootimg-efi plugin for creating a Unified Kernel Image[1] and installing
it into $BOOT/EFI/Linux/ with a .efi extension per the the Boot Loader
Specification[1][2]. This is useful for implementing Secure Boot.

systemd-boot is the only mainstream bootloader implementing the
specification, but GRUB should be able to boot the EFI binary, this
commit however doesn't implement the necessary changes to the GRUB
config generation logic to boot the Unified Kernel Image.

[1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kern=
el-images
[2] https://systemd.io/BOOT_LOADER_SPECIFICATION/

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
V3:
Update objcopy link to the newly added systemd-stub manpage
Support specifying multiple initrds, which are then concatenated into
a single initrd (useful for providing microcodes to the kernel)

V2:
Add os-release as dependency
Pull os-release file from STAGING_DIR_HOST, so it doesn't need to be
installed into the rootfs
Add selftest

 meta-selftest/wic/test_efi_plugin.wks         |  6 ++
 meta/classes/image_types_wic.bbclass          |  5 +-
 meta/lib/oeqa/selftest/cases/wic.py           | 29 ++++++++
 scripts/lib/wic/plugins/source/bootimg-efi.py | 74 ++++++++++++++++---
 4 files changed, 102 insertions(+), 12 deletions(-)
 create mode 100644 meta-selftest/wic/test_efi_plugin.wks

diff --git a/meta-selftest/wic/test_efi_plugin.wks b/meta-selftest/wic/te=
st_efi_plugin.wks
new file mode 100644
index 0000000000..1603d6c4bb
--- /dev/null
+++ b/meta-selftest/wic/test_efi_plugin.wks
@@ -0,0 +1,6 @@
+# short-description: This file is used in oe-selftest wic module to test=
 efi plugin
+
+part /boot --source bootimg-efi --sourceparams=3D"loader=3Dsystemd-boot,=
create-unified-kernel-image=3Dtrue,initrd=3D${INITRAMFS_IMAGE}-${MACHINE}=
.${INITRAMFS_FSTYPES}" --active --align 1024 --use-uuid
+part / --source rootfs --fstype=3Dext4 --align 1024 --use-uuid
+
+bootloader  --timeout=3D0 --append=3D"console=3DttyS0,115200n8"
diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_ty=
pes_wic.bbclass
index d561fb2636..e3863c88a9 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -27,6 +27,7 @@ WICVARS ?=3D "\
 	ROOTFS_SIZE \
 	STAGING_DATADIR \
 	STAGING_DIR \
+	STAGING_DIR_HOST \
 	STAGING_LIBDIR \
 	TARGET_SYS \
 "
@@ -84,8 +85,8 @@ do_image_wic[deptask] +=3D "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ '=
x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-t=
ools-native squashfs-tools-native e2fsprogs-native"
 WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
-WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot"
-WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot os-=
release"
+WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot =
os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-x32 =3D "syslinux grub-efi"
=20
 WKS_FILE_DEPENDS ??=3D "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_B=
OOTLOADERS}"
diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest=
/cases/wic.py
index dc7b9e637e..5fc8e65142 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1158,6 +1158,35 @@ class Wic2(WicTestCase):
             out =3D glob(self.resultdir + "%s-*.direct" % wksname)
             self.assertEqual(1, len(out))
=20
+    @only_for_arch(['i586', 'i686', 'x86_64'])
+    def test_efi_plugin_unified_kernel_image_qemu(self):
+        """Test efi plugin's Unified Kernel Image feature in qemu"""
+        config =3D 'IMAGE_FSTYPES =3D "wic"\n'\
+                 'INITRAMFS_IMAGE =3D "core-image-minimal-initramfs"\n'\
+                 'WKS_FILE =3D "test_efi_plugin.wks"\n'\
+                 'MACHINE_FEATURES:append =3D " efi"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal core-image-minim=
al-initramfs ovmf').status)
+        self.remove_config(config)
+
+        with runqemu('core-image-minimal', ssh=3DFalse,
+                     runqemuparams=3D'ovmf', image_fstype=3D'wic') as qe=
mu:
+            # Check that /boot has EFI bootx64.efi (required for EFI)
+            cmd =3D "ls /boot/EFI/BOOT/bootx64.efi | wc -l"
+            status, output =3D qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s'=
 % (cmd, output))
+            self.assertEqual(output, '1')
+            # Check that /boot has EFI/Linux/linux.efi (required for Uni=
fied Kernel Images auto detection)
+            cmd =3D "ls /boot/EFI/Linux/linux.efi | wc -l"
+            status, output =3D qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s'=
 % (cmd, output))
+            self.assertEqual(output, '1')
+            # Check that /boot doesn't have loader/entries/boot.conf (Un=
ified Kernel Images are auto detected by the bootloader)
+            cmd =3D "ls /boot/loader/entries/boot.conf 2&>/dev/null | wc=
 -l"
+            status, output =3D qemu.run_serial(cmd)
+            self.assertEqual(1, status, 'Failed to run command "%s": %s'=
 % (cmd, output))
+            self.assertEqual(output, '0')
+
     def test_fs_types(self):
         """Test filesystem types for empty and not empty partitions"""
         img =3D 'core-image-minimal'
diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index cdc72543c2..0391aebdc8 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -12,6 +12,7 @@
=20
 import logging
 import os
+import tempfile
 import shutil
 import re
=20
@@ -119,12 +120,13 @@ class BootimgEFIPlugin(SourcePlugin):
         bootloader =3D creator.ks.bootloader
=20
         loader_conf =3D ""
-        loader_conf +=3D "default boot\n"
+        if source_params.get('create-unified-kernel-image') !=3D "true":
+            loader_conf +=3D "default boot\n"
         loader_conf +=3D "timeout %d\n" % bootloader.timeout
=20
         initrd =3D source_params.get('initrd')
=20
-        if initrd:
+        if initrd and source_params.get('create-unified-kernel-image') !=
=3D "true":
             # obviously we need to have a common common deploy var
             bootimg_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
             if not bootimg_dir:
@@ -183,11 +185,12 @@ class BootimgEFIPlugin(SourcePlugin):
                 for rd in initrds:
                     boot_conf +=3D "initrd /%s\n" % rd
=20
-        logger.debug("Writing systemd-boot config "
-                     "%s/hdd/boot/loader/entries/boot.conf", cr_workdir)
-        cfg =3D open("%s/hdd/boot/loader/entries/boot.conf" % cr_workdir=
, "w")
-        cfg.write(boot_conf)
-        cfg.close()
+        if source_params.get('create-unified-kernel-image') !=3D "true":
+            logger.debug("Writing systemd-boot config "
+                         "%s/hdd/boot/loader/entries/boot.conf", cr_work=
dir)
+            cfg =3D open("%s/hdd/boot/loader/entries/boot.conf" % cr_wor=
kdir, "w")
+            cfg.write(boot_conf)
+            cfg.close()
=20
=20
     @classmethod
@@ -288,9 +291,60 @@ class BootimgEFIPlugin(SourcePlugin):
                 kernel =3D "%s-%s.bin" % \
                     (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_va=
r("INITRAMFS_LINK_NAME"))
=20
-        install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
-            (staging_kernel_dir, kernel, hdddir, kernel)
-        exec_cmd(install_cmd)
+        if source_params.get('create-unified-kernel-image') =3D=3D "true=
":
+            initrd =3D source_params.get('initrd')
+            if not initrd:
+                raise WicError("initrd=3D must be specified when create-=
unified-kernel-image=3Dtrue, exiting")
+
+            deploy_dir =3D get_bitbake_var("DEPLOY_DIR_IMAGE")
+            efi_stub =3D glob("%s/%s" % (deploy_dir, "linux*.efi.stub"))
+            if len(efi_stub) =3D=3D 0:
+                raise WicError("Unified Kernel Image EFI stub not found,=
 exiting")
+            efi_stub =3D efi_stub[0]
+
+            with tempfile.TemporaryDirectory() as tmp_dir:
+                label =3D source_params.get('label')
+                label_conf =3D "root=3D%s" % creator.rootdev
+                if label:
+                    label_conf =3D "LABEL=3D%s" % label
+
+                bootloader =3D creator.ks.bootloader
+                cmdline =3D open("%s/cmdline" % tmp_dir, "w")
+                cmdline.write("%s %s" % (label_conf, bootloader.append))
+                cmdline.close()
+
+                initrds =3D initrd.split(';')
+                initrd =3D open("%s/initrd" % tmp_dir, "wb")
+                for f in initrds:
+                    with open("%s/%s" % (deploy_dir, f), 'rb') as in_fil=
e:
+                        shutil.copyfileobj(in_file, initrd)
+                initrd.close()
+
+                # Searched by systemd-boot:
+                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-e=
fi-unified-kernel-images
+                install_cmd =3D "install -d %s/EFI/Linux" % hdddir
+                exec_cmd(install_cmd)
+
+                staging_dir_host =3D get_bitbake_var("STAGING_DIR_HOST")
+
+                # https://www.freedesktop.org/software/systemd/man/syste=
md-stub.html
+                objcopy_cmd =3D "objcopy \
+                    --add-section .osrel=3D%s --change-section-vma .osre=
l=3D0x20000 \
+                    --add-section .cmdline=3D%s --change-section-vma .cm=
dline=3D0x30000 \
+                    --add-section .linux=3D%s --change-section-vma .linu=
x=3D0x2000000 \
+                    --add-section .initrd=3D%s --change-section-vma .ini=
trd=3D0x3000000 \
+                    %s %s" % \
+                    ("%s/usr/lib/os-release" % staging_dir_host,
+                    cmdline.name,
+                    "%s/%s" % (staging_kernel_dir, kernel),
+                    initrd.name,
+                    efi_stub,
+                    "%s/EFI/Linux/linux.efi" % hdddir)
+                exec_cmd(objcopy_cmd)
+        else:
+            install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
+                (staging_kernel_dir, kernel, hdddir, kernel)
+            exec_cmd(install_cmd)
=20
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
--=20
2.25.1


