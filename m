Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3EEC44533
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23113.1784641570573765269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vEnOkmLk;
 spf=pass (domain: est.tech, ip: 52.101.69.6, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksRdSWogfHbVSz2pZPMozdNvP8BbXB54GRNg0/wpIzrI0Mv7lZe0bcoUy0pKjkeyxcKPA/74695SccSupAsWQYaObJh59P54Sye/ELE9d0nXzim/QyyVALrwfCGMhmxxmRf7c6kVot943nJMO3gMmop+xGxoSQSniDkOlTASANuXyclC426foQgwceBnTiGDHvcaHAcwAbkyqEaSZbtjFHKxEul2MIbTjHFRK2qGgqpsof9E3RXl+vYoyOBwzdDBov7r9rdvIreQ9dyr78Gw4LgwjpLSmjuTD7rKudD/d1kCtYvK+sNmvg6v/gK2E5K2CI7j9d8YjYJj1DrwnUcIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n58SmD68tEWAtavsiiWWEljfIKbr06CExWjV7u+ducA=;
 b=XC7oxRlprJss9UjtYey0CtQU38IzlINjRHwnXIrx4pA1HkVGs2kF2OZ0YctW9tNTCrCFdDvKQNISt+uY8OgLP2XF6hvwtl69FHSjT4Umsz1eYHDEP54yWzFSIhgviGAWray7LiUMo58TWmPOeiOqqcidpu0p71CXBKbh5mTQR8eApCXYX/83791dBvp6W9y8mx18kGoQ/TAxaGvk+oUR/baHbRdj1Qf5zeVaoC152wv03s08NOBcUtnut1zHBaxz4OPYJWLwx9hGbL39S8NLaaXI/HCwPk1vnBJjtUAWe9ILu2/pjgueFpRAIQQfjzFoPew+U9jDOtUdnqhjO+6HYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n58SmD68tEWAtavsiiWWEljfIKbr06CExWjV7u+ducA=;
 b=vEnOkmLkUXG/tLxzcRTfyrmDPkVp0dDA/9P3ps6FgpMSELKUU5R3BwzkgQh3B2K4Qi1fcyUEI8fbjaPhe21vNqbeGNFBP6pPNeqzkUIDOrxZUqYEsYi10uUsE8PzdT6ixUG/TZuXPElBjYM/66JJuYIsh+DJ+7WqqCuSqIKWB6E1HWXQv4boAR/mWe3499emUhslMUSq/CRgYhF8CO2F7+hVUbiUH8aawNcnBHeCVktW8txpz4HevIrl4Z8aI6njsXXpG4Mq2J0WtkiskN0SQzOVES2/WAD94StkSkJs/a8Ua4jDygoWM9wDqlPHjZNUlD4FejZwSZo+IZKfxv5meQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:46:08 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:46:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 2/2] perl: fix CVE-2026-57432
