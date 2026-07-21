Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9D8C44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:23:52 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24041.1784643828365687799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WzpJVpg8;
 spf=pass (domain: est.tech, ip: 52.101.84.62, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvl06k4CxqYEld+dsIOITZ2zYAK8b99PYCdC5slPbiVtSgzpgLnc5KQ2IuOzhLnESGovuPmaC4IBR5blOwjB47SJPZQ9+c7FUN9CRS3C/t62xShOoB5yAsnKzW0A5glUKRdKNvTqJj3RkHo4NdDRqNSXusYduP45w1ukQ/gafhqDu3zBZMZJz+6LU5bLgzz7q9/Ge4BahMUcVU1Y1xj3MTQZXom/5jIO1jk5Jplh3T4Se9sEcMfS5jEpnQy5+thVmzrWXPWbRvW1MzkX6SvhSolOv0EqQYHEsx0UmlsPkjxApt2OIp20wpIcrIbUXtf7vtDKVodp6k78QxbyOrc0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R7g7Lwh1tvYYBV7/f2oLBgIrCbyGQs6xO+zzPzO92s=;
 b=huy0loCdiRRODLYvOrmN46VoTan4E/z+auuuTs7XFp7c1GQPh5hOW3OzIXzFkyW7OdNf5dv2N1sSbW6hWdCOYqyYpobhSfVW+FwQEsa/8p1oriiHP8vhZ6SX5A7Wk/p0IGco2dyz9RLtObzHUgSQ5j0T1GPw0G/8S1F8Xa9ab7r1yCETZs0fadYo7QkVW5OD4u6G4HsFt1CaJTihaF+Y7eVjC77+Sufl5EA6DU9JIPFLVdBh7mLc+m3JMAMzdm/Gb1x320weVFlsbpddvXGz1t61fFTiD/9PLdC4vglsStRnG+FgMprVMPgAhQdyQ45lJmhzaxWG76K0Geh67NJ1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R7g7Lwh1tvYYBV7/f2oLBgIrCbyGQs6xO+zzPzO92s=;
 b=WzpJVpg8D64szSyRaxqJbRiYtHfJw5iZye9m+/aF04C0IFS9k9Rbv88wRAI321hs8c4EZHtAv/e7vP4CeJv1m66YpNgPb19j1d+c9ZZAdfu5/qfITRZO+K8Gc3+wQcYLKyBMzvKWZOPztqdIGGbz8RCWbueynKQge2vuyOUAAS2FhlFiHLXLzfWYHhcViQ14P3/xfzmo+m+Ksz40VOYZdxHRc86WWEQ2o60yL+RLddNZBWQmEIGWCR4OhLk8CGqjdxM+NKaeeowDv+WdhDGtNWrNZ/o09bxt1G77oxuJdXep1bfbsoh7pOtTKEtB3uE5BD/LRXcfzf78guaY/ulh3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0850.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:173::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:23:48 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 14:23:48 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 2/3] perl: fix CVE-2026-57432
Date: Tue, 21 Jul 2026 16:23:35 +0200
Message-ID: <20260721142336.21513-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721142336.21513-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
 <20260721142336.21513-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0155.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0850:EE_
