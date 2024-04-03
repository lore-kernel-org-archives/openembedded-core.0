Return-Path: <colin.mcallister@garmin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05100CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 18:36:59 +0000 (UTC)
Received: from mx0a-000eb902.pphosted.com (mx0a-000eb902.pphosted.com [205.220.165.212])
 by mx.groups.io with SMTP id smtpd.web11.19410.1712169414806597850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 11:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@garmin.com header.s=pps1 header.b=zLzZgIbC;
 dkim=pass header.i=@garmin.com header.s=selector2 header.b=Bl8igjEJ;
 spf=pass (domain: garmin.com, ip: 205.220.165.212, mailfrom: colin.mcallister@garmin.com)
Received: from pps.filterd (m0220294.ppops.net [127.0.0.1])
	by mx0a-000eb902.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433IAq37030840
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Apr 2024 13:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=pps1; bh=34teluoCIPAC
	7x2WrVj//d+ZDdnCe0p/yem/KLSykXc=; b=zLzZgIbCwnMIzDiriK3mEfwa1RoG
	JZZ8g7BGYOHMCNf6Mwrg24NmO6XFTMyxnw2a1+DhEXuMtW1VLF8COGe6D38uwaDP
	DJaLHWFLzsFBD41WK+yGitI/q1dPmGJfhma3U8Gv9Mw7Ay0FwBPpDX9tR/PywHWr
	4JJ9QAneTBKQmWDS7W85cgpRxEAD53KTmkR/4HGxMdIOkuxdUZSGDiKVF2Kxk4Zj
	2w50XR1nrf53D1nQz8ES9G97TBvd880pHOAVaP9hBtiVC/BtLfTYu/jYXNlYfBDf
	/sOjRrGmOPlipHDNCjMwizUHYsW7+Zf9/iaPXHZS2okRE+BDzYZ3wBetbQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-000eb902.pphosted.com (PPS) with ESMTPS id 3x8ww9tk7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 13:36:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hj8TEA70JdWjkNBsJaSVzeTlPEwhq4eBMOKZtt/2mfQr57+s9zGftFXKHs3bWfquT+yNWUDR/QT3Erv4L1IIyfri1Htl4LAk/+IrjunPS5q0HOxA0rPd5cKGyGFvrUPXAfb7YcFs/2AepwbRlwWfinG+moH0BOqpLPDcW0r+A1ijPGmH3sbvtgVyPD8pdgNIgrS9XzVbZSjq2PCqe9pxqaLo9MI36475+FxDWzGiqasWTUnVoM0EYlOEZ/7BKYMK18eXfkqhkEyt5Ac6G7Q8hQUDL4fTj17oAAsScJ+SaOpeHNwcPklrnzWPYfpSZpTa49X594w0cjxZo55VLixbHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34teluoCIPAC7x2WrVj//d+ZDdnCe0p/yem/KLSykXc=;
 b=N5CgObAZDtvDJ3tDYsR0X12/cF5Rn7l5LV+GPKZk2bEiinSPcm1Ou7G5cifsb8oK7/WWDTj95u6/0Ax5Sr0ZomJ1BOprE2IUrjqmpolnA6lR++/clq4GwZFLYA+PBfA+dUNzaYMkqpzcqRve5ztmTrIR0W/zIIEBcLEE02sKYOroMFvtSe93W2Vmi7i0XQ0zxVHYlixSR6UatBPq1o1IFr062kLOReTxPg1oca8i1AGKC3SX3jzmskv84b8+Z9X1Yr6/qIKeKbJ+DcdQvUICN2eCJYGSC6q5rQwH8pwa2+e5rxNaGXSzH86jffOZEEkCB+yEKPdSEs0nMf4QU059DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=garmin.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=garmin.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34teluoCIPAC7x2WrVj//d+ZDdnCe0p/yem/KLSykXc=;
 b=Bl8igjEJJjbmT7Mz4GkiNai10mdIOI93ZjPeB+PSdYyYHxA4GUb/bgo6D/JjOXZ5kk3msKcWEG1xr8je65Ny3L2dEXv0sr3EBAqLTVWPCSA23fSvL7U6XeIQpQR69Sdcg+UAuscF7+OAO9pZqlQ09RNBmRrqJ2bsTcqDk9rL7EFc8GP4ivUxTvHvSLf+swEttSn9qFMRoZh+5fPce8ngC/UcwuwArfB9NcbuY5XjRitLa1EjBaKLWmk9p7+ub/wjeykzt1ERy4rBsdbCWQ3ZcoGFYQvUgxJ5yZO5VvsmwzxTDIxLibbia936SFYtO8TdlCBoYcf9r1X7TLvtN36N5w==
