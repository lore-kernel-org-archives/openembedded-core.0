Received: from mail.klausen.dk (mail.klausen.dk [157.90.24.29])
 by mx.groups.io with SMTP id smtpd.web12.9678.1631097382249560628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 03:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@klausen.dk header.s=dkim header.b=J9LGgtuM;
 spf=pass (domain: klausen.dk, ip: 157.90.24.29, mailfrom: kristian@klausen.dk)
From: "Kristian Klausen" <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
	t=1631097379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OX9tXAJfVEGQ6GRZoKQzDkpt4FHpvOcO24zbNs4aYmc=;
	b=J9LGgtuM3JvtaHFxwiu2faEWa/yWyBynch1FJXdaAbb3yJ3pwOdpDGESNJcTw7SZM5zt93
	8fWQNqD9yEsWgcI+xJGMxS7FJyYHnYOTjPW/k6W1N9CF7hkoO4cTAiAEwLiIlEXgA8uRSx
	ceF8x4OgmkWLCOzE7HxdN9Hg8yz5MvU=
To: openembedded-core@lists.openembedded.org
Cc: Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH] wic/bootimg-efi: Add option for only installing the bootloader
Date: Wed,  8 Sep 2021 12:36:04 +0200
Message-Id: <20210908103604.222498-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

systemd-boot supports automatic detection of Unified Kernel Images[1] if
the are installed into $BOOT/EFI/Linux/ with a .efi extension. In that
case a boot entry isn't needed nor is the normal kernel as the Unified
Kernel Image would likely be installed with IMAGE_EFI_BOOT_FILES.

[1] https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kern=
el-images

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index cdc72543c2..f8aace823d 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -38,6 +38,9 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific (grub-efi) config
         """
+        if source_params.get('bootloader-only') =3D=3D "true":
+            return
+
         configfile =3D creator.ks.bootloader.configfile
         custom_cfg =3D None
         if configfile:
@@ -110,6 +113,9 @@ class BootimgEFIPlugin(SourcePlugin):
         """
         Create loader-specific systemd-boot/gummiboot config
         """
+        if source_params.get('bootloader-only') =3D=3D "true":
+            return
+
         install_cmd =3D "install -d %s/loader" % hdddir
         exec_cmd(install_cmd)
=20
@@ -288,9 +294,10 @@ class BootimgEFIPlugin(SourcePlugin):
                 kernel =3D "%s-%s.bin" % \
                     (get_bitbake_var("KERNEL_IMAGETYPE"), get_bitbake_va=
r("INITRAMFS_LINK_NAME"))
=20
-        install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
-            (staging_kernel_dir, kernel, hdddir, kernel)
-        exec_cmd(install_cmd)
+        if not source_params.get('bootloader-only') =3D=3D "true":
+            install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
+                (staging_kernel_dir, kernel, hdddir, kernel)
+            exec_cmd(install_cmd)
=20
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
--=20
2.25.1

