Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12A6ECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:21:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.102])
 by mx.groups.io with SMTP id smtpd.web11.36292.1661516459621265614
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@prevas.dk
 header.s=selector1 header.b=iUBAy49f;
 spf=pass (domain: prevas.dk, ip: 40.107.13.102,
 mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CY0CVdgRvc2Y5XhBKzTry0r8hsfNYEnOmm1E69f3KGgdCKIoZv3ZHupA6AUa5zQjQa3rFyWSEp0ZuNRYpfuIwDFwoIDhmmvrzy0UnHDOvSGbL2cpnfUfFIkjnSRlpwCVNwf6VEQMKbuUbpNIFF6t8bm5yiNLnijh4beWsUgsusvf1SOM70myUs5o38e18LQRsIyy+BT94B3Nlzit29ay8KbqQL9kIvilN8TbQGy8dmhJ9TbREvkXGbsr7QCEzKc0rZbTqvOFe8adrDR1it0JbsKWa7r6M5uy9StqP0ZgM8hVnpuGH2EuEHIaA4/1H1gVEUwV3wMrTs7ueWyWSX+XZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGL83ERsTfPtokgiA9+ySRdLWMK49RyC2wlp57psddE=;
 b=fkE80I8ZhZiwKQBJYns/2Rfd1PNuvbvZusQNMdK1PZcQAARznnRcEx8OAVmfc1nptDXTqn7MRNRobpN6fh7qMfnF6nG8B1lqpGA2aLxUyD2TTeuqW6eNsnc8aVHDlQTuKgTIJ70yh616d04x9athqPZ8T+rqrKrnfekfNO6UsfGWZWAJt4ZqMlSrtG4duDr3H7eRz7vQnU6jHdSmic+6Le1NcEpqqE1QLACOncbWNfhoszjDqFI6BmFN62ptGfEFNDw7ZTyTL2XAB0mI1WZR/PRLcSDRkXY77VUlbQX7YwWUEdsv6SSD3QB3BgoBpHLbD+QXPQ8NsA23QA2uA52zfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGL83ERsTfPtokgiA9+ySRdLWMK49RyC2wlp57psddE=;
 b=iUBAy49fPaVYwocf5NNYlJaellV4oDmgh7H9jROojchuj8jeTspqmGXoYslOnizfebYvDZ5h9he96YwlXlIDAg3T76vAaSwqYTD948mhXuK+h+pnMlWajoD4EYMvV1pBvVVFGmG9qJjt0IxQTaxT184kaGOaGNtTDh07WvqLwyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by PAXPR10MB5710.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:246::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 12:20:55 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::84cd:fa2:ffc0:456e]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::84cd:fa2:ffc0:456e%8]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 12:20:55 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] bitbake.conf: set BB_DEFAULT_UMASK using ??=
