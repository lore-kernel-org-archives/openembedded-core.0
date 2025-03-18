Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B95C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:50:14 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.8882.1742295012639251186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 03:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=HoyUmtss;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAHkmj031379
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=kW7azsyAVNqnffQfgEXgsh7Qv11BGsz/BzWFQK5sehM=; b=
	HoyUmtssgqDFknkPGZdJD/NaYEIsWi8Xl1IR3quJ+WM6vEWCkIrJCZcuaqABFKCB
	j/noBhD7QoAQYdAHUixBtn94oJGB+x3rwM/ftmf3U0wdld7D6ecweqWCXDau0PSM
	JJPdx0f3WLu6u0FAfV3FjL+k/Y//FW7QL4nvxY0lKCr8FUoc0Iivpe3/I5Pm4j24
	+Op/wA7y4FIBURaYsQRY/n0iEuNP4u6scCd42F8bqNVh3ovu3DKVkJx+7sXJN9WF
	uV5Hba7rWdunWIGw7G/uB8essEiMQEXZYwH5/tppJPQ3AlWlJJQfHdXAnhnpNPxj
	faotS01gWbrQ4PVQJUc5xA==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 45ev42bj4m-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:10 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 11:50:06 +0100
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 11:50:06 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 3/3] qemuboot: Provide default value for INITRAMFS_LINK_NAME
Date: Tue, 18 Mar 2025 11:48:53 +0100
Message-ID: <20250318104853.1442703-4-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
References: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 98dh26HqEpbeh-jUFVS1RdM_mvQd0G-G
X-Authority-Analysis: v=2.4 cv=O+s5vA9W c=1 sm=1 tr=0 ts=67d94fe3 cx=c_pps a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17 a=Vs1iUdzkB0EA:10 a=n9SCklZpAAAA:8 a=YqZbrvvrdJW2SfZ8IeUA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: 98dh26HqEpbeh-jUFVS1RdM_mvQd0G-G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213202

The qemuboot class uses the INITRAMFS_LINK_NAME variable which gets a
default value in the kernel-artifact-names class. Since that class inherits
from the image-artifact-names class we inherit from the
kernel-artifact-names class here, instead.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/qemuboot.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 163c4085ee..d51d1c454c 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -122,7 +122,7 @@ QB_KERNEL_CMDLINE_APPEND:append = " swiotlb=0"
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
 
-inherit image-artifact-names
+inherit kernel-artifact-names
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image_complete
-- 
2.48.1


