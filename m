Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A422FEE4993
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 10:17:33 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web10.7759.1692613048709383615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 03:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=oIIWVUBN;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1692613048; x=1724149048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S4gVwJeH/6DOyIF9L09TAmLNcxb/yo47bVkEUqv66rw=;
  b=oIIWVUBN0M0bL17mDgbpuPfZ3zn8l3yfeEWogyZc45EUlzCMTWPP/xgr
   GBaa0if9s+vMkjoxtEKiry0AStrRDq0wC5QEQ7peUuXer7uWOC519eL1K
   zfdFdQiR1forrtKkP71S9c4Y3j9hKjvYvbi7Me3SQ2074sc4Sh9b6Ii57
   myOfLDV6Km+0bgMnZIN7L10V1RexF/WjFwOUPh8UKenRk2MJL44y+JRW7
   UBeZNQ1tqZ/bDOgA5QaB7UHZeHIQ1VEson8sGoSPN5CsFGF8vCFVOhsXS
   ksQanR/u+F4jMYOy+6SEN2DHPV4dn/6DAcVLc5AOpuM/SuFzPTfrHGEOG
   w==;
X-IronPort-AV: E=Sophos;i="6.01,189,1684792800"; 
   d="scan'208";a="32537810"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Aug 2023 12:16:20 +0200
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 915F5280085;
	Mon, 21 Aug 2023 12:16:20 +0200 (CEST)
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH v2 2/2] wic: fix wrong attempt to create file system in unpartitioned regions
Date: Mon, 21 Aug 2023 12:15:45 +0200
Message-Id: <20230821101545.3351643-3-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
References: <20230821101545.3351643-1-Markus.Niebel@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 10:17:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186426

The kickstart parser defaults fstype to "vfat". This leads to an attempt
to create an empty file system even for regions configured with "--no-table"
if used without fstype when no --sourceparams given.

The fix tests for fstype "none" or no_table in Partition prepare method.
This will omit the file system creation an the potential error for small
region with --no-table option.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---

v2: fix typo in description

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


