Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8E0C05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 11:44:22 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.9068.1692359056818831660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 04:44:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=ZNoI61AX;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692359057; x=1723895057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ca+q8OtpeJoDuk08mEKdJjkIKylvWf1QkT1BFOBe9yk=;
  b=ZNoI61AX5O05SNfVwss15Aohtg5oTSvAiwSFo++KZte1Ji1UDYTsQo6v
   /jxmugiTdYPCaSmTfoTxiqE0DKgEo+aJI5qwayyHDmZop81++Mxf9KoJf
   1L6dcfIogvSU/9zhwTGJsuZql6EGvfu/+6jW/Vkp7M5U1Ei4PdOxlgoJS
   Y18yHGcw93R8e9o2gKwpBPvVdLlvMYnThiQgA5+iiW6mKGmABfnbqsrCN
   O2snCA2NWkSE0K55Zn43K16vFIqaT5vBKrbzxw+2V81Kw4jSPFulPu6Bd
   q6pak+rE3ZwLyeeEAFH1dbGepjJ4NhZKUC1AnONkUQEZggUZEd9pZ5zka
   g==;
X-IronPort-AV: E=Sophos;i="6.01,183,1684792800"; 
   d="scan'208";a="32514352"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Aug 2023 13:44:15 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 1F9EE280075;
	Fri, 18 Aug 2023 13:44:15 +0200 (CEST)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH] wic: fix wrong attempt to create file system in upartitioned regions
Date: Fri, 18 Aug 2023 13:44:13 +0200
Message-Id: <20230818114413.3236712-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 11:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186361

The kickstart parser defaults fstype to "vfat". This leads to an attempt
to create an empty file system even for regions configured with "--no-table"
if used without fstype when no --sourceparams given.

The fix tests for fstype "none" or no_table in Partition prepare method.
This will omit the file system creation an the potential error for small
region with --no-table option.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index bda4aef1b4..f11c393df5 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -134,7 +134,7 @@ class Partition():
             self.update_fstab_in_rootfs = True
 
         if not self.source:
-            if self.fstype == "none":
+            if self.fstype == "none" or self.no_table:
                 return
             if not self.size and not self.fixed_size:
                 raise WicError("The %s partition has a size of zero. Please "
-- 
2.25.1


