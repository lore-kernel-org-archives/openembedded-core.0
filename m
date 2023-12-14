Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA23BC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 14:33:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.23677.1702564396515606759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 06:33:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=fGNn2LtR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BEDTilY019052
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=+0UrQ6i
	gl7OaWjEvP9LxSpiS5+1qWTvd9xYHTp4st2c=; b=fGNn2LtR93fbVCp7w0v3yTL
	PBj9aA+HX+nYxBNliuxTR9vOwmRhpTc0sqFdnVUUMELHt4wdz5smDwiTCsdal2tR
	vIEfJM9lbWFSpK8qdomaKduy4xQ1JTVZrP2IrtB0F0ZUXPDyA7NRq8XrK+YiMbyh
	Evqs7kfeWZlvBxYDKijAjbuM+J4JqXpabzC09KWq5LgchZEcz1grVT94JAG6edjK
	vE83yx7dtwbXbqvFrpeVs99oXaHYDsAA0hqj1+JeJicWFBI9Cmh15ytQ+Ggq4W5Y
	TUeXAjbk6DFVJ5bRQQPauAq1yUpzXfm5qNSsNFsy/2s/N22K3Y44SnLjV8SI1Zg=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uyq9t1h9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:33:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BEEWdrh031178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:32:39 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 14 Dec 2023 06:32:38 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3] systemd-boot: Add recipe to compile native
Date: Thu, 14 Dec 2023 20:02:22 +0530
Message-ID: <20231214143222.2796092-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ir8JzFHsGIBB_5qCX6p93uO5Y1yo3ts3
X-Proofpoint-GUID: ir8JzFHsGIBB_5qCX6p93uO5Y1yo3ts3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=663 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312140102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 14:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192384

systemd-boot native recipe provides ukify tool to build
UKI images for systemd-boot

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb

diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
new file mode 100644
index 0000000000..baa60ae0d2
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
+FILES:${PN} = "*"
-- 
2.25.1


