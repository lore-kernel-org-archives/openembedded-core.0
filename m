Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2976EC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 14:09:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43203.1786111754560863909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 07:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yleDfdD8;
 spf=pass (domain: est.tech, ip: 52.101.65.5, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+KjcnYPHCAb3AE0T42sRWKSBIcZQ/7vspyRp2YNuAG6LCYJS6as3B6+wDV2u/r2i2LCsh5Ni6w0loiYcCjxJifMsXWeVT9ptGzn8Oxu4WcQj/VollY5c9KcgQOUd+shAYjDtgf2mFGfuUNZcbZCjybOtiZ5+SfO9WTIdPFLKKuWf76WO5W7hGw2AjtSyGp7qRORRE+vnFJCkKac/nTCDtOOtWqJP0sEMxi5Cmcay6KjpGv5dxDgFgZ+oq2e5FuUQsGhaXBZ8cSa+T8iB7W+Hbtj39mqmh232UZxGpvLxhSatHshqqT9uFCkKmqx8Pyw1iLFtaLN70eA6ewNNp4cRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJy8HCD9PzlbGGNEjBQn6VcfuIFBAjaelUmmIHR2tTE=;
 b=RFfbpt5uYUfjJVv1yBLa9Tzpq4gToV5Q65Giut5a812oAcHB9057rjde6I6gQzvxPMblxABlbEx6hAPAnuOATv23wSHPK8wojr1X7OXlUpBCEU9/kSCR63+gUD5IyV+eol9bqfnw3zJ/MjEnVQdeBIc+U7auS3ByzHQYbKR/BS0gepxnOvr2qc/TUE2ab70NjRhEmmja37c/A/qOFb6Bgskov9Cr4iuGFh8QhlTbVgKzabWudxnrFgMsow21F5L6mqfwEHCELe7fJC3JNTvIa5RKacqCy21Y6POehrixehAZN6VdTcmv9Mv8NQJ43CtuA/mXu01PP34flPo25yFHow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJy8HCD9PzlbGGNEjBQn6VcfuIFBAjaelUmmIHR2tTE=;
 b=yleDfdD8OuUaDtSEkr8DrDpW2RaRU1/juua5QizDssRWQchNpGZTJ7WhB2EckQREaLW9eYA+niiNqBaUqj0FhNIcgcjFcBmHTxzoEo5zek94bfbYChMIDsGIBRv1dcTgMSgTP8YVfQPxpVekSa6qjOmRBmO3rc++kpvhSsnHGIzIA5nm+pJnLk6oc3YUN6ocf1px58+9LoyjZX8QTlzT/bGHa5yXMzUMyxGmZhU7rRLue4Gbgvsyatxx/g8nZFD6uHV5Kada2LPW9J63dK0TUFdEIAlg1cvxkowlh8Pl8NEmO/lckI/6alDFH2y7XbAZxL0F3J+0NlyCzbSe8YvqyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS2P189MB2400.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:578::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.10; Fri, 7 Aug
 2026 14:09:09 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 14:09:09 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] binutils: Patch for CVE-2026-15003
