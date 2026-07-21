Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F80C44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23207.1784641587978203664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XzMMH0Sv;
 spf=pass (domain: est.tech, ip: 52.101.65.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nBint3RnhJUa7xPC9dq9Xr6Qs2huZoFHjc05+7un6j+eol1Z81UOyMF3vREIAWcwE8is2tAfIgrnDoBNWHReb4eqjeKl2KJ9ayd0V1Tb4rFwQ/HMeekSO2eQrKebYp4L8twMtEKhkwnKMPc3V17XNYAVYiYAy+/QHgSBqy3TwVOzE3OQ8RserKFBuungY5payVQVZZ4cBnnAJO6wUhib4yF6LIObJveCIIeSvblPIdj1w+5IjOafP/IDdzHXd8FBWw+wV78x4iBg8MOuEmjTtXsPuIdtKTQsvytfhHG7rOX0NLaPO4hdWxF5rycsbGvcqDhYI/lVA2R48KqRm8R6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+R7g7Lwh1tvYYBV7/f2oLBgIrCbyGQs6xO+zzPzO92s=;
 b=Nt2nlPlSTsFq12YrCkAX2hGW4EQ4K5LSLoG4vx7lBfOkl9puThMMet6fvT05Heok2ywxa9W1RNpGoXJoOK5uLxPmYWjfIIHHYT704ORJb6gtWxxLaK3HnXdCHxVYNqCNyL3gr+dSdhTaZqqHRAeVs3mA6+Yia3RkZYJ1jNTH1naoSpo77cIrDD7QdhqFOp89cX9nSrHH1hxv0xEzRoaHp9a/RZhgrIUs/FjtNmwBFepymnhg0JJ99m8PUJuqy9E8+cPxxfTZYRpD13Yf3rkVLMJug/Q0fS24a/UhSpLF4Njk5+fwl4PkjIxGt0JLBFRfkYHpkDH0hRpP1tqPwb9lAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+R7g7Lwh1tvYYBV7/f2oLBgIrCbyGQs6xO+zzPzO92s=;
 b=XzMMH0Sv8LuZPZGHYq02t+eSL8Y++dx99nEsaZ+Z6lVTmSBoyxQq2aJ9YijDbEg2udQQHAzhUzZI7GRPjztTgOYyBCrtPpvFhNuHp0IjntjlhaZJc0nsd2cIgskEntD8gXuB9eYF0lw8Aw7pDzsKnfozFgDU7LDE9h03lQG4mXtHVbsxfi4q2a9ib+v9SOulTWXjQPnmZP0wZIQNaM3ERA9Ffij8kYaVTds13JfcRPeQMOSWXHy3PV/ZXUARrZeGr5uFClLWSsY0fVqqUVWzkgcl85NBKgPLoMt2FyzXc50MDBltPwwJ80E7/JAzi2MkItWed2LwKPqrfdWclSB5EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:25 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 2/3] perl: fix CVE-2026-57432
