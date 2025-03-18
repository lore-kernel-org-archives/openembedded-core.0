Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467C9C28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:50:14 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.8879.1742295005804391021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 03:50:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Olgx2jEY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAHURR010748
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=Tae+CPY236HfPINSBe0d8IXEUjmpgLa3qfcXaCqzK2E=; b=
	Olgx2jEYXQ0mPFKPRp5VRWkFNozOmwM/StQlbxdFSrkQ4Aw3hc645I6RIkMYRq99
	d31BkpROC8F0A9XKvQjnIGuCW+MlWVqaoUsQcX2KIUmXBrprt9+7ojptm9aCcWkx
	m/Aj0RrnIjL9vyhNfCMVWaDhN9hZGo71UeB2pjLFGjqtRfFy6jIrmYBYKHWOucER
	yHhdjA8FVsbAnP0JwwyYbcbGNG0VxXJCd3RpgGotBGB9wo1CsK32xbslcUh94M6S
	AZZjyL07y2WsSVpPWVNgzsfKhkz5wVBttW/WXsZhaDA84nov+BvOlRVu6pxwZPvB
	RQQTG/4WIUeirHPBAO+gSw==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 45ev43uj6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:03 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 11:50:03 +0100
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 11:50:03 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/3] Revert "qemuboot: Trigger write_qemuboot_conf task on changes of kernel image realpath"
Date: Tue, 18 Mar 2025 11:48:51 +0100
Message-ID: <20250318104853.1442703-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
References: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DZUXqutW c=1 sm=1 tr=0 ts=67d94fdb cx=c_pps a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17 a=Vs1iUdzkB0EA:10 a=n9SCklZpAAAA:8 a=TjjuSNKR9mu6yqn2mB8A:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-ORIG-GUID: d6D88Ym6usVDkt5ZUESoKo9X56btL4iw
X-Proofpoint-GUID: d6D88Ym6usVDkt5ZUESoKo9X56btL4iw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213200

This reverts commit f8b3975a9ce36ea7af5fd76243a823da2842415b.

It was the wrong fix for YOCTO 15525 since the variables KERNEL_IMAGE_NAME and
KERNEL_IMAGE_BIN_EXT have the wrong values in an image recipe. Additionally,
new QB_ prefixed variables were introduced in the resulting configuration file
which had no meaning.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 0f80c60ab5..895fd38d68 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -129,8 +129,7 @@ addtask do_write_qemuboot_conf after do_rootfs before do_image
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-                'KERNEL_IMAGETYPE', 'KERNEL_IMAGE_NAME',
-                'KERNEL_IMAGE_BIN_EXT', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
                 'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
-- 
2.48.1


