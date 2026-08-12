Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E66C5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 08:56:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3807.1786525006334425627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 01:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ji5Gpmx5;
 spf=pass (domain: est.tech, ip: 52.101.72.42, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcxzpLerpE1ugTPXaoyeLD4eFcOf85jkcO8kpAFR7XcD/Gq2xBNFDhWCKn0AboE7+v7zGoXUxfUoFdzCPLr9+9JKmpOmRTofO9jT0HxwNU1V0ncOUOE1/NqFLyB0TYN5mmAjAP+yyb1dhMCwneVATW/hIyavbrdqId0CtmPBrx/rho5A9DDgzzf2W8r90eVwQ80QUInoRROVmMuajxSNst+jyA27/HfFYrP23u7/w/ifFWgKHo5b4GSWg9RlVSNF75egiuOLBv/gH+KXYIyYYvCHBd2wVo3XiiUeVIi/Eg5LeNAW9hgJHUaZS1eNEtTzJe3MI+T1EI/17xV5CE8Maw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yrV70P0JHwgbOLq44naNtOZUK9sgCe0aMvJfmwp+x4=;
 b=XKj67msXl098Re/8sCvnWVFznyytoP4qlanDOynE+iVnffH5lWY3VFvkmZGAbAs8AWcGvqOCB/8iugv8Y72OXZmP2Ridv9/vntzAJiuXrNO1iz6oF5LNhl//6A+Q1rUnWjOEG4o5N7oYX510kiD+GwvAwqUtjyBYx8hob55/03IB5tiyjZgLbpZ1d9NuZ2Vkoem/+rz+qQyhnpZJkIhQoh/b/LwVxJkHmt3v0Tba9DJjd+E9eFWi0MAX2ysXLs4kNxel8wIJRNziX16UA5mNrMF6/yeceYMFeX3ncGGLXmqduslGwTWWu6ZVhsoc7TCOJySpv+ptsKkGIfBTe1tATQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yrV70P0JHwgbOLq44naNtOZUK9sgCe0aMvJfmwp+x4=;
 b=Ji5Gpmx5V098fkIDrio8gkXWQ7gz+FG/f1ps/9BhnJqI5myyUSgpW741QRo4TXhraPCgSS8Iz9eKKjvdFXm80aM/O1f5x7GwgaxODePwiE65Lpc0NXDNqio/B2rBfEuXp1m8DOYjaIbMkl/epK42zC4eHCoZiWBuVhTdJyi394Xjiy68eEKFWI72ZcZYZa6uf22hKBPG6aarYJgZDlbY3UkuomFoqN4bARC6Hirg0RSVF9jamCOnsLthbJvasMbEjWy0KbstVlog6Nck/VXDjbRp0QJOxnngvJnH4ZsY9sXbedd9t9jAnO7+9WzekueQxg+Oj0ZCRuKP+sd/Qbudxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB2475.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:423::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 08:56:43 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 08:56:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH v2 2/2] binutils: fix CVE-2026-18220
