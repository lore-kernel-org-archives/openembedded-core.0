Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981ADC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:28:33 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2585.1786519710665362221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bWFoI38j;
 spf=pass (domain: est.tech, ip: 52.101.69.41, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tumb6tek2TFF/YemG1GZq9V6LgEHRjSiJ4kawY2FKDtyTnRhtmn+Jpzwsi+ljZgXQNjo53MME5NWp8rRTS7bK9c5DfjXSVdv1IHM2S4wEzNyU2aaRIJ7B//44jsOK74UdSloqil97JQ7e/cH+rkOMKXsUJglqYTeR5G2ecmGm4976S7QJQl7hNqgNUYF++7bdcql/J4PXWtFwWRVomhi4mCm5J8KnDQfjc12cXupSjBA5ziJKaX4xSBQA2F3wnsaOtvaTU6x1nlb3yeb3/xBiep7V0hgvI9+GVXqEshPH7og6YLqmR4TPRmZrW4SuFX4x/Me5UrqOMwXIlJXAR9ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QTW5CVUwQH0WP5kmovY7bGNLSPOHg72gAD5J7bXWF+w=;
 b=puUM8l/06lA2OtSIxxH5xx1qsV34cYfsWN+RLTRa2AyDlmbH8tFxK108TjTbkOUkBPvFlOmFDtvkZX6Ny0bIqWmOpLi/sqdGCvAtYELfHdlIWZk4w3iJwnX9uBexi+aUd3uuTx4AFqXu1ODJqFBY2/RTdcLANv6sKXCHhErpXj7oOD5FiXmGbnlic37II6t7Qd4VCQ4d3kxxGzyT9xyZE+wcEvZTDxIVQH5LtNgt2n4K2Uh/Haoro4HwuLBRy3ySUjcy9WRCdhuD/owF/t+LAB1TGE1kVdIm+Yt+EU2ik97fOs9+5O51GSF2LWaDYx0Adh07yQ/gljhrUQ8W0tS3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QTW5CVUwQH0WP5kmovY7bGNLSPOHg72gAD5J7bXWF+w=;
 b=bWFoI38jLvUtrcE3vEdDzmvcQYK6ATRsOkRNjHCQu9iMQlZbPS1o1lVejlaJ3ncXKP6ifHlf2XPoLmAbZZ5RqkYrnIuIlKUseLxHZ78Wcf7RcGVqkqwWKmFbe7ksIX1glWf/V640xMxvsrkhB6H7hL5BuVvTv6Y+ma6SG4Nju4yTYWae1yAHjvz6a17u8vp3up9hGOB5l7k/x9Sos7uy20+k0ZsGbGGJgi7DhrjWQhaK7hc0aBLMc42fOvXb4BzKDc5yT3cqy9EHcGOs7eJjBiDSwbmBcv6lK0WMESlMxqyovoIVziGS3/RKCNJIYlw21JCxI9aq1rEJF54Ixa+FEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:28:29 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:28:29 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 1/4] binutils: fix CVE-2025-1147
