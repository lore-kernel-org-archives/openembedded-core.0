Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17351CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:22:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14448.1792124070311808927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=a0VpN893;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FMA8Pj4126428;
	Fri, 16 Oct 2026 03:18:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2VDlW4vNklf2n6THnJ+jw29DJnbHl6VUyEg
	RBB707PE=; b=a0VpN893/k6gP6auIRwBSmuV2uffjWq/uis7a1AEXnlODJFUW52
	RYuI25RFswxaH2Ewsxe+JpjtsfaoJQgviESQgytsCedfHqMKp5YynC6PhzTkW+YS
	0j8rgFRUnHA/xAI8LVeFiooAHr3aw+mTqKG/m0I3+VBy3NNPGoejtyuFwBSKuCn1
	7UDJmClDDy0VkQyo4CPeGg3ekIp7ajzS6YYvp9JZxz4u7eU8Wv9fK/XgdXlTKh/h
	I5y0emgq12XADGTSHxboGOr233tctwV0LXYblAdMzxAf2BUunGvPqb+5crMKFi2F
	nNF3bekcH9eCJsAhyhj2G83OlTV88LyaKdQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb19m2ecv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:03 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3I0Os2744188;
	Fri, 16 Oct 2026 03:18:00 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69G3I0I02744177
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:00 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 3ED5FAC8; Fri, 16 Oct 2026 11:17:59 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 3/7] busybox: enable findfs for initramfs LABEL support
Date: Fri, 16 Oct 2026 11:17:56 +0800
Message-ID: <20261016031756.695339-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=aLdlOr9m c=1 sm=1 tr=0 ts=6ad1976b cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8
 a=skronstXEd1RZOU6cfsA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: aWTDNtDmxuPaZX9Yq8Ftjp_KeufvdD8K
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX7Ngjq4A/4/zh
 yPmOdCcsjk5zv6iG6c5+d1A8KAg0+j/45Ds+jOaZB/6v8hgk6tAdL5hxQK8pKVAIKlutzzc4lJ0
 rmoE73Ou/Gy2DWT9zo3774t0MAMeAfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/7XSsukKAqRw
 0gXi8H7zi2iAiG0jgNBZrO5x2F0B6do4hL2VfLb7I3FHZ0xq4godeo0gLzkRZMxTi4p0+wpn816
 LvypJsxulwDIG47ag3hK2kFylOI0hkLJsU65JeyXugOLSoA9/rFtL0YNPqtfjekzYOYWBoGVR4K
 zSWOJfw/ZPIJDoem/BYK8E3MGNQrLVjG3tqWUM+eVG/7G4O+3CFRZAXKmgYxd0tYHaMW9/xmwnA
 5AftPt5ezDSZM1mnwaI2TbvFhX4/9pxe1O4CnSMyw7OR4X5sE3Wvv9WLA5m2X7Vh3jb20LiUaAW
 3R382VFmzP68kU6iMOTQMy70T4veXzkcSoeg3FtKVPPyLIG9Of/BkboVU9NRzYiI6R0omq89SOn
 lG434lYVBhtFELdoSSiZm0KOzKRhI1UDWoRLviJ5S/UoZSaHl+LGMt6B0053L6+kDW3sP1aUSYZ
 QsyUnugFFWiK2/7aJuA==
X-Proofpoint-GUID: aWTDNtDmxuPaZX9Yq8Ftjp_KeufvdD8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:22:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248035

Use the BusyBox findfs applet for initramfs-framework root=LABEL=
resolution and drop the util-linux-findfs runtime dependency. This keeps
the root-only udev trigger implementation lightweight and removes the
util-linux signature exception.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2b681e39421ae5b4fea917b3c3ed69bd1020b6c)
---
 meta/conf/layer.conf                                       | 1 -
 meta/recipes-core/busybox/busybox/defconfig                | 2 +-
 meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index dabdf55c25..b097c34c7b 100644
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
index 22c9dafcb3..8b344f8960 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -629,7 +629,7 @@ CONFIG_FEATURE_FDISK_WRITABLE=y
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


