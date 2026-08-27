Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9EAC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 15:17:06 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38576.1787843511885189373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 08:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FIXdLk5g;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RF20f9788690
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5hN+z15gyTH
	tPIzkU1c4I693GD9t6N7stvxvdFlG73o=; b=FIXdLk5gyXbxH118F+qnlMtRzor
	ztBG7O54Yf57plSRhqcPaw11fLKoDnTGuY2+vVOOUY22iYVMsHDtN+Ak+SFFzTEz
	WbxkFayFv8rnvcOoduIi+bMDGGU4CMZW96MxwdjeaAbGCQ16l0sYYwiDsK6ywyxi
	iaFHsbnmmkvy501L25W1oK7HSXDBOQAvaJACwQ0KKuo3S7gjbZR3E5bWzkUqZfyy
	UkhwiU5OlH79ZRy2CJ4nsIUtyRFDZeBJ/b7ss+7iFNXNHNlj2Z7AomTGPkRch55E
	C+tSWigwV5CmgwdZAB7VfMbFfaxJIsq0PH6w2C9oBE21kmpuwRC+uFHnjpA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8crs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:11:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67RFBmKd014326;
	Thu, 27 Aug 2026 15:11:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g74ujgfb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:11:48 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67RFBmeC014320
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:11:48 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67RFBmO5014318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Aug 2026 15:11:48 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id B222AABA; Thu, 27 Aug 2026 23:11:47 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2] initramfs-framework: support LABEL with root-only udev trigger
Date: Thu, 27 Aug 2026 23:11:44 +0800
Message-ID: <20260827151144.3046231-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
References: <20260826092522.1618546-1-wenwfu@qti.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 6cL13XL4hl_r-Xtgqe6MQZwNvW5uAA8c
X-Proofpoint-GUID: 6cL13XL4hl_r-Xtgqe6MQZwNvW5uAA8c
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a9053b7 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=EzkYZ8s80MbNxuD3XroA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDEyOCBTYWx0ZWRfX8Ni8o4/tH7sI
 emo14myaoKmmbsEYOWx2+mhmD1fzqnmDod3A94xkDv0xln8JM0yQCUtCMcQOj1LM7nJy0NQU/Ic
 dDhMFFiNTCUlEMk4VzS3Z2iPxoBwzIG8uuaS1O7TcWKsj4DMqLwGQfX2KnFZO3THSn7zW40G++C
 TkFSICer0oTWCsk9IsB0FaJDq4dwTwafhJMIkZn9yBDwcGpJ6kKTkpjJKeFMU0xFiSfh9k8HaX5
 iiZ2f087uvZk0VVCvohTQcikWrysHCL44b8ImF7E6hCKBdLsm12pQVeCdqf9NiefVVmzXIWloKN
 92zqUmWQnCLl8wL9Dny1JHDzoYyL1ktBcXwft/oXNOslrjOhFbWXVNNHDnlWnZOIyDntsY/wQ84
 5jqAajZQ2q4mju2gk28pR/ITXOD3LULass2ld2I6InKXRg62Gdi20lg+ZZH3+voWrukw64XVPhT
 khPBALLNqvfsaJkOBOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDEyOCBTYWx0ZWRfXx75N5scMFhPM
 0UHf3EcGGBb9S5lpVcbSWSOzqlmjALYkcm8242Ln2WQfmiXsyCQjXsvGX8u2084bl1I2uGXlM/F
 vue20O4Y9rFN1pniFGLxS9fnnkWVEVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_06,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270128
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 15:17:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244498

Filesystem labels are not available in kernel uevents. Add
util-linux-findfs to initramfs-module-udev and use findfs to resolve
root=LABEL= to a device. Read the kernel-provided PARTUUID from sysfs
and trigger only that partition, falling back to a full trigger if the
label cannot be resolved safely. Keeping findfs out of the BusyBox
defconfig avoids increasing BusyBox for unrelated users.

Tested with bitbake -p and by generating the
core-image-minimal-initramfs dependency graph.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes in v2:
- Keep findfs out of the default BusyBox configuration.
- Add util-linux-findfs as an initramfs-module-udev runtime dependency.
---

 .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb         |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

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
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 2ec03bc34c..936cd0c995 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -88,7 +88,7 @@ RDEPENDS:initramfs-module-mdev = "${PN}-base busybox-mdev"
 FILES:initramfs-module-mdev = "/init.d/01-mdev"
 
 SUMMARY:initramfs-module-udev = "initramfs support for udev"
-RDEPENDS:initramfs-module-udev = "${PN}-base udev"
+RDEPENDS:initramfs-module-udev = "${PN}-base udev util-linux-findfs"
 FILES:initramfs-module-udev = "/init.d/01-udev"
 
 SUMMARY:initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
-- 
2.43.0

