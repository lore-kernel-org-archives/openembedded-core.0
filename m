Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C7CC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:29:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2747.1786519755355944457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vfIYgo2n;
 spf=pass (domain: est.tech, ip: 40.107.159.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJg2vg5MPhdJw6iItUBvI/a67EeCfoF8lr2taGh5NO19h8kViAIQ6lU3L0ekAu/zHU+kVpSuANxvUEQz8RjXr6I9sfx6RBW7SxbfIfxB+rLLlI3dgzsLG3yy5AVMbvoNBB8thcdHed/sQmW1tCl7BtS+Tus6eP+58uWHdjw1rlsHCr60Xy962+yIcO1KLiOch08UuZfT0vy2koYjuAwddo+htRbwOLcJ4b57fJWj7Hinhz4ZyrTheKtVjps327iWoCL8BZWa/ZWUBAy1hXulcxQu9JBzw5z7qTmy9bMul9KwVLbKj60StQvqsNLDqAOBooIv9YJHO4FJiYliH3uu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpDrkQwKrzVv7lnkdySkl5J6H8qKuHYp/aI7IIpScNY=;
 b=cV/dw4T+qRh68Eol4Pl0/5hQXr4LTRFq2EvlCuDB4wWOU0SevqLrz/QItQyDcx1UCHNT2/SMLuW3e658vacTPwKNjiGteygUapMMeOk80bJypNs43PHLVNGVtfe0/fIM302rtPexGRkKvNY8qC8eBuBWA7UcYZdxTddSBQN4toXlKo1Xr+UCutud2O4PWbpm9sa3N5jvOG6AxxfZqY7kn8fuOZz7NiFGZCZBZhHIHFyWHr5YBoZG1f9HCYMhwr5rHQdCMUnXRVAPASkbWiuIVQ88pVw7Esgo+eazrk3OalYpk9dxjDG7IyVxfT4PX//+Cpp60Y+jA0sn/Gw4WmibDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpDrkQwKrzVv7lnkdySkl5J6H8qKuHYp/aI7IIpScNY=;
 b=vfIYgo2n0IytyLoyV5qsEEU6p+/bXr6ijJ2Abjxc6PMocnMyEBqDJo2J/G5B7UffTQggY8qd6PgGLqh/Y670l9aNkQyjSUuTxLFY6uQR/He4QrxLSZe/cpbghEUUlOwgbYIqU3lVKJPC6Xsozhr2hZYW1chnqB4M6r2MoaEQHV0q1p9Zflz34Bqbj89Yoq9vlIlCzdWSBpQXNaaQWV9I9u6l5cX3K5aw2J4XH4y9g3rS0oBE1bL7Om00r0dIKCMGmc8ziR8+HLP83ai317xPysHMJ7iTfwd6dm/kDdVGbF7jTVx0z9N4tLQkSgaBTbKLdHI6I+rnk7jsWD7+6bpf1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:29:15 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:29:15 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 2/2] binutils: fix CVE-2026-18220
