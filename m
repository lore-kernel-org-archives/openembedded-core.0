Return-Path: <olani@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AC7C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 11:25:56 +0000 (UTC)
Received: from outbound.mail.protection.outlook.com (outbound.mail.protection.outlook.com [40.107.22.70])
 by mx.groups.io with SMTP id smtpd.web10.14086.1713957949260088855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 04:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=MKueWBPL;
 spf=pass (domain: axis.com, ip: 40.107.22.70, mailfrom: ola.x.nilsson@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrZo1TFgi2TDPqc9h1d9jE0fJkGjrfae+U7sZXTmvW7ZxxVpPbFzW2KJR6dVhCQMwyChUoZCVqmx6ZwCu4rV4Jf63VztZE7KEWBaS7FiT4Zd7okf09dk4J4i+cmafqLxOZmTgqu5stfrRsXWPYpzU/i/kdKmBkGPZ0ozlYf09BIKKEzI6KED2tx29JSI0F25yYg7n46wWZkud0k5wA9fJEgw0tzvNrJ4B0e+8Q0AT/AV2q7vvUevJpfu5qke7LE/LVI3sgDWNS+ehBv20N8YhomI7xV2WrtkRVWvuAMA1ppp3fKd4bQhwbei3HA5ZDf1gxcNLeuPXUms6Ib2AaPDDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQGSAD4PBUH+LlSzZ0zFNErmxc3CF2hVTVVMBauP2yA=;
 b=JSI2xkWP/Co/60XzqMCVvbTZpONYPJiUToMHZ8KBVbWZG06b3nYcxm46q4uUecx2WZuWb5mXpqztx4KOziIaeYkld4L21kdtPQu29RQ2eWrTMFUbU24ix9ojH0/zCypx41LAfpwbtZDt7708hGHNHQLYPIpmkl5FYVy71RW6WfdP+y/6/Y3pavTNgZRLUhfLGowFD5M75dXbYb5HOjtM7aZodwUmKnpkcENIjbhF6I040a97V5pTSmzOF3UxchJQTg4ryKzHUJM94iCtkBKOrSW7XWDdtkC0A9EMer7cavQQ5XoFlrSy9GcIZtKUf5h0nVHOatcHzZvRhLJJGDhwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQGSAD4PBUH+LlSzZ0zFNErmxc3CF2hVTVVMBauP2yA=;
 b=MKueWBPLjQi97fAF83cjNQGMPMWMd6KsB9oMgj55rZocAcG9hNyW5NocCXMcqoJd+qm9cGF64YFiAgLZaDeS1dVpMol4utn3OuAiM9EZLWB9nWR+alsbV9OisSt9jfQTcwbvRLCl2TxvxK33SbImw6Z6WCLIJ1RtlH2Lx7wMZTY=
Received: from DUZPR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::23) by DB8PR02MB5865.eurprd02.prod.outlook.com
 (2603:10a6:10:11d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 11:25:45 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::8f) by DUZPR01CA0117.outlook.office365.com
 (2603:10a6:10:4bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 11:25:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 11:25:43 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 Apr
 2024 13:25:42 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 24 Apr 2024 13:25:42 +0200
Received: from pc58073-2410.se.axis.com (pc58073-2410.se.axis.com [10.88.67.1])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id DBF9460F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 13:25:42 +0200 (CEST)
Received: by pc58073-2410.se.axis.com (Postfix, from userid 20853)
	id 5843A410EFFC; Wed, 24 Apr 2024 13:26:10 +0200 (CEST)
From: <olani@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] binutils: Remove conflict markers from 0008-Use-libtool-2.4.patch
Date: Wed, 24 Apr 2024 13:26:10 +0200
Message-ID: <20240424112610.929407-1-olani@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|DB8PR02MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: b1ea2208-c98f-4dcf-d13d-08dc6451478c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ivUKezqX24GYG6KXS6fiOs8SIti4beBt8VA30EpXWlWBhoqLWcNZ+XxZkAw1?=
 =?us-ascii?Q?O/YQck9aYsq85fGvP1MDsOabQKKePl559gT2+/e7pipqLZUTvo/1NY0b3inc?=
 =?us-ascii?Q?Jgs//9Si+KSsiWJ8IViNXL4jn5WEVw6/buZNy2glZ4pvom9FPfO0DGjIwcRW?=
 =?us-ascii?Q?PkbEQy3pBgrTmBr299x+rK0tpTxONECcUO/8+glXxT4soM9w0ETbwmnMD1pS?=
 =?us-ascii?Q?Ku+ViMGGX6xmkrz3+UWmsEexnf+NNYU877SC4X+Cs6j05wRVQIx/8Ay14UFm?=
 =?us-ascii?Q?PFNlLOAQqU6qsqNKNMeKb64981eZkPeMJPiQn7UJVf0JM8/+8aABttuyEePS?=
 =?us-ascii?Q?Pq9LN6SqXCksjyQFUs6Ay8CAjzZV7/ykT4gP4vItjgxzx3MzBeqNyxlCyOka?=
 =?us-ascii?Q?hP8ekyQyxKUf5DTGBM2rbgEsHNEdcKCWypTBY8ITxUsphCW21C77pllHC0zU?=
 =?us-ascii?Q?VLENENpAXewHaHuQxYza68kbdFhWC54ImWh1sevM8P1lYpmUKCiILPTqaA3D?=
 =?us-ascii?Q?fEpxjG89uWgvCR2exGno3sfctlnVlDzc+OQrPw2F2v2Xs+7OLwL4JtEbOPyB?=
 =?us-ascii?Q?ZHoBPtDzWqXmgR44nWbbd/7JoSyN3nrSOHVVP88LI9ncoT633boh+qmfytKX?=
 =?us-ascii?Q?7O28THk6yAI92c4mZe26sejKl2MJP0uB2q359EGrV+7Z9b1ZtJnTr1P66JMs?=
 =?us-ascii?Q?gzED8Cf7qD2acFhTFo65aYvZ9a+MDBLZrfLWFv8ELl3HWVqIVoQ2eBw5mB75?=
 =?us-ascii?Q?5ImsNt43RO3hecZxjYpNarFzSL6m7lXjxJ2KSyoCQ+eDFmfdVPnwVLKnKPPZ?=
 =?us-ascii?Q?GcWc7P9INdmKoiVW3fTMz33ebmV29FtpDr1Z6nU6sTBKj0bz+yYC7VarrB2E?=
 =?us-ascii?Q?GIFPQBpbPIuRBiPiRXS8XSkzsiVY/s3mPhU4dR7xaKZ2RYWDYjPHXpV5L7rG?=
 =?us-ascii?Q?kGrY0NCrgaYng6jhWe45tYjtPXaGdRzOfIVgxf8j/B6dCqsb0cINOVO/2yfH?=
 =?us-ascii?Q?dtO9/BDcz8dVTKIV8PpSofkg35Q7cEA+jYtulnIaWiFVGRWn1opUOLx9+WQu?=
 =?us-ascii?Q?nW2jFrlu2JL0PLyChA2SElr8PR7KrcFF9ibbXkgdqadTPQj2kyhahu8lj+Wu?=
 =?us-ascii?Q?BimJVukXE7Gnq+oagY7mfSVgH8ioIAy8f0vtgBJRm5uscGCZob9VKmsdygUm?=
 =?us-ascii?Q?qXiQg613OklFxhUs6JmbIDwCohfoGS58hhCKuhvaSRMMSCTqJ8bHfa7nP2ji?=
 =?us-ascii?Q?mwlt4uthHyZqqyht60jNekrgJ1qt6/mziMy9fjxf4bYgsYC8MMdCfU7Njgb3?=
 =?us-ascii?Q?xZfvATrYY/wfvcixVLGg7DcbeE/f2UxACIJFyccICbsJkPDmDnZr5PVwuCGf?=
 =?us-ascii?Q?1EqyflRTSpjQMDcOw0qdrvJXhB9d?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 11:25:43.4057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1ea2208-c98f-4dcf-d13d-08dc6451478c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 11:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198688

