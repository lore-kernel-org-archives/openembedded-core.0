Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA36D462BF
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 14:46:02 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.15])
 by mx.groups.io with SMTP id smtpd.web10.13424.1731509153941906961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 06:45:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MSxu/Xc3;
 spf=pass (domain: axis.com, ip: 52.101.69.15, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRxLkPbUnvl9iQ74esYqzfP2mZstNGFepNaj1B4rOPucXf5pfUuhq4CxNCXeIAYQxXJXNoraJhaJYepFRQCRDbu5dZ8mwls7nTn0hIh990fWuc1SCBLxqeZrzAcZfF2j9vbCI+AeOWu6Mcy7xDoPTxP6Wum5t92ql2yr4yacnYsvo3uaog/hE0NL7ttgXseHV1MPyff5cU94Expm1gMLkUOEcxvScjt/tozF0prmv71C5lHQ2+Z9/WryK3TGU9G2fVcTqVGvK96mQcEx+SuQUAhvBKUWzx9JV971IfYf0986mah3c1s2PPEIXU3Qeb0Y3pWdKxLQRifzt3SeLtlF7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcU+phVNeTKzFarEt1z4pbZYoyZziFgDQSCitwV8tHQ=;
 b=P8zHUUYBQZfuhyGjAQAJOl5HGUdPqoQRObi4VZ6Mq7RUM0DT6rS1jYooRoCJFbzZ77STPMtUr9v7ENp5y6J1HE5WmH77kLgVcfOLEtuqUDlavdf//nhOm+ZSPjJYfiqTUUTNuJH997fO1MO+yJXxhK4a62b8deYxqRnesxuagNG7wlxEOJXIqui//j4tKEhijgltxZi92YPnkXUTSju4vMGvvwMF8vmgUuD2OeAbnY50fsstyftixD0XI++2OoVokGEs6ls3KTBcj8EyMH4BtUXiJZorRmNLnPhTNuoXMqHbjSe+t1uVBGyeaErNmJ8bYxdB6RyYCKOzY4sWflbfOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcU+phVNeTKzFarEt1z4pbZYoyZziFgDQSCitwV8tHQ=;
 b=MSxu/Xc3twLLe7T/M7pxUshTO9NfLYWNfoGtDGXbyL0F28m8qJ+VKeLRxUgXJYU6eFwvUCu5P3YI+U3Nqw76A8wZrQ1Qj/0uKnP+U25qMwdSPR3VOOyIPyldHWZ0xpsGTjOPvt/xwURzlFVYO0ehQ5IO+Z1YwfDpXKrmZw7cIuk=
Received: from AS8PR04CA0162.eurprd04.prod.outlook.com (2603:10a6:20b:331::17)
 by PA1PR02MB11005.eurprd02.prod.outlook.com (2603:10a6:102:492::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 14:45:49 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::20) by AS8PR04CA0162.outlook.office365.com
 (2603:10a6:20b:331::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
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
 15.20.8158.14 via Frontend Transport; Wed, 13 Nov 2024 14:45:48 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 Nov
 2024 15:45:47 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 13 Nov 2024 15:45:47 +0100
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B5B8D641
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 15:45:47 +0100 (CET)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 0/6] Remove automake patch that changes path to test-driver
Date: Wed, 13 Nov 2024 15:45:41 +0100
Message-ID: <20241113144547.3121036-1-olani@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9C:EE_|PA1PR02MB11005:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab1b651-789d-4ed6-5b46-08dd03f1dd37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?A9YZijcJZ6D8lKEXi9HBHhFbzuP+3qhPY9NkZ2LA2vhkl5xfy4TUBk3bJvQn?=
 =?us-ascii?Q?FtCv/1HutuH0M4OOGFSTYzPti5doN0T6ZFkoT1+3vD/Fc/zP5TwgyGOZF2CW?=
 =?us-ascii?Q?AvyD2y0z4B9DX3BvQmJWbjjG3VEvAcAgiDDcNWKNhQxfkDTI9ia/1ZD9vHSz?=
 =?us-ascii?Q?YuPQWH54J7raL9IVMeeKouHAi/p6MTUmFTdiVysiG9hhWSHQIe3G7l2OyH/P?=
 =?us-ascii?Q?MpDiZ6hfKL75paJhBQP4rJZeJ6Cs60i3Ejl7iW+dteeMcat70ST9MEK1zX8g?=
 =?us-ascii?Q?L6wkN6wIJriHE3ByGmr7NPWgJEfuOvqcefveaho24uaVuXQcZFGyoPS0BSuO?=
 =?us-ascii?Q?vw5tXiOP1349zMAlDITRTDq/n2LouCWyb9DTR57wCVTMh5Uw6dmXcXZaws6G?=
 =?us-ascii?Q?8JjvNH3SaHbwwX68aWRHjeI0FoT1H0ssNBj5CS/fql2nWL0zMo3CM26ii/yk?=
 =?us-ascii?Q?GV5JWX5mbb5SGc9MYvQ55pCUsvOLy6oBKQ72asTLV3V6SKJ8pUMxL16fD1jt?=
 =?us-ascii?Q?rJhWUtUmsEivDvyPTfTJOmc7S/5Xefs3vsD1XSLbAmexXKhQJHEj6thHL5s5?=
 =?us-ascii?Q?Kq7X91YXMP0FbIJCr1XAZaa0s0mqxLOOEOOEVuLgBtDSEItcbSr9jUSHqVRq?=
 =?us-ascii?Q?GiTIGABlW+b5nOV40v9HEzy+nu+Af0eA6vV6BHdSNM19Q6lzTYzeU6xU2V4C?=
 =?us-ascii?Q?F9FVsJNw3FX6NvCZCuFf6lPfODL2VqTpUI1x0SCXx48kFMp7Fz1dviDQQ/uo?=
 =?us-ascii?Q?m3t66T3oZ3IHmeeppV/Flb5W7Rzp9XhpHC5cha0fbXulFaSMVEuiABb3h1X4?=
 =?us-ascii?Q?Z71dwFNihqpFMWDCeQhyp1MYm2tLlsG3SqifsU6ZoISH4xjm0vM7pjiZCpCK?=
 =?us-ascii?Q?jS+dQgRYSJDbrnhR9RvkkKaWFTe1/bLZ5UsiG5JvxqYswjVM4GfiAB6mVFKW?=
 =?us-ascii?Q?0g0em+sDMUax3FHgqa7sjelxu8sLOm5Mcn+tUn3iboI2X6jMzWCS3kR07EjG?=
 =?us-ascii?Q?7GTLPf2Z9eSt/6spcHvpYIx8DbIJHfWer/s0kcDWtTkPI4Ey5S9ltf2hFsp1?=
 =?us-ascii?Q?i5t8Wnf8Gy+mmLrwfJsISZR2yGz1pZ6D/hOXumTLoDe/ObcKnXjamJL6pYDw?=
 =?us-ascii?Q?p6YJv36QyiMGedNcZsNfB+h1r8xnQDzflPqm/71UvGkiXZZNuT+ssMB02Qon?=
 =?us-ascii?Q?fxtB4hZZ6EYgfKJezLEewfEZ6aMIAOD3UWwG0RsQpPfGlOz6Zq18V0jfzMpH?=
 =?us-ascii?Q?2niV125iRBlqp4xpUDSy1AyAekZq3RyxyISxVksfLiS/IIInm/OfkoKo/aAB?=
 =?us-ascii?Q?fa/qkB8ZqFNEIkkFN+VBij5TfV/npdmsAJbQmJqZB0E5h8gZ4TxZu/O2zt6L?=
 =?us-ascii?Q?rArVPgSMVG75dFiCpwQ+OHQZuM3QiSIOpmlisOf+ZqfAo6rmlQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 14:45:48.9403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab1b651-789d-4ed6-5b46-08dd03f1dd37
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB11005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:46:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207111

From: Ola x Nilsson <olani@axis.com>

Fixes [YOCTO #15635]

The automake patch
"Set relative to top_builddir path in Makefile to access"
sets the default path of `test-driver` to
`$(top_builddir)/$(config_aux_dir)` instead of the normal
`$(top_srcdir)/$(config_aux_dir)`.

This breaks `check test` for Automake projects in generated images.

To reproduce, use core-image-kernel-dev with git added.

git clone https://git.kernel.org/pub/scm/linux/kernel/git/kay/libabc.git
(cd libabc && ./autogen.sh)
mkdir build
cd build
../libabc/configure CFLAGS=3D'-g -O0' --prefix=3D/usr --sysconfdir=3D/etc -=
-libdir=3D/usr/lib
make check

/bin/sh: ./build-aux/test-driver: No such file or directory

Removing the patch makes the checks complete successfully.

Some ptests depend on this patch to find test-driver.  They need to be
addressed individually.  In all cases I've found so far this is just
another sed substitution and should work even before removing the
patch.

I have not verified the ptests in meta-openembedded yet, but I'm
working on it.

Ola x Nilsson (6):
  acl: Fix the ptest path to test-driver
  attr: Fix the ptest path to test-driver
  sed: Fix the ptest path to test-driver
  parted: Fix the ptest path to test-driver
  strace: Fix the ptest path to test-driver
  automake: Remove patch that changes path to test-driver

 ...top_builddir-path-in-Makefile-to-acc.patch | 50 -------------------
 .../automake/automake_1.17.bb                 |  1 -
 meta/recipes-devtools/strace/strace_6.11.bb   |  4 +-
 meta/recipes-extended/parted/parted_3.6.bb    | 16 +++---
 meta/recipes-extended/sed/sed_4.9.bb          |  1 +
 meta/recipes-support/attr/acl_2.3.2.bb        | 10 ++--
 meta/recipes-support/attr/attr.inc            | 11 ++--
 7 files changed, 26 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/automake/automake/0005-Set-relati=
ve-to-top_builddir-path-in-Makefile-to-acc.patch


