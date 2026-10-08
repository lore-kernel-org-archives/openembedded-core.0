Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0DCCA600E
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=f2I4NLoq;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QhjYc0gs87vGmh5TJEN751XN9hq8GDUpF0nBj/qFXR7YCQCAOKe+IJVPsY6SC+/iZZ99mXGANVJL48N55iNuIzsLPOU8/fen7v9+rM8sbu47tJbBw5X5oWTyucSu05Ke96YK6zSAKztzFKen9lotHqbChFd+2eFqfShZcp0R45iEVu6XQBrw+Blzh3ob3zliWpp5Wcf4FZGXgJY+C57lBI4ZGV1GDYJHp6kZi8T1VtvTMg/vdCY6VximZUG42VyZng5Lg25tNHk5gjXkB9UbBlNhQ6BQOvlcQjkReIgivAinJETRiL5V4hxrztWRaqeppyFPR8oF9uCfpDmPWu1GFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZijFeR4hGCNKd8aJFTUWRtqJEQsHXzhIM2hPXhqMzfE=;
 b=hmnn6Cz+Ix7D3s/kGjnHL9wRIfQUEHMEoHCKEtjwxhyms9PTd0vCaFJDydOsXf1W9GjGFdEJbGJPXbf5x3mvObf3cjitytxVXZeW+BEw67yZVrShh3Suyk1ZpoAb41S6v8nWiMSWsGwIK16uKVTCoys7whqAfZ6Skm7UO9jfKRdrYTHNsDHpJlyGDf79jp1dSPsBhnvNCHrhbJ9++seSq7wb/bPYJxf6fzQor+TyRGp8nZO0MR3YAW5NAPiVZIN/Q5oK9UkAJAc66/s77fu9keX0zBrFnebWvylmJQOd2UUNx1Gu4FdswKg2ul/EOx3d+tFHftxXj0e4vGW6E6AWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZijFeR4hGCNKd8aJFTUWRtqJEQsHXzhIM2hPXhqMzfE=;
 b=f2I4NLoqG8ZPsynUiSYn7gVSwy9HpsVD3QRdYnejTxJRwk5qHbrmKhYEbDjyCkmlQay6BhA6vw4SsH701YHz18zeDx/JGpcV8tPaZJlpkUbcepTOEC936rSnNxg+Aq/APGl59LBgB+EflOaVXxZtYJQqqC0g1/ETlZOz7BLyiYXC+SyX802YFlpk4fZ70c1Sqi9oBMHhrw9pAigcJ2y1LVtEKkBP0f0nC7gcn/GNbzr89MclI6RBirqEMqsvE6RceHdo+eK4xw/pmdW0XMCrqaQ/iyz+UKE4Tdw8aIBmFuVsPOPLB1mV2nQl1pg6Fe6JQmhOcAMH+JFWJTg0mNWZdw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:24 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:24 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] powertop: Update HOMEPAGE