From: Ola x Nilsson <olani@axis.com>

The diff hunks were not doing anything important, just remove them.

Signed-off-by: Ola x Nilsson <olani@axis.com>
---
 .../binutils/0008-Use-libtool-2.4.patch       | 24 -------------------
 1 file changed, 24 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.p=
atch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index 8f74c639d5..05f1ed0dc5 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -19543,18 +19543,6 @@ index 3701bd8e796..9e36ae7c51c 100755
    # FIXME: first we should search . and the directory the executable is i=
n
    shlibpath_var=3DPATH
    ;;
-@@ -13596,7 +14245,11 @@ else
-   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
-   lt_status=3D$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
-+<<<<<<< HEAD
- #line 13599 "configure"
-+=3D=3D=3D=3D=3D=3D=3D
-+#line $LINENO "configure"
-+>>>>>>> b932158cf4c (Use libtool 2.4)
- #include "confdefs.h"
-=20
- #if HAVE_DLFCN_H
 @@ -13640,10 +14293,10 @@ else
  /* When -fvisbility=3Dhidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
@@ -19568,18 +19556,6 @@ index 3701bd8e796..9e36ae7c51c 100755
  int main ()
  {
    void *self =3D dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13702,7 +14355,11 @@ else
-   lt_dlunknown=3D0; lt_dlno_uscore=3D1; lt_dlneed_uscore=3D2
-   lt_status=3D$lt_dlunknown
-   cat > conftest.$ac_ext <<_LT_EOF
-+<<<<<<< HEAD
- #line 13705 "configure"
-+=3D=3D=3D=3D=3D=3D=3D
-+#line $LINENO "configure"
-+>>>>>>> b932158cf4c (Use libtool 2.4)
- #include "confdefs.h"
-=20
- #if HAVE_DLFCN_H
 @@ -13746,10 +14403,10 @@ else
  /* When -fvisbility=3Dhidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
--=20
2.39.2


