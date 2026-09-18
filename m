Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9079AC88E75
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 04:46:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4312.1789706800992292147
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 21:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=iDo4slvO;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=vNVU7ryR;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-garg7@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68I4KI5r3233427
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 23:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=2IBYQadRre3RQ
	lS9iKPRreMAEBqiy9jv8yAxOSJMGZk=; b=iDo4slvOB+9szVQB13iXZwPzUXKf3
	8Z5XdQBIgFzO3X6iZsCJXghQ+km37kTXw/OmTVThm0FrRPCCf2jGVg729xHLROHX
	OEvQA9OoG5UFGY2HMQDVTB7ofKfDyLL7sEM+cNKWKpgZm576x0MTqBesuSxWEfOr
	aV+0lnyhgMJhaUOXgMhV6ZrWvL6SADFLa7fMrcOxN0TrOe45BHGxgGES+Z00+t8l
	nlhtcRdoVrA0dHhWheIy8ksD3+S5NALednMRASzE19290QpI9VChkRR+B5ZkwGUU
	E0QglqJcDQpoEWW18UrsDYMzfmI9WPxDzo6Aq6J1VAZs3IwpmHpw0D/rw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012030.outbound.protection.outlook.com [40.93.195.30])
	by m0380145.ppops.net (PPS) with ESMTPS id 4grx6d8591-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 23:46:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XosKSy4pWmpQvov5FSRH7ztEnSpCctIdM+0FuRKbMSmwXQKsR+jKx2px1f6jVfhkmsUQoL0HlN59/MMvaLUW+JlkW06EOMU5AcrkE18I6jxcbkobrQCffgbDj/XScySl8omM+MrB4q7MD+d+5GTE101hvqQmVKgGY+1+eJXHhOZSiKSGNR7dPpDKpk67TaRblrWphbF70AFVybVlk7Ht0TY8awI7WxZ3pVfNP43pVelLVGuCpyIAUWrh5I46MuSU6yHUCwc36aP7ZKcILLlw/fQw5yTuRBf1rlcN8ohb0q6bkJukVHl3C8BB9f5XwpFvZ5WMUn4v3Ak2JQ+QUd9zPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IBYQadRre3RQlS9iKPRreMAEBqiy9jv8yAxOSJMGZk=;
 b=DhPccQytitt3XIXO+Y4wh8XvokXjOQQQ59getQYEyZuIkWDqjfGAX0kd1I+77Ef7pneHaWrwGTEx+CMjvxf11dUfoai5C1ekufrKlVZN6thTxH9pLMTz3pQGbxsGm4pKKObfcuMbmA5H5N6yuJqUpMpp0Sxc+eUNjlwodeczFbLe+lE1hEP6J57HUqgANUHJfjiO5D6Ge/+x/W8PGzfArUrYpSfkwM0T6lBbBLRSPwknwC5ClL++IW53BkftilhneBx1/X0qjusdBuhQ6uKw0jZGTiiRnanG8IReTIQ6F33Bj0PLyemvBHy6km/7Bhb1/Ci7biLxc9UC0QZ2mPiFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IBYQadRre3RQlS9iKPRreMAEBqiy9jv8yAxOSJMGZk=;
 b=vNVU7ryRx7b+jjH/OdWNkLGub4LFQgG4l0tgkAYn55m+vfRoA2zoleyWe6FvceEizWLneXl+uAgNYurx9dzkngxgUVmYIeEM3JmXz7ym+BYbuiNjCWRoLmO4RjnsWKjelgm1qZy0PwR8nGEjqsFybdY+FCr5y6QW174ZHJbr+G4=
