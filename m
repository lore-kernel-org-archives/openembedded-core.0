Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACB4C77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 16:04:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.98490.1682957071265849418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 09:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=x1Y8NV3e;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 341G4NGm100779;
	Mon, 1 May 2023 11:04:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682957063;
	bh=DGPGWsAaSj9MdDt6myeKGfT8AvCU+XqxwnUlfrS03ts=;
	h=From:To:CC:Subject:Date;
	b=x1Y8NV3eASWIfGdIXJmNzUCBnycOZHVv4S8QgKhF23T2e0LumTDLGlynPkHjZtE2O
	 GNb7XctutAW6iompu4T+mngRgNVG7v/67XLGxgh2dF7JMWtxiF3e4ONwZo40IDreMO
	 RP6iL+glnhN83gXWQXljj+Y/DS2DYMDTuC/eRxSs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 341G4NM2094206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 May 2023 11:04:23 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 May 2023 11:04:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 May 2023 11:04:23 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 341G4NK8028778;
	Mon, 1 May 2023 11:04:23 -0500
From: <rs@ti.com>
To: <luca.ceresoli@bootlin.com>, <reatmon@ti.com>, <denis@denix.org>,
        <afd@ti.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [OE-core][kirkstone][PATCH] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
Date: Mon, 1 May 2023 11:04:21 -0500
Message-ID: <20230501160421.3659283-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 16:04:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180586

From: Randolph Sapp <rs@ti.com>

This is a bit of a compatibility issue more than anything. Some devices
get upset if the FAT file system contains less blocks than the
partition.

The fixed-size argument is currently respected by the partition creation
step but not by the file system creation step. Let's make it so the file
system respects this value as well.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This fix is already available in master but we'd like to backport it to
kirkstone if possible! Considering it's a compatibility fix it should be
applicable to other branches as well, but we only really care about
Kirkstone at the moment.

 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index d6aeab2aad..43c6fd94d9 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -439,6 +439,13 @@ class BootimgEFIPlugin(SourcePlugin):
         logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                      extra_blocks, part.mountpoint, blocks)
 
+        # required for compatibility with certain devices expecting file system
+        # block count to be equal to partition block count
+        if blocks < part.fixed_size:
+            blocks = part.fixed_size
+            logger.debug("Overriding %s to %d total blocks for compatibility",
+                     part.mountpoint, blocks)
+
         # dosfs image, created by mkdosfs
         bootimg = "%s/boot.img" % cr_workdir
 
-- 
2.40.0