Date: Fri, 26 Aug 2022 14:20:44 +0200
Message-ID: <20220826122044.250841-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.37.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0054.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::15) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ef19191-9fdd-414d-e11b-08da875d6cb4
X-MS-TrafficTypeDiagnostic: PAXPR10MB5710:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m56hnM4X+QDJdiGaByRZ/Feis5lx4Ke5hSBWFvPnbCwz1OYGFyX+4duff8GMdIamOH/EcYHTFI+AwIVwMM2fpgdsJa+5VsUDHoJV8ShMVnz5Cza8ZaXtwM3lie2Iq4hU2kOAzKijxFw4BB+o7fGhVQQo3H5ehOlpbYNIMpIY9/TKK09AmVvtL2ZOLVkkchzjLWoUExSUZNQ8MUCcEW+2d5zax4BsZJ8ju7z2F/63FOhtaEt/B/PFqZ0actxBoeBdPhCi+iPuSeHaeNtf2jFU1QaCCMPhrN61CVyACTk3hRzbuumaXxwCJxxFCuB1bYkdbEklpNctCoJkwqIrTW9bmn/Qxchebn1O8mOobO9JJHeu9hlYMVKyt3MuvWkUb9hbgOCoOxgt6VRwdbnSvtRA9cNCyomour7W/iDQH+2w05cLRfQ7BXW2iz/fuRGbEQ7SUUQ6ZZiQo9Aywq984bWMMLlr32QY13/Q18e6s/xmk5wosy3aiNodJqwkpsTNlSOHpoB4FMgqs1LQy4T4RjlUWaT3w/ZEdBZPcAX/89bqdSCuExDyIHHGC77WH5CalG7Q5tbLPv3AnX/PPWT8dmcyMpoEoCOiXN0YCPSQcEEVpS0G9UPCNwbX8VtppHQzQRPeyVv9lWCjiEZAhsSac1iVvKH+iI2WpYqCZx1R9bmXQmbF2BgaJFUxqjQfbIr2p99ayJAWytOPj94wUZN6Jk7JIP7ZL7gCh1pM+snIW663LpP3D2PABFZStiAGYxwOr28w+r5xPcD5lYc1bOYTNES6KA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(136003)(366004)(39850400004)(83380400001)(52116002)(6512007)(26005)(1076003)(6506007)(186003)(2906002)(86362001)(2616005)(6666004)(6486002)(66476007)(38350700002)(4326008)(8976002)(38100700002)(8676002)(66946007)(8936002)(5660300002)(66556008)(316002)(36756003)(6916009)(54906003)(41300700001)(478600001)(44832011)(107886003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?btGW4IG949keDMoozI2PzlM7aeIZNX8RqMsFiD0rLUgJuJugP/d/05FzxrXX?=
 =?us-ascii?Q?0lNLScdtc4H2MML1yh4poqBrsl/cBoZxbGDz329+DxiVwCoKP4rPGNnSbvo/?=
 =?us-ascii?Q?rC4qoJzvNN3c6GBiu73cbhjnmGSmrqoPQlJ7g8ShzLlggUFoZFf4FHnMrmfh?=
 =?us-ascii?Q?2pi3c0WPmP/gFZ7EmdR7fiscZogVpH6aSwmSc9+DTev+ivkGbbpxtd1OR7Yz?=
 =?us-ascii?Q?qNnndeAhZhsWNDdN1Bq1p2c6l4p8sZGI7gp3xz27ccNR7fwsX3dl/6tPFw8D?=
 =?us-ascii?Q?v4WvCxnfE999BIHXLEGG7+aVK59s2IXAw58LRYjGDrSdtnCfHqpKcd7DyBIv?=
 =?us-ascii?Q?LheX/AiNRA/+l7AX7Ci4ircAjkba6/sJKVXWugBsgrf04LFYZfTnqXWJ7ygI?=
 =?us-ascii?Q?qhnz8JdN1d26p0V0xxmaKy8Q20UNy1IbtSzpoiBwAn/8Vd7uzhy0BNHBhw2Z?=
 =?us-ascii?Q?kip82yCahr0RQAm1HRBatagk6OTVdYt1zPtwMCuKtejXQQk9k+xKK8uQeDyT?=
 =?us-ascii?Q?IyOZZ35yDTn9BCGStiSfixcBK5P/SVYxFb0gI+5XvM8FwBs4URLAFFrQE8Fb?=
 =?us-ascii?Q?pcil1uKn7/SKYF5llD1LFdIzoIcPt3aMmefDGr3ep20XiAHrDRZHq2/NOUUk?=
 =?us-ascii?Q?5kP7ejcorg+35fvvlU6qi7avkzlPvy5Bfxei76w65p7eiLH/BAgI9vCguA59?=
 =?us-ascii?Q?nXobyxv3J8XlJr38iTHl2JVmv4oLUeqUkYas7h90zxZkQVua6aU3MNtl1r23?=
 =?us-ascii?Q?02gLW3ouiIlk5TigXABaPMQLUeQU51+H2vIxOTkkKnSbgF6k5uVPa9XOk1YE?=
 =?us-ascii?Q?g1aiAPbnntoTHgrmgLL+Xgt8lUBRe+iBby6nBYOAObGUT2igK2JG79MahCaI?=
 =?us-ascii?Q?7TSEGsj3quOsb8S1EzW1pRQR1+RxxizVngnN4y+Qggp7ru5O9+KXd5C0IA6J?=
 =?us-ascii?Q?2mofPc9LoQ5fYyZI0rT+GtKsfz8P75XcuTDxCY5jO3K8n34wNH7GRDUOlObY?=
 =?us-ascii?Q?YAMbKZtWTtZV/4WOrzPkVnS8YUka90QuWi3PKCE5S2dPivzP4n82K0tSudOE?=
 =?us-ascii?Q?J6suRW0wzZQ1bYbst/X8q9WQq/8bqxvZXI082WWYZR0E8t3d/BFXID6SK6IH?=
 =?us-ascii?Q?dMRzePhmXYLjgGmko0d54PYZOOmOGBT6z62RdWGgIwgu7LulWh5TKzHBkyOh?=
 =?us-ascii?Q?SjHIlPTmcenTPeCSR2msazVblY22Vv01Njp4ZcmhkPOtn41qhk1XRD/NjDfW?=
 =?us-ascii?Q?SojvlyQes3ARwBGvOCclvsacZoS6V8giTttg5Ak6nJDynPxiM3n1VyeYYKIf?=
 =?us-ascii?Q?IcUDr7qmHLGDNNFeyc0OUTodCFD8080ZOv1aiWJu1uVs6UkJTIL1AOJbgzCD?=
 =?us-ascii?Q?GL5HjjnBqYzlF0j6s63ARckQW1/nYinyLE5mnmeL5OjMA7tj/kDnpOVnw4V7?=
 =?us-ascii?Q?DEncPk5Sp4HpvggJlpjlymN/cvRdLwLyPebNiGkAfAubxj4zf+zufmQpLYVV?=
 =?us-ascii?Q?yMd1wAvz9yujEOAEkCbAVaWjW8mkicaxXsByVv0K8DCnehe/mFQdGEwODEFq?=
 =?us-ascii?Q?SpYDQpcWyu58AtDNzlMtQMZ9mtrmU5XxUlyHzQvLx+jqPs7d/67UfKGkk+sv?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6ef19191-9fdd-414d-e11b-08da875d6cb4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 12:20:55.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 q9EmGVoq4EIFnvsvCkK+A6PITh2cnE7dPf0IfEJSGYF9goVmYYH340wfBSda8uL5kX8PziOeAC/9c1apWNKUzFr/YftdZgar1s6fSFr9bUE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 12:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169915

Currently, there's no way for the user's site.conf, local.conf or
similar to set BB_DEFAULT_UMASK, because those files are included by
bitbake.conf prior to the unconditional assignment of
BB_DEFAULT_UMASK. To make that possible, use a weak default assignment
instead. This is also consistent with most other variable assignments
in the lower half of bitbake.conf.

I believe the risk of a regression is very small; it would require
something like somebody having a definition of BB_DEFAULT_UMASK in a
local configuration file, and having been relying on that _not_ taking
effect.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dd2df8a552..52a36d788b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -928,7 +928,7 @@ SHELL[unexport] =3D "1"
 TRANSLATED_TARGET_ARCH ??=3D "${@d.getVar('TARGET_ARCH').replace("_", "-")=
}"
=20
 # Set a default umask to use for tasks for determinism
-BB_DEFAULT_UMASK =3D "022"
+BB_DEFAULT_UMASK ??=3D "022"
=20
 # Complete output from bitbake
 BB_CONSOLELOG ?=3D "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
--=20
2.37.2


