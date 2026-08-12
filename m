Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D37C5AD5A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:29:43 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4451.1786528369360999440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 02:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FSE9Ky7k;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YJ9R2987154
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:29:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SHF1N5BtnE5Iry/JTOVJGVbZRRlI3hdlCDI
	PTjOighA=; b=FSE9Ky7k5z3gAIxVqED2fhouhWz84BXhOLshc8X8yNw2nXW16U1
	wJ49zIlrou02rbYAi86OqHrp7HJ0HltZpmnB/QBdfi3QpNb0LoTj7EU5gkffzjyZ
	RxwPW2KVCl2ozOClUKFdMsU+M/yO+uVWhk1iIo8CfT53cRqGhxGe4c1NEvOWrJV1
	snUbdJa0w5XLr2qm19KRKnX+6iq/0wFswJMjxds5MAJ/HQniEKn8WiMif2D9HPsL
	nyoSrpt1TGLZETVVGjmDpf/KAIpO1/kDy1wvMJOeSyLZhvHHFYAaJPbLdzl4SYvt
	GhWq7RruWNcsZmAyFu+lWg58SKR6vrP+ANQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kmjjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:29:19 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67C9THmc010188
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:29:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g0bscmhwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:29:17 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67C9THet010181
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 09:29:17 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67C9TGXX010178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 09:29:17 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id C03B9AB4; Wed, 12 Aug 2026 17:29:15 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: add opt-in root-only udev trigger
Date: Wed, 12 Aug 2026 17:28:42 +0800
Message-ID: <20260812092842.2060157-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: 03PWkysWMDMlaP3tCjNBezMA3pOH3s3k
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c3cef cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=FPTIS8-BGYXMTgIi5c8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3NSBTYWx0ZWRfX0pE/7MKLAGSo
 0TmcalBMVgWL6IP8FGxMTd+B7RsGw9OUprrNw2WyBSI0Bip+ZxkBQzGAMrNxvgbrgnz8ZyfMOST
 tEt1/OV4tM7rtnhJRZRj+FN62xmVmD9R/NXfZgBiRzVjy/oFe78DI/PikCQICDrYohZAvzTGGLB
 pVHRjN42UJEGn83qEjFfWvjvPdWm0H1JWXq0pRVQA+gci6UTgU33lVefK+OTaNLgUL9KztHCqN6
 UmXzwa5qBe39ZS8J5RVtSaq/r1bKwc3mllfdfkQ3nwew2bAhIb0eG81bVW0iipf2sKbr+0t+ICR
 GQ7lk3/gpvFiPhpsXc6HgKOk4lLp6zHdKUR7Ebr89wwGDsbFBwjJV8R6x37XgsKUxbLnS9RJbUp
 FSiy069YlbnyyKuLbJjf2lBS7u+gdWgMISPQ7SEW1Y3UScXQtx1ihQkdODAR3li5Mdb67zL5ise
 yt69S0q9Oz5C4F+97RA==
X-Proofpoint-GUID: 03PWkysWMDMlaP3tCjNBezMA3pOH3s3k
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3NSBTYWx0ZWRfX7T57w+d6SJfA
 W82j1LkAnrHJBbD0SCvdphy4CtFI02H5gufjxsf4c2/NeJ+G1oe/plAdT41kt/hW9DKY8dja4Je
 XrPSklWvvXIrwTkn9eRAr3QlBPkj8ds=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120075
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243269

The initramfs udev module replays add events for the complete device tree
and waits for every resulting event. An initramfs that only mounts a root
partition does not need to coldplug unrelated devices.

Add an opt-in initramfs.udev-root-only kernel parameter. When root uses
PARTLABEL or PARTUUID, trigger only the matching block device. For
PARTLABEL roots, match the PARTNAME property exposed by udev. Keep the
existing full trigger as the default so current users and other initramfs
modules retain their existing behaviour.

If the requested root cannot be matched safely, or a targeted trigger
fails, fall back to the original full coldplug.

Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/udev    | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 4898b89246..7fa26ef807 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -35,6 +35,29 @@ udev_enabled() {
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
+		"--property-match=$root_match" --action=add
+}
+
 udev_run() {
 	add_module_pre_hook "udev_shutdown_hook_handler"
 
@@ -45,6 +68,11 @@ udev_run() {
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