X-MS-Office365-Filtering-Correlation-Id: d5adca0a-078b-40f1-c34a-08dee733adcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|11063799006|4143699003|12006099003|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	87mNV8Qd0Gk67q7VFvkNkJ5SmZ1zcD9h/GwSmC2NBhLBSH6f936jQ/9d52a5vqSsC/xCsHoSTGpL0iXsPc1Rf2WYRVABk41XmyL4cqZsKF/DWemjFZNrAqpzIVxBsLaqxLlCB9W8WDvuMfad+cziOEdqiiIGpXXX8h8lyKtvm+3264iFxC8fOnbTMUMSE50px+tDF0aGMSvnwTF76qHj4LOnC0SuSESYIK81vY0QYW5L+cDdvvvhIAEASm/6HjylDBvtqmss6vbZUj5ijojKqbqPjy3/juw+1Xp7dr9QbQS7QSJrORqerZjMpetGu3JfuHK2zjYhzrQYTZGwvBswurLA4VGsjXj7Rw+lTVx/yi3YgwgXuJ5GMu8LfBwAOQoK7G6leQ+a+T+ECamFm6gyMGeN1/d8mHrJiOXh6St5iOEO9cSYxAUYgKSxUfUikRo1hAnUTOq9flrEPeNTlNUIiVwkCpIoN5IC9FTYvg3wF1pC9U9AVIKDT8bIIIWkocqf+ERHGaJuJ6LCcy9JWDOXhCjrslVGCUBURWjHceLSekoOWTizY81o0vOOz3jzdfTxpC3DlFrKSKbsltMEYXQcBlHuLSqIk7XpjHdkg4e93EI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(4143699003)(12006099003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LNE/CmTsYQKyypV2E7LXDNo/UbhotVtl/GqVa44NARtZK0JfpD1gA/+yDKk8?=
 =?us-ascii?Q?oFxy09ssVjkqM6xdk1/dRhvcQNzpm1aut+HN589TyMHVS+BVUEjgP/gbR1Tp?=
 =?us-ascii?Q?x4tJMOjW2Y4hZssczT1tPArUVw3Mqo7DeheeJxrfinmWwbj/up5N2AIcIKO/?=
 =?us-ascii?Q?S28KwxP72IF7UVQWzcPNzNrsQnJpTs9jMKNA82qjn/RI23ZljcOSoidgMaGk?=
 =?us-ascii?Q?LiGAUpBmjS3z4cL3oZIXCcDNwVYeKC3N+Mx3Nls+IJpWdL5pPY8yh5hbsM1K?=
 =?us-ascii?Q?7G/eQqYE6WKOyDqbi96nMEu8S1lTRZQ4bYJPdKiMY0+APUcMAghRNSLMPJPP?=
 =?us-ascii?Q?gG03nhKHnshbW6eBstgf4/ErAYHaBscUdPXG5B5BylemCtkGNsG2LNbRm38j?=
 =?us-ascii?Q?Fl6v8aCL7NF+JG1QJRCVGieE6HX49UmlO/pNFnQuQxozcZyL3socg590RawX?=
 =?us-ascii?Q?KJeV3gsKjR3PcOiH3mFlMSpcgLuNd9HoDEdANG6RONi7jefhunsCD5UAxATe?=
 =?us-ascii?Q?mipmNI87vZePUKp1gPt5ZX/wHSt9aTxDp7c6+n/6VRO46CXN8+1a3qeTYdOM?=
 =?us-ascii?Q?mEy5m5nsiK2ZL/LVAiOHGM/OKpKs0JXsg98YEarKji/xTXfl2XpakDHgjm6j?=
 =?us-ascii?Q?6AlxqE4439ud+iErNMHt1YoQmD9i6Jig7Rq/ubBIM0n8Xw/iNtr0QENdeUhT?=
 =?us-ascii?Q?98HGcYwzLWvifSlcBk/jTxcCdKH1jJelUcOJt1u4AHrMylHrz6MJmfHFjMuJ?=
 =?us-ascii?Q?QX0kdxS7r3RHo9SFVDlsq0MYhSpt0GYdt7oNHAOWvoLJEiulEVhm2gJMeQO5?=
 =?us-ascii?Q?DPJ1kivfmlqcckhKLS0YDwtikR5/xYnAaF/dG77W7CE8/QheGcg25kN11lRV?=
 =?us-ascii?Q?2QjZmv15Sn36EK57+aHU1OKDBDSi7D/kK1lcmp7muee5v5hu6n7QzWeDpNTH?=
 =?us-ascii?Q?wQx0xH2tsbBovrYK5AMJiSW/YFuWLQfwp9BnN+BkK3hgXsCgMQ/x1/epxtvF?=
 =?us-ascii?Q?nzCNYYCaG/GzxlywyWQmNSpW3GnlIx3LZyetE9D5cjOcCPCsfuqtNJlFTMpM?=
 =?us-ascii?Q?GXGRU38ebd0BRJkyr4s3V4J6q0LQ9IOm0Mj7zEaFJfAbMCIKz8ixjiDztcrA?=
 =?us-ascii?Q?7H1kv7yA6ERn1TXZPxsYfb2bxeaauC/PL3PCMukLLT3w9k/XS/L3wAYt7d4m?=
 =?us-ascii?Q?y9drOc/zfeGZkUz/JlrxUbhPIYBnrfuRW6aMbMPdizSguq1fUhS40bcDIJ2r?=
 =?us-ascii?Q?q/lBKLbGCkEioH+rY8UhnVXBTf1YpsTAVqVTML5oLkcthi59A+5l6z/LnBK5?=
 =?us-ascii?Q?8xWP36X+OFgBZdzjdigrqqE8Os+sVpIJIwIAvlj583Tdl5AKA1QIO5yawpRs?=
 =?us-ascii?Q?/FvCay1w9mnaHhyVtVdofHnTv1wWCdadTppG1LHybA0x2UbThksWrnO94P9M?=
 =?us-ascii?Q?uZp0K8KfrWNt+bhZKEtHnCqKn6huXMl84UU8bZI4wlDysIJ/3GvNXxQbRYNN?=
 =?us-ascii?Q?R2rz1w6vN2uhmihjvh0Vwdq11q9hPw467k9WwWIfAiCsP4altTSE+F9Msm58?=
 =?us-ascii?Q?Z0IqmZnXlgrQM4Cg1eC33k4x7HU4Vrx2i0rEdKWiX+VsYYZVjA+0m6HjWHXp?=
 =?us-ascii?Q?m9oBt+5hBhA5VyEx/Whuj3w2uCowv7Kt5EV4qgaYnpi8uA1/yMJO8TRZMZAE?=
 =?us-ascii?Q?DWf6esObpLXa44PmCtfLJldbCKUVq/iL4tTRFmHQ9eLwWbHSvwPd1TAE2CBW?=
 =?us-ascii?Q?YMR3dISQKC4vrTLaOT2P/58w+h7AJgc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d5adca0a-078b-40f1-c34a-08dee733adcb
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:23:47.9992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8I1012eSIHNtSTtM0A6SaTJvuePx4Evw1DoYBBdpQiSYqUUQowmD+gUVRVkwYgOLW2HEAPk3BNx4SL6Jcb/5wS1vA6/ifxsH+OFmPglEpJA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0850
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241537

This patch applies the upstream fix as referenced in [1], using the
commits shown in [2] and [3].

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-57432
[2] https://github.com/Perl/perl5/commit/5f7eb6bbbe0510964e3fb1d6bb691e5445=
913e55
[3] https://github.com/Perl/perl5/commit/40754edc72dd3e513d758153c0e2f02158=
97740e

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../perl/files/CVE-2026-57432-01.patch        | 52 +++++++++++++++++++
 .../perl/files/CVE-2026-57432-02.patch        | 34 ++++++++++++
 meta/recipes-devtools/perl/perl_5.38.4.bb     |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patc=
h
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patc=
h

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch b/met=
a/recipes-devtools/perl/files/CVE-2026-57432-01.patch
new file mode 100644
index 0000000000..ef92b0d7b2
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
@@ -0,0 +1,52 @@
+From 5f7eb6bbbe0510964e3fb1d6bb691e5445913e55 Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Sat, 9 May 2026 17:18:43 +0100
+Subject: [PATCH] pp_pack.c: Avoid ssize_t overflow when calculating the si=
ze
+ of a structure
+
+If the user has requested a size that would overflow a SSize_t, then the
+only sensible thing to do is throw an exception, because the structure
+this implies couldn't possibly fit into memory anyway.
+
+CVE: CVE-2026-57432
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/5f7eb6bbbe=
0510964e3fb1d6bb691e5445913e55]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pod/perldiag.pod | 6 ++++++
+ pp_pack.c        | 4 ++++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/pod/perldiag.pod b/pod/perldiag.pod
+index 841e22d580..d9231077363d 100644
+--- a/pod/perldiag.pod
++++ b/pod/perldiag.pod
+@@ -4880,6 +4880,12 @@ mixed-case attribute name, instead.  See L<attribut=
es>.
+ (F) You can't specify a repeat count so large that it overflows your
+ signed integers.  See L<perlfunc/pack>.
+=20
++=3Ditem Pack template structure size is too large
++
++(F) You called C<pack> or C<unpack> to operate on a structure, whose
++computed size is too large to fit in memory.  This usually happens as a
++result of embedding a large number as the repeat count for an item.
++
+ =3Ditem page overflow
+=20
+ (W io) A single call to write() produced more lines than can fit on a
+diff --git a/pp_pack.c b/pp_pack.c
+index b5c0b261ef..6075e83aac 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -528,6 +528,10 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
+                 break;
+             }
+         }
++        if ((size > 0) &&
++                ((len > SSize_t_MAX / size) ||         /* detect overflow=
 of len * size */
++                 (len * size > SSize_t_MAX - total)))  /* detect overflow=
 of total + len * size */