Date: Wed, 12 Aug 2026 09:28:19 +0200
Message-ID: <20260812072822.22227-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR05CA0020.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::25) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: ab162b71-3404-462e-f8e2-08def8434df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	jUANzd9ixFcGu5b59CIuc9gw1z9Q5pZSCSpOZWKN8d9+4kprSnVwPu4742k2z2n6qPPA6urEq4FmIDlBINjyzUcyCO6aGpVipxsbR7m1gWNyPt/FD2cpXSPK7Uuiz7cD7hcLy2i+QFi7fbj1Zn6irMruXoqSYA9BZ8v028sQ3raqm8dz9rSuCa+T58U/I52Y6Evs9nQWm+5cuOWpVlGaVFhMG9EVECxb9ajgtxAw8FMp2jM4zWuDv9cX8I+54UvSUYTa3CXdIMX+q9klDMPrDCqQVqhR+aw3YGHCyGFSrs0OnHWpHA7y9/XRBoAM6HOqclspeE1Vs4jOy54dMgPeM38/CdjMZkKWjoSPO7CRjwBwfyjMPCcSzG20RuYshOjLeLsaHxDkpFRsLd578Znnzaxqv6KhooRhdPkgh5qTgzPquGPywzmPBVA4thhflnZs6hdouaX3m6+D0jq3Tvu/r6QB69I2iV6mEbZXUBcXUSeSt5HSpzMfiC15vWlu3f3tJRVhKlQiNILs4ZidZiTSugdwztliIm0Jfw23CWrK53ZQB/wVwapUPcdlqyF4+uHTsooo50L8uCizMY3ED9VL/M1VxxubISN0JTShI4ahhSE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LnDtfekago/sXW7wm2KLPfx18MfTIKOEdYypNL8hT0zdjjHe7sbH6SASzG9B?=
 =?us-ascii?Q?4Z141yF7HgdgccyzuCiRsM9m9ibJt9PJCU6pA1ATSnxWqy5WR/NK3rV3HN6r?=
 =?us-ascii?Q?E72+V+/bhGUaTn5cfuV/cEnNCQpp8fkZDkN1LWH3OttvT1vcfFn1IJ3it0ae?=
 =?us-ascii?Q?4Hn/PI8dp04LOfYvksKoBA7jmjyqT6WQgGyTOS24+lKSumSHc8m0zyW4Td2I?=
 =?us-ascii?Q?K3V4ci7VY+WMbaN2Wc4miJ60UVmvo53eNrQEIa+X42m5iw0z9Om3J+NbBzEA?=
 =?us-ascii?Q?VqzB39aQyraVZPfjhMSUohZa7d+BgtM+8efVALC/T6csqFFQGM2cEuGAUBEW?=
 =?us-ascii?Q?Ffdb+z3NGpbvhotK2FfO7u04D2jZrG2J5jZNKLawIzxUSBth3eKznv/pdZM9?=
 =?us-ascii?Q?7+omScmKtQfRwvD9GFjLWxZDJHVCa02csmSUZQJZSFQ7oYvahhH9P6jybnq0?=
 =?us-ascii?Q?Z1nvpn4px2NzwXXcrN2jR/zqKxHdJhSrWbB47e1blB2CfAI9YfRq7CmHOItH?=
 =?us-ascii?Q?NKcNrEpIEv1/bZRvOPiGCZLo/U4j3M8C7Zorpb01QXiGtAH7ysFfojLnZf+A?=
 =?us-ascii?Q?QvVAC0yqvLzxKqOlJF3j3kqgBNPQb/mt5v35l6+WS+NKgxsAgCNtuYVaD6ZD?=
 =?us-ascii?Q?U0ZjHSbphib+zqssaKLK7HBynErX4XCNImbAUu0jmwdEph4+F6g/CJKhSkYB?=
 =?us-ascii?Q?76HgZOHiUfdnpHq83TE3QGQRIT0YSG/HeGFpTORBi4hWxiiwmu7KDscsWB5O?=
 =?us-ascii?Q?TcytOMb+Pytv1h/OCbT4EeePjzt7lGjS/i1uIEtPJZmtWr/l7krTf7bYo1Gh?=
 =?us-ascii?Q?y3O6k5+VgnXjCpvw1ZoUHB9xrpJCseki6QGRyA3uniq4F4E85mc6TJkAzjdg?=
 =?us-ascii?Q?UkHOvEF7t54sUMHmKcGOgQgcBnhSkKcAlU1dcV9sWgGu6ERlchuEc4Qzg6NX?=
 =?us-ascii?Q?c8QjdIpyI2gC2yjrtLrCbX9yv7HR1GgPU7/xw91KXqFrs7LNNWf2yNVwFOuO?=
 =?us-ascii?Q?wAKsOwuj0uWY0tMz8LEBszvTbuGoJ0774/ja1OEbGCY9GA1rMrv8eSKi7zgY?=
 =?us-ascii?Q?n8jlpjIbiwTNktCrImzRVYZ8kfnaoo5WWf4xt2R5Lz65sRisgXg/4durMMia?=
 =?us-ascii?Q?ICbXLJDGlpBjYSTJYe7nL91Wc9NvGmmk84BftHuys5nsai8ZfX9zWeOI2U+i?=
 =?us-ascii?Q?eKGRRj0g7Xu+fY6Jkvdhm/keXv1TjrcWEZFt+fX0OPYaEyeumfDZsI6JYlYW?=
 =?us-ascii?Q?2MGUFiwOwtoYwTM/mzY7J/BaEOFOxmxj7PrfZp3shN6KGT9LfL7mkcvHK8ug?=
 =?us-ascii?Q?1AYCXuSsYtF02+fe6igtHm7tgLdGUu0GmCRRdYE8+keIePPWyRyGuY/GBcxB?=
 =?us-ascii?Q?nIYb8KyxO+/3TrDjQN/bRzYVYqIWg3JUoSk1v8CHN5EQ11IxLsrISMec5qaG?=
 =?us-ascii?Q?eQq/C8GA4NHCfXcxYObit+Mw80ld1V02tcgWj7/NX2tqMPAv2KlUQw43XUor?=
 =?us-ascii?Q?7Y/5BvtoueXE8ChdddhiIzIk9vVkeGsvuXh3shQSyUozswh1lQEcOphJreYE?=
 =?us-ascii?Q?4FeGeszB1Wiu4nUeZvHw0XgiGVUFvN7hy0jdQNNR4Lklprk2NBogXkUX0Vfd?=
 =?us-ascii?Q?aYgfIYU/3O5zXZymvvHJbbSMSNCPOBMkrqkwXfqHRVY8kS3fq+7qs28WRuoc?=
 =?us-ascii?Q?wyBmtQyWltTVov4HNuL5TmIAZS6KYbPRfw2uc6STqSiiXuOlFYu4M3QpQpYd?=
 =?us-ascii?Q?yR0+CWHVk1eQAMF2qbnKI9yTB4r3XoI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ab162b71-3404-462e-f8e2-08def8434df7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:28:28.9778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UI71W/5OuAXFukHQbAkixRP5WH5IMOSQDfkxOK7Ti/V+qiHNW7sxnFns8XAuGyVApG5q/GTUSefspR4FLu6PX2eDV+6YtaLBC71wmTqozxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243248

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1147
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D7be4186c22f=
89a87fff048c28910f5d26a0f61ce

