Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95765C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23118.1784641583863960667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=mWxni6MW;
 spf=pass (domain: est.tech, ip: 52.101.65.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puOsjFsTxtN+eX2LmL7NZRDmZXaQvWXZ6+wOduqcvjQl/ik1wWsPZW7oXcy1WhWvvtNy0nN7ickeC2UovkiN5D+JkwsxDLdo+J6VDQMwENRlOGhqt8PGKrfTsDWhNbTD7Z4BbPEsIgm0fj4wqiIorSqyxMVDNxtO1RRo5OBQh4GXKFghpUO356VTKJt4hoMz45SS+RfOPaRXWyS7oKljTZzLZEm3mCBI8dNSc/P6eW7XzcfS4JeWI/Nf7njIa8F1Q9J0GtlZ3nalYdzgZhzqY8ryPi3ATFeNqAD7x1pqKoqeVfjM0KWeqlklrzVlBn59LZ9VL+vx3rjjdMiGgEdyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNr7rd4OZZFxM4ZbPpP2bJx+38CfzQyhX1MrlPTCxKE=;
 b=l7YxQMP76whGQAorNc9OwSOvmIbRisGKsenJ5DtTL3lSlh1Lcre2FnWMZsZyLP4uojHXf3GliGwhNJGIGS3mVFOpMGkPivYC0u4O6amDbqr52miTj+yoVVkKIztJSsaGbRTo2P/PqUSLARjVlwp8aqgebFeHDZdr4zm6S18bId+HfbTE8UnAjVEiw4Rft/mvZeD3k1t/2Ne06wcjuEMsuSX7EzpiXFzx5SA03XIXbrRMSPOhfDZAToDZMaquZvADlYRIi++rsrpnZvc9CVzVKm0Yo1SoMx56H0KDugFA1DQW+bI2yRNukD4xdhGRxkQfkU48rAzh4J7UftROwFXodA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TNr7rd4OZZFxM4ZbPpP2bJx+38CfzQyhX1MrlPTCxKE=;
 b=mWxni6MW9R0ZyzGHpGpPparzzFuUIUFQKoyhAmGGQAtM6wWIW7nliPaQUPBGucqE6NF8FMJmJRFoT80EjxBtMdusw0uCKMxCdXENYDh/UjTlyD8mtbDf3t4LcSLUU3U2lG6goXMyjd3wgnMdfCFl/O6JbTLmE9OLvh22oRIb/9YXPI7RiDV5TBd6msF7VUsAWeobYdxEHwvTjqz9oW80lhwVaC3zlOorwPtb+rOcpd5le4Xsb18lBDkJqKOx/KlOOzDHvbLDEEL5AnMRuA61aUShwX22dJ0y57VCV8O4BMlbt/AH3cb5FWDcP+zAoYDvLyGa1V9tmpULvvNhftD6rQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:20 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 0/3] perl: fix multiple CVEs
