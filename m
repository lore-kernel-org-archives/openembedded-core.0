Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8960CC5B567
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:29:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2747.1786519755355944457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=FnzKcyhY;
 spf=pass (domain: est.tech, ip: 40.107.159.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXVqpEciPlRAx3lnLu8ZIHUOsOJN+WR4xYzraix3gu3VcMNyV47NwKZ2aex8txRGZzJDXlLRvKBRvmgvwYxsQnv9vRXmiyOJnJujtpMk3cqfPvSSmdyXgcTdsFckVb1043k1SRlGx4HHOveP9uLHQOPGmSwAWfCm+1w6e5IzJugD5tyIE15fN/NKrteggaHqWg+90yrcKv40dbIrYOwBU7exydUwZzWAlCTI/1HT8p/cblaEqPBRuLtkCKNV3vWeIQ7oJi8DsegP3WqXvklEbNTkDNsStL/u8sU7DN+j/5DGqiL4i4RoLmwgAkE80v49IDEJ+nxFv+7Wz4UFM5vdEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJy8HCD9PzlbGGNEjBQn6VcfuIFBAjaelUmmIHR2tTE=;
 b=F/kahUD5G3Vbg5SEH3AT+spa89u3HEWDdMOGdsqhAd7vyyV6tHb4BkalHQfuY5n3eJyDYqMP57JjFSL5K4zrIAPGhlW0UglkLhvLCMjn3hH8eYMFPnF9rc2Iw0GaYBfxLmZV/xbR/YDPlQlW8Q2z4WR5NVTL6Fn0pjSduHS1WnqjdyJTeDb5w7UN6JXuMeAdoAeBsDWTzMnI/NmvoZllM9+vXgSdYIgSNL9n+FmDoRXbv/X6Hi44BYFdcpqul27blVdfs2A2r6uFT9hfZg0NP1Dfm+2u6pTa44Y0KbWBhvz4CxMcnAV5jQXI3XrEQmAweMV1Q2EgwLtb6e0EE8ozUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJy8HCD9PzlbGGNEjBQn6VcfuIFBAjaelUmmIHR2tTE=;
 b=FnzKcyhY/aNlNIDTCRWegSvwk/P80oKewpZfGS4mCibpQqbA9MXl6Q0wbX6SxiLuIlCN6fll/Kf2MLmsipAQhMyo+EZBh+eIWuqHAArxbOgtzaP13XMx0tuWXEonygJwua8Cj3H+BKbAYimA8HAG68LK/jxl5e1YuhBvXm9dYAxGvYUDFqhRg0LcencCTZgAe/8wjIVU/UKP9vkEFaq2uFbxPNM34NBuX8q8rvLLguUNohc4ZzstBgvCpQ8SVIQYctQfwfGbmJUZNj4n6YCNO6lazZFd0vj9at8Svnh09ZvFGjgp2elQ++aWpxwUex3VtbRjBdMhLQFjxsRts1bnrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:29:12 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:29:12 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 1/2] binutils: Patch for CVE-2026-15003
