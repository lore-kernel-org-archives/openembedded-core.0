Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480F4CDD54B
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 16:57:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.20626.1726678669093856824
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 09:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=ZKQrUycf;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.20.71, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csBzaUPvYPVpgbkhjpjnaqi3oHiuVJySr3OiFTHJSVycoWgGdKj3z9pX0NQBafFFAHZkdytOunZ95X77Nyf9y2C7F1wxXDwR6IbqkfVMaBSbmCJ5zkxcfcNZrJyqpxqnLhiuI7Clf2kLZ/uCdteOyf73GR2U8oWupfeLoBnF4ZcR8DvdsSfvsOUuN9/M9fx3ceQ2+eezOt3/K/X3ZtdaiGKXqtVwStsr1g3RfQCRpxnGle7wZoy7pneWKdP2XYbyPZ+CyygKimvKoDFgn+6X0XH96RLh8zT168J5GDh98vOAyX2mExGgOpTYQ3Bdt1aVkzSTmw/YoaQJHjq51MEmmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjAEFUPZZkRURg46jS8nMwxsT87IDEG3j4BjRMOk5C4=;
 b=PlHkqHNibnYEJf0o3/ENqLEnZKuwmsdI3LJIBbaea85oHsxxMxRS73iZ47QUj9Lpvk78iGrQqLYQdazDlAuq7uujDd8LzSyDMD+im4EneceTC4gdAYSiAi4PpdP/Ydlxflb3d7Bc1QLSUY6IvH6ufY0LJqxOUdue8H6pEEINqd9vkNufm6zJ1uD48/7HBiAxoGcqUkT17PrfyimoMCm63mdxZpmp6UJb/DthmEfYh4SUL46cA2EbzjYW7LPfy1jP3WmiuInLIkoBVVcrLsRlXgIrME8YWk/zPiFyfXSq9sqBj4J4FPUVOmxjjTzqx0MnhUctuWiUYtsq5ea0TYZVYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZjAEFUPZZkRURg46jS8nMwxsT87IDEG3j4BjRMOk5C4=;
 b=ZKQrUycfUY2B3K8/JlQJXARffevrNREhOdmw2mz6/8GrttwLG0QSKUCVXq2XqavL3/N3oXUeb84nfzfa5tTBpMGECBQhd7/SBBOoIn4DFRlG7OryZtm6l5a92/rSuWoQvSkC1gZb+gnYTl7QP7caclR/pR1OKXtql5iCN1wrEGhC/yEk0fI2x9Xj3BdQlWFNQHxDoiKr8B3ETCHyytmSm19M4lTekOzveenM94MRryoC43IRYs+4FLc6FKPCZgHm9+TXMQ57zVymJkPrRAH4NbEwN69mJ6Rl2PB5wulDO+U8p2T0lofGJxSqgsWMLoZoK3ctsTyBTQzRLIaLJ1xRZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AS8P193MB2030.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:40d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 16:57:45 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%5]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 16:57:44 +0000
