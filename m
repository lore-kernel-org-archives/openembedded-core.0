Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4D2C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:32:58 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37456.1785925972697878330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=fRDkVuXF;
 spf=pass (domain: est.tech, ip: 52.101.84.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bvvIXFJHVK0RAWE/d1tJ89rpsaMD46m6lRrubHbPoW9MNEKSoJzHutZjC+f8OoovogXO7p1TUm0xH1QKa+2prdJrMMcTZoZZolBCj82MN8uxT4IPmr/hO/o6+6q7SV6F43AUCAHve77tdgr1/92yv9rGRmERYTEcieLeIZB5h1iY1w78FzhD5R+AikdsaXdq8RTsRmhsBC2P+CYcojBBZLQf8n3JaywD5Mcdo0yb7E1A2DD4mkZenBYH9D20Fi50NX1ThScKm/0SWygdctYx+x3+5nkONkAK4j7uQolNMfk6+OCmdBIAIoNH+KJG7DOSUPBv66iPIzdC22VzjR2PwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWHGln63faDdXSbSM4I73d/8Dox7Zw+zBcmyLHIM2xk=;
 b=KwJgblLj7RPbQmCDoTQKSw9Skn+JG47PuwhV3AFnyA1/Ze5FT/FeAMW5A81Q5tTaWfsb+ibzRhWMiMjASLMkLxA0nt0C6MOXt/H6YIOZNk4HCvKAd+gFec8io/TRGTSOiVtQTcjPpkY1x44nsynZA+1A+VSNhZtX8kJtGWTIoDqo+AcLLHBuI2/E3dcgtINMAt0s0jKfb1WXm/m9fBtMywAWp2Vo18vgLKa15BuGIk7d4P9Ef69/Ee40ezaNYFS/pbp+44uLksdo+105SocKLGWFifo2gSP2BzqI9PQOVrKX2AJl5f8mdmr/VHRe0XEHMiGRyihVWMV+LNb2n1axBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWHGln63faDdXSbSM4I73d/8Dox7Zw+zBcmyLHIM2xk=;
 b=fRDkVuXF07osdLM+kVAJU4Zk34ccfS1s8so0NzAlj7yKpzOddwUkntZe2mlKyVod+fJDADn/PZZOUeK8zdawXOkp/yow8aqBEDUqdy0hyYaIIfRug9xKh9QlvJAHPJ1AWesaTaTxx30/q698Asot3mx0esrlj8t79/RZCxweV7rz38lGvIWzEd3pKHiOrySdtl+vLcnOo+hvs9h6SvQF9UN/1ro7dvq36wGd+110yPkCqK6kgdZ89j1j+n6fkq4lIwpmXrBx26l/1CxBejxERjXvinAhHYcm55mG0GuNpOiIKBA/wPRJq7y+4t2ZgQVp7oRFah+4tqxGJ03HGtTv7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by VI1P18901MB0767.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:123::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 10:32:47 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Wed, 5 Aug 2026
 10:32:47 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] erofs-utils: upgrade 1.9.2 -> 1.9.3
