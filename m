Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF08BC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 10:55:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5121.1786532095724458653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 03:54:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vefwWANn;
 spf=pass (domain: est.tech, ip: 40.107.162.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQ7+kry0sNR/ArdqIZWV6YBPS3HafWfhkXGzfNVw+KXj5C/b6xRUMxwzZukDfzOIXTF6fuUThcmnDaJs9ctUxtj55Hi/9zLf9MpZFBNDPnFflLtIXMfrhOiHrjuKktiNbpNDC90hxe+HjHaY2kdAGxH96Fy7vjKmPU0Ge8IrYHJPbpcacOn0lqEHTwdhUnYsn7PcF++KSErqZyCoMiaMdGeu8R5ekScPiCQfpAEGhjyKYivKvAkvd4tq9Uw/59J6A8jmeY6XzNV7Pk7AYJyY8K+8SresWpMlg+uNYIn9yzAbd5Uklgwkcr8WGoNHpsuvJRYQLgXWB4S9MOi0ztBgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uvQKDsLWRD0W3UDGOCq0Nr8jdgQWede8TPpxnWi5y0U=;
 b=TsqtAW7/9sRY3LvqYi78cXfL6qJSVcF7nwODLhGT6zVThFq0yGFpBpIXxCrTyLykGnYwV14iqHnJtGQUyfhmhNgLyH9nu+qJU5wDVJu9DWRvwzYOsbjEs6YhS6py6GUO1RevoGM74/UVNqaUOWDBr2QLV2SufW1laYpRtgcFiIxwYkjWRNg6Z1sQ0h6dWGt+P3j5bm8+5pth6MeLTzPxZBd600VAVIJoyYVpuIO3wkmeNGZeRLKx7nso2cuW0wyKbNK6CyJ0Mj4Llpl4GkVEvufyLrCpkGGC3su9+bnNw1jCy2afJtX/5QAgBPfvOy5RGES5HZdKULirANQwKSuiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uvQKDsLWRD0W3UDGOCq0Nr8jdgQWede8TPpxnWi5y0U=;
 b=vefwWANn61i7qs7K5tj4kL7ZsOYCx5v0Erx6mBXNsbzfkcVHpEnaAylXALrGaGeUrmNi0mmYldrrNjj3rDEosv+RJS0gvBIqo4YaTwe4KMLAmx9+sVOIJwIIWDcHiajBEMl7EBTzkojp7A/X2/bkcLZMAS4ocfD2MsWvbPyr0lIrAGKLuAysk+4xfGN7zeRXqbGJc337OS5yM+BGRNf8Wk25E//rNZ78falNl6/JR6/VACxgcl97pSjYza/S7XX+nhk6PFRHoEvQ31LToL/2yr8RN2NAzeREspawplaNagBcET46kIYrUXqfCwIeFCR6Y75VANjijgzwVR+yM4ibHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GV4P189MB3581.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 10:54:54 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 10:54:54 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH v2 2/4] binutils: fix CVE-2025-8224
Date: Wed, 12 Aug 2026 12:54:43 +0200
Message-ID: <20260812105445.24234-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812105445.24234-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
 <20260812105445.24234-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0140.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::13) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GV4P189MB3581:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d70453-0ec9-49c2-2c12-08def860240e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|56012099006|11063799006|6133799003|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	4Tv8AuqbL11YIEE8RSP6oaXPFJZGRoHJy8vZttyEZtRf6u/XKoSCtbDcZcdg4R5OIOvGXbG5GlaqTeosTEoxNir0Nlil6Z4HXKOVA737pN1YaQmA4U4vAJ3RniPknxkTj5OiwE6KqHhKzukXD25m3GAosOo5HtqZuhy/K+F8Y9EwRLJC9gqX+qVcgXNBSdrvzyO9KKYdU5mvyh99A6Kg3SU4xR2otuw2AvcbZk4rAI8jt2a6CrDiitn/NJBB31SA7juwWuc/Xm6pYiulpzaCEbrEhEx9NYy4Yp8kKhO72DqX9cAFzmHzoEKCDgBoCxrJlc4Q/VSKHwd91ph9CmwOlL29BvTxFYWtHOOv97LJyQNSynpWhPva+FyxSkenXJWXPaoYOXns6tDZ3srqS56dtjpSFIQ8ZSNbB4KfXlB0BcMWHwF+LqPFA6N2p+hpKEE1q3dm5oD2tWUxeF0DDEOv/sb2l0r0v42i+v41Y7rpqdh9bHSMSSP/HhPn+I0/7Mhyxw9HYUMym08rthORzI8jEdpJp2zIGg7kOAlJ9SRq9dij+evOVHc8Xi4f4TRapd04lviXYGtuFIKN6xkdAfJuJE7Dy9Nb7MYN9dVeVcguVQ0Otyq7/r1O+yd9mhasROqM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(6133799003)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?56JBVuNYI/8CW12gWeu8La6WQGVkN4Tn/G+52iQ+R4s1ilEEyFmeip3vbQp8?=
 =?us-ascii?Q?p9Qp/ecKs7kdXSy1Z9eh+yHXOMRlZBBPZ1nsU2uG043RGB71DjH9uqkpRmCo?=
 =?us-ascii?Q?K2Kzcqs9GH6rUtNxnGoRZKgDSgZWxi6W8JDZspFTOm386Gu+iUHWKYCKWzUR?=
 =?us-ascii?Q?KEnHrpOMw+Dyq66T1WE2KlZTcWjXuPsnA8XFUEMAFYoeWzuX0H3m5b9MEfk0?=
 =?us-ascii?Q?s7V5OCdxVHMUwZUwabXH6mRZUlSABwbNtemoht+R7Ki40tvzrLC0UEgCYT3W?=
 =?us-ascii?Q?XWKTta5ub1YiZJT0Zkw/3N0k1B5Nt2nsOAUSRPDJIeIRKz6Vv/6KIKUeV9DW?=
 =?us-ascii?Q?xQnT5UC7SoplMHNelzc5yhsKFuKDg7YufFyVi9fjdQkqRjmPjXfg7mBFz647?=
 =?us-ascii?Q?VH0JcO0M+JpUUY8D4jDV05w023g5rvklCCAhWRCXMFmYxD/lHKMwrcNjE4Lk?=
 =?us-ascii?Q?M5PGNSg5R9KjNb/kGZCHrpvBU2+BpXM2O3fXADPCoSt15ceEKYttiX0p5TGG?=
 =?us-ascii?Q?TlSu3nl9AJUVV1AGfUODup2PBT+0GztN/7ZXb3TLDhLdVdmilRTlWZuJRtMU?=
 =?us-ascii?Q?JKQXORReFpX0CmQFL1Ej3jxeQXu1jKSaB2YBYTKBppfqp+vj0DjqVWVHDDcU?=
 =?us-ascii?Q?f2NezYloA+EUoiEwNtncrwuG2+fbsSKUptVvHZTHgjlI5sq0Tao6FzCbRcY0?=
 =?us-ascii?Q?JrBLgyTJfOoAWz3uzNpk7D29GcXCsl2OOpGSFYZ2vOeskjWl2zfTxEw0nQJA?=
 =?us-ascii?Q?w+OjSV0AYZ9YpqYIkmuIazFFBforUxP+em+kJzNGUmL39aWxhICBvk8gduVt?=
 =?us-ascii?Q?mtXNSoAsF5LIJMz2ILevUY15JWnx61gTE465ogQDvvi+ZBxYdxiU55VgFyFX?=
 =?us-ascii?Q?L0qygS/wqjaY+oKFXaa0oa9trqJFm8bNhp7E4IRuUalDKNi9fyG0O6p+t6fr?=
 =?us-ascii?Q?aFdgUugCXYv5YTJ5sf4N7S+1vHtV1MbRgYuzuGkiFApfWgBaRYs8pJA7CVEj?=
 =?us-ascii?Q?br9HGmD7ye5dxNNC84Ok//0NH+KSxzcP6wAuRiFsvEGLwTjnOXrGb3ELpSam?=
 =?us-ascii?Q?RbfW1Wzi+aFSfvJruR1we8ADpgFVpX5QgSBU2aIp6NfyKjE3TDjEt2gFZu5i?=
 =?us-ascii?Q?YA1b5nrRRctzbh9G74Vuc3Zeo3SzMjaqxt6DhrYXYKEe3XFhzlGQH4EAp3ti?=
 =?us-ascii?Q?l5vLCX0S2jwnzdOiUpMM7UCrN/aFVh5WFh8mFuE8fjeK2NJa4JjayJ5GNGhd?=
 =?us-ascii?Q?dOOhVp9JxObUK196aeDZHku/r0cZh0ARhklnqHzg+woUubzP2nTa2gehGhL/?=
 =?us-ascii?Q?fD4eqtyytbvGdddjyHlGAMc4D2thSRiZF5/jqKY9jJqpp/kT8UxZctLKgeOb?=
 =?us-ascii?Q?touq/GJMehZAV95orcp6hSPrAr8GM/o9yLITxs6ZRCamBtd9toMq8v5/91Fa?=
 =?us-ascii?Q?6/0awVMKuOzUFuQNeZOoDwRtuTSecW9azKSnTbLibvGqP7lGHEyV524D5d3g?=
 =?us-ascii?Q?9R5ryF3aa37RFATC9R5HODLSQW7faBvvHh7yj/Z6OV2gux32PJzSnUHa+Yqa?=
 =?us-ascii?Q?ia1hwmwGK+7YJABhd78HCNGyWpaOqV4qkUaXCdmui0ymvukQDnHGJ7I75gCh?=
 =?us-ascii?Q?D/lE8UJYcrjLHl3bvwWwVJE8tNfcp8jLlce0bgwZXFf/lxMGE1YBv47hUw9N?=
 =?us-ascii?Q?D2M55SQXxnl+12cNbFj2jt+g553OSAr8CN1mpCPbBHst8n8ClUTGd/QeRLpl?=
 =?us-ascii?Q?Sfu3HEv3jwxggJ7LNOuWb9TVYs0Aqsc=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d70453-0ec9-49c2-2c12-08def860240e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 10:54:54.0237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lcOqs0zdGB3RuUPwkXMC3E6zE1KfRA9QkxnJgmtCOx5scl/MWbgQYwK0wo4hPNe+p5UJsME3/i0JAsfsx6CqalT7RkQP+y1pwtDaNGkm6A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3581
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 10:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243273

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-8224
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Ddb856d41004=
301b3a56438efd957ef5cabb91530


