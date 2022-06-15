Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE39C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 06:35:43 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.1365.1655274935820046542
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 23:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.146.13,
 mailfrom: liezhi.yang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 25F6ZYGm012193
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 23:35:35 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 25F6ZTji010409
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jun 2022 23:35:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Jun 2022 23:35:29 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Jun 2022 23:35:29 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] wic: Use ROOTFS_DIR to locate pseudo_dir
Date: Tue, 14 Jun 2022 23:35:29 -0700
Message-ID: 
 <9e7e057f730abc1b8c5f1a942618ba1303ef526d.1655274860.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1655274860.git.liezhi.yang@windriver.com>
References: <cover.1655274860.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 06:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166909

Fixed when wks is:
part /boot --source bootimg-partition --ondisk mmcblk0 --fstype=vfat --label boot --active --align 4096 --fixed-size 256M
part / --source rootfs --exclude-path=var/ --ondisk mmcblk0 --fstype=ext4 --label root --align 4096
part /var --source rootfs --rootfs-dir=${IMAGE_ROOTFS}/var --ondrive mmcblk0 --fstype=ext4 --label var --align 4096 --fixed-size 1024M --fsoptions=ro,relatime,sync

$ bitbake <image>
$ wic create <wks> -e <image>
WARNING: /path/to/rootfs/var/../pseudo folder does not exist. Usernames and permissions will be invalid

The --rootfs-dir can be anywhere, so the ../pseudo may not exist, use
ROOTFS_DIR to fix the problem.

The patch is from "Rath Anil Kumar <AnilKumar.Rath@windriver.com>"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index 25bb41dd702..11b09c1e80e 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -95,7 +95,7 @@ class RootfsPlugin(SourcePlugin):
 
         part.rootfs_dir = cls.__get_rootfs_dir(rootfs_dir)
         part.has_fstab = os.path.exists(os.path.join(part.rootfs_dir, "etc/fstab"))
-        pseudo_dir = os.path.join(part.rootfs_dir, "../pseudo")
+        pseudo_dir = os.path.join(krootfs_dir['ROOTFS_DIR'], "../pseudo")
         if not os.path.lexists(pseudo_dir):
             pseudo_dir = os.path.join(cls.__get_rootfs_dir(None), '../pseudo')
 
-- 
2.33.1