Date: Wed,  5 Aug 2026 12:32:42 +0200
Message-ID: <20260805103242.10520-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0199.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::16) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|VI1P18901MB0767:EE_
X-MS-Office365-Filtering-Correlation-Id: 50126213-4c2d-40f7-7f61-08def2dce428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|366016|23010399003|376014|1800799024|6133799003|11063799006|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fgUKHHkEujZZUumURDQnfSA4FBqsdC1Z1YZHFZ9640OoFgEqrj10LdbGL1wRAYTQK16D6OWketwaIVDlAaG7KoJwFGpXBBnYut/FV707iqzHVpCMaOHaR457GUrjUIFnu5R6bLFovLxfAwZY65wUaBy263r16holi/LtP+Q9sIDWS/D1J+ZFMRpEbobxJ3ALVHI2qj/Nn210/jv8LspbU+Bu+tGn7tO0RgVk9NhifB8oIg4BaSeYvJlexfXpekGieS3naHuuYkVjViKQY1exb1GuGs9kjGsl6TaRtoPC34OW0Ft0xGU/GGqGxOtffttiGdkX9MbzwULTRQWXJX7ZpJIaX1jBaDhbx884Mpaq1G0CiaYudOQEr+YMAHiRPPdmp0WG3F2/sgJwOSH5u3a1abkWjE0cs1Mer1DsB7rKRtbT8qtBHKf8hAumBJd/Ei8fAvNO8njoWUDxcZKhtBPr3oYqYTRo7hpWd2m/r+V2IVjzGvGDVqCjUKH2mPuoYVHeIyRYK7iPJlpMsoB5qDhjB+ZmFr0FL2md8IkYyM8KPo6s0fDzpg6Xy33nTs5fGsltVxRHg1g0s+41Q0CvD/vhtw5hQ+bZBEQMtXAe/TqA4GAQlz5QbydtDJTXwXFY5brm5YY1EQuNsrrwWOshehk6JWtNMFK7Yl2TToCT9Z7Gd5M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(23010399003)(376014)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?02KORbViVjNXvSDWS5VJtZoJJUMob7sYQMVSqTg8IosCjNQqKwbDar2dQ4yg?=
 =?us-ascii?Q?djUSVDbLuKyQkKqCtCdIXCUAEMmSfEz/dkfhY1vPwviLjRWf62qIr6RaIqQf?=
 =?us-ascii?Q?hBYAB3yxiAxhne+smOdNcbbJuk3keVfCZoW2CDElH9pK1tWii+myXwBy2mv9?=
 =?us-ascii?Q?BMvk9eZmdH49TJQ5HvM47Sm4kcaAwqirsJ4ANxKTO3khOyYFBH9tjM1s6aaK?=
 =?us-ascii?Q?n6qiC34DTUHKTc4VTXmfCiEuItE5+oa645QgAS70anDaUG4OBYiaaiOZs3f+?=
 =?us-ascii?Q?D5bgDoyKEsHYpDv44dzNeOPnV3XJOUsGOf45IapVXWCqCYI2USQhF3wbuXt8?=
 =?us-ascii?Q?Buo/NmIkbW+csX/CSRbh4rb0tJfpBEcNEbWxyU9W26+Ttr+xoaC4y4KHkuwq?=
 =?us-ascii?Q?j8174RpBv1k5J2ZUHibpff3juUODWcFn4ZZVW+W+zqXQ+efCtkOWNz6J+M1Z?=
 =?us-ascii?Q?yVFkxSMCMeQCfIrpsQPyKKhuAo2ZKp9Mh59d+NfF+hBzj5sta/1U0SnZVxaq?=
 =?us-ascii?Q?VtO7UE+HUwUSNtm0YVaXlPDGGHGasXlHEKB56RZr2YT0Cju6kDZbB0sfVNsF?=
 =?us-ascii?Q?iAVnb+/2aamOUYzZmPSxrf2AyAunVC1gL/pl/MVw3NVD44TQ5XzAneFue/DX?=
 =?us-ascii?Q?tACSTbAzqV30DWu4q5EJt+KfhroW1Ij8TPIoca+ijUESalGrpipU9Tlt+lEE?=
 =?us-ascii?Q?lskjYIIWNA9/oZ5fClB/18pnGsid8Z0UQgngOrKD9zKHKtCeHYC9n97o01lf?=
 =?us-ascii?Q?fK7VdJ9Xub3z+GooH9oDDQiJ/lPugTcZAjHeKrOdPwpgvv5eDFqGVrGvx/Kv?=
 =?us-ascii?Q?i9swwgzAbirR3zbl7dxihCi+eb+dkbXhp2DtsB1yfTkO4uZTFvv/V27c7YGg?=
 =?us-ascii?Q?qK7EGbdkcVwcllq/CZWujq6/XCgG7up7NzAY/ZQMLMy2zrQsjaVnC62S4H8L?=
 =?us-ascii?Q?AjbGaf12fsW9/NDv6z46RBvlji5+x//MLptlWs6+/v63jUWZx1FuAXzd/uzr?=
 =?us-ascii?Q?ceZdcYOa4U6yLUuNhperltwnOAGxhGRCer0lNbSEHavB9EPXqkSn3y/zHWSO?=
 =?us-ascii?Q?J1iPl/fDCNtPeOijN0zRyChBJ+3Vg3o93sNJ55c/scXDVHlrZLnkaSG7cKXc?=
 =?us-ascii?Q?LIkMFlyPv4tyIFo9erC0VkbquBB/a4iKQ7/8ilpXCQn1PEhjCqv3ZT1M7P+B?=
 =?us-ascii?Q?Y+XXNPpAec5znj9tyac2go3LrBCTKNbzPJSubI6b7ig9efg2bwYGel2EbHSX?=
 =?us-ascii?Q?d8wNZuCNe3VnVQgz3WrnOSV4aDHS6V5UN/3SyuOTsGhN/XcllXSHQx97nNLH?=
 =?us-ascii?Q?HjRUbE/nlXtkzPEuEcfo2qfw70vTfyetTaJqfgfhWQ6UoXIQEifayNrl6ZZe?=
 =?us-ascii?Q?9CGfrgdGZAzcIAmIprgEbusqOrDFU+2Wxj3/s1I0gcvzNTfUOrsK691hb66p?=
 =?us-ascii?Q?QJA4qvAPC2n6lk+BKmoE1wlZ8GZZEg3uJAPqth13bd1Vy8MRD1YKZ2oqC2PO?=
 =?us-ascii?Q?zaxSUAVSg3GCVYb1Vdf/sP01qwHP8Trg4foSEgIGS0eKMYnmIUoK5lJJrQ5l?=
 =?us-ascii?Q?3DpeD0ASUOAKCQAOM8LgpgNi3JHRvG1p2PMDilJcxyDhf0bXGgsIjAs5XefF?=
 =?us-ascii?Q?Y7M5KAjorMO19UcYK1VxlXExsAJsR6uVORnMUVxxdzwlUBptDgZ5IWgMapE9?=
 =?us-ascii?Q?F0kLQpQHyDK6vb88sxQT2pZawi5quaQ3WrbSlBct8NS6ghw4ZDGw8M6ucO9r?=
 =?us-ascii?Q?HAkwggp0oMA3NBQGn66m4JWWBNzUB+X+Ci8eTL9h/qFc3So5Wh/aUhhQB0ml?=
