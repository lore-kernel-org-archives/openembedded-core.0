Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29620C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 18:17:57 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.586.1784139469261051440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 11:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AvXM7/uX;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VVUSuol3;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66FHB6P1007632
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:17:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bKQtdbP+FqOC4
	LKNb3tle/eQnglE2/Cwky0PPtvMtBA=; b=AvXM7/uXD2IBwexFALoTM58/9eoKI
	4YBaSGPSGXevWQz+NhNVRSsaCXDiDN60KqNbY6nf2mSzkUbtmnP3TOK/1Rjg0JjZ
	6HRdhej2NFdJ/Xi5aGpXgf2MgkXC0USAJJgrRjCyFHHKqG5C7hAXlY3SD4Wk2zwv
	2tJFFbj+uyPV47b/S0o3HcEZFK6rPs97qiM/vlhh2RSHyoOAmc42oBe7Q3iIJHTo
	PKzXLVswmyvNNtqFcGmIkpkzp5M28O8Omg8QnCyuWmiYg+/tE/kHrurD96YSk4Vb
	dFI2MUrfkhBiav/zUCNUJgb9qzGUfT/79Lrk4dKuRy02zeNIku797UpWQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011033.outbound.protection.outlook.com [52.101.57.33])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fe05058wb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:17:48 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSphLk5MhkQJoMzfk+3vlHFWfxHuXH0RshE3Bmq1ZeFQUpAfYmPBiMF422pJmSySDuGrizZEdT3qj9tKRyFpNQWKROKruMrH9vBBP3es1uf0rgvATaSg1bQds3iyTQ3uZbY4dx/DE/aAioPK6bkixsWAqD39Hefcj4xZ7b32vQBTHBoooqVtivg8W1vHh8xHWxaYpGIXlQH6MttGxF5tu53WlEOqtqmHJr6lxGXCMOvTZfqCmP4W46eE5VgJoT7qjV32wVvAiyCrLkXGQYBozjNBV/QYjdll3U7gungM/ipt/ZlhY/mvU3FfN9jZSmEfPstG8ZrvYLzltVxS96Mg6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKQtdbP+FqOC4LKNb3tle/eQnglE2/Cwky0PPtvMtBA=;
 b=hvMXvonRJYvjsICKEbPYrMUrrg/th7BdIW0MmFrvZ5XeHt6OK64FZqZSMGoFJq/RxNG1b79mjbxV4dx2p5OyDho7hxe2GgtFbV2ZTRs3hBONDec2b9sR4HjT1lyrgguqAgk4hQyocjlkHELfxhEeidGtoCDGtEHhyzC/1C4GMihmpiTXPiwFcQ0uFoVJnSPcr8Ek/VhV47BfN39rRAbhyj8ynuRa/XULXbh/i/geBGcFSu46n8BMuypiY2MLzOX6q6lJPUnW+PvK8RxTKqW0k/BnkWjymtZncbuL52kjigLvrSvYY6D1Znf8z/sq6mwx99K0gYwz1CdQXF60CQNQng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKQtdbP+FqOC4LKNb3tle/eQnglE2/Cwky0PPtvMtBA=;
 b=VVUSuol3Pm+L+yAgjtruG7gaEMXzsvAFBJYyPTWBWdcdEprzch4nj6ek7XjRyERxGsenvGMFzfiJKKlpbzv1aQjsfVDgNm2taJ0CIZ+hWxv6DP/3lWa6a1RUybhecTSHWmI/wE2WmxxPtGvJJHXfQgWNcxInXN3kVEnqLIymJ7Y=
