Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A53CD37B4
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 12:29:38 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.104])
 by mx.groups.io with SMTP id smtpd.web10.48760.1725452972036355827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Sep 2024 05:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EbevNwiQ;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.249.104, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPvPkeK0iXgqWBnFRcuCcnzMBCCp2nozzqJRxDaZ33hraFyoWNY4fpU/rUuccVplEJpmX5xV+PvKso7fW8uTCwZKi0/fg9Y2r/lYmTFmLmYeOfxfQGc/nIM/y/tXTqDZqUG8Y2WI3guxVu6YHwjJ5I182Zuzrf5iKOLlT055+StftvlCoIlzdb2+BARE9yiOz0bONSe/RnWVl/41opv6Ufrj4KkzlDyNzsHwojodfkaBP0J+tNkRjkXfzqw9SuuEMEdPFA7Ra3bIuiss5g8berG/Qg4qyA2xpfs15T7bfRcIFQp/ARXckunBmxa8Af6gpgUJ9g/oSXQihRLz2noZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCwSwYJLoH+1GdY0/Rt/fjXtczsnoI+Pku165oISFb4=;
 b=r7J4TwbEzI5eqM5oBPLHcnOu67mWlVMHFocLE22gfP2SB0M7CTN3k8vLnf5RGXqSXWPzi7qTvfEZm8vP4usBkIm6ydl0UxNKhKy+oywT8aSKKwDGvobOhnRnFLbCY4feExmIxSTyJ0m1xFfPCEHM4Zks1IkXTjpGCtHRw1zLEEAAUVoWZCb/eEpMgt9q5rXJ9b0sARN122LSEA3fE/5V0BstOmsHcmtTaTIlfVoA+miTEgrtOaiu59J5uvMwBZf+EPtN52ZYxyVKEW0bgfnKar4pmGKrN8bTCQCAUMz0ZZFRR2gWJT1GO3guyZCgB94Fhc5w4z+iDe1XTpJvcu1+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCwSwYJLoH+1GdY0/Rt/fjXtczsnoI+Pku165oISFb4=;
 b=EbevNwiQi8O0XcTW2LrMD0qZ0M6eUfgMOf3nzEDLtT2shtE9bQ4V0rjnK0IlM2NQ72Fun8nODEaeFkT8hWg5ocX6KCQ6t+cKE/LNdGS5oHE3eGJIGcqwF7jFVyxk2hPDD2A5JsU/LQmJccaqFSVM+1MXnmpDBRR3p9QbJV/QiAxzpmFzjve1ChWLZDpDlhnzV23pzhog/1WkR52JNkoE0nQDtagUJWoJf81oXHEalJba7m3cfjMmDHMc15eolsHtacpmaoNgcLigKlLLJZMfbEsWb6odfzMnZM9digsxqeY+Ee0mg4BDgV3oO+WD+zg69U5ft4pU0iWXGNoI28c0NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB8045.eurprd06.prod.outlook.com (2603:10a6:102:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 12:29:28 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 12:29:28 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] tiff: Fix LICENSE
