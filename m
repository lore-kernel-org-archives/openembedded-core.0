Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C0FC02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 08:55:33 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.35602.1738830507807803281
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 00:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=IX51rw/7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168KBne022823
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 08:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=P0cmtjPQzm88N+vfJDo3AkKmC/jRFZq/0zEVY1AAd2o=; b=
	IX51rw/7KIJ3o9UearO1lOyeRKel5JhALWVVGkfZ1oBiqTJrKVhxjXn49LFBstVT
	aAdIXPwsZ11EWb8C/RaT4UeJOjJa2jgFUTvZY6WjNMjOWYpS3/+AKPPCHrpXQi+C
	c6nmGGBAaWxuS4jm+G8dlgv1i/VDHw1ogNALiw6xnKicE1amtDkEi6B0fjMW70pw
	QjWE+YmX6yKURDkaxy4rz/8A+hKeEGzVGJ9BUt1gmKDM1Qg+hCpEK3EcyupbcpH5
	PqT5dTSbaKWN7YvK57fJ3Vufd2GAsljdSSUMqK4HIOUFZNAhq4AUmJWns+NYfe4N
	hMR8FVjndPPeARw9vjqOLA==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mqcegp6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:28:26 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 09:28:25 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 09:28:25 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 09:28:25 +0100
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 2/2] kernel-fitImage: Remove dependeny on initramfs image when bundled.
Date: Thu, 6 Feb 2025 09:26:57 +0100
Message-ID: <20250206082657.209052-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206082657.209052-1-pascal.weisser.ext@karlstorz.com>
References: <20250206082657.209052-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: ti5SkJcGkmRRzFOvSkv--a5e6aHApMc8
X-Proofpoint-GUID: ti5SkJcGkmRRzFOvSkv--a5e6aHApMc8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210910

In case the initramfs image is bundled into the kernel there's no need to
specify a dependeny on the do_image_complete task of the initramfs image
from the do_assemble_fitimage_initramfs task since the task won't access
the image.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 0484d1b780..4df71d9ec3 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -38,7 +38,7 @@ python __anonymous () {
         d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
 
     image = d.getVar('INITRAMFS_IMAGE')
-    if image:
+    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
         if d.getVar('INITRAMFS_MULTICONFIG'):
             mc = d.getVar('BB_CURRENT_MC')
             d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
-- 
2.48.1