Received: from BL0PR05CA0002.namprd05.prod.outlook.com (2603:10b6:208:91::12)
 by BL3PR04MB8154.namprd04.prod.outlook.com (2603:10b6:208:349::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 18:36:50 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::f0) by BL0PR05CA0002.outlook.office365.com
 (2603:10b6:208:91::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 18:36:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 204.77.163.244)
 smtp.mailfrom=garmin.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
 204.77.163.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=204.77.163.244; helo=edgetransport.garmin.com; pr=C
Received: from edgetransport.garmin.com (204.77.163.244) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 18:36:50 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
 olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 3 Apr 2024 13:36:43 -0500
Received: from kc3wpa-exmb7.ad.garmin.com (10.65.32.87) by
 olawpa-exmb1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Wed, 3 Apr 2024 13:36:49 -0500
Received: from kc3wpa-exmb4.ad.garmin.com (10.65.32.84) by
 kc3wpa-exmb7.ad.garmin.com (10.65.32.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.32; Wed, 3 Apr 2024 13:36:48 -0500
Received: from ola-jnrkg73.ad.garmin.com (10.5.209.17) by mail.garmin.com
 (10.65.32.84) with Microsoft SMTP Server id 15.2.1258.32 via Frontend
 Transport; Wed, 3 Apr 2024 13:36:48 -0500
From: Colin McAllister <colin.mcallister@garmin.com>
To: <openembedded-core@lists.openembedded.org>
CC: Colin McAllister <colin.mcallister@garmin.com>
Subject: [OE-core][dunfell][PATCH] licenses.conf: Add missing LGPLv2.0+ license
Date: Wed, 3 Apr 2024 13:36:46 -0500
Message-ID: <20240403183646.1467842-1-colin.mcallister@garmin.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|BL3PR04MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b5f758-6a61-4f84-b983-08dc540d0690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lsx3Qn+flt2IfhjEFq9B4ifzDODi/SRoSSrcxx0VlNu9+vB+3mJreOO7l6j/uY9OvsBjZafcHYW4g0VfEEMxEZhGIWHy4yRsFhYCt+ts58FeGGpqayR9VEP30sj0aZRLgmgExN3jIk8ClhRX2sDgpdNYs0vspGBh9BzJNG+gURYY9/ApEqxkomWwzG8xqD/gHS5cjyanwFxK7/StSMh5UcwO1Ar1KV0EOh0jkXJ9quYnC+SR8973OjFmcLwnantkUxtvwe4/Fsn0i0lrnNFNNBrheA9ysoIyEzQzoqqGpMdmCRfoOQwBxvo4/NJEdWCYbl5R9GxF/7sXYtWP5yGcn3juTD/4uVqyYXWRKao917TrK7WSCVM6gScuRbnRL053i4dFKI3qx9BYlyNY4dHTGgjvCng2SYFKhjsOWTIFkmdkjpAdRKiY8vRlo8MhlY6Cqf2vu0GuzCLoDj+OEov5//eVOy9LCTd8h+oJNdQsqc27JQOL/bz/AiN0CbdWYsEutUuBiBF8VkcEJ7DCzEH0KmB1xZWQbM2NSc4CVZ4UBTOSbFcQiBVP1PPwsENt358Z8fAvKmGHo2f0MEkYNpnzmw2pIIueo2A3268+XnDYw6LZebavW3LNdAYN5+iJPHAyVOZ99AQsOHXIKU/Jg1X2lkHC0b0rHQXDtDgU7JMqT//2ALXISw5nEHNWQ2b7B7KUpHF16OVGldvDEbZUTLcXLVssj3wOL8zfy1EITsDRG4rw2PumLCN2LAkYSNoxH4Hu
X-Forefront-Antispam-Report: 
	CIP:204.77.163.244;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:edgetransport.garmin.com;PTR:extedge.garmin.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 18:36:50.0286
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b5f758-6a61-4f84-b983-08dc540d0690
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;Ip=[204.77.163.244];Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8154
X-Proofpoint-ORIG-GUID: wJTHFkWle7U0UTT2ls7yMY0JhU_zDAtf
X-Proofpoint-GUID: wJTHFkWle7U0UTT2ls7yMY0JhU_zDAtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_20,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2404030124
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 18:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197939

Adds LGPLv2.0+ license variation to match LGPLv2+.

Signed-off-by: Colin McAllister <colin.mcallister@garmin.com>
---
This is a much smaller change that fixes the primary issue I've hit
with SPDX generation on Dunfell, where pango_1.46.7 uses "LGPLv2.0+"
for a license, which doesn't exist in the SPDXLICENSEMAP and causes
build errors when spdx generation is enabled.

If backporting all the license changes from master is too much, I
was hoping this smaller change would be considered acceptable.
Allowing this change to merge to Dunfell before dropping support
would be greatly appreciated. :)

 meta/conf/licenses.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index d14c365977..c78823e847 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -37,6 +37,7 @@ SPDXLICENSEMAP[GPL-3.0-only] = "GPL-3.0"
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2.0+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPL-2.0-only] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-- 
2.43.2