Received: from BLAPR03CA0115.namprd03.prod.outlook.com (2603:10b6:208:32a::30)
 by BL3PR10MB6044.namprd10.prod.outlook.com (2603:10b6:208:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 04:46:36 +0000
Received: from BN7PEPF000000AA.namprd05.prod.outlook.com
 (2603:10b6:208:32a:cafe::1c) by BLAPR03CA0115.outlook.office365.com
 (2603:10b6:208:32a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Fri,
 18 Sep 2026 04:46:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF000000AA.mail.protection.outlook.com (10.167.245.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 04:46:36 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 23:46:36 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 23:46:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 23:46:35 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I4kYbG1044729;
	Thu, 17 Sep 2026 23:46:34 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <openembedded-core@lists.openembedded.org>
CC: <danishanwar@ti.com>, Aksh Garg <a-garg7@ti.com>
Subject: [OE-core][wrynose][PATCH] linux-firmware: split out iwlwifi-ty firmware into separate package
Date: Fri, 18 Sep 2026 10:16:32 +0530
Message-ID: <20260918044632.172417-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000AA:EE_|BL3PR10MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fc59ac-39a7-460a-c7ff-08df153fd260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|18002099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	lnlShLNgGYd83Z1rbBPfkHw8FO5eDobVW8ZpphN9U/p++tyyYZ5zWv5nIkgnECuWBdCti3CQCtXDqZ1iMJ6RiXVh5nJhZhhA5sib5LumSbGbuOdYZj6YjSS3iAF3zgOTCYOG73YmH8WtqSnqTtUk5GdXFhltpSDdxasyG7ClTUT4G8SKd2CUVxvc7M3NSSKvLFTylciG8TSFZOnDTca+NmOsR/jebDH5T4wyvqoMJqBpH9eo4ZqKEhrJv2kz4xlAFJZOMhGVEnU7k9fAvdA6SiHuiAHO83b+Na7CQVfuxRfeQX6d3xmfcWCPXGzaVp5IW07XGDMlD8XKFmLWKrn+A66CqSAQ2tQGZPNhtw6ZiziC1Wwuh6JCfnFYuY1R8mNk03UCyEd21h+2ZTd7CV0Gr52pzHnEGlU8+2IJH/LJSCfmMI4eBDtOL8+bAHB43IDmRexhKuAgT20BVeqJqND/AqBvao5ofYc2UDE2NxBOLcReipSyv4a9I6s1stxmDfbOukbhNQuWwQzJcc3oN5+RpLwnN8dtpT11j4NKNsC19RqXtEl7t7oSMZLIGKOKWHXFbH7hQ+VUylf3j90UZoC1yd167bJuzy7KwgcxcNZ1TruCEJ2YhR/WB3Xyjyfol9C49M9VHWNdP9UWEWg0014FZEjhLOAnWGIJ+EzmZ4MdgrGYDgTs5huzeqqE5EqybGVwy0Mc1ZFWvd5YfQV295hyJw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mMIoeFH9EtBopjOpUl8hOKEcRZiG73QDMN2k2KqBcP6tdEL+Gu8ZCFMSra1HCMSN7pO1d38Eg+PGFavWhJDIs56z4cM8DvRkaq+xO0ImkNpL3GJSWtjdzIisepzFv9uqmeuiDfTm4qIcicDn2WZwsB4j94yKw6sPfJjtoQ2cZAy+fseYSM9AjPZANN06NOHrgQnyRq3JVvR3LEexobY0msShkQ9qTBY6XmZMTBg/mML1L17Ac0c2n2KStURwlBuq4paJGAYAbqKXA3pfqh3Jlh8XVEcODwFGfm1ODVIrn1LNzIUr9QdUM+bPkWE7+CLvyCX7psSLlm4YlETHYQodz/d9TaPyncZPVyaUPOm2bSsZsDq2vLfJO5QljP+GaKrAiqgjw3ZRuT6AtrfBwQlssSE2lSWLZQlJP/5oKxvXoJGdE+Xk01EdeAvdBcaocSJx
X-Exchange-RoutingPolicyChecked: 
	JTcVNZG8L1EAmFmEBbxMAVgQT5ifDh9Sox/iXEpJIEABrlSiHaK1NtQIdTbcHV/Or6a6mEFIevfDU1PBY9UZt4Bv5DbSnghhj/1+oKwFs7HwVZjz4I4VYOs9NKxIXhSamG3CHO6oKFdxa9HgKvKb4lrI6pKjTulk+6ABr3cKYVRO4u3Ikv5oJPrf4kmEPAEpe9EdCQzW7Sfu2/CN9tVgH0D/WoDMe5hZbCP3F8dhpQ/b3XH7CGpVTK1MkD2NznhrY5vpLq2YG/v0pfKeXl8tUEu1hTKDu0b5oTsqgL2Zc57NB3fJuaZk1q+S7AhS4BVVpbN5d/yk0CK4Urp6HF4Asg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 04:46:36.5362
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fc59ac-39a7-460a-c7ff-08df153fd260
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN7PEPF000000AA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6044
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA2MCBTYWx0ZWRfXwBMQzNkd79OK
 U3HuHDMP8bufoFuNRc89sOKO98xofOJzoqU3zlq6XHjyC+3+Sv+uttIIN7TqVcpnlqG7pqirUL4
 0hreADYcOGTcv/rVfJ8kT3CIEfMjPpA=
X-Authority-Analysis: v=2.4 cv=Cswq4X4D c=1 sm=1 tr=0 ts=6aacc230 cx=c_pps
 a=3pdFJ6cSxbCDruMc3dgxYA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=7bNgJ8BeZW7CPAhoLRkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA2MCBTYWx0ZWRfXzMi3oRNuTotG
 ML5VEa3wE1xLoBCEQIDLjWNPopKI4Mv4iBkqGwIai9FmioQ/dfiiNu1iYORacw5xouP1iSrUeyE
 GVpEdr9qyPPDPwkDbE0L7Mr/uMtj753/S8CZlr2sOSXZfpHboomHojO7BS1BU3E0E2FOZLBhzFk
 k+/lrxIDHoX+F61nq/LLMIiLAFmxwJAnkQ3JN7xo/sgGtfiecSy6rXMhLxm1rxHbnOBaPzlFvdQ
 f7oD/w+nz4m8nod5Z2FajUWHIzdEyS9lpU2DGAJx+tZnM5dXrkMLvtuDbK/i5lrkFRqvGasjM/B
 AQWmSuwhFFglsmKv5neZEI2gvylKymC+9hPEg+mDywHiBmlcMV7f0YrN23kvd4gUPAUUwoe1et8
 keBooeTBzRA1B3H2UM56gQnIMaDdKB1m4glDyW2BCaudFUK9h0hz7p93yKxnG1Kp9zFBO6UpusQ
 flZxknYcoejxzVdeMIQ==
X-Proofpoint-ORIG-GUID: DoYAw8AD3NVJCcRUOoInTwLA7K9wlMPo
X-Proofpoint-GUID: DoYAw8AD3NVJCcRUOoInTwLA7K9wlMPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 04:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246176

Add a dedicated iwlwifi-ty package to allow users to install this
specific firmware variant without pulling in the entire iwlwifi-misc
package.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---
 .../linux-firmware/linux-firmware_20260410.bb              | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
index fd4d2e4d599b..ddbbeb0a74d0 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20260410.bb
@@ -664,6 +664,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
              ${PN}-iwlwifi-9260 \
+             ${PN}-iwlwifi-ty \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -2135,6 +2136,7 @@ LICENSE:${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-9000      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-9260      = "Firmware-iwlwifi_firmware"
+LICENSE:${PN}-iwlwifi-ty        = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE:${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
@@ -2162,6 +2164,10 @@ FILES:${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.u
 FILES:${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-8265-*.ucode*"
 FILES:${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9000-*.ucode*"
 FILES:${PN}-iwlwifi-9260   = "${nonarch_base_libdir}/firmware/iwlwifi-9260-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-9260-*.ucode*"
+FILES:${PN}-iwlwifi-ty     = " \
+    ${nonarch_base_libdir}/firmware/iwlwifi-ty-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-ty-*.ucode* \
+    ${nonarch_base_libdir}/firmware/iwlwifi-ty-*.pnvm* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-ty-*.pnvm* \
+"
 FILES:${PN}-iwlwifi-misc   = " \
     ${nonarch_base_libdir}/firmware/iwlwifi-*.ucode* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.ucode* \
     ${nonarch_base_libdir}/firmware/iwlwifi-*.pnvm* ${nonarch_base_libdir}/firmware/intel/iwlwifi/iwlwifi-*.pnvm* \
@@ -2190,6 +2196,7 @@ RDEPENDS:${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-9000      = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-9260      = "${PN}-iwlwifi-license"
+RDEPENDS:${PN}-iwlwifi-ty        = "${PN}-iwlwifi-license"
 RDEPENDS:${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
-- 
2.34.1


