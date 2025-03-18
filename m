Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E40C35FF9
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 10:50:14 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web11.8881.1742295012204049788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=KRS/J17C;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IAHkmi031379
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=MuAWH9tnOOJ/KuJb/WVLIxzbgLQzSJQ7+d/E35BImgs=; b=
	KRS/J17CZYgaKjAGubUV3aF42avwvll9MsYHcTR19WsEgf70f7StvYb9Q8aFhZvj
	m5hD2ss9A57F29EoL8KuOz5E3natH2IOyxqWZoLInbNCnYPvEib4jHkEmt8+2r6U
	F8XQsKcJIZKEWkdvN1IBefK3FP5LaRqR1vaV9C1b74lJKI8psoorqQv1rUH9DpkV
	QGosVA7FHwuTTUxJuWJoFKrLq+herRfUckozcaq0yFNXXyAajxWqF4uCtpwMNMUT
	LVl3MH+b0BYnoHfauY5RmOIHT2LjiYMpjIP0pzr06VncunAYgjVgBo7yN58qRGow
	7YHAD79kVp5RYe0nNm7rGQ==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 45ev42bj4m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:10 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 18 Mar
 2025 11:50:05 +0100
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 11:50:05 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 2/3] qemuboot: Trigger do_write_qemuboot_conf task on bundled initramfs changes
Date: Tue, 18 Mar 2025 11:48:52 +0100
Message-ID: <20250318104853.1442703-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
References: <20250318104853.1442703-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: aDrgerxJ0uJrw1KmlrhxPnjVYFemY2Lb
X-Authority-Analysis: v=2.4 cv=O+s5vA9W c=1 sm=1 tr=0 ts=67d94fe2 cx=c_pps a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17 a=Vs1iUdzkB0EA:10 a=n9SCklZpAAAA:8 a=fg3dOzWSOu3yfuG-emQA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: aDrgerxJ0uJrw1KmlrhxPnjVYFemY2Lb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 10:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213201

This change is needed for several reasons:

First, the do_write_qemuboot_conf task needs to access the deployed kernel
symbolic link in DEPLOY_DIR_IMAGE for determining its real path. If the
kernel symbolic link isn't already deployed, its real path cannot be
determined.

Second, an initramfs might be embedded into the kernel. Making changes to
the initramfs doesn't necessarily trigger the do_rootfs task of the file
system that includes the kernel but it triggers the do_deploy task of the
kernel. In order to trigger the do_write_qemuboot_conf task in this case,
too, we need the dependency on the virtual/kernel:do_deploy task.

When the do_write_qemuboot_conf task is triggered, we do not necessarily
need to create a new image, thus, we only demand the task to be executed
before the do_image_complete task.

Fixes: [YOCTO #14520]
Fixes: [YOCTO #15525]

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/classes-recipe/qemuboot.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 895fd38d68..163c4085ee 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -125,7 +125,7 @@ QB_DRIVE_TYPE ?= "/dev/sd"
 inherit image-artifact-names
 
 # Create qemuboot.conf
-addtask do_write_qemuboot_conf after do_rootfs before do_image
+addtask do_write_qemuboot_conf after do_rootfs before do_image_complete
 
 def qemuboot_vars(d):
     build_vars = ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
@@ -134,6 +134,7 @@ def qemuboot_vars(d):
                 'STAGING_DIR_HOST', 'SERIAL_CONSOLES', 'UNINATIVE_LOADER']
     return build_vars + [k for k in d.keys() if k.startswith('QB_')]
 
+do_write_qemuboot_conf[depends] += "virtual/kernel:do_deploy"
 do_write_qemuboot_conf[vardeps] += "${@' '.join(qemuboot_vars(d))}"
 do_write_qemuboot_conf[vardepsexclude] += "TOPDIR"
 python do_write_qemuboot_conf() {
-- 
2.48.1