From: Pedro Ferreira <pedro.silva.ferreira@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Cc: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH v2 1/3] buildhistory: Fix intermittent package file list creation
Date: Mon, 16 Sep 2024 08:13:01 +0100
Message-Id: <20240916071303.2831698-1-pedro.silva.ferreira@criticaltechworks.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0266.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::6) To AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:1ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8P193MB0900:EE_|AS8P193MB2030:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bda394c-bbb2-4892-077f-08dcd8030441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M5fZwE9sTAq/6L0r5b9KFGJU697N1mQFJ094boWJZfY3n5It9Cnwke6U/wpM?=
 =?us-ascii?Q?pcv6VklmzmZa8t4xKefSR+dOfidxpOV2zJpQGhc/chD4uuNKypkimF7xyOGW?=
 =?us-ascii?Q?kmJqIQwffNcJBQEKIxLUNbE3Up1KYqHv5BxKRHea/AQ6zk5pO23RLaJXTw7F?=
 =?us-ascii?Q?+XwRXB4ndqxs2EiTqa1+JimgGj3WsooE46EYmw8Kw+unaXt/y7lo4nsmIXGG?=
 =?us-ascii?Q?hbhVcxEzbHIcQkH+2zN0LKyYb41iEgQroe1mpm6ABKgkGIfxVU9PKZ5Yie82?=
 =?us-ascii?Q?agjfw5ZKUMrEcYqw6JAFg+jG619c7nx7NzGK4nCi95dgQZCUt209fcjD7/cB?=
 =?us-ascii?Q?HLzD6aoyG4u2opyb3AdB3UwL0P/WXkM3dJLL4PqlZh6vMr8Ir7T1EMSKfVrI?=
 =?us-ascii?Q?B713epypaCtpvvhAcQot0o45vNew2PKNG4gSHW/HoRwORI6ss9rdt9Pwnq6I?=
 =?us-ascii?Q?UWKNgRHJ15h7cIpm+tF5X8is63rI10pn7/87qARhmv2G5mscJrYsiAzobuUu?=
 =?us-ascii?Q?b/WIUu1A34Osx36l43EDzIicdj0IkIyyiVg6rtr3+2MgRdJPHckHPFSz07ET?=
 =?us-ascii?Q?DkA11g0S2HJ7Cnq86tlqAM3dUqKNEjIdwZgPfbYwHgBAKY2meAjO1yJ/EoV8?=
 =?us-ascii?Q?Mfqk+QFjN8UKxV2uAYlO+NIOK1wgF02N9mXsou3e+wJ8rZ6H3cOQG+1l0AUA?=
 =?us-ascii?Q?crjNiXqxWVEK1q+JcOU5DdOdK6ycBk06uZMSXn2YoSFNUAcQJ0KPNkY6V5y8?=
 =?us-ascii?Q?BZedYiL9PUqIu5W8IN0v2MT/D2jd0qYN+/RZqOMKr9FkZrikPpWwiG5Ay/CE?=
 =?us-ascii?Q?sti43+goVbb48fyPSL+GuDjmcpnfbHrcZowyAN33wdPQpg25AhHnPzDV3V/f?=
 =?us-ascii?Q?myVjibA+No4crMHHUPgh3Nr4RKRn/Qp7/S/TWMjS2wLq1wcE10O8oBPEHmcl?=
 =?us-ascii?Q?e+kGr4oUoqV4Xlqy8SSDO/XlawI+bEXWWtZ8PTLQ4PkAvxuVa8qSRYvFZCI6?=
 =?us-ascii?Q?EHkgvzUtNY412KV8tQpyLhH3zOsipq5MCGdmAyAuUWMsBEmssH7kU8qNHZlP?=
 =?us-ascii?Q?q/5k4rCYC2qaUZtKnH/3LnBahpfajDSvyCUOnViMsjK3f0CHNt2+t7426GNx?=
 =?us-ascii?Q?SeA6wuZw5OOf4kJRsYzUCYLCy+jEJa0cF967+bJ8DWIoMVXTYklMoHOy8ox/?=
 =?us-ascii?Q?m5ZbXpgCG457lsyAbrMmY8NI7etD9Qlv6lGhljCucgjWQho818QjCjAwpuiB?=
 =?us-ascii?Q?Rn7GwMrZ9JeQMM5Z77qOUldG09ffAHN4osxms57l8/z9t2gpX+XxjFARMESP?=
 =?us-ascii?Q?Boapv7FV8UJcXwizuQqhVu6EFmcy69BZjtUe+dmqWqd4TFUYUK8Sb+VfEIfk?=
 =?us-ascii?Q?TuRoJ7UJNLSjrdBhAHBhQfqxbCMSzYof5TZiPegP+AcRhLeZBg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6BdZe8S0o/5NDSt6t+/qaaxqNd314x43uwph6QE4FW0ERzzuKXncH3A2EG9K?=
 =?us-ascii?Q?JOkSIeJ2yH7ViS4une10IA0ZLNogFUj3W2UwJMSMcDt9q37guM9RgQH/Oku9?=
 =?us-ascii?Q?VZZJKp+vBKFx2/AZ0taOBJ/ezn7CWCftTiQdfo9Mv8o8vH5BTus3cz0EeqJv?=
 =?us-ascii?Q?k9G+JhmuQ7uPplyrDwwUH8OsZnebMOds+SymNSu66qDcWZUBQQ3ZVmTw2dlz?=
 =?us-ascii?Q?YzkMBJ3kry+JnCQ30AWel+tLcZaq57uR5qZ6rT7k1aqMSGUorouhhFgjcMgS?=
 =?us-ascii?Q?E3X7gWYCDWVysbttsSodDKOVFxs+vhuUoukhFK0B6KG6jIkGjmVnQlVmMcAs?=
 =?us-ascii?Q?AyfK7tiMtugbXyq4A7lUhJ7Zih238GU9DjUxYXODpMZVoGJCND1CMv9zatuQ?=
 =?us-ascii?Q?Aolt3Fg7buDk2AubyFqvKDACCu5c5AZkdEuYR2D/hmyP6zSunmpfwoH2+URq?=
 =?us-ascii?Q?ooquQomQCtF1cvOtal9YDUMOPCmGcCRyS/1+ukrDXEfznVAs0GxYVSYbOeHL?=
 =?us-ascii?Q?MTGeS6XY+yyMJjEKI0s2sWv+k/x0LEO6wKG6TwZqkXEs/7UhDu7gr6K1IMR1?=
 =?us-ascii?Q?TqmAz8CWQKTDwCGJOOqcmrm2eZ0nptX8paa/5XkpFJ8af9rMzgdNtcQ3VQ9A?=
 =?us-ascii?Q?1AHp7eivM6FdAgcoJMdeUspOI3ZM7THZ/QnFkmd+p7A7pDlTGusmGOX4GX8p?=
 =?us-ascii?Q?tEgUP1TXwNMiVai4gzjRb+N23+3qEL0/XzGG5jKvPQI8nbkzu5rL2p7rBNTS?=
 =?us-ascii?Q?7Bg/A+04q4oMuuh+xraTkEf/H1AEUfl2dv8bG9xplN9sTjcR1+IPEXl8Tytu?=
 =?us-ascii?Q?giururH5YaBJYPcQLPgkDCXnUf10Drt2Ovc0gmpYmPyN6zAwgkyGLsUrgL40?=
 =?us-ascii?Q?TFgUBgx6G65Gfj6c7RfDg/CfyRuGsk3HVjIwAeIV+wHLpHh3+VTR+L9lPBBa?=
 =?us-ascii?Q?FBvz8pSemNJJJlYzhnJ1HVGJxBlYQGKU7mE5Y/7446kcjBspOJOlx00M0qE/?=
 =?us-ascii?Q?9HBf36P4kqb+tE+6m0CQT0B07LWfe6YyHfh0EWI2QylKNv1w5CfMvtFW+iu2?=
 =?us-ascii?Q?N15WlVYTOOioEJ+gES+kAqRYI/fODdH/N/LtmEui9R7jsT4Fnq7DpxTDZ9Sm?=
 =?us-ascii?Q?sUr6M+0nP2u8PNRINsLNEejTz6sd+pVhTsAsigHQmPkV7q02R6sN6Gr4hgo0?=
 =?us-ascii?Q?NJBmR+7mw3fnivnqKm9lLVARZrE7o/tq2f7qBEhBbxfsEC/PxNdi8RVL0BmG?=
 =?us-ascii?Q?f7JWCK4ELSwmpW0F7BG5mHUlU9hCZ5NkDeNCmWHUgdTLDgEP5K5XN8yC4q8F?=
 =?us-ascii?Q?RJwnjpPoKbV6xXM4N50sgW+PXfFs+URlKPyzX+/RCaY0Oun2cfcg/01GUX1l?=
 =?us-ascii?Q?RbqlRR7Utsa73+Gp11iq2vDukh2LY2UACTsyki/Ds9AudY0nPdAw8vIKWCXl?=
 =?us-ascii?Q?83Mr58kX1ecNuc8cmIXvIN90V853jAoKTkzwr2pbdYYdtd06AHhlw2i57SRk?=
 =?us-ascii?Q?7aKvOqGj+dC6rMzE63P7LOHl2mJAEGO24H9Ebe/r6dNKvI7Jbz7ncv+zopov?=
 =?us-ascii?Q?Tmj4m1Ejr6S+FJ/r0TCwXmilvUSMhyhH2CrhMlfLsiRH0HkDrUIGsR9TvAZt?=
 =?us-ascii?Q?5zaYL8hPEb6PVq5/nIo0FH0=3D?=
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bda394c-bbb2-4892-077f-08dcd8030441
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 16:57:44.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJiUdw/4p+ccWbS/jq96eVTsDZsSVq/0TR6cWlOLj4DRPpZ265Niazs5VU6V1tHMSGIv7TlQ/EfpPv/ou7+XtlSlKDTZBbYz+BipQLF4IW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 16:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204650

