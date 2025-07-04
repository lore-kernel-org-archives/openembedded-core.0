Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 681E6C83F04
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 02:01:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3604.1751594497924924907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 19:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92802cd4bb=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5641HCEd007864
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 19:01:37 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4e86t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 19:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gg4fMPQiZEHEJFGy0UWqupTM0q2e3rW7TNP+m8ygsBKWC/TNeF3UsZwXOYPyQqId177n20QRMyvsPJL63GTUywXqBiAE8o4y27tsPwtou5/6rCteYP97ueMMeMUYvptCYTay7Yp9PvNTLRfiYtBkqtX0ElTDyPuuCM5BZcvzqjP93EwOeTIji3FrO1dtu9ZQXfGdDLzt09NE8ycq3Gixv6u6C/F9OJACekD3cbOmrkAsrZyla2SiFGxZF0ZPrAo2uo/zPbyz2+YLClWsJiBwdNqzm9MO8tbnLKs4BqAkWs9456fcZw791xlKd4dbr0jvmkhoiPZIwy0Fc5vKn2s/1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h0syzPTtTNggbaS2c0GEhxCOpF9s9boRraP5+Cf8ZW4=;
 b=rBo6PGCGzkOiNpsomHb4JahYxJ/di+n1Rh6OyweYNnfI9F8o9ybWRVmEd3+9D+Ebpldsk1Nsojzrntdoef9RI5zTydu6KaN9dgl6la8Re7A9E8L8f+g7z3cdacuiN+3D+YUnMxs+NotC5KtbDpeMar2HtJDHHzaLfTFj66BULMmD7DEXtTbW0CCEPx5F1kU0tt4mC0ODHt6VmMzcZ8g9rENSHuXtmQh75AtUEamEYzaOx0EQvO1d60c69ZxtQln+vsnPsXmvUUAJbFOBqeZ6ccMWVeQvZ8RSCQqBczyvqyqHBzZrElYbosBWwh5c4DKi5jbnOOKSJtdI3u+IcuNjJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by DM3PPFF3F4DC26A.namprd11.prod.outlook.com (2603:10b6:f:fc00::f62) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 4 Jul
 2025 02:01:35 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%6]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 02:01:34 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap][PATCH] minicom/wayland: correct the SRC_URIs
