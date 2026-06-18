Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F2CD98F2
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 19:00:41 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26930.1781809237420765356
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 12:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=YOTvi/vQ;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=MsGgc95x;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IHw4UT1372025;
	Thu, 18 Jun 2026 14:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=q+DSVSLGJh8xx
	z9zxNd79+IPuhhsPIKkbna5w79RDOY=; b=YOTvi/vQaLtc6gEPfuwJXctDp8K+6
	nD9reUsjJjlV0SmOG8r5F7NXQm5eOx3txLBpK9tIrUNv0ze6xy6IBZBCgJquEbPf
	5DaVYa5HpdL/0L+In3b9rIPBV6rbn4FzHDsHuRKIaTN6eiU2jlU8fOuR+v/G7ZBp
	BNAxgNeVC/BXkWQoj7E9upWBO6eVteomvCn3QnqQ9d5jgUXszqKz9uQlbV40hNlC
	EQ/MABUvQvZM5VlVcYxyFSHYvhMwCd5qlLILC3ViB/oHcRYayJ8YLG/1F8cyuzzF
	VA3biaKlCfufbNF2LguRHxvL1du4YRmhslqnba+JTsciJgOr6lEOR2CbA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4evfug2t7s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 18 Jun 2026 14:00:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KlVTkJqD5KKuvHA+Tl8pbQFFWlLBAi4RezavPzSQIyGoJe0n2wTlD5NGoD8dndzdq7lWuG14Cjhq6TZXNjVE5GMnqw/wFGQnH1yX4Q3MfiS8EZ04UrvqxFtVE3cERljah/Ao8lZFsjFqpbCMiYDdg3v1+OD/xGeFxnW9l0TKbgWUrE3SpzlUGH2q8LPjICFg0Ws/5Cxp7XcJWQzs1WcEjPbE8NxvLBl4UH77hhn0LcXCJjKkkeeFKTGNv2SB4NJsH9UL7SLCy6BCtpgx7iQrrwrN/dF9gAdHG8MWY+C/vvwZF4cXXFtjI9BLtUrg+p9mpcC9/Pw00k+nXktHAV/c/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+DSVSLGJh8xxz9zxNd79+IPuhhsPIKkbna5w79RDOY=;
 b=x4s5dmx/ecUVeAWwzQ+By0HGx59Qk+drUdCmquulrmkWJ1LzfU6RahPjdx2ovf4alL9veFjrNXM89GvoLMfPWD3p/H0Ik2PbZ0qU9kA60cjUQpNGKDlmmGCmeQwTTd7IwouE/a7FhJm1AKjzNEtq2EkuI7kZjdgUe03bIh+hiHwgmHHaK0qlMj7kQ1r9eJeUdBkDAtoQq5t+S/5w5qYnajxRQF1Vdqk7LQYzI5IQMEOKjMa5q1W0ZjCojvZ0sLDP2yU0u/LYDiQCj8kelWvYoNxk3OhqN1H3zE7QdISRyG+lgekCwArtTB16NCXuypS1OYjdqn0YSVMZhD4OJZYuPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+DSVSLGJh8xxz9zxNd79+IPuhhsPIKkbna5w79RDOY=;
 b=MsGgc95xZTKczg5Zb7ZhxbMP9k86cCQNM8dma3ORd+EaeOAs1HxC+leJfhPRQ0VjQbUoshEwwdSAYPv3/mAOmAuR+uAKEyCPqvrtLdmprl8U51TXlFrsKmaWad6aRHswGsjL7loanrpuwjiSLMgi7yFmqTh14GzrMepitfEo12U=
