Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5921AC54ED1
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 00:04:35 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.89])
 by mx.groups.io with SMTP id smtpd.web10.36279.1747954437342826621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 15:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@infinera.com header.s=selector2 header.b=Eoy2l/Nn;
 spf=pass (domain: infinera.com, ip: 40.107.94.89, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wIOfL/a8itV1PFH+aS+FzCYKPWF9dstgRh+Wzg8nTygJ9CL8u9JdYRLvtu93TTUqW9GXgDl6CZnY7vWaTJdaBHS4XIUTAB7e56t7PeU9JrUUNFVtyi8nNMRJG38MLwvQXfDgE/E67I9l/Vzb2AMR5KXcDl9i9gOVxj3lQG+QFd8sPn5LFAoSEk8/VT5CCi9EW6rgm+DUj8J0qI7uRllh4XiyHvXg7DTJH0jPcaRiXibpV2dVPm9IK5N6ZPp9H6R7LZvALLbQ45tLRWW1wsrET2TF5rQKeOVZV76G4QuPzz/Xok8TgXagfufSZUizruS4qdN4qg/nYVdkQxomHa+X6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDUnknvQc55GFjuWd/uJzzW77tt7JiEQ6LclRYGQqVo=;
 b=duod1nD+qky4tmCG9WfxKfzDYGtlkwxyuPDqtKHyYQDi+Hi0K030hyk3Tu1X/c4qKyVWM8Sbcae6mBsb1iVBixgkFkCIYFUMNVgQ5BxLiK2yIuDWS8ZVHCv+e69LpOQk8bt9PQxJfTToD0IXYYxLsJwcIpvg1ZycPJbNiKEN5W0DLxfc77Fd8bXqA5XRlQ0o4X9JHW4aAO5i7nwgdHsekcZ7xQzQqMv78YB/QalaZJc9bfpnFo4vK/0dORj7Un7bznttzFgUsRBY6TjPROCctPz/37tpYpKcEhUzpN9XiimBbL4o9/g2Xsn1UvG5Bit4ESYx87+JFN23TB5ZXi6ztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.30) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=infinera.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDUnknvQc55GFjuWd/uJzzW77tt7JiEQ6LclRYGQqVo=;
 b=Eoy2l/Nn4unhf/r5dAB5ZF+oGMTQmH3J7rj1NbDf74tOF9T8ZCGLy5ejuKezpPhmsrvNas6oKU/bVQOWiisz3PfRgEpvBq/8nA8HuL4WwuKdPuVYFKnYyXsGCpjNJ1+orASwsdFGhbklkhG6BiOOo+fSfvarEBjPmtilnSp1Ii6Qo6cb0gF3Oa8C2VbpFRkscnP/f4y4qeJnkvNigNuQy0EysdkGaKZqmelLOmy+fBbP6i1DILXY+DQNyq7aMPLMTDHcKICcf2NtDAySP9Q44M53O2OZUZGIOVvYBlUz8KbGeqO0Gv1r5P0pR5UbJPYo2dPcqFSog9B8Haws4mkLbA==
Received: from BL1PR13CA0412.namprd13.prod.outlook.com (2603:10b6:208:2c2::27)
 by CY5PR10MB5939.namprd10.prod.outlook.com (2603:10b6:930:e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.36; Thu, 22 May
 2025 22:53:52 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::30) by BL1PR13CA0412.outlook.office365.com
 (2603:10b6:208:2c2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.13 via Frontend Transport; Thu,
 22 May 2025 22:53:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.30)
 smtp.mailfrom=infinera.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.30 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.4.225.30; helo=owa.infinera.com; pr=C
Received: from owa.infinera.com (8.4.225.30) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 22:53:52 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 May 2025 15:53:51 -0700
Received: from sv-smtp-pd1.infinera.com (10.100.98.81) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 22 May 2025 15:53:51 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by sv-smtp-pd1.infinera.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 22 May 2025 15:53:51 -0700
Received: from se-jocke-lx.infinera.com (se-jocke-lx.infinera.com [10.210.73.25])
	by se-metroit-prd1.infinera.com (Postfix) with ESMTP id DD890F40429
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 00:53:50 +0200 (CEST)
Received: by se-jocke-lx.infinera.com (Postfix, from userid 1001)
	id D73DF60018BF; Fri, 23 May 2025 00:53:50 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: <openembedded-core@lists.openembedded.org>
