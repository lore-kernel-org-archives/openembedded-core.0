Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE644C77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 09:10:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8891.1686647417719480020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 02:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RxIY3XaV;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35D9AEkv019957;
	Tue, 13 Jun 2023 04:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686647414;
	bh=htjV7tgT9ubA53V+AUbit8PqeTfsmKoSlIK2bHCsYmE=;
	h=From:To:CC:Subject:Date;
	b=RxIY3XaVDi5ig+stkbsWA3dBTyecWJN7FnS/dAUroGQv8yUG84rPAHDdOcy7nKN3c
	 ZUj3mhmfTe3Yd+qpN6hZWgwV18JjPjJKbLqfy1DEW42ElxmbmoUhLGslwBLba+CV6F
	 MPzdFLnxT51v22eT363Kfgm7q8Z5u5G/zQVpyB90=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35D9AEZf123989
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 04:10:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 04:10:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 04:10:14 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35D9ADor017209;
	Tue, 13 Jun 2023 04:10:14 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
CC: <denys@konsulko.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>,
        <rs@ti.com>, <devarsht@ti.com>, <n-jain1@ti.com>
Subject: [oe-core][PATCH v2] wic: bootimg: Add support to install directories
Date: Tue, 13 Jun 2023 14:40:11 +0530
Message-ID: <20230613091011.3624628-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 09:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182701

IMAGE_BOOTFILES can contains directories to install in boot partition
for e.g. below declaration allows to install files into boot dir as per
example given in yocto documentation [1].

$ IMAGE_BOOT_FILES = "bcm2835-bootfiles/*;boot/

So to install directories in target boot parition of wic image,
use `-t` option of install command so that if there are any directories
present in IMAGE_BOOT_FILES macro they get created in target area and
respective files get installed in created directory in target area.

This also fixes below error, which was faced while trying to install logos
directory inside the boot partition :

$ "install -m 0644 -D <src_path>/deploy/images/am62xx-evm/ti.gz
<dst_path>/1.0-r0/tmp-wic/hdd/boot/logos/ returned '1' instead of 0
| output: install: target '<dst_path>/1.0-r0/tmp-wic/hdd/boot/logos/'
is not a directory: No such file or directory"

Link:
[1] https://docs.yoctoproject.org/ref-manual/variables.html?highlight=image_boot_files

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
V2: s/Logs/Link (in commit message)
---
 scripts/lib/wic/plugins/source/bootimg-efi.py       | 4 ++--
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index c28d3917c2..966606a39e 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -341,13 +341,13 @@ class BootimgEFIPlugin(SourcePlugin):
                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
                 exec_native_cmd(objcopy_cmd, native_sysroot)
         else:
-            install_cmd = "install -m 0644 %s/%s %s/%s" % \
+            install_cmd = "install -m 0644 -D %s/%s -t %s/%s" % \
                 (staging_kernel_dir, kernel, hdddir, kernel)
             exec_cmd(install_cmd)
 
         if get_bitbake_var("IMAGE_EFI_BOOT_FILES"):
             for src_path, dst_path in cls.install_task:
-                install_cmd = "install -m 0644 -D %s %s" \
+                install_cmd = "install -m 0644 -D %s -t %s" \
                               % (os.path.join(kernel_dir, src_path),
                                  os.path.join(hdddir, dst_path))
                 exec_cmd(install_cmd)
diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 5dbe2558d2..32cc5d38ab 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -184,7 +184,7 @@ class BootimgPartitionPlugin(SourcePlugin):
         for task in cls.install_task:
             src_path, dst_path = task
             logger.debug('Install %s as %s', src_path, dst_path)
-            install_cmd = "install -m 0644 -D %s %s" \
+            install_cmd = "install -m 0644 -D %s -t %s" \
                           % (os.path.join(kernel_dir, src_path),
                              os.path.join(hdddir, dst_path))
             exec_cmd(install_cmd)
-- 
2.34.1


