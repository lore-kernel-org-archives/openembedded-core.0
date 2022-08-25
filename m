Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567E8C28D13
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 13:38:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.23918.1661434680159918670
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 06:38:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77D85D6E;
	Thu, 25 Aug 2022 06:38:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CC6A3F71A;
	Thu, 25 Aug 2022 06:37:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [PATCH][kirkstone 5/6] wic/bootimg-efi: use cross objcopy when
 building unified kernel image
Date: Thu, 25 Aug 2022 14:37:51 +0100
Message-Id: <20220825133752.1660005-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825133752.1660005-1-ross.burton@arm.com>
References: <20220825133752.1660005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 13:38:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169870

We can't rely on the host objcopy knowing how to process target binaries,
so use the cross objcopy in the sysroot instead.

Also construct the command argument-by-argument as the format expression
was getting unwieldy.

(From OE-Core rev: 0264aeedbf21e9e7a104243c11b3b57f00e38bda)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/=
wic/plugins/source/bootimg-efi.py
index 0391aebdc84..a65a5b97804 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -326,21 +326,20 @@ class BootimgEFIPlugin(SourcePlugin):
                 exec_cmd(install_cmd)
=20
                 staging_dir_host =3D get_bitbake_var("STAGING_DIR_HOST")
+                target_sys =3D get_bitbake_var("TARGET_SYS")
=20
                 # https://www.freedesktop.org/software/systemd/man/syste=
md-stub.html
-                objcopy_cmd =3D "objcopy \
-                    --add-section .osrel=3D%s --change-section-vma .osre=
l=3D0x20000 \
-                    --add-section .cmdline=3D%s --change-section-vma .cm=
dline=3D0x30000 \
-                    --add-section .linux=3D%s --change-section-vma .linu=
x=3D0x2000000 \
-                    --add-section .initrd=3D%s --change-section-vma .ini=
trd=3D0x3000000 \
-                    %s %s" % \
-                    ("%s/usr/lib/os-release" % staging_dir_host,
-                    cmdline.name,
-                    "%s/%s" % (staging_kernel_dir, kernel),
-                    initrd.name,
-                    efi_stub,
-                    "%s/EFI/Linux/linux.efi" % hdddir)
-                exec_cmd(objcopy_cmd)
+                objcopy_cmd =3D "%s-objcopy" % target_sys
+                objcopy_cmd +=3D " --add-section .osrel=3D%s/usr/lib/os-=
release" % staging_dir_host
+                objcopy_cmd +=3D " --change-section-vma .osrel=3D0x20000=
"
+                objcopy_cmd +=3D " --add-section .cmdline=3D%s" % cmdlin=
e.name
+                objcopy_cmd +=3D " --change-section-vma .cmdline=3D0x300=
00"
+                objcopy_cmd +=3D " --add-section .linux=3D%s/%s" % (stag=
ing_kernel_dir, kernel)
+                objcopy_cmd +=3D " --change-section-vma .linux=3D0x20000=
00"
+                objcopy_cmd +=3D " --add-section .initrd=3D%s" % initrd.=
name
+                objcopy_cmd +=3D " --change-section-vma .initrd=3D0x3000=
000"
+                objcopy_cmd +=3D " %s %s/EFI/Linux/linux.efi" % (efi_stu=
b, hdddir)
+                exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
             install_cmd =3D "install -m 0644 %s/%s %s/%s" % \
                 (staging_kernel_dir, kernel, hdddir, kernel)
--=20
2.34.1


