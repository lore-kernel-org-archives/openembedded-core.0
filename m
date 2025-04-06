Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B812C369A2
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 18:09:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.29949.1743962983751229183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 11:09:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=nfvsB3Uh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: vkraleti@qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536GuFZs020532
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Apr 2025 18:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=95WL7W2xm6onbfU9TI9705WXNdcrhAmCLpj
	fF34MG+s=; b=nfvsB3UhatyfAx50jm2NQEyYOKPtHuVoRf3RFEmuU/MlyvIycLC
	YCwPgCCgG5+vx8E4JhQK3zX/R4xgy2En5EUWDSEVQ0BcpRe2tDUHGsxtojqQRkAG
	b7BI8FPMoaJESd+NU0WVP/BlsXN8MZrqqF7UqBJ1VLvtpJdzjYU3NkouYuBm2lqL
	NBqDXGlXB6ViNTPDaMpjd3zpdohCVtcYCR0Ly1iXazsI0ZeS+yw4EmLk5KPPhzwV
	YpM5cHZnujbd6+mGY1zubKdKf7DJVaKMHd3jbictbukVj6hLBLaz64UN3N5HNhmG
	QNTALrPZihUjHfqtMJWBQJ/NiMKkd0T0Amg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2j641-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 18:09:42 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 536I9dvn031251
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Apr 2025 18:09:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 45ufe8f81x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 18:09:39 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 536I9dwd031245
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Apr 2025 18:09:39 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vkraleti-hyd.qualcomm.com [10.213.107.232])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 536I9dsI031244
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 18:09:39 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 74473)
	id 614A324A9E; Sun,  6 Apr 2025 23:39:38 +0530 (+0530)
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Subject: [PATCH] libinput: split udev rules into a separate package
Date: Sun,  6 Apr 2025 23:39:20 +0530
Message-Id: <20250406180920.262141-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hAsXkQ1VtYWEa3HmINPaZRQZK3Um7XRf
X-Proofpoint-GUID: hAsXkQ1VtYWEa3HmINPaZRQZK3Um7XRf
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f2c367 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=njloxp-ZwzwVQKtBaX0A:9 a=0lgtpPvCYYIA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=915 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 18:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214388

Packaging udev rules separately would be helpful in case other packages
need only libinput udev rules but don't require the library itself.

Let libinput RDEPENDS on this udev rules package to ensure build consistency.

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 meta/recipes-graphics/wayland/libinput_1.28.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/wayland/libinput_1.28.1.bb b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
index c10422bf9b..42d2c861a9 100644
--- a/meta/recipes-graphics/wayland/libinput_1.28.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.28.1.bb
@@ -46,4 +46,9 @@ RPROVIDES:${PN} = "libinput"
 RREPLACES:${PN} = "libinput"
 RCONFLICTS:${PN} = "libinput"
 
+# split udev rules into seperate package
+PACKAGE_BEFORE_PN += "${PN}-udevrules"
+RDEPENDS:${PN} += "${PN}-udevrules"
+FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
+
 FILES:${PN}-ptest += "${libexecdir}/libinput/libinput-test-suite"

