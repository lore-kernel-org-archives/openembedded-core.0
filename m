Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35313C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:55:14 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5125.1786532103872253773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IOSD1ZFI;
 spf=pass (domain: est.tech, ip: 52.101.72.49, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxATG+dkxt73rXoIIy4C8tBtY8yPzRGENzi0LqahSOEB0ouayju/ZT3AeUVzlWw+Klvf4ySqN0SvfZ0qromNFPaTMK34fWeW/4P7BI5A+WD4MD+yf/941w9IxvndUqDkv3BWw1vZ3rBwNS2aNhbUgtPc4qB6wJ4zjP8HsRJ3YYU6HhrsbUsnBvHoprr2wEPFkdnwW7ltEXsbXTh1O9M3dOengYg2/ALRaKZ7/yd9QHzRL47fAmlAiDPPB5xx4xoFKX+6qgRy1lrsVI8dXyoyRn9IWJh2YsV6E5ReY+iLdBvRffSZLyoQKTNy7QNQSeyd9+q7YhfB5PwDXREQH5pDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cZdPCEEWDGa8tzABx3+Ro41QEKj4PCF802cMOuxNvA=;
 b=fN4+UXVKzDfag2RTR9frJzn4SsRry78r3IJiqqfw2DQXJhOlYHTFjuj9aDA91etcjECXdr/DNkGPhE5Y3HXrQ4mlXARvMY6XoRoK7IP0A+3egurTIfZH8P4nX1eC/OwCQBNxYybaKlos6gC1AmKNB1ErtOVLxEYJHC8nhfshj3wTR2TKL1LBGRd1CBn3JeWXdJ9x1i9426s1gqGyh6SWyVr3+hemzgj0X4cbQpJkEHAn9eWdCxNOnsCyDqoI/Eu1GknFnS4/F2jPaVXgiM85ocpkwCqOyl2117YQaSJSVbPjwbLdUxNhE/iWSets0pB8RFZhB2GjjHW41VI0+C5ghg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cZdPCEEWDGa8tzABx3+Ro41QEKj4PCF802cMOuxNvA=;
 b=IOSD1ZFIpUs7p9TIwoBVHCVKWovzPcSunkKoJnC7m4wfUv0SjvwvEX3+JY8kd2nRrHMoI3BZih16g20nfH+hQVqxIudhJ13roNWAylx21PeZznXJyZ9hOazuEBcHnFm8gv6PguuLW65iO1SaGrij7tPIZjbDsw4rTI+FRqJsBUaq9f2cEB7QsEC024TGsp/Llm64o3ihWyvSwRU6w2SoJnZKA5WS24pqLSFkb+tbQc6+K55YlI3n6trqWOfvINcKgkU60vY5QFClusOXc+vvBVYFivvUm8Q4HlquiT+Ifg0uoKaUEeKgC4mjSHDS7SO7ztC0QJEibgVkFgwIfhhUBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3581.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:54:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 10:54:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 3/4] binutils: fix CVE-2026-15003
