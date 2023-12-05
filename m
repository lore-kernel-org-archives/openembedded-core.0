Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44644C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 09:35:49 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.96824.1701768943640623101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 01:35:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=a8yszv+N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B58ph5e032326
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 09:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=oL5/wlwsBRUxECwZ7uixD6q93xlOnf3Mz/NHSf6kKtI=;
 b=a8yszv+N4taBMvA67CKpqTH5FjoI4dogQ0vSOKS3O0Ef7KhVA5kBASJYgYfZzGYFyZ1W
 mSchUAEl/otqk6B0bi34okOtjncpjsFVkoss43DWvqn4gnSHdJHEqug5Y1qAuiJvfXdD
 f1wxyjsphk3iEmfsJZqbl6mggLHUGfv6aXmcypoFAvRcJ33RauBdTwZENNw083TCEXSg
 MXPLNMq4kho1GNI6dj7V8imggHB6WYx/CeWFcOfygkBJYDE9JaVXJv2Km+5x2qaMC9K0
 2FGOv2dmsMR7Lms7ZfBg99KBB9u7rLouByYOaG73ERzLjSLZjszZSuTg28Diy+EAAB91 Jw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usmw01e45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:35:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B59ZfLM005631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 09:35:41 GMT
Received: from hu-vkraleti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 01:35:40 -0800
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] image-uefi.conf: Add EFI_UKI_PATH variable
Date: Tue, 5 Dec 2023 15:04:41 +0530
Message-ID: <20231205093441.3898052-1-quic_vkraleti@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lr8BXM_C-1rktIqlwjWwBZtjIaR1qm-J
X-Proofpoint-GUID: lr8BXM_C-1rktIqlwjWwBZtjIaR1qm-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_03,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=677 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312050077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:35:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191809

UEFI bootloader specification says the primary place for UKI images
is the /EFI/Linux/ directory under $boot. Defining a varaible for
the same to reuse in all UEFI-related packages.

Signed-off-by: Viswanath Kraleti <quic_vkraleti@quicinc.com>
---
 meta/conf/image-uefi.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/image-uefi.conf b/meta/conf/image-uefi.conf
index 18351e7e3c..aec91bcfe2 100644
--- a/meta/conf/image-uefi.conf
+++ b/meta/conf/image-uefi.conf
@@ -1,12 +1,16 @@
 # Location of EFI files inside EFI System Partition
 EFIDIR ?= "/EFI/BOOT"
 
+# Location of UKI inside EFI System Partition
+EFI_UKI_DIR ?= "/EFI/Linux"
+
 # Prefix where ESP is mounted inside rootfs. Set to empty if package is going
 # to be installed to ESP directly
 EFI_PREFIX ?= "/boot"
 
 # Location inside rootfs.
 EFI_FILES_PATH = "${EFI_PREFIX}${EFIDIR}"
+EFI_UKI_PATH = "${EFI_PREFIX}${EFI_UKI_DIR}"
 
 # The EFI name for the architecture
 EFI_ARCH ?= "INVALID"
-- 
2.25.1


