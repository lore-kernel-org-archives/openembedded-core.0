Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E21DC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 13:57:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30121.1786370276424035096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 06:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=N+8JAvqE;
 spf=pass (domain: est.tech, ip: 52.101.69.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FOJbnSCr27KvPdPOKRCWlH4SAkjwtmIRMFuNDRpekWi8+DnzCgY8I0HHrqJGEwES4nQ9JMq2hv8cPe7aLkqkX/mE24LAJ4XpJ0GHPfXZEMuUoml5oyx2KPvx2zLcj3mZroaz2bgqUs+dYX9xNXMpvAkDsd70S4CT7s4KoPHYEvmQR+gNa/f3M+kEobM1mqxZRvwnkCP+8qRxbjmGswRxrDMFE4DPyx6tg8JTmdKmZ/EqEf79vU3JNOuMD/C0TMiFI/PZvC7n+dxqGyGxoBglBTgUZ1LfRYaZnDgAAXP6oSqycmYcVTguH4Aj5XG69lHx2EUeB1kXrnA6soXheRa2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=599/z+x+faJaEnEg19QpLE+zQpxTZP8DEb011kVOkyY=;
 b=dStB83Tri/ys6X1QrjbqXaVr2rUTd8r8R1GoUkAyy3zX/3WFGb5poYAAoiyGWDYMwrtTdSGSFcZU3L8PYEmHlt45NUvHsBElONemsM9h9to85L7TMJhl39WW4NfQdGkDgzx/Hgyg62dKyZniYTd8DB6yNF3gJlgmOdNYLM/E3Nfr1YH1D1aF7+IRyKlg8DZbvl+Sp/FKUTxoJ0kte1J/+xvrK9Qqw4pZHmri75emWYenu2bxXFMV9wo/fK1Vzkobrym3T189ZHnK5LV7Js+6Jf9pGrWniVuhtX7GSF17PzJT7TNEsGAWLLqmbkTiXHZ74pB9ygrfCtTKRNGOYSqD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=599/z+x+faJaEnEg19QpLE+zQpxTZP8DEb011kVOkyY=;
 b=N+8JAvqE1pb3eWFeh0iGfY8DtN9nioqg55Lk12Wamca04A0gQXqpqRPPIp4p1CRd22QRpH/205z7/9bykq0glc0HluKzNR9ncM7Do0BYN5TyeSqko3ntubFIYiJdxJA5r+Up/Lm2HZKJAu0/u9jndg1vlZCzBhJJWPbpAXz6WriZHYS5FDfRKwH+DlijgSwVwjo4/9NCPv9SysGJHzDjnXrfeLM92iVInHS9wG8cPJncQoTC/Dr8xe517jIiFrs7v1/vUYDGnAga8QF0adWZoKnkP6noomNojnctdItM4X64ARqJYu1GJr0lAy9CLDbvEHotiZNnWWTcSYt2b/q/hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS8P189MB2363.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 10 Aug
 2026 13:57:53 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.008; Mon, 10 Aug 2026
 13:57:53 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 2/2] python3-numpy: upgrade 2.5.1 -> 2.5.2
