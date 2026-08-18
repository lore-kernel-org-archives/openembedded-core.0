Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E36C5DF7E
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:00:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6244.1787050231026219772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 03:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=VzaBVn1o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABg0L820164
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 10:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aZUGv4ZQNZV
	s19PD6UHJ96Jyr2nrylnaxtsqQh175MU=; b=VzaBVn1o3HrR5MwExcdlwTH+tMG
	qaP92lih0nXp/yevx4ht09x88HWMMUPJyG6m0Dk2yNgifPCmtr5bieA+EUbpiqzS
	vTa1Xaaj54VxUZzSE4nzywTm8G1pvtFY/TQjc9kJkqQ2qbB3RQt6VAuDnla5tvtj
	G9ttizHWOA5oHoi3XJRj7bOcBXTVCxoNPM5O88R/4/axMVmOYJc14qKGQXKcEX8B
	UUCWS8LoRrRZNxlIsD9BIxVI8EpVkxvSL1atCvY0ERnyWKxLmjF+Y0JL9bXhWwGd
	zzv0j9q1AxyToODxAP0KdQCAxz0Z9kNu1thE8sXMIfP7f+NUwykaLKYaErQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1g0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 10:17:41 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67IAHd2d004633;
	Tue, 18 Aug 2026 10:17:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g2h6jwny3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 10:17:39 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67IAHcjx004627
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 10:17:38 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67IAHcmV004624
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 10:17:38 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id AF8B6AA7; Tue, 18 Aug 2026 18:17:37 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2] initramfs-framework: add opt-in root-only udev trigger
Date: Tue, 18 Aug 2026 18:17:37 +0800
Message-ID: <20260818101737.4010605-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
References: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: oAbsbXbRRiLHAZwis4QR_mVLBhif-qhC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX0NmievBKaVVS
 5JxswyxgW2UnbUfg5uY/9Ljka/SsJVjTcEwJBJuR7s2XAjB3Zc1GyywxAqmzy93FOxV5F6rddo1
 7oQzonQfiUhoRUiHcKXZgBC74gI7RbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3NCBTYWx0ZWRfX2MacDHIe7fM4
 aURpDmnkF+FhQaPoM47QjC/vFW7sZQki/t7GfXvIVcwzkv1U8oOsF7Rc6zNosYdTqgT88B/OGpm
 QbHIFIwpGRCS+J9ltvLQt7xDb2wOnZwmbsawczmyKIiyu0Y0R6cI2f0ZOhw3Z5o2YarfJvK20jf
 tbhPqxeQiaEBBATNEGCNEhwe4SFdRYOD9xhYl+gwxuGMmMyHRpJU9ASxX0TK5v2Kl4rj0wEa63l
 hWgebyeBB4sVStdf/F3awAcSwHY7G/ml9kQyfj0/xGRd8ieVgz0XnsyxvNjE3xEEZgQhb7CezX5
 4qmFlXdEJHUSp9+Zl/PdVckL+6D/YMg1kPZ7vShlPeZoX1QdMyok/f5kkzoJdM3+ddNWvZevn+e
 5cpDhj8hSqJ3q9g1+NKkqmm+GWxeOvpCQEEWSxbU9uUlHMfqZ/8zShlKdc3asRuGajW2wtKGq2j
 1KF8f4oorDqC36nAtkw==
X-Proofpoint-ORIG-GUID: oAbsbXbRRiLHAZwis4QR_mVLBhif-qhC
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a843146 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=iqAYPJ_ooOm7jgwe6rsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180074
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243674

The initramfs udev module replays add events for the complete device
tree and waits for every resulting event. This can significantly delay
mounting the root filesystem when unrelated devices take time to
initialize.

On a Qualcomm RB3 Gen 2 Core Kit (MACHINE=rb3gen2-core-kit) running
Linux 6.18, using initramfs-rootfs-image with root=PARTLABEL=rootfs,
the following average times were measured:

                              Full coldplug    Root-only
udev trigger + settle           981.6 ms        109.8 ms
/init to rootfs EXT4 mount     1340.2 ms        441.1 ms

The root-only trigger reduced these times by 88.8% and 67.1%,
respectively. The values are averages of three full-coldplug boots and
two root-only boots.

Add the opt-in initramfs.udev-root-only=1 kernel parameter. When root
uses PARTLABEL or PARTUUID, trigger only the matching block device. For
PARTLABEL roots, match the PARTNAME property exposed by udev.

Keep the existing full trigger as the default so current users and
other initramfs modules retain their existing behaviour. If the root
device cannot be matched safely or the targeted trigger fails, fall
back to the original full coldplug.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes in v2:
- Explain the boot-time motivation and include performance measurements.
- Clarify that initramfs.udev-root-only=1 enables the optimization.
- Make targeted-trigger error handling explicit.
---
 .../initrdscripts/initramfs-framework/udev    | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 4898b89246..8f67e78a7c 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -35,6 +35,31 @@ udev_enabled() {
 	return 0
 }
 
+udev_trigger_root_device() {
+	case "${bootparam_root:-}" in
+		PARTLABEL=?*)
+			root_match="PARTNAME=${bootparam_root#PARTLABEL=}"
+			;;
+		PARTUUID=?*)
+			root_match="PARTUUID=${bootparam_root#PARTUUID=}"
+			;;
+		*)
+			return 1
+			;;
+	esac
+
+	root_devices=$(udevadm trigger --dry-run --verbose \
+		--subsystem-match=block "--property-match=$root_match") || return 1
+
+	# udevadm succeeds even when no devices match, so check its dry-run output.
+	[ -n "$root_devices" ] || return 1
+
+	udevadm trigger --subsystem-match=block \
+		"--property-match=$root_match" --action=add || return 1
+
+	return 0
+}
+
 udev_run() {
 	add_module_pre_hook "udev_shutdown_hook_handler"
 
@@ -45,6 +70,11 @@ udev_run() {
 	sh -c "exec 4< /dev/console" || { exec 0> /dev/null; exec 1> /dev/null; exec 2> /dev/null; }
 
 	$_UDEV_DAEMON --daemon
-	udevadm trigger --action=add
+	if [ "${bootparam_initramfs_udev_root_only:-}" = "1" ] &&
+	   udev_trigger_root_device; then
+		debug "Triggered udev for root partition only"
+	else
+		udevadm trigger --action=add
+	fi
 	udevadm settle
 }
-- 
2.43.0

