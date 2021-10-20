Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1EBC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 07:40:48 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.64])
 by mx.groups.io with SMTP id smtpd.web10.4847.1634715642636144651
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 00:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=h7FK6Cp+;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.64,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JUBfdX7Zbd0XSN87N9llpdwrTGyx68gQQuCi8WNakUC2Cx1JHgy3KVJtmW+PwX46JgWnzKCcVsNVLTMw4fOkUm+SM//ZOAC6YU5ZIpcujZyo9sTd/F7elv2axgTl9nx6CTk4tI74TrAWV2UnqdXEaQyLadG+3Gp2che4CQcwUZ0cW4nB6oBnTNVLrnPZyvYWcWGReDeKQ/U2W9Sqvvs/zHTlm0gZDTLYvAhvzhAZGx0ojKrXAWske/BPHva1DYurZNzpiO7sz2DIl7hoqhaTTofZCeJYq7vBjW/Qg/jUyY22VgrDJl3nU4aIxiDSRcYDWev4khe8zZUfQ0de5hgmbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhicfyhKkj2lNHWHtWqr9cnCb1Nx+zTx7+C3C4nl9tI=;
 b=nGUzaZ1i15NkgbYRm3+FlJ8qWivelhyMLpk0rp80z75FiYMb/06/Ole7bdY1PVpCD8bExJBl1y6fxnlF2sC++6pt1VHeaY2cVEawzkQW85iYZx2ifx7055RR0nh7fcXuzx1Qd5HW4SLgyKSdqw+ProKdyhtNw3L+l1nuJX/fxe2F12ZGm9MZmyUeApk/iES+07NQoaEyTrLBwtnDqDVtjqB4i5pccjgwH6UJ8ZMwUOlawWJvZHd+WQMuLVb/KKfReADumn74h2P4iesBkb0aF/6y0N91hIEABtaIMr8zRbawqIsHwfjwODEFUzhZJHTrwi9FeHTAZpY5yv6YiuWyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhicfyhKkj2lNHWHtWqr9cnCb1Nx+zTx7+C3C4nl9tI=;
 b=h7FK6Cp+PDQw6oNF8828fUKIBPJteE88dLeu7d8a4JvWkaneUFY/zINsEzu8X1F7ljTvlrIXfoty4c2BDMBuX2Td0k2YPv/hT38yX+k1pujbBo24kng8SOLA9WfaJViDzGvvND9JqhcGHlv1ieD1XfXc1xh3tNQ/K4C+U36mLTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PA4PR08MB5998.eurprd08.prod.outlook.com (2603:10a6:102:e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Wed, 20 Oct
 2021 07:40:39 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%3]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:40:39 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/2] npm: Remove unnecessary configs argument from npm run
 command
Date: Wed, 20 Oct 2021 09:40:15 +0200
Message-ID: <20211020074015.860-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020074015.860-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20211020074015.860-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM6PR10CA0055.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::32) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (87.129.248.106) by
 AM6PR10CA0055.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::32) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 20 Oct 2021 07:40:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6a282a62-b319-43bd-4f7b-08d9939ce9bb