CC: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Subject: [PATCH] busybox: rm faulty .config arg to merge_config.sh
Date: Fri, 23 May 2025 00:53:42 +0200
Message-ID: <20250522225348.2412108-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-OriginalArrivalTime: 22 May 2025 22:53:51.0888 (UTC) FILETIME=[6334E900:01DBCB6C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|CY5PR10MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd64750-d040-414e-80b3-08dd9983861f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?e/putpegDBMRmLFOUQg5jb8ihROnfabOLF7WAK+QtlAEZhoYRhbvWTSj0mqK?=
 =?us-ascii?Q?ZAsMIzDhiR+1J16MYmeMOOZfiiTazG8hoFG/EuA4pi1FqNbRa4TC4GM/mbkf?=
 =?us-ascii?Q?OfOy8dTenMG7qNXlXUosGB5Yh6ckvSOC8T1PvHQ/v339rOTO8j9ncb3ohHe7?=
 =?us-ascii?Q?WdLtyiTslAKtnGggz+VXUvptv6Uftgh8ByMFn73AlA34eiMOkeonO/bowqJc?=
 =?us-ascii?Q?P2DJ6nCJe7/yHk+7Ty7GkZrt1CQH/+ecYkIhN9onsIlFxqbtYycAwHtMruXr?=
 =?us-ascii?Q?mstkLAfOC8lU4Zo6w1E9KFUcpF4N32GczGz2Dfqf8p8vfnC5i/HiP+kDr1Qa?=
 =?us-ascii?Q?zbb0VDX8XMzEPSp1wMl4zKwA//kCsxy++W7jhGIC63o8imnD0C5qUXAUZLxP?=
 =?us-ascii?Q?3ZbXfwaMgg9MW/KYVIAm0tOuy2XIKKkrVji9SZkYUC5UUTCZSLJXl6Oi3jH/?=
 =?us-ascii?Q?RBL3l1lFxsZt70E9DdrzlOVPjAW+1MPPaVj3cjoynKJSLVrCKeQzMkYOGB1+?=
 =?us-ascii?Q?gctYgiXA+jLyZEyHIWPJ+3zarivYSw1jjwO3PL9DRBK1dnRbUi7Yd5pYSlV2?=
 =?us-ascii?Q?27AzTfoNWndP5QEzOwtfFgSqgJvRChWDIId9vf2MufU6e/5C6fXoyGS14Efa?=
 =?us-ascii?Q?4fO72TGwFqGdyfLTFy3LbCFrg3pV0gPgiZBIoZmN74e3I9yCcaAYkl6h+uRq?=
 =?us-ascii?Q?R/120JY37Y/YLqvEoakVfY1zZ7ex3ASbE9e2DSxjv0sf08WBKUAau8i0nxd3?=
 =?us-ascii?Q?24UgOM+p0PnDYBQleL/+94cqL6tq3XhPyVSLkBrrY7o776IoF3ueHPtJ8QNn?=
 =?us-ascii?Q?OZkCRUoYmQTcpXKPHAE/hEkjx3buiX+iuL3Xz6brVKmXxuqS5qAbRjWTadJj?=
 =?us-ascii?Q?+Pbc5Y1ocR05Uy00fMymrSB7tr6baw9PA34zmIO0zHS8vSlMhelZ6ASfl7NI?=
 =?us-ascii?Q?yy+jxehAVy9rwC80W9++rdLldjQJj3NgEEB73j+g3+CA/y0E8tbzupLjTwoI?=
 =?us-ascii?Q?B/dZ4dcP3FRf/5zteMfkatSndREJ+pLVQqZtGBeuvQakpSxJEFzBylCMA64I?=
 =?us-ascii?Q?dBmSGmwoDc7LOIgCHZrI0Q/fIesQNsI8eYt9YS0lq98yo0CusR1RCVS1Wdvp?=
 =?us-ascii?Q?rk0f37jgp+nrLhYJhIXADZiAZcLT8BVZPQxhCxQBQ2ayALa6GMB+JIRqiUN0?=
 =?us-ascii?Q?wg84t/ZgsWnz3J8zBFS+wUAMNwaRqrBCjR4K1T4wPMjVLkHPapvqdi2qmBC6?=
 =?us-ascii?Q?1b9wBCR7ILevMHnNuzAuEyHRiWg1Qn4yRxyeWq/VYjZYCss3Zk9CE7Qk/kib?=
 =?us-ascii?Q?3YkwUuDrHxGnYOZiCM6P8BotAZZkt6bYflI65NMfDlrNCrcOmATTZ51ofWQR?=
 =?us-ascii?Q?WR5zzxelBEGeB+sfjSti+197+1FbwcDrNCfYigzTnl9nrT4TU9PBQ5mHArdG?=
 =?us-ascii?Q?exevExE9s1VChOSLDz9gUAG1PUuoi1ClMUB0f+gVEJB1LjMK5FEsTuE/ZMpt?=
 =?us-ascii?Q?2UhEVtDx8AHM/tGSLfae2QE21FXF2ZaS8fYY?=
X-Forefront-Antispam-Report: 
	CIP:8.4.225.30;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:owa.infinera.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:53:52.4849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd64750-d040-414e-80b3-08dd9983861f
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77;Ip=[8.4.225.30];Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5939
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 00:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217154

.config is implicit and also an output file, its precence confuses
merge_config.sh to not apply .cfg fragments.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busy=
box/busybox.inc
index f5d7c3f9c8..938f09925c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -137,7 +137,7 @@ do_prepare_config () {
 do_configure () {
 	set -x
 	do_prepare_config
-	merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
+	merge_config.sh -m ${@" ".join(find_cfgs(d))}
 	cml1_do_configure
=20
 	# Save a copy of .config and autoconf.h.
--=20
2.49.0


