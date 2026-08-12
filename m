Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D665EC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 08:56:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3788.1786525002934325218
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 01:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=JimZVekv;
 spf=pass (domain: est.tech, ip: 52.101.72.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thaz/dBiFuwB162J6+y9zKmRLtuGW4RgZp0+mM8vxzXPHS1ieeDDlLRfCtH4/nz6bYf0rliqbwn8GXJb2+HxJYrzI+iBQ5lEnwnU7bxDHSig/F8m4nCqmqF65JBC/Kn4VpmMw9lKU4V+hVY/idb6grzDYkeIKosHN+WeeGv8hrwyTxf3wiwzG6HEUcUU1g/i7DvS/1gvehUW1iRDM9vZlkdF3jfZaCGLfmuSkA0gEwvWgWEBTWhVKDewHbKSu602OV38UtMGsjmfKKne7k/5DRhjdjfPDGtrubNiB+F0FWJNyX/s93aEbPRLt1K0KOW/n2sElAV7USzuIQff1/KdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mj2ctnnPDjMCft8vx3U/Qms6TDalxLkrQNwRuYW79gM=;
 b=Ybf8sk4j2qLXNU/4uJTpZR29mEiiTRF13IAcMV9dZuWpkdWiNOG6UDAt1riG5O9iR8oY5Ix5qR0kM3mbgdWgs3kavwEby7FCpYb9ecKo97DK+y7I/OZfEK0fPq38zxVKlcCF3dFSZw58BIQzUbc9nP6xyNRtnQzYXdgqNAAkQO8tFiTp+ZX7a6yjRkEV43Spf1xSzc26Sfq4Jf/4axkXUvO0OPMvgxAmLFDCKrXKq2jKyiaEwYRY0nv6Djtc6hXyvPe/zgjY0DdNXh7gFOv3mVaU3k+fUMWcsL6lm8jvbaGqKkeoKLJK3LZUM4S2keKd+YQYdCKOiKzcdTUuRlM2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mj2ctnnPDjMCft8vx3U/Qms6TDalxLkrQNwRuYW79gM=;
 b=JimZVekvQU7P35kv9tbpS3NaIBs8CONgRJJERbkzWPK5xoAXRDce2/2DrxioCgO8pMDqext+zRMe3uOpd+9V3mNEFUay+9n21tq+r/XebdKNPJz+WEVE4sHptEeKPRdNcyTOw280r9LR+Q5HiwTM5OSlwlp6QHr0mcmYX3Y9WNOQ+TekZ9GXOb8+n28UGok5a6ajtWaWBsBXXgcc6lL/4cE0Sb/aGnAX7pYJGj2vZgOFrGDUjTLCFh7a04Uf2G6YUEt6XQAnOTpnqB8rqIgo0J/LY4kE8tPg++mQQxWzd14TbVeHJlaTbBcMxjhvU/GdtBC6zrXK4N/6ef5KKb87yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB2475.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 08:56:41 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 08:56:41 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 1/2] binutils: Patch for CVE-2026-15003
Date: Wed, 12 Aug 2026 10:56:32 +0200
Message-ID: <20260812085633.22846-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812085633.22846-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
 <20260812085633.22846-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0228.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::23) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB2475:EE_