Date: Wed, 12 Aug 2026 10:56:33 +0200
Message-ID: <20260812085633.22846-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812085633.22846-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
 <20260812085633.22846-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0061.eurprd04.prod.outlook.com
 (2603:10a6:10:232::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB2475:EE_
X-MS-Office365-Filtering-Correlation-Id: 15597670-7cd4-4dc5-08d4-08def84fa1a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|6133799003|18002099003|3023799007|22082099003|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	+gRFbCOuqbn83fWQtBKFhCy5nA06hf74eBa4G7NoHRYjCJ4oYj0WwkpL4uMD/UZSoeyGjO6UdyMlyMmJlZkLmr1JxQGlUCI3TkbKvvwk1bYrWqYY3lBxgTkE17k5C5hxqrbuIRGcZE6doApACwjwx+rKY6Ukw+694cXD0/YOX3vV89s6GHckYJk8GT+Ez0WXH0DxpNWDFQ+HWimcVQH1O/2aGMW2rjNT6GWJNwozo90U6CSbUcNwuS1GFRxmxNn/8y9YZWZTBq5JAyYPgFfellf/NM4PV8lf4JXVyAyJIOeY8QjYOVqmreXNCl/2Bf0SjpXc+wshSN0QQGR3d+YA7tBaHNOS2i49GQVKGT5ngOA5xOGhcwIb5CbLXcjaaOHhDwWeZJTyUkZVfXvE2Usec5S9Gr5upqJk2pOGTc8LCBxWRYsRQoxYqiYNpTd40t27QQqhfKPWmp3rJd4FdisKCtTLfsohw3KOgC/ed/1OWoA/uh8omysbq4nH4jg6ClMlrhHNCko7y5K5SkJZbWu2z1cz2A1M6rMFDXxEzt0u2D2mO3yiaZR0NCd6BQg/oYX7iV/kMBqV6PnJliCO9djXTsLdAaQ4XtiGocdOL2D6z35wXlY5176dLx4RsuoE+UdZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(3023799007)(22082099003)(4143699003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YWEFBrcBaadQoOHzEwD+lZc/a1aCUv4VOPjpZDzXgPxBeG8MWfLV71DUGUOS?=
 =?us-ascii?Q?CAytelLzZzQG1rCIJXi/DBvJTAaoKRiNIHMiB4s765xzzE+eQKR9H0u823B6?=
 =?us-ascii?Q?u29kaL/R8xcrjg5UrsSakG36y+9PdPBEUpdBmONXWHIG50K4bKhLPbwGZqww?=
 =?us-ascii?Q?xv23biXnNGTq7wJs3tGegz/3Iuzq9im9O2rB46GJgcEFVEJU5HGnL0TQQMrU?=
 =?us-ascii?Q?GOgq8U9T27YRmi2+Fg8UXjtWAc/l8Kh28pILQ1k6XUm/S+izqU3Tfe1sX5uL?=
 =?us-ascii?Q?3nlx7DC/Eyuw+Q/G3kBQIwNkQt7ONZ6bbbpvik8EiYLfHB/KPUZ2DL38XxcK?=
 =?us-ascii?Q?s/SSBhl1URoiqAK9vOqxKXGv/7564D4mA6Kad5hDLih13S0m+tH2p5J8WJw/?=
 =?us-ascii?Q?t6oV+lBGInTs399CDR5hAxCSLh4TMkFuAHiJd/30WGzDc1R/b3NCfjto+83r?=
 =?us-ascii?Q?XjXmjtAslycxo3L1FwwBvT6iuif9zxqigRya8RkRVwlekitULlg5S05cQyhC?=
 =?us-ascii?Q?C4Vcr67jdxRGa8sNSW7LJBxt6rh2badscpPf+a0wYJw/+5x1HNj35CLVEHLW?=
 =?us-ascii?Q?T7wgWfxnq132M5wovu3iqSnOhD/x+Equp17weTdI+BRXwTOyrCNMhFDTMc4c?=
 =?us-ascii?Q?41v6u77ioo4Xsb9NKpSzElGaiaEYY9KcPUB0xVRI5qXcQkZ7DyReD5QPw0Yo?=
 =?us-ascii?Q?tOadcDHACuoTC6AUqkGMKBAaDvaa+exx67YXlQVAOhID8bgE3dqRg4pwvqqo?=
 =?us-ascii?Q?hnVA1i694JrvOEqx1/ESm+oa913uNSuIuP8ydRbPmS+UP3qHNy7ywm9BR1ab?=
 =?us-ascii?Q?hiwL3VUbRQm0cd0DvNuLg4+8KLZANACmmgGhmAjEkhvHq9fX72S/V742BLnk?=
 =?us-ascii?Q?5XWyfhvuM5EX/at7TfSsg2V2iKvCOGtY2KB5RhEetN59k3fXurJ0oxhGhf1P?=
 =?us-ascii?Q?SNCsZHnSmTrJRPdPR1GO0wB+8d4A76oEKXW8fO+GtXclUJh8c4XOPxJJiKLo?=
 =?us-ascii?Q?sRmtq7R6YXYCE8wMJRtvNfspY1TbjN8QNsEjn8BvKcJpBT06Z3QUqFZg/0Oa?=
 =?us-ascii?Q?q30KwJBybWn64eJfssJtStScVMtceb9dgI7Z/UDnI0XyLadqkVxewzaTfoFt?=
 =?us-ascii?Q?r+qXtHdmDH953SvYqsaS8MGiyNqjYjyqUXMr/TO1kVL6ahA9FEs+YIN8+cPW?=
 =?us-ascii?Q?72ImOHOxHZqZyB3LtidSOQua5W2aqhe4QkYHdoug1pYy5qF3uj3Z9AedycNB?=
 =?us-ascii?Q?H2FZ2XIkTynzmNOZ1wTncE+Ph5lOo5ec/3+32BelaDTYMTDfc08SiZ0MxKfJ?=
 =?us-ascii?Q?nCSoSseny3FjJU5adp+uYAK5KKJBh5oAGInRxQR8TPVD2YIhql+Q0/wSjzZP?=
 =?us-ascii?Q?/U2/69pNmIfqXBhQGGRhPUGBbabRJdQmnh1NcaKbB7bhuznDzbfi0c6mUOk4?=
 =?us-ascii?Q?cg2kX88oX42EUnPGibQCbKTPqupc2jtAYLABs1vCRvvCWV7ubyyhyrTOpfPA?=
 =?us-ascii?Q?28DglINAfcQOS02SSkK4GzttVV7Sk0femyBTcILVd/e0FFBYYB8nRVzPqtQ9?=
 =?us-ascii?Q?msXm3CqftFf3RgNoLXpPFdtEADXo3D4c8u5wIabuyf2TvVD1bSvizMRX4YYb?=
 =?us-ascii?Q?EcGDCplAi0QJzuYIQ8ihtJwZzLQMJwrHQFnkNphlg24BacuFqYVl6wzwT+dQ?=
 =?us-ascii?Q?3gB/9aZtg/i29Fr1yvDxZYqSDuFMynxK/YIizyaZC9+Lqxk+Z2X6IHDuflDv?=
 =?us-ascii?Q?ECdXvz6QAo+2q930dhCNFSGSiFcS2j8=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 15597670-7cd4-4dc5-08d4-08def84fa1a6
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:56:43.2649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gS02jE2ueWkas29XG/zCKvOOO2uSgkD/HmMGqXfyajFg+VD1mfQCOABwmnMSd5fSuSa0Z3mgRNMZRgmoaCnSEcZWZHmAbtj5VGCLtsgAoFA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243266

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D114e3aae2b7=
e34057c8909301eaf78c15687e8e5

Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.git=
;a=3Dcommitdiff;h=3D114e3aae2b7e34057c8909301eaf78c15687e8e5]

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
index 0000000000..e915fb223a
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
+
+CVE: CVE-2026-18220
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D114e3aae2b7e34057c8909301eaf78c15687e8e5]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/elf32-dlx.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
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

