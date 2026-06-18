Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21954CD98F0
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 07:54:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14324.1781769267434968549
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 00:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0EX64cV9;
 spf=pass (domain: est.tech, ip: 52.101.84.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSpzThqlb47DXtaAekh6nsI2S+e/FjbcSQQCXNfrSInjSca/AK8N9jbuFuAvYbPK4JZau4C/ysFLiRoVr9DrfKG2qTW8+rO4+2hiqAz7s6x7YJDTqqyhPG1I3LgPbgDi1gBpJkYHJ+SwjXWlf+dGPJJLKn/ziGO6oQSq3UX/nCIG775/BR3gKZOTtsmr8XM9XqCAWFx/krWT+kV+iGs8jAg/fzkEK3Vvr1WbdQpP3NbEhHVAVXvNT6L3wnJBRKgs6Elz0wQDijVFSLdJT4IaB1IsfEla0qHc1/lqeaVnvADzzJHuvLYRJS1byFaKjMR1ttG/IhBZj4eTVNO4VCkKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPBw4xDiZ+Lth1dOTsngOt0PaRvv47QvYeqowRPkjIs=;
 b=MY+h/CoKNSlkpmz+3enea8tQUMH2PIeKDBCaICLT45Xa9nD4wEYYwZy+ugR0fmr3Sj46cLeba37tWf+XZ9vPV8MKtPpQRwxCbyk974AHeYHouHtO+ksF8lShiilbKFNOAc8/UaFL2aPnb7PAF4SzJINW/GpQZpzx6MfoXrB7cpFnzY4bWuIXAEYUCUANBPdwFTZ9f+xL4w8QvKK8ZZl8QVM9ywRGiK2oMumK7jj0fPUB40ftu2jdE0GJNHOlM91GQAfkr5s8vvjA0xzNoQUej2uZyrgB8lIRuYEAr14gPchZi/xGTFG3teR4JJNIreqhj9r3h6W2cUTBbBccIbkEAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPBw4xDiZ+Lth1dOTsngOt0PaRvv47QvYeqowRPkjIs=;
 b=0EX64cV9/E3AaeSelP0eCePOQJh05wRVgk4AnYq4TJzYN6gzXD6YBdbjuMkEhD74DnEQOSAwZvMUc1J6yG0sP9biotM3sHsKYi+F2Ybrb7sWHdKbpuBh1IPO11lz5q7fCI2M5CB9pIo+Dzfgc7OdEC5jLTi0Aq2m2Gm6vB0jsuq68mESMloMKWLL5hFCAlVXwvFOkG0EIHT8TNQ0BKDYa76+kQ0fa71Tj+qtX1svVBVtf198mdFWCdcYNY0rxfKhqqilFHefE5413pvMVuMjqW4Hy7bW7dstHEpZmAHOdYThcQuNVh1PgNMSr1LeijHdVq92BenIbqpWPucFiV7a4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI6PPFE19692F6E.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::1aa) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 07:54:21 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 07:54:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>,
	Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH] cmake-native: prevent host libidn2 contamination
