Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3E5C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 14:28:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1946.1787927149766700238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 07:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TYpZOVsZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDki3B2058956
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=c1zPwRWS4EfVETI+VpnYsNms21J4cFI4wwL
	ovDv7V18=; b=TYpZOVsZ3LOtPSG103xufCEPQDMEOfwIDowN4uqulV8+jJObAiR
	Du/e+p2IfAk6v2r6ggcg89APzrxyEu3nsKYCtMNlt0yhq+fskxwQw2s34vr2iVJA
	iy+hRdXat5VmZJvAEmMlEUoZ0Lbuqu2Yw3Tjv4m2E69Aupsld7C0a4cR1QeIwbiW
	MUHDkgCgAQP0Y/bd4FFS/xhH3I+ZnYDa3LL8U/VrHRP+QkDFdaUYS7Mp/+bOwGd5
	sHQBXBQZyV/oT9rcunoa+lS0kst1wLJk0bDAW2wCq6rpeyrbt3KlVoimrxfaXsJN
	/6HsNaGCCkci1o9vGBBtD+usJGtAr0Oqj/g==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9rc5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:22:14 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67SEMBsH017299;
	Fri, 28 Aug 2026 14:22:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4g74ujsf6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:22:11 +0000 (GMT)
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67SEMBm2017293
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:22:11 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 67SEMBaf017291
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 14:22:11 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id 8ED15ABA; Fri, 28 Aug 2026 22:22:10 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v3] initramfs-framework: support LABEL with root-only udev trigger
Date: Fri, 28 Aug 2026 22:21:21 +0800
Message-ID: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a919996 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=i1QJoHD1dn0bM1Lglh4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyNCBTYWx0ZWRfX924H0W/iFSLz
 15tcDLVuaaivOl5YqJxSW/vTp1Bm9RaSCYXt75Ak50VV4Rk7acf3bKcAeQERzgFpgyw8RYz+w91
 CptD9NqChMWhPVUCVW2NFJ1yfLpo5eU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyNCBTYWx0ZWRfX/x2nyVDfDIbi
 53ufhFXhs/t1sXj8xjKw2N+45hMluHv/QVuzp7VNopo95golp0lUH/H2QmEUu1FureuDjbFpY2L
 sNk2VAfxY8XSaG6Al/8kA9VPMoJHNckbhiUarwgIk8XCluU4j0OuHB+x5iNhPEyfIhOk64GadVx
 aJFcKctlk2+rgXLBQGU098ihOs1sFsnvbrXiNku4bp3BKOSnMPB6zEnAFOWxHvOqR10muT681Bu
 HDjbnqIiEvpb3EStUhXfEv4xtkXnE3QBkrjLYkQsvFfe3BWOchEnzXAMdxsxtSxrP+POvZsdeyW
 I1/tZYMQY7X6vCN6oQLhFV9HoHBbfiBfwROM68SkIn1h4FlN5tcx83xW9x/49HPZcNco+cjZiqd
 hOqbMepds7kAkDtzFEm05sMfxosX7ouj70FES4sJ0G1efz/zNskJZGKjVdqzMIyK7uzRlLgBFMF
 Jols228OdsMOefDM0QQ==
X-Proofpoint-ORIG-GUID: ax20AMmpLWwSylerw-FnEvlwPgyKGoEH
X-Proofpoint-GUID: ax20AMmpLWwSylerw-FnEvlwPgyKGoEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280124
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 14:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244548

Filesystem labels are not available in kernel uevents. Add
util-linux-findfs to initramfs-module-udev and use findfs to resolve
root=LABEL= to a device. Read the kernel-provided PARTUUID from sysfs
and trigger only that partition, falling back to a full trigger if the
label cannot be resolved safely. Keeping findfs out of the BusyBox
defconfig avoids increasing BusyBox for unrelated users.

Exclude the util-linux dependency from signature propagation because
this allarch recipe only invokes findfs at runtime.

Tested with bitbake -p, the core-image-minimal-initramfs dependency
graph, and the sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
selftest.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes in v3:
- Exclude the util-linux dependency from initramfs-framework signatures
  to preserve allarch sstate reuse across machines.
- Validate the fix with the allarch sstate signature selftest.

Changes in v2:
- Keep findfs out of the default BusyBox configuration.
- Add util-linux-findfs as an initramfs-module-udev runtime dependency.
---

 meta/conf/layer.conf                                 |  1 +
 .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb         |  2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b91ce3e437..1ad34b430d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -61,6 +61,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
   initramfs-framework->eudev \
   initramfs-framework->systemd \
+  initramfs-framework->util-linux \
   initramfs-module-install-efi->dosfstools \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
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