Date: Fri,  7 Aug 2026 16:09:02 +0200
Message-ID: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0502.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS2P189MB2400:EE_
X-MS-Office365-Filtering-Correlation-Id: 0366481e-8979-41b9-ad70-08def48d7300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|13003099007|6133799003|10067099003|11063799006|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	Xxh/EbRRztr9x3feP94FM0doJUaBlA0fnLCA75Abge+n+Rna2yehtj/sfEYHiwZv+vl533nqjCLks6IAQ6g1dhaOiBX9J3kaiPiod88azdf8vfgplxoIwd+InB4TfBulZInzrfAR1M39iy5Q8zwkUTXa8jIklBV98NdzWm+Br8MEcFpLbVvQDoRFngjkf62lLye/FwwGJpCocfy4Q/6BeDGORYHbfESVvtw1In7ouiPypM1+xE8pwpri8ZbqsDC01QOCoffKp0URT5J2hG3gazeZqkojgmRxuOEgvPicU/1Arczxgo4ijaYlWFkkNt5ncbsOHg34wB8VJQEmt3aAx7HJ+qBKOcIXHJnOBFR0dCOVl+gBydtCEuRUtNcPXUqCDzxEXx3shYdtaRjCz02nImxgnLmK5MT/nXqeHFLdWcW8baFsHey86alyuUEkPl8j4uc9sb5vkf22cTBbtkYxRcQfSy1I/4Yy577UGjff01nnjvN826YmB9Icrl1jF6qjX0qC5oglpPKB1oQdFhmkucFN8JRlxXOoxRTKIkEWWUIdC7zCkG4pN3HW/kWtY8mu4y94VptbQ+A0LXm1oug69Ka7KS95C1ry3u6DHNFs3FSw0CMIv/ZyIuonfgWgpUcHTbRlfhYI0QKaAW7362hIYhOREgbFfiXQk/ZBmYGqRlA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1Q6YFc51BiOtSOuTbUITKo5HStQRkV2SWK8AF0PTf/7OFQ+JpVuZhFb+T3E4?=
 =?us-ascii?Q?p9B+siVH2MTOeyEJo3Z6+ztk2SNmuaSfRSAlMx7jCk9AHLJyq3+/lsMj5Z2L?=
 =?us-ascii?Q?wCS5BkyyMC7RaH8YerGiEKVOqPunWuXtgIn3GrGH2P0Ose8KbfhKKUspFq+P?=
 =?us-ascii?Q?FJwxjrgnL4qmUxXs3mMA35rnKA5yXbXjP8MZoiVtWihF45bQaXC6JPfy6CbR?=
 =?us-ascii?Q?59ssTmOHm0ASf/ebQhveehsYJXqCyFwhEN2MREIVRDBpNhOeiMRAWIoIRm9M?=
 =?us-ascii?Q?Q3Kio0Q1YRqbk3ioBHiyn8km8PtFK1xQG6qc1h6knY5lIcojQY6ccEhtZ851?=
 =?us-ascii?Q?9hr9Mm+kwMltVORFCKJuw9+NuJIoKhZqiUv/6alOtirSSg2dwbhFx5RfPCta?=
 =?us-ascii?Q?t7drQjYEwBe+4K2nGCYYmKviU1EQHuYgTqLMTav3WtYYqfTOQYbPSysxG/+g?=
 =?us-ascii?Q?2vCCRhNl1xVnj519Csf4gDuvZZH6TetcL8hHHk1qozjxioX+52DV9HwLBUiA?=
 =?us-ascii?Q?bGlbGGZDtcZv1kjfjQFNbyJSKcWfRof+KBCSe5CPtsZBzXyUSddmnke77PyO?=
 =?us-ascii?Q?/aV1ynZQZI1r7Dpp2WzkVZQjmMpoOLkfReZahEFgNHRfBdW1EYUuOWjmdXeY?=
 =?us-ascii?Q?hTSQERkJ6Vi9eEme/wVq1q16GbsEYqpDaf9Jo1Y6DgCtRhlTIcYMImyBAnUd?=
 =?us-ascii?Q?/TalpCIQvtDqhGhRDDnLIIvMNqOklgCUjPdPz6xeC6llUG+4LisjlcWplHVy?=
 =?us-ascii?Q?/K9dEtFabnqA9K6a5TwH1X68gyPQJUg/GdeDjac8MFsXf4oQRF5yl1imFCkm?=
 =?us-ascii?Q?tvo5YquO+hsT2ISfWIsGPS5Vb0pLZ8g5DfME6Y6fbcIPjBVfzuayhVqQ8Wok?=
 =?us-ascii?Q?89kN42r+NDIHNzNLVdy05hr9snqJRFdZ8Iqvc+Of8I8p9C+/3qgRlmWGCmPp?=
 =?us-ascii?Q?Js08OZwJFU96+wFfEMc/aHyM2+Ne65a+6QByGD9XBCk2T+TZeSwHLj/PyNUr?=
 =?us-ascii?Q?yynv3pE2mGcTB998AL2QK9O4hsmKhI91bckrVEjCF9LwjYVeXowi02Qj8vf6?=
 =?us-ascii?Q?JETIbawWbqMbB2VOuFcuaCZ9Pmw4kr7tXQY+WL8+Sg1PQa9Q8Y6IgSL/9goM?=
 =?us-ascii?Q?PrJhnLCsmNHgdVzQLuCxXgN7v6NoSI8E9UYbUXiL6mlO8SNDnRFnHZ1yqcTP?=
 =?us-ascii?Q?QH6T//35Bw0jRTyq7tY3YPNtNmNCtj0KIvgLZkNoYWT8rh9ixJiVsWp1uEUT?=
 =?us-ascii?Q?/DJa6NVyumUk87YN4GwjncSwSo/IkSxf1Xa/vcL/yuLVEsjabrzXSxmehKbV?=
 =?us-ascii?Q?01yp47I6LHSi7X9oczhUBu0zt4b7AOipm7OPQESXpPnW75RwehZYXimMYF8T?=
 =?us-ascii?Q?/8RjpxWXhvvlXqfQOHSZPgQ1ceYhOHp0nUgaXfqkddqFc3gQvm7Vf/qNR9vN?=
 =?us-ascii?Q?Y9yWKWPcfeTwMFH/GwstONLikDPI7TgsyYx3Nty7dbeuNu3xbQpcmvyAxlSs?=
 =?us-ascii?Q?psb8vI5bYF/mOUEf1pQi6DzEBw01Z271NbBqPCifnjdRqbyuyaJIVsK+J1+P?=
 =?us-ascii?Q?9Q/QI9/Ly7gUAc48RB5TaEbLWzs9xWqLhEJFSn2rw8v+laB/RwA7vTOi2AJG?=
 =?us-ascii?Q?NSm8ZelWF+RCXrAJpMMQ92KDMCXAymytwLN2Xht6/NDWn1xSjtpZN6E+lU/u?=
 =?us-ascii?Q?X1F1sn5sBiw2fRIdmZSxpK1vnO1YtBpHP+qAGYe2QTXkJUtnbnKQJA/iSctA?=
 =?us-ascii?Q?v44f3YZNsXJh46xdfek7YL2bPzMAQcA=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0366481e-8979-41b9-ad70-08def48d7300
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 14:09:09.1915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtQYYzWUEKTyTykah3fG3w90PC0vDnwBRdjrYP2/rXa/ZxeLVBS4PXEPhQEUkN67uZoZETAkFx/Ff8AQMmROujbJOTZ1GhwOV0q3qSYpJ5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 14:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243012

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-15003
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D23acf2f003f8=
1b2f8d9d1997ea45d822d33d386c

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.46.inc                |   1 +
 .../binutils/binutils/CVE-2026-15003.patch    | 402 ++++++++++++++++++
 2 files changed, 403 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index cab270cea5..177ae04ee3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -40,4 +40,5 @@ SRC_URI =3D "\
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://CVE-2026-4647.patch \
      file://CVE-2026-6846.patch \
+     file://CVE-2026-15003.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
new file mode 100644
index 0000000000..016b342c87
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
@@ -0,0 +1,402 @@
+From 8552afe151ef0513d4afe90f809408509ce77d20 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 9 Apr 2026 09:06:27 +0930
+Subject: [PATCH] PR 34053 buffer overflow in xcoff_link_add_symbols
+
+This patch adds two sanity checks with error reporting in
+xcoff_link_add_symbols before reading symbol aux entries, add extends
+assertions in later functions.  A whole lot of unnecessary casts are
+also tidied.
+
+	PR 34053
+	* xcofflink.c: Remove unnecessary casts throughout.
+	(xcoff_link_add_symbols): Sanity check aux entries are within
+	symbol buffer.
+	(bfd_xcoff_build_dynamic_sections): Assert the above is true.
+	(xcoff_link_input_bfd): Likewise.
+
+(cherry picked from commit 23acf2f003f81b2f8d9d1997ea45d822d33d386c)
+
+CVE: CVE-2026-15003
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D23acf2f003f81b2f8d9d1997ea45d822d33d386c]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 132 +++++++++++++++++++++++-------------------------
+ 1 file changed, 62 insertions(+), 70 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 691acc854ae..cb279b9db9d 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -371,7 +371,7 @@ _bfd_xcoff_canonicalize_dynamic_symtab (bfd *abfd, asy=
mbol **psyms)
+ 	{
+ 	  char *c;
+=20
+-	  c =3D bfd_alloc (abfd, (bfd_size_type) SYMNMLEN + 1);
++	  c =3D bfd_alloc (abfd, SYMNMLEN + 1);
+ 	  if (c =3D=3D NULL)
+ 	    return -1;
+ 	  memcpy (c, ldsym._l._l_name, SYMNMLEN);
+@@ -1038,7 +1038,7 @@ xcoff_link_add_dynamic_symbols (bfd *abfd, struct bf=
d_link_info *info)
+ 	    {
+ 	      char *dsnm;
+=20
+-	      dsnm =3D bfd_malloc ((bfd_size_type) strlen (name) + 2);
++	      dsnm =3D bfd_malloc (strlen (name) + 2);
+ 	      if (dsnm =3D=3D NULL)
+ 		return false;
+ 	      dsnm[0] =3D '.';
+@@ -1081,7 +1081,7 @@ xcoff_link_add_dynamic_symbols (bfd *abfd, struct bf=
d_link_info *info)
+   coff_section_data (abfd, lsec)->contents =3D NULL;
+=20
+   /* Record this file in the import files.  */
+-  n =3D bfd_alloc (abfd, (bfd_size_type) sizeof (struct xcoff_import_file=
));
++  n =3D bfd_alloc (abfd, sizeof (*n));
+   if (n =3D=3D NULL)
+     return false;
+   n->next =3D NULL;
+@@ -1464,7 +1464,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+       bfd_vma value;
+       struct xcoff_link_hash_entry *set_toc;
+=20
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+=20
+       /* In this pass we are only interested in symbols with csect
+ 	 information.  */
+@@ -1510,9 +1510,12 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_=
info *info)
+ 	{
+ 	  union internal_auxent auxlin;
+=20
+-	  bfd_coff_swap_aux_in (abfd, (void *) (esym + symesz),
++	  if (symesz >=3D (size_t) (esym_end - esym))
++	    goto badaux;
++
++	  bfd_coff_swap_aux_in (abfd, esym + symesz,
+ 				sym.n_type, sym.n_sclass,
+-				0, sym.n_numaux, (void *) &auxlin);
++				0, sym.n_numaux, &auxlin);
+=20
+ 	  if (auxlin.x_sym.x_fcnary.x_fcn.x_lnnoptr !=3D 0)
+ 	    {
+@@ -1539,7 +1542,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+=20
+ 		  linpstart =3D (reloc_info[enclosing->target_index].linenos
+ 			       + linoff);
+-		  bfd_coff_swap_lineno_in (abfd, (void *) linpstart, (void *) &lin);
++		  bfd_coff_swap_lineno_in (abfd, linpstart, &lin);
+ 		  if (lin.l_lnno =3D=3D 0
+ 		      && ((bfd_size_type) lin.l_addr.l_symndx
+ 			  =3D=3D ((esym
+@@ -1554,8 +1557,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+ 			   linp < linpend;
+ 			   linp +=3D linesz)
+ 			{
+-			  bfd_coff_swap_lineno_in (abfd, (void *) linp,
+-						   (void *) &lin);
++			  bfd_coff_swap_lineno_in (abfd, linp, &lin);
+ 			  if (lin.l_lnno =3D=3D 0)
+ 			    break;
+ 			}
+@@ -1576,21 +1578,21 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link=
_info *info)
+       visibility =3D sym.n_type & SYM_V_MASK;
+=20
+       /* Pick up the csect auxiliary information.  */
+-      if (sym.n_numaux =3D=3D 0)
++      if (sym.n_numaux < 1
++	  || sym.n_numaux * symesz >=3D (size_t) (esym_end - esym))
+ 	{
++	badaux:
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-	    (_("%pB: class %d symbol `%s' has no aux entries"),
++	    (_("%pB: class %d symbol '%s' has missing aux entries"),
+ 	     abfd, sym.n_sclass, name);
+ 	  bfd_set_error (bfd_error_bad_value);
+ 	  goto error_return;
+ 	}
+=20
+-      bfd_coff_swap_aux_in (abfd,
+-			    (void *) (esym + symesz * sym.n_numaux),
++      bfd_coff_swap_aux_in (abfd, esym + symesz * sym.n_numaux,
+ 			    sym.n_type, sym.n_sclass,
+-			    sym.n_numaux - 1, sym.n_numaux,
+-			    (void *) &aux);
++			    sym.n_numaux - 1, sym.n_numaux, &aux);
+=20
+       smtyp =3D SMTYP_SMTYP (aux.x_csect.x_smtyp);
+=20
+@@ -1713,7 +1715,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+=20
+ 		  erelsym =3D ((bfd_byte *) obj_coff_external_syms (abfd)
+ 			     + rel->r_symndx * symesz);
+-		  bfd_coff_swap_sym_in (abfd, (void *) erelsym, (void *) &relsym);
++		  bfd_coff_swap_sym_in (abfd, erelsym, &relsym);
+ 		  if (EXTERN_SYM_P (relsym.n_sclass))
+ 		    {
+ 		      const char *relname;
+@@ -2496,7 +2498,7 @@ xcoff_link_check_ar_symbols (bfd *abfd,
+     {
+       struct internal_syment sym;
+=20
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+       esym +=3D (sym.n_numaux + 1) * symesz;
+=20
+       if (EXTERN_SYM_P (sym.n_sclass) && sym.n_scnum !=3D N_UNDEF)
+@@ -3989,7 +3991,7 @@ bfd_xcoff_size_dynamic_sections (bfd *output_bfd,
+     return true;
+=20
+   xcoff_link_hash_traverse (xcoff_hash_table (info), xcoff_post_gc_symbol=
,
+-			    (void *) ldinfo);
++			    ldinfo);
+   if (ldinfo->failed)
+     goto error_return;
+=20
+@@ -4200,7 +4202,8 @@ bfd_xcoff_build_dynamic_sections (bfd *output_bfd,
+ 	  /* Read in the csect information, if any.  */
+ 	  if (CSECT_SYM_P (sym.n_sclass))
+ 	    {
+-	      BFD_ASSERT (sym.n_numaux > 0);
++	      BFD_ASSERT (sym.n_numaux > 0
++			  && symesz * sym.n_numaux < (size_t) (esymend - esym));
+ 	      bfd_coff_swap_aux_in (sub, esym + symesz * sym.n_numaux,
+ 				    sym.n_type, sym.n_sclass,
+ 				    sym.n_numaux - 1, sym.n_numaux, &aux);
+@@ -4291,7 +4294,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ {
+   struct bfd_in_memory *bim;
+=20
+-  bim =3D bfd_malloc ((bfd_size_type) sizeof (* bim));
++  bim =3D bfd_malloc (sizeof (*bim));
+   if (bim =3D=3D NULL)
+     return false;
+=20
+@@ -4300,7 +4303,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+=20
+   abfd->link.next =3D 0;
+   abfd->format =3D bfd_object;
+-  abfd->iostream =3D (void *) bim;
++  abfd->iostream =3D bim;
+   abfd->flags =3D BFD_IN_MEMORY;
+   abfd->iovec =3D &_bfd_memory_iovec;
+   abfd->direction =3D write_direction;
+@@ -4860,8 +4863,8 @@ bfd_xcoff_size_stubs (struct bfd_link_info *info)
+ 			}
+=20
+ 		      bfd_coff_swap_sym_in (input_bfd,
+-					    (void *) esyms + irel->r_symndx * symesz,
+-					    (void *) &sym);
++					    esyms + irel->r_symndx * symesz,
++					    &sym);
+=20
+ 		      sym_sec =3D xcoff_data (input_bfd)->csects[irel->r_symndx];
+ 		      sym_value =3D sym.n_value - sym_sec->vma;
+@@ -5234,17 +5237,16 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
 *flinfo,
+       int smtyp =3D 0;
+       int add;
+=20
+-      bfd_coff_swap_sym_in (input_bfd, (void *) esym, (void *) isymp);
++      bfd_coff_swap_sym_in (input_bfd, esym, isymp);
+=20
+       /* Read in the csect information, if any.  */
+       if (CSECT_SYM_P (isymp->n_sclass))
+ 	{
+-	  BFD_ASSERT (isymp->n_numaux > 0);
+-	  bfd_coff_swap_aux_in (input_bfd,
+-				(void *) (esym + isymesz * isymp->n_numaux),
++	  BFD_ASSERT (isymp->n_numaux > 0
++		      && isymesz * isymp->n_numaux < (size_t) (esym_end - esym));
++	  bfd_coff_swap_aux_in (input_bfd, esym + isymesz * isymp->n_numaux,
+ 				isymp->n_type, isymp->n_sclass,
+-				isymp->n_numaux - 1, isymp->n_numaux,
+-				(void *) &aux);
++				isymp->n_numaux - 1, isymp->n_numaux, &aux);
+=20
+ 	  smtyp =3D SMTYP_SMTYP (aux.x_csect.x_smtyp);
+ 	}
+@@ -5459,12 +5461,10 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
 *flinfo,
+ 		  if ((bfd_size_type) flinfo->last_file_index >=3D syment_base)
+ 		    {
+ 		      /* The last C_FILE symbol is in this input file.  */
+-		      bfd_coff_swap_sym_out (output_bfd,
+-					     (void *) &flinfo->last_file,
+-					     (void *) (flinfo->outsyms
+-						    + ((flinfo->last_file_index
+-							- syment_base)
+-						       * osymesz)));
++		      bfd_coff_swap_sym_out
++			(output_bfd, &flinfo->last_file,
++			 flinfo->outsyms + (flinfo->last_file_index
++					    - syment_base) * osymesz);
+ 		    }
+ 		  else
+ 		    {
+@@ -5473,9 +5473,8 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
flinfo,
+ 			 borrow *outsym temporarily.  */
+ 		      file_ptr pos;
+=20
+-		      bfd_coff_swap_sym_out (output_bfd,
+-					     (void *) &flinfo->last_file,
+-					     (void *) outsym);
++		      bfd_coff_swap_sym_out (output_bfd, &flinfo->last_file,
++					     outsym);
+=20
+ 		      pos =3D obj_sym_filepos (output_bfd);
+ 		      pos +=3D flinfo->last_file_index * osymesz;
+@@ -5541,7 +5540,7 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
flinfo,
+ 	    }
+=20
+ 	  /* Output the symbol.  */
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+=20
+ 	  esym +=3D isymesz;
+ 	  outsym +=3D osymesz;
+@@ -5550,9 +5549,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
flinfo,
+ 	    {
+ 	      union internal_auxent aux;
+=20
+-	      bfd_coff_swap_aux_in (input_bfd, (void *) esym, isymp->n_type,
+-				    isymp->n_sclass, i, isymp->n_numaux,
+-				    (void *) &aux);
++	      bfd_coff_swap_aux_in (input_bfd, esym,
++				    isymp->n_type, isymp->n_sclass, i,
++				    isymp->n_numaux, &aux);
+=20
+ 	      if (isymp->n_sclass =3D=3D C_FILE)
+ 		{
+@@ -5780,9 +5779,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
flinfo,
+ 		    }
+ 		}
+=20
+-	      bfd_coff_swap_aux_out (output_bfd, (void *) &aux, isymp->n_type,
++	      bfd_coff_swap_aux_out (output_bfd, &aux, isymp->n_type,
+ 				     isymp->n_sclass, i, isymp->n_numaux,
+-				     (void *) outsym);
++				     outsym);
+ 	      outsym +=3D osymesz;
+ 	      esym +=3D isymesz;
+ 	    }
+@@ -5804,10 +5803,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info =
*flinfo,
+       && (bfd_size_type) flinfo->last_file_index >=3D syment_base)
+     {
+       flinfo->last_file.n_value =3D output_index;
+-      bfd_coff_swap_sym_out (output_bfd, (void *) &flinfo->last_file,
+-			     (void *) (flinfo->outsyms
+-				    + ((flinfo->last_file_index - syment_base)
+-				       * osymesz)));
++      bfd_coff_swap_sym_out (output_bfd, &flinfo->last_file,
++			     flinfo->outsyms + (flinfo->last_file_index
++						- syment_base) * osymesz);
+     }
+=20
+   /* Write the modified symbols to the output file.  */
+@@ -6020,16 +6018,13 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
 *flinfo,
+ 			      void * auxptr;
+ 			      union internal_auxent aux;
+=20
+-			      auxptr =3D ((void *)
+-					(((bfd_byte *)
+-					  obj_coff_external_syms (input_bfd))
+-					 + ((r_symndx + is->n_numaux)
+-					    * isymesz)));
++			      auxptr =3D ((bfd_byte *)
++					obj_coff_external_syms (input_bfd)
++					+ (r_symndx + is->n_numaux) * isymesz);
+ 			      bfd_coff_swap_aux_in (input_bfd, auxptr,
+ 						    is->n_type, is->n_sclass,
+ 						    is->n_numaux - 1,
+-						    is->n_numaux,
+-						    (void *) &aux);
++						    is->n_numaux, &aux);
+ 			      if (SMTYP_SMTYP (aux.x_csect.x_smtyp) =3D=3D XTY_SD
+ 				  && aux.x_csect.x_smclas =3D=3D XMC_TC0)
+ 				indx =3D flinfo->toc_symindx;
+@@ -6548,12 +6543,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
bh, void * inf)
+ 	  irsym.n_type =3D T_NULL;
+ 	  irsym.n_numaux =3D 1;
+=20
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &irsym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &irsym, outsym);
+ 	  outsym +=3D bfd_coff_symesz (output_bfd);
+=20
+ 	  /* Note : iraux is initialized above.  */
+-	  bfd_coff_swap_aux_out (output_bfd, (void *) &iraux, T_NULL, C_HIDEXT,
+-				 0, 1, (void *) outsym);
++	  bfd_coff_swap_aux_out (output_bfd, &iraux, T_NULL, C_HIDEXT,
++				 0, 1, outsym);
+ 	  outsym +=3D bfd_coff_auxesz (output_bfd);
+=20
+ 	  if (h->indx >=3D 0)
+@@ -6791,12 +6786,11 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
bh, void * inf)
+   isym.n_type =3D T_NULL;
+   isym.n_numaux =3D 1;
+=20
+-  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+   outsym +=3D bfd_coff_symesz (output_bfd);
+=20
+   aux.x_csect.x_smclas =3D h->smclas;
+-  bfd_coff_swap_aux_out (output_bfd, (void *) &aux, T_NULL, isym.n_sclass=
, 0, 1,
+-			 (void *) outsym);
++  bfd_coff_swap_aux_out (output_bfd, &aux, T_NULL, isym.n_sclass, 0, 1, o=
utsym);
+   outsym +=3D bfd_coff_auxesz (output_bfd);
+=20
+   if ((h->root.type =3D=3D bfd_link_hash_defined
+@@ -6811,13 +6805,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
bh, void * inf)
+ 	isym.n_sclass =3D C_WEAKEXT;
+       else
+ 	isym.n_sclass =3D C_EXT;
+-      bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym)=
;
++      bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+       outsym +=3D bfd_coff_symesz (output_bfd);
+=20
+       aux.x_csect.x_smtyp =3D XTY_LD;
+       aux.x_csect.x_scnlen.u64 =3D obj_raw_syment_count (output_bfd);
+-      bfd_coff_swap_aux_out (output_bfd, (void *) &aux, T_NULL, C_EXT, 0,=
 1,
+-			     (void *) outsym);
++      bfd_coff_swap_aux_out (output_bfd, &aux, T_NULL, C_EXT, 0, 1, outsy=
m);
+       outsym +=3D bfd_coff_auxesz (output_bfd);
+     }
+=20
+@@ -6913,8 +6906,8 @@ xcoff_reloc_link_order (bfd *output_bfd,
+ 	     howto->name, addend, NULL, NULL, (bfd_vma) 0);
+ 	  break;
+ 	}
+-      ok =3D bfd_set_section_contents (output_bfd, output_section, (void =
*) buf,
+-				     (file_ptr) link_order->offset, size);
++      ok =3D bfd_set_section_contents (output_bfd, output_section, buf,
++				     link_order->offset, size);
+       free (buf);
+       if (! ok)
+ 	return false;
+@@ -7379,8 +7372,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
k_info *info)
+   if (flinfo.last_file_index !=3D -1)
+     {
+       flinfo.last_file.n_value =3D -(bfd_vma) 1;
+-      bfd_coff_swap_sym_out (abfd, (void *) &flinfo.last_file,
+-			     (void *) flinfo.outsyms);
++      bfd_coff_swap_sym_out (abfd, &flinfo.last_file, flinfo.outsyms);
+       pos =3D obj_sym_filepos (abfd) + flinfo.last_file_index * symesz;
+       if (bfd_seek (abfd, pos, SEEK_SET) !=3D 0
+ 	  || bfd_write (flinfo.outsyms, symesz, abfd) !=3D symesz)
+@@ -7464,7 +7456,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
k_info *info)
+ 	 appear in the symbol table, which is not necessarily by
+ 	 address.  So we sort them here.  There may be a better way to
+ 	 do this.  */
+-      qsort ((void *) flinfo.section_info[o->target_index].relocs,
++      qsort (flinfo.section_info[o->target_index].relocs,
+ 	     o->reloc_count, sizeof (struct internal_reloc),
+ 	     xcoff_sort_relocs);
+=20
+@@ -7472,7 +7464,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
k_info *info)
+       irelend =3D irel + o->reloc_count;
+       erel =3D external_relocs;
+       for (; irel < irelend; irel++, rel_hash++, erel +=3D relsz)
+-	bfd_coff_swap_reloc_out (abfd, (void *) irel, (void *) erel);
++	bfd_coff_swap_reloc_out (abfd, irel, erel);
+=20
+       rel_size =3D relsz * o->reloc_count;
+       if (bfd_seek (abfd, o->rel_filepos, SEEK_SET) !=3D 0

