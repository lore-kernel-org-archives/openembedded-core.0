Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web11.2860.1631210026584091286
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 10:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=R6+7VQa0;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631210023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ilQzPFDWH6+ueZI4g/cQIB71AFMv7zwPQgEaWTceS/E=;
	b=R6+7VQa0wocfeXjIrCgr0bOIlqUzHY3vXjPCj6Y1E9nSMxf9Iq3gnyotL9YBu+CuFVRDlu
	m5vDCOzXN1RrDV31sAPKki6jB4QLvJVA3+8UNvGwUMeTrfSCOQ2nQkKwH6zhyFcIfKEWqJ
	pA2HCOcwaT797N4PDCv2LJHO0Xr6BP4=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] wic/bootimg-efi: Add Unified Kernel Image option
Date: Thu,  9 Sep 2021 17:53:37 +0000
Message-Id: <20210909175337.624-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

This patch supersedes:
"[RFC][PATCH] kernel: Add Unified Kernel Image image type"[1]
and:
"[PATCH] wic/bootimg-efi: Add option for only installing the bootloader"[=
2]

The latter is perhaps still useful, but with this patch it is no longer
needed for using a Unified Kernel Image with systemd-boot.

[1] https://lists.openembedded.org/g/openembedded-core/message/155801
[2] https://lists.openembedded.org/g/openembedded-core/message/155789

 scripts/lib/wic/plugins/source/bootimg-efi.py | 69 ++++++++++++++++---
 1 file changed, 59 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index cdc72543c2..e3dc0604f5 100644
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
@@ -288,9 +291,55 @@ class BootimgEFIPlugin(SourcePlugin):
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
+            if initrd:
+                initrds =3D initrd.split(';')
+                if len(initrds) !=3D 1:
+                    raise WicError("initrd=3D must only referer a single=
 initrd, exiting")
+                initrd =3D initrds[0]
+            else:
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
+            with tempfile.NamedTemporaryFile(mode=3D"w+") as cmdline:
+                label =3D source_params.get('label')
+                label_conf =3D "root=3D%s" % creator.rootdev
+                if label:
+                    label_conf =3D "LABEL=3D%s" % label
+
+                bootloader =3D creator.ks.bootloader
+                cmdline.write("%s %s" % (label_conf, bootloader.append))
+                cmdline.flush()
+
+                # Searched by systemd-boot:
+                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-e=
fi-unified-kernel-images
+                install_cmd =3D "install -d %s/EFI/Linux" % hdddir
+                exec_cmd(install_cmd)
+
+                # https://github.com/systemd/systemd/blob/7728f6aa812f1a=
f563821505d9f377a7f4f727d9/test/test-efi-create-disk.sh#L32-L38
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
+                    ("%s/usr/lib/os-release" % rootfs_dir.get("ROOTFS_DI=
R"),
+                    cmdline.name,
+                    "%s/%s" % (staging_kernel_dir, kernel),
+                    "%s/%s" % (deploy_dir, initrd),
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

