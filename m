Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C91C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 10:54:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.102])
 by mx.groups.io with SMTP id smtpd.web11.69283.1723546460138523192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 03:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=EoZ9tuEI;
 spf=pass (domain: outlook.com, ip: 40.92.91.102, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8k0Z0phNpHqgtJOHcSZ9YRSeGILZSrnKqAAaSBYJVZXB6VDLVwykvQJYR6K773W5haS/YmlE+6cCwg8leP4NzBk2/68f2z25WGAt/LuZpKTsrwJqN0IKAD42Dyvjr6tG19HIgCTGsX9ft56pC1hMiK3xP0deBui8n2BQKidKajwzsd8PIMvH44xYphYxi6broJvK13ODwOB5awi2n8mBKzfpAvJHEpLjHDaBqJM5r7zKg8sugCMa9r4nMYx0lL/46ye2euYM5WvSpdsPS6CaVBcTRiOVaPCM6PJsiARxt9eZIK4i1aefVPsNlU2dxCOhhuZBuQ4ORHSW3yNZRsywA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22/7ba2lcIMSbZQpzOdQAUrnvK6YMmxyjcUx/xwDAvU=;
 b=rEa2XXBl2JhrCHWC0yMBRZI5c/sI7LYw5TKtCPMqMav0w99q6xy6B1GVyhnahDIUxYMnIHsjfIiyPbPEk38OBOUiVXXcXEjv4cxUWNnB0OJypKcKxZujaCZ6dp8TEI63DqFhsFWrCZezNiIAHUNOKZ/WO43nMbzVWhsDGXRbmlWuvHMnlSoacpeQaXs4YBpSBQIvHzlkEjZm6L8GvdTYQepNOWdjTggvSos1YQA0TldCdYZw9lF2tX/Pfw6YSwyRvtdyOURt1rw8QG1MGfitLvnuMIxY/Azwdv/Q57teD85SPwYV4K6KtMRZ++cQMnGrFKeASMU/rZdWvO+lypQjWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22/7ba2lcIMSbZQpzOdQAUrnvK6YMmxyjcUx/xwDAvU=;
 b=EoZ9tuEItIPgWycRD6+aOXyWgnCFHWj39y8J/S8gUNFh3Kq3ZcNbf7lp0QFNOekbbR4aUc6WvfHB28QmzTwb4vyIlIaNR43BQ8ybIuXGa/PY3537MiPP1l4hgonAevdTlBQXFvWY+2c1bNBcwA87aN/aDb/hUGq7bTVSIZX0qBifqxIc/LbETN0zGPD6Ssei/QCpp641OKFwfZ87uX9m5Px3yjqRnE4+H68rjFVZu69Rda4G6fInrIfKJR/vYxkqKpsSuO2uLEcbN4ZkAUVMbVexR0gBEqXuOyCF+5JhmTTGyNeQ+4RXNrFf6u46DFSu93bCbnwiXYultBtDZk1BQw==
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com (2603:10a6:150:80::7)
 by AM0PR07MB6274.eurprd07.prod.outlook.com (2603:10a6:20b:152::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 10:54:14 +0000
Received: from GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a]) by GV1PR07MB9120.eurprd07.prod.outlook.com
 ([fe80::a630:7019:63e4:a48a%4]) with mapi id 15.20.7849.018; Tue, 13 Aug 2024
 10:54:13 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] python_flit_core: remove python3 dependency
Date: Tue, 13 Aug 2024 10:53:57 +0000
Message-ID: <GV1PR07MB9120194F04D64A9B122E4406A8862@GV1PR07MB9120.eurprd07.prod.outlook.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [VaTxZzjzTo327CCttwXgHplqhzsro/cUuzla3FSlV3Xm54mjbaWT4181nXcKiMt0]
X-ClientProxiedBy: AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::20) To GV1PR07MB9120.eurprd07.prod.outlook.com
 (2603:10a6:150:80::7)
