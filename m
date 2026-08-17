Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D025DC5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 07:53:39 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25146.1786953217724928103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 00:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E5msVY09;
 spf=pass (domain: est.tech, ip: 52.101.65.16, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXkqWBJ/XIX0DiU7QUoRz4mShf4at5Fx3CHfopQ0TFUgY9t5n2/LBVnsr4Q+FXCRR9nTn26uzIkXvQnHWCiuVWH2VOzLOQC6EGbsKYqI62cQ+kZ6mQqJ6yNxCiXxisXpspP0s3Td2yrTfueiHaqoYD9dQe1krSJnCTYV9KFO1Tc/Gu/D0S1xVLGX3B4Qq1L1sra7Aobje/Gzmel/5yPbDxjcK+JEYnfbQi++OvAOVSjJMSp21JABWMGoS8tWZ0SjNmwO1cTQ/Mql7w3uWIHcMBFXE2zKJf4U5mV+bWcOq7SYqGyzzenMCIfRAdzUgC35uuBCPCtuLFnaC3YOVnRZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYKwTp+VCystzTpa+UiJqqGUk/uZ+rvuhMBiCEMAB4w=;
 b=qRqIUo7Tm0+JzIntNuXKTvmBxjxgKQLEKAtvhium2KtrKVrd8i3WrYNGHzquAuW2dQQzt7nMrzRMVaDeGLp5p3EGf4A2fY5Bhxc7VpMStGn7Z3VaW2GOTStS6tYHXcmqJ/LFfLwLjz883RXwMglrSMNfHcAhJM7T2Dzi/9p7ynVBvcI32zOz22SdeiUcWBfBthlKfQW2TIC8RNm7OpWXisQd4gENxtf6uiezCNp0noKow1PI6grYz6oWn6ndPnm+KCksloB5w1CdQrC26Fp08xPPiqjIbPYGTTYoU58tcSYOzypRNLn52zrasejmcezEx+0xnZvWR5qXyAm/9NqQtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYKwTp+VCystzTpa+UiJqqGUk/uZ+rvuhMBiCEMAB4w=;
 b=E5msVY09qxek6Zc2gwNYHiGJ3kPLbcShdPGir3oWB851p+81wO4xC1pouR3OdshFPUHIcDaMiEtN43T8EzO+huUAECEBHhUwPvOUk4limmUm5fFLUMWR+j7/+b+PZtAsSq2hDeso3UOO/AUWWO5EvHx0YVrlLdmYrb6bu6cuAwXWAPb0yMXXpT4rzkyRswXI440QPhCARBLwQozBKEoOhNDr8yuri9lLoq5x16/OAeEpiViAk9vXvkS9hs3Juz+v0wWP444FZzMRhnUpchJ3ZJZOg/gucb//L5FqpXD2umoDyfLQgb7aV1oGvz97Zjkl9d0OphIZgxCrGo9gmkKFNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by PA3P189MB3261.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 07:53:33 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 07:53:33 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] procps: ptest: skip kill test due to race condition
Date: Mon, 17 Aug 2026 09:53:27 +0200
Message-ID: <20260817075327.8764-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::16) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|PA3P189MB3261:EE_
X-MS-Office365-Filtering-Correlation-Id: 22af37b8-f4bc-471d-adf6-08defc34a2cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|13003099007|3023799007|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cRoJEO+XvQLSJTdg2ChcyEAhJM/5TxW6Wf4E9pBxhiDgsqmQ5KoDoL37Bud01f3wRVhk5e+J4BLVIQlkg+rxpJhAf7qBplm7QvEcT9Fxgizj7ls9wNMcaQASUfHnyL7oHohHQpKhcPv+jv+7Qwrpz9U9q1tM5IximgiMaLSMvfdSu0n4alHQny2MHQE8p59d9yeh5LNYo/XqiImhwDEHBF8j4t3I9HCoGtfGPI3o09tk79hJxefeFRrWBV3wSTotqGmYKhFDgP02JeYlKpt4Ps8PFiySJgGmhc0x6Pu486iFjYSe3i6ZieNG/9fZlU+F1f9s0hEfj+iyeLQcRhNn0B94FrDAE05wsjJhzzERdY2YRvguboB3pK0uFUrac7NBiHIgmwz20EOrK42YyjbX0BUz+Moz8S8W9IjESB3NXj7eyDdIZtzX0tDcKU+qUy3OeQfOB26pdGnKLWz5uqZalxAzHz1L6qtxXWwg/QOUFt3kNZ73UeoKyVZJ7dzwBCPZaUlbZd8EMcvQdLFELqk5VHaYvBC+rMpaggpOjfFe1schB7CPfQebEdBzB51ogT1xFfKNS8TTFyBM+VYQBouZeySU/Sf1vuP6RftevKKhOiYYoJzCAw0vH97qlRGYbM3/NWPMjwpzxBSnImT4PTdSzetukvmWnket49GsqBTbMrI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(13003099007)(3023799007)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?13ax8zhlATIGwLKGLb+0XtM9KOzQtzzwSdHN9EHrC1J1hsIHgE7qNmjI/kR+?=
 =?us-ascii?Q?A7Fj34/q7VvE6O33sOhxySj7ptnLxcANIkOdaMS5ezlyPcSB8v2ooX5njH7g?=
 =?us-ascii?Q?G8kTM2nBgqOj936mLe/+CzroU80STKM10x0D8Z1B21cdQmy5ZClM4wXTHQou?=
 =?us-ascii?Q?rZAFUinoVaTwE7enniiLwiPvHIPQ2CDaMsO+X2muPQJUMRrlRvvKA1bxBc69?=
 =?us-ascii?Q?OSCOEU4yDn/hT1enmdyy8Ua04zO4rQyN48U/K6K1LICN1f9DslinZdU7WQXk?=
 =?us-ascii?Q?59oqLsJk5ECWYHOt5l3ocJip8al93c4t03d7gT838IENKjYZ7f8cMWhUtXi2?=
 =?us-ascii?Q?SzLarMvR1pkjhXyRrz7wQ+PL12Kjz3K8DxxkND22GXVFtSyoqWFZzxDKdVsj?=
 =?us-ascii?Q?gzaKmfZaoG+piNuRg+DMZBlu1lTibOF/cXW/1Gq+qBpCnUikw2Q/n6sd2dFP?=
 =?us-ascii?Q?ADG4P34xUMunonOe6xwVtRuPVFw5WivvcAot8fDNZK9E516dRgIIpDRi7vbe?=
 =?us-ascii?Q?QWhDCJAGtD2utjQkIH49G9oyMqMUyZMcw+epi2QFJO4HR66Dx242jaKTKAA1?=
 =?us-ascii?Q?7bXONEROoBb/8fuEzrv/3gzVlvhy9AZjL2W+VblsgoryCLpSi9B7DUW3YLGS?=
 =?us-ascii?Q?/VAa/fg0kU024aFiKBR0CWxelBSVDPObCVJIQ+h51ZxbTNUrYNR/4XgacIXL?=
 =?us-ascii?Q?Z9wRDcYGK/mDW0506SzpcW1RQFv7r4N4p4u1eQ6BSzFjIsdRNMRb0D+dn/Oz?=
 =?us-ascii?Q?nd36WFlovOprgjd8fWvF9djx2rqiIVIGa22Px0hc6RkE1F3FUNUrg3KjSTqt?=
 =?us-ascii?Q?T2IgzBEGuGsuocx3jfVUil4Fiw7qR7TpGsBCMyjOS5CpBvKAa5N35CtvJAi3?=
 =?us-ascii?Q?Wha2ikSzRbknpp1yvbBFblKtMRlMtSI1UfS9aRPEB3upughF7pqqnmyMt1RL?=
 =?us-ascii?Q?Sy3oFJZVi9zJ3CxaxrQHe+lfzlTWx9ulo4Tdmv1752yGNx+FizzSUnEGfd+N?=
 =?us-ascii?Q?cwADYXY3pShURqvINFSoLGk0XsALREuOU+qonG+IuV8Ite38pk29PD/9etxE?=
 =?us-ascii?Q?RKj0M0MStg0wzbSSCbz4s0HENHS9wvm/u84/oCdEAxmuEfrTIQyGbCujlK9Z?=
 =?us-ascii?Q?UV2VmfvbQ92+IZ1+PXw6Q1gkB5eb3uhovc2WWjpgwBhHHWjmsFg+fl98eM/K?=
 =?us-ascii?Q?qU/xkqNpB9h1JOWoAaTUcW/txfXT8MFbKuhqX+8og/ebK+kD/EGg85RWMGuc?=
 =?us-ascii?Q?exAdQAGMZ2bvPuimZW5DyCnezb9B7QlSYtPDwKeIYq9TNTqB42qfUYq+veBK?=
 =?us-ascii?Q?SzDz8kRWskitvSD/l+S09m5XxWb/0z9gnY/xvpqD49Nl9zjBNaleYhz0NUIZ?=
 =?us-ascii?Q?w1fr7FXVOIHOoYEAOXjrV+QPyElV9H5XiK5AVXDQPy/LPnIUFoKzREX5PaDF?=
 =?us-ascii?Q?0VP7f8B/wFSVdlSdYDhYODbxtfpSVQNHG2+Elb7+1/xe2kxCxprX9N4m9Rdp?=
 =?us-ascii?Q?CrSWNmKWYZR2RIkTHZ/veUAeQRXWBg44Q5EwK4VmUZjZWwozpS0ozwLPHUgD?=
 =?us-ascii?Q?KuBW1E2it6V9rb4PGao/R2GOgYqk4z/MTuvRKFYXqDJO+lTG7939TyibJHaj?=
 =?us-ascii?Q?5Sp29gGZCZAbaTjZBoni3sA9pPmFNJkbZ3dy3uIhCo6CHhJqEbYmDGznrsKS?=
 =?us-ascii?Q?HCKFamPKuwmbkECBkOWWuee/nwDLEzcdwR0XvLaWj194Un3YYoSh3AMV+5+i?=
 =?us-ascii?Q?G6jpBu/SxQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 22af37b8-f4bc-471d-adf6-08defc34a2cd
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 07:53:33.3836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FvbGEkgIIVfbbSgNeoc49LtQ3X3SEbKjrJ5wLQtB0Yw4r8HWxr/pTA4dyyupfrEohGRNJCZPYyAfqcDv+fTv5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3261
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 07:53:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243598

The kill dejagnu test has a race condition where the test_process helper
can exit or become unavailable before the expect script reads its output,
resulting in 'spawn id not open' errors. This causes intermittent
'kill with SIGUSR1' failures on the autobuilder, particularly on
qemuarm64.

This is tracked upstream at https://gitlab.com/procps-ng/procps/-/issues/42=
3

[YOCTO #16263]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-extended/procps/procps/run-ptest | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recipes-e=
xtended/procps/procps/run-ptest
index 7e132653b0..40dbd35265 100644
--- a/meta/recipes-extended/procps/procps/run-ptest
+++ b/meta/recipes-extended/procps/procps/run-ptest
@@ -3,6 +3,13 @@
 # Run testsuite which use dejagnu
 cd ./testsuite
 for tool in @DEJATOOL@; do
+    # Skip the kill test as it has a race condition where test_process
+    # can exit before the expect script reads from it, causing
+    # "spawn id not open" errors (upstream: https://gitlab.com/procps-ng/p=
rocps/-/issues/423)
+    if [ "$tool" =3D "kill" ]; then
+        echo "SKIP: kill (flaky, upstream issue #423)"
+        continue
+    fi
     runtest -a --tool $tool --outdir ../log
 done
 cd -
--=20
2.43.0


