Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8A5C0219F
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.42531.1738852064720667215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:27:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Lxza7C8i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: daniel.mueller@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EPANf016654
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 14:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=sFw5J8upj4Kf+kPaXEwdOZ2hA5WPsMl5WIFe8jhuOKc=; b=
	Lxza7C8idgBqG3tLqKKpDjaIihcOME6rHV6X9m2LSfJk3CiBRAhbDefuw1agQD8+
	jBXU6i/ElSNgLWqzGGOHx6AcC7TdMWZZhTu9YGh9vh2lfzfGq0htfIPYqAA0OCG3
	QTHMpgreh+cYhBeaeTN8W1DGY24tr+EebdEQ67iHHpoe6QLRIe4l1FALmvjbm0oy
	XNON+tuYIfxckKd4RhPRuCiKd19fgElCFIe7bQsaG6coxbEGsaOIkYE5SbLkhEjj
	rdqcwk9ROPHaoh0RcM81ArrJmkyBMxirh5Gj0HbJQRRiDTXsRjh94kxejs9wyJKD
	5b0s2WVYXjnV4U//kbq8MA==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18sb77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:27:42 +0000 (GMT)
Received: from TUT-EX20-PV.KSTG.corp (10.0.10.224) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:42 +0100
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX20-PV.KSTG.corp
 (10.0.10.224) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:42 +0100
Received: from tutn-2ybjpn3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 15:27:41 +0100
From: "Mueller, Daniel" <Daniel.Mueller@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>,
        "Mueller, Daniel"
	<daniel.mueller@karlstorz.com>
Subject: [PATCH 3/3] kernel-fitImage.bbclass: Remove dependeny on initramfs image when bundled.
Date: Thu, 6 Feb 2025 15:22:09 +0100
Message-ID: <20250206142603.3870360-5-daniel.mueller@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
References: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-GUID: o2Jar7E5j25mK1DcujXVjciG2BWEwLTT
X-Proofpoint-ORIG-GUID: o2Jar7E5j25mK1DcujXVjciG2BWEwLTT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210959

From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>

In case the initramfs image is bundled into the kernel there's no need to
specify a dependeny on the do_image_complete task of the initramfs image
from the do_assemble_fitimage_initramfs task since the task won't access
the image.

Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index 48110a76d0..11fbe6d453 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -38,7 +38,7 @@ python __anonymous () {
         d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', d.getVar('KERNEL_IMAGETYPE_REPLACEMENT')))
 
     image = d.getVar('INITRAMFS_IMAGE')
-    if image:
+    if image and not bb.utils.to_boolean(d.getVar('INITRAMFS_IMAGE_BUNDLE')):
         if d.getVar('INITRAMFS_MULTICONFIG'):
             mc = d.getVar('BB_CURRENT_MC')
             if mc == 'default':

