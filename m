Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FDECCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:21:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14096.1792122334759674810
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:45:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=khJ2aqc8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2BWxH3902225;
	Fri, 16 Oct 2026 03:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+ixb8MvLqE2x3uT3iCQrHs/vbfVC8fgpx5X
	9f0OClfA=; b=khJ2aqc8XmgdYkZdsHtLmaEQFzXAPw/CrfUsNcMaxmwnhE3yxzk
	GrrMF5jh6/VCBTXj9pfLs8W05cwfL35r+MvuAcD6xpaPzVyiAC33pFqY2J2b/136
	noM8B+5vW4hwWj6JucPCQVoaJErMRhB2+xWb+Am/bseol5NecTpmjqhto2yz2p95
	Ykws6FEYC1JrttURwoWw5DaE7oyhWr3gKnfKUV8kW387KolRN/NoF4hTmjUs6AUJ
	UHQslkxECPEh9WA6/DhHpsAWyt9Lw0txDn6LQK+g+O+ecrIkor9BbtxE0puxNE/b
	6TUuR7kePdUoIV9x9zSN7rXHFfyt6I+M++A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sesrxx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:19 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3HOFI2742998;
	Fri, 16 Oct 2026 03:18:17 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3IHFP2743879
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:18:17 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 62C2AAC8; Fri, 16 Oct 2026 11:18:16 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 4/7] initramfs-framework: avoid external commands in rootfs resolution
Date: Fri, 16 Oct 2026 11:18:14 +0800
Message-ID: <20261016031814.705324-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: rSuAUh7QN2tMipZiLB5hgDJbOScV5365
X-Proofpoint-GUID: rSuAUh7QN2tMipZiLB5hgDJbOScV5365
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXyD/6wFZ7fHcm
 ioKh72YVRCs/HMnXfpfQGKjHTQBqkU8JYeNACjGbB7WtMfJdi/hTmmvJafLCXYnzRBdD7Qwz9qz
 dEGTnNbphR7HxKAWpkuoYbuagn7/NLQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX18t8zISrp6ly
 pUcrYXeN2OSa51CJUjik/GUDS17t5FJCzHD9TbKG0hud0OqkX3kfBPLuPzL62XEpy4+BPMLJ+t0
 ctq9A4nIv22Frd4oeq9s+DOxHA4r8yJxCNMBpsBSVytcdoBQQjf5m+/V3YGLrKF3WQw+2fxz6Dh
 30y1oklQj0QbWWIj6oFOr8G+enh0yELfbLFvfuDHuSlFR7ES4d59lirlpSaYN3sJF9VSZeOCZgd
 VKuNwG+deGkok1HMXwS64OB8MOahDKh0K+s5kacF/SBRdGzurUkmF+aFwaHJTiL33sQDidNCeQ/
 wcDjihDSMtSj242FIN7hrmj9mCcQvHj4KfnqnooZ7EDjDeqq/r7WkW75e/+aCZfnMajbhl9Q7dj
 voH1exQ3RHrocuP9JI9IZnzVI5qVtMyAQdemfk5CF+7sS0pkg5/q93ZTBE2j5Kb5ZiIfVSVXdMj
 UvmJ2vRqNNI92SUypig==
X-Authority-Analysis: v=2.4 cv=Se1i5fRu c=1 sm=1 tr=0 ts=6ad1977c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=ag1SF4gXAAAA:8
 a=OXCmtkTqLOmlyALPhyEA:9 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:21:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248029

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d6e8e722763f87ceef9c0dbd1ec7f38088e7f0df)
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


