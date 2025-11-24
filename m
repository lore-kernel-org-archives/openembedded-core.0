Return-Path: <vpuar@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB33CCFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 08:00:56 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11773.1763971255518235303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 00:00:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PX09tAWv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: vpuar@qti.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ANLHQXo2117794
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 08:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i2Z7asLCWrhJ/LFw0H7l27
	drURn2HZXr5hmdQejGfog=; b=PX09tAWvOvZ34yMf0cFDrAR0o9i50BIYIlufct
	CUpdWmKNdSle5leFBQE/t7K/dxFPKtzd03UzGsZgo2tzC0wDi94T4XF3ZkZgeXQe
	BaeJ6l8An6KHowaa4sjsUrpeVhcYWx+K5tcKa7dRz1Zk7V/dSfx3KyX3a7d2hrjL
	0jV+/rZ41R+FwqXJ6dBpw6ra35mZaPLo993v35hbVs9Cqlkr6eKQDDHh4s+pRtiM
	GE2ajQiUZgwWwDDwPtiRjU8QWz6AvsTqcDT3EPxTNAb+r8mzJHTspOTKwf8z8sRE
	0WmkTKxCgd+gn8ABLOINx6Zz8gHgAeyjUqDE+Pj3WDh+F3Yg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak694v5jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 08:00:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AO80s05004611
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 08:00:54 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 24 Nov 2025 00:00:52 -0800
From: Vivek Puar <vpuar@qti.qualcomm.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <vpuar@qti.qualcomm.com>
Subject: [PATCH v3] udev-extraconf: Split automount and autonet into seperate packages
Date: Mon, 24 Nov 2025 13:30:22 +0530
Message-ID: <20251124080022.2814003-1-vpuar@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA3MCBTYWx0ZWRfX1CebimX7bGCI
 amkdXk9LLb+ZPKFlLFqV6DKweZ7rjwMylZHIVctm0f+TDmMK5q9c+S+v57SL5PL91FKWqH5YJTK
 YjDRXvMI/qM9gu+4Th8sq5l9QQc8hzTOaqvsX4U48IWyNl6vXIChfl1fBkWJRsxOtVxo1h+qpsL
 t23q08+bWAnQQ5LfCE35MCCj6kp0fT9B6ZkAICQlG9MhARygyx8YAa+OJAaBMBK0fixtAvMBNnw
 bZtqBHRYIiFZAArr3dFou9K+g6iI+qrB6GdOVf81NVrLqO2GfQuzDg4lwG7YvnO4WcszAsrOwdM
 Pbkc3M2EDMuadhsthzheuZavZMKTxcW2Cd78dHp/zOMyHeIBb5DtziLP9LB63ZJvDupxSWUw+O8
 6Dn3UuiWDdLBy+Y0u3TpFAKMHy40gw==
X-Authority-Analysis: v=2.4 cv=YJqSCBGx c=1 sm=1 tr=0 ts=692410b6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=U8-nREagySkxKCwFLlEA:9
X-Proofpoint-GUID: EbaKwg_mu9fG3SObN1-MzqMJMzREZ2BM
X-Proofpoint-ORIG-GUID: EbaKwg_mu9fG3SObN1-MzqMJMzREZ2BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_03,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 08:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226739

Created two subpackages (${PN}-automount and ${PN}-autonet) to separate
udev rules and scripts for automount and autonet functionality.

If the image only needs storage devices to be auto-mounted or just needs
network hotplug handling, splitting the packages let us choose automount or
autonet package without having to care about other rules. This change does not
save much space but helps avoid installing unnecessary scripts and rules.

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