Date: Wed, 12 Aug 2026 12:54:44 +0200
Message-ID: <20260812105445.24234-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812105445.24234-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
 <20260812105445.24234-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0496.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::21) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2934b5-ce91-4cdf-446b-08def8602519
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|4143699003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	oi+Dju1T2SdWUMdo1rMQSipmyhTJmvRlnXTOTVna61YkYGDjvTB4jfUMHrriyNiWfbHAYry7S6jySD7OuiCzUxG1LbBE1pws+fGmGak5I45l2MTmxhEv8wPFHpr9NMuqre7UXpsV/le52a3aIABNID/arAng6/u3KwPcZacXBI6pmKBIwqWZaFnsLnNVc34XkfRSnTH62k0TD3IWUaOIugOlVTOvGzC1kuX4JfbAQRlp/IWAhjHa4JyqgDyBE2p9mS/gahr+VzX0l5gvgOAKMwgegx+UDcoo5zefusoiDHhcNj0Nvsh/fb44891bf9B+EhjBadwgAcl5ct2UZ2KohP0hBZT9ReIZHoJhE7Vb2i6WMXqnO9HfxONcT2P3Hwb+LOBl8/yeUd8SrK/JreUwxrrRaLZbJRiMjFpDr+zzpvYt2QcG46t54v97GPb6nvvoe4qSu5faFGlikrnHh+1zTJTfQf2TCkX7LBvMtBkgwBp0oSbvOh3V0b8Uvgt/dIuVlb/QO7agrKvfQlt1cHz/enhu5YBbIaKDVxeIEFY+8KIi7xSzNT9ucliLfyWZjwgrfLH2AyhET3R6JfOFogp/8ynluhDJ7bUEK+JeeMgkDk1OHooAuFATtC3Sbz/B9O3V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bw6NOCRrCvRzuMd/CfLUVNzj0f3edHfa0U8826o+Nj8sIC//F9/Q1YC4Yi3N?=
 =?us-ascii?Q?Oq4dHpdQKuWsVC4qALu85Menn71T5w0ze7nLx1shhmUzI92+6pvnAZopvguA?=
 =?us-ascii?Q?OHjucT2AZf9RPnXPS6N3z8PJVg8sNC0Z0AqMWKYofmmHt5SwPOvCYkzDcHMw?=
 =?us-ascii?Q?ia/yzqOn1WLP5M4hac/erO950gzQXNTbN8poef3zqBHt1eOsxhaS/K8dCHQT?=
 =?us-ascii?Q?JGiRI0tdwqaXPHTbVJ4s70krSKY9wcM4F9Vj9s9yUy7M94+1Admgf0JUdxvc?=
 =?us-ascii?Q?zjeGH81pwpQbT9s7uC0WMRJox8D5+LLOxINqHoBJOsEK+cDkFhji+VVveFgu?=
 =?us-ascii?Q?2foZbZTrVAbzF6wVz7c9WrDKSThPBGUwkPrrbcX4kPGHVVJAhyBU3ASsZrsx?=
 =?us-ascii?Q?ihv7O1Hmpj9hrwoBV9SZtvrYWGruvlLL2mc2l4axcDEwbV2ph2W4ZThfV0Ig?=
 =?us-ascii?Q?fzwuaIa1P8eX3Eh5HjC+X5eB/auHrABi2boiE0qcHCkWdM6EzSOtLKwrjO93?=
 =?us-ascii?Q?WS528drbON2Mc7S1L8uGFVjh4tyMN8ZsdJcG8zoeavH+FkuNrBmjLfX8tWYW?=
 =?us-ascii?Q?8KyxECydRiaguAYM787F9xNSWgmU1/j+oFZqB8mIibAbOklHU9wYDfiH2tY4?=
 =?us-ascii?Q?CEeA7Yp7gQTJpajjkEQPXv1YiKv7Li3eGhSDFaavqK1Bf+1UtGdCKdCw7nB9?=
 =?us-ascii?Q?P2gfvvNW32M5uLyLXbTsQ3zR2N2gYPudygjhobR+LIT5F6MBLq3srx2Lgkm5?=
 =?us-ascii?Q?kOqFgw4m//AZL5WA5m8atiICZMAXpAX77mPnC9+9R/jplHEsT59CBTP4fEcZ?=
 =?us-ascii?Q?SYZycJWcmJheDmydOPsFeU6iXcvtU1T+6zX6pKhv+RaUphMNElDuq4V+aqFO?=
 =?us-ascii?Q?hImnI5Tv1Ccg8HKH8iF9e818lcdg6Io1zbG2TbCpWL0KPKAohy6eBE3jUiZb?=
 =?us-ascii?Q?mb+11LEIxRzn8zDind6xrdPQlyOeG2q8TsgAi1UP1UO7Q03hFuWOUXrbgfob?=
 =?us-ascii?Q?+yzTQapfklfYkF1kINn6QtMLWX6R+5OzPdQ5LpvB8GlMhY6XrNv2VklXBemn?=
 =?us-ascii?Q?MXk3Uy7H3ld8sdjI/mk77AbgxesUQydg3a8LabuVqSLZhK4PIiQcIPoRZA9D?=
 =?us-ascii?Q?k/CikN5xMRvOd/wlZ8RlWUpYGhvepj+xFkvyYzhtgGmxsK6iIvm01yiXl0SH?=
 =?us-ascii?Q?BDyVnTXCBUhT35GSGkdESvpeD3kROR29pKqBuaBSa+1We4462X/fNX12hgXI?=
 =?us-ascii?Q?3gZsqre19rGkHM60yS3tA6yBRAQ9TsC3r5GA4sM8QvTus+1e9oRgGHIKWc8d?=
 =?us-ascii?Q?0VoVFope+DxBsGFwVH3u+q07U1AZCXwyUIonUFnoM0Q0XE2Q3W1+6+fERR3r?=
 =?us-ascii?Q?n8jchoFN3BlgRIWq/TnA2cNsokpqdcw3Kc0JVDdihnynMtuhGy9o877vl1Iq?=
 =?us-ascii?Q?I8wVUgj5SlJ4Yb/aLALX1KHhVjmzRPvufIaf9DxYeR/2C1j+16/yVjaRJTy6?=
 =?us-ascii?Q?NBu1yCPct+LckOOyKmPulfVYOQFlw/umkCWZJXcwtyQXYgf0pQnJ/F2utFA0?=
 =?us-ascii?Q?MSHO6c9gqtAgqDo3WRn6YRlyMQSJlqsFkEsXVpTqcd9Jp2Z9ZBfoflsVcrd0?=
 =?us-ascii?Q?IbZsjZB7VteZMI69HPiQSd3yl/laoOX9CtJR3J6v0kXhJ6bX24EMffcs+zL2?=
 =?us-ascii?Q?0Yd3kt2u5nA8Ws25wcD3ld6ukmFZDQ4516j7aI7h+vlFJ9LwU+eVoGQSUkVl?=
 =?us-ascii?Q?DWWGeF61sjFg/Ce5TVmY8T5BABnqDsw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2934b5-ce91-4cdf-446b-08def8602519
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:54:55.7218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSZAk2g5oxkqjJ4c8F+TwhEodJi9JbPVLXv4vFE0vA6mtQGkxe5zhy/oF+evLDKdA7R9e1LmnlTP4eEGliOEpjXehHi7F221VoYoxRzr0Aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:55:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243274

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-15003
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D23acf2f003f=
81b2f8d9d1997ea45d822d33d386c


Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D23acf2f003f81b2f8d9d1997ea45d822d33d386c]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2026-15003.patch    | 400 ++++++++++++++++++
 2 files changed, 401 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-15003.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 5534ce577f..447529ffa9 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -80,5 +80,6 @@ SRC_URI =3D "\
      file://CVE-2025-69645.patch \
      file://CVE-2025-1147.patch \
      file://CVE-2025-8224.patch \
+     file://CVE-2026-15003.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
new file mode 100644
index 0000000000..2f5c42e1b9
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-15003.patch
@@ -0,0 +1,400 @@
+From 23acf2f003f81b2f8d9d1997ea45d822d33d386c Mon Sep 17 00:00:00 2001
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
+CVE: CVE-2026-15003
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D23acf2f003f81b2f8d9d1997ea45d822d33d386c]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 132 +++++++++++++++++++++++-------------------------
+ 1 file changed, 62 insertions(+), 70 deletions(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 7f1c0df760f..cf3b33e7202 100644
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
+@@ -1477,7 +1477,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+       bfd_vma value;
+       struct xcoff_link_hash_entry *set_toc;
+=20
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+=20
+       /* In this pass we are only interested in symbols with csect
+ 	 information.  */
+@@ -1523,9 +1523,12 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_=
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
+@@ -1552,7 +1555,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+=20
+ 		  linpstart =3D (reloc_info[enclosing->target_index].linenos
+ 			       + linoff);
+-		  bfd_coff_swap_lineno_in (abfd, (void *) linpstart, (void *) &lin);
++		  bfd_coff_swap_lineno_in (abfd, linpstart, &lin);
+ 		  if (lin.l_lnno =3D=3D 0
+ 		      && ((bfd_size_type) lin.l_addr.l_symndx
+ 			  =3D=3D ((esym
+@@ -1567,8 +1570,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
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
+@@ -1589,21 +1591,21 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link=
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
+@@ -1726,7 +1728,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+=20
+ 		  erelsym =3D ((bfd_byte *) obj_coff_external_syms (abfd)
+ 			     + rel->r_symndx * symesz);
+-		  bfd_coff_swap_sym_in (abfd, (void *) erelsym, (void *) &relsym);
++		  bfd_coff_swap_sym_in (abfd, erelsym, &relsym);
+ 		  if (EXTERN_SYM_P (relsym.n_sclass))
+ 		    {
+ 		      const char *relname;
+@@ -2507,7 +2509,7 @@ xcoff_link_check_ar_symbols (bfd *abfd,
+     {
+       struct internal_syment sym;
+=20
+-      bfd_coff_swap_sym_in (abfd, (void *) esym, (void *) &sym);
++      bfd_coff_swap_sym_in (abfd, esym, &sym);
+       esym +=3D (sym.n_numaux + 1) * symesz;
+=20
+       if (EXTERN_SYM_P (sym.n_sclass) && sym.n_scnum !=3D N_UNDEF)
+@@ -4005,7 +4007,7 @@ bfd_xcoff_size_dynamic_sections (bfd *output_bfd,
+     return true;
+=20
+   xcoff_link_hash_traverse (xcoff_hash_table (info), xcoff_post_gc_symbol=
,
+-			    (void *) ldinfo);
++			    ldinfo);
+   if (ldinfo->failed)
+     goto error_return;
+=20
+@@ -4216,7 +4218,8 @@ bfd_xcoff_build_dynamic_sections (bfd *output_bfd,
+ 	  /* Read in the csect information, if any.  */
+ 	  if (CSECT_SYM_P (sym.n_sclass))
+ 	    {
+-	      BFD_ASSERT (sym.n_numaux > 0);
++	      BFD_ASSERT (sym.n_numaux > 0
++			  && symesz * sym.n_numaux < (size_t) (esymend - esym));
+ 	      bfd_coff_swap_aux_in (sub, esym + symesz * sym.n_numaux,
+ 				    sym.n_type, sym.n_sclass,
+ 				    sym.n_numaux - 1, sym.n_numaux, &aux);
+@@ -4307,7 +4310,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+ {
+   struct bfd_in_memory *bim;
+=20
+-  bim =3D bfd_malloc ((bfd_size_type) sizeof (* bim));
++  bim =3D bfd_malloc (sizeof (*bim));
+   if (bim =3D=3D NULL)
+     return false;
+=20
+@@ -4316,7 +4319,7 @@ bfd_xcoff_link_generate_rtinit (bfd *abfd,
+=20
+   abfd->link.next =3D 0;
+   abfd->format =3D bfd_object;
+-  abfd->iostream =3D (void *) bim;
++  abfd->iostream =3D bim;
+   abfd->flags =3D BFD_IN_MEMORY;
+   abfd->iovec =3D &_bfd_memory_iovec;
+   abfd->direction =3D write_direction;
+@@ -4876,8 +4879,8 @@ bfd_xcoff_size_stubs (struct bfd_link_info *info)
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
+@@ -5250,17 +5253,16 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
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
+@@ -5475,12 +5477,10 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
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
+@@ -5489,9 +5489,8 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
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
+@@ -5557,7 +5556,7 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
flinfo,
+ 	    }
+=20
+ 	  /* Output the symbol.  */
+-	  bfd_coff_swap_sym_out (output_bfd, (void *) &isym, (void *) outsym);
++	  bfd_coff_swap_sym_out (output_bfd, &isym, outsym);
+=20
+ 	  esym +=3D isymesz;
+ 	  outsym +=3D osymesz;
+@@ -5566,9 +5565,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
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
+@@ -5796,9 +5795,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info *=
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
+@@ -5820,10 +5819,9 @@ xcoff_link_input_bfd (struct xcoff_final_link_info =
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
+@@ -6036,16 +6034,13 @@ xcoff_link_input_bfd (struct xcoff_final_link_info=
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
+@@ -6564,12 +6559,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
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
+@@ -6807,12 +6802,11 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
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
+@@ -6827,13 +6821,12 @@ xcoff_write_global_symbol (struct bfd_hash_entry *=
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
+@@ -6929,8 +6922,8 @@ xcoff_reloc_link_order (bfd *output_bfd,
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
+@@ -7395,8 +7388,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
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
+@@ -7480,7 +7472,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
k_info *info)
+ 	 appear in the symbol table, which is not necessarily by
+ 	 address.  So we sort them here.  There may be a better way to
+ 	 do this.  */
+-      qsort ((void *) flinfo.section_info[o->target_index].relocs,
++      qsort (flinfo.section_info[o->target_index].relocs,
+ 	     o->reloc_count, sizeof (struct internal_reloc),
+ 	     xcoff_sort_relocs);
+=20
+@@ -7488,7 +7480,7 @@ _bfd_xcoff_bfd_final_link (bfd *abfd, struct bfd_lin=
k_info *info)
+       irelend =3D irel + o->reloc_count;
+       erel =3D external_relocs;
+       for (; irel < irelend; irel++, rel_hash++, erel +=3D relsz)
+-	bfd_coff_swap_reloc_out (abfd, (void *) irel, (void *) erel);
++	bfd_coff_swap_reloc_out (abfd, irel, erel);
+=20
+       rel_size =3D relsz * o->reloc_count;
+       if (bfd_seek (abfd, o->rel_filepos, SEEK_SET) !=3D 0

