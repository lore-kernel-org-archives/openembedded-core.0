Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD56C02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:38:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.102])
 by mx.groups.io with SMTP id smtpd.web10.48044.1736869106533705878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:38:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=TkD0dHep;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh892suPKjtz4D6SLbrij4sNr7UoVbjjAmwLBBeIUFeIQvX6dk8I8+aX1V0eYBVyNnUZaEKpCmnKarwuyw7GYwU9tI3Dp4v9fPch69lY7VXw7i+1uzDFPY+Vlh/sNvMeV0tJIug3th7QWYNrRHP1OkDwBw3mVRT8viZH/wi+fALWgHzuNlRYYfbKdzBu8dgQS7XawCBDvrZX5XXEABFbxJCf8WzVA7GsP5gK8R9UfcOfte/x65A080abXof0nNjrwBGk4V6SDqr4ZW/9l+TtUGT3PqoLhpUo9GFUa+ucAoi5vy8rtkd8O7yPIEmmS8MMjHS/rsbrbWhiPU5NlwnQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ughvRDeE/dLVN439P34FOiNfL52m8JbjKS1QrrTvV4=;
 b=wdFW6jtdjw639vSJZexZZjUIuaNuANDSO+wGnsOgy1ihRMRmv8YtIXJJ0DGwkUfEQQTdNPDB9BRA3fPqMfCaaT5vuP9D/6O4q5km+vdnG2d04COpDhXUALywNyKlUZeBlnG7mICFJg98WqSZ3X6Jw2GQ8bFDEg2+ccam5nD19HcfRPDXAX+CfKkauXrZSfSb19MwpBxyCUOVNxX4EO1OkMQJA1oC4ZTBFiaz3aSARYP49CrHh5iuOS2PIH8DAJYyHl5L+3bt85fVeE92pXKPBKRzA+X4cXHz+7vL0P/uzzubHOqyITiYQtxE5IQ2howTtsjcW9im+Q69OptFIL7Sxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ughvRDeE/dLVN439P34FOiNfL52m8JbjKS1QrrTvV4=;
 b=TkD0dHepKL2k0qcP3cUImv+h5C0XiX8S9kj2YCSnfQrcL0QRnUdUXf/Mjo3hgzt4PgqYixJG764xCezx6vZOZpTbnrM0W+SdkalKgu2jn1xso/yi59U7HklpinrSxxPcpKtkEGYGKPSixrUvYJqTZ4u5rVWqgrPsWnEYGLgXJRV40NKnl6gmCZUkWPwkOSQ7bUhzeSZGEYU/aCZ9s06DBfPKT9DnBa5ZHT626QHbGmtJ7G3pdzNQx9YyiG0M4meCvQvOU/7O/ajHbXGjllu4j3KGWHgjQTKhlGHFXbKBW2o1zfY95loK3FvTC/EiyLPWrSozGSNAMqEzqdvcZH57Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:38:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:38:20 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/5] vex.bbclass: Drop redundant import update_symlinks
