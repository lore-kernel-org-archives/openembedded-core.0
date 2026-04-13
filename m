Return-Path: <rouven.rastetter.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656DAE937F7
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 11:25:10 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.270130.1776079501798098028
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 04:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=atoHCudE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=25637fb8b7=rouven.rastetter.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D3Jtr6181697
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=S-DKIM-20210427; bh=BDOYl
	q8ekzz6hLU5KfF7MLtazC/aX2p08DIw8LlS0D4=; b=atoHCudEYZIbp5Ctp/tlR
	v8a6E5XCXM2gP/2/n0ma6wwaylYDaXBIIBZVNB7npFV+Fag9ECgcYBfLvAfRgR/W
	3OnBQHnIBdiS4zfm/oe/1u1JA3vOJvFBg/ked4Ioke9GhaqLZc1+rE5VEK5p4Bj1
	rr9yAQOTgYuY3k9kkS2qxdR0gtgOUeXUu7ZBMxzlVOueKAPes+dm4gRp7BrKFjkQ
	/K+3xzPW4ZUtJh1bL3j6A5DDoWZQypawyXcji18EmY+wyHGCru7EFAM6n8fKFS9T
	cEQrNkROBP74UlC7xbeVRtOdJgIRQdvZ4N+kIZKHHGw9X7zYMro2wm04MyxMWyHS
	Q==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4dfenmmtyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:24:59 +0000 (GMT)
Received: from TUT-EX02-PV.KSTG.corp (10.0.10.191) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Apr
 2026 13:24:59 +0200
Received: from tutn-jjhfqf4.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.191) with Microsoft SMTP Server id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 13:24:59 +0200
From: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
Subject: [PATCH] kernel-fit-image: Fix support for initramfs multiconfig
Date: Mon, 13 Apr 2026 13:24:43 +0200
Message-ID: <20260413112443.2620508-1-rouven.rastetter.ext@karlstorz.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Osl/DS/t c=1 sm=1 tr=0 ts=69dcd28b cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DBWTBMGyQNCzyBkTEoZL:22
 a=-VCclSYHLTda9MBvNMHz:22 a=n9SCklZpAAAA:8 a=ZsxuVLYbRbGrTTXyPwMA:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDExMiBTYWx0ZWRfX09orOR+WgQ0R
 +cMZOOJmRHnw265A3onAUW3cqA1Nz0vK6XQAZZYk/xEFe4e17LvUseNupgroYWYzGCGbb8R1Hpa
 Onbl/cpU5j6VtVve/jk00N1LDs5SsIJSrMjBjpnnKJK99udMRRQMBbcwTF+plTKPf8zkU8JVrD+
 C9X+XEsiskFrZb/fyCUzdHTTog/aXkA1T3hSpJjHRrEA0axLiMcAWtHj4scrxroOmKvvACHbrwX
 11RBJY97mEd6zWX3Qu0WW5NYXqT4uya2uBFAdw+CS2OqtNyvoq767tGdkx5/p9C9dBEeL11eUqP
 ouy570OIVCS6sFw01m8IHlK0ZJE4cteH9xlqHgiBWFqRHyfGiVr9DomyXxgN/5WnD4h8KFj0/xa
 /RO5+jXLjP4rKPL2pXxgpX/U437ORWYg8ZyyfNl12a0tNyTxpoQn1ExRk+o68AxVYAHezx9nNjF
 cteYGndG36hWgmzV98g==
X-Proofpoint-GUID: mdPExUUX6w_ZTU0UdRvDQh3DmWjurDRN
X-Proofpoint-ORIG-GUID: mdPExUUX6w_ZTU0UdRvDQh3DmWjurDRN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_01,2025-10-01_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 11:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235102

In the transition from kernel-fitimage.bbclass a fix for initramfs
multiconfig was partly reverted, maybe because the default value for
INITRAMFS_DEPLOY_DIR_IMAGE is only set in kernel.bbclass and therefore
not accessible in kernel-fit-image.bbclass.

This fix introduces INITRAMFS_DEPLOY_DIR_IMAGE in kernel-fit-image.bbclass,
so initramfs multiconfig works as expected.

Signed-off-by: Rouven Rastetter <rouven.rastetter.ext@karlstorz.com>
---
 meta/classes-recipe/kernel-fit-image.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/classes-recipe/kernel-fit-image.bbclass
index 367bc9bcfd..ae8f3c6688 100644
--- a/meta/classes-recipe/kernel-fit-image.bbclass
+++ b/meta/classes-recipe/kernel-fit-image.bbclass
@@ -47,6 +47,7 @@ python () {
 
 do_configure[noexec] = "1"
 
+INITRAMFS_DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR_IMAGE}"
 UBOOT_MKIMAGE_KERNEL_TYPE ?= "kernel"
 KERNEL_IMAGEDEST ?= "/boot"
 
@@ -139,7 +140,7 @@ python do_compile() {
         # Find and use the first initramfs image archive type we find
         found = False
         for img in d.getVar("FIT_SUPPORTED_INITRAMFS_FSTYPES").split():
-            initramfs_path = os.path.join(d.getVar("DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
+            initramfs_path = os.path.join(d.getVar("INITRAMFS_DEPLOY_DIR_IMAGE"), "%s.%s" % (d.getVar('INITRAMFS_IMAGE_NAME'), img))
             if os.path.exists(initramfs_path):
                 bb.note("Found initramfs image: " + initramfs_path)
                 found = True

