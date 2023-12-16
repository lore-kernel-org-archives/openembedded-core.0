Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B4BC35274
	for <webhook@archiver.kernel.org>; Sat, 16 Dec 2023 00:26:08 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.873.1702686366284513578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 16:26:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=eTtJw+AT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BG0LNFO009037
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 00:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=R2xB/yq
	r3yS8t7D101rKMNg3qDw7fj5ETZqDQASXMJE=; b=eTtJw+ATvv2ZlB9X8GuwyS+
	omBABckkYZVcngSZLjCN3CrChYil3W+I+jW8QV9NgiWyAJJ9FGBUEnx5LDqK80Qx
	zKY/cDRj3Rh0G6P/H7SZTL+NoMyyt+YvtZn7rHERW/ecLXzXkRMHxEkygTAgvbce
	7ByvuN2BebDAQ9/eN1an+1lk8QkMJWxdc+hDSccJTsh27/wnmAyk8w98DbzDjNcD
	INQAilsy47wBvmg/7GwyK43hWkldu6mZ6yDH/a+dKhuZBFNx0uhbX/a4RMKziREg
	b7kgPeqhUIh/g3V/9EF7K7JqBRVHk1qwShlAyjWw6D2vnc6X9XA96X0RrXfj03w=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v118s80en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 00:26:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BG0Q4Nc004426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 00:26:04 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 15 Dec 2023 16:26:03 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v4] systemd-boot: Add recipe to compile native
Date: Sat, 16 Dec 2023 05:55:03 +0530
Message-ID: <20231216002503.3681891-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gP7zCSbO26aRCSKK_RAMbBJIZXF01XNL
X-Proofpoint-GUID: gP7zCSbO26aRCSKK_RAMbBJIZXF01XNL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=663 malwarescore=0 phishscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2312160001
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 16 Dec 2023 00:26:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192554

systemd-boot native recipe provides ukify tool to build
UKI images for systemd-boot

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 .../systemd/systemd-boot-native_254.4.bb          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd-boot-native_254.4.bb

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


