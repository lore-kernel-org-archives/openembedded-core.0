Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F98CD98E4
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 18:26:47 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4637.1781634401429222462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 11:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=H9lsZ2cY;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=LFz7C2MX;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: rs@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65GIPHCU3786545;
	Tue, 16 Jun 2026 13:26:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=bAlmfuRrRg7dh
	I7fkD3sW+tNc1XxJswGII5M7vMi0A0=; b=H9lsZ2cYJ4bt/DWS5VIq2kCXBk0k5
	01o1ySV5cvShv/fBVnDGznVfAVZ0t8B4uCZLt6wrtwT/e/FMM0ll+WV2ACdH1fFB
	6ms5zTRAJc/Hb/acG18bm5UDul1PvRc+BsGEnIGJHRqvSm4EJH+t4kiSETRcltDy
	zEJOLBmZ2mPKmLQMiuO+WKrRXxCeDNtK13ZlGS3+uMGxTUeITew9DxEzVe7zVJbP
	rG1NpPx9GMJzfw7xzL374R4EslYbjr5426d6IyvcOAV3v7A1UvnWaqhr6yjHCRdg
	+gRkuMEwYDbeZs7/bXoF5H0tkizOQQwXZwO5jOludDndqpwgrQFQN73Ig==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
	by m0380145.ppops.net (PPS) with ESMTPS id 4eu5u3tqyg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 13:26:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GtrL30diFcCIuL6/WHRlb1RHeTOndiTIAdxf2Tiu2rb2dtTsE3V3IuBVdlAPRPSNMNZQomhCr99s3+cQwV9PbOuiYmvHJFxDzfgN+/5ThLZwsLXyGzDZaGUGOzILzPzi0qBFqUJQvhDLOtl+8t6xhr5gX1xane7W6t79fCbSwaNm8vctY8ZRzjxVCgv0bG9OTJv1yvTOwxb2e9aedfOOjw1FWgEma/O/Dg0Bai76CuhZmMCvn7GAc3VHm2lfrc4RhJ2DofMPt5GtGw1vWi8n1r/sfj6WDgbXheAwU9nH/Z6Dnovmrguk4cpnBwmA0qECyjCoXsiAhG8kKWZ5W6au7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAlmfuRrRg7dhI7fkD3sW+tNc1XxJswGII5M7vMi0A0=;
 b=li/HlRk25e4jZ8AUaix9q+Vrf/A5crrFyR37Lcm4MJ5wtOjM1DLfKhbZKKGgESZTBeLhnSzBI05hmk8K+tGkcrdgpkr+ftbIluod3R4PfdSH9/AdpwANYbjiQAjl/U+zQUdaKWT7GyL1CDL+aLvcUKidqdB3zYX8iXF2VIgzYfXdoyxEB0aUENxwq9p1196bw8zMYmlQDBZQNHx2i5FK6JiAoS18f5O/+9qfIzSrUa6vILR9UL8jFvGQPqu4bJoMLNWG6MoWPtDXhlEtGkeU0mNq9T76jviHXsSmK/7gXA3H85boTOC6DBF86jZ0Mc+BuzgJV+ciKG7GVAr3sotK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAlmfuRrRg7dhI7fkD3sW+tNc1XxJswGII5M7vMi0A0=;
 b=LFz7C2MXX9oslY1G4nDaeMWf/ELykhoqPjslCMdXz6+FaEyfbLEkzDF4RvJvQzC0iOyqSoMguh+EnxUW+sgQmd40JIGal/YGpVQPs/n2pmh7vD8MYEy3xiVkmXgAkvtAOG0Lj1xEUPgn4/J/09HoppWo22cZ1roKPz0wMgd1Dho=
