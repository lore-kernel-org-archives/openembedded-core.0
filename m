Return-Path: <leonid.iziumtsev@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200B4C5516D
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:36 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5097.1785499529067564452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 05:05:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=z3ZIzMHR;
 spf=pass (domain: est.tech, ip: 40.107.162.12, mailfrom: leonid.iziumtsev@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5N7yG19PX9pNjhr8d0wIELa2gXnmr4tgwIjLQur3SCx6E97aZ/g+RnTSI2teERREAMEzpS0fi/NYi7RY95l+SeLlvs6cx6iB4xVI37c366YO/6D+Ktn/1cgAoLnlXAfS6E0Z3eRo2VNESlDhV7hIrkyDK9Ly+/2ds9tUVbDN/pwT/s2aEm0/MHRQsvlap+bO8HMRuuGxS5gs7/zpVen9d97853sIf/QOK3KO3VL3nJBJzlkBlIgpzbFXjM2+rZTUxfxgaR3mnuAfJ+w1+x1OxNA8bY9uCKgPY5PrI5tLxRDF2DQ7ctdR339IHpEObTWzbpOyIvpglcsAiIfTrovlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJo0lQfN/mCWrscHXzU3Mj9yUKegtoFqIHVxX8xk9vY=;
 b=JjHWJXUjcUY3vUBmzqSdfhhT0WZcDvP3RzG2F+yz64KFRK+VkHnTbVePpwOco7uAf+upBvfLKsczNohBDb6+W6g6OIWNmAEROP/v9wT2W7xarG8sXCNIH/etwLAwsgxmEWKAwckU12/ZghenpN9l9tYTKdsGa8aXWA7FXMvNtRcDtPFGJGyk3Qozq/QyR9OpBy4nu+68MTyCDj6ivf7svkOms7J2ltXTYL86wTc0+lsFRukN7amvOd4UsdpIorV0lsIPyXVaSHCJWVmybMSrHTp9H+XWTC8FqFtMtt26QvtaqpaEHkgtMg5bATtPist9H9lg786RnDJZmJJ3fWvCtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJo0lQfN/mCWrscHXzU3Mj9yUKegtoFqIHVxX8xk9vY=;
 b=z3ZIzMHRbDTQaX1meCX0n7oOhZNVFqJRYdTCptmQuSM6udIATFj72uWxedLrFRyaOfL9PNdqFVjvBMlMugQMEcDIQ/HrUZC558IO85aEdrpmAZAhAwTsIS5UldDHms8jNjCPEHguycyRAKFcnPAOFTGL/MqB3jDlwqM70aOgf6gWadP1WZCjR6cnitv3eqMrPlfLPYHujp3C8DSmURgU+WnvojwL7H+sCFUzOSME9HzNXm/MZTd1OnO/0ZLyJefxBmpU1kA/iBfkRaXMEtaNtFm0CLilewWmdRhW8Vldten5ba6mDxtrrHZePKtvu1srHKH64hfbhUvl0xT3IYQQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:2ff::18)
 by GV1P189MB2081.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:54::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.10; Fri, 31 Jul
 2026 12:05:21 +0000
Received: from AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f]) by AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 ([fe80::a809:5156:7172:6c1f%4]) with mapi id 15.21.0292.010; Fri, 31 Jul 2026
 12:05:21 +0000
