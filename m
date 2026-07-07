Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169CDC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:58:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.175018.1783432722456577509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TOyvPmh1;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=T3shtzrv;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 667C5vV62715178
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=BVwCMRjTOyNIw
	096MxPnktxE7hF9ijbacXbEZ2iyH18=; b=TOyvPmh1jlmLOzQ2Jx1A/flu5pBuc
	MqBzq+xFYQNEtJNYmn4K3fkJlpj8ykrH+2keXy66Zzp6HqzqbxqXfGLCqfQ7kKT6
	36/qCHbJIR75ffBK2ilIU1iwRF0YMgEkDETPGNRmlOpqsLvwLBbPFkdvTBFjsMJI
	2XeEa90uQxWf0A+vAykdDwdoVSrBgN6lS+b7kytQBewoXTJiA78L3YLeX9y/D2vL
	JrIM1ZWWkWTQb2H8sgMQNII9XBxNNZJ2X/tpbF3uduXMdSmp2zNfk13BX87am+wo
	H7EVQfpRzNNqriHlmPMSZ2rHSk8i+ldO6ACqR7P38m41vj0gGZYNqCaqg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013008.outbound.protection.outlook.com [40.93.196.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f90cn0uuw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 08:58:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDR4ItolxYfrTQm85aKZZYWaFPQTbRmvfdcy7jwUfDGF0A5Zywwmif2eP/6l96DhIUvQtqqTXNIGHo+F5gZXxmuKf2NA7oixTEMyFjzObOW4aK87D/wX+2KE63zYW2TsbF5x+Ylt27W5h/MnzKWCt4ekzak0vP9IlHrHbzl1H4Rlbye4Xt8l5b38kctdSjyrnCNnEwB/kG9Dm2xKjHq0ryauyOx5HX6a5qpl6bSkSpJvdm+aywQCtR05RfHClvDjQ3fSz6KkM5xQBiSMKF+I7nmsBs6XHLlYohcRMP61oKNtLwjmYg8FD995kc5cIta2/Di9DYn1wBXJo7lvFjdJAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVwCMRjTOyNIw096MxPnktxE7hF9ijbacXbEZ2iyH18=;
 b=dCXcC6LpMnSKGyXFobJYvb5G7W10BVxHbTe338r+jdhVHWP62mJK5djWmI4pA/rEK2YtwqOUVcop2AX/Wt98R+o2UJVg1naveD4gBYam+/ZELvxPJz9Jo6+6mXOX6o3MH4/g+WaFP1MSvzGlrcgf8KIXNT25rx94bvfWHE8O0ciIYPxbJvEmDGlSrHsUpjG9sCDmp++kM3YVkUUL81n4GucXUZsj+1BNXxPeQBoDBqakZtBJkpssqJwupmst3I47AxSUiGcLDa6dBLB5v/whgsqtu31a5uybO4Exm4sCCMFTwBEV0dT3SISrkFbgzRpOoRJh3rHvPc3/Ganbooku3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVwCMRjTOyNIw096MxPnktxE7hF9ijbacXbEZ2iyH18=;
 b=T3shtzrv+KtRXKx80+N0GFGcBEkRGLLG3tkqv0ifDTcebU3xB75LT0HOqN/qLy/0HDXKIZE/+fLuF0jC3ULr/dPuQxjPnF0gI/R+TpQhaGM0HoPPnk0sPO5jEJvPQQmr1Mo+AgDALyz642ZlE77zP1+eIA7cjTCh1Ue4H0tiLVo=
Received: from SJ0PR03CA0332.namprd03.prod.outlook.com (2603:10b6:a03:39c::7)
 by BL3PR10MB6212.namprd10.prod.outlook.com (2603:10b6:208:38c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 13:58:40 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::55) by SJ0PR03CA0332.outlook.office365.com
 (2603:10b6:a03:39c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.9 via Frontend Transport; Tue, 7
 Jul 2026 13:58:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 13:58:39 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 08:58:30 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 7 Jul
 2026 08:58:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 7 Jul 2026 08:58:30 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 667DwU7a378513
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Jul 2026 08:58:30 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wh6Ji-0000000H4oV-180d
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jul 2026 08:58:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][wrynose][PATCH] create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
Date: Tue, 7 Jul 2026 08:58:30 -0500
Message-ID: <20260707135830.4070072-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|BL3PR10MB6212:EE_
X-MS-Office365-Filtering-Correlation-Id: b119a90d-fe1a-4aae-4daa-08dedc2fd8f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|18002099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	YhxtpRiJSdbsrBjusbhWPL2wOqOs7VqF+Lgr4TKnGniuFt3zTFiA0s7x72IcIUXZJObARy4OElYPanXfQt/Emc3eEuzoskfg/w9hbMXPsQDr3JVqS1esOH8nHOxOljSalTBBKmfCOlpuK578kFH59KkI4+E2w9MwEK/SkbMx6P9QqsVnjVqsTgWrO/GZBdFj4PBzTNVHI8oAwkKd7kk1bcfopaTJed8KyxUbg2Kfcw1f4y7Zg13SLedlth8t5QDhM6c/wX7pvRtfjEBpQkU+86/1rtLRmYNttipLPKdy32HX2orU3jGGVMUulFrKl4k3E8PQNladsRasD8GOzH9EIP/rM1lfbvmPb0E1GKmkfkQHA2Xdz0HMyWL9BNbh1FtcrYzqoxNa6RSDSnzQY0IbTXohSnwmaI4TdUEEQSN6bqmZ0yW+i4FIqnZPXdCMBTynVp/Q6ROS/5Ekyxv1/Pw52jID3F4bUCCaPs7r2ld2mayGglEbzONRuAuRXUKu1P6Uy1cjIRZCREu2RAI2Nf2kQZQkXbXrdbBhaygi9p0CjSiUrnm3/n3iFX2il9+U3fDK4hsKqvzjuXYRGCWXEt0+qy/5oVVOBpiizRcVyC6MceraBrfLXE+qeciu115vG7Q5RXD4t3LZOb+kwuKAnA0fubQ9m0wxCxfEWWbNhCY/hwOED/bZwtBrQRFonh6HWxumxE343e8vW0RmFo9JVumCAg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WokmGq8pFFCf84EtjhD9az6+B/y98a3UDXPM+uyD36203w4sBgFVfV9tTJAlg58tQujgdJADDZeKghpwNx16ag4RNDwegw47ZwyGSg9ClSpvoEd7Vhe+4OhZdC5RtXaWqtplHPnQCq1Mqiceu2ugGqDUOSMGvaloAnhnoqoJ+OQn1WALgJ2TFA3Mkkzi+wFyft5JCRN469AdCDkdBT4fchrfVLsC+sTanGLSdXAKisxOe83KVpvtA2eOPXoe0jwhJwGsdcp0354V/lCEJ8Uy7+M7FPyTjvlOgxP10SLu7IZKZC9PuxlVirmS05cxY5K5zRrh7ziAQXS+Clq5CYRI/OwAkS+zd1FnPq4fwMMXdpnTlgsxO0HOdjSi2JSvwZROB44/xyhW5rL8i8DbHEWkaMJQgv7GZ+trs4Jtb1I1MGU/LvYr7fe9+LbhfQhpin8u
X-Exchange-RoutingPolicyChecked: 
	s4nMoZQj2qOlPe84DHQGUTGPF//ENf37B2Hv+2+EvCtIAU3bP1ZOiqBFAy73izB2FakbwyKLubu7KSOlp18OWsI0tvWG+des0hEkk6AXMsRZpXNAo7ezoVKwGkXTQiACcgEw9TxR5NirZtiy/np77Me/BeW+EBi+Ln6ZLxZg61wWp16zwxWGtZrnRerIGoInQ8TcVKgx43PTfD7jAq9xNJdTqlcBqgql3oleLWLIZK5L70tKVVYvvvgey1AFvRwA3VOQuydcWyKpwp4eD023affcB9h2HarB+O3GEYwE7rzzquvYMMhDGh8Nskg/oHfcTGVva8wVOHyhje84ul6B3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:58:39.3442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b119a90d-fe1a-4aae-4daa-08dedc2fd8f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6212
X-Proofpoint-GUID: y1p2L2jX9vJxnxXBXN2co5zYBkXcVFVh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX2fNyMOOByXKa
 kJ2zboZ7E0ODRiMGyJgCbCqYvkO3bvUmd3Z5OHu0RQRxArPhEI9aOcF0oVupDd0+PyNIPiLvv2R
 CMN6VvSHpRvBI8/LbVdguF1GCnjGIl8U5FRo+0NgJTMFjIA+1xW0Mnaaam6Cx1YBork2My1hgwn
 vCJ+vZlGXbGFi03CHOGcyB1c25Fkrdj+nedTsp1QeelvUqa0iJ0LhO8FPu06QPsA+4q7f5Kwnhb
 hc1zRAdN7UFXWNjtRG/kbzFYQ+4EitHkJVv33rzQI31rC9qAD5ilfGbjG0ky3E4cSs/Tledsq4Y
 YwADC2z0pW/2LJog1khRS+nG8mOm2q/I/9bnNsO4uACpy6tWE/p1ezydZY01xsJ7un6wetO1S1R
 ru2vD5CU6Hikc8ZGiu1m01F7PfSNbHrxbSbMDVq+VHQ+2RwDEnErPUCeim3VLvMmqeIq8Bu+TGS
 pKg1zEMWQJsxIjle4tg==
X-Authority-Analysis: v=2.4 cv=R5gz39RX c=1 sm=1 tr=0 ts=6a4d0611 cx=c_pps
 a=espmfoAAVKQgPoIy+vmhGg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=9c6j8fwxAAAA:8 a=pGLkceISAAAA:8
 a=vf7SG5N8NuNL5DM9dqQA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=orddK7cku93UzC8moJry:22
X-Proofpoint-ORIG-GUID: y1p2L2jX9vJxnxXBXN2co5zYBkXcVFVh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzNiBTYWx0ZWRfX72g4WoyAYbge
 WKn3LqpABoUQUWsRW9M7rqLER2NgWxh3ce/vXU6WHlIchFN39qudjOxGJ8ccviwA9UEAOLCC9Wj
 hJVxfToiSp2IPz31WpM0/nAaXuadnWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 13:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240389

From: "Eric Meyers via lists.openembedded.org" <eric.meyers15310=gmail.com@lists.openembedded.org>

The override was "task-create-image-sbom" but BitBake derives it as
"task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
SBOM in sstate, letting a stale spdx.json be restored via setscene. A
later do_sbom_cve_check would compute the current IMAGE_NAME and fail with
"No such file or directory" on the missing timestamped SBOM. Correct the
key so the image SBOM is always regenerated, never restored from sstate.

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
Cc: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 meta/classes-recipe/nospdx.bbclass                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 15a91e90e2..cf79ef5b01 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
 }
 addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
-SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
+SSTATE_SKIP_CREATION:task-create-image-sbom-spdx = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
 do_create_image_sbom_spdx[sstate-outputdirs] = "${DEPLOY_DIR_IMAGE}"
 do_create_image_sbom_spdx[stamp-extra-info] = "${MACHINE_ARCH}"
diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nospdx.bbclass
index 7c99fcd1ec..aec73ca54c 100644
--- a/meta/classes-recipe/nospdx.bbclass
+++ b/meta/classes-recipe/nospdx.bbclass
@@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
 deltask do_create_package_spdx
 deltask do_create_rootfs_spdx
 deltask do_create_image_spdx
-deltask do_create_image_sbom
+deltask do_create_image_sbom_spdx
-- 
2.43.0


