Return-Path: <adithya.balakumar@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614CAC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 12:26:00 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.134])
 by mx.groups.io with SMTP id smtpd.web10.72265.1705926358139964809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 04:25:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.134, mailfrom: adithya.balakumar@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1800) id 40MCPtio1214612; Mon, 22 Jan 2024 21:25:55 +0900
X-Iguazu-Qid: 2yAawsiTggzMehnh8y
X-Iguazu-QSIG: v=2; s=0; t=1705926354; q=2yAawsiTggzMehnh8y; m=Ge44HaPojbF2m2NorhVYTdi40hnJ8IhDMPQuyEoNJL4=
Received: from imx12-a.toshiba.co.jp ([38.106.60.135])
	by relay.securemx.jp (mx-mr1803) id 40MCPr0N331179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Jan 2024 21:25:54 +0900
From: Adithya Balakumar <Adithya.Balakumar@toshiba-tsip.com>
To: openembedded-core@lists.openembedded.org
Cc: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>,
        shivanand.kunijadar@toshiba-tsip.com, sai.sathujoda@toshiba-tsip.com,
        dinesh.kumar@toshiba-tsip.com, kazuhiro3.hayashi@toshiba.co.jp,
        jan.kiszka@siemens.com
Subject: [OE-Core][PATCH v1] wic: implement reproducible Disk GUID
Date: Mon, 22 Jan 2024 17:55:21 +0530
X-TSB-HOP2: ON
Message-Id: <20240122122521.2605264-1-Adithya.Balakumar@toshiba-tsip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Jan 2024 12:25:51.0839 (UTC) FILETIME=[236336F0:01DA4D2E]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 12:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194145

From: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>

GPT based disks have a disk guid apart from the 32-bit disk identifier.
This commit implements reproducible disk guid by using SOURCE_DATE_EPOCH (if available) value as a random seed

Signed-off-by: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 9b619e41c1..d0f8481c2e 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -530,6 +530,21 @@ class PartitionedImage():
         exec_native_cmd("parted -s %s mklabel %s" % (device, ptable_format),
                         self.native_sysroot)
 
+    def _write_disk_guid(self):
+        if os.getenv('SOURCE_DATE_EPOCH'):
+            if self.ptable_format in ('gpt', 'gpt-hybrid'):
+                self.disk_guid = uuid.UUID(int=int(os.getenv('SOURCE_DATE_EPOCH')))
+            elif self.ptable_format == "msdos":
+                self.disk_guid = '0x' + str(uuid.UUID(int=int(os.getenv('SOURCE_DATE_EPOCH'))).int & 0xFFFFFFFF)[:8]
+        else:
+            if self.ptable_format in ('gpt', 'gpt-hybrid'):
+                self.disk_guid = uuid.uuid4()
+            elif self.ptable_format == "msdos":
+                self.disk_guid = '0x' + str(uuid.uuid4())[:8]
+
+        logger.debug("Set disk guid %s", self.disk_guid)
+        sfdisk_cmd = "sfdisk --disk-id %s %s" % (self.path, self.disk_guid)
+        exec_native_cmd(sfdisk_cmd, self.native_sysroot)
 
     def create(self):
         self._make_disk(self.path,
@@ -537,6 +552,7 @@ class PartitionedImage():
                         self.min_size)
 
         self._write_identifier(self.path, self.identifier)
+        self._write_disk_guid()
 
         if self.ptable_format == "gpt-hybrid":
             mbr_path = self.path + ".mbr"
-- 
2.39.2



