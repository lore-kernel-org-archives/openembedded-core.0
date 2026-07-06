Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20711C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 22:19:45 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.161710.1783376377831252314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 15:19:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ouSyZ4aq;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CUv5IyA7;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 666KGBJZ1674492
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 17:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=8yAdUXW7VoTTth/FIlZE2pzq5fJ7PcNPQ7huntRPg
	2g=; b=ouSyZ4aq9LWo7iC/DkdW+AhXfyA1Wb5YEmfTbaT1A1XsD0MOkec4TcmGr
	oYEGYuGDv0pmRxz2G7z15Dejlr9XnPAz1f0RolOFtKzZ03BYwZ1yBUK7xYCiG26G
	PcsZ/ZkF6xpSA9mZxPe14kZcB1d1TF4HTeSCf7tVR4fXmr1llC2hDCHPGt5C5d34
	5sSGQ0DCErxCGySOXbmWU1HvMQPeGH88Ue071F4h0KxUqMOnrjHKtkijhiX5gAHf
	RG1CvTiCJMC/zwOS1s8713zBGmUt0UfHRSgLnh+7hR5CHoy/PNENcaq0oRaijfMl
	Xxk0NmAp6byU24L5shRfe85tjMrlg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013052.outbound.protection.outlook.com [40.93.201.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f8ba0usec-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:19:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+lMLlp12y5aNxOv0DL+9ibM8itj45sT3K36AKO0KLT0iwm+Zor/+ra7gtMpo+J3805fGevpItGN9Vm2E8gDYYkGTJGf4cupbfl4X+f07RYw79P3Z5J9oxYs6/Mx1RoqHgcm43nyaKgZxOHKSnSMqWG8x+hiz0GTlMGvCPXUX4kDxtdYX8Q8e/bgqPbvP+4tWeiNfepv5vZFQBnEvJWp4LIE54uDW0TqfCuZikT6pO1EwCW0ubTSlqYZ0x0PMIy1RA/VSCoNXOHhO4rzY4hgS9Z7FKz3klcSxI7fR+853qUrdmH16xKbbtVNd71D4TOmJrOXAOSe9Zg3lsrFpE7sAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yAdUXW7VoTTth/FIlZE2pzq5fJ7PcNPQ7huntRPg2g=;
 b=lv5DTYhNC2j565GWU3hY5p/RT8yOo7HLbMczx+jm1dzsLZwuYIiY5apwtRK2MdislOHgJ3NGas9zvZdjGdb0BWatdy5n7eiFDdSCcgCoP1RxFgGC76e35v8+a/MRatCncjV8J0m0gI+NEF/L5V6KCjRLXgVhKTxfJVLsONpusYGpyYX8kSrs6esIzetWRQhKYjWMpGL3nIFODNwSjjEmFl1VTCyaWb5Df8aKprOqAEJBBUJs6/g0ztaH1vcL4ji52RsGTunt5qlwYplAdZR1pdHayjZruY6kIto8WlN0h5me2+7xKay85zOeIN8bOgaIcWffaB6uL3bS0TIeqZ8yEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yAdUXW7VoTTth/FIlZE2pzq5fJ7PcNPQ7huntRPg2g=;
 b=CUv5IyA7pNsLu00n6kfqe+Tl9eBoECc0r9CF+AA1a7Pf8c2iS+BKd64VI7XPGueE4OVQqxS9Pj6jhPfRICGRkeKmD3IkigrTEL9tph2qbwLYMI/GEtJBniL3/UakQQsPndbYZZRQ1c1U2VR8GrVXKNKo79ODDu5lUodcKsDbs6I=
Received: from DS1P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:242::13) by
 BLAPR10MB5171.namprd10.prod.outlook.com (2603:10b6:208:325::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 22:19:34 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:8:242:cafe::8d) by DS1P221CA0018.outlook.office365.com
 (2603:10b6:8:242::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 22:19:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 22:19:33 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 17:19:33 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 6 Jul
 2026 17:19:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 6 Jul 2026 17:19:33 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 666MJXCP2917987
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Jul 2026 17:19:33 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wgrf3-0000000GtTx-0alA
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jul 2026 17:19:33 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH v2 2/2] oe-selftest: fitimage: Add tests for KERNEL_DTBVENDORED
Date: Mon, 6 Jul 2026 17:19:33 -0500
Message-ID: <20260706221933.4026508-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706221933.4026508-1-reatmon@ti.com>
References: <20260706221933.4026508-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|BLAPR10MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: 188ab500-d486-4562-85de-08dedbaca857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|6133799003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	85au6MYmE8q1ieB4kG/MVa0q/kUXnrbl8r05ZV6U0YKubS9KwAyWMGpJ9s+uU5tPRlczSfl7X6ttC2LWrtlVf/HO0aDqb7OnwbnoKBwQ3ItDQ85V6dKDCQiDv7j5zZGz71+MoK6S9DRms+wxNvqet3hhZurwBU5ndj+yreHFV5FmY37stujOejN41H4PRLYG1QV7ET2DVGEJJvwD4JdusSRPUVntxVEqI4iuACpP549hyZfbEWAVz/Sn8ZMy3gXUJfzgTn4CP83WFMeisEt4LRVhzXfJVGvL101wf3EJJ1jxt2iBte4t4aPkP1UgS7GK8T0p9stbyKtkPS5ccYpLGFjoCVq41ZnD/tAwazEwXw5cK5JE3VbJVUJLhRu8ONhKRoTQ62Unm7MHYuYwG9/c0pumGaGxb4WI9alMjAFKSCpXHB4QdKpnBT2BZBsQb3KfYUJxYoYi586laas5npc0l0wU/z7r0h5yMxB6T9jrG+BqfkJpCmUgPFdVATG9cD42DuwhCItTFP+X8Ix0LEstq+5HlwS4N0HIjWWDgEcck8cM3qb7pmrC8t6gMzOwDUyIg7m2xVgsNilJx2XBfLgCUv/E687vDmS/s6HJC3Cvcl1LSvjkfZHHx5K1ZGzmYlkXkqVUwdxLPuQf+Y0MuYbvv4xg99AEDcZhg91Z/A9tCsCIWKtLvdLQJjRlCXsbfnYzyEw5iD1dkqII1ii3XZdC6A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(6133799003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Nxa+5Z8C7iS0pmmVPrk1y9px+3FoU2p8C1EdTwnpTV3YwjIWvG8/nLOwDsctzCMJTmeQYzXTHlVPk9HZxrUX4SX5Uy8ODxA0gCeWQhAuI5ZxBiNYchv07nrKJNGWHZNm71i1SgJjmM4VkYR5+wmtbwiUjSHYLf1UzxAO/Zx5Y/ys3VXP7Wfo0RQRY2138VVdo2WBj2qnYZwX4aFAFtxOm+W51mDpm//7YUUqO+HRJUvH708UMqj3yL5yCjbj7zCpm3qVUz2tLkLm0z3uF+h0gZPivGYGkL5IOpQfL7m19w6iQkCcDWBYSsHnPbqLYRl1wKCqhkhg/QlmjmQ5jcqZNawTmbiWrIVIwwEEPeNl06GrCwTAGSaXrcUWqZ1vMIc6g13/elEknLjtkU90yyPI92ZEtjBC+aqH1aSBs2QXePc3gfaEvYebJr/6XMpypHMU
X-Exchange-RoutingPolicyChecked: 
	k0OtdW0wfk5VdWoItfsv1m/AEoX6NOl/4ih6M++WrzTzSbO+4x67gu+Eo3dyFgEV1lrqmIUErOHpmPeu8RsQNZGpWu20w+cBvJNVjU1Q1PI+/nz6xIM5dqCoZ5T6fSQFcged9GBAUSBGbu4lfCBbMWg+rUUD1dWcS+iHw1kkrS07YCbWD6UtctakR4QawYP/epH+B7Q9PWyNtWR9bNbair1E+4Eov0IecAa8wPyaNJITAXn45M8GEda/IxBO5CEW+ytiXP+4n2FN1DXfNXWBQUV4SD1kjUUpx5kh2aukxFakPglVTFwd8mxiitshtrX9XXgZ1j3IkgfHx3B3oFfQFg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 22:19:33.7313
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 188ab500-d486-4562-85de-08dedbaca857
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5171
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIyNSBTYWx0ZWRfXyuvkVupec8NE
 hzQ7a/5TTRpTpAP0mK0gbQMdnfXAnFUSXZar5fCfWi/+gcURiQFsvdsMkjbXosSlAVnMBGGrYGX
 4UhOeOcCYBk1w21pRGYm0CFqcjmUz4E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIyNSBTYWx0ZWRfX4WRbi2tzgVn4
 SXlAOGKKefkAlA1Xvh9MjX9HPHHnPbmR/mSHWh0Pk5vlrD8ykvAy7FEvKD6CslG6k9z2YDqsvys
 TPo7gpdTONzLtCh2biTWP/a7OuLjcXeF81DUFn9RUWUJYOa9f/xr/s2+QPUV2Wgqx2JSmjr0bmU
 b8jVm2+BcChGzuGHLra5UVInr2ZyjID1IFAmaW8NawXa3oMv7yaZ7E2fCY7vB2w2onvQPk1Gf7G
 KQbUE+Z+Nxj9UEZqbcNOe+z/mqK6Yh02d/BAZO0UqFlXl3w76HJIpC/b/F4X71DIjqSRVG9wsbB
 mOoLgFKk3koZm7fow1xFTrkKdLp+X0WwazhqwFxp5Lg0qWN+1gyUTPldygw3C8OuxnNXocyExJA
 6+YmOjmMIUj5/XEt5DrhuAmbnBHc3y8hLrlu3U/9Po8F5qiGUcGbwQwJydbEkbAhOFx4Szi9Xca
 sVoHOGWtTrqhNzu7j4A==
X-Authority-Analysis: v=2.4 cv=CJ0amxrD c=1 sm=1 tr=0 ts=6a4c29f9 cx=c_pps
 a=MYN/bj0IIkanzoD+9X5qzA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=oHynoUYWeUJpUzXKd3sA:9
X-Proofpoint-ORIG-GUID: o3VwJek29b_8WAkCMslgtpB2ut7_ySdJ
X-Proofpoint-GUID: o3VwJek29b_8WAkCMslgtpB2ut7_ySdJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060225
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 22:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240346

The recent changes to fixing KERNEL_DTBVENDORED support and then adding
the same mapping for FIT_CONF_DEFAULT_DTB exposed that we were missing
tests for these two cases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added selftest test cases.

 meta/lib/oeqa/selftest/cases/fitimage.py | 55 ++++++++++++++++++++++--
 1 file changed, 51 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index c5f2975223..9abe1d0c93 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -107,7 +107,7 @@ class FitImageTestCase(OESelftestTestCase):
     _MACHINE_SETTINGS = {
         "qemuarm": {
             "KERNEL_DEVICETREE": "arm/versatile-pb.dtb arm/versatile-ab.dtb",
-            "FIT_CONF_DEFAULT_DTB": "versatile-pb.dtb",
+            "FIT_CONF_DEFAULT_DTB": "arm/versatile-pb.dtb",
             "UBOOT_MACHINE": "am57xx_evm_defconfig",
             "UBOOT_DTB_BINARY": "u-boot.dtb",
             "UBOOT_ARCH": "arm",
@@ -117,7 +117,7 @@ class FitImageTestCase(OESelftestTestCase):
         },
         "qemuarm64": {
             "KERNEL_DEVICETREE": "arm/foundation-v8.dtb",
-            "FIT_CONF_DEFAULT_DTB": "foundation-v8.dtb",
+            "FIT_CONF_DEFAULT_DTB": "arm/foundation-v8.dtb",
             "UBOOT_MACHINE": "pine64_plus_defconfig",
             "UBOOT_DTB_BINARY": "u-boot.dtb",
             "UBOOT_ARCH": "arm64",
@@ -424,6 +424,16 @@ class FitImageTestCase(OESelftestTestCase):
                 pass
         return a_comment
 
+    @staticmethod
+    def _apply_dtbvendored(bb_vars,dtb):
+        """ This is (and should remain) the same logic that is in kernel-fit-image.bbclass
+        """
+        if bb_vars.get('KERNEL_DTBVENDORED') != "1":
+            mapped_name = os.path.basename(dtb)
+        else:
+            mapped_name = dtb.replace('/', '_')
+        return mapped_name
+
     @staticmethod
     def _get_dtb_files(bb_vars):
         """Return a list of devicetree names
@@ -436,7 +446,7 @@ class FitImageTestCase(OESelftestTestCase):
         all_dtbs = []
         dtb_symlinks = []
         if kernel_devicetree:
-            all_dtbs += [os.path.basename(dtb) for dtb in kernel_devicetree.split()]
+            all_dtbs += [FitImageTestCase._apply_dtbvendored(bb_vars, dtb) for dtb in kernel_devicetree.split()]
         # Support only the test recipe which provides 1 devicetree and 1 devicetree overlay
         pref_prov_dtb = bb_vars.get('PREFERRED_PROVIDER_virtual/dtb')
         if pref_prov_dtb == "test-dtbs-as-ext":
@@ -678,6 +688,7 @@ class KernelFitImageBase(FitImageTestCase):
             'INITRAMFS_IMAGE',
             'KERNEL_DEPLOYSUBDIR',
             'KERNEL_DEVICETREE',
+            'KERNEL_DTBVENDORED',
             'KERNEL_FIT_LINK_NAME',
             'MACHINE',
             'PREFERRED_PROVIDER_virtual/dtb',
@@ -918,7 +929,7 @@ class KernelFitImageBase(FitImageTestCase):
         fit_conf_default_dtb = bb_vars.get('FIT_CONF_DEFAULT_DTB')
         if fit_conf_default_dtb:
             fit_conf_prefix = bb_vars.get('FIT_CONF_PREFIX', "conf-")
-            its_field_check.append('default = "' + fit_conf_prefix + fit_conf_default_dtb + '";')
+            its_field_check.append('default = "' + fit_conf_prefix + self._apply_dtbvendored(bb_vars, fit_conf_default_dtb) + '";')
 
         # configuration nodes (one per DTB and also one per symlink)
         dtb_files, dtb_symlinks = FitImageTestCase._get_dtb_files(bb_vars)
@@ -1441,6 +1452,42 @@ FIT_HASH_ALG = "sha256"
         self._gen_atf_tee_dummy_images(bb_vars)
         self._test_fitimage(bb_vars)
 
+    def test_vendored_dtb_without_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created correctly with KERNEL_DTBVENDORED turned off.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree overlay
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+KERNEL_DTBVENDORED = "0"
+"""
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._config_add_kernel_classes(config)
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
+        self._test_fitimage(bb_vars)
+
+    def test_vendored_dtb_with_kernel_dtbvendored(self):
+        """
+        Summary:     Check if FIT image and Image Tree Source (its) are created correctly with KERNEL_DTBVENDORED turned on.
+        Expected:    1) its and FIT image are built successfully
+                     2) Dumping the FIT image indicates the devicetree overlay
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+KERNEL_DTBVENDORED = "1"
+"""
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["KERNEL_DEVICETREE", "UBOOT_MACHINE", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._config_add_kernel_classes(config)
+        config = self._config_add_uboot_env(config)
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._gen_atf_tee_dummy_images(bb_vars)
+        self._test_fitimage(bb_vars)
+
 class FitImagePyTests(KernelFitImageBase):
     """Test cases for the fitimage.py module without calling bitbake"""
 
-- 
2.43.0