From: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
Subject: [OE-core][wrynose][PATCH] coreutils: fix CVE-2026-56391
Date: Fri, 31 Jul 2026 14:04:09 +0200
Message-ID: <20260731120411.1402788-1-leonid.iziumtsev@est.tech>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB9PR05CA0014.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::19) To AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:2ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P189MB1731:EE_|GV1P189MB2081:EE_
X-MS-Office365-Filtering-Correlation-Id: f7adcfed-0eb1-4573-2b90-08deeefbfee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|13003099007|6133799003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	sXiqUibljnZAGrE4bTgAh4SNAqqrDIGddbEaGRwJ9rE2dbNBlnPzvDA4yD8kneOUbw1jBv7BNS8toAskEB3abDpt0d2lU06QGiPq+fc2swFdbkD8LbimpL8/4+k4rwNfm/w7eLq1JCEBeYjOQjaRQBwPgUPgWXiGA6IQeyEIoC+hrwkraxnKx9e/ydA3jC1vWzf2v904pOt3WbsF3sS6D8nIela4PxGkKoTfhEQCQGEw2IxqoZh1d2mVCXljDlCa0c4YLtePkj1zsDCdcmNsA3PlnrcBBbRPGO3yWYQZCzjInAAq+KBJuyI4W+GbGeCw215idyhNo4hvsRZwRqEZVWacGoxPcq1mf0swM0lWvA58G5StPfuNputgDvwsL/3BhfTGdiJ7ur/aESjQ98nZBF6l4LGdCRaC8AtMi6tdenss+6JuwuyEhyDWfYXL3v9htgFB02Sd4IPDHJheL8lOTtbCdB9Qqu+iAbzMY4xfn5u4G8yi6xaArnh96slBfAJnp3W7NxMaHI2r79LrsGYL1rrV5c1nFHvT9mfgrHSAfU8nAWjV1jStCu7YvHBZNR/OraSHADIQjVq7spdbWm6GwOf0wV7q+0lgRNx9FNY7zX07YOOYr702DZ4OkOmogZxnizDtGK6jYu/QrElcVDfLwk0zCNRNzBNHAlSbXta2E8M=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P189MB1731.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(13003099007)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zS4RhZ2FyLLgcCkX2xuEYG88UpJ3CzbsEtOLqVHchmIOCgTwrojjIXh7Z+iE?=
 =?us-ascii?Q?cggnCsY9O8b3PXxX/grgp8+ZJtedOMw7jeumped5q87g4KvjRf29WRpjcR7F?=
 =?us-ascii?Q?Xhy1NMFt2hRPwVNhXUhCLHst0AFdBDftbgAk3McfP/rENvTlZ2/vy/vi+ptp?=
 =?us-ascii?Q?aX30xkSoxydUrWsutepzytvmMMdoc53oUQ5v47jV7mk/3ueVIlxjXuESsONL?=
 =?us-ascii?Q?JIp+QJJIO0anygxyHuMLaA79E0zrF54EbTz+mncjeAva0ys4xpwxEib14rKb?=
 =?us-ascii?Q?nHKCMmnrDnUnjQxTkiw78Ule5VjEjR7BhXk3DhCpTf0ASl4vbZPdzkOEPUAb?=
 =?us-ascii?Q?SQ7ocnXKAqAJLS+0fb1NbBmO5onI6O6G7wgh98WvNNGixQnYSTlXJ9w+2v70?=
 =?us-ascii?Q?7vx8mDZvpKzXuLfx1ommXal2YEg+aHJbIeg8M1UTkZOVV4xgBQ2vAEtXHpjj?=
 =?us-ascii?Q?8WrXHnAaCzlwLTWpNRikZX85Hji9iozb1K3atmdIlxc9mfKwKjCcG9JyTegM?=
 =?us-ascii?Q?PML+qskoBpnWnbA1mQCI34GJrjgi1RFR/N3TVgNOPulp5fgTx31P5+Pf/ElF?=
 =?us-ascii?Q?Hha5NyP5HVX7N7U40EA5hGsSxItjMS7FK4lMm1xOrCr4fvb/w/AE3KE59WVZ?=
 =?us-ascii?Q?u4E/9jOeqMESL4ap2WlB/GjcsHZ8Ibzx0Go/BkkSqCdmOxW/4hWburJ7aFcx?=
 =?us-ascii?Q?ugOIkH98aqkXX6OAhSQ3ywXerGUCzSNxlXY+gGC2SoM6B6Mdji/U0IO+xl1t?=
 =?us-ascii?Q?BDp/VwKfV+yROG1q/oDet+lVCSdMAPbUXDl/H5NVpWVd1JazzzmHORtkxtqw?=
 =?us-ascii?Q?mBByVPFsl4cgkMGo2yeNhJlc8/Yc22DNcCGTk5QaweWDG5rhOAzY7G67n58U?=
 =?us-ascii?Q?7WtPDf2J7KejE4NEWYWrxqg1ZDNR5l64Pg8/cAkKNeZzUk6CDU/gGOGVl++e?=
 =?us-ascii?Q?EF0+RllBB/+42zjjiltCz5lSyLWrMqbmpKrqXC/9CypmrZotFIsmNqNbevvD?=
 =?us-ascii?Q?Kg5SpOXJXVwKSF7BV47vz1Zw2hyCY/+UUxYXDkWWTJ9FqeGX/fnVOEqR9jaV?=
 =?us-ascii?Q?qaMl+Nq2dcWn1fCsnaRMtn+i9dwTIh5pl16Fm2WqSjBHXFwLQN4FLpdV/FQg?=
 =?us-ascii?Q?slLgK1eZDiGtqQjysanTOHaJD3xSX8JgIe81k28NaRBbqPOjpBXe/r8037p1?=
 =?us-ascii?Q?t4gjd7WGxT0CK+/3xp3GVlzJ+Iw36vUEvOzEE1l37n93pMlUKV0DVqdPdcsd?=
 =?us-ascii?Q?PwSkP3mhgB+0ZU1dR7zPGBA0ZF9TwX6EBXPPRE6M02Si83oN5cGbIR9+BtYS?=
 =?us-ascii?Q?ygKxnEiRu+fF1+kMdxXS+wbj2KkIHowBWKRR6HbVzfzYZK3GOC6d7b9hgYSr?=
 =?us-ascii?Q?dP1S89s9LbDEQhKXK9CPVIGG+Lvz5RCcHezq2KwZMGKTmajzTq67B+/9zABp?=
 =?us-ascii?Q?YMvdmK9rxPrOEGC/+vK38GcAp56gigG0xeqbJyYQvRwIz3dwfBZ6r5NCrclJ?=
 =?us-ascii?Q?8fgAEHXZgLux3ANntC4D/4OWH6dz+n0DS+stGtJg4EfSB5Cj6gLs1W0OsI97?=
 =?us-ascii?Q?zVYHOTgGmjfvf7ciPqKai0Z+u+g5o3OjxNryqkd1ely22FjlsApNkeA+PC4d?=
 =?us-ascii?Q?bNIVBFWAprY0mmG4EVEFqai1MXFYcIfbdb+c/RW/1qhq+Af2DTQmy616P9ZJ?=
 =?us-ascii?Q?MKg9L9cf+woARLmKZRJGK6XbehH/xsqbdvsrrEpRyHa0yQwulcmEIMsYOfol?=
 =?us-ascii?Q?fKzLOReX3Z67xDr9pnPcQFwoPg2A9EgbSqmO2pToVNlkwTz3rb5RO2Ilh86X?=