++            croak("Pack template structure size is too large");
+         total +=3D len * size;
+     }
+     return total;
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch b/met=
a/recipes-devtools/perl/files/CVE-2026-57432-02.patch
new file mode 100644
index 0000000000..273a247a88
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
@@ -0,0 +1,34 @@
+From 40754edc72dd3e513d758153c0e2f0215897740e Mon Sep 17 00:00:00 2001
+From: "Paul \"LeoNerd\" Evans" <leonerd@leonerd.org.uk>
+Date: Mon, 11 May 2026 12:25:33 +0100
+Subject: [PATCH] pp_pack.c: Avoid some other potential overflows when
+ calculating sizes
+
+CVE: CVE-2026-57432
+Upstream-Status: Backport [https://github.com/Perl/perl5/commit/40754edc72=
dd3e513d758153c0e2f0215897740e]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pp_pack.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pp_pack.c b/pp_pack.c
+index 6075e83aac..b2019902203a 100644
+--- a/pp_pack.c
++++ b/pp_pack.c
+@@ -515,12 +515,12 @@ S_measure_struct(pTHX_ tempsym_t* symptr)
+                 break;
+             case 'B':
+             case 'b':
+-                len =3D (len + 7)/8;
++                len =3D (len / 8) + !!(len % 8);
+                 size =3D 1;
+                 break;
+             case 'H':
+             case 'h':
+-                len =3D (len + 1)/2;
++                len =3D (len / 2) + !!(len % 2);
+                 size =3D 1;
+                 break;
+=20
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/perl/perl_5.38.4.bb b/meta/recipes-devto=
ols/perl/perl_5.38.4.bb
index 8dccd34499..b4927646d7 100644
--- a/meta/recipes-devtools/perl/perl_5.38.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.4.bb
@@ -21,6 +21,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
            file://CVE-2026-13221.patch \
+           file://CVE-2026-57432-01.patch \
+           file://CVE-2026-57432-02.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

