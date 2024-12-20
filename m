Return-Path: <tom.georgi@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DB9E77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 10:27:50 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.149333.1734690460568477441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 02:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=QrsMOQSM;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: tom.georgi@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK9mC5I009058;
	Fri, 20 Dec 2024 10:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=Jxapi
	4iTOMsuu0jjPmBTG2bZHQp2Qu5T0wutUQ9XIds=; b=QrsMOQSMlDfrxRPtE78de
	hXecdfDnt9ks5xMuZGAOuTHGOHnOom57TPdBWd1C0tW7IZ+Cxpcl7Qse9DY1PyAF
	7PP5FnuQ4SSGSFiv6lgF4F6C8bYIfKYtj2KoDntG+8c38VLqprAKuVrgyzuUzczU
	7RX2JJ7s+vp8jCIEkfQwBy3j+A8Q15Lha4TP3+oDw15QjcM7X9PVu78rzn3QUWJb
	+IDapB8Jrg6oxt/pCm7CnSJ9zTMfIAzKMdCT+yVNUo+2/Y996TECoxkE9El/ankI
	ormkyHc5EuYk2lvhStFDUePrGW2JBBzmB2hctFDT/W0lDlZpkteEFtU+bZpU1AMq
	A==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 43n69088s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:27:38 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Dec
 2024 11:27:37 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Dec
 2024 11:27:37 +0100
Received: from schn-8kmdb54.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 20 Dec 2024 11:27:37 +0100
From: "Georgi, Tom" <tom.georgi@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, "Georgi, Tom" <tom.georgi@karlstorz.com>
Subject: [PATCH] devtool: ide-sdk: Also check that 'tools-debug' is not set in IMAGE_FEATURES to determine if gdbserver is missing.
Date: Fri, 20 Dec 2024 11:27:21 +0100
Message-ID: <20241220102720.1021268-2-tom.georgi@karlstorz.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: pYyzd90TV7rlf9NejHO7A_snrzlf0ubA
X-Proofpoint-GUID: pYyzd90TV7rlf9NejHO7A_snrzlf0ubA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 10:27:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208977

Also check that 'tools-debug' is not set in IMAGE_FEATURES to determine if gdbserver is missing.

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


