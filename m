Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EDAC5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:28:43 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2738.1786519715856385845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IUEnMOcK;
 spf=pass (domain: est.tech, ip: 52.101.69.55, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGhCO9hhKp6JMW80GxlqZ932D+Pw0qqcmerUNUOG/g/FzefyIlU6TEyN/72cxi0vfvU/8oLusQbrE7qsJAKIBuxvedmoC5MwDg7JYNfwTlMRUt+R8WiGGa28BPYflNs1hKh5asZaGURsAUUtW1xohPz/eEU21b+nhhJ+E0iWUrxOWCa3tLOz2iM03+/hbohsHvlOYbT13I1vbyefyS4cvOX89Hp2BlFaNNxA5vz7oj3MZuw4mXjsCZLBUvNO4RmI/bINz9ZMYdysFTdWMbMvk0+/V6TJObVvheVPra8WQAK0838j8LMcn9OetH8NWNmoKPuvfsqchOUKnDBzQdrmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyuUsJEqsvhP5xHD6b1qvzY3mQe5jHxEgC5RWVM1QJA=;
 b=mZ3VNiehpdp+pnBW6uM+g4drI09oloFwv5t4dLhwiAMXLK9pogXJMeIdefvf6nTK+jde9KA4YZdRMQ7iPjWyldbnxx2JnikTjVfI8ZBre7N6ePLyZJ1/0uUb2LRXTnLtNehDJShE5FDmwchqZeRg+u7e/cEWWuLNpLWxAxKeATSjyQE1fivDmsqfsJKqS5CFcsslS+2a53YcRcM66C9oJ/3G9auIc3rJg0cuGRvKcNaoRNk8Abj6R2bIQ3tjA5yPUEvKXuBTFsu06e+tJfSruxguEmnVMr/Zv+J61w3AbO6aovX4FPcqDii7z8493PU/1AReKDya5eJC/SxOUnW98g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyuUsJEqsvhP5xHD6b1qvzY3mQe5jHxEgC5RWVM1QJA=;
 b=IUEnMOcKxDxq7VuibF58E2PzqLx9b892R4nwqwBsa3mEIMdTCK0G5y7Yo6XjpEj6ulq4tZga/NejepOxeo6RwiDNvIN9dFUOPsHk6D0/navjyegJgonXeaB98ruueRr8UY5WatmAQj+kYLPGgAOZTHmRWdrFORSHWkquVUkcjFJlVqVoCTyPYxP7+sv1QOKuCEp+4vehUZ0Ldh5kCV6rVunk/2mSSdm0V8ZnZNCV34HDwJRylG4mlkLOtrA3eJsHY4Ytq8XTPnUiFPYC99jg9rlf0xj9lfzv8lRfPLqtkBPAsbJPjaRtFGqZcUyBvfrLe56XVtEfDkbnt1reECUphg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:28:33 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:28:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 3/4] binutils: fix CVE-2026-15003
