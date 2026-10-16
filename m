Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165B3CCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:22:13 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14479.1792123208196698116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=EfENBb9S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1mUBC3202281;
	Fri, 16 Oct 2026 03:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=82jLyPx1wwxC0lOTn+DlQSqo86GVV/elWMd
	S3O7KUAQ=; b=EfENBb9SUQDbCyqWEoukFuOVubobX8NgyCPdPz8m+41rJkjvMzW
	lO+41qYj8Y02Ry2YDX3KDkWbQUAUhnbnbACcz+0znZ7tXKDh/v9l7NhtsJx0P73R
	gJHXkdmE2aQfpVUFuY5g1xT0GDWOmZSr7LhjYdGye2j0Mbj/h3M3F/qaG64G+qFG
	/qJQeU7cAfkryb1a8JEK1mjBvsZLh6N4e5jz9srIWlvTghq7s+fpSPlQZf2x3N0l
	XDB1YeOeZXfx8lokkcUpMz3RTIc9yonAo6Sy/xkOetLW0gRgNVrRojSyQkqLhz9i
	99E27BSaXpEFbScL7s5FP16iYeeqZnvqK7Q==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r39te3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:17:25 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3HO7w2742999;
	Fri, 16 Oct 2026 03:17:24 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3HNvt2742985
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:17:24 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 1B8D7AC5; Fri, 16 Oct 2026 11:17:23 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 1/7] initramfs-framework: add opt-in root-only udev trigger
Date: Fri, 16 Oct 2026 11:17:21 +0800
Message-ID: <20261016031721.693971-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3dlxp6nDRYkH
 WXFYroRDQ0vmnchg2ijEFKb1NuIVfXVXp2T7DkMdpIZkCrlEhNhm2Uw5Y8w/NDQ7UKBZ/VGD8wL
 PdzlXGUiI0hvQ3RbTvQDLzHIa7A9TH5aMaeIQsOBhmuvyS3l+l8IOqSCvNbi3n+SP1NDj6dlqjr
 Q5aEKTdbTsAIvlXl+94BcQNZI5CPGFys9KnfOvNgY9lFM7pYLri60xKTuWYEh7cfj+MqVhRNLEJ
 PdPPc/d6K4fvGKh6zG2oxoI9XkldvaAllXbmiSJNkQTngzZOOg44RFtgmj2p8OVNIV9P1q42z+x
 +pQUQdOVs94TgiQo0H+gSDDbOSYWpeF+AcOcPLm7k2x4YwMdl3/YDY5cKhc9haeYhK7LlZHHCG8
 1RiAxVWwA3gJJJ2c9LgPe2LOR8VAxo3HowBLZLUKGJ+8VWdqtzF9NRnuE91vb3n+uOsog37xePY
 4e5OGQXMzdPWxAVT2tw==
X-Proofpoint-GUID: pQsJD-puvaNqLOEes8z0-FI6Zd_Fqa6a
X-Proofpoint-ORIG-GUID: pQsJD-puvaNqLOEes8z0-FI6Zd_Fqa6a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX+dQCAgddIeqw
 BZ07bZZ7fYPcGbQKotQSfdQ0JCP30d7q6CvodBb5+jdM/XZFuQPDyvHC9UhHl8ACsTZ+yNzbeAJ
 6sbxBHvAFrEp6sdRJF/v+gUS+Hu6RIc=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad19746 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=iqAYPJ_ooOm7jgwe6rsA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248033

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3a196f5742425fb24cfc21bb380f3e96c49253c)
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