Date: Tue, 14 Jan 2025 15:37:44 +0000
Message-ID: <20250114153748.2358116-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d841116-e665-4fd4-0935-08dd34b1791b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hOKvPjQplO1m2QRDg6wioEOENwmiC4HCy5oj+tk7215Kumnf95CJ7zFNVS5R?=
 =?us-ascii?Q?+HiJFMSvDap9sYE6BU2nz6y86lSSPnIyqv+K0480AsqgkSMe+wKftuQCvkw1?=
 =?us-ascii?Q?sAoCTcmgT8RYlIafAnBkHKjQ5jHN6o4fFGAQ227nPopTsIL34kYZVCQDur41?=
 =?us-ascii?Q?e2uIjPsWL2AgvHaRFpxbC8ap4JOFSAztbO1Wrjv+BkqUCwZttRdNk5SGh17m?=
 =?us-ascii?Q?0LkH1sd2zFYQJYagInCNLqeWmo/sQZ64pUxQZVaTpzE8BnBhvwiOvMI5/bHq?=
 =?us-ascii?Q?duJaifeP/HSd+s99ugBfu+j0SWQOVh5RKAaKCVXJD++bCywVVIiVMXGgy5r1?=
 =?us-ascii?Q?sIapCKs7FD33LREcdhVjSAarZPtvvIxZkVrRP9sfkGO/l8an9xt9FXxJApFm?=
 =?us-ascii?Q?MdDXXKKe25iXmKfWDoHZh6U5Zbxhw8KuZFGCLeYZwCuEq6QOVUF+Y4EGj6mE?=
 =?us-ascii?Q?jV8rHEzsWPDjePuvMAywtJY5MhNCN5eH0wM9rDm5PqTEnb2/Q0gk4oVVr9Zg?=
 =?us-ascii?Q?krDsG3EEYLpiW6NCB4/s5nQZ6T695Byp6Obvya7ztMcm/SNWgpSyoNViU414?=
 =?us-ascii?Q?cYmLQ2NapvcDbvcIpbUUOCh+pKSAYaxjMSmo6cbygeK9Bn3ubEBC9KGZKcOF?=
 =?us-ascii?Q?aL9riYSQPckGaHpgzRxMaC3d3paaEi5ezndK6AnXGVjjk34eiPHzunKkEoJ1?=
 =?us-ascii?Q?nah0lJYTDxB6ONAJB9/Q/YTmfhSy86WLnlJvPbhq0CajouOCefkGT+rnX+O3?=
 =?us-ascii?Q?ZSs9lF/88bEzmmB0tvKxjnGk2skYmLFRU3gyoGuSrzZVhbXriPo0Oh7o2FPj?=
 =?us-ascii?Q?etD4Niw0v0VNPt8vHvK0s2MATddR0+p5Aj/rxXfoJelOjnH9Sfaf9yk9sG9w?=
 =?us-ascii?Q?BFlOSXp+oDFdnelJr1MXYjsF7E2tIOkirvd7mDK8Z3wQvBr+feZvccwgHL91?=
 =?us-ascii?Q?FTumswwA3jzMjgZC+gIYdXQV1GsEUY+gL04ncFZYQ4Hd3MlQR31kZw0O4cFA?=
 =?us-ascii?Q?ZoZP7eTN7gQATAeqwArOsVVuUlEcmObfNYtm0BXhfDQo9gEB7HR+el9vEbrw?=
 =?us-ascii?Q?9noZHhxetflHxU6WmoCfzoCJ1GoDznIoiMjHCz1n80K01PiwKP76mGkRHLQq?=
 =?us-ascii?Q?FxAck5+RicjWtzoNNiLOW0nBkjSpldO0ZpgPICbMrfnLhvCMueN2OLGXEa2J?=
 =?us-ascii?Q?1S+9eQNHZeJXAxm1P7/rVVNjPLDEnbz08tUoHu8CLatWcQq54Pc3esS1AwJ8?=
 =?us-ascii?Q?zg7VDjDXyyQcwQpzPI4pVk0wzwefNSysxkaiXOCjTcHZK5cLk00ifZfv98C5?=
 =?us-ascii?Q?Rh6KW/FOAR+8WR4U6/1HASOXEZiFFRyRy7aR6av7QVMBfvKvZ9fO0spss2Vk?=
 =?us-ascii?Q?HRnASP5MRcPdsTyRY569T2eTsEPp/HAZhlxWnBPgzJ07RBw17T11uT0006vY?=
 =?us-ascii?Q?A/xkoTMi6M3mtGyUT6NstQxLpzEoHK8K?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TgmKORXEWvrF4p1s3w73Uap2UTFRYqX1k60pthiVGF6mE8FgCusS+ApTFZhU?=
 =?us-ascii?Q?AHfXVQ0yUhSb/Fu1m65Ccdy+JlMDsuiWV22/yWakLXphmbbIYi0rDMrQzsKJ?=
 =?us-ascii?Q?cWPpmcypJt1mj/EsnPTAZCpi95R79ECEEjzG+pjfcOhYO0P4XORHRVg1ZoU/?=
 =?us-ascii?Q?+P5mch7hHD9PX/v5l4pb54uBMACwvkLoQizC9q4IGMceULF71MdK6Y+5x7eT?=
 =?us-ascii?Q?Wt/+soNWMbSmMffhJZ0P/pf6WketW0eCEiJ8CRk8UdpL6UILcHiusNWN7GYz?=
 =?us-ascii?Q?cUKuXspV4YIEsokuKj7K3EOLxf+SQWHi3g2XAaR+QMsku/JXnpz2j3KLNORn?=
 =?us-ascii?Q?+7k95W3HHocJEFxlecXvRSyN+07kB/81M46hg+L+6L0sbBkFaSgiMBxTyRke?=
 =?us-ascii?Q?P5fRIcnvuxfLQ6I0RMqsR6CLBG7966X/jgx26sThhAESTQX/g4mTdLQ+R/ws?=
 =?us-ascii?Q?GGI0Xj79kS/ut1NuaZdas755EXJafmOBqwtsQipfMql/1t/eODfp4J+5vLUU?=
 =?us-ascii?Q?p3bKDZtBEIGj+rihYONo6SCsIwmCTOWxy6sPFKB5Q+ezhwAfUPC5amBW9+wf?=
 =?us-ascii?Q?5SOfyGHpgjGbRTojJaaQe9W7euBUg1zz/nQXS/ojfEjgWudnoYVvRTpQa7GI?=
 =?us-ascii?Q?Z8mVo79dOy4gFfKh8xZJmWL1NRWulbJqe82UQLKtRo1JH9Rk+QKLFmQOGWmi?=
 =?us-ascii?Q?Y6yPAtxfA7XIE8db6Av3f7mek76e+FcZdVwpoiV5JS1h5/0E13t8Wfw1byga?=
 =?us-ascii?Q?xY2ue9TMwuXyQuc0GwJvxu9Qnh3tC+7Hz/N2bbN4iUl9tFSSNneQUGV/hZad?=
 =?us-ascii?Q?4Y8B0bwcQfWkOlE1CCa0TLGo/zdMdGVPS1pgOvYP0Pww8oOlX57JQYQvFLc2?=
 =?us-ascii?Q?Er270TxNlQ2gnfAlYqDeY26+hZ5XZ+qaAyTzkd/i6Nj0XXGnkj27rPPc4XHI?=
 =?us-ascii?Q?AEKHFU4ttgHzapxp3Ome0w4/sJREdHulqvOHcVbJ30EWaIVfJPA4362wAZub?=
 =?us-ascii?Q?ySFtDmQr3Z1cAQJmLpdX8ATjeUEo6Yu2PYGZsypkmOXdUzSOzqGemZsqMZzi?=
 =?us-ascii?Q?LJtZy3m5KtpvcWeusiHSBpRy8aImlq6/KxVGVUCAP4Z0pJwJrbSGrSiXpCNo?=
 =?us-ascii?Q?xuaWuca88zOdShT7lBLDQw/P1B9UyPELxFTV0bLcF7T+Rc9NdFLX0VVTPx8u?=
 =?us-ascii?Q?7qLMWgdt02qsgDgsHg5Ypf9k44S6ehFFuPVkOvcTdFtBNC3GVvafbQ+w67TX?=
 =?us-ascii?Q?v8hgxUNZbs37x9aNVPwayzMeZvzsrnIhiqtBMczvC4XTMj84uEWnGL2i50P6?=
 =?us-ascii?Q?CLPhNCgUbWT+KoUTYpAKVCA3j+gY3tzGeF6Oabvrsi4K6SveNdYkeQsoFfLg?=
 =?us-ascii?Q?KTbUjgZAcRxC+muT5wpViypBF/aBejyaf1qiRI29vTumwBzwh2kQsn1urWAR?=
 =?us-ascii?Q?uMshbur/QGuOzbPXmi1NWiBeuG5zOHZ93G5NXzlpGvFttLRRdhW4zK3QNuq0?=
 =?us-ascii?Q?qghXOGtm44Le8Ng2VsCALPeLHqNsqoV7vAdOMGQsGAU8o4slNBK5hCJY45bX?=
 =?us-ascii?Q?fAyR/KsGA1FFsLmHbArUAM5Psjqi2C7Zr9YNXQcih+icTsXXDsfZ/9a+UQ16?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d841116-e665-4fd4-0935-08dd34b1791b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:38:20.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s3fbeRtcPPaFdiAgSzIgJLWAn3wJhUEHVHrXaEdxcgXCfeBIGw1vqRX9ZwBm3JSLPmdG6aUoh4C+hOsdCRuFrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209803

Remove import from context where it is never used.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/vex.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 01d4e52051..c9749d4ceb 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -119,7 +119,6 @@ def generate_json_report(d, out_path, link_path):
 python vex_save_summary_handler () {
     import shutil
     import datetime
-    from oe.cve_check import update_symlinks
=20
     cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
=20
--=20
2.39.5


