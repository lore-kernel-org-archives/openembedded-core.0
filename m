Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DDBC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 11:54:45 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.48331.1720004177898803575
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 03:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=TOsE1cYx;
 spf=pass (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4638iTVo025019
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Jul 2024 10:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=SmgcF
	eaXE95Nit6WGoqrz/K6+gWFgWPDO93iVGUpMsc=; b=TOsE1cYxqI8Ce7TG8EeH2
	I5Ay5fxX6f44RS6bxKTdC/VHuK7im/WVNfLLhFD84nJ9pb0FnSy/V3TS3ZfjmF0O
	DNRlBSuzWOodi12i3GEeytZKWuLDKDDoaxtTwnWrMUvpNH6viVtnQZilzneD45qT
	hmx0TYfIeLrc/2AkoQ4gd4yQIH3DUZAVN96HA2tpnJJufYPRIwHQ+NvtgwLW+kbZ
	XchujwWgP1fgPLcXW5oCLHhPuA9OFNh0o1+8pYW/B0VPMUzDxY5ApKrsqWVMimlc
	pvDfOdLQG8S/ymV0sNxYT4Yj7hFVSIFgQIBNV5tSCCyAETkQIVhNuB9f9UotcjrS
	A==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 404deukc9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 10:56:15 +0000 (GMT)
Received: from TUT-EX21-PV.KSTG.corp (10.0.10.225) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 12:56:15 +0200
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX21-PV.KSTG.corp
 (10.0.10.225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 12:56:15 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 12:56:14 +0200
From: "Weisser, Pascal.ext" <Pascal.Weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH] Trigger write_qemuboot_conf task on changes of kernel image realpath.
Date: Wed, 3 Jul 2024 12:56:03 +0200
Message-ID: <20240703105603.429817-1-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Proofpoint-GUID: xZm8jkN3n2u_F2g438Bx0cn7LZW0Pccz
X-Proofpoint-ORIG-GUID: xZm8jkN3n2u_F2g438Bx0cn7LZW0Pccz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_06,2024-07-03_01,2024-05-17_01
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 11:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201468

The qemuboot.conf file contains the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL. So, it must be recreated in case the
realpath of the referenced kernel image changes.

The variables KERNEL_IMAGE_NAME and KERNEL_IMAGE_BIN_EXT determine the
realpath of the kernel image relative to DEPLOY_DIR_IMAGE. Adding both of
them to the vardeps of the write_qemuboot_conf task triggers the
write_qemuboot_conf task in case the realpath of the kernel image
referenced by QB_DEFAULT_KERNEL changes.

Fixes: [YOCTO 15525]

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


