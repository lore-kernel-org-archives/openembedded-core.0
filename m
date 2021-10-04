Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15365C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:25:54 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web11.14001.1633371953576388616
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="311744817"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="311744817"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:11 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208853"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/11] wic: keep rootfs_size as integer
Date: Tue,  5 Oct 2021 00:50:49 +0800
Message-Id: 
 <5b6cd58a000c4a1eaac95e37a047838df6478305.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:25:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156627

From: Alexander Kanavin <alex.kanavin@gmail.com>

The corrected line accidentally converted it to float,
which causes problems later on with python 3.10:

|   File "/home/alex/development/poky/scripts/lib/wic/partition.py", line 278, in prepare_rootfs_ext
|     os.ftruncate(sparse.fileno(), rootfs_size * 1024)
| TypeError: 'float' object cannot be interpreted as an integer

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d1d260dd2d196d10379ed9e238bcb34f39f3a3b7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 76d144d12d..a0b7291a6b 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -104,7 +104,7 @@ class Partition():
                 extra_blocks = self.extra_space
 
             rootfs_size = actual_rootfs_size + extra_blocks
-            rootfs_size *= self.overhead_factor
+            rootfs_size = int(rootfs_size * self.overhead_factor)
 
             logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                          extra_blocks, self.mountpoint, rootfs_size)
-- 
2.31.1


