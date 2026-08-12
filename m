Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0862C5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 08:54:47 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3616.1786524882971122681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 01:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WDbx9gcy;
 spf=pass (domain: est.tech, ip: 52.101.72.18, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUOecbwGyOTgMxeT+DYnFLfCl1Da8TRlueRIy0CzOGaDjHl61ra9l0fdActd6Te5BxmZC1BvIfjvVy+uw6FSiwX1NR6GmXcYFYMhM6ZfhCBtL6sBOV5FnK4SUAZdzXYp+x4xtl9ZiNtMxjAX06+Chez2L31eOQc0ZWzVzjKSsXc6quKjwu23CEnzU3ca8tzh7SC4bSvhqz+REzuqvHj7FbsmHyx5trhkQU1bvG1oZ0DvNxWbhZoAuBr+t6dMJYMf4eGL0iEtNq5hLDV+IYYOvAiAB3HSt6wUsI8nTUpoY4ys85k9Sbn/mOaJhGm6nD1JRtHVhxHpHjRhskBwZBM5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpDrkQwKrzVv7lnkdySkl5J6H8qKuHYp/aI7IIpScNY=;
 b=OiDsbDgzROLZvxLLOyP3KVoF4xtbPTu9bC8iLGygpP/dW6FjebaXJpaysHrJBZDzbu28BhRmGbo/my9ElvGnrEhnD4yRrwy5fmOS6U1YW11CQ/AlpOyk1hToW/jcTmefMbnogZBaijk8UGp/LYDRUCL2G4Yg3rSw7m/AlGEYoXJOl7nqG+et2WDGmLloOMut4Cb1bqij7gNleODuxOvfGMDt5d1a4+zf+qbDYG9qHfuJWHPAubuYrcRh0wJ+D/BBBwElSYxLWiJ68LeDqOmJNAcJ/PtELP+JB9yzS2ScrwaDK0jkfN0FlBALtUIXclYOIjdfhRj4itpfbevYEAzFoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpDrkQwKrzVv7lnkdySkl5J6H8qKuHYp/aI7IIpScNY=;
 b=WDbx9gcyEmI6NFTiU8elgM3MawJWDlQJwikkOtvzyXqF+HZPr74LPYCeJ+1szx+DhaPFIYXw8QyucXL9tWYhrst2bie1QkzZtjMqqXin33E4kcJHTqK1gg3wwthE/jUo26Ar+NHKRbHwVBAV9Ki4ymvWDIvuujK4o0QR+5N19OCRSB8nM6kxQt3uNRH+Po76Zio5W9GrXsNt4aRGGnAdhbnlr+jfWXDg3DMAQk1q83luEkIoskb5a5GGcQU40GFXu6AU6NA13WtamNoDWbkThc+NFj1OK/CU2E/TnPHtIwIr76fQh/PmUgr8PFeNtjskQ3XrFPYME2XeaWdH+M3OjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB2099.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:397::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 08:54:40 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 08:54:40 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 2/2] binutils: fix CVE-2026-18220
Date: Wed, 12 Aug 2026 10:54:32 +0200
Message-ID: <20260812085432.22810-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812085432.22810-1-jaipaul.cheernam@est.tech>
References: <20260807140902.4732-1-jaipaul.cheernam@est.tech>
 <20260812085432.22810-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0137.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::10) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB2099:EE_
