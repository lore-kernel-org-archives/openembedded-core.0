Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38981CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 14:21:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14239.1792122013460026446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:40:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pFU7f7F1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKW9nn3462792;
	Fri, 16 Oct 2026 03:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PU48WrUdZUAvJUmiJcDjJYWIlSily2rcQfk
	ebrIfyS0=; b=pFU7f7F1L1ci/A/xHw9lVjwVTb8+jyulDyPqd937qm5cSRqO/gT
	WvOHINnBo5mZ0JyfRHiEj+fpZxU1Z9O08GMsoqu3SAX3ePeiE6YV65w1eNH4nmuw
	K78gao4KALlXqIpQUmllnHmziixEBb8Xj/qz5KujRje/FKBJDVcJdmAbhT13Htjk
	1288wUuXq940qF67xhRBPgS7SnHdwFrw41nDr0ncOxsdOXU31Cuhe+q/g+q9OkzV
	XsJlPyaCvkEssr16JB1Z2FrTy/1zTqc+qO1bFpJI8pOeDdq0lbC2Yf8/T31tfXcH
	DFEWOeD/5BC24VGEy5bc9RROuBbfBDQkmHA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6awsq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:17:40 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69G3Hc5S2743148;
	Fri, 16 Oct 2026 03:17:38 GMT
Received: from perf-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69G3HbdT2743139
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 03:17:38 +0000 (GMT)
Received: by perf-sh02-lnx.ap.qualcomm.com (Postfix, from userid 3975139)
	id CC936AC5; Fri, 16 Oct 2026 11:17:36 +0800 (CST)
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH wrynose 2/7] initramfs-framework: support LABEL with root-only udev trigger
Date: Fri, 16 Oct 2026 11:17:35 +0800
Message-ID: <20261016031735.694414-1-wenwfu@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: wnn861afaq0RuJh85xioTMNxCW3FPFdw
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad19755 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8
 a=i1QJoHD1dn0bM1Lglh4A:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: wnn861afaq0RuJh85xioTMNxCW3FPFdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX4Kl9MPqqDISx
 KEkpdna46/GkZdy+Wgplu7NWo1Veaq3FJE44qKZDtRGggYEjZIMHmJLlV8lcpHabLYU2rv1j+cc
 R86Lqo2038E5Kh6iKtbSJaGS66YDBUmOkUVpaf8t2EsSwmSPeSjq5i6+rEu+WwQjgremLx3ynyX
 SbswHW7pIJXeWwvZ2rNlbIHfvSyqbf45N+6HFL5cgVbmysj5tbzquDR5BPjQgntSD8E+LWyqQ4y
 6eteyheyhjlQB7I6/22RkyfAsMurgTi+PTDV+VMgKCGPN98c4YdCkwnUu9mPAjSXbHS8WIrLfP1
 9c3EGPrWfgtwqEVaLj/6T+JY8fhZinaV8F702IiLOXx1vvs4EVQ+YlAVoS8O2dNe9Ztf2xFWdvo
 33QRbx6ovBiC06naVQgWH8bC9ACvBjGbsx8VLcx2rq2V7qSGaREw8L+Q9ojfsqtBFbGT0CxvI/t
 uKyTY/PJaDIZIIfJ+IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX3W2jloOW3PrT
 HhepWQ295+0DBOhUrH56C9gc6fbIpI6BdeH4ExQfuA7hswT6e0c1YaOIdJrxB+Y5HPGMY7VwRoC
 AcFA2HXBueakMMGHF//JDRcwkuX7Jg0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 14:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248028

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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fda394c2b91b3c66545f75dc13f7e8649e3cdb6d)
---
 meta/conf/layer.conf                                 |  1 +
 .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb         |  2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b097c34c7b..dabdf55c25 100644
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