[Adapted for binutils 2.42: only the shstrtabsize overflow check in
bfd_elf_get_str_section applies. The second upstream hunk (DT_STRTAB)
does not apply as 2.42 already unconditionally null-terminates the
dynamic string table.]

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
;a=3Dcommitdiff;h=3Ddb856d41004301b3a56438efd957ef5cabb91530]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2025-8224.patch     | 54 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-8224.p=
atch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 063c6cc2a4..5534ce577f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -79,5 +79,6 @@ SRC_URI =3D "\
      file://CVE-2026-6846.patch \
      file://CVE-2025-69645.patch \
      file://CVE-2025-1147.patch \
+     file://CVE-2025-8224.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch b/=
meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
new file mode 100644
index 0000000000..914b9084c2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-8224.patch
@@ -0,0 +1,54 @@
+From db856d41004301b3a56438efd957ef5cabb91530 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 25 Aug 2024 15:20:21 +0930
+Subject: [PATCH] PR32109, aborting at bfd/bfd.c:1236 in int _bfd_doprnt
+
+Since bfd_section for .strtab isn't set, print the section index
+instead.  Also, don't return NULL on this error as that results in
+multiple mmap/read of the string table.  (We could return NULL if we
+arranged to set sh_size zero first, but just what we do with fuzzed
+object files is of no concern, and terminating the table might make a
+faulty object file usable.)
+
+	PR 32109
+	* elf.c (bfd_elf_get_str_section): Remove outdated comment, and
+	tweak shstrtabsize test to suit.  Don't use string tab bfd_section
+	in error message, use index instead.  Don't return NULL on
+	unterminated string section, terminate it.
+	(_bfd_elf_get_dynamic_symbols): Similarly terminate string table
+	section.
+
+[Backport note: Adapted for binutils 2.42. The upstream commit targets
+a newer codebase that uses _bfd_mmap_readonly_persistent and has an
+explicit unterminated-string error path with return NULL. In 2.42 the
+code uses _bfd_alloc_and_read with shstrtabsize+1 allocation and
+unconditionally null-terminates via shstrtab[shstrtabsize] =3D '\0'.
+Only the shstrtabsize overflow check fix applies here (shstrtabsize + 1 <=
=3D 1
+changed to shstrtabsize =3D=3D 0). The second upstream hunk (DT_STRTAB
+error_return -> terminate) does not apply as 2.42 already
+unconditionally null-terminates the dynamic string table.]
+
+CVE: CVE-2025-8224
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3Ddb856d41004301b3a56438efd957ef5cabb91530]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf.c | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -285,9 +285,7 @@ bfd_elf_get_str_section (bfd *abfd, unsigned int shind=
ex)
+       offset =3D i_shdrp[shindex]->sh_offset;
+       shstrtabsize =3D i_shdrp[shindex]->sh_size;
+=20
+-      /* Allocate and clear an extra byte at the end, to prevent crashes
+-	 in case the string table is not terminated.  */
+-      if (shstrtabsize + 1 <=3D 1
++      if (shstrtabsize =3D=3D 0
+ 	  || bfd_seek (abfd, offset, SEEK_SET) !=3D 0
+ 	  || (shstrtab =3D _bfd_alloc_and_read (abfd, shstrtabsize + 1,
+ 					      shstrtabsize)) =3D=3D NULL)
+--=20
+2.43.7

