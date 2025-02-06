Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F43C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 17:44:06 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web10.42249.1738852062902995920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:27:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=gGtMAzC/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: daniel.mueller@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EOvor016171
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 14:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=d9icKDjYtdYQSqD3w11JlJpq6Vqt6/Gxdw2lCQ5h1Nk=; b=
	gGtMAzC/iRM3MCTa/oUwt1gzCE/VOQ/kLQft0mbn7nZUvFEqVnB6YMFXBBqfOGfb
	PMKqLdZFRz02sABond7MIQ1dYyzOmH47v2IxCvUnGhsqlW5qxO9w59AznC3j3JZa
	4PR8am4hhSbV8pkGQcMQ4y/XFsniALWDvetim1cx0s6z2FzTM4ad/tRpHNEpGpmw
	UVshb9snAPas/3TG4pRVdec16OJxrafrs7IUIG05E/qbToCMHDsWzhSmojvb0tvb
	iT4Dhx/CoTc5S6np0GPwFuXIRrdkv8YfF1YUzMFgQPJxdYlS9dNu8/0QPSlxVWiZ
	uz6vurYHFRYFnDxo41UnNQ==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mv18sb75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:27:41 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 15:27:40 +0100
Received: from tutn-2ybjpn3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 15:27:40 +0100
From: "Mueller, Daniel" <Daniel.Mueller@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>,
        "Mueller, Daniel"
	<daniel.mueller@karlstorz.com>
Subject: [PATCH 2/3] kernel-fitImage.bbclass: Handle possible multiconfig.
Date: Thu, 6 Feb 2025 15:22:08 +0100
Message-ID: <20250206142603.3870360-4-daniel.mueller@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
References: <20250206142603.3870360-2-daniel.mueller@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-GUID: KhNSyNq9VpNslAfMmnbdoG9680XFFTrZ
X-Proofpoint-ORIG-GUID: KhNSyNq9VpNslAfMmnbdoG9680XFFTrZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 17:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210958

From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>

When specifying the dependencies of do_assemble_fitimage_initramfs the
initramfs image might be built with another multiconfig. This needs to be
handled.

The path of the initramfs image also needs to be adapted to handle the
case when it's built with another multiconfig.

Signed-off-by: Mueller, Daniel <daniel.mueller@karlstorz.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index fe076badfa..48110a76d0 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -39,7 +39,13 @@ python __anonymous () {
 
     image = d.getVar('INITRAMFS_IMAGE')
     if image:
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+        if d.getVar('INITRAMFS_MULTICONFIG'):
+            mc = d.getVar('BB_CURRENT_MC')
+            if mc == 'default':
+                mc = ''
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        else:
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     ubootenv = d.getVar('UBOOT_ENV')
     if ubootenv:
@@ -632,7 +638,7 @@ fitimage_assemble() {
 		# Find and use the first initramfs image archive type we find
 		found=
 		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			initramfs_path="${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
 			if [ -e "$initramfs_path" ]; then
 				bbnote "Found initramfs image: $initramfs_path"
 				found=true

