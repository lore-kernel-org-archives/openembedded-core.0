Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CACC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 08:26:52 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40299.1782894408228268543
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 01:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aOoQcrG/;
 spf=pass (domain: est.tech, ip: 52.101.72.69, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbckBvv5882w0WCWU0vfg9wSHPmsSvrtMopwZG+hWmAk6eqADlZZh3ADLsscrlntGqeTa5iwfZESkMGR8e5meoVKgb56cMMLEpxSBW+5rRGmrSThaqPQmk5EMYLqIBajNhI6H3lEr7I7RjH7+1SgUrcrUbSXj73waVgzr3syswp5txtvuwuSup+RHLpEWS5kMHQreKhbtcjvZ01/Ym1j353yVfvkIy6UwhllKbSIRYd/zrOYoszQUnMRtJTsaNBjUrb6yhkdMIet6gtaSFYM8gGT0agn4ie1vMNZ/ZAeR7NQTzep4oOzYZ5BNpgf2vlsKItbXTjioXFrfZZcYr6hzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVojmzHQvz33KJ+KeTYGFMO99nOVGxErU9YnEoDTqjw=;
 b=sVKk1yoSrfzebYDYz3URLbv0fiKYMoONu1Gf+vdLIV1dQRZxbYwbf+gnUosQOOv4pFZYHnvlgNdapRnC/eWH+2Na7CWrSekOjAehzCEyRGcmeLGhfWbemI2rlBxL5lgmFOxdtKbrmK/J4Eym6ezR3nbZBQ/0uTd76flcQ+bmgLtrDuivPj73xxblh/J4Smfgfm2UWkrnwUQeWJoMj3gEEkzmOuT+ur6I2zqNg38Fc3BsYb6Xj9sOVq06DUh0+jK8ML4561N3jID6L7qsd5nyXHQsi4bJ6VugkZ/QC2fHQl6owXCgeQnb4jlLVIdhVhP0okFDGxaYm75TJD+Mg4WwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVojmzHQvz33KJ+KeTYGFMO99nOVGxErU9YnEoDTqjw=;
 b=aOoQcrG/X+tBRzeJrScY+rEMGDrJmQxLuYyw5R3zJnjoPljYRnIMCC4IrIAW8TmulepPP50Tpyq4PSfGjsjNkvhSSGFOlks5OGDKV47/Xuc+eySVXXrQAH98dbHg8Bgu34TJwUQoUR9YmH0hFKNVvXzShHvt+FQD855FnJvaUy5G9twwjQE/0lIip3Wd/ODNZByuYrUIPmIpFEtT+wfpRtojiBHuyaaKFMDtrCeu9BI4+TCQd2eVU9hTFczPXug1DFg+02frZusvWPmP4QmT/R+S31WETLC5jISRZbvRwvuKI4cRxrIU9S1hnC84QDZTb1+idXKLDhzyL6o+yMtTKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PRAP189MB1873.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:278::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 08:26:41 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 08:26:41 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [master][PATCH v2 0/2] gnupg update and fix outstanding CVE
Date: Wed,  1 Jul 2026 10:26:37 +0200
Message-ID: <20260701082639.69648-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0004.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::34) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PRAP189MB1873:EE_
X-MS-Office365-Filtering-Correlation-Id: 7562f72b-cc8d-40e3-c3c5-08ded74a7a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZuyyTdtDtFFRGEUv4EbVg9iG5xcnwoPlHgmZiOkSLt+nbfXnnVKZtWOF+cx07WkUjjId3kD9WV+3h6vNH1Amh388bWDJ3CA3QKL76zR7PmtpnrBVs/bv0uoN0ccNtj1OOhpZ1fNBQrNd5i46zD64WNohJiagb4mMN6tI8uf2Hw13X9X03HXuONzNPuY5pP544fhcerUEzk5BO+QwTAi8f23rX38PyetVyGVuQa284HSfY8LdqSFbZIVsyXugw8WcYeLIJTon99Pq7xpPnlXRRJetm1b2Qn5R3WnyvdEbEAzNmTOcuxJR8dzCjoU/lFQavTfrv8EN/qo2xk1dCYF0VgYzY1hA/HJ+IDaIgIT/XiF6zCu3dbM3x5ofwRf/JcEkry9n2fzEn2pzuRxWE5qrjzwmBLc7NRJrg0+XIkE3dR2TMWw59OjPorTkfKoPXm2f7ACjcmkOoj7+iGvO+RZYVBrL9hvH6IMZxqnxis01LoVvfw9tTG/rzx+XcsABMKsjbvkmORAZ2RH7Xppx2+zr03gqSxGOWKuQDKkVXm980dbR2jyvU4fU0++BTvOLbNb8xq2Ic/9LJfXZNHBK9akwzzGAbSAwTZzAbYQLVKVPhwCsf367zzZumbLPMGs/8ZCEOEZu/FU4Xk4dbupqdjvowUXnDQFtTO0ig6iWnJfq/2Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vHSy/6c9vhBolb6wPDHpYinc9aJnsBT9flqV8lNlCDpgulLuT1OI5qG8cKiu?=
 =?us-ascii?Q?Z6CfzWB2PzmJhZIoW+otkz9em1qsAbiw0JBssoJ9IGTuwnJi9Su9x5+Ktsf4?=
 =?us-ascii?Q?BfBuBVbig60cm1m93/aLvY6xnToDgwFciKL/S9Z+QdmyJd/Ti/rT4JhUyFze?=
 =?us-ascii?Q?8IA/utttu6yCSyRLd8eY1UcxlkciAeqYC+7W4FznrjVTc0W8OylIaj4LrFh2?=
 =?us-ascii?Q?YkXhYPV51mEqug64QMRIJfagAlQv5aiJyDTT+5wEqnchPYqZgzw/QirDxH9l?=
 =?us-ascii?Q?nJ4TE8h7mWo/0BMIFWfcqiLrhRrKdiZKKl6d/C08at1h5dQxrqloLvgHFE7I?=
 =?us-ascii?Q?mnsTue14q0AnHSqewrFjG+diEejo9VTFCAGn07R2o2p6I4Hdcj26yjhvs7L1?=
 =?us-ascii?Q?NYqrtEWWtcqFHti3Pj22qEBniQB1yJOfcKh5oi0s7RnvJw1TS+kZCxag0lQj?=
 =?us-ascii?Q?uwdBIqSgV1Ex/kqjOxM/DLSbgyUQYsHfXTuvhVos1g6FkM1Fo2Pi5NtwJLEj?=
 =?us-ascii?Q?Z+puOVxPND4uKMt5g+ZOqxPjk+9zkjyOrxNzRyDyf0HVj5ItILPHZfKafpeh?=
 =?us-ascii?Q?/UAYOEv5D7n8QT+BczAoz01Ty5bGZvb7ViLeCw6emimHpnoBJeJthGOH3sig?=
 =?us-ascii?Q?AWAoneon9FT6fxhiUU9fHSCNXGXWH57ATR8zG71+/RsJL04XdQ5YAD1bAFm3?=
 =?us-ascii?Q?6CiSzIfH0d/A90Fr4uay0Cs6WpN5yIlyGgrQp5wKPuUnQmsnIXqD7FOIfnTi?=
 =?us-ascii?Q?rwpYH1v5VCGwzhsW+cfru3/zq1cdqmks+J9taQHX7+8LtMEdaF85Rzv03aLv?=
 =?us-ascii?Q?W+hQuTaiX2wE4E1ipXrk/qEzRfm1wlOWiqaQpNqt+4DRHP5Sg/ZlBaszVa+j?=
 =?us-ascii?Q?Nb0Gsqh9vwX7or3GQmDi5Pb1F/NgwJKaRvRq0YTClQvlO+KNqQg0bAB+tGUE?=
 =?us-ascii?Q?N3fNw5mQTexMmvN9zn923QzAmdymQ5BZDTkagKPfeVg7juzpBkYR23av+7Va?=
 =?us-ascii?Q?93Q0Ga2LcWo67f5icMfOVraHRQGF05zj7Ik0yn7d4kEOCrXXtcN3d1yq/YmJ?=
 =?us-ascii?Q?ac5OrKvn4uOlOJ+vzuQ67gJzOJ1Ql52coZUhvQ+SEc3GR1+2pyD3VRud7t9K?=
 =?us-ascii?Q?MMGNc1Vab8PPUydOQ7Bxn/rBKv8ozUyh1W02foDEYkFat8ouYonQgF2zT7HZ?=
 =?us-ascii?Q?BnmEUPe58faM6/05K+yI38YPEWF/Oi7PZPgi5/PY2DYh/FjmIORfOr8aJoLv?=
 =?us-ascii?Q?/v12BwzdQ1mLZBrX4BoZUMsxfLAFem/eSWL+DRZqzN8NxM0+oA3YaRBkoIlN?=
 =?us-ascii?Q?jImXJPKHpMjZ9xfEJkrXCA7RHhN8V8kFa8lBvyvjFRdYV00FFcv89APWcNMD?=
 =?us-ascii?Q?+S0FrZLaFwkvXsbCjb7DtiYLgJgXX1sUFjRA01bGeNFi4CiiLQMfYvdSjO3L?=
 =?us-ascii?Q?t++edxkorMUPSzpK7lJfg9YwAgdI1PqRnpVyypzCRiq2L2kR9DMEyhmE8LeH?=
 =?us-ascii?Q?3ii8sUWxLUUSeR+sKZv2SRykXDzvAp7WTFhigIjeC0DHYuI1a2JakGYNOCBe?=
 =?us-ascii?Q?ul93jn2RvRPmx/XFKh/ImEKeaT394BE2WbqJYTJQBrZRxu2JdEzUmPM1dtVT?=
 =?us-ascii?Q?9fHG/SDlFxV4XLNUtkMF8QfOazBfz5tW10/hQGihpQYk1nrp0TVItzmzOM6B?=
 =?us-ascii?Q?Bbpg/RjScWo9b+a/I8aARWB04VvNsXe42DAEEZXh5VXkproJX6KUkPJga9YL?=
 =?us-ascii?Q?LFxeh7d1CA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7562f72b-cc8d-40e3-c3c5-08ded74a7a3b
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 08:26:41.3280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: msP/ftYJH14im2CxlJOd1UR07jRRHV3ZHyF/SCqUeyZLZXRELlmWX9tcfzPcU/8lYqJMIabE5hsdVTIKK5ZDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239955

In order to squash multiple smaller bugs, bump from version 2.5.17->2.5.20,
however that does not resolve CVE-2026-57062, so it is backported from gnup=
g
master.

Changes compared to v1:
  - remove accidentally slipped in SRCREV in gnupg recipe

Roland Kovacs (2):
  gnupg: Upgrade 2.5.17 -> 2.5.20
  gnupg: fix CVE-2026-57062

 .../gnupg/gnupg/CVE-2026-57062.patch          | 43 +++++++++++++++++++
 .../{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb}      |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
95%)

--=20
2.34.1


