Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8227.1794399413645895480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 04:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=JzfuxnFs;
 spf=pass (domain: prevas.dk, ip: 52.101.84.21, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQR7ONQ40dKnjqcji9iVXdbfysjH0vZYCXzoHGdYEFIj3kena+Oid+Zyx0npRpzC8EGlh58Z7MlT18ALjU6qVT6n6sam7+p8jHfbsNCJa7rABA5VwAYDWzQcHp6rHGWqrR49ZTIFIk3a3u30kNXUlFPJ+RuBuYVDULJ70QGhoOLtZomwvr3WhwJXonuUiQuQLyOuIuHWl90YqLbADdHOdaU6+7OGayL2Jq/T55dLgXmUJM/VKrn1vGCwRaIV3kyuvcdwhrqlTF8EB1AvQd8vYj8WYGAZTZtkkUYNoSlem9lCEkVkrWSgyv/8yVs3kBYqakM3KP2ETvohSqxbpqVtKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTaiBf/30rYP2o/mLbfSfQZ0fnH+19gtBsh2dJs0Y20=;
 b=DJc81IzntA2kBrxoKzyAiC2+vRY54acDVje//skMMJdW/ix4lb186xhk/9XhScLgGo5GQmXUzxo8Epwe479DkxKAdYhMPKs7ukDjpy2lySJ6X6BV1KR2k6tZag/s3lgYPAr3X+vIgCYzg83ugaXwUlJIptY4fBNLBmpNNvdjh+4tQIC9KPG8HchKsJKlYODtoAWN7USquGjSEiOTfCuueQJIBuswB/Isq4RamSNUMHVovNvfj9YEA2V3WYt6CiWcVfKi/FMOwuP/Jvi5u+vGSLFbKno6NBmNeXbQqTSrbHH3JIoJ5cM/T/nFn8vVEOBb+ts7bIKq5tjfmL3gj6wAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTaiBf/30rYP2o/mLbfSfQZ0fnH+19gtBsh2dJs0Y20=;
 b=JzfuxnFszC88EUd/1ByDYhidate/SWZwKY8X1dmY/6sHdpPgloENuh1bkgzWOvmIn6WHspoxECKGt7BD0LW3uCiiofJDOWTQjkoPgHTx9O9uUtDQds44KDOOd6mURTrClkoeQdtWkjZoc8ks4fSowIwRFhEdvExHJUbXPmR8Qbo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS2PR10MB7850.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:649::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 12:16:48 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.21.0639.000; Wed, 11 Nov 2026
 12:16:47 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Yoann Congal <yoann.congal@smile.fr>,
	Rasmus Villemoes <ravi@prevas.dk>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH] image-buildinfo.bbclass: add missing vardeps to buildinfo_target function
