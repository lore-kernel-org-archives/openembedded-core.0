Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E00C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:21:42 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.9])
 by mx.groups.io with SMTP id smtpd.web11.39755.1753892501820505973
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=rksMSBWW;
 spf=pass (domain: kpit.com, ip: 52.101.225.9, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz92qqwBKKvj8b+w5eoxn2B4itJpd2pAbT2Hjk9g65DSTEKcMPFk+/H3BDzdOLwN1wyPj2DD26nRmosipBCqhqbjZf6KinhaptzQ/4c8RJQ8CU65ueDdlM3+ikE1Rmi8NXhNqMg9urrdcoTH0mALhCiovFqkXvOHBfoo3L50iDvrbbK9BPOpX+73IIpmAdu7j0ch6mwUTiKvtiPd9Dlq0wiAwTZ/XpO5eEH3llsb//gzfRGwZta8pjd62prkMnIGAR0GootIhNaW2ORbIkdwgitH7DzWd/p1twZnRtJbNv0Z4+gPw1OLLRqYGBz3v3yUVUB+zByjSEeHkkvZihK7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNg4tTrz2jUpvYLNSyZJFa+KQ/N5n/I2ZaLVLrguu50=;
 b=sSMpovVLvDSPSwGO9M8RH3+phXGOTPoQNm1dANjiv1kBouY9WwmsLv2nglX2EZyDceAuQLq8uzTmjpEELpwK4QNiyl2MzqjVNDkODdbaNWR6s7Rg94dlme6szVVhG87+IH7S2fkefeD4LrtcH3+LGEKWrkrm4vyiLpic5tAuzQZMFbu7X+/cGRrANq/u+OSnzbYmra0+53Ei69AYJwfk70wfsLGJ/omJ+TZVSP7YY5J+qbZGCsR/R0UswzJymOujLuL/UDnioGbJuTTvmNezRxjvtPGVfxRfKyVlagp1SSrauzrowsmaLbX5JORrpqf6WKD86ySNZtSgvyWfbQrV0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.243.225.90) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=pass (p=reject sp=quarantine pct=100)
 action=none header.from=kpit.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNg4tTrz2jUpvYLNSyZJFa+KQ/N5n/I2ZaLVLrguu50=;
 b=rksMSBWWywE2icet0j5OGC10Amfj6fSw6iU6N4Ty9U2GsTzzzOqTRXW2/oreAR6icLdPtd4KmVm95Jb5n531inK1VbNPyjjnVsGuoU93Z2ENbfldp+kPHM4dmO4Ta18H+FnRniStImCgXsMBXw4l6stSJXovVaXQD+5Z6xUujQg=
Received: from SI2PR04CA0006.apcprd04.prod.outlook.com (2603:1096:4:197::13)
 by MAUPR01MB11023.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:171::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 16:21:32 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:197:cafe::3d) by SI2PR04CA0006.outlook.office365.com
 (2603:1096:4:197::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.12 via Frontend Transport; Wed,
 30 Jul 2025 16:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.243.225.90)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=kpit.com;