Date: Tue, 21 Jul 2026 15:46:13 +0200
Message-ID: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0019.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::24) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 138452fb-d2c4-474c-f1ce-08dee72e71ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	yI9f+TajEDNIEzD4aP83Sb2wqop14NT0YiP+ERHvBUITn9mgc52vOIVSWtCvY25VBFh9gYLKmGy+KWYiOH89tmmcYZNyO3iERG/JCLKUv3m12a5zqTX3Oo7wVDtxRfGC2fkvCTRs3ldhz934PHGgdbdjMhRJsH1/XBCDEkaEvMhJ3294MnkmcdypbI6kVT617+yHcP56Y8gfaNy4kmiRBlo3JsyZ0vc3bZpXrOd4p9FfUwldSulqsuGaegwTKfW/DkQeH7jsltA4PEquNTwWc+WSLBe2261IV+0W5gmA1ro+5F/Hh/fUdQX3Z+EHei/bKdKIm5YVaD5yzUvfOiLKMveVh02FisRDT7owBBkWCWyLIfTc7ma41YLrbbtyVML491BzFIJcr5nCwKrHJ3l3sCBrWVpJNOfijM5RYH05G8zavqqA0m7bWymgYS4aZd/ClznLC43EBHs99aoKUJz6vkB6DaBfLAYJPnXhiwHyN5E6DYi9du/7m0LY3Ns/VSWBVcMmUjGp78pIqYUJU3ZA0M/9ibAzM4Oq5MMZsryloozuNjHmUBSHs3/3DzmKDyOQvMWJzd043Yamz23b9/DJHCfhc7yeLlIk6brNGUkCcy7KIrX6AkAZWI/5NCs+B/O5jqDqRl5ukvZfxmXl5k0yILuLXsTuD2vAx0LEYo940KQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GZoY5IacdMEmTuzowSa+JUvlebdovNbVsvf8Vbm7vtOKNxt0R4RE9TXQLD/m?=
 =?us-ascii?Q?Ddw6E4h4ARJD9VGkV/U+lFW9RCGvSQjTiijNQpubCaeplwBLNfXo1c10I5PC?=
 =?us-ascii?Q?ayMe13Y9eYGKT7qLlgYpdCZ3Zk0Me1Db397DI+PPm5i1+k5w8a6p4rfRPqD3?=
 =?us-ascii?Q?cCUZHSd8wS+DW+mP3DKgJfq8d8TVzKGmRja0rjqDPxLQ2KnaquTD+mLhYnF1?=
 =?us-ascii?Q?Pr1pKfRfnqfqIhFEYkOws8B38serAzwe1JtqGH3vKxgEdcvRYZn99lLFdxEb?=
 =?us-ascii?Q?Imj+8dndgMvKRuNo6n6hnYhP1J3PqHnbc9Mse4ZRfXRF/Rqom0gAkqRj0SFe?=
 =?us-ascii?Q?ic5C0y9/RzduzIFqtZEGPLHxeczyrAzPYYoQEaH+LgBEeg+K+QXDev5t354N?=
 =?us-ascii?Q?K+RTJPWz/jFrmSpyt9xpBUomC9cxStZrR7GYskma6glIvC00xnMa/MKlDJBe?=
 =?us-ascii?Q?zXt6XoD85+w0GOhLy0Kb5qkhV1lzBiwoZlrs4xluXbonYbOeVLxGh52GzDXM?=
 =?us-ascii?Q?/Dt1z8zKltE41LIalijhWFUf4tWOzsWBGYHjOhx610EyCDrbeT3Fu/yt+eKS?=
 =?us-ascii?Q?pimlEd4tnAv6RSdg66bla4hYB6yJ4DoqNTRhQPtnS3wX16mxGGjsf7aWNwa5?=
 =?us-ascii?Q?+Fb/4IVZEyJ9FHzFhM/4mtc1E4tUQIib1LX0HULFBAEvArLp2JDXFKby5/sN?=
 =?us-ascii?Q?NH1X6BKvKzulBIjfKHbhuNzBBDI8YWJ8uthY+VeGMXoE1T3kvLG6UdPaSK4M?=
 =?us-ascii?Q?z4Rr9nIndhcEvt9NoMxzc1eJhSwgV3blyIWGoXvBsCEWFaZI6yRZDPCuT2Qc?=
 =?us-ascii?Q?x1AzKlGD3n7Tu46buoSP80M8DuKNZ6/G4CiyOW/4UJA1TIrRSk4jw1Oq8b2g?=
 =?us-ascii?Q?Tt1FQKpmjNLwroNZxStlMmEVJI15pNFgNdLWATu0Qik/Geu6XSMuXCnxeMxQ?=
 =?us-ascii?Q?1nUS2RkkTKCSpri+qRAjisU5sgKS/eU5T0aqaCks8BQoVyro2TPJ0lh+v7BD?=
 =?us-ascii?Q?13W2zX1tNrjFu/yjyjZ/AvS55W+B0ZONHTdW2oPJCB39a+ISVNGH6qo4TR/8?=
 =?us-ascii?Q?PM9jN8kLns7XR728I7uTrhAZYWSPPZ7hVMUok7nSps+gK4rKGp0mWCqvbZ2Z?=
 =?us-ascii?Q?DIo6kUmRgLs0O+HxXoQOKT5x61NoXKgWzxdKgxxF68OOe4Ec7erNaooOqMaH?=
 =?us-ascii?Q?Ty5IRicb7n/e9vr12MLum/6dlU5/5eEnkgI2EEtlXsLMHW9f4I9YeISjk1QC?=
 =?us-ascii?Q?vbHQybLGQz27DDERu4MHNfEhGfvZ/8vOvMk87drJJgNCT91MBTr1UlMUmxaL?=
 =?us-ascii?Q?MzURQmkOiGWqkl9xj6YA6tD8RRuNLV4yihrKpRYEIooTT5Lz5+9TmaeFZ6s2?=
 =?us-ascii?Q?oberZD6XCgFb1tmvQTe0OOBdOmPV3CfccxoBFQ0yMtOSbiEt/Hn0PjRez1hJ?=
 =?us-ascii?Q?wx9qWcAX/ggy4QSJTA4G52owaKdEMeeqetSTX3QYuHX3/CDMu3VM9bOHCUWN?=
 =?us-ascii?Q?K0AoExaXg93tCcjU/nyT5eIAj/qJokq5qkoU1rbggiuFbMa0ZhT6+Uc1pbws?=
 =?us-ascii?Q?zPDfwMfRsaavatoweiJNWtDh91SQ3kSi0ANZu6l+ENqCS6Zk7jsuR3BOv89W?=
 =?us-ascii?Q?gNGMYCtbuQ1Rz0nwdkHkjl5tMun18SsO/aoe7Ofw3HsZcj9A/5FmFYM35MZ1?=
 =?us-ascii?Q?Zp5RPMvIkC6GScdR3p31I74bbs6KkAwpmQnOGDuRNNJWiXHwR6Ejds7h2sAW?=
 =?us-ascii?Q?Xl+MXfha42hD6MvElIGVSQDvejQc3Xc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 138452fb-d2c4-474c-f1ce-08dee72e71ff
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:20.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4gV+6S0fvxIhmSiB/Yki6qqEgWIhtesjw6qnNTyEfX3o+4YlvBsi2ahbh8jLwoIzG9iFAQJbK0mmzIojzdp97zot0WANEJCZVC9UXitp2TQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241525

Fix three security vulnerabilities in perl 5.38.4:

- CVE-2026-13221: regex trie overflow causing incorrect matches when
  alternation has more than 65535 fixed string branches (CVSS 9.1)
- CVE-2026-57432: integer overflow in pack/unpack leading to
  out-of-bounds heap read (CVSS 8.4)
- CVE-2025-40909: threads working directory race condition allowing
  file operations to target unintended paths

CVE-2025-40909 is fixed upstream in perl 5.42.0. CVE-2026-13221 and
CVE-2026-57432 are fixed upstream in perl 5.44.0.

Jaipaul Cheernam (3):
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432
  perl: fix CVE-2025-40909

 .../perl/files/CVE-2025-40909.patch           | 412 ++++++++++++++++++
 .../perl/files/CVE-2026-13221.patch           |  75 ++++
 .../perl/files/CVE-2026-57432-01.patch        |  52 +++
 .../perl/files/CVE-2026-57432-02.patch        |  34 ++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |   4 +
 5 files changed, 577 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2025-40909.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patc=
h
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patc=
h