Date: Wed, 11 Nov 2026 13:16:42 +0100
Message-ID: <20261111121642.3628757-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::7) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS2PR10MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 4668f11e-813f-427b-b5e1-08df3feda889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|261022105027099003|261022075727099003|261026140227099003|261022115727099003|261009223027099003|261102123227099003|261026121527099003|261021121427099003|261028144727099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: uIcbV7cP3FTpRLAzqeDjaltubTHsLyf7KWBlfS0pRADDYQE7yGX0q1tq6hOzJRQf7IUM8RatDAORUjvwMXzaMeF2E3moJNjn759EfiMn0+ghAjWp8yIwumelI3SVKcyW6fl6+UHjhzkJWXuaSbFcDbRGSxmFScoumk89rr0MMxEtS3xpaJ4qdbE6lmneJ83j+4lNge2lfbOrMCh0/STACfuX+NOSsU6zWQHxzb3hsA8jl5HeNJbejb3ScQD4v+CyQq5jHypWSZRwpVjlow5KQzwRyM3qMG+nq+R87GRGt+6JaEfeSWJTbWoSRTZHg3TT0zUTaWabLJbRUUBo4ZFlJ07ejLQ0OBWXKDUx3k+wGUCk2D2dcNzeTxoxZAsqQXcHznJe/BqntYEO+ZSKHsrcZjudIPpYY9hlmKsyVr+e2bZo0K9ICvO1LlOpi3O1m4pp3/U2dBCitYWSHtkmFUg32Q5cE95VeEx83+j8511qPLaZn5eFUNABE8/QTQphvb/KxD/dLvi9Ky+e9FhBjKlgtQEPIwE/J1u42j5jwCKF24hQDUK6FxZwsCAcRNCaPoGGBbNdt6YX6cCYNvQPrSNhJ01YjgEH48hl2Gbwg1KZMVAE/yw5HLvcKLzemOpL69RPmEJRxBrg2SsroLPZ0Stnq5Tdy4HUoM2knmSq+HOJvcY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261026140227099003)(261022115727099003)(261009223027099003)(261102123227099003)(261026121527099003)(261021121427099003)(261028144727099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?la9l0AmuYQWGvnb3BYuvc2vSQVhY1b7wV07bnsFBZwFVJXwKLo9qAvUprGkS?=
 =?us-ascii?Q?YJ6/xTepbtbqL/ofF10BiC4pIPAFFMMz5sZoyu5Nk+af7IE8NlvlpFGWyhgb?=
 =?us-ascii?Q?diCXVnQ4H+ip8OGvhLy6h/nFkVGlit9ZToL1avfdoWTWONsp5kFwD4rT9xlr?=
 =?us-ascii?Q?riWjuhj3Y+n84kePQogCXnu/2lQA2zjXaCO1zo4UL0cscpPFxJkYAoYxWytb?=
 =?us-ascii?Q?p14wOCPgxFUqIMFbcR1jAOunywnvvQbvUtVQ3Ww+J3DBbRPH92vMO1bE7ayA?=
 =?us-ascii?Q?Nz4EdFBVyT/cwxlqkLt5iIaF5lMcUqdWnRdQwxjMwDU93aUd2IrdDjZsfm+K?=
 =?us-ascii?Q?KBCuQmXys3mLew5mFoMP67wB21sYgmHM/uxYuYRNXBaHFXw46Zq1Vjak1e21?=
 =?us-ascii?Q?uZ4VXp4Oh/7aQx05PRGxjLtn+NH3fidiTm/YQd+xcKsJxJNqhxk1XbLjSM+X?=
 =?us-ascii?Q?2FKEzrlj3T+x0BsUDtLjjCGkESee9g1mK4qZp+fYdgJdNLKfz4sxfwIcvMxf?=
 =?us-ascii?Q?vXRY2tcWse5brYxRh5HxVItiod/+9nt6mYEThgMFTM27+Vw+KM2owZA9bXhQ?=
 =?us-ascii?Q?oVizqsHiAR1SzNsV3dSbytUqay3dy9+myTA0RCidd9QzUcmOri+4vTKlzYYD?=
 =?us-ascii?Q?LFf3mUJrN2TnEQ5eZNfau9MOpkcC5IrsBCZoJvL8Inns5LWTS0t/wF0FDHM7?=
 =?us-ascii?Q?in8/Zcwh17amwoOaDg4o0PV5fIA8rywqMc1C8f+FGYFi5ZqgfJWZMndPVutg?=
 =?us-ascii?Q?sAAGEWwXfiDu8X1A4/Tmze5/N3H2tgJ8QjJUkt7SJoCd2t8o8G82wmOcSPgd?=
 =?us-ascii?Q?zicVkvCDe/q78XXdK0AQcdzqYIb+C6Ua79BATq6BQEx11uWe/Mb0aFDCi5vW?=
 =?us-ascii?Q?Kn9cj3MvPUr4lhQIUMVRQ7Fz9s0Ada6QEazRQmIn5Kjz9lR4NariR9oby/lf?=
 =?us-ascii?Q?4W8VO03GhYKbjhSLubHC+vvbkJYGPpaowWMBegHHV5oArSdApFOo70RFiw5l?=
 =?us-ascii?Q?BVTzWmYPrwwPGzXfwKyw9OcLAa55K9gLHXZV/yEgEGNffE+VXP26ae0YbWbo?=
 =?us-ascii?Q?ov+1yx2wDnGIEN583Wf0txlJxj4UL+1Y9xUA10wu9BmHbhePgBYwFYAv0gi8?=
 =?us-ascii?Q?3oIhU/Iw13ebcZ8BIvAWvK+Z67GyVBMOXcStjoAq/YoAkJJ6QfQe6Co6U0Vi?=
 =?us-ascii?Q?OTqRpu/A/KhlUYCTyW5ELXB2j5golVsDhqrnHwpm1agllC5Ihr7L2FN2ayQZ?=
 =?us-ascii?Q?kLUtvWKDH4PWnd9JOU1LuduGY0HfcOOKbv6zgfzNCSTs6s/iU2jOdiMN+Y+4?=
 =?us-ascii?Q?g/mefBJ23WpLC7vKihXlhxO6gblga+4rhzStVkCyx5ewonuTQ1gDkIGicvZx?=
 =?us-ascii?Q?16YI+lytFPyV6KD+3Y4c938ItXTk6zSbiEOZiX5CTec4XbXkwDO6muzg0Jiw?=
 =?us-ascii?Q?gLkoM8aKlz86/NXQ0gBhkuJCiqWbvOOYkBH9gk/3YbARGC7h78zrhQhRRcIk?=
 =?us-ascii?Q?zGl9iGO+wD86q7KZE05jC38I69d9UHlgeVruWK2Pn8seoe/CLadPd4iyyCVz?=
 =?us-ascii?Q?vRZd5OvJmpwzVwF3xoSGaLC63oF5Szwc9Txou2r8wF9RLOUbMFRQ7hhOCBPN?=
 =?us-ascii?Q?fk2I9PuQU0+E1xFnI/6zDBnDW7ttmjPEGf4Em1yF5crBy3DiGQoXmpnJ4mF7?=
 =?us-ascii?Q?HOLuMABXjrPvDnTKTL5Gu4IBj9RyJ70x7qWj8u1+QibV5pu9bPWj+U0EQ4Rj?=
 =?us-ascii?Q?fjc4jZrGV2A9ntAn57AybXqD793DCEs=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4668f11e-813f-427b-b5e1-08df3feda889
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 12:16:47.8534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyUV2dEp74RnFUJGsqzgCrOmKptDjj/radm2We0zs+nOlXIFS0dToF2E6vogSecZNHqjbGjsvFA+ocDNBqE6jc6ymIioy0UGgICyFDXKalU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 12:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250024
Content-Type: text/plain; charset="utf-8"

From: Rasmus Villemoes <ravi@prevas.dk>

Bitbake does see that buildinfo_target depends on the value of
${IMAGE_BUILDINFO_VARS} itself. So adding an element to that list does
cause do_rootfs to run again.

But bitbake does not know that the value is a list of variable names
whose values are fetched, so changing one of the mentioned variables
does not guarantee that do_rootfs gets re-run.

Fix that by adding all the ${IMAGE_BUILDINFO_VARS} as [vardeps] for
buildinfo_target.

Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69543bcbcebef81e2797a0cf5662602876998ca4)
---
 meta/classes/image-buildinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buil=
dinfo.bbclass
index b83ce650ad..eded3de719 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -41,6 +41,8 @@ def buildinfo_target(d):
         vars =3D (d.getVar("IMAGE_BUILDINFO_VARS") or "")
         return image_buildinfo_outputvars(vars, d)
=20
+buildinfo_target[vardeps] +=3D "${IMAGE_BUILDINFO_VARS}"
+
 python buildinfo() {
     if not d.getVar('IMAGE_BUILDINFO_FILE'):
         return
--=20
2.56.0