Date: Wed,  4 Sep 2024 12:29:04 +0000
Message-ID: <20240904122904.997672-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0037.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::20) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB8045:EE_
X-MS-Office365-Filtering-Correlation-Id: 61259015-f4c1-44fa-4ef7-08dcccdd37f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Ip+FcLo7gMriNoc+j/TZfn1eNntZNF4x3kcAY/MKZ5PgB+KlineDIRE/JZPX?=
 =?us-ascii?Q?5BXhZ2AKImSbJRQEHv/ZgEa16oijUKpa9gOLJpnZC/euzZ+Fr6x/kJBw4mzm?=
 =?us-ascii?Q?ce7nFXdyOmAmy0VfONfUXQk2Fe9tamSsoxoU6yZE1MOSHbcsk2+YRGAug8T5?=
 =?us-ascii?Q?z9yUjTdr2X3Dpb4D4AiJPBQxdYkqqep4vFwnoSqNyOar8RM4tl4xCITBICRi?=
 =?us-ascii?Q?NmwlxfeS/Ef7i45FP6qgFCSJ8JPgwbioT6C+STvrkjGbt0zh19V63HSC3hdg?=
 =?us-ascii?Q?weLSN/oyadoiD7cz49/5WvHKmJU9aUkrkSJjFZXYBUYWuMP3gLnL8XuXdooo?=
 =?us-ascii?Q?5azU/HBst/Ob8B1MMO4FK4MwK103SV8KE1L7OMc2DFpadc+jUNEb+ZhH2FlA?=
 =?us-ascii?Q?qTsu3LfI7qSrtGxRYIKuzT20ziyL9xPCbOsZiHfm8wPvGBr0F8MEqlEWW9y2?=
 =?us-ascii?Q?baX2X8G92itcFn4aJdDeGBJgrTZ6Xl7mji8/SlvBVFqmYugWFS5w/s2ELHdC?=
 =?us-ascii?Q?6jRoNCYCbAKmQbzBh/NYu4HoDd+1S5RA+NpMK2DiuRJvvYWWIwsWYkH9blz8?=
 =?us-ascii?Q?bbYpp/b10vUjjsuE+V5tSisJg/gP+Yx6OodiOWwLiYG2nPPGTyiX7CNLr9oG?=
 =?us-ascii?Q?oKwxfitMLMU7qBlTHvcyNvfLpcScwwNvEUQjVnXLpH77Ks/qDesB0cZHTTBl?=
 =?us-ascii?Q?12pmZNziJ6M5Zi2wtRIte83YqgXgq2/ijpgXcxXOFguB9nCRiqc1tSFmLG5h?=
 =?us-ascii?Q?USdWboGSTLVMFqQKShFwkHTDNSonlC1iY+pgr62zVZiuoM5gZFbzqx2V8Amt?=
 =?us-ascii?Q?a2NzDRzw4dGpkTun0wAQ6/CSNysZytDUZMiaYOfKfdtzjl+wGNQ3pC/IhLXJ?=
 =?us-ascii?Q?p15UzOpTe+IwRfKwKH6KiLGJ+npaRfJumQtZ8gZ/EVEvxpSc+kj0NlzQJRyE?=
 =?us-ascii?Q?NIATHzxAMLeEaNfPjFFn8tGBwiA5YPLRBa6SNdZwLyKeZcimtTjG70Hfbz23?=
 =?us-ascii?Q?CgRcKNncYgAA8M/IxFks9GU5VpVEilwT2YICi9XSP575YR/NsLqjB5wXQJxs?=
 =?us-ascii?Q?9QT+I4tWNgthCAdzJlOelOeavlot+qFGh8byP50rx3r6xgn9AR5UDUmcCG44?=
 =?us-ascii?Q?XR0mbuKKFrxBBtOu6UJ3awr7f6tD5WnGTiGhUZlH/IAnwGYI3aKteh6qBnz5?=
 =?us-ascii?Q?xgh5V/t4yJpN+tJZzRbAZOEXmFqBw0bivoJPcx9GZhO4rtaAz8JNVAjcR3nQ?=
 =?us-ascii?Q?TSZ6JQDAPrbjd9cNyoqPZUg4v2DyQl/zV2jd0ffFzTtu90eye9iTfGKfQmUS?=
 =?us-ascii?Q?K1GDL1yKGB5xH8WQRkcSMJbAycjkswFEI1QRWM86QnbytRlIM2PKpT646Tw4?=
 =?us-ascii?Q?tXMMsUI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?E6QtuR73YKJOpxWuy5j4EyXXbRhO816psnmSMWz+zER0X6SzXxHpjolSMHHa?=
 =?us-ascii?Q?mJhjPTMpyuf1R+kkj6/ezj3eNabE1BMRpSiqNtFHA8J9eX5YOcIK/P5vpVXA?=
 =?us-ascii?Q?UsvRpBebIEc1Ys7NNvP0cnHerDrn4voSfNXg58OiomVcNKAzOM68U/Un11kB?=
 =?us-ascii?Q?hmTBmfwV5UbClrfSPYf6T52EOTBROhhbTVdasB5Ocewrq+zjsnkGvZOqOLUa?=
 =?us-ascii?Q?TnuwatGbif1bOkVFshzYEcwmJ+Dwo4obakNdgifxOqdF3gboQ5BjHI3nUNSW?=
 =?us-ascii?Q?q90Y5R4lMfj+m4GksUB6Ke3+MnwUnMkt81hIsREIooPvKyJ1YhIEEEvfw3nU?=
 =?us-ascii?Q?dFk5oQz5LHBsFfcbY3KHVe1bLN6bYtR8u83SROQKHkOYxzOaXmOiGyzqr+Wq?=
 =?us-ascii?Q?qYbWL5cKYbC1c9SzoKU5SBM5W1rWHS67xtxXJwS2yYeAWxxU6MBVQ4HmmPxJ?=
 =?us-ascii?Q?IcG9eLUHS+vDbHI57IkrPGpij7USr4dZR1hzPZcCUtY3Vvu3o1smaoJK0O3L?=
 =?us-ascii?Q?PgSFi2QBPpBuuTHonn/vbM2/FuBaPHBVptN2MrIpRem7PLp5ZszuPn4u3vGf?=
 =?us-ascii?Q?u3ErTBpqGFIuBzhCSPMc5prAt2Kue6XZlR2CLTIZ4fg/I31qjxike/C+Qi/J?=
 =?us-ascii?Q?ogjV3yD5Mz95cYqo4hmskET0kj8vj+ePWvRLZs0pmEG8XAROxck+YDsQNaOi?=
 =?us-ascii?Q?+kuFDZxWvsmGCwjzFWQ7nZH8AQ4bfEJFv3Zo4mcWS4yrhJciSn/6CU7KrcoR?=
 =?us-ascii?Q?qWDx73odYy4CsHrILFD0g9p1ptH/dTRz4UkucZYNuNpY8ZG1pDT1fh1sMT0S?=
 =?us-ascii?Q?K8Rt/j04O4GQXTEq0ueqBUhKVcWQa0zXfyQAfbcGa0ieishWI4NMV2HedeUI?=
 =?us-ascii?Q?BCat1QckKi3QuoJdJb4qltBuj7iCzOnuMwYqAkQPs8bOMhqYMFUEdr9JaHma?=
 =?us-ascii?Q?wNdx02Xs0+nLoSBJ055lnY7r9qDer7gG7++59BMk0DL2n7yYAgp0wMNdNUoJ?=
 =?us-ascii?Q?3zedPnJ8aqvyCkEgh/QPlx6JR3kewKmi+rIDTtGBNs7PSa3BfsPJe0NHXZdp?=
 =?us-ascii?Q?e6DwkDsQr5w222bVZF+iS+3IVAEnjH/hqBhdW0ED73UnkmA6qQBjKKlZjF1a?=
 =?us-ascii?Q?ujY+g4JOZqJY4RA/UexStr0KPm45BiBTDch6UALdPekxvoS2ODOfIl+C9Wdb?=
 =?us-ascii?Q?osdkjFBzQambzCOvTGS63pfuFQN1pnpBuOK/MKA3RaPoJuRTEzOX0ucX7Z8f?=
 =?us-ascii?Q?xCOwycooStDu6AaE2zK3kWV4rSOLUVvOYG8vtLeUIL60eXkN9G5h9voxnNHG?=
 =?us-ascii?Q?YTRzLrRjJhHVj3fHBYPDwgdVM5xrXsL3Vhqq2N+6ZMuUuitS6r+bFyLpY4QF?=
 =?us-ascii?Q?j88r+9IX3i5hqLK7tvzSA9PtssNWap0oKN9oeQQG0oNwloJWZhr7wvKB930e?=
 =?us-ascii?Q?6nbHd932AgRe2+09j8UW24EauG1kY9R1/qM1iZ9CCEYt1MXVLNx1Ci4forZq?=
 =?us-ascii?Q?WNNP1wHS/MzC5EKaX4WhD0pthVmMVDLfZTihyR/pLRvF681jvmxoOnMa3A5e?=
 =?us-ascii?Q?PP6A+0Xk4Pa0+e8zeiqtIdkUUC7k+oUX9shBK+yc7gMz60w9dzjLAojVP3Tf?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61259015-f4c1-44fa-4ef7-08dcccdd37f5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:29:28.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGfdgHRNnPXn1dpyrZ3vCA7ZuNoajfg2xYX25oqdbFZM+iUMy5FfDKZC4cOf59Y6RKhIubFF0ODwEhv20joOzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 12:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204203

The contents of the LICENSE.md file included in the current source
code package match those of libtiff license, which seems to have been
the case since 1999 commit
https://gitlab.com/libtiff/libtiff/-/commit/0ef31e1f62aa7a8b1c488a59c493077=
5ee0046e4
where it was added with filename COPYRIGHT and was then changed to
LICENSE.md in 2022 commit
https://gitlab.com/libtiff/libtiff/-/commit/fa1d6d787fc67a1eeb3abccb790b5be=
e969d424b

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-m=
ultimedia/libtiff/tiff_4.6.0.bb
index 89681be634..6bf7010ba2 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION =3D "Library provides support for the Tag Image=
 File Format \
 (TIFF), a widely used format for storing image data.  This library \
 provide means to easily access and create TIFF image files."
 HOMEPAGE =3D "http://www.libtiff.org/"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "libtiff"
 LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d6db1386b4689c81215=
31c3"
=20
 CVE_PRODUCT =3D "libtiff"
--=20
2.39.2