Date: Thu, 18 Jun 2026 09:54:05 +0200
Message-ID: <20260618075405.73446-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0513.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI6PPFE19692F6E:EE_
X-MS-Office365-Filtering-Correlation-Id: f6c95f44-65ae-4a92-ea94-08decd0eced3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	5E/WTIQxKcH7h9slbv+0J9BpUdIH/HFyXA4iuKNaHDorAN2zWvzs8pYwBCrGc9toktgOh9J6g2gzWuXTymKDF7MS+k3J5yjxCR1riEtwle3n7BJcUXX+Ox0zNY7ErMoDHcrKQo3CaoJ0jaFIJzeXy4Elf3im+egnuw4Twh0ZMUFFLGx5p/x1ZFqvyRNOcZ40hayXFBXF28Jp7bGZlrMLlPb10VD4bTABXAPVar18JPm6fIfFvuNPT0etiUoGDMLKa2NxJ4cJp6BVb6Smk8sM+unmp/Wufsq94tN11DwPDqO+Phwr4cgiZeIab7IVPCIAJkKkFO2Y3joRN9XFnA0PK7lyzFcaprDqP7TtJlnvYWcO81rzpoEj/EBA/3XxNpmpvKo2jUcoZuudziM49aWjXW1ImY/nE1WiBVQQimpiUJJma5Zitk2eGj8v4sJe5Pov63mJhejUzvGazNuEbgyCx6i0Q4WEMzsUnlBDzPzVC1D8m0hPMLAWz3SyzdKlOCq1NCD/zboqxm9q4+/WQXu46KxPu386lXVmXtD/rbeasH5mmqZ7AuY8Z/SrGO1rgF4TR0+iJHHeZuUyY9Ux4qtq35siuYvb0HWpmYWLS4+VCUP5lJ/sDG5iQ29fiHN6wYfkdVgG2U0ZrMX5L/bISM2tx9yHcD53u76w060b6HkLPAFIDsLDtNpqnbI6nZNxFHvY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nC1fFwRvAwLk/t75fzuMiuDqgTwhzZLbaHEhxGEl4s5Qolkgv19L2MRhTa89?=
 =?us-ascii?Q?58Y2Y5XJAGtmTbQSEvBNPjHTH92UGner1xZS41HLh39XnBaEISLzhV3hRBAY?=
 =?us-ascii?Q?sNfUHi6hngZzX7SMwBShjmln3X3Hd+TBhVrJiV5fZg8qm0baw50mGmIGqcba?=
 =?us-ascii?Q?yN5STaBgIdAYZGAeiQxuDsiVvGuNN4qp1nPZfJojC6GAgCSlr2uVQ2tVDFk8?=
 =?us-ascii?Q?34bjA7prqFT9Vyse8h18a7uVgkXAzYKKYUDlGMcRyomkXtXGKlbtlSPJIXc2?=
 =?us-ascii?Q?vRb9gkvMOrYHxsRq5LlFOvaQuq3H7lRu+HYG1nWKARudGuRxJjG8wQzKx8fg?=
 =?us-ascii?Q?ue9apvy7IAJJWSQaYV80l1OJDLLvULYsEjaqKtbAxNbbhrdndo4auV4+Jn8m?=
 =?us-ascii?Q?v5+pwCWiCJ6C/8O5G0mTZ2eXGp6wcYQ5bW4eRFQ6sjx6KG6y0bdx73oha5M5?=
 =?us-ascii?Q?erl1Njjntf5oGkrwnYjEVYUhra9REZG2YLVtTauBa8OEjWqapyxmJcpdUcFc?=
 =?us-ascii?Q?BzonPmh/c4I25wQ96pS/IIxTrrnSrBHyjESSFWSbEkZ6mHDYMqT5xGEnXnog?=
 =?us-ascii?Q?XhMZFyfaMa9JnNv72wzd9Be9W5rKN+LLP/HThEKahQZAd7COAk4Sqe3dDrxs?=
 =?us-ascii?Q?phoe1pXHEz/pfzXyzWkEWJAQNBcAduF8L8GXiUPK1wxzD1C8l1yoLdcUIyWT?=
 =?us-ascii?Q?+ifzSrgXSWXUFZuHHprKwu2T3lXFbs4MSv8/H+Jpo+I/rYMOoKMCk9rIdnG8?=
 =?us-ascii?Q?Ke13bb+UD2tBZCXyQ6Rrnn0Q0v2Y4/OUE4R3lJ2IdMY16O7YGUkoaVKiLQmU?=
 =?us-ascii?Q?lwphkPxrr0RTKS4tPCR/jBxW1oFn1BwcmnGVnxUltwoYpMYCwO/4lU+abmdI?=
 =?us-ascii?Q?lKUisu55Oei3kA1ns7XXgY7Bjen8k001kP/nqIvxtN4Onv0ZSdZKO0ugy9fV?=
 =?us-ascii?Q?nnezTbVmsfVsFGG9DfqsIZ7waXJjeb3umEkk6bWLKTn63FNSXNOgTTy0UZPG?=
 =?us-ascii?Q?MZ/U3tDA6jqYSyjdjsjXFSkeBGNm2YW3Cv9AJCCMn5OaeELrlx5ftgvxKsLY?=
 =?us-ascii?Q?U6H68JL4lIPqWz81o0KbHivJT/wNMFtA4AC+kQr/P0OOkxunmDPaCc1OWRvp?=
 =?us-ascii?Q?S0D6xnkDsCHHcSOOI4iro/Gy5bZh9qZKvcaI4GACjdxINzzmXVFcqhoKOFL3?=
 =?us-ascii?Q?xJpC6QAJO8IRJc4FZXFryh+gei5e3H6HDf5e5lS0Jkr3QBPDax6aGGDULbVo?=
 =?us-ascii?Q?+7iC/KzEEMN6Snv8iukjR3Ui8mUSLqcyylFyzqu8Yweg7jtFmCQRDWjkSRuo?=
 =?us-ascii?Q?qvl95LKDFFBEfy9Hoj8kDqEpAAs9NOKiOxLSrNVLmExssPWdxtgJZQvBQI/B?=
 =?us-ascii?Q?FrT9e+CpYg9aMLHyipQoTezz1tG/1MyhNsX4CF3dwn1rPrCtGM+kRHikDSy3?=
 =?us-ascii?Q?xYoMC/SEqSO2Sas0tDoq/qry+Vg9fvp1L5xy3Z2Lnjrz1QIj9ZO4AFloRpCz?=
 =?us-ascii?Q?sHEvFFVxUb+ANR7zTEjHLaHf0JdXbtCp1ksIg99Po7WFxbHlYurveVWLBU2+?=
 =?us-ascii?Q?GmKCrsl38KCN8KyXydm5Hm1YMwART8Y5CYqzWDhofCh7IBX397Nm/7MQIEu6?=
 =?us-ascii?Q?U8eU245ZUB6ZDYl8yTpPc42ZkXQ4xBEaERt5x51GqliZ5fQ+I03QetZJYOPD?=
 =?us-ascii?Q?THWzXPZ1jLYIySA7kUhggMh9IQlVfU5GdSBVdbJRAjJ/iEJljhv1edV7pDAY?=
 =?us-ascii?Q?YElZtnNV2w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c95f44-65ae-4a92-ea94-08decd0eced3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 07:54:21.7558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0pn1J6L+38P0RHA5oWCFZH4Q4NsrE7t5ASTzWFVx1+QTt5R9iKg9kS7+2efvbk2ViM96Gn8dQCTHhoIOL15S8T3QNO/yLsFpzX+dpoOQ+BU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPFE19692F6E
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 07:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239064

The bundled cmcurl in CMake 4.3.x unconditionally enables USE_LIBIDN2
and calls find_package(Libidn2). On hosts with libidn2-devel installed
(common on RHEL/EL8), this detects the host library during configure
but the compile fails because the compiler is correctly restricted to
the native sysroot:

  fatal error: idn2.h: No such file or directory

This was introduced in the upgrade from CMake 3.28.x to 4.3.x, where
the bundled cmcurl added find_package(Libidn2) for IDN support.

cmake-native does not need IDN support in its internal curl usage.
Use CMAKE_DISABLE_FIND_PACKAGE_Libidn2 to prevent the host package
from being found without patching the source.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Reviewed-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/recipes-devtools/cmake/cmake-native_4.3.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb b/meta/recip=
es-devtools/cmake/cmake-native_4.3.3.bb
index 9ab1f0ce73..a859cef151 100644
--- a/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_4.3.3.bb
@@ -31,6 +31,7 @@ EXTRA_OECMAKE +=3D "\
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_EXPAT=3D0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_CURL=3D0 \
+    -DCMAKE_DISABLE_FIND_PACKAGE_Libidn2=3DON \
     -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
     -DHAVE_SYS_ACL_H=3D0 \
 "
--=20
2.34.1


