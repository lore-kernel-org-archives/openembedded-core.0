Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21809C433FE
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 10:13:57 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web11.9805.1633601634610414841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 03:13:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=vKCmdFJa;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.73,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqqHYQ6oLmXM6cfOMsk/Th6bbtTrUhR1dPppoI1T1FOfmMXyV8EydCM70we0+Eqe76O+mq1jC7ne5Fr/Te26ubcJFmPiiuDRpWxyicr8MLVUDxqXAcq96WrPrEmsQB4cBDLICJrXENxDWFNn2n2U1fgulQOo6N/Zhf2d0E7eEYA0FpjNnWjQrrfm5WUMvAkjg46I0YJHY/ln6lhaOmopPDRnwlMpXDaKl9aHzOfh3s0yE3vrKEl8SLUfEOrK5/oy7r31p77fo1nuqiZ1HOzkJFqExTHr+sP/e+PskhXEJSr/tVSDRoPwn1+pNYpzTilngsJT+jtIQC9NVJTksx7l+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ro8FPtfQReypgycs+Qvak85Qw0H7zay0PRwVpn69/SI=;
 b=JIxZTxgacjKEpi6IQjCkD45ylDpPSDfAXpF+wfAJ6e/EzJEomUMeHS5Wkyty6cOiUEsK51W2Xz8vra2CNV0+A7Zd4RahL7U/M89ESrvDa0JMwjnQLu8SQJqQjJNXc7d4vVJXwPyCsnElFewGqiJeNfbgGmSK82u++1AohuObBes1qaMub155d6BASQt8rw9iTfLW94MchnbVf40mBtrsp/MRAg3BKMupIOkE20qJFg5lCIKwWsXpvxkkLxPq/HiQZBrWelV+Sc0SxbzhJodrLxPuPeeaa77LJKCArTVDFpqzs39HIOLje8gw3nGEYNcjAO5gBV9rbNM8B/k4gSNrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ro8FPtfQReypgycs+Qvak85Qw0H7zay0PRwVpn69/SI=;
 b=vKCmdFJaAzAZcZm1V/NOIRXS5ABeawwW3206jSTnKBqraNSiX+aU2/1U4jd66MbYCHYheZdfe2TjosWk/hZH/coTTJCpEZ2NzD769fGpzAhPXvXvXZVHgIxg1fcTMNswPrP7EjOrQwqgeSxY92Iz21Vmy+Uvep4phs5iQQ8DOzo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PAXPR08MB6367.eurprd08.prod.outlook.com (2603:10a6:102:df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 10:13:48 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 10:13:48 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 03/12] recipetool: Add optional licfiles parameter to
 guess_license
Date: Thu,  7 Oct 2021 12:13:17 +0200
Message-ID: 
 <20211007101326.11075-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::12) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from DE10512.weidmueller.com (94.134.103.254) by
 AS9PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:20b:464::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 7 Oct 2021 10:13:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd328f33-5aa1-454d-f141-08d9897b2769
