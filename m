Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B651C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 07:35:37 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14607.1789369846997133945
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 00:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=OPu0aY0+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5irNh2627138
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oy+3aunsti4JBMRlfF4+ECYJZ4nIpXaI5aP
	li62nlPI=; b=OPu0aY0+Pl9yytLCY20oh/zlmnRSJLSDNBmznOxENKCh6zv5GJS
	T83J3v/QMmpcq8ozv9ZNO3q+aH3VsLbgS6QjWVFhO4zAQHb+xJT5T7HhUSfTd7d5
	7iByTUMU0xvQjAmP40Meyi8u+6XBWa2l3PlkczhcUE/XMk/r+1vOw2Ir85xEl76W
	R0Qv7X2PH5FIXCMpihjmf5cJiMnokrJKeML3UDpH5s7nSYihCq6S+zDF163Xo/73
	0bohTStZ5L1vU8POB1QW6a3D8XcdbFYGwb0fDRoqcL3dzcCAq0cI+VK9AWGfKmtz
	L58t2gFbNZuA5DttvfA49C1K93E0uClFMHQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh5aub-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:10:46 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E7AhLC1583585;
	Mon, 14 Sep 2026 07:10:43 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68E7AhYf1583575
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 07:10:43 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id CB611ABE; Mon, 14 Sep 2026 15:10:42 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: allow opting out of efivarfs mount
Date: Mon, 14 Sep 2026 15:10:41 +0800
Message-ID: <20260914071041.1909881-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: ktE6eLgvr7hO6Ap-DJYeIneOVTmJQ2EI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMCBTYWx0ZWRfX09qYfofKhrv7
 iyaP7xH4xwkk3Swxs8JpCFwv/HgqhzZTu5tyIypYR7e/BmHXrnyBMm4/U6g4WPUUQ6ASQeqxS3L
 2xsXVl1gKOXGouDaQXggSB8Y7bGlP6LjBNWKDjhrKXR2MPp71zrihfA1WJQ84U9BgP4/EvhCSZr
 lN4Wpi5LOFDa3nZCXt/zJSmrMyYzxNYFlze2Il9zl2SF5N4qEQwKoAVNYITTp6+uV3GQFuF4fJZ
 4329vyNuPdS0j840QijDHEGV3mFcYKGo09mBysaFD6lsgu2Or7cAeMssSb4k14jZN8OIUk1Ckoh
 HCoEZcsZAiZtHmrsgCbCtFFaEVma016UEHBg2ldLIi7OFOkIjLs7JCJ59tACPis6jXHYi//s4Rx
 SrnOMRQI9pNqujmU6T+G5/BAEkJMwUWzskQrBp4yOtFkXag3dQ7LczClftq3qioPL/0h6QrL4aN
 B1fBFsuUt8FiuK840HQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMCBTYWx0ZWRfX0rtBl0+bPGoj
 HOXnDvOaOn2UvvrU4AilTds1fkT2Oco9xDxnv6XonT/spDHTNYvM5qUixVYX2p5GA5PLVwYpFCK
 NDw/7ofCTLAwtVRwURt76AzK5WnMMYE=
X-Proofpoint-ORIG-GUID: ktE6eLgvr7hO6Ap-DJYeIneOVTmJQ2EI
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa79df6 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=aNJ5eksCtXL9qKsYOLUA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140100
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:35:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245759

The initramfs mounts efivarfs before parsing the kernel command line.
This was added so EFI metadata is available to early consumers such
as mdadm when assembling Intel VROC RAID root devices.

On systems where the real root filesystem mounts efivarfs later, the
early mount is redundant and adds work to the initramfs critical path.
Allow these systems to opt out with initramfs.efivarfs=0.

Parse the command line before deciding whether to mount efivarfs.
Keep the existing mount behavior by default for initramfs users that
need EFI variables before switch_root.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/init             | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/meta/recipes-core/initrdscripts/initramfs-framework/init
index e2da3511b8..5dbf32a12d 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -87,10 +87,6 @@ mount -t sysfs sysfs /sys
 mount -t tmpfs tmpfs /run
 mkdir -p /run/lock
 
-if [ -d $EFI_DIR ];then
-	mount -t efivarfs none /sys/firmware/efi/efivars
-fi
-
 # populate bootparam environment
 for p in `cat /proc/cmdline`; do
 	if [ -n "$quoted" ]; then
@@ -137,6 +133,12 @@ for p in `cat /proc/cmdline`; do
 	fi
 done
 
+# Keep efivarfs available in the initramfs by default.  Systems which
+# provide it from the real root filesystem can opt out of the early mount.
+if [ "${bootparam_initramfs_efivarfs:-1}" != "0" ] && [ -d "$EFI_DIR" ]; then
+	mount -t efivarfs none /sys/firmware/efi/efivars
+fi
+
 # use /dev with devtmpfs
 if grep -q devtmpfs /proc/filesystems; then
 	mkdir -p /dev
-- 
2.43.0