Date: Mon, 10 Aug 2026 15:57:39 +0200
Message-ID: <05b29ad982ea9fe14a3d1ed22d29490d12da5baa.1786370158.git.jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1786370158.git.jaipaul.cheernam@est.tech>
References: <cover.1786370158.git.jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0033.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS8P189MB2363:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e3a08e8-f874-4a84-6497-08def6e75fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	VDaohGtXMn9Vv0RjmoyWmhz0/5biq5Zwa6z9zPQGfBbWYAdiRXnGrST+pu+ygk2O0RICmVtJxe4sJjDtCe/ULxThNmKobJxpD7dwhnTKqVIn2swer+zzDOxK8Rx1KZLHCyXA4nAVFH94onGlY2QdgME/jZ/RK48bypWOelEIGMFfzm/GEyBpkZBU8KqXi3AMFnAr4YojcpdV9X5Au6SgOD6hOdY00hjhakcVJ6HfDJkl/UkoM76mahqohmU+Axl5hwzRWJIPWkz9d8zhBcCZffMAfQhNDkOhCBObAECblgX0by3rnAV5Ox8Chtdo5eSTSjW7gAy47+vhTJPntK/WHU1QDCjeTF980niB6aaZBiD/WxWRgOxKjbC69kyomIYUlvLEcWcsYox6EG3g5ZCJ4iK1F2Nw8HUqeBwqyPIcXU/yu4aLAKBDAMDb8qgbtZdXadGxK/lkDG0ZkInsxlJB9auJXmrRn/paoNGk0H8GSfSwbG3lUMRhr7CSDTAM9/FJG8rULUZ6ch4rKvR+WdGpFExll6TphtAoWhzfNK/MXLfu61sQdXbYHdilv7aeTdsz0JYPEvJKtKDpUddiCmZpiz5OiuMGDV6Vf7T1i5Duv71x4TElxL0ZOzCg5jrA+DzNWZMudih8V1Blq5z0Jh0Ellm5nq3BImPrtqs+WQvF49M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MuM0Yq8Da9pMtmoOlDWq7dkpIjyCjLjvZh7hLaSjiu8/mmHHHFKDkxtNGxu/?=
 =?us-ascii?Q?yzYr0ESQUWRzVIEPRLAuXX8I6XxM8hTKBIMdpQBEk7Ohcm8lgh6kgIBi+Yyx?=
 =?us-ascii?Q?9tcYAGvfel3EHW7W7q1+qYB0pYpLYyLEd0eSMEeZayVY+BUIYrN3pcyjyoVQ?=
 =?us-ascii?Q?f4LfD/PwmZtZIugZgRvwHXRHWx90i8fPMsVesJGNmQR9qVnjrze+FO+alkzb?=
 =?us-ascii?Q?j2xYBizQSCMJuvz2X7xtNLjOzcS8tbDm6F4IgIaRCxFC2lPFM2tq+lHf6ebk?=
 =?us-ascii?Q?GUIiQpmLcz659xVW+9v+VvzoeqbqkAauKpekQDWoja4B8oPUwyXYuDrh25Oh?=
 =?us-ascii?Q?jxU7w9mIlwmeYoIsw2qk3qOqOgDyQRe5VC4U0/yeJmbHUaEhuZ0jz/QlgiP2?=
 =?us-ascii?Q?Z9TXBLfLi5aQ1UrQ/g8EBJvLZQFtnvniAFF3vDL7u8rOjfWRU7kz80yuBnJT?=
 =?us-ascii?Q?W+ypXHP5PZDsTeN5s184oVtQ+pHS5TMFhUDZUSuAAnyBo6jeKpvtB95UM/U8?=
 =?us-ascii?Q?Jtzu1j23HQs6jW82hRYoA1sbwsMSsTZT0gExUsU0grIUQ4/bBAp+yK6y0jF4?=
 =?us-ascii?Q?roqn5uxSequz57acfFBDv1MysHklqjJ+fefqwmB9MU4sf2F/jkKKYuKPbIz8?=
 =?us-ascii?Q?uZqBCGp1z+PVK9Bx8jpg7kH8WsI9O2+5146KTcEsc0W/ThneGRj8DLTZi22Z?=
 =?us-ascii?Q?PtvQuSsoXPtLxlldhyD1q+BmVcGXCotgBYltcUIkG3hE/eYez8KscnC7fnID?=
 =?us-ascii?Q?Df6kpvATRMZKTsBCuKIe28f2GARTFP7j+/AWV/CR4vEmN9Sc3p2ofYw3bSN3?=
 =?us-ascii?Q?KDEo2a3w6AL9ZzNvQ+bKdcRufXYfQQOHwmr5JxnJvqP99Rke4c3isCpu15Ec?=
 =?us-ascii?Q?Hvge69V15Wz6qimrAar26YX46r+TvgoalV15Kbtys8LWvCkERRMC7PzZsq2Q?=
 =?us-ascii?Q?T2CH/8yyScuTyp9mAHxmKXVCRrhRIJClv3O/VTHZjUvC4H3GZ2az04rzK2Vc?=
 =?us-ascii?Q?ctC1EDjS3WjAOgn9VSSl7pPOjyTFzGTFFWkxzJyREOjW9w7nGnMTsqcmPWSu?=
 =?us-ascii?Q?tdm2HhB5ptuH8MS3OcjhKg9tU2XE1gDOQjh76FYLkvtWsTPdvK7Vna2jOq+0?=
 =?us-ascii?Q?aiE50t3Ht6j9zicWfU3eokPyChiiRMNjXIDVd21YxzDUa0YzsEODcfxsZ+f9?=
 =?us-ascii?Q?ndxCaSoCOdnkp8TdfhrYj+Ap2LU/XODZZGYADNslzk9a9Zwan2Gam1ZyzBKX?=
 =?us-ascii?Q?1tek+04ezDqkNiI5BhqPe6AGN9ngf09LVpV/m0BOnz16baPc2XL2LGwS6/Rb?=
 =?us-ascii?Q?7+JAoDcSfqEk/tBrDf4EzUc1E7laEKpszz/8OooGBs0prgeHevmOew7hbINS?=
 =?us-ascii?Q?aP6HhYnQViNJCfakgSklAX9JiJYugMO36TDsNuiEkjZH7WsqkQ4P1iUHZp7T?=
 =?us-ascii?Q?PRBpcvmwRPODbolEdJGkszvxm7rlUlLiZ7c7XI4+d0a0pO3GQyz/f098kwqh?=
 =?us-ascii?Q?f0F8/KrzmOIARZXL4i3jR6rP4+QxW6SDyxS1/2alshLbm60dQkfai/oWeycu?=
 =?us-ascii?Q?gRoV/V/J+FO712RIWlFte8rJxsew1D2r2PvAupkqgWvnePW0O8wylfscAgAu?=
 =?us-ascii?Q?4RetBzxvIeSNBtsY21pEIgyvkwC26yL8zFrG8Vmh+kixOOqEj6JCH1AjmiOe?=
 =?us-ascii?Q?nKKmNt0JJ/400I88fk4ieuZpLfdeHisSGJy75/NNO6Oxs26FdjZswO9Xd1kD?=
 =?us-ascii?Q?+5sHDbrT57o37rQY34g+HXZPLMPPlVM=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3a08e8-f874-4a84-6497-08def6e75fb6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 13:57:53.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fk0zhgEBPfGmn2QqI93ZTESzDbPZAwYJXWZS4Rs2blVe70ehIcJIq+Kjv1T0PY3SqqLn0r6nuVfXM0UINAuHOYubs4ZeXprU4e+CBij+cQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2363
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 13:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243134

ChangeLog: https://github.com/numpy/numpy/blob/v2.5.2/doc/changelog/2.5.2-c=
hangelog.rst

ReleaseNotes: https://github.com/numpy/numpy/blob/v2.5.2/doc/source/release=
/2.5.2-notes.rst

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-numpy_2.5.1.bb =3D> python3-numpy_2.5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.5.1.bb =3D> python3-n=
umpy_2.5.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb b/meta/rec=
ipes-devtools/python/python3-numpy_2.5.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-numpy_2.5.1.bb
rename to meta/recipes-devtools/python/python3-numpy_2.5.2.bb
index 88786dc016..b0c0e85c67 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.1.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.2.bb
@@ -10,7 +10,7 @@ SRCNAME =3D "numpy"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "a48a113e6afea91f5608793bafa7ef2ad481fefbda87ec5069=
f483de61cb9fa3"
+SRC_URI[sha256sum] =3D "d482d171c406ae88c5b19cad3b6a1c4c5209f886ab74bc44c2=
c865c23f52d860"
=20
 GITHUB_BASE_URI =3D "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"