X-MS-TrafficTypeDiagnostic: PA4PR08MB5998:
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB59988DB83B8BF815CABB693FD7BE9@PA4PR08MB5998.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8ZEtpCXrXdjU1hsQ5uNmo+GIoAWoDfiyMQk02g4DHYT/ykXyWCuI+ktO06xPRVC6biDVv9ewIF0TPkx+jUjpQDBgj0J9QdbiI3TUV5ab2VPFzprsxf+27SY5CQT0868aueR7jf4Q3U4W6slmLw8Cv4oaigRcrnzHfmSDHiHzmk6vhO1k3+2iFf2vO1SsTxsvQ199o8BbD5oD4aKtkhHErq854XGsYoIqSQBi+tWwqgH6/YUPJmPuZyPM6SPIA/jVDviZfCKQepaeQ6Pf09jUIa9Qya8lIOseDSGDXnMNgqHkWG5DbPItLfvr4hlgBohK7BKpEOIHN84bOq5l8H/SuSBbhgUyYHJuUi4fQEh+SmiX9raMHGmMJsNFy7MZMGCvpj50qzRwpxHcXzQ2M4I4RIpN7NtbLL3bi7siVrvH+GD4S8w4J84x60M+d6eaWq7cbGswQ0ChxNtTpk6gzvEwCeyvXyvU5El4bUN7MRFRoWrbsCty04/HjQOWeXyEsc5UiXDIGnLra/nBznB0y2RWncCrhEbYdhzl3x8u3+Yo/8lTpg+umeBKbfDa+4312nTs6Ea55p11BgsIVBUnK638r6vMHrF730tMNct3jygPwkG544pUyfTKqDW1wA0Ia2HqdYpoi9tXauci5a75zQu8d9DfReJOxdvt4R2epCNYHk2F9uZ6fLRQ1UwGOZayJPdfWM/uX5xi0G5+fwBPP0h0Vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(4744005)(956004)(26005)(107886003)(4326008)(508600001)(2616005)(316002)(66476007)(66946007)(66556008)(1076003)(36756003)(2906002)(6666004)(38350700002)(38100700002)(86362001)(83380400001)(6916009)(8936002)(7696005)(8676002)(52116002)(6486002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oFE+VsstlIc2jY47hOEsh3s/8UWimOfH7vfDc3Qej6A7NTV8v7oP3Hn/w/Z9?=
 =?us-ascii?Q?6sl6oAvYi3YS4JSxloOVX+3+6WaSSwEyRe+CbzRk50YIcme3hE78m2wdQXiB?=
 =?us-ascii?Q?GUuHPqyfYbjYIBTGWqOLAnTguATg4W0zIqHoLmqaRb6UG0pEGQ4K133GuMLK?=
 =?us-ascii?Q?Esfmpm0UXAb1DC6CaSPZIcUIcnhRKOBfXHx1TSBbbCmLPm/zTHht+vvqjjnf?=
 =?us-ascii?Q?rJSzPVVOhcXPULq02RZKcdRv6j+Q1YJEEIBDIiMqzcFtK8R/DP99KtHzz3ar?=
 =?us-ascii?Q?m2vROyKGoSLHkRioM8C1YOmhcHBbPitKjbvzuoE3bHUTagsRFmVuduXXbnyz?=
 =?us-ascii?Q?us8zd2F0rXd2lyhcUmPo62CHHysvZ/X/V7adNdtM9QdDieIpyjhmuVuX2+r1?=
 =?us-ascii?Q?tDTxbsCwAs2F20oa6PfqkMIsZOV1F4IaKYyOoEfYdGNWZUeshJg073DZ+73W?=
 =?us-ascii?Q?IDO9ReZjeOg3d6fzc7szeeuGfYdYLaFHFA+e2qDHIJaqRocdEfuHjz4enUC1?=
 =?us-ascii?Q?y67lG11SGEgJ3Huf/QZDOu+tL2t6xrWlwITwVNLP3jwnNYz60RvxrrRcgsxV?=
 =?us-ascii?Q?ugJoOQPiwin6bYhUyRG8zvgcK4TmnmHnuRaoIfR+suUBasPXcvFFmGereqzy?=
 =?us-ascii?Q?WobteUavAslkhgzj62rrxIK9oiF/qGToad2RgPPhx3As5ARUZPOCQNMKbsFS?=
 =?us-ascii?Q?2fwrYllWFs4K9J2WI5ADS+IMqrtl66JHOfwRwJSx7oP4qYKV3pB8Yj5F6BAD?=
 =?us-ascii?Q?FIniR/MrgnCVBxNNPzSQS7TQj2025ospp412cAbb4UGyMIqxQhd2tAfdeI2K?=
 =?us-ascii?Q?gbx/c2U+kck/lmoE0h63oe90I/ldN2rX6Gukig9+icYIByh2Mfp5SXgGKSm1?=
 =?us-ascii?Q?I+JtjiRysYD9elkzqJQIvVJlOdC67je0hJTtXMS00kTKqmUkyQptr2k5wLsq?=
 =?us-ascii?Q?wyn9OH8e4JkESaQ2qIPcMJR0/GGx7dtuNBjp7nxFSWBR9AOz+b/edcj3skRX?=
 =?us-ascii?Q?COZ2+CO18cZRi09Eru212JvHadVPUzJ3WNta+7KfmLlYe3Q4t9Kj5Vi3H5R0?=
 =?us-ascii?Q?Z1VuGz/f9JkUw+6w8rO1xRl9Pg1j6fYSL0d5Q9dnNEcd0t/vMlAGqzSFxPKm?=
 =?us-ascii?Q?2wZPAYBvHCH463HfS+l0CmoRORO4rmWUx1Fqxiw4uOMsUDR03Zh/ZWm9Q5qG?=
 =?us-ascii?Q?KGSo45dpMWGiaDXGFdSqpFAXaLp7YdyeznlfNIKzJjlsPTwZ718ntX0hHFBC?=
 =?us-ascii?Q?V5uSDCclT3p85FTFfR91Xe2ZHwNLhLKSsvWkmFXsQKS2hi49ioMKAcmfy9tg?=
 =?us-ascii?Q?p6QJQvzcII8FdnV3HAJHYSQrEr6OH/jaTNGcT96GKxW2NFDjhvhdlhTcc2cV?=
 =?us-ascii?Q?4X1wHcbcBwbiH3rBHv9xtZpZEnFNyN/i9waRT1+aF8Un9pUg89xyEdvQjPc4?=
 =?us-ascii?Q?VijbOeGYDSYXHYWgnKuNKjJwtSx2PtnF?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a282a62-b319-43bd-4f7b-08d9939ce9bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:40:39.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W991905@weidmueller.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5998
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 07:40:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157251

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/npm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 547c531883..ba50fcac20 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -259,7 +259,7 @@ python npm_do_compile() {
         # Pack and install the main package
         tarball =3D npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
         cmd =3D "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXT=
RA_OENPM"))
-        env.run(cmd, args=3Dargs, configs=3Dconfigs)
+        env.run(cmd, args=3Dargs)
 }
=20
 npm_do_install() {
--=20
2.20.1


