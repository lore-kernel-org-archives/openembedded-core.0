Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail.openembedded.org (Postfix) with ESMTP id DB0786D4C6
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 20:07:06 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id o13so35640418ljg.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 12:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=rc1W8eHJ3sRE3JiTl8HLNB20sN0v0E1QEplErjEiRCM=;
	b=n5mrd06tgL5CF3I7RogBtOlno1ksQPDMp/qJJtYuYWcA1SoUcPGEGTq7lfWBwmzACl
	wYl6LeIJx7oG2TqBAdEwf+HRAzzKD/1LBsqx982OXoI8v0gi4gjfE7ID5XD9JmKzEjO+
	JO51dXWQ/a0bj9kyHhAQuAWRChWYAxkRCSZC+2pc6nPwNRUBkKvVtz5CbmJZL7voqfQ2
	QEU2jhXgEFuTm9PlAFZrVvcriy0opvv286qwoAuuu5WJpspzhiCYgggT+jZxMp6K3/w5
	hjGd1ONS1Qp5SEwXdD9ThWedfITO5W8iVEbGDF0I7sJ89wsuh0ZW2l/D6xIi+4jWHgQQ
	5M5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rc1W8eHJ3sRE3JiTl8HLNB20sN0v0E1QEplErjEiRCM=;
	b=NwwQqlQDhCOEtj7CGG4Aj71rmRa/IdtGYZJkXJvSO2KZ22IxTy0VwI9MhEGOXEQ/jd
	Z6e9XX7+oUa19m+YzOhUzPykkXCEyt4nUqbrprvF2WBLsgz48il6OJh/F/8Zqs1941dK
	7o63YKAhWs7E4Dig0q8xMdvkI0oiEXRVUVfSYnCFW7lee26317p6p6THYghIqLzkhlKs
	aPAU8ZSjgiYJp1gVQhF6LAJqI8eWnlOeTqF5rillkruu7AcRnaETn1NFKsjEyl8UaE/Q
	cGMyu6HECpx2PonS5hPmq8k1Zh1/sB9e0x1hRZgy/plrdk9r3La/P5EI4VdKHwaUY+8I
	zHoA==
X-Gm-Message-State: APjAAAXdldwWUQ8ymHGCinBpiBzhWzO+Ed0ojA7fQoli2qga3MiCXuXe
	kJZb/9qJC+PsRTxMFgOLeWQtXEfvA30=
X-Google-Smtp-Source: APXvYqyBwCjITeQflYYriJTlwWgJarYvL+q5O8PiT8z2Ls9XMI9c5F0jA2kwEdlC8yFjXR0nfZcOHQ==
X-Received: by 2002:a2e:571d:: with SMTP id l29mr54415872ljb.193.1578168427129;
	Sat, 04 Jan 2020 12:07:07 -0800 (PST)
Received: from localhost.localdomain ([176.59.51.166])
	by smtp.gmail.com with ESMTPSA id
	i17sm24883868ljd.34.2020.01.04.12.07.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 12:07:06 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 23:07:03 +0300
Message-Id: <20200104200703.6758-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Sat, 04 Jan 2020 20:07:07 -0000

Linux kernel can be compiled as UEFI stub and loaded directly
with UEFI firmware without grub or other UEFI shell.

Tested with wic file:
bootloader  --ptable gpt --timeout=0  --append="rootwait"
part /boot --source bootimg-efi --sourceparams="loader=kernel" \
 --ondisk sda  --fstype=vfat --label bootfs \
  --active --align 1024 --use-uuid
part / --source rootfs --fstype=ext4 --label rootfs \
  --align 1024 --exclude-path boot/ --use-label
The same wic file for armv7, armv8 and x86_64.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..a39d852f6a 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -13,6 +13,7 @@
 import logging
 import os
 import shutil
+import re
 
 from wic import WicError
 from wic.engine import get_custom_config
@@ -204,6 +205,8 @@ class BootimgEFIPlugin(SourcePlugin):
                 cls.do_configure_grubefi(hdddir, creator, cr_workdir, source_params)
             elif source_params['loader'] == 'systemd-boot':
                 cls.do_configure_systemdboot(hdddir, creator, cr_workdir, source_params)
+            elif source_params['loader'] == 'kernel':
+                return
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -243,6 +246,7 @@ class BootimgEFIPlugin(SourcePlugin):
             if source_params['loader'] == 'grub-efi':
                 shutil.copyfile("%s/hdd/boot/EFI/BOOT/grub.cfg" % cr_workdir,
                                 "%s/grub.cfg" % cr_workdir)
+
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("grub-efi-")]:
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[9:])
                     exec_cmd(cp_cmd, True)
@@ -252,6 +256,29 @@ class BootimgEFIPlugin(SourcePlugin):
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
+            elif source_params['loader'] == 'kernel':
+                kernel = get_bitbake_var("KERNEL_IMAGETYPE")
+                if not kernel:
+                    raise WicError("Empty KERNEL_IMAGETYPE %s\n" % target)
+                target = get_bitbake_var("TARGET_SYS")
+                if not target:
+                    raise WicError("Unknown arch (TARGET_SYS) %s\n" % target)
+
+                if re.match("x86_64", target):
+                    kernel_efi_image = "bootx64.efi"
+                elif re.match('i.86', target):
+                    kernel_efi_image = "bootia32.efi"
+                elif re.match('aarch64', target):
+                    kernel_efi_image = "bootaa64.efi"
+                elif re.match('arm', target):
+                    kernel_efi_image = "bootarm.efi"
+                else:
+                    raise WicError("kernel efi is incompatible with target %s" % target)
+
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith(kernel)]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
+                    WicError("cp_cmd = %s" % cp_cmd);
+                    exec_cmd(cp_cmd, True)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
-- 
2.17.1


