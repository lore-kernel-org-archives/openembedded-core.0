Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 044E0C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 07:40:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1248.1790144979834252104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ilYvurHO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3igvx1425371
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4XuOhjv86ghQFqwuoXgiivFpz+ZA1H4NW7p
	TnQQoJu4=; b=ilYvurHO83wL+oSxvnUAF1WeFjPN9YmP2HvstU37MZpoQAOD88D
	+E/G9av5F3hN8ilo7fXFIYeVuNX3kN12AFCu4bBE3686+zBmIcLmXT9vxOCaRpfG
	BDoV0DehX7Hq7aCpD0QUNPhEs+olmhGao8AJHZXWz7ibHigN7OQtWGYDZOyuEGov
	MnoID3D8alcQsZX/sAtg/0I2/QDQUY43TOFPRQ9MoaUxHJYwqYfdkdn9G08jNhwX
	OuVNvPfdis+rF4cLSDfV5rRHwxxGLtY76tLuVZ3jbr+cXqAxefQjEZglvjhNi0ks
	jHB3FzRcxkZ1hZJlfo6U/ufuUEgnFTDvomA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2hwm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:25:19 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68N6PGuF513153;
	Wed, 23 Sep 2026 06:25:16 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 68N6PFDB513143
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 06:25:16 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 219A4ABE; Wed, 23 Sep 2026 14:25:15 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH] initramfs-framework: retry LABEL lookup before coldplug fallback
Date: Wed, 23 Sep 2026 14:25:12 +0800
Message-ID: <20260923062512.333252-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: h0LN6t_XTCQ2F2eYYOrVK1Ihieu97dPj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNSBTYWx0ZWRfX7kgBUqYkkaiL
 So4NaDQxVCdo26mOBgIUmfQ//WAySbwa5F4hlYdI0+Kf8xpsEeu12zXnSDBhfouyCpIlh7xY16y
 cjvnppzrsHDoeaxamnX8CFBjrU2PH/4=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab370cf cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=ZKNtc7ZdONaKhKoARkEA:9
X-Proofpoint-ORIG-GUID: h0LN6t_XTCQ2F2eYYOrVK1Ihieu97dPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNSBTYWx0ZWRfX7vdBEre/Ciwf
 2Hk1shJsbQiXiEimabzu83G1YRm+XfQl4haY7CG4zbnOkYgydbOOxtghlPltfV35VFRD+LRaUnq
 BhgLC11EhdlZt5AvyaLlo7x2P3AvZ+Tytard1849RJ17J6tvdcyv5tuC8biX8r9CTGxX5LIIyMF
 fLu8GFyFNqAV6MHcAshWuoOxyET7NSkexSLDDITQLyR8Lj0Q0f/blbH8XAoILl+X0j/8J6YfZ0v
 o28jDSdSd5whgle6TenjeX8CiiR1e4wCMrcYtIM73oKqAiSGEMsByw+HvYRld7+t/Qtk4PcTYtr
 Tx2lUv6i8Cdv4HXxkqGAgw49AAnXEz7bzbd5wCOvddAkUL9qkbzCXYEgzwZS3hetgyKfJDmHMU/
 FQU0mZeVx4dGtaCzN9BiuPF4WMLoeaZCfzj+454zOLNioOApkBDsJohodhJ9YnAdtnHXy1FFQMk
 7XHQyvzIUkf4lh/176A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230025
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 07:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246458

The root-only udev path can resolve root=LABEL= before the storage
device has registered. This makes the lookup fail and causes an
unnecessary full udev coldplug.

Retry the lookup five times with a 10 ms delay before falling back to
the existing full coldplug path.

Fixes: fda394c2b91b ("initramfs-framework: support LABEL with root-only udev trigger")
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/udev    | 33 +++++++++++++++----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/meta/recipes-core/initrdscripts/initramfs-framework/udev
index 85c5ba1178..fbf1b98d56 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -35,6 +35,31 @@ udev_enabled() {
 	return 0
 }
 
+udev_resolve_root_label() {
+	udev_root_label=$1
+	udev_root_label_retries_left=5
+	udev_root_partuuid=
+
+	# The block device may still be registering when initramfs starts.
+	# Retry up to five times after the initial lookup, with a 10 ms delay,
+	# before falling back to a full udev coldplug.
+	while :; do
+		udev_root_dev=$(findfs "LABEL=$udev_root_label" 2>/dev/null)
+		if [ -n "$udev_root_dev" ]; then
+			udev_root_partuuid=$(sed -n 's/^PARTUUID=//p' \
+				"/sys/class/block/${udev_root_dev#/dev/}/uevent" 2>/dev/null)
+			[ -n "$udev_root_partuuid" ] && break
+		fi
+		[ "$udev_root_label_retries_left" -eq 0 ] && break
+		udev_root_label_retries_left=$((udev_root_label_retries_left - 1))
+		sleep 0.01
+	done
+
+	[ -n "$udev_root_partuuid" ] || return 1
+	root_match="PARTUUID=$udev_root_partuuid"
+	return 0
+}
+
 udev_trigger_root_device() {
 	case "${bootparam_root:-}" in
 		PARTLABEL=?*)
@@ -47,13 +72,7 @@ udev_trigger_root_device() {
 			# The kernel does not export the filesystem LABEL in the
 			# uevent, so resolve it to a device node with findfs and
 			# match on that device's kernel-provided PARTUUID.
-			root_label="${bootparam_root#LABEL=}"
-			root_dev=$(findfs "LABEL=$root_label" 2>/dev/null) || return 1
-			[ -n "$root_dev" ] || return 1
-			root_partuuid=$(sed -n 's/^PARTUUID=//p' \
-				"/sys/class/block/${root_dev#/dev/}/uevent" 2>/dev/null)
-			[ -n "$root_partuuid" ] || return 1
-			root_match="PARTUUID=$root_partuuid"
+			udev_resolve_root_label "${bootparam_root#LABEL=}" || return 1
 			;;
 		*)
 			return 1
-- 
2.43.0