Test results:
  binutils-cross-testsuite 2.42 (x86_64-oe-linux):

  Before:
  binutils: 302 passed, 2 unexpected failures, 1 untested, 7 unsupported
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

  After:
  binutils: 304 passed, 2 unexpected failures, 1 untested, 7 unsupported (+=
2 new passes from nm --ifunc-chars=3D-- tests)
  gas:      1871 passed, 4 unexpected failures, 2 unsupported
  ld:       1728 passed, 5 unexpected failures, 7 expected failures, 1 unre=
solved, 20 untested, 99 unsupported

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |   1 +
 .../binutils/binutils/CVE-2025-1147.patch     | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1147.p=
atch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index d455acd786..063c6cc2a4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -78,5 +78,6 @@ SRC_URI =3D "\
      file://CVE-2025-69652.patch \
      file://CVE-2026-6846.patch \
      file://CVE-2025-69645.patch \
+     file://CVE-2025-1147.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch b/=
meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
new file mode 100644
index 0000000000..d8a3f90ede
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-1147.patch
@@ -0,0 +1,110 @@
+From 7be4186c22f89a87fff048c28910f5d26a0f61ce Mon Sep 17 00:00:00 2001
+From: Dmitry Klochkov <dmitry.klochkov@bell-sw.com>
+Date: Tue, 9 Sep 2025 12:06:25 +0200
+Subject: [PATCH] nm: fix treating an ifunc symbol as a stab if
+ '--ifunc-chars=3D--' is given
+
+If an ifunc symbol is processed in print_symbol(), a 'type' field of a
+'syminfo' structure is set to any character specified by a user with an
+'--ifunc-chars' option.  But afterwards the 'type' field is used to
+check whether a symbol is a stab in print_symbol_info_{bsd,sysv}()
+functions in order to print additional stab related data.  If the 'type'
+field equals '-', a symbol is treated as a stab.  If '--ifunc-chars=3D--'
+is given, all ifunc symbols will be treated as stab symbols and
+uninitialized stab related fields of the 'syminfo' structure will be
+printed which can lead to segmentation fault.
+
+To fix this, check if a symbol is a stab before override the 'type'
+field.  Also, add a test case for this fix.
+
+	PR binutils/32556
+	* nm.c (extended_symbol_info): Add is_stab.
+	(print_symbol): Check if a symbol is a stab.
+	(print_symbol_info_bsd): Use info->is_stab.
+	(print_symbol_info_sysv): Use info->is_stab.
+	* testsuite/binutils-all/nm.exp: Test nm --ifunc-chars=3D--.
+
+Bug: https://sourceware.org/bugzilla/show_bug.cgi?id=3D32556
+Fixes: e6f6aa8d184 ("Add option to nm to change the characters displayed f=
or ifunc symbols")
+Signed-off-by: Dmitry Klochkov <dmitry.klochkov@bell-sw.com>
+---
+ binutils/nm.c                          | 10 +++++++---
+ binutils/testsuite/binutils-all/nm.exp | 17 +++++++++++++++++
+ 2 files changed, 24 insertions(+), 3 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D7be4186c22f89a87fff048c28910f5d26a0f61ce]
+CVE: CVE-2025-1147
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+diff --git a/binutils/nm.c b/binutils/nm.c
+index dce9207f44f..c3d118a93c3 100644
+--- a/binutils/nm.c
++++ b/binutils/nm.c
+@@ -70,6 +70,7 @@ struct extended_symbol_info
+   bfd_vma ssize;
+   elf_symbol_type *elfinfo;
+   coff_symbol_type *coffinfo;
++  bool is_stab;
+   /* FIXME: We should add more fields for Type, Line, Section.  */
+ };
+ #define SYM_VALUE(sym)       (sym->sinfo->value)
+@@ -1208,8 +1209,11 @@ print_symbol (bfd *        abfd,
+=20
+   bfd_get_symbol_info (abfd, sym, &syminfo);
+=20
++  info.is_stab =3D false;
++  if (syminfo.type =3D=3D '-')
++    info.is_stab =3D true;
+   /* PR 22967 - Distinguish between local and global ifunc symbols.  */
+-  if (syminfo.type =3D=3D 'i'
++  else if (syminfo.type =3D=3D 'i'
+       && sym->flags & BSF_GNU_INDIRECT_FUNCTION)
+     {
+       if (ifunc_type_chars =3D=3D NULL || ifunc_type_chars[0] =3D=3D 0)
+@@ -1873,7 +1877,7 @@ print_symbol_info_bsd (struct extended_symbol_info *=
info, bfd *abfd)
+=20
+   printf (" %c", SYM_TYPE (info));
+=20
+-  if (SYM_TYPE (info) =3D=3D '-')
++  if (info->is_stab)
+     {
+       /* A stab.  */
+       printf (" ");
+@@ -1902,7 +1906,7 @@ print_symbol_info_sysv (struct extended_symbol_info =
*info, bfd *abfd)
+=20
+   printf ("|   %c  |", SYM_TYPE (info));
+=20
+-  if (SYM_TYPE (info) =3D=3D '-')
++  if (info->is_stab)
+     {
+       /* A stab.  */
+       printf ("%18s|  ", SYM_STAB_NAME (info));		/* (C) Type.  */
+diff --git a/binutils/testsuite/binutils-all/nm.exp b/binutils/testsuite/b=
inutils-all/nm.exp
+index fea68bf76bc..1feb8578fba 100644
+--- a/binutils/testsuite/binutils-all/nm.exp
++++ b/binutils/testsuite/binutils-all/nm.exp
+@@ -329,6 +329,23 @@ if [is_elf_format] {
+ 	    fail "$testname (local ifunc)"
+ 	}
+=20
++	# PR 32556
++	# Test nm --ifunc-chars=3D--
++
++	set got [binutils_run $NM "$NMFLAGS --ifunc-chars=3D-- $tmpfile"]
++
++	if [regexp -line "^\\S+ - global_foo$" $got] then {
++	    pass "$testname=3D-- (global ifunc)"
++	} else {
++	    fail "$testname=3D-- (global ifunc)"
++	}
++
++	if [regexp -line "^\\S+ - local_foo$" $got] then {
++	    pass "$testname=3D-- (local ifunc)"
++	} else {
++	    fail "$testname=3D-- (local ifunc)"
++	}
++
+ 	if { $verbose < 1 } {
+ 	    remote_file host delete "tmpdir/ifunc.o"
+ 	}

