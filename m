Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81509C54E4A
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 11:24:20 +0000 (UTC)
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
 by mx.groups.io with SMTP id smtpd.web11.9911.1709033054291161576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 03:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lakka.kapsi.fi, ip: 91.232.154.25, mailfrom: mcfrisk@lakka.kapsi.fi)
Received: from kapsi.fi ([2001:67c:1be8::11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1revZC-003zQJ-1i;
	Tue, 27 Feb 2024 13:24:11 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.94.2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1revZC-00AJBD-94; Tue, 27 Feb 2024 13:24:10 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] wic partition.py: add --apparent-size to du calls
Date: Tue, 27 Feb 2024 13:23:57 +0200
Message-Id: <20240227112357.2455578-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspam-Score: -1.4 (-)
X-Rspam-Report: Action: no action
 Symbol: FROM_HAS_DN(0.00)
 Symbol: FROM_NEQ_ENVFROM(0.00)
 Symbol: RCVD_COUNT_TWO(0.00)
 Symbol: BAYES_HAM(-3.00)
 Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
 Symbol: RCVD_TLS_LAST(0.00)
 Symbol: DMARC_POLICY_SOFTFAIL(0.10)
 Symbol: MIME_GOOD(-0.10)
 Symbol: MID_CONTAINS_FROM(1.00)
 Symbol: RCPT_COUNT_TWO(0.00)
 Symbol: R_DKIM_NA(0.00)
 Symbol: NEURAL_HAM(0.00)
 Symbol: R_SPF_ALLOW(-0.20)
 Symbol: ARC_NA(0.00)
 Symbol: ASN(0.00)
 Symbol: MIME_TRACE(0.00)
 Symbol: TO_DN_SOME(0.00)
 Symbol: FORGED_SENDER(0.30)
 Symbol: R_MISSING_CHARSET(0.50)
 Message-ID: 20240227112357.2455578-1-mikko.rapeli@linaro.org
X-SA-Exim-Connect-IP: 2001:67c:1be8::11
X-SA-Exim-Mail-From: mcfrisk@lakka.kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 11:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196261

If build happens on zfs filesystem with compression enabled,
then image size calculations in do_image_wic task can fail:

output: mke2fs 1.47.0 (5-Feb-2023)
Discarding device blocks: done
Creating filesystem with 351999 4k blocks and 176000 inodes
Filesystem UUID: 6091b3a4-ce08-3020-93a6-f755a22ef03b
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912

Allocating group tables: done
Writing inode tables: done
Creating journal (8192 blocks): done
Copying files into the device: __populate_fs: Could not allocate block in ext2 filesystem while writing file "service-2.json"
mkfs.ext4: Could not allocate block in ext2 filesystem while populating file system

du --help says:

      --apparent-size   print apparent sizes, rather than disk usage; although
                          the apparent size is usually smaller, it may be
                          larger due to holes in ('sparse') files, internal
                          fragmentation, indirect blocks, and the like

du -b already includes --apparent-size.

Same issue reported also in https://lists.yoctoproject.org/g/poky/message/12389

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 scripts/lib/wic/partition.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 795707ec5d..4690ddaa4d 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -254,7 +254,7 @@ class Partition():
                 # Bitbake variable ROOTFS_SIZE is not defined so compute it
                 # from the rootfs_dir size using the same logic found in
                 # get_rootfs_size() from meta/classes/image.bbclass
-                du_cmd = "du -ks %s" % rootfs_dir
+                du_cmd = "du -ks --apparent-size %s" % rootfs_dir
                 out = exec_cmd(du_cmd)
                 self.size = int(out.split()[0])
 
@@ -273,7 +273,7 @@ class Partition():
         """
         Prepare content for an ext2/3/4 rootfs partition.
         """
-        du_cmd = "du -ks %s" % rootfs_dir
+        du_cmd = "du -ks --apparent-size %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
@@ -349,7 +349,7 @@ class Partition():
         """
         Prepare content for a btrfs rootfs partition.
         """
-        du_cmd = "du -ks %s" % rootfs_dir
+        du_cmd = "du -ks --apparent-size %s" % rootfs_dir
         out = exec_cmd(du_cmd)
         actual_rootfs_size = int(out.split()[0])
 
-- 
2.34.1


