Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F75C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 14:57:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.96576.1701097023863689212
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 06:57:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=VOVBwBBw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARBkrNh004546
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=WQ9TbwyEWs14gXqAZJ82KaLFcJKqb5H4xQ/vap32Rn8=;
 b=VOVBwBBw7DykiM1JH6yWMOAJ7aZU1wcy7g4SKvqJCHltpATnFdOHdu1WtW3iUXsYe1yj
 /oMr+hd7l9cTZU3n7axTcWduWkU5lvgU5L7P3eOPCspzuzqyH6e6Taa/7gXmfRO+VwfD
 +53Acc9Frains4cH4zN14bGz7NUCtS1LiQp1cOyXtbps07O3dsaUDVrHFF7Wkyggnjw1
 m94mbAiRdas07Vm/g8Jfz3epDpDbsklSBzalH3Xh52F1W+wfgKFXu7u0EQJHNBdURXJK
 KtnNSt3BUgFyM1Y4zkLyw/OZYgI/3uKO0imzlitP3EF1nqPq07Fz5rS0zUfMGjLIaDJD Lw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uk9admj3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:57:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AREv1wg009643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:57:01 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 27 Nov 2023 06:57:00 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd-boot: Extend recipe to compile native
Date: Mon, 27 Nov 2023 20:26:43 +0530
Message-ID: <20231127145643.986904-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P8O6cRiiyNmbTC2kM7TrT2RaTpUIlpUU
X-Proofpoint-GUID: P8O6cRiiyNmbTC2kM7TrT2RaTpUIlpUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_12,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxlogscore=844 adultscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311270100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191307

systemd has ukify, a native tool, which will combine the kernel/initrd/stub
components to build the UKI (unified kernel images). systemd-boot recipe
isn't providing this tool.

In order to use ukify, one need systemd-boot native recipe that can be
added as a dependency to get the tool under recipe-sysroot-native.

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot_254.4.bb             | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_254.4.bb b/meta/recipes-core/systemd/systemd-boot_254.4.bb
index 4ee25ee72f..aa8b53e4dd 100644
--- a/meta/recipes-core/systemd/systemd-boot_254.4.bb
+++ b/meta/recipes-core/systemd/systemd-boot_254.4.bb
@@ -4,6 +4,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 require conf/image-uefi.conf
 
 DEPENDS = "intltool-native libcap util-linux gperf-native python3-jinja2-native python3-pyelftools-native"
+DEPENDS:class-native = ""
 
 inherit meson pkgconfig gettext
 inherit deploy
@@ -46,18 +47,33 @@ python __anonymous () {
 FILES:${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS:${PN} += "virtual-systemd-bootconf"
+RDEPENDS:${PN}:class-native = "python3-pefile-native"
 
 CFLAGS:append:libc-musl = " -D__DEFINED_wchar_t"
 
 COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
 COMPATIBLE_HOST:x86-x32 = "null"
 
-do_install() {
+do_configure:class-native () {
+	mkdir -p ${B}/meson-logs/
+	touch ${B}/meson-logs/meson-log.txt
+}
+
+do_compile:class-native () {
+}
+
+do_install:class-native () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+}
+do_install:class-target () {
 	install -d ${D}${EFI_FILES_PATH}
 	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_deploy () {
+}
+do_deploy:class-target () {
 	install ${B}/src/boot/efi/systemd-boot*.efi ${DEPLOYDIR}
 	install ${B}/src/boot/efi/linux*.efi.stub ${DEPLOYDIR}
 	install ${B}/src/boot/efi/addon*.efi.stub ${DEPLOYDIR}
@@ -65,3 +81,4 @@ do_deploy () {
 
 addtask deploy before do_build after do_compile
 
+BBCLASSEXTEND = "native"
-- 
2.25.1


