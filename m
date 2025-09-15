Return-Path: <macpaul.lin@mediatek.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E842CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:40:05 +0000 (UTC)
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 by mx.groups.io with SMTP id smtpd.web10.26172.1757918399277348596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mediatek.com header.s=dk header.b=sX5g263C;
 spf=pass (domain: mediatek.com, ip: 210.61.82.184, mailfrom: macpaul.lin@mediatek.com)
X-UUID: c75e8a7c91fe11f0b33aeb1e7f16c2b6-20250915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GgxSkmZs9Wka5oR3fDgAg+QpwX2vDFl4iNjmCSYCIYA=;
	b=sX5g263CovoLbHY4RONj9VsATQX+tXDYcv8vZWS2mfNTJg2pe0oixEsUxMyNj4JrFI8jwpUtjZOK8KbGboccD9nuXwuI5VxI4ygaN76I27RI52tnkp3M4DH5e5gz1rQGcrSn0vlhEKQvlNke0y5YsX+F2oIYRCE2ls7oaSa0sSs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:27df2f63-3b3f-4f15-80c7-17034e8d109f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:cb1953a9-24df-464e-9c88-e53ab7cf7153,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c75e8a7c91fe11f0b33aeb1e7f16c2b6-20250915
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 770904372; Mon, 15 Sep 2025 14:39:50 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 15 Sep 2025 14:39:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 15 Sep 2025 14:39:48 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Alexander Kanavin <alex@linutronix.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>, Otavio Salvador
	<otavio@ossystems.com.br>, <openembedded-core@lists.openembedded.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Macpaul Lin <macpaul@gmail.com>, MediaTek Chromebook Upstream
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH] wic: Add support for variable sector size when creating ESP
Date: Mon, 15 Sep 2025 14:39:40 +0800
Message-ID: <20250915063940.4025103-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:40:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223385

Derive sector_size from the WIC_SECTOR_SIZE BitBake variable.
Recalculate blocks to align with the chosen sector size.
While the default sector size of mkdosfs is 512 bytes.
Pass -S <sector_size> to align the setting of WIC_SECTOR_SIZE.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 scripts/lib/wic/plugins/source/bootimg_efi.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

Changes for v2:
 - drop --sector-size, use get_bitbake_var("WIC_SECTOR_SIZE") instead.
 - drop value filter of sector-size.
 - drop creating new sub-varible for 'part'.

Changes for v3:
 - Add -v option back for mkdosfs.
 - Round up the value of blocks instead of round dwon.

diff --git a/scripts/lib/wic/plugins/source/bootimg_efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
index cf16705a285a..288fe6a15a7d 100644
--- a/scripts/lib/wic/plugins/source/bootimg_efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg_efi.py
@@ -415,8 +415,19 @@ class BootimgEFIPlugin(SourcePlugin):
 
         label = part.label if part.label else "ESP"
 
-        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d" % \
-                    (label, part.fsuuid, bootimg, blocks)
+        # define sector size, default is 512 for mkdosfs
+        sector_size_str = get_bitbake_var('WIC_SECTOR_SIZE')
+        if sector_size_str is not None and str(sector_size_str).isdigit():
+            sector_size = int(sector_size_str)
+        else:
+            sector_size = 512
+
+        size_bytes = blocks * 1024
+        blocks = (size_bytes + sector_size - 1) // sector_size
+
+        dosfs_cmd = "mkdosfs -v -n %s -i %s -C %s %d -S %d" % \
+                    (label, part.fsuuid, bootimg, blocks, sector_size)
+
         exec_native_cmd(dosfs_cmd, native_sysroot)
         logger.debug("mkdosfs:\n%s" % (str(out)))
 
-- 
2.45.2


