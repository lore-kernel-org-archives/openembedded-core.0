Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE0CC79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 14:39:57 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8940.1788878115623817503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 07:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FGTWw4HN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1cVi2411854
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Sep 2026 14:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=kfVqRSC8/46RMDn0FSL/eB11B9MrNxU/wAm
	JYl1MN4k=; b=FGTWw4HN0JG3eyfRmpKVt9SLC52J2HLQrHHP4Sw97Ir1SV8DQ4z
	bXJ+E+DqqtVKc0vMaIpyxdC0cUEeAC4OMn+tdgZRXqT3DgTLlaQbmLjl5kNwvzCj
	OgcRed/M1bpfDfxaBcXXBNnoWx3jDk5XQ7DW//ojSNyHWYqJOGwdA4Yi+gTTi88W
	Ss689LvA1dYXDy4kecoXV901ZxIzXLBN1iYBuaN37PR1HdlrWMr52Gdy5reeeI9V
	Pzvojpm6IMyFAR4lPGlGrKlmPSP3rTonDz3m+QNFsPbuRuzH/+sXLpJGmG5rngBa
	5G1GmUtgnauRx486YHxweNAABxDsFIm2pcw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvugau7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:09:02 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 688E90IU4156579;
	Tue, 8 Sep 2026 14:09:00 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 688E8xjv4156568
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 14:09:00 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 4BB0BAB5; Tue,  8 Sep 2026 22:08:59 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] busybox: enable findfs for initramfs LABEL support
Date: Tue,  8 Sep 2026 22:08:57 +0800
Message-ID: <20260908140857.3941146-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: RPoyWWKlp5uJThgv2A17pOar0l5UcWvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MiBTYWx0ZWRfXy0RG8+gdLY5J
 /ySv9MDbjm9oM8gi2eWFgLf0OR8klbAYwPFbJGU433HK1v3L10vnuP0YvHC/uwPErf197EzvCKS
 L8/jrdriKkG7eeQ/X/rMqYns2CJWoFbL2W74KMP1vzGP6eo1N+2dLtiWvNGIoLWD5yRc2jBPxH8
 Eg6IAExOwPtUs3zPd3nmJxawfmMuaXefYcFtQE14RHI05NDlt5sYN3/3tOfY8uJs39o+HVcAsLZ
 bdB4lnbwcOMl1ukjZJXckIW3VYcEzboQ6KePOc1rAzzaQZoc4ytspUjU0ASUtNCivB5C3LAXCGm
 OdTNL2B4S1+Tv7p3YsIxShKGekGKS1uhauU/Hc7TJ2sHeWtvgL4873oO3BQsozTOyq32bRKMEuE
 Z4bOEYxyalmjDwwFap4zBXx1OO8R7Me0WsqNVDPovtuLyc4Lf/b9nU0u7lnCz8NicoHVx9vzMnr
 RAh3WVKcnaC5ftGGm8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MiBTYWx0ZWRfXxm/FLBJo/m0b
 p6BaQPvHmYTTZlO5oGRLwYTp68ppkf8NwEQJZot079FB2A++36UBb6OcCVbbUiiRPIhNugXzoc9
 Hq83STuskPpzWQo2wZqbqnvae1azwsw=
X-Proofpoint-ORIG-GUID: RPoyWWKlp5uJThgv2A17pOar0l5UcWvx
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa016fe cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=skronstXEd1RZOU6cfsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080152
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 14:39:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245368

Use the BusyBox findfs applet for initramfs-framework root=LABEL=
resolution and drop the util-linux-findfs runtime dependency. This keeps
the root-only udev trigger implementation lightweight and removes the
util-linux signature exception.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 meta/conf/layer.conf                                       | 1 -
 meta/recipes-core/busybox/busybox/defconfig                | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 1ad34b430d..b91ce3e437 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -61,7 +61,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
   initramfs-framework->eudev \
   initramfs-framework->systemd \
-  initramfs-framework->util-linux \
   initramfs-module-install-efi->dosfstools \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index 1f4b5e3d1e..a282370a8f 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -634,7 +634,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
 # CONFIG_FEATURE_OSF_LABEL is not set
 # CONFIG_FEATURE_GPT_LABEL is not set
 # CONFIG_FEATURE_FDISK_ADVANCED is not set
-# CONFIG_FINDFS is not set
+CONFIG_FINDFS=y
 CONFIG_FLOCK=y
 # CONFIG_FDFLUSH is not set
 # CONFIG_FREERAMDISK is not set
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 936cd0c995..2ec03bc34c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -88,7 +88,7 @@ RDEPENDS:initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES:initramfs-module-mdev = "/init.d/01-mdev"
 
 SUMMARY:initramfs-module-udev = "initramfs support for udev"
-RDEPENDS:initramfs-module-udev = "${PN}-base udev util-linux-findfs"
+RDEPENDS:initramfs-module-udev = "${PN}-base udev"
 FILES:initramfs-module-udev = "/init.d/01-udev"
 
 SUMMARY:initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
-- 
2.43.0


