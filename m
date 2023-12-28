Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDB4C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 28 Dec 2023 15:47:40 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.125348.1703778451551056644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Dec 2023 07:47:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=R73sInLC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BSFesSD020181
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=XP6hR4O
	2EStyJDjJ2utZcI6es2AASYaXVB/4wdX6oF8=; b=R73sInLCtZxkxhfM0CEnmtI
	hkQ2npM6F896M+7RfRFJIhT2DgcBWuK8RKXS9noXD+6bcynB1/+EVaCqz1Afaxmt
	oqiWGTUfShLcgiHpoqioDLaBJ+tfl3auWbSXkAq2QtyKRYlPtzvNsA0fYRhD52dH
	FoKdHiZci19wPy2SZsvIe/JR4PlV3AhNcoJFdq4NY/lJPyyExbjXOuE5AMtneHsI
	+IA1GH9hHqhAIlBPD1sf4HRBYOjv5Bkvi8JIYQC1fE13DXTs4hIkypTBITNg2oxH
	EV9hcAZhQyO1Rnbli+veBRgSLouWXNRbKRnxwGUMaCkIV3NPXUwt44bh5Gj0m6Q=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v95d98rmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 15:47:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BSFlTVG032560
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 15:47:29 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Dec 2023 07:47:28 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v5] systemd-boot: Add recipe to compile native
Date: Thu, 28 Dec 2023 21:17:10 +0530
Message-ID: <20231228154710.2410218-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xQew39iPbB4rMVnBF0QwKsXzrE6dY9PO
X-Proofpoint-ORIG-GUID: xQew39iPbB4rMVnBF0QwKsXzrE6dY9PO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=615
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312280125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Dec 2023 15:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192993

systemd-boot native recipe provides ukify tool to build
UKI images for systemd-boot

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 meta/conf/distro/include/maintainers.inc          |  1 +
 .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 445f797bcb..18da5435a3 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -787,6 +787,7 @@ RECIPE_MAINTAINER:pn-systemd = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-boot = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-bootchart = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-bootconf = "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER:pn-systemd-boot-native = "Viswanath Kraleti <quic_vkraleti@quicinc.com>"
 RECIPE_MAINTAINER:pn-systemd-conf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-compat-units = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units = "Chen Qi <Qi.Chen@windriver.com>"
diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
new file mode 100644
index 0000000000..73db59b14e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
@@ -0,0 +1,15 @@
+require systemd.inc
+
+inherit native
+
+deltask do_configure
+deltask do_compile
+
+do_install () {
+       install -Dm 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+}
+addtask install after do_unpack
+
+PACKAGES = "${PN}"
+
+FILES:${PN} = "${bindir}/ukify"
-- 
2.25.1