Received-SPF: Pass (protection.outlook.com: domain of kpit.com designates
 103.243.225.90 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.243.225.90; helo=mail.kpit.com; pr=C
Received: from mail.kpit.com (103.243.225.90) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Wed, 30 Jul 2025 16:21:31 +0000
Received: from L-16657L.kpit.com (10.52.121.12) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 30 Jul
 2025 21:51:28 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-core@lists.openembedded.org>, <nikhil.r@kpit.com>
Subject: [OE-core][master][PATCH] cmake: Enable debugger support in CMake
Date: Wed, 30 Jul 2025 21:51:12 +0530
Message-ID: <20250730162112.67549-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.52.121.12]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|MAUPR01MB11023:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c87facc-f7b6-456e-276e-08ddcf852533
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mGAdWGCBE9ryG9Zy9/CXQ4OMvtiHOXkYawJb4FJ0vcbiMxSLJJJ+nlyddPjx?=
 =?us-ascii?Q?9TgDdTk3kh8ji3Q5xS3OB3JOK89b/ZEg4zisURKNgkKhPyRGhDocl9D71iRg?=
 =?us-ascii?Q?zk2dtYuZAjlQQ8OUrhZUMNQRWOcHQJxC6PqL1m4nEs4KWPfdD//qJ/sBKn1p?=
 =?us-ascii?Q?ctlrJKNMXsWRVKwqkiOWOBFoh5a7DDM1R9eM5iSXo4VVwBnlFsHUYzXdryX8?=
 =?us-ascii?Q?tlWeEvh8EQv9S5ngdK4Jrw9SSRqSQ4+80vb42KG9sR9Hb42WwR9FwtgbpZT7?=
 =?us-ascii?Q?KfNVsYgkfDefjE1OqUzIi2dakXc468E/y8/5gWOb2VKBtRndjhbN+z6hdwwS?=
 =?us-ascii?Q?uWV9q2BTjvcgnH9UjEnLnplm2O1Y7usMKOc6gtFr2KGXTzGRBwXAMFdDHZSK?=
 =?us-ascii?Q?ikGEa9j37w0OPZk+baYFQ9Gxaf/W0wmPAOY1I/VIwSVcbEaJTi0bbOFR6vIV?=
 =?us-ascii?Q?Oh9Luvwd3z5ObAOj4FZ4m24gL4N2AgVhw0jy138H0hWrGNHDjiS5GSn2iwHv?=
 =?us-ascii?Q?9GYbaqKtgZ+3Ff7j77WHXYZzsuUoJ7sgQrn/OM7sqvkuj6km9vw8NDNj3YF+?=
 =?us-ascii?Q?HyVUrClrg+gyKFAsTCEYDh034/PGxC1xE1JPNydrHzHHS2ETqAncQsTV92Hz?=
 =?us-ascii?Q?EYwuVWZ01fDBHtOwrKcoWJU8X4rjZMLe/DCMLLDIsZFCTKc4kHumWVClGzG6?=
 =?us-ascii?Q?Sk3JKpASr9B0/FDTb5WG6KecCMf2HiTshI5ewihf1zG9TYZKdXfyV5+i5lyz?=
 =?us-ascii?Q?eisnUvrI2NDw1LTDHCcc6/fihyTLfielSJQ3QKuwwscDfqywpCN2XbO6fA1T?=
 =?us-ascii?Q?A8h/gF+g460o2yHHxdMxvW3t/Ci6sMwOzbpKYjs0DxVM8JBr1+r8lRG+ls/h?=
 =?us-ascii?Q?SH7aPUCuelZeRR4INQjUXtMUw2c2uWCtp2Nb/QPMc/yk83EbHsJG5jJVimUd?=
 =?us-ascii?Q?n3T4fSoyjin2YC6D9mGzFtV9zW/tNEju4K8wVFTHwbHkEVbGV8uT0fBgYEyz?=
 =?us-ascii?Q?oWP3W9jJgoTcngV+oaTY2rp7XO2/dSdwyouhh0xUWz3OGlKY5vBPktHP/1fz?=
 =?us-ascii?Q?ZtJub6BUQrze+9sqxEAiP3m36l7OvnCGKCc9TJ2H/OMnQO493lpXT5JAoqk8?=
 =?us-ascii?Q?ZMiwWaU1cyXu1fXyks2vHHlsCTqTEOqBmapAq97cbAjFr4cOEpigvbJmGkLZ?=
 =?us-ascii?Q?JJ7vf+7InPWXhL10MWzzbkcGE2Uttx3k9qMEja6GVNcN9Sz9CYTO37U/lhTY?=
 =?us-ascii?Q?k71cBixKnr+lKugCYMqaKwl/eGA8Z7lbWy5OQwBIlEh3XY1Un1BmYlXjwv7C?=
 =?us-ascii?Q?yJ/mb3wo98wXXux7R6LKHEe8P/+5HR8ZC2+rVgwDhsj1aq5HKGr5aNlfu4TQ?=
 =?us-ascii?Q?CbTXp+LLP+U51ABMAyk9JjOEHW5mqZ+1Y6x5xvmvLu3QQHs6W9GOlc4iVuvP?=
 =?us-ascii?Q?cn6HtXddy9ZZ+EY6qttVnWqoOzLuD6kyz30Cr4TWOos3H5NfTbR/iIclyCvr?=
 =?us-ascii?Q?TIDdvfyqlvkWAZI3A5t/p+CwF06KOalpYOG6?=
X-Forefront-Antispam-Report: 
	CIP:103.243.225.90;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 16:21:31.6894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c87facc-f7b6-456e-276e-08ddcf852533
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.225.90];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUPR01MB11023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221135

Starting from CMake version 3.27 support for interactive debugging of CMake
scripts and configurations was added. However, by default the `nativesdk-cm=
ake`
is compiled with debugger support turned off. This change enables it.

Signed-off-by: Nikhil R <nikhilr5@kpit.com>
---
 meta/recipes-devtools/cmake/cmake_4.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-devt=
ools/cmake/cmake_4.0.3.bb
index 7d8b8cac65..604e306667 100644
--- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
@@ -43,7 +43,7 @@ EXTRA_OECMAKE =3D " \
     -DKWSYS_CHAR_IS_SIGNED=3D1 \
     -DBUILD_CursesDialog=3D0 \
     -DKWSYS_LFS_WORKS=3D1 \
-    -DCMake_ENABLE_DEBUGGER=3D0 \
+    -DCMake_ENABLE_DEBUGGER=3D1 \
 "

 do_install:append:class-nativesdk() {
--
2.34.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

