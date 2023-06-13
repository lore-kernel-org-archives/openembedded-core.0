Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6FEC7EE29
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 06:42:15 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7547.1686638527688074597
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 23:42:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=G2NwitkW;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35D6g5E4053750;
	Tue, 13 Jun 2023 01:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686638525;
	bh=zOzBgxU1BKjQDu9/D1DuKoH1YPPau2k16ENNPLk5+hY=;
	h=From:To:CC:Subject:Date;
	b=G2NwitkWV20rUW4h2Q2vHrUA5p6fQ600g/w/C1xlhnNErEz6F1E4qMOSmBrf6ea+F
	 mm5BHPq61p5gRaqdVWPbCjRiLUNGTTAckAeAWn481luV9S+FRtiacQVqWyqr8J5PM+
	 /Y47pu2elUBhw3p/sNnSLn3hRO6dapKRzyhtbQ3M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35D6g5jI088596
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Jun 2023 01:42:05 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Jun 2023 01:42:04 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Jun 2023 01:42:05 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35D6g4Jh012689;
	Tue, 13 Jun 2023 01:42:04 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
CC: <denys@konsulko.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <khasim@ti.com>, <nsekhar@ti.com>, <afd@ti.com>,
        <rs@ti.com>, <devarsht@ti.com>, <n-jain1@ti.com>
Subject: [PATCH] wic: bootimg: Add support to install directories
Date: Tue, 13 Jun 2023 12:12:01 +0530
Message-ID: <20230613064201.3404610-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 06:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182692

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

Logs:
[1] https://docs.yoctoproject.org/ref-manual/variables.html?highlight=image_boot_files

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
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