Date: Thu,  8 Oct 2026 21:59:15 +0200
Message-ID: <20261008195917.22382-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: 35545325-e529-47ef-0045-08df2576a6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Me+8rTmWWN7DdbWczROy049yV496bp3nkfxy0XGYx2Uka4lhk9oGLdd2EH7ut9fWq9mt7slpzSrZn9th7Q5wI6Hc4B7xDzgH7iuP/mItZ7s8A/V7MRiyuX6oNMYCsrCbfs1cCQ7ROQuc1zVRiqbqG24CZZrHcYoJcWEAF85R+Z5HF9nfE07M/58S9R9uwVwp/lZNNpF17a0VEkN060xPz9yrt1eB+VGg+ZVX6/HWPIJmwxGjPAQqS1mv2XNeywt1kbjrgqzwKYrcGpSZbglxUQI6t4tzCFwdLeMwXJPYwwr0By7+5UdD98OPoDqAaYjQG6CnzL0QANaZwgHcntMbG/LA0wX976FGNg4gkoxTxEwcR4fyDIS71+YX2+K3yfH9qhGWC49vPLcKF0VyEV+eD+tWBQfiBLXae1tNDXKP8aoZfZSTCPwDM4dCzo5BXNU2hm0nnZ8kJNwIGQmddszDS7QFcmPimu3nyU1iXxcdYnxDvuS4Eq7wp5t8FV061Vy1Vqgp3qK3j6NJlMX777TEzZku69FAfobzd2H4ub10Zkz6hPwFvuTFfJrD6oXfC5Pxbdz+sXlRX7QxJLxbU2ZrE6F3VYzLbbLR4JahmcNcTBk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0RELGAbK2jwQgOtvE/7nXXA0yY1pX21zKfH9oHU5UhTI0F51wtDlFh/t0Dtx?=
 =?us-ascii?Q?RPfmrD4GnYnOcV+y4qLuCFe52zXjZLPOZJZZT4Zm3DumeUlDrJRq18X9gMei?=
 =?us-ascii?Q?Vd/1IT96847UBLSMhFENWO5UGuUo/Gn0hrJKrw3piUx4zybPlmJ5NDcwmbk7?=
 =?us-ascii?Q?iNvTOMadjTwhTpI/K1YIc4zgPbxPBxk2m9lECFUPC93StA6rx8+FFCQmgZse?=
 =?us-ascii?Q?YcDKWiglYGw50G/YE29EANNScrAm5kFt87nBS6T8SLtoiL15IilddeW+65a8?=
 =?us-ascii?Q?JYctO+GsdMCNg6PComl4x/jr/A16pTtJELSkvilvB5JL2uDDLWvTUpNbjCrf?=
 =?us-ascii?Q?UQRFsSdgr3/CPzjXDAHVK93xHDIUg3Obsy8XUXGYzcj2rmCAX+EbGVAL62Ew?=
 =?us-ascii?Q?TzyJbUfzguq/0pIcfkeNGoJ0rppljL9RlRz8C32SsBnqduhjhqrm++xWtcf3?=
 =?us-ascii?Q?D1mIs3crPLFZhFraebzIM6eJp6QhOcFe4PI5G87cuvk1wvB2LfMXbyJCAVHf?=
 =?us-ascii?Q?bD9zGfKozJancVBTwiaAbOtHfc8S333zGK/4Nk8CqfbZjtXuxjoEJ9hN7How?=
 =?us-ascii?Q?A8AZL2D6uUaBna6gdBY/3RZvBbRwtRWOnEOPDYeYi+V417m96uPm70b6Gb+v?=
 =?us-ascii?Q?UlHyL78R2Tv4eF2XtyDCbEZkRG6xPOKnwPlQKqsK4jGFeKtYcp6oPDkgxKE+?=
 =?us-ascii?Q?HkbCkP5xhIBbEB/xVWKus5SEWXjYyeHDzd/HW+WfuR3ra3MlkSwmNW3JJKRt?=
 =?us-ascii?Q?uMVGzWBlM96CNr3o/+7NeBTVQtOrQlts0/XSmSqHl7f1H6jVh4Ql60VhCcpA?=
 =?us-ascii?Q?69FpNt+W7711TybYZHzKK9nZiUvnrnUQ6x0EEAKaIwbu440CFI8XSCpgpBf1?=
 =?us-ascii?Q?UdFL1Cc3nZH6c45N0f2N2yQJVHidrewobubwQFDThTtxAypdHdQTFWQq4nM2?=
 =?us-ascii?Q?pRcBx7g2kUlgh3CtezyRGuIkZFOemfJEuk4NKfXNPkEwFojosDRXkxgOqHrk?=
 =?us-ascii?Q?jz+Veztq4qKm3lapEguV4MUDc2LB1EEUIp0cxhl+4EUMnIYOdUnEdmztxUMv?=
 =?us-ascii?Q?iNCWJqkLT/MO+oJ8vecjajgdl+cI8qaWIwzImmBsSNuali/tLr2n+0rA1iCK?=
 =?us-ascii?Q?P4jdIs6QQ3Wpy8Y9hbMeHRYaF9Mxp3afZaXaOWlXHkbF0nTqtt30Ju6iJ19c?=
 =?us-ascii?Q?lKF7hA3iPeVa37KM2qURjy5vngRuwBFxO/ocJodVsM02HOTpcMsEFZ3hqwMO?=
 =?us-ascii?Q?aP7BaPnVfiLKrDUkG2lHJOPYLfWGIRR8qNQFKo7eH2GG5Iie4ea+19l9QLWW?=
 =?us-ascii?Q?pYJUGVmoQv4lBQjCrPH0o7Dyvmm8nrQJYnJFJOsUOxN2vUaYRCnOA+TgOsH1?=
 =?us-ascii?Q?Qdyf8wQ0JlQ/bid8006D3MlRMGrsZfvDSt/WFOBwGej1ZW5RqJr5fmPoMlzP?=
 =?us-ascii?Q?yTAF5Y8z2+oS6B12LMFSrokwhKxz6JXJoCFJ2PDiLwz2A+izB5faTLBmxpsB?=
 =?us-ascii?Q?bTO1vue8pOZfWkxZaA2VV0mzcBnvl38BU7evHEZXX3HZD2qW0pbH3K35EzMi?=
 =?us-ascii?Q?rNDurZ9O+oBjxLLolsEwXSDFV0jIgUZFdnpEcmb4IqNP/jgZCsWkgh6GGU/0?=
 =?us-ascii?Q?nCeqp6G5AFVBy1Rgs5J7jVRZgmYq1lJ41gxIgEkIJ+DEpBuIQrKkBZ60MAWG?=
 =?us-ascii?Q?ay9VmuvpUm1W9UHxJDssY/ycCcOxpyDGLd9V4lyrZY0Rtyxt+CNKcs3bjtQ2?=
 =?us-ascii?Q?fATjEclNQlhn6/4ySk8LPhr1QH29jdE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35545325-e529-47ef-0045-08df2576a6d8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:24.6236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X484oRlrp9UWxxlOT9zlT0yAb/GmdOoxWtu4pL7ab2bgOMb0gWRhN0pkqPjSkhCEJGGlLAwkM05zErecOjpxEfGsUzbvw/sgDZQYDoo2Byw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247445

- Update homepage to github

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/powertop/powertop_2.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/powertop/powertop_2.16.1.bb b/meta/recipes=
-kernel/powertop/powertop_2.16.1.bb
index 4cfff1da1c..0d9b8ec15d 100644
--- a/meta/recipes-kernel/powertop/powertop_2.16.1.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.16.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Power usage tool"
 DESCRIPTION =3D "Linux tool to diagnose issues with power consumption and =
power management."
-HOMEPAGE =3D "https://01.org/powertop/"
+HOMEPAGE =3D "https://github.com/fenrus75/powertop"
 BUGTRACKER =3D "https://app.devzing.com/powertopbugs/bugzilla"
 DEPENDS =3D "ncurses libnl pciutils libtracefs"
 LICENSE =3D "GPL-2.0-only"

