Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4F0CA600B
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sJgHeMte;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEyhz/mNCBGZ/cvtO8lewZqgJsuACX5yM1JCp2tumVCxr20tHwstUL/Eka3fYwshf8G4hi4WlApeHiUS9vURUSZkfOs3ScNDOULppPBUUo9vR68crBbnLTcy2gfpmZkXu66+ecl78OMWQstMHP7BaDYb24VAQGqZUm1W/IzlsK9NmxDNXpCpbnxNL0aF8vUgArSTeSvkHJNGld/cpfggxp47wfXAU8HOjlU0h6P8cK8NczndIO7XfCx1CWRtA1oFZcAg1FPxKJ8y47uzzwnOCAY60xSEudO1cEO5GQ/MnQfrf1M0nB9e9KWNCVmIyLb7ssRtLcgDjzhdRqEGRfVh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=REHTxd6RAOXl4WRpw34EyU9YAhRRJuVGG+gC0ccn3Dc=;
 b=t7e0eZG1FjIfEr6PmnkMq2pumN1oDRJQVjPsHkODKr0kiDIFMa/+ibe2jroECRrseXaGVBqdTD+a7XsOdjL7xys4kKfr3enr83tgEwKwg4YihUl9M/AhIRyKwbuhUVZJZpyd7IVhH+63UOvgxF0pd4uPLRixPRRGyvLVpBZjGv7nYdjly74qyxiQqiz5z1Hj0byfNmPmRZin5yEi7YN0foTQ0UqDmSmZIktk3Wcj/XRhGwaWYnmBrY7ajrf5Z01iPnOuZP30aVHs143DufLy84z44NBEf6NXdKPnb/KFNBSLnnvtHGy7O2LElsupwXBQwMu+U4I+8oScSSxw/aJq7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REHTxd6RAOXl4WRpw34EyU9YAhRRJuVGG+gC0ccn3Dc=;
 b=sJgHeMtexiUPm11qTcwnMMrIOYsMtKATzRauQnkwRpBtJ7Bnc/u8XXb//tNW3ixEUXgwnimjADhevYzSxU9Vk5HY/KZsVPcCL06WfY4bo9/7hNLyjDKoTaz806U1kSIQA0w9r+FvAL/Cwyh23SgjlVa5FeXUduqtWOnyfG421mLo20fu2VIArAjw9ZGQy3oJGRLslpYPBe0oR+C/OOgcoj5e9OXP6W03Gzcq71FlqyRlghl9rhYwJmki2JUIpg/8v8B/HV78MooIwLCWYJ8WE13pOgjJA/cfiwBrdrBCWGJg2mEGUbLIkPLgBCqQ0YiQWq07GIMqYByWTn5WiU1BVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:28 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:28 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] python3-more-itertools: upgrade 10.8.0 -> 11.1.0
