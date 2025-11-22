Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA7ACFC53E
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 16:06:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12030.1763827572186166838
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Nov 2025 08:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=KGk9e/WK;
 spf=temperror, err=temporary DNS error (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMCbkZP2955833
	for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 16:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CFUi55RR9fjKPZaOo7Xlsd
	huYI1gUIRfvDEP+yK5XsI=; b=KGk9e/WKQ149KOJn3sr+xdN9lgCY7O016xN+Rh
	PL2w4nLPz6AcpR3+AVek/cFckCtnGUfZQHtQMgh2TBO7ybqi0/WihLe911KfbRFA
	8wZpL3Ap6tGVAM7S+GfiGV+fIeP8E0SuB1bCbdtocAZB0wLc9jV29pQMeL4cL3ee
	zQaLH+gEuP6J/YWx8yTF0RB6TZg8kFYns2PBCqw7KYlGafQwyrwZlool1JIGR6a9
	9Bb4L7BOul0W1lZ4HZzxMxYYgyL4w32cic3VdW3sLw07Myhl1xoZ9olJkj7xneCm
	WdOXOEBLX+B00EmVCLLWLLpSYsQ6Rex3r4ztP3T6RjGnA8Gg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak69sgx9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 16:06:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AMG6AEh006900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 16:06:10 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sat, 22 Nov 2025 08:06:08 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH v2] udev-extraconf: Split automount and autonet into seperate packages
Date: Sat, 22 Nov 2025 21:35:54 +0530
Message-ID: <20251122160554.283274-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PNMCOPqC c=1 sm=1 tr=0 ts=6921df73 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=csVEe04ostIG-gltcJIA:9
X-Proofpoint-ORIG-GUID: IaZ7afvI2J9hTUsdibCyQZ5MiUYXMiiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEzMyBTYWx0ZWRfX9j3WNvJnke+B
 2zNuEKi9ztn/NRZuQUGkXzQIuP0KSGpY7B4QMME3wCMyUjEhN8iCKU0O8cWoZ5sEdLYf2OKy0Rx
 IAvUCbpQOccLFUQptkJu7ZHnflMfx2A+pDb4vT3fKG0KDyTbRqmdAWC0+oIprt9Twehr9ICodMU
 +uOf6k4w7BP30RUC6oxU+RUVoOsErC6f8QPizFgPOvoQ0JvfsUd4tuIgVqeeE0piGtURQQkbPcA
 eyo2wgyhW6hTaycX3nWpF65rpJ7574/s84gr7Z0DvgOrd3JPLhusZvo27949V5mT2o4FPZH4AkS
 jf4fgi1A0/IoQ4//6wgi1u7G4kzGGf4Ciza1vD1YOHKWxG125/cLwHmLwdZTmZVWKCooJraZq7S
 AiZtM1pJJkH94oaM94uVkidlO0Nk2Q==
X-Proofpoint-GUID: IaZ7afvI2J9hTUsdibCyQZ5MiUYXMiiA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Nov 2025 16:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226696

Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
udev rules and scripts for automount and autonet functionality. This allows
selective installation, and reduces unnecessary dependencies for systems
that only need one feature.

Signed-off-by: Vivek Puar <vpuar@qti.qualcomm.com>
---
 meta/recipes-core/udev/udev-extraconf_1.1.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf_1.1.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
index 2ba6606c05..8314258870 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.1.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -59,3 +59,18 @@ CONFFILES:${PN} = "${sysconfdir}/udev/mount.ignorelist"
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
+
+RDEPENDS:${PN} = "${PN}-automount ${PN}-autonet"
-- 
2.34.1