X-Microsoft-Original-Message-ID: <20240813105357.9328-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR07MB9120:EE_|AM0PR07MB6274:EE_
X-MS-Office365-Filtering-Correlation-Id: 750299ac-d809-40af-98af-08dcbb8644cd
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|19110799003|15080799003|5072599009|8060799006|461199028|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: 
	EpikruGRlOxohqM1nNBDLcDPd0/5gfu1Nt/DaSSq/JXUHkT52/NTLr1PpQTwZMqILrbA4ttxAEDoxz96LpVqj4a0WiLFnW8S21gxHhM7+YzsTCscOxXRnKAF3mH2gP7Uxmipy59oiTpJ33gSE/O0vNtsZIvS/a9GS+kvr47sNJdOISRerHfMxrCiDRK7DuCnwW2JUosBR986NWcMuzPNnrDKYgDs3MZNIW5zpfvS7GALgmMDv0hVGbbheuQwFAamS4R3SJ8KPcolHi5viQhpav9yrAZkZyKPxiomxEKnsBdg6n19Cqd0BdDowOcnKJnDIrD3yI58PLvm7Gb7yqIPxKCx5EGxuQvanluUvJqRgTVMZCNXqAlmu3oQzQmrH1rsNKZ20TYg+b1/ILddua0Cbs9Eo3evsrZ1sqvl5/pJ5r2mq5O7H4S7Wz0h+wSZ++Biva9Q3J0VSBUQVU7Oentt7XwK4nHYDxLrVn5A5X7lwrIfGCkAfMIGefSiarYhYm65r2TTI2LMDp/q+lkNnmn0GprjUKUcBXi6iL7t36c9aYqbS4VzFohFXNlkDVqN+02u3lSeqGEV03JRMM2humWfY9opH1c+ab9rfGP47jeQ9uyLw51sZBO8OIHf10pSOsg+L/7B17j1HiSLeF6ZCqmDhQ+4u8N+3ngYGSZKRKQQpee0wGmEagDVqcO46mJos7LVsJiyarjplv0ioIZpe4MUT7Fnn+RhfbEBgbNsfgWuYjg=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?drZjujnAlwFGUr6LTF3NDsH1vzsMglXLbsCZeZQaM/YHxnYYFEeqkur/BJBR?=
 =?us-ascii?Q?FY++si7jkphFRWG7YvKqIvAyAfqQ+tERIsGN9TJacxUooidcU7P8xsuf2Mm7?=
 =?us-ascii?Q?TBvlzCTGEiTjqExZbBJUl56UKnDUbWh37T6OdfAgg4c7PTnxT9LU3TBiU2gu?=
 =?us-ascii?Q?LR5f2BjfevS4BAbK1NAVwj1b/qk3MNRTCDTrnikk8ieZ+yiXcx7FKs0Qti3v?=
 =?us-ascii?Q?4FKbbRbS+nPI7czEcfbI+VhAyz3NEyOTXPcD62zXesGymqSqo8+Z2wD3TdIA?=
 =?us-ascii?Q?vtKnG/e8sLlgFq2jDXOa8BhP3ogCozu1/hMNXxfkKhaDFxqcHSbIEZgcgD9/?=
 =?us-ascii?Q?+c5MyEnUPcZWK3O4mCHeIU6nWmr3yTWIR6kNKL4XLkeAyBPYB9MLOLt/XRLE?=
 =?us-ascii?Q?YxVG3nhE5g9YCQlVypE3lKSe4gZQspP2X/VjOB8LsImD2AeWbZHU0F3A/Gx2?=
 =?us-ascii?Q?K6FQaz+3xVPjUCQ5J0GayPN/sOO6zHe0aF3+0uRqHhVHIF1ZDOWYRhP4PIqH?=
 =?us-ascii?Q?Yi1oSs81g/MQrbbUUBdD+w6wNCsg/zE2DG0as+/9LguFeiDKdgVHi3r2soNp?=
 =?us-ascii?Q?aDOyvnq7P1bgk5cZ0SPP0R7GBp1yqyxwCoGAgEWyiHq3zL1RQwnwS/1dH5qn?=
 =?us-ascii?Q?X5PEZi0bnTdOpH3VeJb7AW2oQ+ETT/pfrkD2xkcpOV+G+l3613Rp7CceQLLF?=
 =?us-ascii?Q?E22aThO6T8xD4l9f+j9Tt/H/IIOxW66AWKHpj7N/ABcKJOJkpZJUE9b0uhyg?=
 =?us-ascii?Q?9AbqdY8loeimNUaVsACjBi87aMbSuDlnUXFx+hP389vb4upJ7Wra0Dm1bVPb?=
 =?us-ascii?Q?M0RYS0cfDFujPnBnAl3XYnN2hPxqnYyq3YiBcshE+67INn3SxXc+M4Hbw0wb?=
 =?us-ascii?Q?34MQT6k7QgVdgcT85hg5Y5ioSuZV3JPsEP/OylY0Mq/qzPpOFqiFdl7drSog?=
 =?us-ascii?Q?d1O1FZHc4Za1R9wvpoJnH9eBX7qqFJXfrLwMjrebchDmtA3vYKITNYQWby1n?=
 =?us-ascii?Q?qJBT6CPANf52r5Qn0fKy91hn8ZF+hj5Y5QDIZzEk5DoTMKWM8Sg7a1fFcOC5?=
 =?us-ascii?Q?x6RdGbkW28/T8G/NR4+fx72kD+z+WqR1O14Vu/HPLFHUl/lbc/0kIVklFh1Y?=
 =?us-ascii?Q?reg3HR3OeUd1Svj50p1sT8SGN9QQAjWjKoR3Opbh3Wgn7jMwLI0BD+t6AzIf?=
 =?us-ascii?Q?ucxwA9Cz+t5hwd56D8rxP+4H0Kwlp/sVAyG/2B2IGhzzW6diyeFLJqd6Dgg+?=
 =?us-ascii?Q?Acy0XQDta7iN7JR+723n6/JcAnbxfVTerwmSW7HwcDmaxS5oqUsAjzSX0qoH?=
 =?us-ascii?Q?XZI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 750299ac-d809-40af-98af-08dcbb8644cd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR07MB9120.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 10:54:13.7646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR07MB6274
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 10:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203262

as this is correctly set by setuptools3-base already

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes-recipe/python_flit_core.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_flit_core.bbclass b/meta/classes-re=
cipe/python_flit_core.bbclass
index a0b1feb70a..c5480654f3 100644
--- a/meta/classes-recipe/python_flit_core.bbclass
+++ b/meta/classes-recipe/python_flit_core.bbclass
@@ -6,7 +6,7 @@
=20
 inherit python_pep517 python3native python3-dir setuptools3-base
=20
-DEPENDS +=3D "python3 python3-flit-core-native"
+DEPENDS +=3D "python3-flit-core-native"
=20
 python_flit_core_do_manual_build () {
     cd ${PEP517_SOURCE_PATH}
--=20
2.34.1


