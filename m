Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00857D462BD
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:02 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web10.13423.1731509152895028376
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=atS7hIga;
 spf=pass (domain: axis.com, ip: 40.107.20.87, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpzSqKsUWlTlNks34FRrCzxCZ5OATOaqUHDNL4BZugr0NeKi1aAglkBuP9iFUnlshlq2yZ06rru6e+Shp91K306TO2/M+OsvOfV2S2cL4nirOsKhiPd3FmITAgSQLrpYOuAk0b6VBtin+Qt8pNjMqkRJQq8Dpik3STFYiqINlTAdUf9feeV6AERl12LYJ/2rIX0oHVQdhrBGrmczGVUDUIt7DuquCa0heAoK1Rih7WNXCL2z9fGhA63WMwRBifrGo8erCs4BYVNbWyULOenwZyll7eakppzQiGvHYCDTyorIjjyNL42kI9z3bqqNuTAkKCZVIqh5i3eOwSoDDA7NIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEZbUhKDdAYUyl07aOTfpCS1vWREKUdxrJCGSfIdSFQ=;
 b=q+bOhrUpsAnzJKzdaMhxnmwfu4Or16Rn1AEHkEblaMPAgzvws3yNVQb3magGLG8z70XC6nDoUDb7rdsnZbFqZwLpGltj/piRYiG0QUdDlJfLKyxhnZXa1sWyegJ2vOX12G8s2VnLE6+YvCYAeHXznkLUBFk++ERdWsW4IMne5rHcp96iCRsm0RvNwDKP9HF/NyiPzBtjDzHcqqmKzx1RENsC7LWJZiuxb4+Ei/F7hMKv6i2+GXcd324AIbUmb1NqPAu4izMHG+NIeBJp4//RwppvMgXdpkJebHny2jZ+36mMT9xF+onhZvRpcrldchoOyHdiRHRVUXRJfzzs9nzqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEZbUhKDdAYUyl07aOTfpCS1vWREKUdxrJCGSfIdSFQ=;
 b=atS7hIga0pqifMXQGOxd0fXZg+kLCBVmyA+WTuyTaK0HiX5Zis5JHfV6lMB60oYVhOMx9ktqUz01YZ37IWbldySwpIXRzaD59Z83LmAKOoI3p+CLC/vz9WPE1KKdwYvlKapxWK/mBRKio2ePzIOzHiSiFAH0ntPpkpevDmopids=
Received: from AS8PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:20b:331::9)
 by DBAPR02MB6133.eurprd02.prod.outlook.com (2603:10a6:10:18f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 14:45:49 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::6a) by AS8PR04CA0154.outlook.office365.com
 (2603:10a6:20b:331::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Wed, 13 Nov 2024 14:45:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:49 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:48 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id C9C478B3
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 4/6] parted: Fix the ptest path to test-driver
Date: Wed, 13 Nov 2024 15:45:45 +0100
Message-ID: <20241113144547.3121036-5-olani@axis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241113144547.3121036-1-olani@axis.com>
References: <20241113144547.3121036-1-olani@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|DBAPR02MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a31a78f-85af-405b-431a-08dd03f1dda0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I7ImFwou9cc/tm8161g5bV2eVmtRgfORUt2TCT6UGmwu7sItqLy2vgQMEhCJ?=
 =?us-ascii?Q?jfK6WQ0Lksduo0CVfwXomX6EWyMoZIDXtzLiho68S1LwTwhIBSx3zLhfbeDZ?=
 =?us-ascii?Q?laRy1Ro3zEbpq2XM1gXvRC/KQYvlXRctQtsl1uYuCxfrk2JY/oqNfNwa+XSY?=
 =?us-ascii?Q?1fJuHcF1Q8bU25VNkmZ5gbQ9znPo/jYqDrIjEJPhRid947iaF3cItHs1tRMW?=
 =?us-ascii?Q?EWSindJs9/SjQZ4Utph1FJdnXjTkGqvuJyhiMnA0yUiE/vN2l+MkHyyNqJF4?=
 =?us-ascii?Q?inBMsg1671e/dRBM95hFWjS50EhXb/9aOSAGXSqo4OjF7hv5Yk85dHjid2Ax?=
 =?us-ascii?Q?UQ161eWzXZw7z9g5TpzqTTldUZWWrI1bqdRLbuBUB1Q8r1yxaSPZh/dsAIhy?=
 =?us-ascii?Q?FN8/UmqOf8bSIj6Nsts7wfflhKA+LL7IsHSMttG5XL8z4fflTY1c6cuSJGFt?=
 =?us-ascii?Q?lih8muoOU5YZ4RjDWhWMPkJOgkCvF9nw4RRgbOz4j6fqzL9VfZPy8H4a37j1?=
 =?us-ascii?Q?mLIVA2l9XfVgOyn0/qSBPLym/heRey/ATgnwD5n1aUuVv8WmyiuK1Y5XnpLe?=
 =?us-ascii?Q?KjEKkqznKpgVug/JPQ9dOs8VuRDO/nkFEpqJJ8xrnri75qHOpqTQsaWXO/1P?=
 =?us-ascii?Q?U6aWSz35Bblbmmf9A9/AmrD9MrHLVbMWK0es/XC24Gn5Jbu0uNbPFQf8kxuu?=
 =?us-ascii?Q?DdJBqwfo5tgUF9l5P/8LpAxERCQOGeBLZKC4jfYSmmMxab239ez3JeNml/VX?=
 =?us-ascii?Q?bjb7Tbjc0hIc/oC2DPIl/BpeOqBQl7F4fHKXqO7znxBxVILNLuGve+ZtS1n5?=
 =?us-ascii?Q?x2LBKa8gfFLuPHI2+0vmxJpMyQzR0+rx8tV6E2wFQfszIJyj2nX6WFjHLWFd?=
 =?us-ascii?Q?OlHu3MWSSGM7cs7hfSJHY6ji65W8/tsfidaPDtMX1zIwLE61GyVfQOSzPtsR?=
 =?us-ascii?Q?K47Ut66kcvpOaqwkO28QWYQGmWEuT3+5ebk3CmQVf7tYLsXpWxKc9/KI1Bhg?=
 =?us-ascii?Q?Xw3lyOspJVic17whJje1rPWsbcPI/tms9ovPPimMwcEWP4WGju0NYzA3dYmk?=
 =?us-ascii?Q?RP6y+81PO6oEPrKxgLIJU7iR7RkfFeu4dMstTWBY+UJveJ9653IGDAzoCKNS?=
 =?us-ascii?Q?kmj8EIs6HiLowEQ0gxVpjfquobR8ddFPEI6BcP0/IF/ES46dvoPkpS8Dp/XB?=
 =?us-ascii?Q?l/QWJcrevSVB+6q38MbTy1mp8ntRwbt0u5aLSntKlVkHj6lbJ3cOAJVZXqxv?=
 =?us-ascii?Q?xl8KiAWO7uCdgPRgVIX/hNVKIogkPBpOg/ed+Mr6BqgikYR06RicDakjZjse?=
 =?us-ascii?Q?v9sVTNeqiAZRYfSkptB4fwtQ5JJzMkUQzd+SJjQt1IoWW3SjS0PbkbyWDvJ+?=
 =?us-ascii?Q?FalzUdyNwSeZuxRifqYVUKD90zXJJt5yXcAzM3YDW+EwiGPiFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:49.6279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a31a78f-85af-405b-431a-08dd03f1dda0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207109