Date: Tue, 21 Jul 2026 15:45:43 +0200
Message-ID: <20260721134543.16442-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
References: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0010.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e2ca971-9138-430c-5b3d-08dee72e6abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|12006099003|13003099007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	yA8sSXTCBTKhvVs03eDbj1QXt04J+YoDB8agYemVAub4DV6/cSVbJE+Y5MW/dgClIkAC04EUEgAwHUYpEDNpQa/UwLZDIhjGDYH5bOFHcgLCaObrjdmIw6/3D+oOIS/k/5IZ0RlRmt+Bxx203N7AKbaM9raR4jNC4WkOSC+e9UxJuMsSuvZwpJTH5Y4kUW8upd7Qic7c9P2AvTxotd90R7Iqx2LeoO8Y/goJhv7M0Cs7FNXP1BxgQOhWlEMX0Cr1qfs5N3AzbL29yhq+/K9wJd6wr/T7TEPD3SXP2orHeR0uyZBcQpCaCgA0bjuTOxq6q2fbDON9tjqYlhyoKQqWlGU32nSheRPwl0zGKYMHuwmaUY5NT+OWwUgEjQfhLwxI6V65NtW0L0HaddLxrv8OZ1dZKMS5MqFbqs7R5JTM5z2Mtqs2t/G/In+WY7ygHsff328VMDMNdQemmcBfHPLlBPa8Aq809N7N64VAXuHUXjYrSWYd8dSQeB52ZhYUCTHhZRQ5zVti0jIFXmIxPKqAQgz7wW9dmEqHF7m2w8yV4oHK4cqXTztxsLcVKm+liOCs7dhANvXC9xe1xQTrjRVdjvIZzK3MFyccWb4hO7OzZOY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(12006099003)(13003099007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7JXOpuYT2E+PYoRtepf29Uaven/INN7Rh4R0S/K29W1HfM3QsYstWJxHDvXa?=
 =?us-ascii?Q?drIjP5O4aEonCJpMcMmFjvvlJRB3Gv1JDWI0zZq3O5wjqacjLpQVYZ8U7R8z?=
 =?us-ascii?Q?FTEauPbIoJc219UXXCjTY4iFZNGGhxmw7Wvdi0Dks7koGrpa/3EWPnhlb15z?=
 =?us-ascii?Q?GeE8PZ2dURM8X2/ukbJiqJZKy49yckoMqe/n5ppqHV9pOkMWk/5SQrpkCeer?=
 =?us-ascii?Q?k7tcglVPJtf+M7imSM9hYubg7UcVAml3gzZWEFLAhjMS1HQK0ukccZo5ImgU?=
 =?us-ascii?Q?nCS7WADAxqPP8EkBM6X3ES+D8ZKsNKR5EJPtNwyAS2t1O6Mdr3flzUNJ5PcL?=
 =?us-ascii?Q?HmypLI0KgmgT8loudj11Sz8o3ImjJmoXRF0VgpseyOPw3YrXkvL3CqqhPs65?=
 =?us-ascii?Q?U+Yog27EQiVP6kXbgyAgk20wENqHL2lODpQ7qMF+CduAAuYFUU49RqD1ex/z?=
 =?us-ascii?Q?s1evJuI4Uc2n0RvDG5KGuRSVB7p3URXE2epYTD+MnPrORjGlyjDykopYFtYP?=
 =?us-ascii?Q?nr6UnH5juk5LQc7JKGso33elEskk0Ua+OqUobiSA1oFkXJLBbj+pPo36df6i?=
 =?us-ascii?Q?XGjg+knUrJr6oalVP9R5vdOwGD/YqkciNo4HvgbQbz6RtyAmxYDMbYtehqK/?=
 =?us-ascii?Q?5LmAA5bQMnf99hvOUkKLaXz9uFMPLUDQ8YQ5HGOTHHyWOSaCrtrTPv5oE+L+?=
 =?us-ascii?Q?TK3JKnxFY81vklr3WLkDAto1P2hZHXcOWPvyKxl6nhx15DaSLNsyfTrTD5Hr?=
 =?us-ascii?Q?NQN+T9ZroJ1ulXDMvPZS0FdmhnfoG1Rcj95IwJOiWOzK0+RMvSUykAf8aCz4?=
 =?us-ascii?Q?PIRZpuOALPNAt1pnBMyk1VyZk51NMbY3W2Ah9qGojO9DVM/W76XVioSu85Vc?=
 =?us-ascii?Q?5uxPWUtCJzLIdsoiCG6MD14pKMtt9o9+wnDRbHXO2+E0gsMaK0hO8R4ORBFB?=
 =?us-ascii?Q?ugZEuR4TigO10okx0qhPNRiJU4eCMfmfBvzD0Lizk19j+1kSDvg1SestKbAd?=
 =?us-ascii?Q?q3sWN2WDgHoha8XH5DA+QVsYrJKGd1kK9rBUvJW+YSU8ioArpLWRq7nHzp2C?=
 =?us-ascii?Q?pNEjx2b8FSn6ioBCTLfh7LFaW6/szrpyTfNRPPsMWWNCBtFXMZRfU0GHqwiI?=
 =?us-ascii?Q?U15mzvscoemIrW09GbnPD3v+nRED0L8AIa5+UERpEJ4nIlmWkpXANFKRApbT?=
 =?us-ascii?Q?4O5qlLquG9F+fFWbmfhovWJYDsxueO1BtwZSOi9fk3xAeHOd620Mn9zY3p9z?=
 =?us-ascii?Q?ATet2UuF+yppZ/ycvevtg0cd0nnKzG5zdB+icAjFnPEiIQpcaQsyZlgXiHDw?=
 =?us-ascii?Q?me1p1kTUq5r8eKXaTawbMWkhulLdfO0cwKX3CKU4iwiAbr6TQxbWErTzyNsM?=
 =?us-ascii?Q?bT4HvxcFSWrrXLvgmY+rrJO1ablqVP+NRGPYKil+wKmVi5DA2Lk54tvbkGbY?=
 =?us-ascii?Q?s6DubFfzJUe+uVy6/EcNPtVL53DC293kxeAa4QE8KKDNVPPo7WycILzZRa1W?=
 =?us-ascii?Q?IwdBPptdidRl8z5ZgNUuWL/MxSpZmtF4JBtizsOWgrMJNNQbMGEy/0b3UGDQ?=
 =?us-ascii?Q?F1KpRQVF4cZInGBB6Mx+2gHv9f9UK43+hjeF7xjE59/MYsx2FzpR4LLYjsQG?=
 =?us-ascii?Q?OFA2EmMGKLruR7s4rwMO/w8zsjob0Ui4YjV6+YbCSJAN+4aPq2FlmwiBB82m?=
 =?us-ascii?Q?bi7gVvphANsAEqA6ETKcaw12KuvkMoeyAi/ihlxk55F2FkKiOh8Fjpjv5rLk?=
 =?us-ascii?Q?7eoMYCggBJRdjqgg9lAT462k3GndvoI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e2ca971-9138-430c-5b3d-08dee72e6abb
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:46:07.9361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hipPfP9ZJYrSqYYk128zer+kztowP+4nSi6uFr4kUwfXZI0RuJw0e2FXylvZRE5M0XIbVJnpcnrIyfNsRlCj4r/G40AQ47wKXEo3+aVb2dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241524

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
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  2 +
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
diff --git a/meta/recipes-devtools/perl/perl_5.42.0.bb b/meta/recipes-devto=
ols/perl/perl_5.42.0.bb
index 1a3451b747..8716f1f257 100644
--- a/meta/recipes-devtools/perl/perl_5.42.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.42.0.bb
@@ -19,6 +19,8 @@ SRC_URI =3D "https://www.cpan.org/src/5.0/perl-${PV}.tar.=
gz;name=3Dperl \
            file://CVE-2026-8376-01.patch \
            file://CVE-2026-8376-02.patch \
            file://CVE-2026-13221.patch \
+           file://CVE-2026-57432-01.patch \
+           file://CVE-2026-57432-02.patch \
            "
 SRC_URI:append:class-native =3D " \
            file://perl-configpm-switch.patch \

