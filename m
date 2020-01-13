Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5E62F7FC1F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:14:42 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id v201so7868390lfa.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=JBTNLqK/FE6gyDsfcvKAvjISJ27jIzbXGKQ7LF14/OU=;
	b=VqO7ZkI2iJ9GZtCh+rd55zS1+jlRGCU+9trxnAXKMeEf7mK4nJRJzJ7PD2VfyX88Fh
	iAy6hGDfU+RmJGFFcGac8BGZWkPWAoSk1wQwuzqZeekkV+FwAUd+tu7Ym1SSX0PiE1uI
	6PR72Ozd3N+/We4EbKSkzHAtU4f6oBEzT0vECMgPlVQ75gCJvVuWUfUE7S1SIzUM+THN
	1W/FiwEHkuPGXPii1gVm56vx6JdXSetFjL0nyZ95IjDDUYiLa91xQxEGGLSxUrK5apAx
	AIdQCFCcthpAqgfFnGm/UMoua2aQocyaONAta9aRlw7DTWB82F5j48VOJXrXBX1xbeDO
	1qyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JBTNLqK/FE6gyDsfcvKAvjISJ27jIzbXGKQ7LF14/OU=;
	b=cCsEIHjCHsdoEFFr7cnc4RrUc8OX5oc45/+J/zX00ADh6XJFxeQsJ3kNc9DzpRCd+Z
	vH9+ZS8f7XB6X/WSzHBEI+xdkxxdNN37JQYbspxpxoNj6mUkh/eqaQYIO8xBpyMLS+Eo
	nM9cc1UDK+Fn2MDwI0jEn2jSlxCMu3RgDyCtasvwDaVZhGUGojCnzL3SwSTO7FGm/mj5
	NFiEO692zWUvUfgTej/XYRcejwQgyS3xF5S36Mruj8WXH3MR2DNVN87BQx6cOt2t3vKS
	q2ycazuqvn/61/Qv8GBECJYVKgez2paF99qF7vutdl2siK1V0CHCJ1eEWIegWu4PebBu
	EgBg==
X-Gm-Message-State: APjAAAWGSrCedlbJgOAsBDr0Aag36/GEVRfuO9XWoJseul3/fc6HgE2J
	tnMpblUdUOh+tjxQf7Tgvfg8M4IBSu0=
X-Google-Smtp-Source: APXvYqztMRPdLGsyJknhBqFb4w7y8RTnzITioOxudC55V76XB7qjDrYyUix/Nhv1hcJbnnX/u6CbAQ==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr11093773lfp.121.1578946482521; 
	Mon, 13 Jan 2020 12:14:42 -0800 (PST)
Received: from localhost.localdomain (128-68-30-100.broadband.corbina.ru.
	[128.68.30.100]) by smtp.gmail.com with ESMTPSA id
	o10sm6255029lfn.20.2020.01.13.12.14.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 12:14:41 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 23:14:38 +0300
Message-Id: <20200113201438.4640-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv2] wic: add UEFI kernel as UEFI stub
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
X-List-Received-Date: Mon, 13 Jan 2020 20:14:42 -0000

Linux kernel can be compiled as UEFI stub and loaded directly
with UEFI firmware without grub or other UEFI shell.

Tested with wic file:
bootloader  --ptable gpt --timeout=0  --append="rootwait"
part /boot --source bootimg-efi --sourceparams="loader=uefi-kernel" \
 --ondisk sda  --fstype=vfat --label bootfs \
  --active --align 1024 --use-uuid
part / --source rootfs --fstype=ext4 --label rootfs \
  --align 1024 --exclude-path boot/ --use-label
The same wic file for armv7, armv8 and x86_64.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
---
 v2: - use loader=uefi-kernel.
     - remove missed from debug WicError().
     - correct error message.

 scripts/lib/wic/plugins/source/bootimg-efi.py | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index 2cfdc10ecd..8d47ea55eb 100644
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
+            elif source_params['loader'] == 'uefi-kernel':
+                return
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" % source_params['loader'])
         except KeyError:
@@ -252,6 +255,28 @@ class BootimgEFIPlugin(SourcePlugin):
                 for mod in [x for x in os.listdir(kernel_dir) if x.startswith("systemd-")]:
                     cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, mod[8:])
                     exec_cmd(cp_cmd, True)
+            elif source_params['loader'] == 'uefi-kernel':
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
+                    raise WicError("UEFI stub kernel is incompatible with target %s" % target)
+
+                for mod in [x for x in os.listdir(kernel_dir) if x.startswith(kernel)]:
+                    cp_cmd = "cp %s/%s %s/EFI/BOOT/%s" % (kernel_dir, mod, hdddir, kernel_efi_image)
+                    exec_cmd(cp_cmd, True)
             else:
                 raise WicError("unrecognized bootimg-efi loader: %s" %
                                source_params['loader'])
-- 
2.17.1