X-MS-Exchange-AntiSpam-MessageData-1: Rs794zUN768TsHw3kyjiL8nzFgd1I6xPWXI=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 50126213-4c2d-40f7-7f61-08def2dce428
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 10:32:46.8995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BJk7mRf7/P1QcBzCKjH4jaHznx0JUznLP8op04Z1pQnRaUqI4F1q8oMTtS54OnEnRuX9Bov0XtJZQ2uvk+zS9hkZEn74aQQt6gnU5c72/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242859

ChangeLog: https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-util=
s.git/diff/ChangeLog?id=3D7db78788b000999e2de88decd2ba90654f26171c

ChangeLog:
erofs-utils 1.9.3

* A quick maintenance release includes the following fixes:

  - (mkfs.erofs) Sort inline xattrs for reproducible builds (Martin Pitt);
  - (mkfs.erofs) Fix rebuild mode handling for opaque directories;
  - (mkfs.erofs) Fix `--incremental=3Ddata` functionality;
  - (mkfs.erofs) Fix raw inline handling with `-Eztailpacking` (Yifan Zhao)=
;
  - (mkfs.erofs) Harden tar index parsing against invalid sizes;
  - (mkfs.erofs) Fix memory leaks for small fragments (Bingwu Zhang);
  - Fix various build errors and warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../erofs-utils/{erofs-utils_1.9.2.bb =3D> erofs-utils_1.9.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.9.2.bb =3D> erofs-=
utils_1.9.3.bb} (93%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb b/meta/=
recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
similarity index 93%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
index 3119627adf..2b849f2a4e 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.2.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.9.3.bb
@@ -4,7 +4,7 @@ SECTION =3D "base"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D63afa010baddc7d0905f9c31ac759f5=
1"
 HOMEPAGE =3D "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-=
utils.git/tree/README"
=20
-SRCREV =3D "30711d4b2e234fe3e8aaeb779ade4cb609b0d920"
+SRCREV =3D "7db78788b000999e2de88decd2ba90654f26171c"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-uti=
ls.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${PV}"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>(\d+(\.\d+)+))"