X-MS-Office365-Filtering-Correlation-Id: 5059cb36-1f6b-4d30-91f5-08def84fa05b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|22082099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	R3yDqL11Ov4TfLN0VKPo+kCQjIWN42gsrWLb31nWSWGE++eEy5MLejPAy9EkAdyIs3EJ4Gm80ZS4YyBy3F7n6b5fEZoZzGsKDGd0GwpJXUGATYauovY/g5FqT2cE6WKgF+rz5Z+SmWFd9VXCIJi2QadsFlSYMhabdwcsCV56FSBoZ6TKWi+yxiqurixn636yLAMuaDY4I7vnT9ekGmPvlUN4By5ndsP014Aj2krREXXcs7iCdXZI7xMVgn8IBYW+tDhepJyRzp7vAzPZU/2kHDqaoRmX++Rm7+LEHvK2w9yA7VV1mebGQ8pSJuy4YwC/7yEGUPInN57ufsr/F0+4y27yANXP1Gg5IwP1I3T9mOZTUDSAPmu2WbXyPDdvAVkDtDtMtsywF+XDi2lS4ZaWb5AVs03F5gIYR77eELbssxj1D7DUCdsYGiYRrVyLFUIWqU+bSc5m9jL2xBNSdFkezx8qfIO9woxvLn7CErqqI2iBE6L2XWKObwtIvVDRHr2NcpiSW5zPAdNbNMXH5tuWr2yVV0OybZGqq+DPy5PsA0qA1K29oJQZEzmXUPfx8kzX6cW5RLPfWUug/h62dNQoyhJXOOXnY3XkQs+m20FkmDn1q6bfqMbbsWeC/MlR6zem
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aqZTh9k0+a3Sf93hR9fQHOkWgoysX40v/SRd78jw7rJAHT3vU5SOhxBm3CUV?=
 =?us-ascii?Q?nmrZ2I4M/Rya0SEFPVMxbOdTtIZtL2lyRYzY/wQtHr/EEquwQSRv2kOO6pNg?=
 =?us-ascii?Q?fQbSGRAl9RZy8PTsEWByqB3S7tNs13wt9R7poSIgyF9qU78RbnwvFDeojSHO?=
 =?us-ascii?Q?hKuzwiM1wAR+gk+PLGYz/OJeiZkvJU+tL1Xb735M9j2wwpL4Y0SKroVCuwon?=
 =?us-ascii?Q?Y8+Uy6GIQGdaRn/D1SRKuxRCd4Z8WKLGXgedKGBKqWZOosFa7tq6Bjn685M/?=
 =?us-ascii?Q?ZSb6x/5XTE//LoXuXMm/PwTyl0dofFZyHN9spqtnCaZAtzs6IiNJtE5r3zqk?=
 =?us-ascii?Q?Jo3TzjdbxZtnERaaI3vLO6vdLwskSvlK6zedJObGD5VaC0f8/SnI66VhjnZ9?=
 =?us-ascii?Q?BZvpQrDzVAd8Yw1aykXs8hECbPyaq9iwjoiFVA77YeLsjcHGYgLiCR1jOqkI?=
 =?us-ascii?Q?0WT/ZKz2Xc4lQADrgl0qNjd5imUMBNbq1uszEvklAeaX6W4qpku8P+6tEtbx?=
 =?us-ascii?Q?PhYhl/Np3ucShOWrs9b0ScLoaGG4C242YpJ3fiG62Vg66Sak9ILZiivCByOs?=
 =?us-ascii?Q?Mnr3fK/vr9znBK1UEjr+tXBNzhntoxs30k34wVx2y3dW31FfyrQovljwQ3AI?=
 =?us-ascii?Q?y8DZ2RmcDRJOvT2G5c5tCMJIOASwQLA8wQyS46ZflYfcXWxlmVF3G0GQZIxt?=
 =?us-ascii?Q?ypOMn1XSYxtWCI4fif0Zk+HWm4jJFoMtIWmaqd8eDnVVgK6UjtmNBlakurRw?=
 =?us-ascii?Q?d+0wplVjXRSqpw9CYALIHW2mr2H8tKMPpd9Rj0jNsXeOPQmaliKVrcwdlTzo?=
 =?us-ascii?Q?IyGd1vLdDhjaoa+QFlZUiV6AQlFSB/5aT0TDyH5z4YmMpv10BJu24YdfL2oT?=
 =?us-ascii?Q?49R8NRmYNJiX1Gba3F8gUAV5XGy/uC8bkeqTgqZLZULiSpVLaELN0VjrwChF?=
 =?us-ascii?Q?vERUU6kC0w1PCPH5RZvAVz31fYf9sLDgMs28C4novKYQ1EdmSJxLMeO4kHHV?=
 =?us-ascii?Q?2SK3bDS++Y5Fy+TDMcFC4uX090p6w1iZ6LR+omQK/2QYYNgVZ58dwmdebR57?=
 =?us-ascii?Q?YJkOgoXdulmmiWl6QvZw/7lfBnb8wT51Lb4DWIuw9+Js6kt9uZI8f+xyiItP?=
 =?us-ascii?Q?b1ajeaXK1eQkE01FJRoqnROmm1rE5aVKUDx1bqHW7tFDU7YVOKiSOHq0fS0u?=
 =?us-ascii?Q?1wewDEouW+Ch1KrbNRSS2jaX5GQonCjG+Mk0ETjNaGa76t4kMP6pUmpnXu3h?=
 =?us-ascii?Q?oNT0MJcd78CK21xbhD8x11Q0Rfev6ayHn2WptooNxGrDlApiJzHkuK7Pamf+?=
 =?us-ascii?Q?5mT3j5wZYgFmMpzsT9m7SPcPxzPTVIAnhcOgqX/ti1Av03+L5P9AHnL7KMY4?=
 =?us-ascii?Q?nBV9wbSRUbYclbxDEhfMRfhQoQsWT5mxzZVIPUlQ6l8p5KTaWSscanSa6jof?=
 =?us-ascii?Q?+q+k199r1FxmDY6XFNfcTph+5sFJOyIKIoc5io0A/nUPKpZs1vSRZcxu9B6J?=
 =?us-ascii?Q?X3dS1EVsy2yN+I8f6ic5QEHcZw9a+0KnqBCYzl9vTcz3zbJP9LWjKZ+vdPoQ?=
 =?us-ascii?Q?Axsc46LzFIVZVpuMnrMemjEzxrbDi2NHOQLtn9m3BPPAnRa4Wm3QJJfE+Uhm?=
 =?us-ascii?Q?WhrTHpZTsMSaWmhEckITFbjfztngbXKL/2A71DP5jk2x343eYBssodtKHuqQ?=
 =?us-ascii?Q?Au5nfA3XC6s5wkb0TnehTyjUwieH1nnDvmCe/kJNbXKA+dOAagGu8UdiXntz?=
 =?us-ascii?Q?fMDS0J76LX3o6fQXY84D6MDybBJzdCE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5059cb36-1f6b-4d30-91f5-08def84fa05b
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:56:41.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUP8LZfH1UJL4NsEx5l32CTUBLg4+yawRjUXSrsaRkNJJ5HFmXmKMryUv/CyqVAWplyH7i3KmJg+kEjRiN4fCJ5PVHDQQBfUyb558Rusc1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243265

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-15003
https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D23acf2f003f8=
1b2f8d9d1997ea45d822d33d386c

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D23acf2f003f81b2f8d9d1997ea45d822d33d386c]

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