X-MS-Exchange-AntiSpam-MessageData-1: Qr00SkvafwXOT5pyf9ylWSB+R1ePpb+x0aM=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f7adcfed-0eb1-4573-2b90-08deeefbfee8
X-MS-Exchange-CrossTenant-AuthSource: AM9P189MB1731.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 12:05:21.5509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vlTGRhoM/KTpOXDndc03gjF+yI7b58UXfAwZAInWBWhirmfpIP/ZttZaVSdyZsp7YNOmV352OZaWBWphM7NtbBh6+EUMyzRvKc0ztCGsdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 12:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242434

Backport patch to fix CVE-2026-56391.

Reference:
  https://nvd.nist.gov/vuln/detail/CVE-2026-56391

Upstream fix:
  https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=3Dd64e35a=
8a4c0e4608321433e0d84d917e4e36371

Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
---
 .../coreutils/coreutils/CVE-2026-56391.patch  | 66 +++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.10.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2026-56391.pa=
tch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch b/m=
eta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
new file mode 100644
index 0000000000..85745bf572
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2026-56391.patch
@@ -0,0 +1,66 @@
+From dadd37b60ca43b436a2287d28d6497bcc5bf4b9a Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Tue, 28 Apr 2026 11:25:00 -0700
+Subject: [PATCH] uniq: fix read overrun with -w
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Micha=C5=82 Majchrowicz.
+* src/uniq.c (find_field): Fix typo.
+* tests/uniq/uniq.pl (add_z_variants): Test for the bug.
+
+CVE: CVE-2026-56391
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutil=
s.git/commit/?id=3Dd64e35a8a4c0e4608321433e0d84d917e4e36371]
+
+Backport Changes:
+- The NEWS file has not been updated.
+
+Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
+---
+ THANKS.in          | 1 +
+ src/uniq.c         | 4 ++--
+ tests/uniq/uniq.pl | 3 +++
+ 3 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/THANKS.in b/THANKS.in
+index 35fee75..5a2fd35 100644
+--- a/THANKS.in
++++ b/THANKS.in
+@@ -459,6 +459,7 @@ Michail Litvak                      mci@owl.openwall.c=
om
+ Michal Politowski                   mpol@charybda.icm.edu.pl
+ Michal Svec                         msvec@suse.cz
+ Michal Trunecka                     mtruneck@redhat.com
++Micha=C5=82 Majchrowicz                  mmajchrowicz@afine.com
+ Michel Robitaille                   robitail@IRO.UMontreal.CA
+ Michiel Bacchiani                   bacchian@raven.bu.edu
+ Mike Castle                         dalgoda@ix.netcom.com
+diff --git a/src/uniq.c b/src/uniq.c
+index 3046359..5834596 100644
+--- a/src/uniq.c
++++ b/src/uniq.c
+@@ -285,8 +285,8 @@ find_field (struct linebuffer const *line, idx_t *plen=
)
+   else
+     {
+       char *ep =3D lp;
+-      for (idx_t i =3D check_chars; 0 < i && lp < lim; i--)
+-        ep +=3D mcel_scan (lp, lim).len;
++      for (idx_t i =3D check_chars; 0 < i && ep < lim; i--)
++        ep +=3D mcel_scan (ep, lim).len;
+       len =3D ep - lp;
+     }
+=20
+diff --git a/tests/uniq/uniq.pl b/tests/uniq/uniq.pl
+index b558fb3..0df7ec6 100755
+--- a/tests/uniq/uniq.pl
++++ b/tests/uniq/uniq.pl
+@@ -234,6 +234,9 @@ my @Tests =3D
+         "  - 'separate'\n" .
+         "  - 'both'\n" .
+         "Try '$prog --help' for more information.\n"}],
++ # Test for read buffer overrun.
++ do { my $longline =3D "\360\237\230\200" . "A" x 255 . "\n";
++      ['146', '-w256', {IN  =3D> $longline x 2}, {OUT =3D> $longline}] },
+ );
+=20
+ # Locale related tests
diff --git a/meta/recipes-core/coreutils/coreutils_9.10.bb b/meta/recipes-c=
ore/coreutils/coreutils_9.10.bb
index 8109244f44..abee8df192 100644
--- a/meta/recipes-core/coreutils/coreutils_9.10.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.10.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo
 SRC_URI =3D "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://run-ptest \
+           file://CVE-2026-56391.patch \
            "
 SRC_URI[sha256sum] =3D "16535a9adf0b10037364e2d612aad3d9f4eca3a344949ced74=
d12faf4bd51d25"
=20

