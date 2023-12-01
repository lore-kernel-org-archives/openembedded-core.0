Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC80CC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 06:54:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.17505.1701413636735608664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 22:53:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=TOASrs1H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B15lmSo015535
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Dec 2023 06:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=Rx18No136PiXLWE4LJ2QbVWqcqOQ5fg9jeayfgor7UY=;
 b=TOASrs1Hy2yYwnzCeS1aH4wf9242WOfg1Iv1vJPT+q91mm5OKlbV1caYRwJ9YG/Yj3dY
 an4cklHuZnAAnmKQLRcDkSfcyvGaFjF0LQnZTun6dKbacFjYMo7GnAFugXPWfqobr0WM
 Df7sIi65G52huB1lLFHbgydxbBmxTmQsm+S52k9QZOgcrbTdcCwaYPOm/AcHAaut9q3P
 VMsiOTGCJ6/tE1Tq/MURHgCFhtL3OhQhay5RxwNpgzI077jzAlY5qo3I8Nwf1w34kPOP
 oMURbnD0j1gx3ytrpXwm9X2/3RFi91QyiQJ+HiFefquTBRNhn1IEgM6VeeVzDuvejSti yA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uprhdtmqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 06:53:55 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B16rssI024093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Dec 2023 06:53:54 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 30 Nov 2023 22:53:53 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] systemd-boot: Add recipe to compile native
Date: Fri, 1 Dec 2023 12:23:36 +0530
Message-ID: <20231201065336.1362984-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CYxAdL009e9d7NNQUWqubfVlPt2smos-
X-Proofpoint-GUID: CYxAdL009e9d7NNQUWqubfVlPt2smos-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_04,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 mlxlogscore=759
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 06:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191557

systemd has ukify, a native tool, which will combine the kernel/initrd/stub
components to build the UKI (unified kernel images). systemd-boot recipe
isn't providing this tool.

To use ukify, one need systemd-boot native recipe so that a dependency can
be added on populate_sysroot task to get the tool under sysroot-native.

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb

diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
new file mode 100644
index 0000000000..6d89e493b6
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
@@ -0,0 +1,15 @@
+require systemd.inc
+
+inherit native
+
+RRECOMMENDS:${PN} += "python3-pefile-native"
+
+COMPATIBLE_HOST = "(aarch64.*|arm.*|x86_64.*|i.86.*)-linux"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+}
-- 
2.25.1


