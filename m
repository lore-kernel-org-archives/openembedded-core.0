Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FADACA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 13:20:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13152.1791811232994244268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 06:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=M3/sHnKA;
 spf=pass (domain: est.tech, ip: 52.101.84.61, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IeTfizt1PAkiK8eYK9YHZC/6NUAS69Uh+e3ZUyaUDC1pI5RjnOVUlY06IAsb1AClBGANhsVVXBN3d5kFbevRYdPSzNBWFNSY3/EBFEfx43J88FM4wwTvXoqa/wmEGAZl5JlfrInY2LhM6hOpgiL/cdWTVWjqoi4adeXQHOPWoPKgFu/8mR5GsfXvd6Ptvqy3OzIgb8baonhpin29WMO5m4wZLG/PdABDJgK8f/UFb4u7hrJDd4K2KykZvPMmgKNIsjE4gqk9LRrrGaXS2XjxRFmtg5thNJ3zBLbt76viLgnuM+w19OxrddkkJRnf+BafNgSEEfBiDTqa0lHS7kgP4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pRScWnSLucA/3N0/a4wP/b7EkLXrlP/I0+OST4kmpng=;
 b=ZFv2bJCgFoytf1dq/3pXFuSMkobcRMYRcrcKJVZAwh8uzCeVZPgVibyRw0zpcEnbDs30yDuaQg1tUB/cFKu9RA3CREYzDwTj+bMVgcW2tj3fFLlADGaioYHfb79Q4uVmRfdv0yjLRPSU+9BecrfUzy2iDzRBCqZYLojRDWl1gsGPmgwYd10AObXHXJUiRwi+vNrRK/+yEH6t9gQftR9bTPLd5teupVcz+YLo3JkSVdMI1HFtevEG7m4G1CZVF/A65ixfVZs2qMh25KmBrRfwczyhHCnNApj9sJPwxvGtrtDl/GwR0gRmCMcx2bCioW7GTwul05hvx3q93LXstp6MNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pRScWnSLucA/3N0/a4wP/b7EkLXrlP/I0+OST4kmpng=;
 b=M3/sHnKAbuoaEJmUsBVQ7SzTqr/P/zw5Bw7bJDp2lc0/ZNNruIVoet7k9cAHikrWIMNEL9PtwpYAYD7QkHHkguVoVFAOqk+szk0aPnli8lWfqVXDdG8dnNTdtViNejuGvpBmIPHmK04ErZpMrTX41Ycfj6lFQAnaJMcYHJueoSHknwbnNLo3+2rypsBXQPNEhdZ0f4Hq4GTueFVHLZ6bD2zEStOJDe31xg1+1LuZ7DY7mA9+8gFG88ZHbmc6h/ZguPWbgS/LDR2qA9sC+BOIdABWTNgmU+bIx8awpXxT9lU7NjIgHkKuHQeh0djR/Jq7sN5FXF9P36qe59RhpjocuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB1966.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 12 Oct
 2026 13:20:30 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 13:20:30 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/18] python3-numpy: upgrade 2.5.3 -> 2.5.4
