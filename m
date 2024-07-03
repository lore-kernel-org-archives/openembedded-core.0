Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24E1C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 15:18:06 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.48906.1720009468805859974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 05:24:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=VQ9vikxf;
 spf=pass (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4638iTFW008088
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 12:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=ARBUw
	tu+K2OZ599xdkoAJgMZZ7ZIYMaan3Rux0pF6l4=; b=VQ9vikxf2qm3zfEoI0fnx
	/ivmnIkDC140T1iLvibsQIr1rQSRJlhrP08jna2mEADZ+SE2aXVs+K/GdFqWNB4X
	SQ5Uw9adHWVgVSurU81lkvvOzgXRsrsLRSUyejeGeq+7tmDD8FlX1cv/E7dNj/vq
	oDaPCRw2S+YJL8Vi4WGWnUbucH0gJM2Ij/iCZX94NqKf/F9fVu7PN8Zcxv7wu/f3
	+0v2BWj0whKNyn287pFLeOUtkWt1cIasepyZOj71VNuZ0dZJyb7xsbu2mzvEItj8
	QMryadnA1JvZmZ9NWkjsnOg/d23i/TcX/foBqsRRgpwhDij0Ech10YZQe/cN/ajJ
	w==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4052jnj2wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 12:24:26 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 14:24:25 +0200
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 14:24:24 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 14:24:24 +0200
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH] qemuboot: Trigger write_qemuboot_conf on changes of kernel image realpath.
Date: Wed, 3 Jul 2024 14:22:47 +0200
Message-ID: <20240703122247.533463-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Proofpoint-GUID: Y9Qey2sabXewXtrBvtCxBJUXMzO_aFei
X-Proofpoint-ORIG-GUID: Y9Qey2sabXewXtrBvtCxBJUXMzO_aFei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 15:18:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201492

The qemuboot.conf file contains the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL. So, it must be recreated in case the
realpath of the referenced kernel image changes.

The variables KERNEL_IMAGE_NAME and KERNEL_IMAGE_BIN_EXT determine the
realpath of the kernel image relative to DEPLOY_DIR_IMAGE. Adding both of
them to the vardeps of the write_qemuboot_conf task triggers the
write_qemuboot_conf task in case the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL changes.

Fixes: [YOCTO #15525]

Signed-off-by: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 895fd38d68..0f80c60ab5 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -129,7 +129,8 @@ addtask do_write_qemuboot_conf after do_rootfs before do_image
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
-                'KERNEL_IMAGETYPE', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
+                'KERNEL_IMAGETYPE', 'KERNEL_IMAGE_NAME',
+                'KERNEL_IMAGE_BIN_EXT', 'IMAGE_NAME', 'IMAGE_LINK_NAME',
                 'STAGING_DIR_NATIVE', 'STAGING_BINDIR_NATIVE',
                 'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
-- 
2.45.2