Received: from SJ0PR05CA0120.namprd05.prod.outlook.com (2603:10b6:a03:334::35)
 by CY8PR10MB6515.namprd10.prod.outlook.com (2603:10b6:930:5d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 18:26:04 +0000
Received: from SJ1PEPF000023D3.namprd21.prod.outlook.com
 (2603:10b6:a03:334:cafe::46) by SJ0PR05CA0120.outlook.office365.com
 (2603:10b6:a03:334::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Tue,
 16 Jun 2026 18:26:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D3.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Tue, 16 Jun 2026 18:26:02 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 13:26:01 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 16 Jun
 2026 13:26:01 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 16 Jun 2026 13:26:01 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65GIQ1Ub020968;
	Tue, 16 Jun 2026 13:26:01 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
        <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv2] xuser-account: convert to standard-user-account
Date: Tue, 16 Jun 2026 13:25:53 -0500
Message-ID: <20260616182553.3046153-1-rs@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D3:EE_|CY8PR10MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: c55d2f5d-5cce-4b0f-6aaf-08decbd4b887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|20052099010|13003099007|18002099003|6133799003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ULA/1x8xgGPcIbaGfFitPY54eHGOdeA9H2DWkf8ajtNIPYl2oR2JHMaPnKI/9z4Y4wf1QmEyQMaywab2bhS1zZfcPR/iklA8/LWXhVtos/mLCMToFeMaQF0g1N/YPkXHtB4Ef+5Mrzp2vIVh2kJnBmh77Zpnbl33OGBqVl43sSxqwGitc1dnfx0ohlO2KgFAyBgE/YatyVKmOlZS64gxotDvP2lWeqg18xOhfck/dq0myAJQrNRbSr4K1zaKU2IZickRLgiXLSQUkHVCMlJndTOBvES1FcBrUvv3Khm5eUCDLYSya8Y68P0QVBb4jxmu+Puvj9XyVnmxBi+O47iM2jye+Zh4Hsl6NZgstQdYlwfpANBNdxe2P7WEjytK9TrcfXKEdi5i7JA+JUP64L0wyaJxJbCr2+OhEbgPmxg9Q5LnMCi0dsHU5LrIEjGq1WZJhCDnbW5CDi4RBSA3YR86Vk5GEhPeSvgWy+hsM6MsxY2yjflrUkLYIuLQktHzdhPWs3a7k3Mb3rF/bHW6pqjCnTdKl2xw2XAg0ZBlC2Jz2rFZmlVrF6BzMZbuOKluDAdM6lVvSd/UojR3AiPxGUknW/4YJ+5nx9vCG5EH25eYjvZ63ToJXJZKp0PYF3UEd562jHLS97EbxaKu87MMgN5B6WW2L6hvEEBsxNobzSM6aZro0vwfqCcKuyfOMGMVT9Cp
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(20052099010)(13003099007)(18002099003)(6133799003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Xy+mTpcImN6MTTQ89h5zQssz1fMaxd1ihTTsgJM8SgYD+p8ueARVgw5XZ0DUbmELkjhSsaw878P6/eP8eTkBoDrHTwj4sRu9cwR5bMOXskIvlYC71ZYO7M/3eY/AZw3zhYHFqX37XjGJJsiU02muUUlAZ03Nt0FANAZlMLGkFgGPg2JVervVlJxyLCnSg0+vK2qOVD27B5cwUBoHCE/LkOzbYvkbJfpY83BIFJmyM0wu5tV71cPw5YKFrOPausmm85spQfKkrCzU9etZJbzzdkAmWwP3SZZfQ1GeK1HSn0KTMJEILOyHxHcqU3d/QnuGP0bgMQJl85NGsf4sLWjF6yGQeAiPlL/GXYSNC1/3q1ap6A062NmRLdbhDLa3hMri7mZIWWU/XHHalCkER8GjZDtcD8K4yBt6Bnuk5hwudlrOig3s9pVoDWTHfstbWx/w
X-Exchange-RoutingPolicyChecked: 
	LjW3+A0cd0L3JU/hYAesXrJoazus5HKSbcjSoYchge6TtYR8DUIL0rvFg9GkRiza58mh6b5qjXckqkylgi02Q/+nuacN+RQhFoL3u8DLhj6XM+8OME50tsk0nRdR4Y9nsIy0lxdzvkfP5KINbUA3qNbK4B41vQbbCB3SDi5UpBJkTFVFZAAacZdumOLLJLHM5yZ+NaX8INoOr/OEMfigTcF4QSbq9epBU+mA413UYLZqeRRy8NIJJV36yydHNNDQoRIzFdwGZg3Jk9cdy7gQw7ZQX9La9/agtniD1uu0427iNNaRZA19DSOw/Gzgwj5W7PWxH+Wq42pdO8ba4WrgKA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 18:26:02.0852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c55d2f5d-5cce-4b0f-6aaf-08decbd4b887
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6515
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE4OCBTYWx0ZWRfX/ZbK84BTOH/Y
 5DWzj0LtrXi+vVT0uLR/cfcyPcCPvUqiLKuAvH1jxhQiPKpbnhEjJdjdhqr1HrBsyi/zKSn65Vx
 dFwhS2JlTA2SLkjNjim5MRVBI6ATVZ0Nr0bu42BRJ9Wrp+OgAJLIARQcREAyv8/wSzjmG2EbVOy
 ebIIjlZNmyFWXzlbM4o5pwpftMaNEmB0AD1cF3R0YF1dYbFokIGA77T4gurO2ItISleXZ/rq+xb
 8i7vRwxS+LnDihtOsKRmtXq189ib++Bv+PXepRS4pdmUi3bFH3+lbo65rjfnyWngg1VtE9krK2T
 ru9EBQTvHUq/LPaMy+Y8/lIx9Jz8gIqn/u2vRgtYzLmixCNXM23IPSbiRPgPkJMpr5b3fHWROy4
 lgJ9baLsf6MjhPg2TgYFUN5rgMSx0qrpvrp6Xz2AMUeOlTb8T2ViThyX4wz7ILyZDmCSzbOrs/i
 nDSW5dyzAzjB3ee5erA==
X-Proofpoint-GUID: 4bxUwHDZ-O7eejUWfltfkoy6ZfhgOtdS
X-Proofpoint-ORIG-GUID: 4bxUwHDZ-O7eejUWfltfkoy6ZfhgOtdS
X-Authority-Analysis: v=2.4 cv=ObWoyBTY c=1 sm=1 tr=0 ts=6a319544 cx=c_pps
 a=DYOzx0NG23oKzpQZkEOi/Q==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=e5mUnYsNAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8 a=elOnJ-Ta_YVN36Tj1KAA:9
 a=LcK1uM26-OYnV89J:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE4OCBTYWx0ZWRfX5z4dsx+lQWcP
 ySI8OURCcCr7ZnkANbCAm6nvwL2Gnk8V0Vtf5dq1/MEtc8608AhizuprV+i1mHzvYZWTCRZWlFH
 Nf3+tZvp46dPRbw9JQgmt9KOjUcsI5w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 18:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238924

From: Randolph Sapp <rs@ti.com>

Change this single xuser account template into a generic
standard-user-account that uses distro level variables for
configuration.

This allows for seamless configuration of multiple out-of-box scripts
and tests across layers without having to implicitly hope that the
username or groups haven't been changed by a bbappend or recipe
override.

This also adds a class and a variable to allow recipes to assert that
the user is in requested groups.

This was proposed specifically to remove some issues highlighted in:
https://lists.openembedded.org/g/openembedded-core/message/230665

Signed-off-by: Randolph Sapp <rs@ti.com>
---
v2:
	- Add seat to the default STANDARD_USER_SYSTEM_GROUPS var
---
 meta-selftest/files/static-group              |  3 +-
 meta-selftest/files/static-passwd             |  3 +-
 meta/classes-recipe/standard-user.bbclass     | 26 +++++++++++
 .../distro/include/default-distrovars.inc     | 12 +++++
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/documentation.conf                  |  4 ++
 meta/recipes-graphics/wayland/weston-init.bb  | 12 ++---
 .../x11-common/xserver-nodm-init_3.0.bb       |  8 ++--
 .../{system-xuser.conf => system-user.conf}   |  2 +-
 .../standard-user-account_0.1.bb              | 46 +++++++++++++++++++
 .../user-creation/xuser-account_0.1.bb        | 30 ------------
 scripts/sstate-sysroot-cruft.sh               |  6 +--
 12 files changed, 105 insertions(+), 49 deletions(-)
 create mode 100644 meta/classes-recipe/standard-user.bbclass
 rename meta/recipes-support/user-creation/files/{system-xuser.conf => system-user.conf} (90%)
 create mode 100644 meta/recipes-support/user-creation/standard-user-account_0.1.bb
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a8..9ef91bbdca 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -20,12 +20,11 @@ pulse:x:520:
 bind:x:521:
 builder:x:522:
 weston-launch:x:524:
-weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
-xuser:x:530:
+user:x:530:
 seat:x:531:
 audio:x:532:
 empower:x:533:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c8153..cddf095ff2 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -16,8 +16,7 @@ pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
-weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
-xuser:x:530:530::/:/bin/nologin
+user:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
diff --git a/meta/classes-recipe/standard-user.bbclass b/meta/classes-recipe/standard-user.bbclass
new file mode 100644
index 0000000000..ff931b8092
--- /dev/null
+++ b/meta/classes-recipe/standard-user.bbclass
@@ -0,0 +1,26 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+STANDARD_USER_PACKAGES ?= "${PN}"
+REQUIRED_STANDARD_USER_GROUPS ?= ""
+
+python __anonymous() {
+    d.appendVar("DEPENDS", " standard-user-account")
+
+    for pkg in d.getVar('STANDARD_USER_PACKAGES').split():
+        d.appendVar("RDEPENDS:" + pkg, " standard-user-account")
+
+    active_groups = set(d.getVar('STANDARD_USER_GROUPS').split())
+    active_groups.update(d.getVar('STANDARD_USER_SYSTEM_GROUPS').split())
+    required_groups = set(d.getVar('REQUIRED_STANDARD_USER_GROUPS').split())
+
+    if not required_groups.issubset(active_groups):
+        raise bb.parse.SkipRecipe(
+            "one of '%s' needs to be in STANDARD_USER_GROUPS or "
+            "STANDARD_USER_SYSTEM_GROUPS"
+            % ' '.join(required_groups)
+        )
+}
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 69c6db589b..50feb066b6 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -66,3 +66,15 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
+
+# The STANDARD_USER_NAME is the default underprivileged user account name.
+# The STANDARD_USER_GROUPS is a space delimited list of user groups that account
+# should belong to, and STANDARD_USER_SYSTEM_GROUPS is the same but for system
+# groups.
+#
+# Please take note that not all tooling currently supports changing these
+# variables. Scripts like sstate-sysroot-cruft.sh and reproducible builds expect
+# these values to be the defaults listed below.
+STANDARD_USER_NAME ??= "user"
+STANDARD_USER_GROUPS ??= ""
+STANDARD_USER_SYSTEM_GROUPS ??= "video render tty audio input shutdown disk wayland seat"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c..76db73a462 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -815,6 +815,7 @@ RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER:pn-standard-user-account = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-startup-notification = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-stress-ng = "Unassigned <unassigned@yoctoproject.org>"
@@ -941,7 +942,6 @@ RECIPE_MAINTAINER:pn-xserver-xf86-config = "Unassigned <unassigned@yoctoproject.
 RECIPE_MAINTAINER:pn-xserver-xorg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xset = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xtrans = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-xuser-account = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xvinfo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwayland = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xwininfo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 842cf31739..8701e001d6 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -346,6 +346,7 @@ RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) th
 REQUIRED_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in COMBINED_FEATURES."
 REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in DISTRO_FEATURES."
 REQUIRED_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in MACHINE_FEATURES."
+REQUIRED_STANDARD_USER_GROUPS[doc] = "When a recipe inherits the standard-user class, all items in this variable must be included in STANDARD_USER_GROUPS or STANDARD_USER_SYSTEM_GROUPS."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
 ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
@@ -388,6 +389,9 @@ SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
+STANDARD_USER_GROUPS[doc] = "Specifies the default underprivileged user's groups."
+STANDARD_USER_NAME[doc] = "Specifies the default underprivileged user's account name."
+STANDARD_USER_SYSTEM_GROUPS[doc] = "Specifies the default underprivileged user's system groups."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
 SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 29cfba0833..feecda7c83 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -26,8 +26,8 @@ PACKAGECONFIG[use-pixman] = ",,"
 
 DEFAULTBACKEND ??= ""
 DEFAULTBACKEND:qemuall ?= "drm"
-WESTON_USER ??= "weston"
-WESTON_USER_HOME ??= "/home/${WESTON_USER}"
+WESTON_USER = "${STANDARD_USER_NAME}"
+WESTON_USER_HOME = "/home/${WESTON_USER}"
 
 do_install() {
 	# Install weston-start script
@@ -83,14 +83,14 @@ do_install() {
 
 INHIBIT_UPDATERCD_BBCLASS = "${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', '1', '', d)}"
 
-inherit update-rc.d systemd useradd
-
-USERADD_PACKAGES = "${PN}"
+inherit update-rc.d systemd standard-user
 
 # rdepends on weston which depends on virtual/egl
 #
 require ${THISDIR}/required-distro-features.inc
 
+REQUIRED_STANDARD_USER_GROUPS = "video input render seat wayland"
+
 RDEPENDS:${PN} = "weston kbd ${@bb.utils.contains('PACKAGECONFIG', 'xwayland', 'weston-xwayland', '', d)}"
 
 INITSCRIPT_NAME = "weston"
@@ -109,5 +109,3 @@ FILES:${PN} += "\
 CONFFILES:${PN} += "${sysconfdir}/xdg/weston/weston.ini ${sysconfdir}/default/weston"
 
 SYSTEMD_SERVICE:${PN} = "weston.service weston.socket"
-USERADD_PARAM:${PN} = "--home ${WESTON_USER_HOME} --shell /bin/sh --user-group -G video,input,render,seat,wayland ${WESTON_USER}"
-GROUPADD_PARAM:${PN} = "-r wayland; -r render; -r seat"
diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
index 169269eefb..4b8f7ff7b2 100644
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
@@ -18,7 +18,9 @@ S = "${UNPACKDIR}"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 inherit update-rc.d systemd features_check
+inherit_defer ${@oe.utils.conditional('ROOTLESS_X', '1', 'standard-user', '', d)}
 
+REQUIRED_STANDARD_USER_GROUPS = "video tty audio input shutdown disk"
 REQUIRED_DISTRO_FEATURES = "x11 ${@oe.utils.conditional('ROOTLESS_X', '1', 'pam', '', d)}"
 
 PACKAGECONFIG ??= "blank"
@@ -38,8 +40,8 @@ do_install() {
     BLANK_ARGS="${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-s 0 -dpms', d)}"
     NO_CURSOR_ARG="${@bb.utils.contains('PACKAGECONFIG', 'nocursor', '-nocursor', '', d)}"
     if [ "${ROOTLESS_X}" = "1" ] ; then
-        XUSER_HOME="/home/xuser"
-        XUSER="xuser"
+        XUSER_HOME="/home/${STANDARD_USER_NAME}"
+        XUSER="${STANDARD_USER_NAME}"
         install -D capability.conf ${D}${sysconfdir}/security/capability.conf
         sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capability.conf
     else
@@ -62,7 +64,7 @@ do_install() {
     fi
 }
 
-RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'xuser-account libcap libcap-bin', '', d)}"
+RDEPENDS:${PN} = "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'libcap libcap-bin', '', d)}"
 
 INITSCRIPT_NAME = "xserver-nodm"
 INITSCRIPT_PARAMS = "start 9 5 . stop 20 0 1 2 3 6 ."
diff --git a/meta/recipes-support/user-creation/files/system-xuser.conf b/meta/recipes-support/user-creation/files/system-user.conf
similarity index 90%
rename from meta/recipes-support/user-creation/files/system-xuser.conf
rename to meta/recipes-support/user-creation/files/system-user.conf
index d42e3d1f50..7e94a1c938 100644
--- a/meta/recipes-support/user-creation/files/system-xuser.conf
+++ b/meta/recipes-support/user-creation/files/system-user.conf
@@ -1,7 +1,7 @@
 <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
 <busconfig>
-    <policy user="xuser">
+    <policy user="@STANDARD_USER_NAME@">
         <allow send_destination="net.connman"/>
         <allow send_destination="net.connman.vpn"/>
         <allow send_destination="org.ofono"/>
diff --git a/meta/recipes-support/user-creation/standard-user-account_0.1.bb b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
new file mode 100644
index 0000000000..558f1c70da
--- /dev/null
+++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "Creates a standard user account"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://system-user.conf"
+
+inherit allarch useradd
+
+S = "${UNPACKDIR}"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+COMMON_ARGS = "--create-home --user-group"
+
+python __anonymous() {
+    common_args = d.getVar("COMMON_ARGS") or ""
+    user = d.getVar("STANDARD_USER_NAME") or ""
+    pn = d.getVar("PN") or ""
+
+    unique_groups = sorted(set((d.getVar("STANDARD_USER_GROUPS") or "").split()))
+    unique_system_groups = sorted(set((d.getVar("STANDARD_USER_SYSTEM_GROUPS") or "").split()))
+
+    if unique_groups or unique_system_groups:
+        joined_groups = ','.join(unique_groups + unique_system_groups)
+        d.setVar(f"USERADD_PARAM:{pn}", f"{common_args} --groups {joined_groups} {user}")
+
+        # make sure all the groups exist
+        groupadd_str = ""
+        for group in unique_groups:
+            groupadd_str += f" {group} ;"
+        for group in unique_system_groups:
+            groupadd_str += f" --system {group} ;"
+        d.setVar(f"GROUPADD_PARAM:{pn}", f"{groupadd_str}")
+}
+
+# default case, and a requirement to satisfy the parser check
+USERADD_PACKAGES = "${PN}"
+USERADD_PARAM:${PN} = "${COMMON_ARGS} ${STANDARD_USER_NAME}"
+
+do_install () {
+	install -D -m 0644 ${UNPACKDIR}/system-user.conf ${D}${datadir}/dbus-1/system.d/system-user.conf
+	sed -i -e 's|@STANDARD_USER_NAME@|${STANDARD_USER_NAME}|g' ${D}${datadir}/dbus-1/system.d/system-user.conf
+}
+
+FILES:${PN} = "${datadir}/dbus-1/system.d/system-user.conf"
diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/meta/recipes-support/user-creation/xuser-account_0.1.bb
deleted file mode 100644
index 04f506e7a3..0000000000
--- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Creates an 'xuser' account used for running X11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://system-xuser.conf"
-
-inherit allarch useradd
-
-S = "${UNPACKDIR}"
-
-do_configure() {
-    :
-}
-
-do_compile() {
-    :
-}
-
-do_install() {
-    install -D -m 0644 ${UNPACKDIR}/system-xuser.conf ${D}${sysconfdir}/dbus-1/system.d/system-xuser.conf
-}
-
-FILES:${PN} = "${sysconfdir}/dbus-1/system.d/system-xuser.conf"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--create-home \
-                       --groups video,tty,audio,input,shutdown,disk \
-                       --user-group xuser"
-
-ALLOW_EMPTY:${PN} = "1"
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index b2002badfb..5e1ae9c535 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -127,9 +127,9 @@ WHITELIST="${WHITELIST} \
 # generated by useradd.bbclass
 WHITELIST="${WHITELIST} \
   [^/]*/home \
-  [^/]*/home/xuser \
-  [^/]*/home/xuser/.bashrc \
-  [^/]*/home/xuser/.profile \
+  [^/]*/home/user \
+  [^/]*/home/user/.bashrc \
+  [^/]*/home/user/.profile \
   [^/]*/home/builder \
   [^/]*/home/builder/.bashrc \
   [^/]*/home/builder/.profile \
-- 
2.54.0


