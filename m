Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9297EC77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 21:11:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.24227.1682111464881665775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 14:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bfynZ2f7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33LLAxv0075332;
	Fri, 21 Apr 2023 16:10:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682111459;
	bh=/0q7hxVUpESDEgqjw9RcsrCMm7/MnQ9afTDPUyqAGsk=;
	h=From:To:CC:Subject:Date;
	b=bfynZ2f7CPnzTjmByFgu0QjAC3s2Eg1Plmy4Je3G7h0235xaXskmBI24eZjcrvWI5
	 fMpFK4Gu9y+rgJBr3X4Jov2FxxYevzgUSV1F+GB7jC6NypV5bcj8wOrWSEjzmiXR24
	 KwOXUVegis1kMfDpX4sEZRXUdUxeTo/nOn/DmMFE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33LLAwm7016734
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Apr 2023 16:10:59 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 21
 Apr 2023 16:10:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 21 Apr 2023 16:10:58 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33LLAww9041028;
	Fri, 21 Apr 2023 16:10:58 -0500
From: Randolph Sapp <rs@ti.com>
To: <zarkakareem@gmail.com>, <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
Date: Fri, 21 Apr 2023 16:10:55 -0500
Message-ID: <20230421211055.3659678-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 21:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180297

This is a bit of a compatibility issue more than anything. Some devices
get upset if the FAT file system contains less blocks than the
partition.

The fixed-size argument is currently respected by the partition creation
step but not by the file system creation step. Let's make it so the file
system respects this value as well.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index a65a5b9780..15557e5d36 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -387,6 +387,9 @@ class BootimgEFIPlugin(SourcePlugin):
 
         blocks += extra_blocks
 
+        if blocks < part.fixed_size:
+            blocks = part.fixed_size
+
         logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                      extra_blocks, part.mountpoint, blocks)
 
-- 
2.40.0