Received: from PH8P222CA0026.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::10)
 by CH0PR10MB5211.namprd10.prod.outlook.com (2603:10b6:610:df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 19:00:27 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::a0) by PH8P222CA0026.outlook.office365.com
 (2603:10b6:510:2d7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Thu,
 18 Jun 2026 19:00:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Thu, 18 Jun 2026 19:00:26 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 18 Jun
 2026 14:00:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 18 Jun
 2026 14:00:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 18 Jun 2026 14:00:22 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65IJ0MNw1053661;
	Thu, 18 Jun 2026 14:00:22 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
        <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: [oe-core][PATCHv3] xuser-account: convert to standard-user-account
Date: Thu, 18 Jun 2026 14:00:03 -0500
Message-ID: <20260618190003.3266810-1-rs@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|CH0PR10MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 26214b3d-1f8c-44cf-7da4-08decd6bdb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|6133799003|56012099006|18002099003|3023799007|20052099010;
X-Microsoft-Antispam-Message-Info: 
	2JonpyiqxtjMS/RFrXvN5wgNn3MSAvuD/Bty/2TqoB9l5o57kqnWncSRlnr+fEQxSABzenc452xOV0RKizz/1dkzHNDanZCCk84D0MmCRVB2agw9Rj2iF4/7JBZSX/iDrzRJr+mQlQthTUnV9l0Zjcq/bU4UkSJvuE0rxNvpJaR4ofbBR9MrQfiU4ZF705jCH29av6ClIvuvy58LU6MnCvEFJBLpvpBXXjx87N6VcKu4aF/7xFIXq1Rez9H1p6iiyVRLupkJaqZeX81KmkkjADYE3yOCAmBS01HWMcmNhEpR9716ha4GZkAGbNs1CFhFtSKw4J5RUTU/1MHf6jj+jlqpNlwkwIZvjYlE55StdtbFS6VUU5nuTY2IwbXKaPYaXJdP8y1rYF1w/OUfom2PPRXHwGwrMJ7w/gxUi8LbOtfwvQB3G7TKnKQYhvuEfC03RjrwPt6saDrLqRhR4h4Uyh82j8v+aNrfy97mO6cf9kPmYSxN7lGoiuxjVV+oYtjOEuGUbmilM8hYycwsLqljjrnR5FxLz+zPXjwBtIGuFWYXDrmG2ZP/cAJZqwGCyWnsPjtLVENfGrvELFaH8exoJ9C+rvGyBFusYjK5GVFefetcsE5vK3RqX4+ebRp782dvtrC+L+aK2KDlj7ufHHa+hQI9pWD0BMOYpvAIMKNBX5TGgXQbFfhabjDT+Eu1hp5p
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(6133799003)(56012099006)(18002099003)(3023799007)(20052099010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hY0xZmVqJKnt5f52JPmJgYLdgw+idiArjE6qmSbHywt2aTuNEC8K2kcXtraHpQNqsh/2a48QKLrKGxGRiLW9WIfD82ifrTlDdK8S9YL2qlHURK9fGfL3oqKe9NEggRKRZLbRSRinIg8uX6KfvglirVk0ga4/SxIvXYZFi/w0tp3LtszZeCHY2iMM2Mu6YGuJGC9tW1/bOZiehGYWE8jlUomf7mScCVLlcBiCdbdO4GC8DWuOhBZAvaWfqc0JfrqSGnP8uEabAs9TDDQKy4MxEvcluzzvKjt9qc29FPsnsCa3dooxkiUIlvqnwFQKIynYAOpWe92Zv+sjQSvNyd5jBSQMqoWfiNXlCCuKY+x++AIdqFHDfGQhvBmdqpOh96s2VSV25zvMwYBmZjm4Ltfqd7kkQ2PqDMUW+uVL4udD8tFfKOmRHoqccgvCjqOrLp43
X-Exchange-RoutingPolicyChecked: 
	YCoPTgwxZUiDsngxgFEDWakG0g7wtX0f6K/DRiAyk6GooGgf1BAscErnU5ISv17RqFCsLY8V/OzcAcVdM2m8NRna0KwmIoAdXTHSKGcgaVWuaaX26Sxt23ah5uZz2/x2HZkaKugr8/K44lLA4WHvcVtI3ohWKLd06FpKABguWizaoO0+Cnw+lL3VuIX5wY7Mp/jWyJjrP9XKvmtJzTIgC5bZ7YGRBqH0KV0eHw+gxqom+CoSJOfOYi01zNB2B9fs0odzXCe7ODJccSKDyoZC/Zy3q0Z+gKy7fu2RsjDuiWBczYSutfyOedrGKdzWDZKDa5SI2eBRVU7eY9cIqyueDw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 19:00:26.0003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26214b3d-1f8c-44cf-7da4-08decd6bdb84
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5211
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE3NiBTYWx0ZWRfX5fuk/8WwXepV
 0M5hdEuYnMGkgc967eBwo5dYxXhCVESQKNYCB3GdGKT44tcOPitRVfmhZWGZ1fkX0IbtUKRydYp
 7XgTeTOBxkinRHcb4jCTq5cetDoB/Pg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE3NiBTYWx0ZWRfX0jVdN2UyqhO1
 KDGVM9tsGqRobQZBoiX7r7L1KTM47KGwblcITU5flj7kISUFvaVi2p0Q7yhZ/Op17IM099V8fk2
 yr4A078uYb+hMdcTPYRDRoOTT++Spmtm4Ic1kbFNkMZmO2B3iWcWD+WkUyAc/OJIUu9uGTQwQ4L
 iiTA6q8aG/jKycmdrzXygKuEM02/Guo3sWxOnKfRv5Kx/D6ZQQQQ7su96oh/0tuFXOQBjBuB5Yv
 CePy8ho6EhD0GWuZwyD5DmoxFzqxjAAZDKjVI2MF2CwEA1cYAZWJpsGJ0N8toKFQ0ZXFSKIO1CP
 gezu8rcMjyfghj/SuoFw1qfQFutE+08fjZbo25iRaJe7C7vlwgkKhVjepoD3QCuOdYiCJTvMwgo
 8uFOZeeDco60njj6zI77ZoRHjwseZvTgOPqLj7wwitwbz23M0ftStSQeqi9skqX3UcHz+MQ+t7J
 Oobg9b0X7c2Up2wzAJw==
X-Proofpoint-ORIG-GUID: mjfPRQ6DreZgyb8bCgsJldZMIzO05Qgt
X-Proofpoint-GUID: mjfPRQ6DreZgyb8bCgsJldZMIzO05Qgt
X-Authority-Analysis: v=2.4 cv=FJQrAeos c=1 sm=1 tr=0 ts=6a34404d cx=c_pps
 a=J5CYyyHZZtesdUd/yj239g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=e5mUnYsNAAAA:8
 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=ag1SF4gXAAAA:8
 a=l2p9iwxLtlSgQCY6vywA:9 a=-vRB9dRCtfH_pLRD:21 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239098

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
v3:
	- Add STANDARD_USER_GROUPS_EXPECT to indicate what groups are
	  expected to be provided by other projects
	- Set user UID and GID as 1000 in the static tracking files
	- Update the weston test's user name
---
 meta-selftest/files/static-group              |  3 +-
 meta-selftest/files/static-passwd             |  3 +-
 meta/classes-recipe/standard-user.bbclass     | 26 ++++++++++
 .../distro/include/default-distrovars.inc     | 16 ++++++
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/documentation.conf                  |  5 ++
 meta/lib/oeqa/runtime/cases/weston.py         |  2 +-
 meta/recipes-graphics/wayland/weston-init.bb  | 12 ++---
 .../x11-common/xserver-nodm-init_3.0.bb       |  8 +--
 .../{system-xuser.conf => system-user.conf}   |  2 +-
 .../standard-user-account_0.1.bb              | 51 +++++++++++++++++++
 .../user-creation/xuser-account_0.1.bb        | 30 -----------
 scripts/sstate-sysroot-cruft.sh               |  6 +--
 13 files changed, 116 insertions(+), 50 deletions(-)
 create mode 100644 meta/classes-recipe/standard-user.bbclass
 rename meta/recipes-support/user-creation/files/{system-xuser.conf => system-user.conf} (90%)
 create mode 100644 meta/recipes-support/user-creation/standard-user-account_0.1.bb
 delete mode 100644 meta/recipes-support/user-creation/xuser-account_0.1.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a897..a59712680649 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -20,15 +20,14 @@ pulse:x:520:
 bind:x:521:
 builder:x:522:
 weston-launch:x:524:
-weston:x:525:
 wayland:x:526:
 render:x:527:
 sgx:x:528:
 ptest:x:529:
-xuser:x:530:
 seat:x:531:
 audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+user:x:1000:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c81532f..381fbeda4ed4 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -16,8 +16,7 @@ pulse:x:520:520::/:/bin/nologin
 bind:x:521:521::/:/bin/nologin
 builder:x:522:522::/:/bin/nologin
 _apt:x:523:523::/:/bin/nologin
-weston:x:525:525::/:/bin/nologin
 ptest:x:529:529::/:/bin/nologin
-xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+user:x:1000:1000::/:/bin/nologin
diff --git a/meta/classes-recipe/standard-user.bbclass b/meta/classes-recipe/standard-user.bbclass
new file mode 100644
index 000000000000..ff931b80920e
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
index 69c6db589b77..603ca1e84e8c 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -66,3 +66,19 @@ KERNEL_IMAGETYPES ??= "${KERNEL_IMAGETYPE}"
 # the variable to be empty.
 # Git example url: git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=master;branch=master
 CONNECTIVITY_CHECK_URIS ?= "https://www.yoctoproject.org/connectivity.html"
+
+# The STANDARD_USER_NAME is the default underprivileged user account name.
+# The STANDARD_USER_GROUPS is a space delimited list of user groups that account
+# should belong to, and STANDARD_USER_SYSTEM_GROUPS is the same but for system
+# groups. The STANDARD_USER_GROUPS_EXPECT is a space delimited list of groups we
+# should expect to already exist in the system. Any groups in the other two
+# variables that are not in STANDARD_USER_GROUPS_EXPECT will be created as part
+# of the standard-user-account recipe.
+#
+# Please take note that not all tooling currently supports changing these
+# variables. Scripts like sstate-sysroot-cruft.sh and reproducible builds expect
+# these values to be the defaults listed below.
+STANDARD_USER_NAME ??= "user"
+STANDARD_USER_GROUPS ??= ""
+STANDARD_USER_SYSTEM_GROUPS ??= "video render tty audio input shutdown disk wayland seat"
+STANDARD_USER_GROUPS_EXPECT ??= "video tty audio input shutdown disk"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 86048e791c28..76db73a4628d 100644
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
index 842cf31739de..88849ea516af 100644
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
@@ -388,6 +389,10 @@ SSTATE_MIRRORS[doc] = "Configures the OpenEmbedded build system to search other
 STAGING_KERNEL_DIR[doc] = "The directory with kernel headers that are required to build out-of-tree modules."
 STAMP[doc] = "Specifies the base path used to create recipe stamp files. The path to an actual stamp file is constructed by evaluating this string and then appending additional information."
 STAMPS_DIR[doc] = "Specifies the base directory in which the OpenEmbedded build system places stamps."
+STANDARD_USER_GROUPS[doc] = "Specifies the default underprivileged user's groups."
+STANDARD_USER_GROUPS_EXPECT[doc] = "Specifies the groups that do not need to be created."
+STANDARD_USER_NAME[doc] = "Specifies the default underprivileged user's account name."
+STANDARD_USER_SYSTEM_GROUPS[doc] = "Specifies the default underprivileged user's system groups."
 SUMMARY[doc] = "The short (80 characters or less) summary of the binary package for packaging systems such as opkg, rpm or dpkg. By default, SUMMARY is used to define the DESCRIPTION variable if DESCRIPTION is not set in the recipe."
 SYSLINUX_DEFAULT_CONSOLE[doc] = "Specifies the kernel boot default console."
 SYSLINUX_OPTS[doc] = "Lists additional options to add to the syslinux file."
diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/cases/weston.py
index b0dccee73bf4..6339fda97b0f 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -29,7 +29,7 @@ class WestonTest(OERuntimeTestCase):
         return output.split(" ")
 
     def get_weston_command(self, cmd):
-        return 'export XDG_RUNTIME_DIR=/run/user/`id -u weston`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
+        return 'export XDG_RUNTIME_DIR=/run/user/`id -u user`; export WAYLAND_DISPLAY=wayland-1; %s' % cmd
 
     def run_weston_init(self):
         if 'systemd' in self.tc.td['VIRTUAL-RUNTIME_init_manager']:
diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 29cfba083370..feecda7c8352 100644
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
index 169269eefb34..4b8f7ff7b2f8 100644
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
index d42e3d1f5080..7e94a1c938f9 100644
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
index 000000000000..7366ac867528
--- /dev/null
+++ b/meta/recipes-support/user-creation/standard-user-account_0.1.bb
@@ -0,0 +1,51 @@
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
+    expected_groups = sorted(set((d.getVar("STANDARD_USER_GROUPS_EXPECT") or "").split()))
+
+    if unique_groups or unique_system_groups:
+        joined_groups = ','.join(unique_groups + unique_system_groups)
+        d.setVar(f"USERADD_PARAM:{pn}", f"{common_args} --groups {joined_groups} {user}")
+
+        # make sure all the groups exist
+        groupadd_str = ""
+        for group in unique_groups:
+            if group in expected_groups:
+                continue
+            groupadd_str += f" {group} ;"
+        for group in unique_system_groups:
+            if group in expected_groups:
+                continue
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
index 04f506e7a39f..000000000000
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
index b2002badfbe7..5e1ae9c53503 100755
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