X-MS-TrafficTypeDiagnostic: PAXPR08MB6367:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6367329780B5ABE9441CB050D7B19@PAXPR08MB6367.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DKoIW5+VnYZAt4rCJtIY3MFTR0JoClO/BWl4/rrzrZUkPVGbgXdCIpvSUrt6xQLumNVB45X/n+PHKQzU/U7/N5Wi+4TEo7AKKlEy1U2TfnLxsVs5obsiBnEzUBvafrGAg4/JbIfWYTKY2GvCPra367aAT1rWljKrUc8uNbX/CLdfrXL++0KSgtSwGUTpXADRUbPYodvd1+g4zynHDtheUMnvLLsbdtmo+NAS2o0do3g5EJ4QLYlv7PkBU0863nTb3uQotqkoDZSk+ydWn+p0qaqB4u1VCIO5ZnbjMrVHv+VhS1uzC8KkCHlrqJr9O+7twlOeUMkxp99ItdNZIlwLAYxa5tuyg8df1jKpZ8/5fJYm2EOAmrgXi13Z70+dQUNZxzEqUgEO7N5eA0G5L5vI7YEuXRa8R347VKjKqAw6yReUBihqfvTn7/E/1ErLWENm9R6ALe45Jp/F/tiD7Nx0Vtdo8FgpG+OplUlU+BV/KgIpB4GwzhS3n/A2cd9sYhLz4EJ3UYUQn8tdTM4Cm2Txs4h97JjHNzko0/C2EXuUDVT26fGnxdtnccaxb96wKCSck/lMdUnwhQVwl64A7zkVdS8MHKnZD5rYETIaWJVUCN7axN1L6IDv0qme+SJVgKilyKNT/IJYdsem09SdLfr/mjTow3mw/B8zPVZzgmdhOMHIqfvTE0BtXcemwD16pKQfkYEHlHDpuTFvmVIppZ9+Aw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(186003)(508600001)(6666004)(316002)(1076003)(66476007)(107886003)(5660300002)(86362001)(6486002)(6916009)(52116002)(36756003)(8676002)(66946007)(8936002)(66556008)(2616005)(956004)(83380400001)(26005)(4744005)(4326008)(38350700002)(38100700002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NS+Jw6hlGD3xf9RQZOjuRHW5WtJMxYo0Ey+/jt4knpd5lFFbILEqFXSvMEsy?=
 =?us-ascii?Q?EOqCHuY0Ij37EH+TXP/RoNUGQ2irvEMQ25bEAGFFv8DT67OZ7JydAVVSwGI8?=
 =?us-ascii?Q?Xc2fr7DX7VyAWzsci/j7g0t+K/TCf0wA4SlfYLOr9eleLfFkSLd1qb1Ou1Jp?=
 =?us-ascii?Q?uAKgv+BwkkEjwi47WoWlAdY35HH6QKaYM4EZDS4wSh+Jsk8HeNV9xZRMahE+?=
 =?us-ascii?Q?ueN7Pc90U5kUx43zZWexU6O6pf0E24h3EeGFvbnhf2g59QpJe7VheRF5Uyeg?=
 =?us-ascii?Q?8kwvpf8Fjb2PtUE5ZWA6UfNjwNp/fOVzlcXMkH4E55ihCubEzWAkCVfbyVEi?=
 =?us-ascii?Q?CPftBPj6zhhxwpDWoD63U2JJ9+IdGP6TOR/LGNweaqfcGm/oyiJ7S+nQVZag?=
 =?us-ascii?Q?gjBSjfnlORuoiKoruSP7bdz25aVkVFt75It2ZbWTPdW674PeiLrgxjVgaI/4?=
 =?us-ascii?Q?hxLYca3NLwJ+av64C1SdlMbuTp43V1BITIA+hXl7N/bYvWhOppzEqxp6HbZC?=
 =?us-ascii?Q?utcj9mv4rrrFyXPo3o30ZSuKOoznkBfkJdrd+Q24qH9ojexEmxmjFZAoDIak?=
 =?us-ascii?Q?LlktAwKkw6m5WXAf8LuX5XICPwWcWkmIZdUzO4Ok7x1lX78R5VWNQMqEFLvy?=
 =?us-ascii?Q?xfcFoMUz+VqVk6GGSkPVt09Qeia3UWOpSX9DnOXiU7DVptRXgoNHj1WvGqPP?=
 =?us-ascii?Q?51iW6tXva35JtTInaGCOz6icUr4sQVk+IPZWYHoBlmLE8TcNKCTTcsyHRbgE?=
 =?us-ascii?Q?TsbP/F8XR/G+o1G9udUb3xcXHvq+8FhHfRAq7of55D9WD9KhKffnlVSteV/A?=
 =?us-ascii?Q?cDqJ/yOpNk5XtyT2mmZxjZhDQ0z8rPlbYKO8HQyZY2cmnFsLO325cSFtp+JC?=
 =?us-ascii?Q?TDdNw3OnJd7uqthCddwPdmxrFbHI74eDEW4TNq+gXNCrQv+kjmilWhCAEIBq?=
 =?us-ascii?Q?2j41cRbu7zZK3tXQ7wq+sSLKPquX82w+AAmBdZ3fgMR0Yx4aoaakQkUpyGBU?=
 =?us-ascii?Q?g5ZO7dkPKg2LvVPby/xJzaKp84M/XTYyVxp//FnT8n/Y0UJ/mES2jWS5lJ8y?=
 =?us-ascii?Q?RBOT4SfZo0KL7hPn9YKsqVoXErVu1PLjB7k3ONFlM+Kjw1m+XzA8TIcjXxCl?=
 =?us-ascii?Q?3lm7LdbZ8ue5im3/CTS6PyvOMrLKbdz9yYGAkr+zlO7owL9Ces+7g7AHmhvp?=
 =?us-ascii?Q?RE9OX0+PFW5sz4ipfoLZ3qMyL1al/NzOixjIX2bjkoUrpQieTNLxf1GTtaLf?=
 =?us-ascii?Q?m5gBytMkvvm79YdwgqNXU7SEqS7snwqojy3e0lfoRangLigh7+sRRPIIR2jp?=
 =?us-ascii?Q?UIpmdr+7vrn8vrAKrdqmLsgM?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fd328f33-5aa1-454d-f141-08d9897b2769
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 10:13:48.6187
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 VMRvCK41GNQ4s6rFctVhbOYvpRvR+TEu7grvSNAAY14yz1Nh43O1J5zGSqJY3N/h/Ks76TyXk5d1egORW423XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6367
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 10:13:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156712

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 scripts/lib/recipetool/create.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/crea=
te.py
index e88a4253da..3bcae962a8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1105,13 +1105,12 @@ def crunch_license(licfile):
     license =3D crunched_md5sums.get(md5val, None)
     return license, md5val, lictext
=20
-def guess_license(srctree, d):
+def guess_license(srctree, d, licfiles =3D []):
     import bb
     md5sums =3D get_license_md5sums(d)
=20
     licenses =3D []
     licspecs =3D ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[=
Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v=
10']
-    licfiles =3D []
     for root, dirs, files in os.walk(srctree):
         for fn in files:
             for spec in licspecs:
--=20
2.20.1


