Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA1CC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 10:52:18 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8732.1787736472764038638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 02:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=p6uZIwIv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cq2S4170066
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zuL9jGZrgK/on1gPaOJCrL10868J7vrFyvj
	8ObCTDVg=; b=p6uZIwIv9r0REvPpgD4/IlUPoObasipHJ99zPQVoobuNeb3g+LI
	gnaocaibgd5MmEI/MyI072j+GFOhabQWUjgMLzebuWyInJO5MiK7sSTWlwvVabgu
	u14EQwhUDb7+VN6x3i+rrrf19lB9d8kZfahZWMRl2BC1LPFPuNVoK10nGJAVxLa1
	XNLkKZ870xlBDAB72YoFWK1L7XFhIVDxg8MYdMhN5296WkRn+5gP9N4OToV2/tZp
	abRH67zCUox9UDjWueP1T3EJnmfz/13+CI2Wz5i8wPOm664fWrjWM3GCAFTHFhtM
	LHgPO4YtHphf+3DhOg3ytvDNkXiBwKnjOog==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx92bm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:25:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67Q9PWBG002963;
	Wed, 26 Aug 2026 09:25:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g74ujcyga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:25:32 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67Q9PWSa002957
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 09:25:32 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67Q9PVJ0002955
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Aug 2026 09:25:32 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id C3BAAABE; Wed, 26 Aug 2026 17:25:30 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: support LABEL with root-only udev trigger
Date: Wed, 26 Aug 2026 17:25:22 +0800
Message-ID: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8eb10f cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=EzkYZ8s80MbNxuD3XroA:9
X-Proofpoint-GUID: uYBf3hdqf_KTzkoRxzpKfpeJvqErS9EZ
X-Proofpoint-ORIG-GUID: uYBf3hdqf_KTzkoRxzpKfpeJvqErS9EZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3NyBTYWx0ZWRfXwiFMn5pO0Fl8
 8tV5yspx08N1/WMWZjN1fOcnfiH7+NMx1cfq/0UcfNGx3KEXB2s+NCBtOEquwBqQDxi1cR5zR1V
 6Qga97K49lJGZNtCe9VqviOK0w853twrP49T870v4t5azg7Ltem7EWeFinMGsLCAGzK5//JG72H
 awzfnDx/sqml15Yp/qM0/lVrKc1e5sjO+s0BUa+xXjo6mOPzkkuVSZ0I2YgckQ2B7Esi5BExpRC
 g5PNoaAEWpd6WorIQY+iTikw+Ef6tnr4MTD4vbLqRRhvcvZw296BV2yacN1ckf3JVrBhGAGW+1Q
 qcdAbEe7Bqy3S/8znnw7Ts791p0E8kxpGvVfX2lVWNKxyMHHVXgT9wy/8cPe1kd+uRm24popnQX
 BpYAOAtfHUN9i6ud1bjKf7XInNADxFM3oASHHeB8cWQWgR1fOQtFRSx+SV6reJZw9V1BQjdij7l
 VAgPH0IBh/PHCvPoyXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3NyBTYWx0ZWRfXxxZ8eVpaLD2y
 tTIwqj4BOkD2Q3ELCv3pWH97+IKMwxtQ+kWGTIuyxbKp3DwbkpnsNl+6uzWMvnCE8n28m/hmP5U
 p23ZgulMTcLUdwCUIal6owtN8NWBus4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260077
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 10:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244394

Filesystem labels are not available in kernel uevents. Enable the
BusyBox findfs applet and use it to resolve root=LABEL= to a device.
Read the kernel-provided PARTUUID from sysfs and trigger only that
partition. Fall back to the full trigger when the label cannot be
resolved safely.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 meta/recipes-core/busybox/busybox/defconfig          |  2 +-
 .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

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
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 8f67e78a7c..85c5ba1178 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -43,6 +43,18 @@ udev_trigger_root_device() {
 		PARTUUID=?*)
 			root_match="PARTUUID=${bootparam_root#PARTUUID=}"
 			;;
+		LABEL=?*)
+			# The kernel does not export the filesystem LABEL in the
+			# uevent, so resolve it to a device node with findfs and
+			# match on that device's kernel-provided PARTUUID.
+			root_label="${bootparam_root#LABEL=}"
+			root_dev=$(findfs "LABEL=$root_label" 2>/dev/null) || return 1
+			[ -n "$root_dev" ] || return 1
+			root_partuuid=$(sed -n 's/^PARTUUID=//p' \
+				"/sys/class/block/${root_dev#/dev/}/uevent" 2>/dev/null)
+			[ -n "$root_partuuid" ] || return 1
+			root_match="PARTUUID=$root_partuuid"
+			;;
 		*)
 			return 1
 			;;
-- 
2.43.0


