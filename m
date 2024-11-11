Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6526BE6781D
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 08:35:48 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.40])
 by mx.groups.io with SMTP id smtpd.web11.54965.1731314146453451050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 00:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=RStpZkFO;
 spf=pass (domain: axis.com, ip: 52.101.67.40, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlz3lOPstwc3wygMFzxFrgLZSn6J8hKd1k58gr20CQ+q0VjtkBloDgUZGEaEZYc151lcx6kGZGpwjQPYEOsel45LdMSQzecSuk3e1Hf6EgaXfKSWljcwg5eXQnbAsSYxU6rLDppAGoCKABUZxo/vhW+nyTtneTpbHATuAPDUub6Tau2oTs4UZuJ7qflMGRc9rBiVQ4Dag9SdPGlaShMl9j499hAdl5ya9qXJRTe5X68uOs3FWVD/jFNj7d/CWxs3sMTEr5ap79TyurP7BheJs+3IJO+GQ9TfITIsuebctRMc4oPqlVL9kJQtNeLwQdbbtlvhBRP1x6e5u8PAfHBgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7qNULj525XvdoMxbyt8t26cy+k41JovN0VQ5wlY/aI=;
 b=onyFnObGsmyfaNrRWXixCZMX2gfVh/8OAvBHIzobK7biQkBF+jzvViusSjQHIy7ZmZEFmV8fRdk1CXmHEcJf56Fz5jQ1RvVWxZXtd1Xmjgjn77Y3MxylfVr8rQ2zBYKLMuUp4889OXqREIH4vPOze0wklizoGvkOziC41btK6gzGiNv73RRlyBfb/mSSSj2N24Oh/ZfAU9bydOqle6cIkQ+Qa9gVW0GQt+LEBP91OPXArz0nYRENHgyGtrJp3Ezxp2XjNC7heOXR43dri/1TdxBwepjs0EW3FzvRu7+KqZFmgjfahMaJ2Qovp4WCe/Kl1rIhqrNPP9u6X7ztOtXO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7qNULj525XvdoMxbyt8t26cy+k41JovN0VQ5wlY/aI=;
 b=RStpZkFOuWhfwu8W/IxBncmZQWj/19RZ+5LshvTnn6u1ElKzC3MRFf4h03Vy0BL9cbvyNwV8IX0p0VU5MrMJWx5Tki1C/z8ioF8giDpTFJvrnDB4kFQOJoBCn0X2IJiBTd3XoilwCiUo9ZLKJfz8nz2CryHyLf3wQrSmIM74/Wc=
Received: from AM9P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::11)
 by AS8PR02MB9933.eurprd02.prod.outlook.com (2603:10a6:20b:61a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27; Mon, 11 Nov
 2024 08:35:43 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::5) by AM9P250CA0006.outlook.office365.com
 (2603:10a6:20b:21c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.27 via Frontend
 Transport; Mon, 11 Nov 2024 08:35:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 08:35:42 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 09:35:41 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 09:35:41 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 67EC17E2
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:35:41 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [RFC PATCH 2/5] sed: Fix the ptest path to test-driver
Date: Mon, 11 Nov 2024 09:35:38 +0100
Message-ID: <20241111083541.291594-3-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111083541.291594-1-olani@axis.com>
References: <20241111083541.291594-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|AS8PR02MB9933:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f566211-e2eb-4393-4fe5-08dd022bd492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rfKVfkOtwnpB7iO3elDvlBfsJo7wzOWHs8fv4Thib4+pTaNVYe+vLW0XEQYS?=
 =?us-ascii?Q?sEfmufrPoFhUSct5aEDerFGEtNucBU67mLooe8Y7oHOccuFbqXvf8x4cAInP?=
 =?us-ascii?Q?0daDR3qK/mMmHVEVyDPRAfHrh5h04EBHHGfpomdOrXpjOcC3NYtmOvjYtsmo?=
 =?us-ascii?Q?hgWYaFGQEtFyk3MY/DNhOaH5c3LplkkZJ6z1MMfwA8vcTW1zBgTNjW7RvRvX?=
 =?us-ascii?Q?+GLguYkA4SIa3SKukNlGFsyCc0OYhsoCeFtF37wjDXgy8bTeXrvKHrIT5Nf1?=
 =?us-ascii?Q?V7R6fJ4SKqmEAbgj1NnXgtfaMugcKvtUhdo+JZbQUSCwh0Pilwoi7exEEYYK?=
 =?us-ascii?Q?AkCUv2GUxkNNmAXIYagGcbfPPPty8jpVbzZaN3vXWoDN7hpZKZNAose/wSDS?=
 =?us-ascii?Q?i1aBpIIfIJpmY9xmLCL0HcDSNa3e9NV7SpXwJCpCh76u2Hz4zXW1qKFLV8/L?=
 =?us-ascii?Q?2F4wQr26SzaZszB4H7j5ooYQlih+YSXDvrSNU2lKVEu4i97O72iCor9TJBKP?=
 =?us-ascii?Q?sx8kXL9ljfkdk9OcXJDcFGXffIw2wKCbk/5cyBlfNSXKjP9x93U6yY59bFmu?=
 =?us-ascii?Q?MTKFxPqN69Li5vSFk5uzoXxKxc0r+m2EkMdHFg6aKap62jKbLKS7XN4QcWz1?=
 =?us-ascii?Q?it5vvKhakK40eXskZlGIFwY/TX5Q/y1NyXR1m61qBnehzkjBOqmiGh9kd9Z9?=
 =?us-ascii?Q?3oyINn/mcBtmI7i0VsU3tUrO0Z+RLnogsDD9owLislXagXlAbBkd9CkQcZnR?=
 =?us-ascii?Q?WgM023cnWbHKBtmBO5SoNyHN2CN7hJx14neVvZs5b+rXs2SjMLlGaN6u+qW1?=
 =?us-ascii?Q?0rOUZzW9RuLp9+9htmkZMhAuLnyy2+HMKL/GkUuVmTYa6yW0/pbWT9sTwMW/?=
 =?us-ascii?Q?x5+PwRxG8ZI/7HZr7/FW1SJxu9kCcF3gDcwWJWZdYZluAdo+tT7xFl2jqzxd?=
 =?us-ascii?Q?fLHVKQsq7M7E9wi/4yaxxZ/xoEJYestz4w7one7D+jutdJXZDlfjzqEiMww9?=
 =?us-ascii?Q?L9COtHEyHhpjkLPxWzYGXbwvauY/ssYr0vNze7BKK9cPjSaa4Qxz19x6lYdC?=
 =?us-ascii?Q?geS6cz1mNFUpxLobI4rwLZ92Ik3SlPR/nfwFggDXiWeGpYkkgAJoXUkK8nmr?=
 =?us-ascii?Q?LyPpE4CXa4dLzOPzYEWD8vb0FTBjX9ICG4IOZHlXb808V+t2RLsCslZBXMiV?=
 =?us-ascii?Q?cMsHS+u7CnlZ2WOFX2RXST/bj3bF8bFUWrRZAEAJStP/ttra9gCbvkFdeSFS?=
 =?us-ascii?Q?OhY+3B9Oa5z130lZsM9Np/sJvIqn+eYCL6NaogZEWrjVhQG0EKDdPa09R00t?=
 =?us-ascii?Q?0A4rrECIVrYmIXiZXPRBrLd2bC2uNFDwksz+h21XlvmwpPcq0Z18HgQMTozy?=
 =?us-ascii?Q?TiQbPKHddWWVwnEXApIeYwPn+D0/YOgCqQJy5iQy+npclpoiuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:35:42.9373
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f566211-e2eb-4393-4fe5-08dd022bd492
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 08:35:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206932

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/Makefile that transforms
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
 PL_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
 PL_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]
---
 meta/recipes-extended/sed/sed_4.9.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/sed/sed_4.9.bb b/meta/recipes-extended/s=
ed/sed_4.9.bb
index c4d89c34b2a..b30ddc73ca6 100644
--- a/meta/recipes-extended/sed/sed_4.9.bb
+++ b/meta/recipes-extended/sed/sed_4.9.bb
@@ -59,6 +59,7 @@ do_install_ptest() {
 	    -e 's:abs_srcdir =3D.*:abs_srcdir =3D ..:g' \
 	    -e 's:top_srcdir =3D.*:top_srcdir =3D ..:g' \
 	    -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+	    -e "/^\(PL\|SH\)_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
=20
--=20
2.39.5


