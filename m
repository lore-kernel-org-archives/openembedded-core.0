Return-Path: <tom.georgi@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77089E7716A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:16:27 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.78385.1734430583062749292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 02:16:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=bgl6dSyT;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: tom.georgi@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH9nETo029033
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=vtaTV
	avSbmjV62j8XXHlnHwsnM/rFCjQ4rTVNFlbnUg=; b=bgl6dSyTmj+O4pFGnqACb
	UEX5Hv2tFqhcWC/3ywdYTvtj8QO7YZE5wtb71g1jG/CqGHpG9nydkEgTZATjNK7F
	xO+cedU/G8juTrdGOC4eZru9vWoKxXEQNjuPQKYr8LTUDmMGDI7gV6aoOtUHfyFg
	UPT6KWlCKgzFU6ASDsTPSUSPTo7o+L1GkHGheferFuTCTpbgHF4VrrhJW2xBi21l
	PrnMj1LfTtXLILbVxEBVSxKuq0UvqpWYNzfjoL8DDOIYSUNvTvzTDn4xIO5s2wL6
	gqi40EjgJvx0RLcajvArxNmKQeN5I/ceY/yENZchBLjJnyThG+1f7zEbKgTV7sHE
	Q==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 43k70f033t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:16:21 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 17 Dec
 2024 11:16:20 +0100
Received: from schn-8kmdb54.KSTG.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 17 Dec 2024 11:16:20 +0100
From: "Georgi, Tom" <tom.georgi@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Georgi, Tom" <tom.georgi@karlstorz.com>
Subject: [PATCH] Also check that 'tools-debug' is not set in IMAGE_FEATURES to determine if gdbserver is missing.
Date: Tue, 17 Dec 2024 11:16:08 +0100
Message-ID: <20241217101607.542503-2-tom.georgi@karlstorz.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FQqrfI_yWsUL1mUrMgHFSlTbwmSBQQb2
X-Proofpoint-GUID: FQqrfI_yWsUL1mUrMgHFSlTbwmSBQQb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208829

Hi all,
While using the relatively new devtool subcommand 'ide-sdk', I noticed that the gdbserver is listed as missing because it was not explicitly listed in IMAGE_INSTALL.
According to the documentation, it is also installed by the image feature 'tools-debug'.
Therefore, you should not only check whether 'gdbserver' is not in 'IMAGE_INSTALL', but also whether 'tools-debug' is not in IMAGE_FEATURES.

Best regards
Tom Georgi

Signed-off-by: Georgi, Tom <tom.georgi@karlstorz.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 2f6eddec2a..7b1cb67bbb 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -167,7 +167,7 @@ class RecipeImage:
             self.__rootfs_dbg = os.path.join(workdir, 'rootfs-dbg')
 
         self.gdbserver_missing = 'gdbserver' not in image_d.getVar(
-            'IMAGE_INSTALL')
+            'IMAGE_INSTALL') and 'tools-debug' not in image_d.getVar('IMAGE_FEATURES')
 
     @property
     def debug_support(self):
-- 
2.47.1


