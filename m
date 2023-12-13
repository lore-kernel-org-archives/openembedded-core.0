Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29596C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 11:58:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.34505.1702468690759216398
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 03:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=HNhWOMX1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.168.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDBsvC8013418
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=FE357Cl
	DCPku/4rkR1vud+Nn7IfgBPAq/sCNHbe1Ras=; b=HNhWOMX1nREaMiyvYPDi4jI
	+OGnsCsstTNIszG7OEVCBABPq1wUB3sVe2TgDjPiBWYFaMrmgfj3RWJfFbNQga1O
	oGhcQBNT8r4lA3hwthaFS2HmJKhEFNypUPWx/B6v57v7n9u+vqqcWLjvXOcIMnlV
	dozyEuapQpxcBQ8Gzm/tkKKpZb2Q8kQn2V/THLMhgu8k4JiLdAnsFCdRiZ98ouAn
	StfjJr2SZTOXpYKqo1O5ZW+q1qdS8gXk1iVMUv9dp16uhNxCutgPPfUhEZKhUGJG
	ETU48rCi4xc4bWO06oqCYLZbklR7hfWj9kcz4mxBx0BAuaEW9ViwqLDdvIE1gnQ=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5tu10rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:58:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDBw9pU005102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:58:09 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 13 Dec 2023 03:58:08 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] systemd-boot: Add recipe to compile native
Date: Wed, 13 Dec 2023 17:27:47 +0530
Message-ID: <20231213115748.487216-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CD0dFwB9k5cspt9FQG1WXB9sCvnQqoCr
X-Proofpoint-GUID: CD0dFwB9k5cspt9FQG1WXB9sCvnQqoCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 mlxlogscore=775 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192289

systemd-boot native recipe provides ukify tool to build
UKI images for systemd-boot

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb

diff --git a/meta/recipes-core/systemd/systemd-boot-native_254.4.bb b/meta/recipes-core/systemd/systemd-boot-native_254.4.bb
new file mode 100644
index 0000000000..0cdd7e7045
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
+       install -d ${D}${bindir}
+       install -m 0755 ${S}/src/ukify/ukify.py ${D}${bindir}/ukify
+}
-- 
2.25.1