Date: Wed,  7 Oct 2026 07:58:19 +0200
Message-ID: <20261007055820.59633-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::34) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: ef697c07-5054-499b-f1b6-08df24380235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	miQkJwwajPNQCCvLl69vHJ4Y07YXbxb4soQnphbVgMRYWPHXYUbi6dHl/l91j6Mce7OiFj05JHgIbZJAvE05XpQPofKy35cL5DAOHTNzBIlXRRmDYnW25rvMsDuay49EEwcex8MhH93TmpKgLFS1jQZSuCkt4gM3Y+AWJnxq74ym9KlQJW7LVPID46+ct82z42Bzcu1dJKvcuGp6CXMPXZrbg7c0NR+4sFUJQnoNc9OUiJRRw3+LpCsS0+bt7jFb9shiRQhEbMtSJE3H5DM2ML+mLnDfYpCtlvqQPsTnByj48aQAa8BEAFwxswqrVjh8ALsX9mfsJmcbo7Q59i7a6RzVY5rEUSrTQnsZ11+JKNARWyr8bIH4JwvbNe7ZCy7pD8TWncUFSTe30DxOit6jDQSX7cN28CBbvhNC7SIH/TpQd1LgeozUF8UasM5HcebzzImkQbO1w/iKdWO4KH4urWPd25aG/qGSJjaTwCkx+lWHLY4XYYzc1XxfTacNI34ygAKuYu96V3jGQOlXQMnIV0Yzfj1eAwwIIGfUQLjjl+nmTzQ8DH6lyNlQ8uhFA7/ZcKx0aPF+IytCKd1CZXcyWlMtGtgAATK2XK1Pkd9Dg92CEmEpCD3yhd2H94kEggP3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T+NfykVTj3NlKAr80ahG2qHl2bbqa4X6oF7kO2p0vYYVTuzYow20TKKbOmqr?=
 =?us-ascii?Q?xVmoh0JASmUmWEWaOm+iX1Y/+666pE4Z/2HqIDRIh6/qebt7glrfDwNu4nML?=
 =?us-ascii?Q?i7bDTtv1yBV5wuI3fdjckOlmO91nju2OesV0MIpfuRD5mIhsV9Q7Phv00QRB?=
 =?us-ascii?Q?rLL5Qa/xNbL40ck7u0LB3KQucxm9u+nRBEj3grzqtzYcfllTUJlR2RBYYaaN?=
 =?us-ascii?Q?NjZvUr1gBaZZ6wMhFZqiU9rKVQYH2egcQjVXE4TUuTiQJNd0DEwkq7bgWmZl?=
 =?us-ascii?Q?RO8lfiEFxJbgQFMliHs+XI7kFigjeLL6JQAPHLE9i6uoCQIY0hv43cGs1T9P?=
 =?us-ascii?Q?ZMgwA1iZraadBMExlfIz/EPhvmzJS63vZe0may773tyHvyE+XwwIwzGZbv8W?=
 =?us-ascii?Q?/7aI8wW49OEUs6ReGDYr7zXMOlAJfoXDUz9gP2gZk5VE6DPL6T5y1haJi03V?=
 =?us-ascii?Q?WX1eRd5P3lxSMCgp53pNpRyqijQgLDE21ud9VpjxXTC0NxVFfpbw/L5EJr7/?=
 =?us-ascii?Q?ln75CHAVZS6xaRckS5KDifU97C0TaIw4GoKFvwxQ+qxGyX3d6rt9YoeMkZtW?=
 =?us-ascii?Q?/xqcZ7nmZvKcUTOJXS4zMi/m8vlkGFoYV1lFe1hjlzluFaNfa/OfPsu3kni0?=
 =?us-ascii?Q?pfO98QRkoWHSMgntpytyYGtPljXkGzg49UZSUDW6aiMTMPvHMqHyukmoroHp?=
 =?us-ascii?Q?3x9OyxysNYf/xLeXpNLnZS/S1eZaOwPHAjP4cXPERHsTCKCaF+ayGV5Vcmle?=
 =?us-ascii?Q?XNJNrbUR4FlwlIUUbdQAR7z3S+V7RBBoeFAeO4GzaGcC6sLO89gNHi9yaJWY?=
 =?us-ascii?Q?MOdFdNHTsM0qqRm+Lo3WG1nlfkzicbYI+8HEgCyE4WZtwlEoFBsMyDEY4voF?=
 =?us-ascii?Q?VVbdyEerDlo5Aq5gaDlE+Z2vzLmBkbX9IzGRaIV3nyoa0zbZ6zfF+vXj0vIW?=
 =?us-ascii?Q?BGyuLP2WzIvHyFMGkHcJEjgojDo/dzaY7C1o44/t0caJR51I38N4woIoCj53?=
 =?us-ascii?Q?nQmWnrwqGW1GW2+dfJrhrLM0b74KujVLQvaqkQRm59RFEhQgzy/h+fbetm+z?=
 =?us-ascii?Q?n00Ges+VuD5MephDVithZ+k+YX1PuDnl5PEOrw7+uaQYxoJVh8cRpSHQjxpk?=
 =?us-ascii?Q?grWcFMjpUvscH1abuJRamQvtGdvwzrthJwkmWfkH55JtVBlRSM8hlFIWgwJg?=
 =?us-ascii?Q?vzqz4UQnc24xoKRKmdOnmPvrmICb1PtfVNPkyJrDtrcCgyGak8GoVskW7WXC?=
 =?us-ascii?Q?FVMyfYEGPhonU5P2pokoJA0AtuGBlpLNdeitadbEqMeK8W4jw66HL9E91TkB?=
 =?us-ascii?Q?dVQ3cteILrTtgeqFb/E/eQh7fFmcVOGJUVGZOnTjTz+Uja6hMKgT20FlDFFe?=
 =?us-ascii?Q?2umerRi6Asj5rgh4xEUhCL11jBffwohjyaIvVZQ/zxcgnVByuVNrLkq78/zO?=
 =?us-ascii?Q?W6Bh9Z5NDiiofE6mGKhLaLf8VSO2C9nKfbdgvMaPO8+E2il6CYbi4OW316zn?=
 =?us-ascii?Q?r+Nyd7QrcJ26aie1XSMlF52f5tNi4EexHekiQpNj5DcZ2YAo9FDXvuszOY+X?=
 =?us-ascii?Q?vdZT4f7Fr8OqA2Z+Fm/O9K41hehjBvik+feb2vsYEZTJ98fOtYAn0KkrcU2R?=
 =?us-ascii?Q?Tgdyup1bYCWZDkQ9PivNjS3d0mr5NHkm8GMOsCxXYIixks7RCAQ4ulxUrDeK?=
 =?us-ascii?Q?k1Spt2SY4DrDtTeI4CpMmJk7F53h4ku3vXv4NQZYUeEWD/OMEAhux18O4bM4?=
 =?us-ascii?Q?MP6JMvyAB5aQyCWMiKUbAc1L8cZvBbE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ef697c07-5054-499b-f1b6-08df24380235
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:28.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZ48I3viOnyhlz7JbDC6w9wlpRpKGLNJ7sRePfeWgkeLSAazhgnzUrSOt27RtkbEFucGoYnDWOfQ8xVoignFZHP6LMiFD94NFDw0lzAAeK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247373

changeLog: https://more-itertools.readthedocs.io/en/stable/versions.html#id=
1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...ore-itertools_10.8.0.bb =3D> python3-more-itertools_11.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-more-itertools_10.8.0.bb =3D>=
 python3-more-itertools_11.1.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb =
b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
rename to meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
index 053197ea5c..2ea5af632a 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_10.8.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_11.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/erikrose/more-itertools"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3396ea30f9d21389d7857719816f83b=
5"
=20
-SRC_URI[sha256sum] =3D "f638ddf8a1a0d134181275fb5d58b086ead7c6a72429ad725c=
67503f13ba30bd"
+SRC_URI[sha256sum] =3D "48e8f4d9e7e5878571ecf6f2b4e57634f93cd474cc8cfbd237=
6f2d11b396e30d"
=20
 inherit pypi python_flit_core ptest-python-pytest
=20

