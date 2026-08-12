Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F978C5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:55:04 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5121.1786532095724458653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=lDRTkJka;
 spf=pass (domain: est.tech, ip: 40.107.162.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YXfLwD8vGEJTL8mc9joGesUt5vfgj6BZPHFKpNpAL7dj1izcyyQNWi52c8yOHdtwWvI/MCCY11ezAFDBk4T48Jk07C40LtqbcpEDKKgvQy1CU5j6RG6/NwOEWxdd9R4pLTTY1kARd7qlCkvMQMWVxQUacIZf8lkyhY/eWIvVV3GMRbyKHgv0Gxcgv9BOg2hTXTG2ky7ShT6i4BRv6nKnsdvD9jHw6KY+mG5d+zGSTYAk4hdgdfi+Pz9FYGzhoKaD3jQH0c5ZDYcqFlnb+IwCrMCXvSe9pkBuMZQWhLkdCAFpDcm68bg/t6To38Tos9e8fMhpkyIHEhL4iTXR5A5IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRTSUyxRe1ExoAXiyyRq5yoTqq5FBasaIInyDPuKebA=;
 b=TY0cM02gn2WolYv4WHZIWXqqbKJ0F1T3B51PCK3QwAPgdfFEjVyljkkvzDLZBu+rw30g9Ti9HrKWySTwQVjNEa0bnLz4h7r3sQuSaUYZ5ESScX3/EC8j74n1vX/fbC3ST4V2onwwxa/L1JtMOhLfch3oqh6rOcs0BtYKlkO6Vy6IROF17FKByCs7X6N5Pd+6jwP24A4GjaQ9yRbVomRDzQjGL3HsFca2fqAiPQtzK7e8ZrA+NWtj1zd2anEHvHm5raMiQPbsqn+pfX4EE74jz/Iw7+Bx105sa10JgSuwxXiKv6nX+5d9DuiOAaU6F1uqAuUMammR5ecHFea1KTGWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRTSUyxRe1ExoAXiyyRq5yoTqq5FBasaIInyDPuKebA=;
 b=lDRTkJka+uWjZAttHerXlxRe3eYkd+hNZQiETk0E9uQ28AM79WrFqSGm6RbQofy+4fgCwOt4MIsHvAEBGgFLiZWL9IaTYqwfcrZqmUY4i7Os8l4liGJIaguLaHBvC4aeTNS2JapUCfi427LCiUmeYo3m4ZsQ4eoFCCjj5N7W6rVok59VbScSDNr4htcg+KUw3oaQVMoYdcx2mPN0iZlpf8PFbg9hdiyYooCf5ChMjZTWxu5hKspzHomIbvbHP6OlcN9ZumD2+DFEENG42/zG6ZO1vfyCJnxgtZxRQFh5REZa00gAfJxpomc5D/AVdIndHeOrtTyxmM7es4hDmcEegQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3581.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:54:52 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 10:54:52 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 1/4] binutils: fix CVE-2025-1147