X-MS-Office365-Filtering-Correlation-Id: 981acb88-18ee-43ae-eeae-08def84f58a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	qRhY9Efoc/MnL+L2rtvJcH1FPKGaBCAL6i4OmVJq+zSWN6plloZgyFnkDCGYLfACJwgATAWcyN9J2LW1zry20zhkgi8XCSL7y7PEgwN4h/g0JNnqxbOtMZ5thTsA2FTZJq9jlVskqkTR5IP9De5QAoUy8STcv+VN0u83UwT2KRKxjOfuLpUoAzoD7sP64funfbUDhcem6HOb9U7jMBb40vIQyu84tF5xhK+fqvL0nUQasQpwPMHUQQphySVf4KmKCqnGH/Qwa8R3gcDam2msJ3hfoyFIiJh1inXCmcDT3Tb8NKeynO/d5lODZhHGyhhv8SJIhPOf1Yp+oyEn62A7kM4EI3mp17TkbHhWo7qFduWvKTuoES6WzN77+dilQgIFI816g0pt3ReTUgQZ864l7g/JC6XA20Uoqh3tQlVzyIxatvNIrsUSmwoqQz/yeaTCXRANxbBVMtD99zbXcb6sk9ATqHYOSKhkYAmIY8fw3Q21mx0UAZvHnmFd5VrcbeL/3+gx9/SP1YmRHSSImLSysN/ocXhJZ0jPJeodxJ4Shs4CtL+X3KjKWV9Xz76RSa9CCzyMFdczSJwkU45G6jEASD/CpuJcaswQj7/8QqCxyZlvy5BZXIZW/i6k1Mm2AuEE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?l0wP5yHh0RIqaAjkulpwQ51k+w0QLHm8iRR5ZIQfr4vf+4UEn4p59iS3JfEX?=
 =?us-ascii?Q?N8GjYAa3qvTiEzKK3GoPzLuwHoA7rWA1rcfVlWSASFYnZIlrPU9o6m/4aBXm?=
 =?us-ascii?Q?SdDnv5mhgijnXMTf6sVnAtHtFgB73JPfMx118y0ZuZfb8MCv7QZYll9NrLx/?=
 =?us-ascii?Q?vekL4WgREJ4gk+liXxeJ7Y0KqsnloM2DsnecD24qn+yGE2iv0FUs6q9t13IX?=
 =?us-ascii?Q?7fL+43qEpK75nw4Z4oj+/dsMpYDYIVA+VkOWwFFLY/EbGNAIgVLr463A6NNr?=
 =?us-ascii?Q?XK27wpBsaq+p5Nz2TzEPQW00gkaATmf+K2VX4ErAoidhgFyNSrybxgsd5YFC?=
 =?us-ascii?Q?F6mHz1X+o4wNX01d2PX2LF45mN3K/SvD6ObAt59CY+XRUxX02RIE6VaOZ7uA?=
 =?us-ascii?Q?oiakx+SiFLuhWQNrIT8kR+oSHXuGEgKx5r6rxkLOgAbfxpHz5GnSzlXegY/5?=
 =?us-ascii?Q?5sab0Q+fAcatJwGhoEGoXRGJjG95ezW3y+eRoekMDpv6YSePU0OU/LBZ37fU?=
 =?us-ascii?Q?3ksidKEcjD1CBmyzlcVXcqXhyMzQR0dTS0WDnRRcss03ThuRcLfGadk7Ry1A?=
 =?us-ascii?Q?xbenWd5TxBg1Y28WGJ+1gP/sWiJ2lbzfz6SmcxXsu6kG3QNu5VYm2N2KwBHu?=
 =?us-ascii?Q?NcQ4B8ugk67eKGttC0zSyJdS1lPLecW4QvgDVQM8h/wcKJXPIhIyaMoN2mba?=
 =?us-ascii?Q?G9kApUaKMtuy3k25uAo8PnlJVbpL6Md+KkXWViY0CZf871Yy/wLjvg8GQTYP?=
 =?us-ascii?Q?3UCnbGixjfSy0iSas7PGCTOIy289hCMYmA+7AzDz2K3U3Uhrp9n/MDF4b9D+?=
 =?us-ascii?Q?ncUJHlAzmzJniNopF7ImHmOG370v5pGJN/4buscw/BNycPcPe6wyxJeYva/j?=
 =?us-ascii?Q?mCLddmDRwvDEwo9Sx7Fy80P3TqCYiSZlDuKhiS+Rkr5BgOEu7usRWNATWtvG?=
 =?us-ascii?Q?eWlac877nXnGSaYUZ+b/hP1hclp/QqFVkVmQm3wimJVhZFzeW1syakBNXQ4O?=
 =?us-ascii?Q?WUsZnojeURaAhYjU1MiO0+feYJRl7bZeGmY+Ti9GaGuaJOtvZPdC6Lqo71UM?=
 =?us-ascii?Q?cnwcdrOFB2rBBRtIWUNAXd5Iq4F2GNikTsQQsz5H1nnXqdIfTWq1Ayl/bzJT?=
 =?us-ascii?Q?53a+0vuNLT0xTwYEr3T1a4JNih1zJMEPJZ3YjdyxJrua6rdm6U7Bdh5+MobN?=
 =?us-ascii?Q?XLDQU/AmqTZgX/fd8QS8KU9wX51eWXSam7YsceVBBD6qwwx4eoknbngY4Eat?=
 =?us-ascii?Q?K4lqlZSyyPJ1ens9GjLsQrnrbsiXgEDMRiHqVQoaHMlPBb/QTsal4D7Skd2j?=
 =?us-ascii?Q?i3TLaj0ly9UPdXeK8LHzhdcc8C1u+LedIEOj1nOacNuIwTNEcdIXnvewkwwd?=
 =?us-ascii?Q?0ZO2cvVzxyvA48ia2BbVAgzuzITQL3oFZTnAG3oa0j4vgMi8Wosi8cC/olpD?=
 =?us-ascii?Q?3l5mk14/AGvolVAE7wMherVMyFUaxocNVij7jc9uAMlPNRRlcRDzfhl9VaF3?=
 =?us-ascii?Q?em3oKsISUNrO8g/kTSu1bVAc592wZnS0k5jVg3QhMleVjkhhO2+8J75y/4XA?=
 =?us-ascii?Q?Z3PzltyE9J3sjd8uZ6wj7r7DBMp3zfIk56Q4E+5xG8u7ZNMCu0BBJV8GCE4o?=
 =?us-ascii?Q?dMWD0nsfkClFew6/avuXRfV5oYja2/t3diPQw6v5An9mdd+yAIzHt5sObO66?=
 =?us-ascii?Q?7ZE8qRBRxQhJgW45G1DBYisKihDRqxVSzXCtZ/qTDXe6PzkaBpP2cP5aA5TJ?=
 =?us-ascii?Q?sY2qsaHnFRX0UhsdAhuIGxL4/IaeOnU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 981acb88-18ee-43ae-eeae-08def84f58a3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 08:54:40.7725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbSArWWy73thkoZQ9XW5aX3f8vYijkbU++NmTqvR5bsC6JRJ8BqrEWselXUE3VT1iRJ9db7Egvj8lesgnNwmmjUp0s6CnhMye7kGtSFhAoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 08:54:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243262

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

