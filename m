Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DCAC88E50
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 07:35:27 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14570.1789368914865998330
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 23:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bRI1VKsd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ivXs3739600
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uF0KU8y/5uXyEAYWQYIO2J0JhN/g48tFtU8
	hSJL7HLc=; b=bRI1VKsde7pEkuSXCE3UPMEOD3HtmLU46neTkZzo5cU9eYbLAdl
	zjB2QPt4eeho/qZI3S1G+k4J8LQCDFVaNABA710i6L6TFvJ1WiR6jWGzTvoVw4EA
	GySHq/clAnhPNCQY0UCSUMK47exManVuTkMgG71D2w06g5YLMLH76WH/pvXxiUdq
	igXUWaRX3Q2MSDt/BIhzZHYZ6U+VEC6xpLycFxp8apiNLQqkyKRRIPEF9mMXl9aG
	NgHM9bANrvA82PfmCXsLIkM8oMP3khH4+BdMnPmgnETSvzgLQVEqeHsQTZRvpbQx
	V4h0DFTSP1FvY5auwYmETCvAKcuRGI1rYGw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dd7h4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:57:20 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5vILM1494439;
	Mon, 14 Sep 2026 05:57:18 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 68E5vILu1494430
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 05:57:18 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 30907ABE; Mon, 14 Sep 2026 13:57:17 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: avoid external commands in rootfs resolution
Date: Mon, 14 Sep 2026 13:57:15 +0800
Message-ID: <20260914055715.1787659-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4MSBTYWx0ZWRfXz9+QRRVI+2wB
 tk09Zia6J1S35Y2haBWQL4vFHqXiDbBbHghWT9oSNdB0bOcan9Q8LlKyWu61gfabtj2SMPYEdFW
 UaZ2jZObZ8qrjuGcMWFdkeVs6zHWiOy98D0TDduu1ufT3GKk6dRe3ngQ5TEtCPnE3V6bpDBqCd7
 eAlWXIfnTR2cn5AksbLE26ePL6vCHB9XlUFWOL8Yd8/V5zFXSfBkL2e3PxJxxglU90EXz6uGUxK
 wI14TGC0omwEzdVZwOT5UV+9oOGwXmjpLEwutYXUZGuDv8TIrv2HzwtvgfHEfXQojfkbstOt174
 mMmVZmixDLAocLYs/zpoaSF6PUQy80Hbgm8a+WJtA0FWmPOcifh46lQEegkW4DR5OA5INvx3KNu
 QfNEY7FEGCwSCfR3m71BKTP41jS3AEXmmO98jZmr4cKjqO8NYJnRc55dnZdAOsmQNuzVXSvpV00
 DHsY9rzcDA9lzEp/msw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4MSBTYWx0ZWRfX51yUrDiTXuk/
 f+XM4PkZ6QDM43wv5DAvFrdFtvQeB68drRqfry8rTao025+iHU4fktDknzT35NZ/sd9h5bexpZr
 pH+nvIce9+sJOmDTeW5k833f47t4aBs=
X-Proofpoint-GUID: kSMpv-dP8G44n8z-Psf68PRSVRUrFn__
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa78cc1 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ta7tWWm259d0VICi_JYA:9
X-Proofpoint-ORIG-GUID: kSMpv-dP8G44n8z-Psf68PRSVRUrFn__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140081
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245758

The rootfs module uses echo, cut, and grep to resolve root=
identifiers. This starts several short-lived processes before
checking the root device.

Use POSIX shell case matching and parameter expansion for UUID,
PARTUUID, PARTLABEL, and LABEL identifiers. Validate ubiN:
identifiers with shell pattern matching while preserving the
existing behavior.

Measured on rb3gen2-core-kit with root=LABEL=otaroot using
rootfs-resolve-start and rootfs-resolve-end kernel markers:

  before: 18.195 ms
  after:   0.089 ms
  improvement: 18.106 ms (99.5%)

The overall rootfs time is also affected by storage mount
variability, so the resolution interval is the direct measurement.

Tested with dash and BusyBox sh syntax checks.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/rootfs  | 37 +++++++++++--------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index df0cbfb091..05557be211 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -21,21 +21,28 @@ rootfs_run() {
 		if [ -n "$bootparam_root" ]; then
 			debug "No e2fs compatible filesystem has been mounted, mounting $bootparam_root..."
 
-			if [ "`echo ${bootparam_root} | cut -c1-5`" = "UUID=" ]; then
-				root_uuid=`echo $bootparam_root | cut -c6-`
-				bootparam_root="/dev/disk/by-uuid/$root_uuid"
-			elif [ "`echo ${bootparam_root} | cut -c1-9`" = "PARTUUID=" ]; then
-				root_partuuid=`echo $bootparam_root | cut -c10-`
-				bootparam_root="/dev/disk/by-partuuid/$root_partuuid"
-			elif [ "`echo ${bootparam_root} | cut -c1-10`" = "PARTLABEL=" ]; then
-				root_partlabel=`echo $bootparam_root | cut -c11-`
-				bootparam_root="/dev/disk/by-partlabel/$root_partlabel"
-			elif [ "`echo ${bootparam_root} | cut -c1-6`" = "LABEL=" ]; then
-				root_label=`echo $bootparam_root | cut -c7-`
-				bootparam_root="/dev/disk/by-label/$root_label"
-			elif echo "${bootparam_root}" | grep -q '^ubi[0-9]\+:'; then
-				bootparam_rootfstype="ubifs"
-			fi
+			case "$bootparam_root" in
+				UUID=*)
+					bootparam_root="/dev/disk/by-uuid/${bootparam_root#UUID=}"
+					;;
+				PARTUUID=*)
+					bootparam_root="/dev/disk/by-partuuid/${bootparam_root#PARTUUID=}"
+					;;
+				PARTLABEL=*)
+					bootparam_root="/dev/disk/by-partlabel/${bootparam_root#PARTLABEL=}"
+					;;
+				LABEL=*)
+					bootparam_root="/dev/disk/by-label/${bootparam_root#LABEL=}"
+					;;
+				ubi[0-9]*:*)
+					ubi_prefix=${bootparam_root%%:*}
+					ubi_digits=${ubi_prefix#ubi}
+					case "$ubi_digits" in
+						''|*[!0-9]*) ;;
+						*) bootparam_rootfstype="ubifs" ;;
+					esac
+					;;
+			esac
 
 			if [ -e "$bootparam_root" ] || [ -n "$bootparam_rootfstype" ]; then
 				flags=""
-- 
2.43.0


