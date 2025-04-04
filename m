Return-Path: <quic_bpothuno@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1706DC369A1
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 10:39:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.8127.1743763159424716716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 03:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=WzmZleB8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: bpothuno@qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433wB3016767
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Apr 2025 10:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yV6moUvTNq7qurhYcqGNQOuwBUhAIzQvt5D
	gYiWC8rk=; b=WzmZleB8VLwdMF2sbszFzs0NPtuuSPFddP5T/pjuvrJsf0igx/d
	sbEfkE89YlayNfBTZwNzaZRcyczptjMQQpPA5VCAfmqpOOZHXjjRZI91zJzpB7NS
	coanhYR1K+VnsxsKhwNFClYGaoB3Md8UGy84kg5zEWgN+rOvyJ/8mWZbXYWvS9Wy
	cylk18iVcQq8+fUFvaw0vJKfviYmepXvDAHSKZbJWbedurgNbFNspNa227cKk4BQ
	Ey1zIkPRgbt9PYd+pCAsyjerBVOph2aLJTuOLDx1B0BXn24jA/DWqpRcSBaJekGP
	9gAzrJ9S8EBKDHALfjnCZnw/e0VkSE9jvTQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d99gjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 10:39:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 534AdETJ009747
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Apr 2025 10:39:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45p9xn74tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 10:39:14 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 534AdDxl009738
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Apr 2025 10:39:14 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.93])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 534AdDFl009724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 10:39:13 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 460767)
	id A0ED0580; Fri,  4 Apr 2025 16:09:12 +0530 (+0530)
From: Balaji Pothunoori <quic_bpothuno@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Subject: [PATCH] packagegroup-base.bb: Enable hostapd for WiFi SAP configuration
Date: Fri,  4 Apr 2025 16:09:01 +0530
Message-Id: <20250404103901.3644174-1-quic_bpothuno@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EkIh0IR2UGKGBkvIRWuj3WlOrWjKtGvZ
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67efb6d6 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=0nQg-bj8rxx42Fv6XKMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EkIh0IR2UGKGBkvIRWuj3WlOrWjKtGvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=841 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 10:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214339

This change is to enable hostapd for WiFi SAP configurations.

Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
---
 meta/recipes-core/packagegroups/packagegroup-base.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
index cb9d1f07af51..e0a021fc6091 100644
--- a/meta/recipes-core/packagegroups/packagegroup-base.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
@@ -262,6 +262,7 @@ RDEPENDS:packagegroup-base-wifi = "\
     iw \
     wireless-regdb-static \
     ${WIRELESS_DAEMON} \
+    hostapd \
 "
 
 RRECOMMENDS:packagegroup-base-wifi = "\

