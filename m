Return-Path: <venkata.pyla@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367A3C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 13:56:41 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.152])
 by mx.groups.io with SMTP id smtpd.web11.2044.1702389394795081437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 05:56:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.152, mailfrom: venkata.pyla@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 3BCDuWSK3195426; Tue, 12 Dec 2023 22:56:32 +0900
X-Iguazu-Qid: 2yAae1aEThDc6lcNVY
X-Iguazu-QSIG: v=2; s=0; t=1702389391; q=2yAae1aEThDc6lcNVY; m=N0UgAelX8He3wvthHVtUjJWViV0PSNdfJwunHR18HZ0=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 3BCDuUQM3744189
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Dec 2023 22:56:31 +0900
From: venkata.pyla@toshiba-tsip.com
To: openembedded-core@lists.openembedded.org
Cc: venkata pyla <venkata.pyla@toshiba-tsip.com>
Subject: [PATCH] wic: use E2FSPROGS_FAKE_TIME and hash_seed to generate reproducible ext4 images
Date: Tue, 12 Dec 2023 19:26:28 +0530
X-TSB-HOP2: ON
Message-Id: <20231212135628.9595-1-venkata.pyla@toshiba-tsip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Dec 2023 13:56:28.0684 (UTC) FILETIME=[01102CC0:01DA2D03]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 13:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192192

From: venkata pyla <venkata.pyla@toshiba-tsip.com>

E2FSPROGS_FAKE_TIME: sets fixed times for the inodes in the file system.
hash_seed: creates reproducible directory indexes in the file system.

Reference commit in e2fsprogs: e1f7100643a46456be107b33098f6034b0835e6d

Signed-off-by: venkata pyla <venkata.pyla@toshiba-tsip.com>
---
 scripts/lib/wic/partition.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b1a2306dd1..8e2273ca2f 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -284,6 +284,17 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-F -i 8192"
 
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            sde_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+            pseudo = "export E2FSPROGS_FAKE_TIME=%s;%s" % (sde_time, pseudo)
+
+            # Set hash_seed to generate deterministic directory indexes
+            namespace = uuid.UUID("e7429877-e7b3-4a68-a5c9-2f2fdf33d460")
+            if self.fsuuid:
+                namespace = uuid.UUID(self.fsuuid)
+            hash_seed = str(uuid.uuid5(namespace, str(sde_time)))
+            extraopts += " -E hash_seed=%s" % hash_seed
+
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
-- 
2.20.1



