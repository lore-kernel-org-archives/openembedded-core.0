Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CF7C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 06:53:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.25981.1701240799721576671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 22:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=nQDFzD9d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT2LcN6025125
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=rQN2L2TYDU5Pfs7pY0tSy8IZSHGTCcPf5N14IFD134o=;
 b=nQDFzD9ddQihVrDoM6bayBlsqQQ3fqmX0xGgts3XiFnxpIJ6O0qyFg7t1GA+IABBizNL
 qTtyjgc0rRYUgf01PxgRocwlmrVo2P7BUBvAiuSdOgyLNPmgi/UQq6WAqAfzUThf2Q8s
 8QulT3qPkuCu2llr6TuMtcUXPXLyLy8FW1+Ru1nIKAsOfeRz9fpDiQHmkY/N6BCC+9pN
 uDKn17SDe3ck8AHNOAxkOibUxQ5erH2e3Mu4dtul/xiixok9OSKRAYq8pXoCrRl8UALs
 0yCkr0uqel63i7Tv/sh4fvEWbQE9JZ6LxJLIP7CsNnssPlA7Bs2+1sTWP07UqD3SnYzr ZQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unvetrjhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:53:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6rHej019600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:53:17 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:53:16 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] systemd-boot: Fix build issues on armv7a-linux
Date: Wed, 29 Nov 2023 12:22:51 +0530
Message-ID: <20231129065251.1418864-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DTnN-Vyn1DNVMifsZxP2bstA_0LwRdGb
X-Proofpoint-ORIG-GUID: DTnN-Vyn1DNVMifsZxP2bstA_0LwRdGb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=990
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 06:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191429

Backport a fix to address the build failure on armv7a introduced
in systemd v254-rc1.

see
https://github.com/systemd/systemd/issues/29381

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot_254.4.bb             |  4 +++
 ...n-Pass-all-static-pie-args-to-linker.patch | 35 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.4.bb
index 4ee25ee72f..2b43ccf243 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.4.bb
@@ -8,6 +8,10 @@ DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native
 inherit meson pkgconfig gettext
 inherit deploy
 
+SRC_URI += " \
+           file://0030-meson-Pass-all-static-pie-args-to-linker.patch \
+           "
+
 LDFLAGS:prepend = "${@ " ".join(d.getVar('LD').split()[1:])} "
 
 EFI_LD = "bfd"
diff --git a/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch b/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
new file mode 100644
index 0000000000..8e563238ef
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0030-meson-Pass-all-static-pie-args-to-linker.patch
@@ -0,0 +1,35 @@
+From f85a387a67900b02c69abccb88c2ef7191c67277 Mon Sep 17 00:00:00 2001
+From: Jan Janssen <medhefgo@web.de>
+Date: Sun, 1 Oct 2023 09:55:48 +0200
+Subject: [PATCH] meson: Pass all -static-pie args to linker
+
+Fixes: #29381
+
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/cecbb162a3134b43d2ca160e13198c73ff34c3ef]
+Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
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