The directory that buildhistory_list_pkg_files writes to during do_package
is created by do_packagedata so a clean buildhistory doesn't have
files-in-package written during the first build since packagedata happens
after do_package.

Ensure the output package folder is created to avoid missing
files-in-package.txt files.

Also it ensures that in case of `find` fails we leave with
a hard error instead of hiding the error on the for loop.

Signed-off-by: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks=
.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8de9b8c1e199896b9a7bc5ed64967c6bfbf84bea)
---
 meta/classes/buildhistory.bbclass | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index 4345ffc693..b35508db27 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -597,15 +597,12 @@ buildhistory_list_files_no_owners() {

 buildhistory_list_pkg_files() {
        # Create individual files-in-package for each recipe's package
-       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
+       pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
+       for pkgdir in $pkgdirlist; do
                pkgname=3D$(basename $pkgdir)
                outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
                outfile=3D"$outfolder/files-in-package.txt"
-               # Make sure the output folder exists so we can create the f=
ile
-               if [ ! -d $outfolder ] ; then
-                       bbdebug 2 "Folder $outfolder does not exist, file $=
outfile not created"
-                       continue
-               fi
+               mkdir -p $outfolder
                buildhistory_list_files $pkgdir $outfile fakeroot
        done
 }
--
2.34.1

The information in this communication may contain confidential or legally p=
rivileged information. It is intended solely for the use of the individual =
or entity it addresses and others authorized to receive it. If you are not =
an intended recipient, you are hereby notified that any disclosure, copying=
, distribution or action in reliance on the contents of this information is=
 strictly prohibited and may be unlawful. If you have received this communi=
cation by error, please notify us immediately by responding to this e-mail =
and then delete it from your system. Critical TechWorks is not liable for t=
he proper and complete transmission of the information in this communicatio=
n nor for any delay in its receipt

This e-mail is environmentally friendly, just like Critical TechWorks, whic=
h lives in a paper-free atmosphere. Therefore, please consider the environm=
ent before printing it!