Date: Wed, 12 Aug 2026 09:29:07 +0200
Message-ID: <20260812072907.22268-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072907.22268-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
 <20260812072907.22268-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7PR01CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::28) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: 936bb5e7-9b72-4494-66f7-08def843697d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|4143699003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	4nsQ5lsEf/fKjncH0LPEv4eGaYgbsu4UJ5QmFrKkcWL5fy2MeQDSUeYyOsxTENhrAY9NhfxQB94RSWIJCC/Hx2eeDeLCsRVkYmUm8bgv/hciv+qhFlEyptoM306+9MNXzClI8vBTAqj6qerPgKgDHwiS/C7vEYU6nlY157sq/feGmqYxkBonb/FrnNVgelSrd+vUXPE9HnzAUB3h1vt2mfMQxBMk1F1emc7gM2+4ar9MkP/Br+CesdYfEH6hTmZi5P4KDsSZ1XO2CLMZNUWFspSHoR9VCGRLs6H7D5uDQu+tFocMWPPZxtl8QfqrF1r5MRYc/APjgPsq0bLqyNLIpnNHSifFUuGnIc9Mw0eYhUnUFC189vLbQ7S3CHPEtbdLlBadInFIZDXXWFTjZBzEMw6bm49EhiJlgtjyFKi7c+oRFV07ZnFOSVFIJffcyVCKT1XmjIQ5qZtzJ+KS8VFtv+TYEiBzfTJftqYDQ+yC0wMfA9z/qjwlY3T5CUiVpO7CO6ZbPlna4fV1Wt4/rPZNtIJC7aOLnwCwzY/quqkyT6h7SxBbV7KD3MdTPlKUc+j2XUuolP7uEtohpzEE5BualYUFTQ/309iQWLEdACBtl/zMck7QiEFsnJm/TehkfNk6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yeTi9/vHW65v7XwyCnmI40Iiwh+z3dqnneSDheoZfwkyjK8gI2MeYMdXoxYt?=
 =?us-ascii?Q?LyvjBC00brZi+X3m47KhEaO5zdlxCOiBr6ng6dnH0bRhF2Wd3IEyQDg4CjkS?=
 =?us-ascii?Q?ysvyg4NuLz4y4Ia0D5ief15czn0On/Z7445bWDe9/4yAXQn8I37kDtpY04qW?=
 =?us-ascii?Q?NTVkKdbdFg1uK8NJnCN9ZoGZerodVEpJxNvohu6BYbBdSN3V1M413ZHWSqUv?=
 =?us-ascii?Q?M5I+tJ0u5h50jzTKx5KGXOSjx7Wqb+BzwP/RfWxUy6ho3r4vPbBtrOqEcwRs?=
 =?us-ascii?Q?yqBLlE8jDEFNhIJLJZDGwdWTC4g/5/Ey+USK1X293fivG5PMNeGJtmRjg6Nv?=
 =?us-ascii?Q?HGRElknEWOKLzDcmavfgF9MpxyhH/6wwW341X+c4CKKPvZ7CuBbdosV9h3aj?=
 =?us-ascii?Q?bNFohL+MOSCqMgOw8GFkkT3mvogjRu8jqTu+1tvr0clXaLMfwJxioj+YRolV?=
 =?us-ascii?Q?ui3k6hXEq9Ie9iFsf184sTcRQaJbrylxyyAgio8zB86ZpHu60f4v3pIFholX?=
 =?us-ascii?Q?qdID2jOaj4CujyJQJgEaz+44rWnAMMXghgtXHT/WCVekO0HISP1Sp11s+tp3?=
 =?us-ascii?Q?m//LnNU8yBHkAtHuyqvhvYy6wop+sDyp+QvTSQd+/HSW1enoyc8L/TG9sz0x?=
 =?us-ascii?Q?00hdARXKqHiouGWiPvPJH6mOk3zQtWib21rboZ5zHuMSxudNRaLPj9H9mpjk?=
 =?us-ascii?Q?wkfdyumQMFtW0Ewg6uBcDJRs0kh0l9Tnt4YFaBburQo6J2Xop6j960fygTBP?=
 =?us-ascii?Q?AyPjYy8giupkKLBIqcW4PuXKtYbB5B6q+HoWyUKvY87FryvVin2tGwuWs6Ss?=
 =?us-ascii?Q?5F7I2RdX1B4RqqkW+AmOKae5/basW/pAhlpN7G63UkTMyqUQOgQaJ02p39sc?=
 =?us-ascii?Q?Tb27NoTKCkKHdR8g9CkGXKyCGGXywHoYqZ1ZJML2wycnb4jg0urQ7nIuJCaj?=
 =?us-ascii?Q?qDRqbf2IpYSiXTCJAvyiY1lM9PFMDvKVxpFz5VdAKEK3QeH0UCmKVaDtE8yu?=
 =?us-ascii?Q?O8HWE4I6fSC/6S7P7CKr60VUbm9tA8cYsLfRxtxJSkhgoedY6Ciu/z72ndH8?=
 =?us-ascii?Q?abG3jK+TlNGzchi1Sg0woDtNTa3VzRamOF68aMSca4MBQoQxDTuWbaBfadMd?=
 =?us-ascii?Q?EiGbzLpYNHSdiNsaZYdwePzwrN5xCDWL39sA8C1ZiIraGE7BlQiaCxZnwFRG?=
 =?us-ascii?Q?RmjSOMN8ZITDtom+me2keF0yKPehVBn6sZ7U1oe53LE+M/e8I0P0+JbqM5w4?=
 =?us-ascii?Q?1viK4jiAv5YqvmIJhjUpG3lWfCMvajDWJ0CaPALkCJLNAdMC8Y54VCtLT7sK?=
 =?us-ascii?Q?Q+6M6zvGEcGeHX1N01YE+j5gz3RhJrjRnpBqLp+AMNvK4PbnQtIo/gZZr2CK?=
 =?us-ascii?Q?qIpr6ugg0pZJPphFSA4xvz1colq94yWeROkC93a36yFva6KOrncTQyeFBUOU?=
 =?us-ascii?Q?PSIinjnkbNaNUN7D9+ocyf04DW2ylCGzaS1QmBx/UdC9Th02Aco1kU+mylM1?=
 =?us-ascii?Q?k3Shjh8M+F1NPfc77nS0N/ZGuPBTMTDGPI90HcyV7/wQqW9iPqUHDrpN6KPh?=
 =?us-ascii?Q?L3XMUewDlKKujxI/FR6loHsGfQvzH81egY4NpNbVSRkOY883DuB79d0Im4O2?=
 =?us-ascii?Q?MHrzFIIynREHBTmwcphSpuuAwR+sOWyg6r64x5fZ8T337Nw3/IvRAUpFdRO1?=
 =?us-ascii?Q?2SeI50SuSU5nZ8zs8jNSU2p9fG8mRUvvP6I0fl85Ly7jvAvWVEXIbi36zaEH?=
 =?us-ascii?Q?luYMYCqtHfBHv53DwO1rEw5YUJ7lsoQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 936bb5e7-9b72-4494-66f7-08def843697d
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:29:15.1239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: it22NIXpv3aZxhayl1GPNHeirGcJ/NUh8+hR0KBcNZNHs+7RP7JI3ChXkFV31j5UIYGaCZT/ywJgQvoiImwm5+oYY2FR+/ToyYde3irU0lY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243254

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D114e3aae2b7=
e34057c8909301eaf78c15687e8e5