Date: Tue, 21 Jul 2026 15:46:15 +0200
Message-ID: <20260721134616.16538-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
References: <20260721134616.16538-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0235.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::30) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc9102f-0d49-4a7d-f1b9-08dee72e7554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|12006099003|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	HUsu60GylQazLGWcFt0FsDlLygWaGM8pR2fwu6RV2AkkgmHMTbKIe7QuFZuchhPbVo+8ik3YvjY133LbEumLOuwM6iwazHJ4y8sGqfI2ufHlwB8eRhmfLraCWjMjVLzpIatQiM+uhWifh+a1voCwhB+Jzr3lHXa+aKhT+9hQX7Deim3sdii9Xlnox4kzEddEYhK4eHAaLPoibpJuDW1vsaSwyDIbSwokFY6czeRBwgH5A+54uNm0Zx9tcMIYgmRJl6KYhkBae79SDFWkTOUzuO+HWkdc4hSmQ9hZYsnbBMHqEh/1BPtJ00/u/MmhrGf12tujz3BPA8cfQlyF3DOme+4bwP4FbApem84eutxhN5KUdffWEBWyVwzzjauGtvo69RwiQ2h/m3K1qFc8WVN2pHIwuWUNub67Cpi51XEZLF7p0AxQZUmvqp8Ls46ixp6f+6PRKYkqlsggCBtBaZHy4iEGgskP86vtqwpQruDiyg11foiLiSN1ZER0Jzy2qRa+nfbmZe76m/laUDCujPjj7c58Nc9WQ2zhSAn/r9py4fMayQCYRenunZKvVHbe5GV/yVnxHZGJce9gJQYjNAK2GeRacigTvsZnbLgXdPi8bOk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(12006099003)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4qsiHtHBf7GkjUs/DZ0gvbSZI7Vi15J9reK9TA/I0K7vFNdCuv2ZCV1Q9kW+?=
 =?us-ascii?Q?JAAZlGrjDDZpORroIoYFU33iW7YWarbqjEO21QRyczvgtsdTS+FnlioPtOtk?=
 =?us-ascii?Q?INTBTDlSikfENh25RggN16xhNbr7PvFIbLTHROj0oVkxrkcvVXdM+Nr8Uux6?=
 =?us-ascii?Q?XOr/l8v7KCFlopqcXq6EDcM5gmpPiAsQrqtjBvUi1aL3hMotreV7gIkrRwds?=
 =?us-ascii?Q?NjZitoHXRfMMqyVLbRvUsKWpxl73PhvBtFEpzmGbNB7xkv0qCDa8PDavqMqk?=
 =?us-ascii?Q?cjrwg6YokJC+HRr/MD0nBI9RcFOKmKhnYwQOKZ/0jdLSLvTCly3DnLMZisr6?=
 =?us-ascii?Q?/ILmnuI074YZohy1485NfiG9qWI5lK/7BzzNn614ekUxwyJUA7yz+aYwFLVM?=
 =?us-ascii?Q?ix+H4jBC9GQvKiNvDZS1wi8G3gusbMlKv5TPaU1yligPndbwJaUOiD1IzOjD?=
 =?us-ascii?Q?xYn8PyLkAdDA6vYQdPx7wR7eysetVkN5+ifkd74fxGAagne+7cKEuwkGDoPC?=
 =?us-ascii?Q?2x0hOBmhxJRffAmUumEWkgq7rUSAlcU13chrY90RTTJZiH0N+D30CLxLWgcI?=
 =?us-ascii?Q?fmpx7rUgq/i/RAC1PTBk8UyKD0IYeVBF55IQPKM2I45AG40LeKHZ0dpRAc3y?=
 =?us-ascii?Q?zkB9WX5I0CaAvEcR2apRIUtgoM8gtxGNJXFuz3iJfwSIt4BwLD8TZj/LiL0L?=
 =?us-ascii?Q?2Y0FbdnkBbKJ48lZnF/F5nnxrNGL2yy0EL14huS2aMKJPEH8ERj6Pubg71fz?=
 =?us-ascii?Q?bYuYy/JohcE+KB0j+QIaFN1haKMSHYjzFypS6oyYcT1VIZpZy53etjAsbL/M?=
 =?us-ascii?Q?ZC301VlO98vAPm5sDq1XnvYkXwyqzKBLsG4BZpixr3FGF6Iifc60OPzRKE8U?=
 =?us-ascii?Q?g7xpI8xM4MUBSZoE96KcIH3r06Clw6ZLyvHBVkJevRPVuAzDKnPSXR+8aiVf?=
 =?us-ascii?Q?C86la1h5rP5un4yLkRlbFJtfa1t77fOcZdYk9g3ocwmT3rVGXsUxyMGvhzKY?=
 =?us-ascii?Q?HMkibZuhj7CmL3Gx7oL3NhO9uwRgslu3z+8YUz4u+g4dIPVSqQ7tYm/G6C7H?=
 =?us-ascii?Q?dPUwaPKR2sPtvjFOplwuA9SbrsRaAVnJZIF93lUaYT9SoVU1VaXAQKbqI7YC?=
 =?us-ascii?Q?10KkjEvbGCvjx874rcU3hGS5XM8enSxGMj4lLzzUkuf1UvrYK1mnhIACXMpV?=
 =?us-ascii?Q?mraK6L5I8dTs5KYbQtlDQ1LUW8wLLC+Bkuhz5zTFOySHbmIA77CzP1bzsGmN?=
 =?us-ascii?Q?7t6ipeM5VFJEcqXUf41gTU7NgvQsfD+wH1SFKF1oLkHkhJjr0usGGI7IvWjy?=
 =?us-ascii?Q?yLa1h5+UmYgQBe690k4I+bEpqRAWEbXwWoGhJHvWWeDskiQ8jWLlkdaoSFXf?=
 =?us-ascii?Q?gE1Dw3+/lOHxR/g77lVyGS+tsq/3hAmQAVtd7mSJTplRUSFwuI7BQ3EF0Ioh?=
 =?us-ascii?Q?bRWGwTN2toironfh7GVjSqBTIGhEVPwqVpUTi51gEA++F4dPDVGzp73FFzk4?=
 =?us-ascii?Q?7ShKmE4RgunKWnWRDxxqVXN6C8zgTvZj7vm5rsdGhT6g7wGcHwC6SIRyZXrD?=
 =?us-ascii?Q?eizCixOatmHb7qPqf1c15TTJhQHJSIRkQnQLXjniKCNzqJqGPIYgWVSkZ2De?=
 =?us-ascii?Q?bXmkRJWJIHOwxQ1d2qxFZoxCtwiaiWda6aW3E1eEa9qslH0l7e/w6Z2TKL4Y?=
 =?us-ascii?Q?rNL7Qoo/ZoiwRWh3vOiLGIDLh/yQ8oQaxS3mtfh4oWXWMarp9oM2fldMlbLi?=
 =?us-ascii?Q?A0raD+fJzsd0b0MU/HyzDgdpUmULD8s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc9102f-0d49-4a7d-f1b9-08dee72e7554
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:25.7479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vKBhIVtexLgwM274dLbqg2mMWoo6H4q9e/9WrCKuOzfFpftlwCQbejVYPzgLcTIR7vkPPG+wt4igJghLe9Qg69IXXlyuwrxOl13dNUN9/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241527

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