Date: Wed, 12 Aug 2026 09:28:21 +0200
Message-ID: <20260812072822.22227-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a594df-2140-4ec3-b82c-08def84350d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	YKilarjVS/jk6bCkwl0T7i69t+09ydLRCzwnAjs3pNfSS0x6YpRj1FkJkpehrxIwnOuArBZeNBDT3VK3bp+NUG5z1gyFXK98bMGMZPat7/b0TeUboOCal1LGztNYjk6epxvWXOdv7QtClhNfai9DUBbHyTyfwSc7K134qgFgQ3Mag/8Jwd39dhD5ppjRgW3wvvbWBFlwSPF4+ge3iwdpW213dV7tiG+u+zK1g4mCuM0Sco3yQ/i8Ov6cPmWUINoR/OdR8mlN5VemlBgBrddoaJa4Sl5Xi+lLYnykLlBH24oewgX6gulunvcx67cXWz4p0+WSvWlPN5r4cXrpxptFZER8POqQr9RxbHiYDMUKaIyE3o2G1XGTlf0I9Fmcz341HFtTeYzAMe3Q3tXd+ijjhF9OAHwZcjWDq4CvRHP3qWJpBC2TjRfAQjeYNbQD8/wT1fMk5oW2zMqEEdos+TjFFNJAoCH/8tw7sNDjTJvw9U4pB5+sWFg1GIsvq2f0Ke6ATVyMGtPNcZ1LT+aJYVrVpgjsUhmWVzr7qoWQHlua47wZ6elEZ8bPXzvhmBeXNdi1pTvTEO0GvkkY+yHyVq4MtX/0F9oj2t30C9CRmjZ5G8HmWMNmn0eIUaZvY9K4rpWU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U+gNjYAPRIaALu9N7dkBvOt+qtm5qRqptOoV0eqHSG1a6Ococ+AdIKlG7e8I?=
 =?us-ascii?Q?5g+v1X5Per2iWy+BuivqqGBpCmTbdrFop5peAELh8vQDuzyZS/p5kzlJd+7E?=
 =?us-ascii?Q?eFDFUPd8SzZXoWFGDfUubggMVj+ToN+xoKEwiefcL52faffeeefIIGrEuoAq?=
 =?us-ascii?Q?L66amIt6jsePca9+qlfaEljrQH1XzmfhV1TNc11FGUkhd4TIiv3+PYctdWMu?=
 =?us-ascii?Q?yigpV/c4hhtgFO7PNMNsLgbkI5SbbNWzD8xaMq5NR2GdH7oyf3UWedI8VW4l?=
 =?us-ascii?Q?cRQUPsvUPc0reKQhhOoU1531mgCboOXAnGQCIkXNSnuDsCIvNjsUNUiqP2g3?=
 =?us-ascii?Q?dk7MjX/58CGefGnrptm2iU+jIPdja8brU13S7FDD2DE6s0E8pcPrdIMnMk8T?=
 =?us-ascii?Q?ORNlqxOP2wsr/5cPi0UeSDZHkPI2/RGr3quNieEGhYE/AKtpn9pPH9S4k5kk?=
 =?us-ascii?Q?AWSjOu+o6OHWTSEcWWcH/V56YnGuv35/pxCDJH1aRprWy1SLgn/wGQQjG5/d?=
 =?us-ascii?Q?4uZqD5FJSLoaqgBebPauHkgoBMT0Y4uqzrA6bUzUTOdje1YXLmoJLqhoPN18?=
 =?us-ascii?Q?kqfSWWqX4RYJnMSVemNOqaAph5kJrCyD4GbOEEsEDUTnLZZr7NDdjrsVBrRS?=
 =?us-ascii?Q?5v0QxTgXg5YRnsRYEcLnBxeQ8aBlMPKU80RhKHftcWngeDwFzgb6kpxXV/kc?=
 =?us-ascii?Q?r7CELvLpIDH6pepKCqXCPwztcl6aA27N32CxZX+QagRPKdvifO28WcOVLafV?=
 =?us-ascii?Q?P+19ymHsY1N1Br0HOyBbnhlsrPPiju2aUjGfvjLadYwf3vjFZGDfSTB4MzRK?=
 =?us-ascii?Q?SSm+jV8/uOl1FoK3CJNt46zxwxqStxO44K4BoJrSjZS1zS/Uua72lMwlKzih?=
 =?us-ascii?Q?8hBDN+Hva3UenzTjVQOIw0pq3FIqIQ5UKe90yulWx9q/XZQ83Jzu9wwEs+U+?=
 =?us-ascii?Q?3Hoenl3R+1ZcHQtHvFniMHTKRlLCL4MOq8a+rNhKvriBJa0+7s6dcb+B+QRX?=
 =?us-ascii?Q?sgSzYSJHQGCo2ho+mBvsv9uyWe9yL+cI+3TKNoimVdh/Z6EcdAPar7GRPG2c?=
 =?us-ascii?Q?X16ad5ypWolLxD1bGQp5n+A3DE+wE046Ew7BquZtm4kp74DZ+lQAhdC4tQXC?=
 =?us-ascii?Q?gIEx0TaKYyAGPslonoeFUVBrgXNdEht9MXR7CtX/iIgrL/dwhTK1vEUdVzw4?=
 =?us-ascii?Q?jjzFy0aqsp3A6C1BiFkbbmitPpRFdbFjSXadmJWd0cPh+lbzjRehR7f2z3E3?=
 =?us-ascii?Q?5kO/xuAE9vaKdJGuZkSAvImofaBvioKo+4iyVraRbErKe8OPLT4Yox+y1cy3?=
 =?us-ascii?Q?sAQa2efTLSn2ddghKFgUc+5b9bmKWE06Z3+dpRPZzv7BEBMUv0WcOr/Xmcuc?=
 =?us-ascii?Q?cBJTyDrnliB7peMPua/6BUic/5Jx14R0mTpYxfhE934EvJ704/mS8WyXRyjK?=
 =?us-ascii?Q?rhptdb80JKKqSdCMTAWPOQ/jNKcIkYw9eUlO43J4dVhmrowCX249akyuOq2o?=
 =?us-ascii?Q?7L4Xso/PYHQsgF1sECIIwL7yzNwam4Yua4njkHlUBfW+5GIGuIHvVV2Ryq0L?=
 =?us-ascii?Q?TYilVzOsYrF0LgeptnIGcOF46/ZhCi91bgToHqYRB/rrrWEG0IwyZGYckLww?=
 =?us-ascii?Q?AAlSMD7ZkLHlulMXvO8nGAVny4hw3XwNR8vow7+MjMj6Ma9NnYdN5cVlqoyy?=
 =?us-ascii?Q?0GFh7/3yLu7y5MwP6mQwnEJVolTsnIiBwhQLkMzPhu8rbLl8fZmtye+FW5KY?=
 =?us-ascii?Q?+Mb/G7Xi3jgtP+1CMhUDy4yfUgKsWJc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a594df-2140-4ec3-b82c-08def84350d8
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:28:33.7753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJGjuWlsvjkPj9s5sBK6IgQMLgi6LrZTqibeNMB2AWoso8k/F4l3Zq5AOmfdYmvoueBqz+3wEsLxU2h7c7KWJufZz8FhCw0y+S2U1Td2Ge0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243250

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
index 0000000000..47e0e65f2e
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
+---
+ bfd/xcofflink.c | 132 +++++++++++++++++++++++-------------------------
+ 1 file changed, 62 insertions(+), 70 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D23acf2f003f81b2f8d9d1997ea45d822d33d386c]
+CVE: CVE-2026-15003
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
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

