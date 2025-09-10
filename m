Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB027CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 19:17:53 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.web10.27965.1757531870498158096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 12:17:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=OGk786aN;
 spf=pass (domain: axis.com, ip: 52.101.66.32, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8Hnnc1xmg9N8FUNgUda+NfreY+kjE30LL3aOpaj7ZHH7B1X3cjKAoFu1ArsHQ63tSViIj0mTQpsqX3lsuOsC9FzN6wPEhgHyOop1vrHng0vthcSppj5IeM8P9D06GsNvP7oC+Zxr5INWtzko35sT3kIytDqrNGK4ERyp7G5g2XDRdLVTWSWnvcR2VTrSs2XQq7xAdGR8dx18AaY85GBSOJqUXYgIPsScSdBbAxe9BTtLu6y5JgWrkSUkiv1bYNHTF5/67c4u2ouXFegumija2s7O1SzvSANfc7d/osN3Nf8uPdMR2endvqA0p0hb5hkatz/493dejpbtkicnTHYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jvkgBvm+2YA8Jike/t1XR4s1DOKNQ8Q0j99pt5C2kE=;
 b=I1GWOA0JM7VI7XmzzSE3iL5FHDCXxGLnm2/n55drjcBAvVl2U/O17ALyYhWQWY1a8OidjIeUtNkMSvlG5eR15RyeLAMeFriIw4acfmHhhaNwYfxnFaVuUXL5IL4iUIafZQ3nQ4pQQ+nB/yIrsNuFOwoDX9n+nnNN0hPtvIWMGhm/wKRIE5VXjuVgXqFsonPLO0XT0tdZU3hvTLSSHli8kQtfWttnDLaKmMKfRvxLx7ZY03iaSmd7VPOSaZQKLBJXacVVje4r6BGM2jLk83lZvmEJ2aiG8DhalajZaEgjHmftIkSOgndqK+5so7u6vSpSlLTMqOYm/ZDQ0nnZA4eZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jvkgBvm+2YA8Jike/t1XR4s1DOKNQ8Q0j99pt5C2kE=;
 b=OGk786aNNfD01iMAndOqrvSe+jqiOVFHyKjFs1JeMQKWtex0e3jaQEB308VW4kRz6T+NN52jepOthe+yoO5CC54YIJbBw7Jq4QJJPsNWarhLJN6DuX5u3gpi3gG0r139Dy7IL58Ue3Ssth8ojb+4xM3qNSqi3acBRZ8bHXby7Ec=
Received: from DB3PR08CA0017.eurprd08.prod.outlook.com (2603:10a6:8::30) by
 DU7PPFFF006C15B.eurprd02.prod.outlook.com (2603:10a6:18:3::ce7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 19:17:46 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::c5) by DB3PR08CA0017.outlook.office365.com
 (2603:10a6:8::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 19:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 19:17:46 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 21:17:45 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 10 Sep
 2025 21:17:45 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 10 Sep 2025 21:17:45 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 841031BAD
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 21:17:45 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 2351512038E; Wed, 10 Sep 2025 21:17:45 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] Revert "coreutils-native: don't install groups"
Date: Wed, 10 Sep 2025 21:17:42 +0200
Message-ID: <20250910191742.3559681-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9BF:EE_|DU7PPFFF006C15B:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ec1cd4-6191-4f47-e971-08ddf09eb953
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L6+nOeljzh/KPmcEuuD/J6FaoCdWywK9+uzYHRsBV0WQM40YJtuwb9nqDJ8/?=
 =?us-ascii?Q?JRKJjaS69h4yvlH4LS8ZQKLN0T/cKVnUYRH5mT9B55mhjxq9hyq94s1mYfbV?=
 =?us-ascii?Q?eimvFGYATW8ZgYF7LgFSvpSvG4Iz5NderDsq+9MVhtvTKer6SZfSwJRmj1Fn?=
 =?us-ascii?Q?h77y9AMvXyXaHJjAO2gQ0vv3b9zpjygErW0iHhn/iDvzxckAwXAf8LMONvmA?=
 =?us-ascii?Q?lmXaC4FyGW41qYTyh+xFWohJVuSMuQRM+d4KqElEFYbq68JRtYzEC38E0OEz?=
 =?us-ascii?Q?Ufv87u7ImXsuRzcQLn/oO04xfrh2PNj8Wfo/nfDTQiCgAbe4RcOPQ04vDryq?=
 =?us-ascii?Q?CyUWQ4bZapasAleZfsyJcTR3okF6kn5DsLy1iGuLWkM8Xe1PLZliJhfIuL5b?=
 =?us-ascii?Q?CrRSKCKioAkikJN/PXo9PymxiLZtA8mc2hCy4BACRf91XPZ/aVpMFuMNUqSY?=
 =?us-ascii?Q?reSak2UCkWDmK5NPPkkBAf4vTEp9v4umze0cwIXVUyY/H6DHAz+YpJ78/dlF?=
 =?us-ascii?Q?8RuQQqpLlyxiYcqE9mo2mVAEb7UPqVhcW0IaNXGf1a+EjAX0DoQousNNkCjK?=
 =?us-ascii?Q?5NnVezoOAKVdcK+h4MKLuQFR/lBMwW6DeKD5g0WwwiekXEbN6AXzlL4xKN3f?=
 =?us-ascii?Q?DGq2hDTq0zxEeAvdSdTZ3vCrvvUSW2pXR49rWYGaw8Oijtu7qq3qlHK5F8P5?=
 =?us-ascii?Q?81ULxWSV4PlqzFrhmdE9jcSqp0mj+Rt0e8a3gvQ5KcXkxOkdydUz/AnIBNyN?=
 =?us-ascii?Q?DRRZaD4vGageYBhrEq9pspCR4MMG9iXzRyLzcg+9nRckokSuQ1gHLzNwo1Yb?=
 =?us-ascii?Q?XmtyaktifDYeOBvBkHpx/oyFZi0/IBGgSfoL5BNCBbU1XQqSI7AXCQF5ZwXX?=
 =?us-ascii?Q?lHEFJV6i5S4x2CdBnHCyDKbUFe7sgTS1hkpXkZlOSG/tKHblXXuIlc6qpMID?=
 =?us-ascii?Q?OQ6YzOKQhQIKVUKEkbq0uWDJd9cnX9JapJI+91Q1z09gBw6QZNTSSBsccIku?=
 =?us-ascii?Q?oRXwdr2YQxiWMPA3HOci40apqsR0D0VbndQMQHDNFJbNTUlNJODMx0N6JBHH?=
 =?us-ascii?Q?VedBK0BpGrjFD62iV4c1/hUQwurFDUUgTefcuYDiAprRw615ZQcAiaFJB75T?=
 =?us-ascii?Q?wqrMeAc9hWush4TKRyO5Wv5sw0qI4ehhZCYO6YPdTfmyOMnb07RHtdCvI5ig?=
 =?us-ascii?Q?7yePiDdYqR+Fugmu69r3+Wx0N/y+I6hbwU9HrCu1JF0TTag+wTobB7fR66D5?=
 =?us-ascii?Q?4dnrDFyyX4fOX/T6fh0Jphu/5E8PmmSTkRPjwRuXxNtVL5/0IOtJQGF5ORid?=
 =?us-ascii?Q?ktzkZ4qupmtZvMqHvYr80QxrzszS9qrbrrDtjQyxoWyLlz1KFL/emg/lcBXT?=
 =?us-ascii?Q?Mub8vx3Szik7UndBHFJf1SVxz6EvMPHFlNNa3yArjZ/gDaiaX5xxlq2ZVnzq?=
 =?us-ascii?Q?U2a4ZH2cfhYuAxPbsn0S++wxBXilejoWlTderBBFYfSSIEpfle/1gHU/S8y3?=
 =?us-ascii?Q?Bn9DhtAqlTGTv+LBA456toIt53NF7jOZay7/?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 19:17:46.0708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ec1cd4-6191-4f47-e971-08ddf09eb953
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPFFF006C15B
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 19:17:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223232

This reverts commit 113225b93c55d55a330fcca7d9f996ec039fb953.

The groups command was previously installed by shadow. Therefore the
one provided by coreutils was removed for native to avoid a conflict.
However, since version 4.17.0, shadow no longer installs a groups
command and thus there is no conflict anymore.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/coreutils/coreutils_9.7.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_9.7.bb b/meta/recipes-co=
re/coreutils/coreutils_9.7.bb
index 3658f7100c..201be4144c 100644
--- a/meta/recipes-core/coreutils/coreutils_9.7.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.7.bb
@@ -82,10 +82,8 @@ do_compile:prepend () {
=20
 do_install:class-native() {
 	autotools_do_install
-	# remove groups to fix conflict with shadow-native
-	rm -f ${D}${STAGING_BINDIR_NATIVE}/groups
 	# The return is a must since native doesn't need the
-	# do_install:append() in the below.
+	# do_install:append() below.
 	return
 }
=20