From: Ola x Nilsson <olani@axis.com>

Add a sed substitution for ${PTEST_PATH}/tests/Makefile that transforms
 SH_LOG_DRIVER =3D $(SHELL) $(top_srcdir)/build-aux/test-driver
to
 SH_LOG_DRIVER =3D $(SHELL) $(top_builddir)/build-aux/test-driver
which is where the test-driver script can be found when installed.

There used to be an oe-core automake patch to do this, but it
broke non-ptest use of automake.

Relates to [YOCTO #15635]

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 meta/recipes-extended/parted/parted_3.6.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-exte=
nded/parted/parted_3.6.bb
index a537ef74dba..fae35815be9 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -35,13 +35,15 @@ do_install_ptest() {
 	cp ${B}/tests/Makefile $t/tests/
 	mkdir $t/lib
 	cp ${B}/lib/config.h $t/lib
-	sed -i "s|^VERSION.*|VERSION =3D ${PV}|g" $t/tests/Makefile
-	sed -i "s|^srcdir =3D.*|srcdir =3D \.|g" $t/tests/Makefile
-	sed -i "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" $t/tests/Makefile
-	sed -i "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D "${PTEST_PATH}"|g" $t/=
tests/Makefile
-	sed -i "s|^abs_top_builddir =3D.*|abs_top_builddir =3D "${PTEST_PATH}"|g"=
 $t/tests/Makefile
-	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
-	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
+	sed -e "s|^VERSION.*|VERSION =3D ${PV}|g" \
+	    -e "s|^srcdir =3D.*|srcdir =3D \.|g" \
+	    -e "s|^abs_srcdir =3D.*|abs_srcdir =3D \.|g" \
+	    -e "s|^abs_top_srcdir =3D.*|abs_top_srcdir =3D "${PTEST_PATH}"|g" \
+	    -e "s|^abs_top_builddir =3D.*|abs_top_builddir =3D "${PTEST_PATH}"|g"=
 \
+	    -e "/^SH_LOG_DRIVER =3D/s|(top_srcdir)|(top_builddir)|" \
+	    -e "s|^Makefile:.*|Makefile:|g" \
+	    -e "/^BUILDINFO.*$/d" \
+	    -i $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-resiz=
e; \
 	  do cp ${B}/tests/.libs/$i $t/tests/; \
 	done

