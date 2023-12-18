Return-Path: <venkata.pyla@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F590C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 04:30:42 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.131])
 by mx.groups.io with SMTP id smtpd.web11.35720.1702873838921721252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Dec 2023 20:30:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.131, mailfrom: venkata.pyla@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 3BI4UZ6s1154653; Mon, 18 Dec 2023 13:30:36 +0900
X-Iguazu-Qid: 2rWgcmDWfzJa8sL1uu
X-Iguazu-QSIG: v=2; s=0; t=1702873835; q=2rWgcmDWfzJa8sL1uu; m=Fl2OcBx4AZ/z0LH/Q+Scoa2ooex9TGZC91EHmKLlWvc=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1121) id 3BI4UXkL1009361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Dec 2023 13:30:35 +0900
From: venkata.pyla@toshiba-tsip.com
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Cc: venkata pyla <venkata.pyla@toshiba-tsip.com>,
        dinesh.kumar@toshiba-tsip.com, kazuhiro3.hayashi@toshiba.co.jp,
        venkatapyla4@gmail.com
Subject: [PATCH v2] wic: use E2FSPROGS_FAKE_TIME and hash_seed to generate reproducible ext4 images
Date: Mon, 18 Dec 2023 10:00:30 +0530
X-TSB-HOP2: ON
Message-Id: <20231218043030.32027-1-venkata.pyla@toshiba-tsip.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <CAMKF1spHz3zSOnop326y65A_1MPGqeZJJ2AnvTj=87VqFKbh=Q@mail.gmail.com>
References: <CAMKF1spHz3zSOnop326y65A_1MPGqeZJJ2AnvTj=87VqFKbh=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Dec 2023 04:30:31.0125 (UTC) FILETIME=[EF426050:01DA316A]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 04:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192598

From: venkata pyla <venkata.pyla@toshiba-tsip.com>

E2FSPROGS_FAKE_TIME: sets fixed times for the inodes in the file system.
hash_seed: creates reproducible directory indexes in the file system.

Reference commit in e2fsprogs: e1f7100643a46456be107b33098f6034b0835e6d

Signed-off-by: venkata pyla <venkata.pyla@toshiba-tsip.com>
---
 scripts/lib/wic/partition.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index b1a2306dd1..795707ec5d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -284,6 +284,20 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-F -i 8192"
 
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            sde_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+            if pseudo:
+                pseudo = "export E2FSPROGS_FAKE_TIME=%s;%s " % (sde_time, pseudo)
+            else:
+                pseudo = "export E2FSPROGS_FAKE_TIME=%s; " % sde_time
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