Date: Mon, 12 Oct 2026 15:20:02 +0200
Message-ID: <20261012132005.23909-16-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
References: <20261012132005.23909-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0045.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::14) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB1966:EE_
X-MS-Office365-Filtering-Correlation-Id: fe92d68a-1625-43c6-6f2c-08df2863964a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|10067099003|6133799003|11063799006|22082099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	0a2qxTnezBewVeM/YXCY83yxk0ZdbDijw4OYCTogUsJbzqW3f6OpeMMqPbgJWycVf/VXSzkvzzPPp6LzrP1l4GnKUsWVybRnGaBJfRL7rlaPBigT0iAr4k5IxTcGYPJddYDtJ+56PE+VbyI3FRaQJeT29Tp3+mBjv8nqkLHQE4t3kz8e4lO4azBPSsC3vkKhPvB9jKoYSoPgE0KlW2NDPinCFzUorXsbYxppjkqK+TRIdr+zqtF04eCjCJ4lVkDZDP1NG9jQosOJi+R/xi6C/vNKXSieYQlsta081g32YzQThmnzL+xD3cxiC+0VYBOCSPqFWSnQ1KBruaR4hAiyPStWVO4oEd5TVE7DdPiOy/20t2FttAHvezI96veuGcQaT7i2Y+MScfds3+Fj1d/TXEGYL6I1srlvO6kTn/aQGgrWCIHVjaJJsSxJm0qa1ulX6a9xB3c3SetWjWPd/JGu6wQ+bJHegfz6515ivabnnxgh/TJLAxjZ/8Mc1PKs+S9IC38Va3AN8SYzyeRrVYVH4U/+nlkX2S6h1ly+jep1hp+X3EKY6dKCYSLS2FxxmOptM2JWaEmHiT9oJQzIduzRuhQwSFHHXB+M5QxqSBd0HRbbx+3DFQxzvZTSWc8xsWSF5Orx41qfNB5x/Stz0NNHwysG1lKRWGt/ZJEmgQvS1rA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(10067099003)(6133799003)(11063799006)(22082099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/48So0pIkYv+vkybNbXVUiWZH0v1/naKpSlkLFcN0JuhN9oW69wKA1BEAwVk?=
 =?us-ascii?Q?72rIXLR1FhoWftcqr9YRQcIgr/2tZ88Ib3Etz4SdMnskOUT+yVUkjEAQfBLY?=
 =?us-ascii?Q?cKoj1egWe89PmfQMSWmEKL1barynAIY9CosopUImcB2WX3oAWqnDhLhw8/U0?=
 =?us-ascii?Q?kw3Qq0GggOkS7BkYb1er1Eh0pAD7bHvpSbDVaiiCLlZy5PYn7NgJjd6kzfJs?=
 =?us-ascii?Q?lJ/eew2FlkE1GSw+pQgKWeJkT6A9u9wzLbfryzC98uB08JcG613OGl42MBRB?=
 =?us-ascii?Q?uX/IqhA0q1x+QO/Gbif2VMyfnYeWaF1lS9EWfuk1vLtJxpW1p0WbyAdM8bIH?=
 =?us-ascii?Q?OHbOWk5kxiAstynvGuFXX+adNfHPMQqLB4bSCq7Akfm5a5Nflxfhm7Tyhu+4?=
 =?us-ascii?Q?o3I63JhzsNA3G8kI1/HMMpROEO8g0iliawp9MbSvAVtr15v5wGc001KOxJXm?=
 =?us-ascii?Q?/yEfdQ1455jZqvWYh9ytZEfOWqPnatvJpmkv0jSAVTBMAGDPybsdBXSoIKTR?=
 =?us-ascii?Q?6itdT7CBa0sl7GXg1ppFXOdL21y0WjRXPqKST96YQHXWFv88B3F6WQvT6yvQ?=
 =?us-ascii?Q?fAi6Dg+Aw4A4gbdKE9whDjOMEno18XzVGVQBvc46ETeGVEpR46hIaBHTJQvw?=
 =?us-ascii?Q?Jk9c+LqNWmu4SSQGKtfxEmWozomS4R8Pdm6KVZYH0TqGnfZfQQYHGOxTUutM?=
 =?us-ascii?Q?Bm9OidjFCKOfpOm9sLmFO9/AkBolQckhpM0cZ8NOXO87eIUG2kSBIj3M4yB9?=
 =?us-ascii?Q?JuP6rBH3G8dXSbLVTD5Y2f2djyCkLETpm+0I3mDXHNgbij8c37YzcFk6tNmv?=
 =?us-ascii?Q?zJEnJtLnazOKA5dz+HGgEh67TLM/lYVxmPPZIGhSXX90dMOQB49MGnWMHYon?=
 =?us-ascii?Q?fW+AJmR13+j6Wz19CXUsjaSpy5aZWYSj33bV17lMD91fMAtCm1t/GNcUFdmE?=
 =?us-ascii?Q?eqNHYEuwlDh63r2E0bZarBtE1EV+YTTOaKHibSHBliXn1RrbTxwAnGLF7XpF?=
 =?us-ascii?Q?LI3SWvbr/dFHL9SIytaKDForhj/BuklIaW90PHsQrSNzgClHtudIh2n/loWD?=
 =?us-ascii?Q?fLXdFR7WbJrVEBcw36NTjPXIkqXTxHEF9GYtqxKlqNDlmjHuv06Tpr3iIugy?=
 =?us-ascii?Q?X4vVFrhP6xvV0I2vAM+MomToaTnGT/yWNK6967IMsroENF430SP5Mj6oqmxQ?=
 =?us-ascii?Q?wuDxX7hOhzxYAT5ssv6pAeb8/OA3Oj7jIdpEu1hFphNJpsViZkSIDC6xxJMt?=
 =?us-ascii?Q?9tmq81aky2rV3rs55vqwS2K+d21hA59qsLeDk1NbP+8WivIGwHqwyQtXfAYr?=
 =?us-ascii?Q?9IL6bty7fuD9NL17K9cNwbIuwqQG8DV/NsYupNRNx/1X9EQwqiXtlH0YITbn?=
 =?us-ascii?Q?196Xcd0yu9w0nX7s3Z6ilVAuvu0RqISB+h3Gwk6FQRK2RoiGd3YaEhSZ8H+U?=
 =?us-ascii?Q?qR6DOrmHUzJmniIVw1fJtHfPxqLznAW3Wz8ZiCIjd2dhGLFO6WIIwuf7EtGb?=
 =?us-ascii?Q?HxG7F6afD+nbzFiA85VSSVkFRYiSsd70osgJf62fAQY0qIm2GToeh/35nrvw?=
 =?us-ascii?Q?Khb98Doq/knOZzz2+Wnjg+SA7qvapgwNxjPIKzDhMvHyUfDAwIwVZc+friHm?=
 =?us-ascii?Q?oRic9x56ld8EoxSwik8FN6M4r1bNU05i4iEef/RTr1JZtupNw29RBULQiYHz?=
 =?us-ascii?Q?XS8DWFkWPA1/Lx+N2Ca/h3m4vvXtNMKMFmiFzknm5vSD4yilvsC8jRBAa6ev?=
 =?us-ascii?Q?4cAfN2C3pA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92d68a-1625-43c6-6f2c-08df2863964a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 13:20:30.0462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlVGQ7yPEFH4E8ddtOlVoaX3je9g6boi8SCWhWnFkWefcDL5ryfuUjmxRe5eEsLsZiUz+D/V79QNUeqo3c7vAFDNebKXc0dZah2WCyxs6lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB1966
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 13:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247659

Release: https://github.com/numpy/numpy/releases/tag/v2.5.4

Contributors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A total of 9 people contributed to this release.  People with a "+" by thei=
r
names contributed a patch for the first time.

Pull requests merged
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A total of 17 pull requests were merged for this release.
.. currentmodule:: numpy

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
NumPy 2.5.4 Release Notes
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

*Released on 2026-10-10.*

NumPy 2.5.4 is a patch release that fixes bugs discovered after the 2.5.3
release. Highlights are:

- Many typing fixes and improvements,
- A workaround for the MSVC 19.51 bug, see below.

This release supports Python versions 3.12-3.15.

Improvements
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` now raise for inputs
  containing
  infinities instead of returning garbage results.
- Fixed hangs in ``numpy.linalg.svd`` and ``numpy.linalg.lstsq`` for certai=
n
  inputs
  containing infinities for recent versions of some LAPACK implementations.
- ``numpy.linalg.cond`` now handles non-finite inputs more consistently.

  (`gh-32593 < >`__)

StringDType hashing with NaN sentinels
--------------------------------------
``StringDType`` instances with equivalent floating-point NaN sentinels now
have equal hashes. Previously, distinct NaN objects could produce equal
dtype instances with different hashes, causing dictionary lookups and set
deduplication to fail.

(`gh-32563 < >`__)

Changes
=3D=3D=3D=3D=3D=3D=3D

``MaskedArray`` resets a fill_value that cannot be represented in a new dty=
pe
---------------------------------------------------------------------------=
--
A fill_value copied from a source array is now reset to the default fill_va=
lue
for the new dtype when it cannot be represented in that dtype.  Previously =
the
copied value could be stale: ufuncs that change dtype left the result holdi=
ng a
fill_value typed for the old dtype, which raised a ``TypeError`` only when
something later validated it (such as ``.view()``), and a floating point
fill_value that overflows an integer dtype was kept as an out-of-range valu=
e
together with a ``RuntimeWarning``.  Both now fall back to the default,
including when a masked array is passed to ``MaskedArray`` with a different
``dtype``.  A fill_value given explicitly by the user is still validated an=
d
raises as before.  This can now raise a ``ComplexWarning`` if the fill_valu=
e is
complex and the new dtype is real.

(`gh-32508 < >`__)
(`gh-32562 < >`__)

Contributors
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A total of 9 people contributed to this release.  People with a "+" by thei=
r
names contributed a patch for the first time.

Pull requests merged
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

A total of 17 pull requests were merged for this release.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-numpy_2.5.3.bb =3D> python3-numpy_2.5.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.3.bb =3D> python3-n=
umpy_2.5.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb b/meta/rec=
ipes-devtools/python/python3-numpy_2.5.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.4.bb
index 338bdd2bbd..93aa356db1 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
@@ -10,7 +10,7 @@ SRCNAME =3D "numpy"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "df2d5874ff183595a4ba404edd04f6bd9b5505c1d7708573f6=
a6c17489a67563"
+SRC_URI[sha256sum] =3D "9a94cf751c9ad8ebaa835bcd3d40dacf8534ad086b88c38029=
b65123c7999d2a"
=20
 GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