Date: Wed, 12 Aug 2026 09:29:06 +0200
Message-ID: <20260812072907.22268-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072907.22268-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
 <20260812072907.22268-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZP191CA0037.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: e99299fb-2dbb-4912-67c4-08def843681e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|13003099007|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	nXkd0IxCewzoX4jPew5u4q+jxZoptKw2qW8WIaaulxYx42rc2YdXbfpRLrQNHfPFaQqpgsx+WtSLUGpqOmgLYMrKdbEUe0Q/uU0tutz0eFqPBP/Qk+3QXfTOYgzFsTAuQc4Tlf6lSct4W4+8EMCLgDq+r/gc15gsGBIfTdtuMLKFcYtu9QQ4nErxCJXZxeznSAFyBaUY8KYp/bqT1dBJ2X8zZDehOdD0X5SJi7i4KJi9Fbd/wVVHI51imqo+moA4akHr0/4ObC2i9cj8weQRHK1CImulEISEs/K3DBsdKbUolDAFIBBcz9g5917Q1SfCjAbtMZAoSnKazwZ/WUI8nYJ3gZbTJc2LUkR/QZ2nl2kIwxsUL4HrDozT8TirVK8NiJP1dAdqxtzwS0WANiS6aYkmKKB2VuoyplUda452AT9v7bS/GklGtwsknmVflecHETsvdclIgjJZujUujpLoUWQ9zQEU3fxywnm6PG25XCQu/nPjjq1Hk5/wCmod3vcFx5mWG+bAD4xyfuLjN76x+Fg9J0pH5Vx/knjt0ydOl2HbGbrbxH2lTjgJ8RvW9e2N9aIlxuXrddaoHRW9eDHpJQT4O6FedUaCxDcCGy8B8P0Gl1bPuXMnpbW8LweT+w6S
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XJ3DdUMmEbI76I/pgbxtEhbicFAsZQKbsEa0Y4CgFpWOhAPE0sudTB7gPvQi?=
 =?us-ascii?Q?J+twLu/RSn95Pq8evlkQPu3FaP9HdNwOOZ/PaRkTvOF8QY01rZu4qm1/FO0l?=
 =?us-ascii?Q?Aoh5KnMBQdzRMdedXZZXyX+B6WWxT4/fvc+Eu6Q6rT6kOWIrsXK7SoICydcw?=
 =?us-ascii?Q?qv1382ZToHAiu04ywuyNItwWi+/XZFQ3HfacNyhicksqnM0YpCOQxLrjUY58?=
 =?us-ascii?Q?zPcrYpgthdrPmm/efWc9mrkIBtdhO+u/ymLnLeCn7JXCBJtvEyJKs7HCU0v1?=
 =?us-ascii?Q?ZFxRIpPW7XEDC+znhvK64HG5CWTNZb8Ep52lWZBHZ/6Kypr9+Rq211VBuMCL?=
 =?us-ascii?Q?B46bmXnDttOKd9Q0shjE2cHcZnxVGNV4fzU7FdOPloX10RyDErHhFS0s6tLB?=
 =?us-ascii?Q?6BWe2zah7AQ6Tx5p7n7Rmep6d/nkPuW3Bc6WrmVISZ0zhNWndvs1mF8ClxGn?=
 =?us-ascii?Q?3ABDV0/j1mab4Vl4Ry2p1X6M0aeoa93bF8nwvL8QiM5zZkYAuisHP8DCofpG?=
 =?us-ascii?Q?pq67vlaU+aqKFUYE0/WymGGUkl0c9vaI+VDK+vz6y5aY51YlFd02p6dBNRpm?=
 =?us-ascii?Q?KV32F5T6Wm0Eb82hPBYHUp3CO7td8Er7yrAAodmE2aXIB+sifLwvEBwZ4ROk?=
 =?us-ascii?Q?wOE90kQtE8LBN6PYVeybkYXKdBjnJ5dBPshnYiEGAlh+AuL2IfEkBBemTQD/?=
 =?us-ascii?Q?paDy/IdoSuiqJcyXydRa7JoSExYYLo84CN6q8PdFyGbwsEK89XkxMf85F0CY?=
 =?us-ascii?Q?P7Heldu/uoIMgL0WtUUNJotl29oYwcOL6thqAMGYUulknqHxGBZAYaQ08R5/?=
 =?us-ascii?Q?FETIEi6ek4HksQnfAddod8Vi2tTZ2XG6OTewbeK1VTEvYI/7z8zWgQOVL/7t?=
 =?us-ascii?Q?RpUfxUzLYNtBd8S7ic9VYBkmrnuW+RrwubthDTp2l2sHKiUOVRrrG073ifi9?=
 =?us-ascii?Q?KOTHzCW5bH6lNR1qHjmLnxVpp124tKd+deT+zdbq24Pqo7PNEdT3AxOIiUFx?=
 =?us-ascii?Q?CtcAMFCYKUSDj3P4nlwYuflnWsoLyTfwouWDrqys+emOXzwSQhH/nCUTpksg?=
 =?us-ascii?Q?VzJWyeI9VwRXO0UdtOYrSuobVBoZZpocHSyDck2xyEHVFvsnUz8NLhh9ivq2?=
 =?us-ascii?Q?tivAAuSGQAP8/7gC3sSAToZrPmVdbXvzyNhH/e0gnjsUxnEyPM50p7Ej8UTf?=
 =?us-ascii?Q?psL0lsgKATQB2+pL6tj23tgzufcdw19dVkXHd/VTDmc+fhaPiZnuHj/JpCr9?=
 =?us-ascii?Q?CGJrkEhUZ1mAh7SQVPTtez8EBir3VvOHLU2OsniSlalKgjWG3NbKd1mCrZb5?=
 =?us-ascii?Q?6V64aOSVyvXqrAamjHCwpwxVYt8fprY39qFb+Qke7uyOj/L53nhUM8jNPnpf?=
 =?us-ascii?Q?eC0q+T8SkIwgw59nd1i4wWp5uMUqB1VhuVE76ksV+d/tt7Rh0sg6a+Ol25+r?=
 =?us-ascii?Q?L1V0IWGue0reECGSu0InoUG+3kmknqxyQ/BmIE8J/J0uozPgA6n1FKPEFTUS?=
 =?us-ascii?Q?oBQTNgCvDsUIz6RzBboL0gEugBi6ie8f0tiP9YvuHJOfkvVQjrR290QMYYmQ?=
 =?us-ascii?Q?yo6UuUFaICyWyAKnqacGiLNCYiVpL98CqZoWrMbm+hGqgQwi+koRrGctxcIX?=
 =?us-ascii?Q?s5ZFYbcldd6cjfa9KG/se69EjZdeYhC8kVH1JeKYfWTwMf4B+FlmxBbDay4u?=
 =?us-ascii?Q?a2CgFnR0yvTGYMHdEdhRrwJ2MrNr1Y3jEujaYzwzETgopzyOR/WJG8tcDw6U?=
 =?us-ascii?Q?+MuHS0X0WB65FwyjPx3P1rg6URH6wao=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e99299fb-2dbb-4912-67c4-08def843681e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:29:12.8102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3f7Truk6DCCp59osNS9s1SR3MAYlFUeWmn+bas9nyqdsgTAYsfVbYMoWe5DG3H8TknGEOfR8+PkdsdX3AS49DpMqMbfKMVkgBtDYt/nbQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243253

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

