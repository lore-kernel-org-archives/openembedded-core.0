Return-Path: <adithya.balakumar@toshiba-tsip.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02041C27C4F
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 07:03:11 +0000 (UTC)
Received: from mo-csw.securemx.jp (mo-csw.securemx.jp [210.130.202.152])
 by mx.groups.io with SMTP id smtpd.web10.2402.1718262184688193182
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 00:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: toshiba-tsip.com, ip: 210.130.202.152, mailfrom: adithya.balakumar@toshiba-tsip.com)
Received: by mo-csw.securemx.jp (mx-mo-csw1802) id 45D732Qp3339041; Thu, 13 Jun 2024 16:03:03 +0900
X-Iguazu-Qid: 2yAblVO8FBVgVKFAnO
X-Iguazu-QSIG: v=2; s=0; t=1718262182; q=2yAblVO8FBVgVKFAnO; m=P3FhIQKWl/MN7m0ODfKjynSSDqslHteeRp0ThkPNkuc=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1802) id 45D731qZ4094855
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 16:03:02 +0900
From: adithya.balakumar@toshiba-tsip.com
To: openembedded-core@lists.openembedded.org
Cc: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>,
        shivanand.kunijadar@toshiba-tsip.com, sai.sathujoda@toshiba-tsip.com,
        dinesh.kumar@toshiba-tsip.com, kazuhiro3.hayashi@toshiba.co.jp
Subject: [OE-Core][PATCH v1] wic/partition.py: Set hash_seed for empty ext partition
Date: Thu, 13 Jun 2024 12:33:00 +0530
X-TSB-HOP2: ON
Message-Id: <20240613070300.17223-1-adithya.balakumar@toshiba-tsip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 13 Jun 2024 07:03:00.0084 (UTC) FILETIME=[B9FE3B40:01DABD5F]
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 07:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200593

From: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>

Although setting hash_seed is handled for the rootfs plugin case, but
this is missed when deploying an empty ext partition.

Signed-off-by: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
---
 scripts/lib/wic/partition.py | 37 ++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 795707ec5d..bf2c34d594 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -284,19 +284,8 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-F -i 8192"
 
-        if os.getenv('SOURCE_DATE_EPOCH'):
-            sde_time = int(os.getenv('SOURCE_DATE_EPOCH'))
-            if pseudo:
-                pseudo = "export E2FSPROGS_FAKE_TIME=%s;%s " % (sde_time, pseudo)
-            else:
-                pseudo = "export E2FSPROGS_FAKE_TIME=%s; " % sde_time
-
-            # Set hash_seed to generate deterministic directory indexes
-            namespace = uuid.UUID("e7429877-e7b3-4a68-a5c9-2f2fdf33d460")
-            if self.fsuuid:
-                namespace = uuid.UUID(self.fsuuid)
-            hash_seed = str(uuid.uuid5(namespace, str(sde_time)))
-            extraopts += " -E hash_seed=%s" % hash_seed
+        # use hash_seed to generate reproducible ext4 images
+        (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, pseudo)
 
         label_str = ""
         if self.label:
@@ -344,6 +333,23 @@ class Partition():
 
         self.check_for_Y2038_problem(rootfs, native_sysroot)
 
+    def get_hash_seed_ext4(self, extraopts, pseudo):
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
+        return (extraopts, pseudo)
+
     def prepare_rootfs_btrfs(self, rootfs, cr_workdir, oe_builddir, rootfs_dir,
                              native_sysroot, pseudo):
         """
@@ -437,13 +443,16 @@ class Partition():
 
         extraopts = self.mkfs_extraopts or "-i 8192"
 
+        # use hash_seed to generate reproducible ext4 images
+        (extraopts, pseudo) = self.get_hash_seed_ext4(extraopts, None)
+
         label_str = ""
         if self.label:
             label_str = "-L %s" % self.label
 
         mkfs_cmd = "mkfs.%s -F %s %s -U %s %s" % \
             (self.fstype, extraopts, label_str, self.fsuuid, rootfs)
-        exec_native_cmd(mkfs_cmd, native_sysroot)
+        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
         self.check_for_Y2038_problem(rootfs, native_sysroot)
 
-- 
2.20.1