Received: from SA9PR10CA0028.namprd10.prod.outlook.com (2603:10b6:806:a7::33)
 by MN6PR10MB7492.namprd10.prod.outlook.com (2603:10b6:208:471::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 18:17:43 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::95) by SA9PR10CA0028.outlook.office365.com
 (2603:10b6:806:a7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 18:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Wed, 15 Jul 2026 18:17:42 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 13:17:25 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 15 Jul
 2026 13:17:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 15 Jul 2026 13:17:25 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66FIHPfv3075422
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:17:25 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wk4Af-00000003vbB-1C9L
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jul 2026 13:17:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] u-boot: Update git server and branch
Date: Wed, 15 Jul 2026 13:17:25 -0500
Message-ID: <20260715181725.936386-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|MN6PR10MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: b2388621-6814-4855-06f2-08dee29d5ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|23010399003|56012099006|18002099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	HL2RnMkPdJEEIKWeF8GrQvQSFNwQiQuRmIj+NclCwsz+YmlbGCbHiBo1U1i2KhR4GpzoKZIisJZnQ6be3tl0d3a+7BnoJmgKeeIAq5jlvcE4TEhe4gAQOlIjSUIf89xB9K5WrZMaGQQX/3Q+uDC7xHwIrerz51QoYMznaoma/t/tpIezWHMaUjMwxwaB1zrZdOYHS7h2zPrtF9+LkGVcr1v4+hEcTzhi91z1mFCYdgW2H2NFYFNYd9ALP8a+SQ4Uuiorioh01zMRmFchX+yLlRfZ08PKswFr6A//HG7nSW6y9xTl03oQ2r6AaMJuWOnaJDRt+hm5DBOWtOi25A9vKv7V9y1/Dt+L7khcrRzeSZ1BfPZjPhQ9Hht746qRHK6Gl6H6pjIek7zaP5/rOLWWl5MsDJZAlzKGumy7z9c9G2vb6EcUpONdrayWu/wGUp6KFteIt/hh26toU4RRP6O4U5kaZ7GdYV+E2HnVf1OEvX/gVIXyZH7lu4AAoMa+ygu6iYvxOyQtV4aG/BCU0T/EW8ZHUqXUbMvaFHpiNrSEvt2q3ElbHdAe/AGWa0f1+sq2glnp9ty0KEfmS4OaYw4eCs5HG9US7ScXqRVVhCbB1ePzfTVOzo1GZxcBnVJ8NHzEJSkheriumHoUhqFmGASoAw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(23010399003)(56012099006)(18002099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VKujzNL9cxwIkkCzRGBXEKjIsDjCXR/23ikOVrymHNT/2RqGUrncyCHHaCl4+xEs9txb67Q2JBBUmoigS+GmZeDieOQDx3BQfjJ2QM0rj5/ZX5J6PH2TW47CWrzGw/DorkkZNHnpDXgdoiTVDIeqTwV/e79jQk5s7mlXt7T65x8Y2w0Q4rHecKDPKkgvQU9+PNPtRPDfBYqWHa88kqoKWnx+jrj5JkKqSENxlGzj55l6nXDV/szn4TYapNmMPeBevXgSt8+jTkytCLEHZ70tXzCUDWyJAW0hD9qKDyw6uYW4kSI9ZvWyb+qGc3r1c5Pbmi74GekUIi4wQGL2dA9V0fHUbnDiXysb6bgvAar5gtxMCCbrR6wLlZuw3rXQN3QsP+m2v+264HEkqFNzlEc2D1icSGOxX3i4aZwsCtrCPB7QE1LyEKmd82LwZh8q4Ubd
X-Exchange-RoutingPolicyChecked: 
	OYtHjuQi+/FyfylySwYy4DWkzlha7vcr79oggQLPCtrI/TAJLkeiO245P1AL32POsJur7NW3XxXh7ZKovD2qcWDEh6RUEnf4rdF25outjcHYUsmgUD7Hk+icioaYDCg1TEfjNX8s1CfwuxB9LrMJ5m491wztC4A9bUSA9y87A84QCefzmW/RueGdIsYJkwMSeWmMKRNes9tD43dwPmulPkEBOrEVkB5Bq9jLiDdLGEkqVcBLDw02eEtpCV06fYNwnp4qkthwdOlyh5afSn4/N4UZSh6+r+QEBilQLZInlmO1ySzRpmfMYIryqB9d0V86QJkgQeJk1JwuvdpJWyeDdA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:17:42.8549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2388621-6814-4855-06f2-08dee29d5ce3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7492
X-Proofpoint-ORIG-GUID: j6Ou25Rus4XN3CqwlJ9siyK3drh5EtD3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE4MiBTYWx0ZWRfX9VZ2Oqg+eQ6T
 3Oe6FckujtI6wacNsyzPUzQY+uiTDpjK3iV7DcvAkYR9gzGWnZ4S+q3jn/0vTzpvbfO++DrCjHC
 SdrNHB0mzpdK8s0LtaXXYdD1LDIQsAY=
X-Authority-Analysis: v=2.4 cv=KfLidwYD c=1 sm=1 tr=0 ts=6a57cecc cx=c_pps
 a=G7eB82wliUXyOHlZhtkITg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=1VxDqnHFAAAA:8 a=sozttTNsAAAA:8 a=3rTs3wSnXqb80svz7OMA:9
 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE4MiBTYWx0ZWRfX3gXQqdNbkNkz
 3Mxtu/nDQABGN59NEJdbcWxkuy3QImx+NSF4Kezc30ySu3blEsb4RG75zHWY+AhYPnN+N6e36sE
 4v9EZQHaqCF0VJN4ThYOxcQI0O4IiSDnkN8AicznyLG7ZX2sCkb8EMxkJD5ARQY5Mm7j4wd4LsW
 iFMdbL+qpOTqgUom5F6Mp79hALka/cUQQFRrI9i2BIZwjeXfY1BP+dVQO74DuAJQUYj/gzUyDDU
 rVduPCuWkFzIDJFwQxRiXqK05o9M47OMN+vlCidQTp0W6V7d0uwkgw7Eqm9WgEAgxc0MU4ckKe5
 3AgQ8dm8Pgwg0uxuWw4K7DxooOApRUZo0MW6xLFBOSJE92NQEnJap/XlKESUgPZjCLYE/TdHMBs
 yOyJbvowma38kB4tP72j2UALISvLVgx30ds+nMSt2J+Sq6rUwpGLLR4m4fDLyj+Ov/FwW6r6Qdi
 B/Nk5X6WWG8uBPTpRqA==
X-Proofpoint-GUID: j6Ou25Rus4XN3CqwlJ9siyK3drh5EtD3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 18:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241033

The u-boot project has moved to a new official git repository server [1] for
all of their work and switch from master to main for the default branch.

[1] https://git.u-boot-project.org/u-boot/u-boot/-/commit/2a6ca4ad04e64488ac41c3683cacd44173a96d24

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 574768b9f8..55f33efc98 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,7 @@ PE = "1"
 # repo during parse
 SRCREV = "88dc2788777babfd6322fa655df549a019aa1e69"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
+SRC_URI = "git://git.u-boot-project.org/u-boot/u-boot.git;protocol=https;branch=main;tag=v${PV}"
 
 B = "${WORKDIR}/build"
 
-- 
2.43.0


