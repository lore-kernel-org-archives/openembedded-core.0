Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B25C61D9D
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 11:50:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.97258.1700758790745229595
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 08:59:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=oLFhKK5x;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANGpnpp030538
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=zaRkks61rkSEEdgRdRDTPohjEMq2xQ6VHWlKPpwqGD4=;
 b=oLFhKK5xINpKF4nQ0R+toNvuHt42tY0MiJR5kW7eJqIMeg6GTpg+j1Imw4DxQ7NOmBwW
 kW7o1v/pjk8CwEeK8Jd9kyT79bReJOsnD2epS5HS9ZXwtmucIV7Jtb+MlSiIs4QbndBB
 dw+IukkGR626hlcYobEc2+g5x1Wa6mbGQECmMikmpyXqZfgsTouUhCH11+z7q0f+xaTY
 2ZpS/R4bMOiya4hkNseYcQLMmymNXjlX++Q9uJt8tgUtWS/crTWujVqqyMDSaW0SMLvi
 kaZJxETNL9S0Gnx30nm7lF1Qf88oJ2xvWRVZ6kIo9ml5LuavGxcJRX0MVO+1CawOQFcJ Dw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj25t146x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANGxn7o006078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 16:59:49 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 08:59:48 -0800
From: "Viswanath Kraleti" <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] systemd-boot: fix build issues on armv7a-linux
Date: Thu, 23 Nov 2023 22:29:27 +0530
Message-ID: <20231123165927.1868468-2-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231123165927.1868468-1-quic_vkraleti@quicinc.com>
References: <20231123165927.1868468-1-quic_vkraleti@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: F6ORpMdRY3gCqzLFh2i_nGCo3gczHlMX
X-Proofpoint-ORIG-GUID: F6ORpMdRY3gCqzLFh2i_nGCo3gczHlMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=863
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230125
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 11:50:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191227

From: Viswanath Kraleti <vkraleti@qti.qualcomm.com>

backport a fix to address build failures on armv7a [bug id #29381]
introduced in systemd v254-rc1.

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 meta/recipes-core/systemd/systemd.inc         |  4 ++-
 ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index ccc3236457..f9caba2066 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -17,6 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "2e7504449a51fb38db9cd2da391c6434f82def51"
 SRCBRANCH = "v254-stable"
-SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH}"
+SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
+           file://0001-meson-Pass-all-static-pie-args-to-linker.patch \
+           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch b/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch
new file mode 100644
index 0000000000..efea95b6ac
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-Pass-all-static-pie-args-to-linker.patch
@@ -0,0 +1,35 @@
+From f85a387a67900b02c69abccb88c2ef7191c67277 Mon Sep 17 00:00:00 2001
+From: Jan Janssen <medhefgo@web.de>
+Date: Sun, 1 Oct 2023 09:55:48 +0200
+Subject: [PATCH] meson: Pass all -static-pie args to linker
+
+Fixes: #29381
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/cecbb162a3134b43d2ca160e13198c73ff34c3ef]
+
+---
+ src/boot/efi/meson.build | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
+index 2773eaf286..9a60a57329 100644
+--- a/src/boot/efi/meson.build
++++ b/src/boot/efi/meson.build
+@@ -161,9 +161,14 @@ efi_c_ld_args = [
+         '-Wl,--entry=efi_main',
+         '-Wl,--fatal-warnings',
+ 
+-        # These flags should be passed by -static-pie, but seem to be missing sometimes.
+-        '-Wl,--no-dynamic-linker',
+-        '-z', 'text',
++        # These flags should be passed by -static-pie, but for whatever reason the flag translation
++        # is not enabled on all architectures. Not passing `-static` would just allow the linker to
++        # use dynamic libraries, (which we can't/don't use anyway). But if `-pie` is missing and the
++        # gcc build does not default to `-pie` we get a regular (no-pie) binary that will be
++        # rightfully rejected by elf2efi. Note that meson also passes `-pie` to the linker driver,
++        # but it is overridden by our `-static-pie`. We also need to pass these directly to the
++        # linker as `-static`+`-pie` seem to get translated differently.
++        '-Wl,-static,-pie,--no-dynamic-linker,-z,text',
+ 
+         # EFI has 4KiB pages.
+         '-z', 'common-page-size=4096',
-- 
2.25.1