Test results:
  binutils-testsuite 2.46.1 (x86_64-oe-linux) - All tests PASSED

  binutils: 327 passed, 5 untested, 9 unsupported
  gas:      2091 passed, 4 unsupported
  ld:       1899 passed, 7 expected failures, 20 untested, 109 unsupported

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-18220.patch    | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index 177ae04ee3..f8d926b22e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -41,4 +41,5 @@ SRC_URI =3D "\
      file://CVE-2026-4647.patch \
      file://CVE-2026-6846.patch \
      file://CVE-2026-15003.patch \
+     file://CVE-2026-18220.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
new file mode 100644
index 0000000000..36d4ae28b1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-18220.patch
@@ -0,0 +1,65 @@
+From 114e3aae2b7e34057c8909301eaf78c15687e8e5 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sun, 28 Jun 2026 09:11:46 +0930
+Subject: [PATCH] asan: buffer overflow in elf32_dlx_relocate26
+
+	* elf32-dlx.c (elf32_dlx_relocate26): Sanity check reloc offset.
+	(elf32_dlx_relocate16): Likewise.
+	(_bfd_dlx_elf_hi16_reloc): Likewise, and remove ineffective
+	existing check.
+---
+ bfd/elf32-dlx.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D114e3aae2b7e34057c8909301eaf78c15687e8e5]
+CVE: CVE-2026-18220
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+diff --git a/bfd/elf32-dlx.c b/bfd/elf32-dlx.c
+index 2dfeb4d7390..0f9a49695d7 100644
+--- a/bfd/elf32-dlx.c
++++ b/bfd/elf32-dlx.c
+@@ -77,6 +77,10 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+       return bfd_reloc_ok;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   ret =3D bfd_reloc_ok;
+=20
+   if (bfd_is_und_section (symbol->section)
+@@ -89,9 +93,6 @@ _bfd_dlx_elf_hi16_reloc (bfd *abfd,
+   relocation +=3D reloc_entry->addend;
+   relocation +=3D bfd_get_16 (abfd, (bfd_byte *)data + reloc_entry->addre=
ss);
+=20
+-  if (reloc_entry->address > bfd_get_section_limit (abfd, input_section))
+-    return bfd_reloc_outofrange;
+-
+   bfd_put_16 (abfd, (short)((relocation >> 16) & 0xFFFF),
+ 	      (bfd_byte *)data + reloc_entry->address);
+=20
+@@ -143,6 +144,10 @@ elf32_dlx_relocate16 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  =3D bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment =3D 1 << (input_section->output_section->alignment_power - 1=
);
+   vallo =3D insn & 0x0000FFFF;
+@@ -206,6 +211,10 @@ elf32_dlx_relocate26 (bfd *abfd,
+       return bfd_reloc_undefined;
+     }
+=20
++  if (!bfd_reloc_offset_in_range (reloc_entry->howto, abfd,
++				  input_section, reloc_entry->address))
++    return bfd_reloc_outofrange;
++
+   insn  =3D bfd_get_32 (abfd, (bfd_byte *)data + reloc_entry->address);
+   allignment =3D 1 << (input_section->output_section->alignment_power - 1=
);
+   vallo =3D insn & 0x03FFFFFF;

