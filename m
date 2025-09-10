Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71FEFCAC582
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 03:33:17 +0000 (UTC)
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [60.244.123.138])
 by mx.groups.io with SMTP id smtpd.web10.8806.1757475196889151399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 20:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=LATSAgvf;
 spf=pass (domain: mediatek.com, ip: 60.244.123.138, mailfrom: macpaul.lin@mediatek.com)
X-UUID: e1ae5d0a8df611f0bd5779446731db89-20250910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Ebqmz4nRBQZetiPXXem4DXpuDBcZJsexeXHuwB36cYk=;
	b=LATSAgvfy45rdnkmyZu+5+1b6YJ0ryYRMCRGFmejTi3PjTIQX8/1jBCbNfnb90ETPNTUMlXj4PyeSzk4prK1ptszLfkcw+OmNMqafErftoXLEKapSGU7wDlR4Q6nfTWVzOhV1b6k6bkU8B9svvOXNg0GAV7UlsFNiqve5LrWhQM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:1ae55434-fc6e-4ba5-8e6c-803440f350b7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:df41636c-8443-424b-b119-dc42e68239b0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e1ae5d0a8df611f0bd5779446731db89-20250910
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1061447351; Wed, 10 Sep 2025 11:33:13 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 10 Sep 2025 11:33:11 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 10 Sep 2025 11:33:11 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2] wic: Add support for variable sector size when creating ESP
Date: Wed, 10 Sep 2025 11:33:09 +0800
Message-ID: <20250910033310.2424072-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223141

Derive sector_size from the WIC_SECTOR_SIZE BitBake variable.
Recalculate blocks to align with the chosen sector size.
While the default sector size of mkdosfs is 512 bytes,
pass -S <sector_size> to align the setting of WIC_SECTOR_SIZE.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 scripts/lib/wic/plugins/source/bootimg_efi.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

Changes for v2:
 - drop --sector-size, use get_bitbake_var("WIC_SECTOR_SIZE") instead.
 - drop value filter of sector-size.
 - drop creating new sub-varible for 'part'.

diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index cf16705a285a..ceffb9aecb06 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -415,8 +415,15 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        # Support variable sector size
+        sector_size = int(get_bitbake_var("WIC_SECTOR_SIZE"))
+
+        size_bytes = blocks * 1024
+        blocks = size_bytes // sector_size
+
+        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d -S %d" % \
+                    (label, part.fsuuid, bootimg, blocks, sector_size)
+
         exec_native_cmd(dosfs_cmd, native_sysroot)
         logger.debug("mkdosfs:\n%s" % (str(out)))
 
-- 
2.45.2


