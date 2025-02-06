Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE6AC0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 08:55:33 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.35427.1738830495610298332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 00:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=EqjiMJA0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5168JxHs021398
	for <openembedded-core@lists.openembedded.org>; Thu, 6 Feb 2025 08:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=n/x+og6YVtexkJGbA8Rd/RIhxXi9ElOzwkW0ima4nKg=; b=
	EqjiMJA0THvFE3xFfhc+pfZUZcb81bh4Qb8+XaUXZZ3Aag7Mnw0qs6G3k5kkOGtG
	QoZnIX4m9UrvuqINX5WUrc3Ep/oDm60s5vkZMVjsofv/+iz9VWcsNVm800wAlvO4
	FRMrbDSNlDj7tPhVUwHgUW1b4Znx3gGX2uaoj1NK/nXmciCl2BGm11onr+V7LTWn
	52gBtw/VFw7QcXANqawVhN/2ipMaLnl0qv42hADlsLX/hA2xV6VnYK7HatxEm9mU
	5M7/1upfRFd7R4riOdDvW8WO4q/yM0SNruBYiDgqhylF8PThvXDzkHkviPPhL9FK
	yGyNW/51VvD+NIL53nCwXw==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 44mqcegp5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:28:13 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 6 Feb
 2025 09:28:13 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Thu, 6 Feb 2025 09:28:13 +0100
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/2] kernel-fitImage: Take possible multiconfig into account.
Date: Thu, 6 Feb 2025 09:26:56 +0100
Message-ID: <20250206082657.209052-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206082657.209052-1-pascal.weisser.ext@karlstorz.com>
References: <20250206082657.209052-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: D93NCkuaDMLT_w8fjz3HHcJ6bHwdrLIf
X-Proofpoint-GUID: D93NCkuaDMLT_w8fjz3HHcJ6bHwdrLIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 08:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210909

When specifying the dependencies of do_assemble_fitimage_initramfs the
initramfs image might be built with another multiconfig. This needs to be
taken into account.

The path of the initramfs image also needs to be adapted to handle the
case when it's built with another multiconfig.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index fe076badfa..0484d1b780 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -39,7 +39,11 @@ python __anonymous () {
 
     image = d.getVar('INITRAMFS_IMAGE')
     if image:
-        d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+        if d.getVar('INITRAMFS_MULTICONFIG'):
+            mc = d.getVar('BB_CURRENT_MC')
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'mcdepends', ' mc:' + mc + ':${INITRAMFS_MULTICONFIG}:${INITRAMFS_IMAGE}:do_image_complete')
+        else:
+            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 
     ubootenv = d.getVar('UBOOT_ENV')
     if ubootenv:
@@ -632,7 +636,7 @@ fitimage_assemble() {
 		# Find and use the first initramfs image archive type we find
 		found=
 		for img in ${FIT_SUPPORTED_INITRAMFS_FSTYPES}; do
-			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
+			initramfs_path="${INITRAMFS_DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$img"
 			if [ -e "$initramfs_path" ]; then
 				bbnote "Found initramfs image: $initramfs_path"
 				found=true
-- 
2.48.1


