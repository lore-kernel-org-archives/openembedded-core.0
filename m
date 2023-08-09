Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C150EC001B0
	for <webhook@archiver.kernel.org>; Wed,  9 Aug 2023 20:14:51 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.1613.1691612087472864568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Aug 2023 13:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jWxx1/Pj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8982540005;
	Wed,  9 Aug 2023 20:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691612085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vos5yfFDLX3D0tZGPO6YM7pzccxbEB8e3W52iQYzHcY=;
	b=jWxx1/PjPNNWszSrF4QF1oem2rGRoyDrYIMSlI664GeNyqioWirsiqFUhAqn/OgD2vn+Zf
	CA40YUQEpwjjGksm9beuDxhpOdoNi0cVLn5lTadUDpSWO8ECqUOH5OvbQdnz1VhtwIQzZ/
	CJTjVrjLjNjHI35SSk95T4rRV7BK6IO/K2+69axYr1jFknDHRnR9ZeGEcLX+IXFtd/Besd
	/mbizTr2qqqFegxiwTywPgMiIcyCMXeEwtAdvam6PtcikXXloGFwhdELffQrUes7QGhUvD
	HpzINnb8D19jxjCqMH5dnxpQ/0VmvEIZQEoT9/FoUvT13FXAo8PRSHrGtQosRQ==
From: alexandre.belloni@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] wic: bootimg-efi: Stop hardcoding VMA offsets
Date: Wed,  9 Aug 2023 22:14:42 +0200
Message-ID: <20230809201442.910383-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Aug 2023 20:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185714

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Section VMA's are currently hardcoded. This doesn't work anymore starting
with systemd-boot v254.

Follow the actually solution to this which is documented here:
https://wiki.archlinux.org/title/Unified_kernel_image#Manually

This is also used by dracut. Later on, we may want to switch to ukify
instead but this is not ready yet.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 63 ++++++++++++++-----
 1 file changed, 49 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2bf737588753..4f30926f1ad7 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -332,37 +332,72 @@ class BootimgEFIPlugin(SourcePlugin):
                         shutil.copyfileobj(in_file, initrd)
                 initrd.close()
 
+                # Searched by systemd-boot:
+                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
+                install_cmd = "install -d %s/EFI/Linux" % hdddir
+                exec_cmd(install_cmd)
+
+                staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
+                target_sys = get_bitbake_var("TARGET_SYS")
+
+                objdump_cmd = "%s-objdump" % target_sys
+                objdump_cmd += " -p %s" % efi_stub
+                objdump_cmd += " | awk '{ if ($1 == \"SectionAlignment\"){print $2} }'"
+
+                ret, align_str = exec_native_cmd(objdump_cmd, native_sysroot)
+                align = int(align_str, 16)
+
+                objdump_cmd = "%s-objdump" % target_sys
+                objdump_cmd += " -h %s | tail -2" % efi_stub
+                ret, output = exec_native_cmd(objdump_cmd, native_sysroot)
+
+                offset = int(output.split()[2], 16) + int(output.split()[3], 16)
+
+                osrel_off = offset + align - offset % align
+                osrel_path = "%s/usr/lib/os-release" % staging_dir_host
+                osrel_sz = os.stat(osrel_path).st_size
+
+                cmdline_off = osrel_off + osrel_sz
+                cmdline_off = cmdline_off + align - cmdline_off % align
+                cmdline_sz = os.stat(cmdline.name).st_size
+
+                dtb_off = cmdline_off + cmdline_sz
+                dtb_off = dtb_off + align - dtb_off % align
+
                 dtb = source_params.get('dtb')
                 if dtb:
                     if ';' in dtb:
                         raise WicError("Only one DTB supported, exiting")
-                    dtb_params = '--add-section .dtb=%s/%s --change-section-vma .dtb=0x40000' % \
-                        (deploy_dir, dtb)
+                    dtb_path = "%s/%s" % (deploy_dir, dtb)
+                    dtb_params = '--add-section .dtb=%s --change-section-vma .dtb=0x%x' % \
+                            (dtb_path, dtb_off)
+                    linux_off = dtb_off + os.stat(dtb_path).st_size
+                    linux_off = linux_off + align - linux_off % align
                 else:
                     dtb_params = ''
+                    linux_off = dtb_off
 
-                # Searched by systemd-boot:
-                # https://systemd.io/BOOT_LOADER_SPECIFICATION/#type-2-efi-unified-kernel-images
-                install_cmd = "install -d %s/EFI/Linux" % hdddir
-                exec_cmd(install_cmd)
+                linux_path = "%s/%s" % (staging_kernel_dir, kernel)
+                linux_sz = os.stat(linux_path).st_size
 
-                staging_dir_host = get_bitbake_var("STAGING_DIR_HOST")
-                target_sys = get_bitbake_var("TARGET_SYS")
+                initrd_off = linux_off + linux_sz
+                initrd_off = initrd_off + align - initrd_off % align
 
                 # https://www.freedesktop.org/software/systemd/man/systemd-stub.html
                 objcopy_cmd = "%s-objcopy" % target_sys
                 objcopy_cmd += " --enable-deterministic-archives"
                 objcopy_cmd += " --preserve-dates"
-                objcopy_cmd += " --add-section .osrel=%s/usr/lib/os-release" % staging_dir_host
-                objcopy_cmd += " --change-section-vma .osrel=0x20000"
+                objcopy_cmd += " --add-section .osrel=%s" % osrel_path
+                objcopy_cmd += " --change-section-vma .osrel=0x%x" % osrel_off
                 objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
-                objcopy_cmd += " --change-section-vma .cmdline=0x30000"
+                objcopy_cmd += " --change-section-vma .cmdline=0x%x" % cmdline_off
                 objcopy_cmd += dtb_params
-                objcopy_cmd += " --add-section .linux=%s/%s" % (staging_kernel_dir, kernel)
-                objcopy_cmd += " --change-section-vma .linux=0x2000000"
+                objcopy_cmd += " --add-section .linux=%s" % linux_path
+                objcopy_cmd += " --change-section-vma .linux=0x%x" % linux_off
                 objcopy_cmd += " --add-section .initrd=%s" % initrd.name
-                objcopy_cmd += " --change-section-vma .initrd=0x3000000"
+                objcopy_cmd += " --change-section-vma .initrd=0x%x" % initrd_off
                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
+
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
             install_cmd = "install -m 0644 %s/%s %s/%s" % \
-- 
2.41.0


