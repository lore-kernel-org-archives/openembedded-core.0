Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267CCCFA478
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 06:13:14 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5978.1763705590035199206
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 22:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SdXnII2/;
 spf=temperror, err=temporary DNS error (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL54BO52841459
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 06:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0JK5A8z2ulNTWwwcIWWczo
	Oaf6MiZjOWDnbFImH3yZk=; b=SdXnII2/RQogZsEpcNpU5wQapZw77vcTznfaPd
	bJJ3wtiqT0GQo25d2onPk46giaDzbuiKwTvGbv9Zz8O39+bR5WwcKQT1S1E0NBTE
	rGnLp6nzGqd8F+2Q7jfQzyCHt+4uxmy9JuZ76b+cpJe9wOikuSvqD5Sao53sWCw8
	+AgDE3MCWGimo4lRfEo5LRIDP9aaPEH85S3KTiak1cvc6Oh18veyz47sOoQ0ORvM
	EEDD18KQqNkWxCzEsr3rh79+6OmKsAALqJOrvhgGn+Od7umijunQNdToenrJHJza
	s9OilEqRXZFyvVmFUfpqAxl15jieNbZAXMNVE/WqmAu8NP8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajhkvg5by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 06:13:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AL6D7ot030114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 06:13:07 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 20 Nov 2025 22:13:06 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH] udev-extraconf: Split automount and autonet into seperate packages
Date: Fri, 21 Nov 2025 11:42:52 +0530
Message-ID: <20251121061252.2644203-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Glq2nEVeeLB7HhBC4oM4Vwp9wHh_t5Hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0NyBTYWx0ZWRfX9d2A7eAC8RWc
 U9Lc2DYSOnOO4rxsDmgKWL13B1v3Mfjz9ku47aUcDKV1qTxYiWO8etzUDRM5CqeJFCnX0ILnKeY
 wRmKhhfyHy/M0yc4VUIJrKjeom4YOzQIsW82RCN+Pgf4WhnQFmu9v2m7lnFfh3p1RG/kIXbCUuq
 EEz6mmX4ySxvPRLU8QU2VcgoVDZ/jq0DwLlRag6kP7r1hKh2kBj48JBeASNQXQtML9rfqBAgOw6
 UM74zGqawA3cEUbKCsweu1e1nE//1fpaXE8NHOJRDA1yAFD+6/GINlPQI3DuI6MoxaNy3IVIvmv
 QTaCoiJ9ksbjAXtBC9/NmLwRGe280WDTp/FxlWRqd9CWa5uwLL0XD5b2Ju5frNCbb7U0FJHBCjl
 Vcg9guJX3RcmFU0fS9YzKYUJhABcyg==
X-Authority-Analysis: v=2.4 cv=bpdBxUai c=1 sm=1 tr=0 ts=692002f4 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6T39DjoEcH2jJllcowYA:9
X-Proofpoint-ORIG-GUID: Glq2nEVeeLB7HhBC4oM4Vwp9wHh_t5Hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 06:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226649

Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
udev rules and scripts for automount and autonet functionality. This allows 
selective installation, and reduces unnecessary dependencies for systems 
that only need one feature.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
---
 meta/recipes-core/udev/udev-extraconf_1.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba6606c05..7a63773d69 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -59,3 +59,16 @@ CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
 RPROVIDES:${PN} = "udev-extra-rules"
 RREPLACES:${PN} = "udev-extra-rules"
 RCONFLICTS:${PN} = "udev-extra-rules"
+
+PACKAGES =+ "${PN}-automount ${PN}-autonet"
+
+FILES:${PN}-automount = " \
+    ${sysconfdir}/udev/rules.d/automount.rules \
+    ${sysconfdir}/udev/scripts/mount.sh \
+    ${sysconfdir}/udev/mount.ignorelist \
+"
+
+FILES:${PN}-autonet = " \
+    ${sysconfdir}/udev/rules.d/autonet.rules \
+    ${sysconfdir}/udev/scripts/network.sh \
+"
-- 
2.34.1


