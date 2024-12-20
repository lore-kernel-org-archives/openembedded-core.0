Return-Path: <tom.georgi@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B828EE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 10:00:10 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.148874.1734688805991330946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Dec 2024 02:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=PZVTjHQm;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: tom.georgi@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK7XcuO015360;
	Fri, 20 Dec 2024 10:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=vCXdW
	3V8k7e2WMWDidAu/AdAqQGrejEDTCdf7WfCIM0=; b=PZVTjHQmD7IHvY56rHSlh
	UqaY5rUTZ8aqKPrK72y6lGu4MLZ5/V2e7smO72UUa9THL8RbvhZ7k8oRRN2JChlK
	AFaCN7anDkdE0gwoCr6cykzliNgtzUutdG5pqfqshHVe8nhDWHyYNn5BRbRtPmNb
	l+u6m7dcMZrP4zTFnSwEm0I6Bzs6C8HKqLE91Nbgj54dBHSNgnwmQqVn+h+B8F9t
	jqgBljhxXblY9RuHbcQXbcXX5PX4UOu5NS5V1+HP+iYNEpjLno84dQZcs6U9/SGs
	j1/8cpk+ctnkfXSyLY1LT40mpeNu+tQH9OWHpzHdbQNuyQlxW44wZWlsAIxkhkII
	Q==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 43n496gygp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 10:00:04 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Dec
 2024 11:00:03 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 20 Dec
 2024 11:00:03 +0100
Received: from schn-8kmdb54.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Fri, 20 Dec 2024 11:00:03 +0100
From: "Georgi, Tom" <tom.georgi@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, "Georgi, Tom" <tom.georgi@karlstorz.com>
Subject: [PATCH] devtool: ide-sdk: Also check that 'tools-debug' is not set in IMAGE_FEATURES to determine if gdbserver is missing.
Date: Fri, 20 Dec 2024 10:59:37 +0100
Message-ID: <20241220095936.57808-2-tom.georgi@karlstorz.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QiIERsXcd3uxV0TRbN-kO0w7U1F1dPkP
X-Proofpoint-GUID: QiIERsXcd3uxV0TRbN-kO0w7U1F1dPkP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_16,2024-08-23_01,2024-05-17_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Dec 2024 10:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208975

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


