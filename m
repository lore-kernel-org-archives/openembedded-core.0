Return-Path: <adithya.balakumar@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC190C47DB3
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 11:04:46 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.132])
 by mx.groups.io with SMTP id smtpd.web10.11537.1706699078538111236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 03:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.132, mailfrom: adithya.balakumar@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1121) id 40VB4aFN208375; Wed, 31 Jan 2024 20:04:36 +0900
X-Iguazu-Qid: 2rWh6c5guTX0COC4Fk
X-Iguazu-QSIG: v=2; s=0; t=1706699076; q=2rWh6c5guTX0COC4Fk; m=h05Gh2PT5I/v0b3cnePbDlyIoNbkd8SKhlT3xKI/pho=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1123) id 40VB4ZUe3788435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Jan 2024 20:04:35 +0900
From: Adithya Balakumar <Adithya.Balakumar@toshiba-tsip.com>
To: openembedded-core@lists.openembedded.org
Cc: shivanand.kunijadar@toshiba-tsip.com, sai.sathujoda@toshiba-tsip.com,
        dinesh.kumar@toshiba-tsip.com, kazuhiro3.hayashi@toshiba.co.jp,
        adithya.balakumar@toshiba-tsip.com
Subject: [OE-Core][PATCH v2] wic: implement reproducible Disk GUID
Date: Wed, 31 Jan 2024 16:33:55 +0530
X-TSB-HOP2: ON
Message-Id: <20240131110355.2433724-1-Adithya.Balakumar@toshiba-tsip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 31 Jan 2024 11:04:33.0647 (UTC) FILETIME=[4579EFF0:01DA5435]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 11:04:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194514

GPT based disks have a disk guid apart from the 32-bit disk identifier.
This commit implements reproducible disk guid by using SOURCE_DATE_EPOCH (if available) value as a random seed

Signed-off-by: Adithya Balakumar <Adithya.Balakumar@toshiba-tsip.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9b619e41c1..a1d152659b 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -530,6 +530,16 @@ class PartitionedImage():
         exec_native_cmd("parted -s %s mklabel %s" % (device, ptable_format),
                         self.native_sysroot)
 
+    def _write_disk_guid(self):
+        if self.ptable_format in ('gpt', 'gpt-hybrid'):
+            if os.getenv('SOURCE_DATE_EPOCH'):
+                self.disk_guid = uuid.UUID(int=int(os.getenv('SOURCE_DATE_EPOCH')))
+            else:
+                self.disk_guid = uuid.uuid4()
+
+            logger.debug("Set disk guid %s", self.disk_guid)
+            sfdisk_cmd = "sfdisk --disk-id %s %s" % (self.path, self.disk_guid)
+            exec_native_cmd(sfdisk_cmd, self.native_sysroot)
 
     def create(self):
         self._make_disk(self.path,
@@ -537,6 +547,7 @@ class PartitionedImage():
                         self.min_size)
 
         self._write_identifier(self.path, self.identifier)
+        self._write_disk_guid()
 
         if self.ptable_format == "gpt-hybrid":
             mbr_path = self.path + ".mbr"
-- 
2.39.2