Date: Fri,  4 Jul 2025 10:00:27 +0800
Message-Id: <20250704020027.78732-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0189.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::13) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|DM3PPFF3F4DC26A:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f045523-c8f8-42c6-84a9-08ddba9eb3d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ugslZW2dYkZClqHe5NR7q1CvEI7ihXKU5FdWfCz0h3tX2C2zYHI1Y/cE27/5?=
 =?us-ascii?Q?nVYMffBZ6UyDNGURr4xo9A4kL9oZVmrei3NWBn6dHoEcH1dbVAVYSfc9KXxK?=
 =?us-ascii?Q?tazvjHq52Lklst5IoO8zifwSqXwJsXqM1t1mTkIu7j1sYsvbBrTs1/hCp4M2?=
 =?us-ascii?Q?haWy7/rDaIyhJBGApLFoZL5PZLF0Sqsp69akW0uVv6IyclFQckwCLWnq5VB4?=
 =?us-ascii?Q?OWjkWlk/7nvauM0OILAT1J7sn725W7lH7UCGBeeLMkYEEBuBIfysTaLNhCW+?=
 =?us-ascii?Q?mMQA1GYrCM15wamFJbZZFVpS76X68TBerRFxZ3fp2QjQMmxZFTzIwsFG+NP7?=
 =?us-ascii?Q?kZYq8QZM0ApS+opBOP+4J2OL4hTo35O2xr5iaNMsrmoqkkS5eCTsZwfvfU//?=
 =?us-ascii?Q?SdKxjYTAb7e0P8y8HAXE4VSC9/5uA+jlga1P45o//GpsuYzeflV9/n+7UX2A?=
 =?us-ascii?Q?AAwgT/GZo+TQzEIZ2C+hCW8vqmuHQJdGn7t+efdI0JpFAyDO/cov9T+8dcKJ?=
 =?us-ascii?Q?PojCbYjTjF8AMiN3cja5bWlUkeKvdrupMf8T9vHwgZDS/5zN53ujImDyYf/z?=
 =?us-ascii?Q?5oYUcWIw56VRnC3WWzB27sTBO8ddVEbYqGu47PFRbolnGJgGsZeZ49JMeD5t?=
 =?us-ascii?Q?nPML30ntmowkOpk6EmPLbm2TyvUAOJMBmV7ZAwRuZN2pbW2EreeVy7D4dF/x?=
 =?us-ascii?Q?oJWx4IxTVGOmWCCiSYKK/YmXxWHoVYKIe2VfQtpZKZ+Gm4Ytz6BigTgQTPf8?=
 =?us-ascii?Q?Ae7mKFM75mep9cIli61910lNPQfh6+M7bFyTH/V9Eq9JnvhYK+UDsp+JxCph?=
 =?us-ascii?Q?X8JZvDexWgLcBiWt/Dmuz6Vl4xjIazneoHCuc08i3vmN+fbOxMR/fqoZA4c7?=
 =?us-ascii?Q?DlFyIowqueBfYon/hMV+ddElHY9klWIOWsPcovRMHj0Kiy6teVJ9nBta/GrK?=
 =?us-ascii?Q?4DTCMcY7x+kzisU5mJrllPDHmQ+4WwGFzWoE79a7RGoBhRTj7EWWmY6meAXN?=
 =?us-ascii?Q?gySW5XoQ+2SlunH7PFOWV9Z8bLL3XpUcGHJxVBF/srI4IE7oYfdbG1jZK7sp?=
 =?us-ascii?Q?WJz7LcapSqdM9ZCUOKjnxIBsnazBh6CtwxU3+n9TtPcM0y6Q6YOYvWnwny2E?=
 =?us-ascii?Q?OaD15nPIiL6itHSi0vKm42GDxlb4Z9cuypDKZm+Cc5UwVCbTSEH58hZqETV2?=
 =?us-ascii?Q?tNzWp1eEUxcOCa96SmhEvhNCTuGE5FsHCfZtKkxb44tJl+OLW5jpL72c5abO?=
 =?us-ascii?Q?IoHn9l8tuRXVmM7PmXVuTk6WyyqltDgSLxXH0b3AVPWPWyK3+W5oHoUWRnsa?=
 =?us-ascii?Q?T9+a4mG42LHDYIP0rpcSslL/wAW3FqqHUWElYwfDk/KcO6Ca4Db8pSjKm1bl?=
 =?us-ascii?Q?HAfeWf5pmR1PT16ilOLiMzVJLcpoeRjDr2MB5frKtXxSMrUqfg9jG3do9zNg?=
 =?us-ascii?Q?b0o6ySQ7H+4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Uik3yjKgFakXSoTLR0gu/mqKC5jScna4wURab/ZO+2dFCTyNs+XUVP7Bprm2?=
 =?us-ascii?Q?Gp4oqwtdviqIkMa0ntZNuTxnAG/n55fm0QOSwXXC0DYlF7y5vx/6b+pBTUZ7?=
 =?us-ascii?Q?vxAk3Y6V6KPVEQzIYN8wvIXqF0PJzwtiO0NrJu/e04tnTWU8DajJDVjtPX5X?=
 =?us-ascii?Q?OvmTVBcQSZtEIgnpcV12fPBPLvRndnw3pd6/hx45z8q2+3kR2TKe5hd2LlS6?=
 =?us-ascii?Q?hGOQp0RuugHwnOpmmyL0MJbRWDmQ5z3qTmrz2pjEMequmLCe+C6IVbwAuLEc?=
 =?us-ascii?Q?92xAqyW7KRS2H8s74iLDlaufrv36QTQ13LM34Yjx//cbPdAHhwsVzy6wV7mX?=
 =?us-ascii?Q?p1EkCLAVNqd2Mdz1/mq0wGrj1J5UlzkLm7zPYZFPO7kMSdPBJMo1xl4kswOt?=
 =?us-ascii?Q?wFkCZWPCcdE1Q1lMSkqN1IW2c17n8G4PEx+XPJtnnz/hOxnRuuUaXKqB1vFs?=
 =?us-ascii?Q?n7cp6oXYqMKRXzdvu5YYvUfYkNDTnSGmsoG6TpWnM0UDhg/xPXUjCb1/R9zk?=
 =?us-ascii?Q?78rJQ4ySz+EUH7u3P1ssFcLdUgkAVxWFKdugpbvSVCpqkypyInb/VzuYugSW?=
 =?us-ascii?Q?ay3srrB90669JtiGuvdAXZoVC/FFRvjRMwbHWCVK9QaSr7ZNAAqD92aWAc2N?=
 =?us-ascii?Q?R9j/SFBySePt9nkUmTmyBnwHREfOykyd76/IcRyIuPfN4ULsnW4ht7tYXgYb?=
 =?us-ascii?Q?oYkiaRnclD7ej/STTEsRlwa/dpyu5d3MFjmMHC4uR6K1+TM0kGVlWItUXTt3?=
 =?us-ascii?Q?6N5WmS+1Vo07VkyeYKFXxgyeZwJBtvK81MVZbLH/6075e7dzxStJLhzMLit+?=
 =?us-ascii?Q?yctmrgu+8rMLEJYAE7i1BjojFYG2WZyvIYydecXdZN8ORB+JSJmjmIKLgFjR?=
 =?us-ascii?Q?crlXBHScww5N1DduUq/j58T8FQqthK4N4q3LJDdjNjXvXiOeS5CEe5nw0fl1?=
 =?us-ascii?Q?d/Kea+poYX14WhM+fW6k3pmDVpyE09XsB0fodww7YfgoaYvXXcoveZr/Szby?=
 =?us-ascii?Q?KLvmUDm4t4u8dNZ4rmD6t6jKTcoUX3W6KF23TjJNnWHvd+cQvdh9YUbCowRk?=
 =?us-ascii?Q?j3WgSmy0DX0qomk7tNWb4On7d5296kqSBJThYLBQMiJvcfLRfz1kARio7c+4?=
 =?us-ascii?Q?tJBIVQ9SfFV1ocrvf8lrDGRgN1F8cG+NvkuUGwfSQuXN2erg64xr4YvvOJ6M?=
 =?us-ascii?Q?nH9CJEE1HzHMBODXLvAALzyhQR41v04FtXMSuOZjyjH5SPROFCJtmVxfwPEn?=
 =?us-ascii?Q?eEjE9LFRNSJ7GKjBxyebBnSp+giv2kyyKxoAORyMp18xfONw7f4QCtlNeDC6?=
 =?us-ascii?Q?sC1nCuEKhU6vxdX09U9uAlZClJ7IKY5FajQ4DOYF7Dr3PIJC0JKutGUDVJbE?=
 =?us-ascii?Q?dQaQLbCZPOtyxal7v4PXgh2u8FzUCxfPghGKU+MU5FzqaNr4kKRxJZ+GUr2M?=
 =?us-ascii?Q?RK00VYSlHjFSqoe1gUEe0eL30pj10UPNGlAkMtz6Jey6WAx2OsqqHy1uzY4v?=
 =?us-ascii?Q?iGUnMwFz+yDSdTbYVz6cF2qQPdNrvOryLc0zagw4yHFOqYzczmzJhOgbhG7l?=
 =?us-ascii?Q?xllkj6R5VBM1rfj8ASBD78gUJzJhzDePxqFmD6YwzPq4CDKE9VpIFsooJaN0?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f045523-c8f8-42c6-84a9-08ddba9eb3d8
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:01:34.3171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Hle9J4ZnJKJqxZQ2XCNfJV4b2yrZcG1muUYZLhAaWc5aZaho58pRv+HtFEa1mx/UV2NeAt8BuY9LiCgeENP5H2fAPUKQuBJnO4TKpct5jU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF3F4DC26A
X-Proofpoint-GUID: 2u1ckh7rtpL5P9PODtrE93Y9rZzb08oS
X-Proofpoint-ORIG-GUID: 2u1ckh7rtpL5P9PODtrE93Y9rZzb08oS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDAxNCBTYWx0ZWRfX45B7TFavqN4n UpwLQKhaSGufdWKk9w6zDyZEOlK4+xVaaZdMUiPJQ7JQJhM7hHTY1LQOocIlNmBJmxvztk4YPAD 33gxVKinDcvS6a0tNC+D1py4J9xfbsoBP3167FwONnAnnLoYzuVX84qjry+bmHeb65UpuzKegd0
 d9IBkN+jY2wtSf9C0ivq1Pe3TKxC59t/BUqr9wYvxLEROGZdfWvlyX8lB3sOO8j0FywLxXAas2+ QfjNo/yRqDGXSmr+XkfCLNybcSnldGjz+2A3yZsonaCFNKGwfI2PX2RJUITfnbymp5AOys5IWrS c11MhwN0/4DVAaWkQ073HsGNZjbyHNi3qksDlOlFUhF9pjkzRlL3bboNjJ9DkoRb43tg5w2YA4G
 jGgf3SiPqqRMVZn78xfZZYyeTfm6zZZ23NeD82uqeKaRpF6TIMmto1S68cLTSb6NUrbc85qh
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68673601 cx=c_pps a=9V7jihFXCHj8+gr6vrtDPw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=W-FYJsbHGlDWnRhnMFoA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507040014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 02:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219895

