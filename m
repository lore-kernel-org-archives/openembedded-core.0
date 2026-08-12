Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6825BC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 07:28:43 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2741.1786519720345856902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 00:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=sh6kCJbQ;
 spf=pass (domain: est.tech, ip: 40.107.159.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MH7YT5MYn7rieBeCOQm3qj+ozYutijiYlg8o4WlsDlbixjikdYj9W2rqA0TwTjtH5qtZJK7xzYaVbygwJOZR+dVXjgglpg4bp3TjmcR0+caaqSGB7fKWYEvMAGavTTfZnMYocsUk+yImD6v7apcYiMRAOjPiQy6nFW5t2T0FCdS22Ju2c75ZQQ14WxiG+2bC/J+VniG2Tjo+UHkSLuvzbintQilTQjN8IK2Ez6gF1Tl1LkCGy0vdrXbMumj8JVX7MzwWjApTR2r+JkZq2CCz6M8jB4UJXnbMYfhai/+A5G/GNI5dXVcpYuSoVhM7WPJdmcARBOUNqe8xFjQd3hDi7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8EcuYzM3/fOwNIQNz2j6cPz50KFc+/v1FC08EGBCls=;
 b=LUYw/rHF3ZHVRA5qddyiSkCQppUhNA9iSDU0H6ZgtcC0dkyO2Po08u2lqZkDIxNtODPo++GxCdnj7A+sMPCUuw1k/J+JIyDrzfGBwqD6X818LuzNxWLKqa4jTYqIl3yMbfyTg39KU1gKg4rq2PrBLZeZnXj4BIUJMUYKOOTkcu71wOUK/m1Ha0+JfQJ2SOyItLscH+6f/56uL5tgdAHKh3zIu5BXUfHFxTpGdxUKT1avlTnr7JR4HON32Fs+QElAE1Ln0gfNH5ka9Ad1sF/bhOM0xiZVPYFp2iAF5ovSL+6jTDCoGy5ckC7FKn50zQW8eZYsz5RiCkloyPoxoTBYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8EcuYzM3/fOwNIQNz2j6cPz50KFc+/v1FC08EGBCls=;
 b=sh6kCJbQtZNLu74iC9e+GXSH5Jm5KuZJ1riWUtmYthv4VKALaT74voPZySDJ/vdN0wsBA4GZaKwtQcchMF2Jsb2VDx9gmHAiZEM+dpiiHx33BQRgFKjaoNflrbI2XMham5E8iv6PHTawD790nAM5bObAJPE1oprI6pVo0egrFqToHTuGpg00QDNErz3Gv0zr/wy9rkK7dNsdMse7nztzkUfQzaHxbPEHzG3Vp1x3evHTCtuk7OeTvmS7dKbIrkCI4b8Gra8DbHq9fEwpo0LIWBTAXVkp5B37rkue5iC5VPdouT6LqdidX1apj3VhMSIQvjQvHoy65qtsm3c3tDW3fA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by BESP189MB3212.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.3; Wed, 12 Aug
 2026 07:28:36 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:28:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [scarthgap][PATCH 4/4] binutils: fix CVE-2026-18220
Date: Wed, 12 Aug 2026 09:28:22 +0200
Message-ID: <20260812072822.22227-5-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
References: <20260812072822.22227-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2P250CA0029.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::34) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|BESP189MB3212:EE_
X-MS-Office365-Filtering-Correlation-Id: b004b6fe-fd9a-4cc9-64b2-08def843526e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|6133799003|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GIYCTxvZWKWw3XdlFKeeXq+aYAsfFMUAn8LU39y1yWpJzhk95+xdXVuKNDT+XnSD1CdlGfVBTJQnTTDgXtN1WtEmJaOyxcvTDRnaIloIIWYM/LSQlAlrOgSujrtXheaFec3ciyDKtKN8GGRGiyzOPVkVxEDvM5KlX1FgCTkrVpX3BrzzmXXBtn9tJVAsB4CR9NVAr8v/Uu7Cvu3+rv4dBmiI6ryYUkYCVAdp1k2YlEScW4ac/f1E/QKVVbjZwNWO1indkkywLrHn9auXxPhM8D+Fz8KzawD4D0aHj5+6mO2g5hBmbW5eiyeDEVUV5G+JRxRNM0Wm/YdQVIWvqdGXc9qE02hfGhm0XEfLzZK1OAqKTkfOeXfPfYLkaAZjKZlXSzqJwc51JpOudVn06sNwV43vjiwLRSd0l+RbXkvlPiA/UOj4aNstGQLgyFqzPdyu3W9z6zbKRvf7JBdanB5RNUYr4bfb12Q6XKMpvDm7+1eOnpyr/cRM5OlSZlU6tPzbaN8h3ezTJbCSfYocpdhl+Qxe0ztVLOrjEpg3SHeDIXV+kKbsMLYsb2SFeRatH6RUvyb2ENxJZGAesaPJ/WLSZN6ShhPczjnwL9oQZmjXxVRcisvpEbB9JWs5d1r0Bs89
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V9+PnDhx6B4BRejatt+XheKLLUubV2zsdCe4/Kk3tKYRACJYx7n0JLFwg3yv?=
 =?us-ascii?Q?Jo2Do+gWjR0LvU2zJNrdHwU72vetqA6r/wur+X8DPbreWc8RsfRg/nKqwacK?=
 =?us-ascii?Q?rAU4mdcVtOl2XedLvJjZ0GvDppLQhgD6iiFtN4ubBqFtDIGFof3PIfyIprpp?=
 =?us-ascii?Q?W2ByS2B/OaIllejO1T8lM7i1v9dPw3KQ6guwvUEFfMJki6JjLHCzBERmvwbY?=
 =?us-ascii?Q?ldtzGE3epia8Fszmd8LfOp7Os8LPlnI4nU1gkDb+8QF3wB4RsP1fnSQOsdV4?=
 =?us-ascii?Q?n6sXlbe59JbNU4Yas3/VZN2yFRQ5MAXK05Cjtp9OBSPEGj6x1ruZrkC6Zkti?=
 =?us-ascii?Q?aIkkD0ZWKyOra0KhdSkIx6eMhh6ReZuhDWsGwkAKwLb4XbYZ+hVrBgN/NX76?=
 =?us-ascii?Q?IagHa5JXPjQLTDQIN45CPfOLjNLB1OqI/0CCTW/PFpiWjSO7b8CJ7EKFHOVN?=
 =?us-ascii?Q?nlWqQx4qm/38TTTfddzFMRAkPCyhFAEsjvJwiHNrfVWPsjy3g6Qyi9Yai/5N?=
 =?us-ascii?Q?3CWyMu57IuhFdTcZKc1kRG+rIIpFYVwVQP3efnLM3F7ppeLHxoskVRYzjPCO?=
 =?us-ascii?Q?t4xya9G6vD4pFvlKyomAegONWrfuWLliWD4L+E3WbVNaczhJIlbQxJN+W5v+?=
 =?us-ascii?Q?tDEH89tJn+Z/vSUCotHNs+5ZfV16MTLIX58La53ccRK19EBhpgpDhiR9KZOs?=
 =?us-ascii?Q?DjM+f8rQc8yorT1qu6nahPsk9Oy1aQYivjA4L6PxxcVdUOf4TMj0W8ULGR06?=
 =?us-ascii?Q?HU8VKKUI/SVjb+g4hILT+2vN/RuvgyxiVqX4vSLdXt351FA9gMzIL0kX7n+y?=
 =?us-ascii?Q?q35P8Lj5+qBW9H28SOuolXEScL4rhAPpvDgt++RVCq7GKYAoDCS/xii7xCZY?=
 =?us-ascii?Q?fX6ik28hcvqckDAlHM+EI9tzgS6TVxTGzAvuGalwtQxVMAOlGGrtCNs53Gxv?=
 =?us-ascii?Q?hhd9MQQSIfkFmjvSQuOeh34DGFTGW6UvGnb78RkB8K0Snj33dMfrpM/SjdT8?=
 =?us-ascii?Q?2WoOz+soFuoCSmvmTE3oBRWWVKrGp8IwYfUhcDep/TqbBi1Yh0nnCv/cZaVo?=
 =?us-ascii?Q?W0fkJn4AC+wrr/qvdA78l0lg/pNjQ2IjbSrxBOMLkwQ1hkuYNXdBMkee+ESa?=
 =?us-ascii?Q?VcRAwsA/Zpxza8zHvESIcaHLA+/5q//0McbplIPcI0w99SSqYNHmDcji4htv?=
 =?us-ascii?Q?I5q05J3q/x8NdDoQTYmFtk7U5hlVGP2IWoHl6RDlYmgw5b/wNIKN18174h76?=
 =?us-ascii?Q?CpvYGbkUv+aIs1GIECyrjTKL3Yr6pXDeaRsnrPxfjx/ev0M+9H+jVieOotvW?=
 =?us-ascii?Q?HW9DbzJf34knCOZPqteI5zQ1JFs5YOeC1QkRr9Cgy94Eew02x0EDXz30qxQ7?=
 =?us-ascii?Q?tLdG2gtAQwhX3nzSQgSLN0MF2Zom1M2+FM5Ab8QsvjJfJAvg6q8rdeNhBACc?=
 =?us-ascii?Q?ka0dkd4c+Zc3uzZtTwWWqAsRXdCTplQ4SUzCuKK11HP1DMV1fQgBbXB/tHAP?=
 =?us-ascii?Q?1UrZPq9xPRsHYvKVJNUYRAhS/351cT13P2Hw4XHOq57sfJjfP2WDza7/Q6qv?=
 =?us-ascii?Q?QW3C5Ax56mEs2jhqE//f04n5L4eqWAYjbmh5i8qddglVRnhRCZdP2i1EXLrj?=
 =?us-ascii?Q?gnRqo3RD0x+thNYqmZ6d+Y0VpFrTzUmjzKer6uiMSHeNSuhlosaihVOowA3y?=
 =?us-ascii?Q?TvgyMF38R0Xo2Bz3rs4XTjLi7PEhBZnNSDayrGRV06HV+MlcA8O2ofxBIzRX?=
 =?us-ascii?Q?w28E/kNdmfhmwGbB5Ig1bknh+fuqwM4=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b004b6fe-fd9a-4cc9-64b2-08def843526e
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:28:36.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OaCf7xSEDvZ6hE+77xcmOV6UykF5Ql5NYaj2u1NnTQ0jbMFr+JucNygj9taQgOjgCFxWmv3wTHfaXOy67zgqUiyxMSUVR61PSipGKeD+cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3212
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 07:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243251

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-18220
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D114e3aae2b7=
e34057c8909301eaf78c15687e8e5

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
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/binutils/CVE-2026-18220.patch    | 65 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-18220.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 447529ffa9..d395ae1b1e 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -81,5 +81,6 @@ SRC_URI =3D "\
      file://CVE-2025-1147.patch \
      file://CVE-2025-8224.patch \
      file://CVE-2026-15003.patch \
+     file://CVE-2026-18220.patch \
 "
 S  =3D "${WORKDIR}/git"
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