Date: Wed, 12 Aug 2026 12:54:42 +0200
Message-ID: <20260812105445.24234-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812105445.24234-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
 <20260812105445.24234-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: 072e09f4-5cf5-4c9c-3d23-08def8602300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|4143699003|3023799007|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	CNNm91k64EzzgRdMcEYel01hCFf+r6JRv3bVHsB1/k2slksjouhD3ab3UGXNZ7P7tBc9DsuubdUqHQJ9NDTGIykavJqVFKNg6d2zf1KPbXF9bZjG6Vo7SUj3sN41RzHsMnMtykGKVTAypFx3v6fQaUIDF1XaFqNvSkr5OBnvhVQjxXnwZe+Lv074D21Rs/E559+k2LSGuyWD8OkMcRRC5JT+Qxu23mviZQDb4KFnJWZJZAcVx9oipeHp89mhuMYaKMSIy6T7IWy4kCzYD+bijtSbaaxn+qVb1g0U7I8ULch8q8NvnEHm2lKP1q4y9MuoGnKUiQZAY2XHwQWRqe+3fS+RTk0XsXzliftmMHgCQP7QTUA4P+TBTu/HoE+m+1zbz7mo+r/y2mJCIShAvxnwiMJdsmjXIVVOsgl1lp81NhhK8BTu/xWz/vzVhxhuuldnu9MLcvOrXE95JD0KqSyzK9Hl/R/NDApyJ+lmmUxM9254798199iaK8ulbAkEmpbOA89KWcp5OpHwKyqE0UPdhlXLpM/r7CJRyjRFs4HoCxDlGJ+oRB0WdLbhRax1/SKe3wDYWMPf/N8yRHOcolDAjYdE8NhFUe4ORez5GITgZKEZ0jdSaUh+O/WBM5L2IHp6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(3023799007)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G80grXjN+RsUCEB1pXf/RXSziX5VdgTE2FanctAkiVEb+RYdDCN6UDW9usx7?=
 =?us-ascii?Q?BZOzdG6eSSBDnu+CESxA7vUo6W4XU8R7Vn6H2OpnmM+8iDedbpmzt6QctHxF?=
 =?us-ascii?Q?eKFiQEHtbbF2mZSXe0/vJiK2YoW3ED0/6TAaXakw0PXD7Kcb1smMrXugo/1m?=
 =?us-ascii?Q?vDYw4M4agXsN5YpAwj2CwLF/owFxcQUTO4v7plStuem5S5JRCvpnNDoSKcR3?=
 =?us-ascii?Q?8qZNuV57Kq1RaqAMTlMkWCKEexI43xgSyVQfWj29urD776AzXvsrtPdZ5775?=
 =?us-ascii?Q?jK3jFsWx+hs/ixk6foqUQ1QoxBi3s5rwxlJWL7LrQIv3Nn2BSrThxIyHrZb2?=
 =?us-ascii?Q?c5+pDC577M5K2oLPAL7U7zvSoPQFXfXXrKBpkXy/0tY0QcKMrDhO/fVxALtO?=
 =?us-ascii?Q?Gdl1GSNGfk03n7+myUqsCatKVaLJbZx9iS7LSc7MAmdX4B1e+yxpm+k+/0Yp?=
 =?us-ascii?Q?5eNVpXqhvtGZcSoSuFsdxBHCkovv66MopEiQkMdP++cVi3AdBTAxb/Mn9GSZ?=
 =?us-ascii?Q?F6q13NES9StIsp8LH8y271cgYD59pwty5XB9L0tiSo0ABH6lSoPjA/lq1ns/?=
 =?us-ascii?Q?0cHDH1WQ2ECXIHMxSl7WGYQ5Xf+aNe+K+XY1oYq3BT4dZXVkg0xi4Ec0nC4M?=
 =?us-ascii?Q?vLvTUaN05hD/x7Qil/i2K6Raw8nFIlLpI5VjoIZcKvFLNy7LHegfHK1CDrXR?=
 =?us-ascii?Q?oFqNdltItduOES9JMjfpw/khBLPkr/tKz8Z9SjHbBZO/1Qf6IEGpwpjeckmX?=
 =?us-ascii?Q?N7Uk98cA/BDOiYXB46hiqkpG83tJSlpwHMEcWQm87+9bxZtxHhpeK34E0ytL?=
 =?us-ascii?Q?7mVNJoX03SFwmcRFKjECxpEotC7KJgrF3dzSF4xDk6Vh2HhrJv+z/paqX2zx?=
 =?us-ascii?Q?nFwX8T7lQnK8X5oxgWiUZBzxbfZvzGdTSg/X/ucIGJDE9ANRHIdztbnHa6NN?=
 =?us-ascii?Q?QpwHPHLSwCkVB9UfkGWQuEFtp8OZakOAylb9n7sAgDe+itC/iW4nhnplWQsw?=
 =?us-ascii?Q?aixXYmYQzgAFP0B8WNVjW3XUZL6+wk200hG+gODjmR17LtDq4yKd4CA7Y/JP?=
 =?us-ascii?Q?NJtt/wrAcP//ZKQLbn2zZwal40BHEKpzkSIhiPyOJyTKMRHqJf9zyhiixf66?=
 =?us-ascii?Q?cmf+WQwjWaMHjlvqZSYrVnU8ZwOqtkxNp1uiyYsc4ATq22Api1fi0OIsnIRu?=
 =?us-ascii?Q?UtzjQBR+tn3fiO0r1H/nmRfhn+bI9O/LdWYR0F84qhzeie1E5vr9htWMf0Ws?=
 =?us-ascii?Q?nGrSOVyHRWxuCTuSLsl4loYJB/ahvQnkg0E6UBUz1/QESDU4SyAeOx/5OqK1?=
 =?us-ascii?Q?0ZAuMDVcVBDQBUBQVhgmnEljlGk/wXszqBZCgK3CHTGWhm7wGwUXs7GiqYOr?=
 =?us-ascii?Q?H3HnzxWT796KeC7w+ZNUzYzMZSFe8RORZY5ZwFshRxG1mCID2SwOIZU3ZvmE?=
 =?us-ascii?Q?hAlTmFopZzN5jQX11FNBRhFELR7O4TOikmPkyCecmD7czoctj/NzzGgRNoXw?=
 =?us-ascii?Q?Yz26319sTRKYw6fLiaxx2gWm6qoPAHbl0RrTsdrK4fA3AGUGoCG+AKNsh/E1?=
 =?us-ascii?Q?ORWT5n5ICKQfpyRTM8BmQvZIJRuLx/RJ3MIl+9dEU6EZ5sr3eK59OY7SNmyH?=
 =?us-ascii?Q?UC4n9TEgkVSPOQ/JASbadvNEkHg8j2jasdXjIn0lQu4zQ5d5mR3eaedGAHOf?=
 =?us-ascii?Q?3rocNJuolU2ivjjw6TvW6Pxw4OiG5zYGN3RS3czFYcdntHYclSpbVzCYkuLe?=
 =?us-ascii?Q?Z+e+TWR76juj2Eu2P5gX6LpDBZfCXT8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 072e09f4-5cf5-4c9c-3d23-08def8602300
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:54:52.2112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrLIV2pgBqYQdXNFN8AuJTe/hzgIi3RXC+O6O5LPe4HuaH7lMfg2ZZS20PvWiQ+Jkq9eG9t8F/xNpcjiEMT+3oywTqSRG8uL5FfzE9/rvC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:55:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243272

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

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D7be4186c22f89a87fff048c28910f5d26a0f61ce]
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
index 0000000000..9a95775d3f
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
+
+CVE: CVE-2025-1147
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D7be4186c22f89a87fff048c28910f5d26a0f61ce]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ binutils/nm.c                          | 10 +++++++---
+ binutils/testsuite/binutils-all/nm.exp | 17 +++++++++++++++++
+ 2 files changed, 24 insertions(+), 3 deletions(-)
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

