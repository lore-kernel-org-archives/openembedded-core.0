Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B18D0C77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 21:26:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.24615.1682112380990866756
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 14:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=svd/dj2u;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33LLQEeb056151;
	Fri, 21 Apr 2023 16:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682112374;
	bh=PkYVn0hiMFITGgnrmcx2a1Xo12r+qRm9UPdcpjh4JQ8=;
	h=From:To:CC:Subject:Date;
	b=svd/dj2urSPaDBI+kT3NYlb3SXiUDalCawhHoZnZFM8twzrNjiIxrN89RONfrrQyX
	 lgP8JGhUzzTN0xgTS6h16+OdTegEi+cgf4oP9e8gtLqwqUEajyx4drrjavkJbvpF66
	 N/7Wc+oja9K/UJWzJt3jWymM1j6S15vU341RU8L0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33LLQEju007533
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 21 Apr 2023 16:26:14 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 21
 Apr 2023 16:26:14 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 21 Apr 2023 16:26:14 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33LLQE51054970;
	Fri, 21 Apr 2023 16:26:14 -0500
From: Randolph Sapp <rs@ti.com>
To: <zarkakareem@gmail.com>, <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>
CC: <openembedded-core@lists.openembedded.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH v2] wic/bootimg-efi: if fixed-size is set then use that for mkdosfs
Date: Fri, 21 Apr 2023 16:26:13 -0500
Message-ID: <20230421212613.3660730-1-rs@ti.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 21:26:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180298

This is a bit of a compatibility issue more than anything. Some devices
get upset if the FAT file system contains less blocks than the
partition.

The fixed-size argument is currently respected by the partition creation
step but not by the file system creation step. Let's make it so the file
system respects this value as well.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Ugh. I muddied up the log statement in the last revision. Fix that here.

 scripts/lib/wic/plugins/source/bootimg-efi.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
index a65a5b9780..c28d3917c2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-efi.py
+++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
@@ -390,6 +390,13 @@ class BootimgEFIPlugin(SourcePlugin):
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