From: Guocai He <guocai.he.cn@windriver.com>

For minicom, the old SRC_URI is not available and need update.
For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-extended/minicom/minicom_2.9.bb            | 2 +-
 meta/recipes-graphics/wayland/wayland-protocols_1.33.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.22.0.bb         | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
index 907d5c79c9..38f517f2a2 100644
--- a/meta/recipes-extended/minicom/minicom_2.9.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
+SRC_URI = "https://salsa.debian.org/minicom-team/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
index 074ea3663a..2300ae46d1 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "94f0c50b090d6e61a03f62048467b19abbe851be4e11ae7b36f65f8b98c3963a"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "622754e38cf70e9e02700e2df22cbd1257e523e0cc22004f1ece409719823da5"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 878c7a267e..4ff113f1e9 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 
diff --git a/meta/recipes-graphics/wayland/wayland_1.22.0.bb b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
index 6aa76063ea..e940065624 100644
--- a/meta/recipes-graphics/wayland/wayland_1.22.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.22.0.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            file://0002-Consider-pkgconfig-sysroot-for-pkgdatadir.patch \
            "
-SRC_URI[sha256sum] = "1540af1ea698a471c2d8e9d288332c7e0fd360c8f1d12936ebb7e7cbc2425842"
+SRC_URI[sha256sum] = "1a681f14071d12c6263a7f7ac44e64ea85f2d39d177e69d0354d82860532e6b0"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "wayland-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


