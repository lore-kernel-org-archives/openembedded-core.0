Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256CDCA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 13:41:44 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web11.13437.1757425299684426133
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 06:41:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=NVTygfoX;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: b36928ae8d8211f0bd5779446731db89-20250909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AfLspH/ZSDpXUnn45zQKNTwaUyI8Hend3c9Qn+pwHMw=;
	b=NVTygfoXKqGB1amPKQRm6mLiXFgvDKluS66oSPath1u8QEYjiupI6CnA5Rz7P6+WEGTYzzPPGtuOPclauSssjtgPk7tmXLAcupcc3vOyyPdYsqeKJYcsGd0FOtHjMfBxpuOS+/ees1DQi/NfKUsr6Epc/WTJVhjK0+9NYRjLJQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:7dd3b287-4fb8-491d-a66c-65c94ea7e0e0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:61035e6c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b36928ae8d8211f0bd5779446731db89-20250909
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1341797004; Tue, 09 Sep 2025 21:41:34 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 9 Sep 2025 21:41:32 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 9 Sep 2025 21:41:32 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] wic: Add sector size support to WIC partition and bootimg_efi plugin for UFS
Date: Tue, 9 Sep 2025 21:41:17 +0800
Message-ID: <20250909134117.2219965-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 13:41:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223111

Introduce --sector-size argument to ksparse.py and propagate sector_size
to partition objects. Update bootimg_efi plugin to validate sector size
and pass it to mkdosfs, enabling creation of EFI system partitions with
variable sector sizes. This change is required to support UFS storage.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 scripts/lib/wic/help.py                       |  6 ++++++
 scripts/lib/wic/ksparser.py                   |  1 +
 scripts/lib/wic/partition.py                  |  1 +
 scripts/lib/wic/plugins/source/bootimg_efi.py | 18 ++++++++++++++++--
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 6b49a67de938..35347b2df8ad 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -885,6 +885,12 @@ DESCRIPTION
                        is larger than --fixed-size and error will be
                        raised when assembling disk image.
 
+         --sector-size: The sector size in bytes. The value must be an
+                        integer and one of 512, 1024, or 4096. The
+                        default is 512. This enables a variable sector
+                        size for EFI partitions, which is supported on
+                        devices such as eMMC and UFS storages.
+
          --source: This option is a wic-specific option that names the
                    source of the data that will populate the
                    partition.  The most common value for this option
diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 705f98975084..0bfdabe1bf22 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -182,6 +182,7 @@ class KickStart():
         sizeexcl.add_argument('--size', type=sizetype("M"), default=0)
         sizeexcl.add_argument('--fixed-size', type=sizetype("M"), default=0)
 
+        part.add_argument('--sector-size', type=int, default=512)
         part.add_argument('--source')
         part.add_argument('--sourceparams')
         part.add_argument('--system-id', type=systemidtype)
diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 0c9b1a5b9620..d64b2e731f5b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -49,6 +49,7 @@ class Partition():
         self.rootfs_dir = args.rootfs_dir
         self.size = args.size
         self.fixed_size = args.fixed_size
+        self.sector_size = args.sector_size
         self.source = args.source
         self.sourceparams = args.sourceparams
         self.system_id = args.system_id
diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index cf16705a285a..a1b00d91bf53 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -415,8 +415,22 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        # Validate part.fixed_size
+        if part.sector_size not in (512, 1024, 4096):
+            logger.debug("Invalid '--sector-size' specified (%s). " \
+                         "Allowed values are 512, 1024, or 4096. " \
+                         "Setting to default 512.",
+                         part.sector_size)
+            part.sector_size = 512
+
+        # Support variable sector size
+        # mkdosfs -C expects number of blocks, which is (size in bytes) // sector_size
+        size_bytes = blocks * 1024
+        blocks = size_bytes // part.sector_size
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d -S %d" % \
+                    (label, part.fsuuid, bootimg, blocks, part.sector_size)
+
         exec_native_cmd(dosfs_cmd, native_sysroot)
         logger.debug("mkdosfs:\n%s" % (str(out)))
 
-- 
2.45.2


