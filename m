Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E459CDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:02:11 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42282.1782133323590637266
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ewcPgK/N;
 spf=pass (domain: est.tech, ip: 52.101.84.38, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5jZhlpixJRm4VoFYT0HhXzWBx3oTumEu5h2t18+TDDkk78FxGJUuynbg098w0cdtWuURXgZEIJn4Ja8Q8TChXPJcXJN7RYXdwybfrYgJ+1Z5flXTjKM+DTwXYUhgC+aZEQGP+T/K8qJGrdG11fXOOtt3na8Lp5KhSYPeubDRY7/bPireeLr7boFoHohD+dzXfbsaSPttOhHH90OOm/BhWUmXX06JdZ5q7ErmJML9MNwtOr1c+lY1s0ySfa35w5q9Fn+rfqpBfP2ZrdQBgorOCSNTtGQdy+ANEereUWID9T5W9x6nHsZMD2kUQBbFgod9+k0I7Cije4KJCoKmy6bKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eE3XJB9PYMVEwJcCx/z1dO3Zhi3IST1wRBdFDb62js=;
 b=MLW5QfmUPz8yHARVimM6BAw0RTJNptHGdzY8NBEkF0UiLGinXYXm+OgOMut6QC68XEd+4tGxvYRtMhK8InTQDLVqdgASAt2LuRVI5gqeVIRAVR6esKAxqJZ52jwTjytuS5/MABnSXMxoPXIcqm+jZbrG8NDwxRn7MNruvbZb18ImRrEhS+jKHIsSW39F5nsMQTHGTaOYBCp73rvNEBNIYpRsViI7pcygVBb4IyCGngyCAm5Ujcz65fgoVLmtGE7Yw4pfsXnPCovyYCDqVEi864NHTBFkgSqLyQvWEk5Ko5UBz1hb9JVSS3RWmesQ/OjGSwiov1VmZRaA+Ca/A2p+9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eE3XJB9PYMVEwJcCx/z1dO3Zhi3IST1wRBdFDb62js=;
 b=ewcPgK/NZbCrHb3y2XLTE4EFFkC9u8fAqVRXmnKKW9MUoWdkmSC+mXDYsJJ369NDctRbp6KJZO+OCmKwinfaaL0lqvy0V4pf2FBltOr12H42q+kjWwkan5ZNYWubXqCTeIQnSXhaOYbsB4vdHv+ViFJhm9e/2Tc02CsHybqri3t8nNTh4GlVGK9IM42KC8ot93fRarei9k/9yvWd4ja3j5UrjGj7XCyVUWZ3TfKED9UksRLliQFYius2Wd+9j0WrL5iKlwoOF2GQWe1afypSQ3oxYVLRrJFIgJj4el0tb65btLC7A+tq+BpgnLSBVPqoA+BAcikFDxNWq9QxVEq23Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0727.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 13:01:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:01:58 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: spushpka@cisco.com,
	jeremy.rosen@smile.fr,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH] binutils: Fix CVE-2026-6846
Date: Mon, 22 Jun 2026 15:01:53 +0200
Message-ID: <20260622130153.23491-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0529.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0727:EE_
X-MS-Office365-Filtering-Correlation-Id: 995f00fd-f5e6-4424-3224-08ded05e71c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	nUBiQ32l1Ij248V0NAHWq/MU34WjkKVnsIaQeiljtNkMcBzmRorTAFfpjDFjJbDbWq1c5alN3LdQFCHIP6rW7sWVTmIVPY3A+eybw170TgxvQB+r4m7WLjKIidqGyu9039i2/dE89p+Pte2x+T/Kuhh6XO7B9Mo7dmqy0cjUYf50KBhRJNEGTcOR+6a0Tzyguf0fn0Q15sNB3XSTzPn6OFxyTOrwrBmWWRS9Wc15UKi7124B7aRvPi32QlvBwWAxnI02JzdYs7H01+CNy3XW4GShbKxGP+Ya5YPXr7LoUFUo9PuGsOp2G/a/djgdEqZPO8ukx7JnzER/Tw0S4RMFrkYy9jfAGJv9oItov8nFTEy07vUHjJyCUhRC1XG0YIHpgFW/7vIUYaM5D8LPzFIqMQCKc1iDncLu3p19K09xu66aQ2tXrgxaSH+YqfQYjjXVBPrhLrtAYg0YDWc2EXaRUds5D+ltkSPP+sxfQYSvAFIT9VqvgcRVeMWw8g6TJGfX1XsASRwRvUJ0UyHERnco5Fj6IfpbC8Bc9aJ7qx6gkgW5xEuPWdQwVdOBF1fiEn55+I11Tj3fXssAGQety4UEnGzJrMXwMxMjJ8im2ZR2+/pbabFopmsmRej0ZZoYYa3e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3yufGUqt75/mBg1nZgLmWHXEmoDXQUMM0z/cOqsmoTMBBOMFZlXe6Oe9p6Xu?=
 =?us-ascii?Q?yQdCnaq33H9uy5+ea0Q0a2rMo1J6paQqu2sNaUAP29abbU6McUSEEGlJMvLv?=
 =?us-ascii?Q?+s2xtjzG/h36nmfUtqRTpfJDIVVw/NbByxtJka07vIyn79jN7UlHQL8+VJ1v?=
 =?us-ascii?Q?789/P/F2he2GBagkVIw+UwxN9XfllLM5ez4deq15ems5hEx5DkoE7yMmAS0O?=
 =?us-ascii?Q?leAahXc/NnwJyFmPmHZQcYVbFg23075Uj57XWc3+QlmJgcWWZ6WItO8f9lDH?=
 =?us-ascii?Q?gk/Mu2cU4Xg/c3qdgh3RAcJp5ipmOKm4szI4o4c4I1qfoXE/925TVf3ZyPKp?=
 =?us-ascii?Q?Y+Xol6btbE5+OYl8Kuhz0nQXdYo5Ba9QatGp6kkGW7LOemMKcp9zDnZExQqv?=
 =?us-ascii?Q?QX1yXtPZb87q+5ALBYO8EPra35cSj5ypb+w3JS8PPK9UL8tT1ulruycx4lqS?=
 =?us-ascii?Q?J77eQL10DwXEGCAvSjwah7r0wddjt1bBvrtz10vJsyzadfcQSOmD7B4EOQum?=
 =?us-ascii?Q?8s6cJAmIzNrVIxzBP4AJ0HomZ7AejrRXsK9wSP+9WGS7LFAbJ9S3FGYgZZDt?=
 =?us-ascii?Q?yq10TsVFGtB0Nv67psVR+u6bpKdcpJoaTxtdVHyNCB3apvgaUSo+BIyb9Ppf?=
 =?us-ascii?Q?vxae/+yK2guELcrLvMXmadfqeWjyKIzD1wG2P4jm8u48dQBo1hhRgBovnVZX?=
 =?us-ascii?Q?S3B3wc8QxbabeavK9YyGoXFKm6X3kxK1lEVryih6nDtw+w1MEuT/O8q3PgBw?=
 =?us-ascii?Q?zdWUgnZInLUhcg6fczvbxwpvikjNxjU1t2+v3BtZGVn/ii6YB88Uk8GrIIlP?=
 =?us-ascii?Q?nLWJ/zO5z7axUCWwtNZeWp/Rv7HcmLbYLe4AM6Veyh+VjgRc4ROOj7y4D31t?=
 =?us-ascii?Q?51bc1pQh/BY+DEcea9fp7+f07rOuXAns1Z0fMkNfwkziJHjizWNommKApmxL?=
 =?us-ascii?Q?2GqbbBz5dIUfWwTU/LHkjDnuKiHT6qVAsKgb9Tc3X0Qp3Bz10vj6p3ThDMjU?=
 =?us-ascii?Q?HTPsddbZ7RFU2Yq4Dq7f6D/qoprymPHrpyv74ZSSK42Mbk1gsRReiM3Uj0wR?=
 =?us-ascii?Q?thvGOBHThp7beZJ1KhXvAX5WTNk60k0XKTuhc7PJ7cTRvJXc1wGIzCmm7v8P?=
 =?us-ascii?Q?Fa78cySbpI2hKT+qQmFxmrnTiC5dF7ky98bu3fgEwSL3xf8gi8jghEdL21dA?=
 =?us-ascii?Q?1D8niL9Ujgq58txmcJqKP2VmRLW8uJQy9eTK0wGj94LjdEfCCDEvvCbynJeb?=
 =?us-ascii?Q?yJkmhnTa1PL7f7LmfAvcXGbvuJOe2etHmpN1F7Zug3HrFVT0L/C8AjUhw5rj?=
 =?us-ascii?Q?TTuh8xDlcZkXSB1D04/x95qBmOjEO386/o/E/grj8c40+9DmQs4VrxGYs8hi?=
 =?us-ascii?Q?1LE69zrIa2DKsieV+L8XGVsLA8UaSDH+OKLc+xXcautwQVTC2aBhXsX5MOWh?=
 =?us-ascii?Q?LIJhVrW/wf56GXa44izVdlPENHgCZTws7w4NKq+2fibrAT/2qeEMSuQ3ou9d?=
 =?us-ascii?Q?Jpb+YwxmOex4xyFyHghEOMX/lSKUwEdY3KfOmwMjnmtNR0p/rrPL/5lkTr0q?=
 =?us-ascii?Q?DqZrlJoZj8LeoOC5tVDh6T+DgM/95aH2ngV77IrZTGgdR8B/Ki2OltQI5u7s?=
 =?us-ascii?Q?RZx3GjvVlrBehJohXvYhDDFNL4pZ0Yk2b9dHi28905R2c1albIBaXEA7SCR/?=
 =?us-ascii?Q?wxofW72QPmDXaSifX6OJkrY1xrv0s/Odes3eCSo/H1xh6h9CHq63I+NZVzom?=
 =?us-ascii?Q?9fXWFOLOFg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 995f00fd-f5e6-4424-3224-08ded05e71c7
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:01:58.9122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZuSvaJevSflPjrvMKjMT6uqYIa1p+MBJtmnGDTu8szJhc5CQmV1etLT/blgKOffnbJnBN5OLzyTqqermL7OcJipw9xzhmSAVQS9OPbZ6jk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239289

This patch applies the upstream fix as referenced in [2], using the commit =
shown in [1].

[1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e03=
02382f4d4e077941156e1eaa68d01393
[2] https://security-tracker.debian.org/tracker/CVE-2026-6846

Tested with binutils-testsuite (bitbake binutils-testsuite -c check):
  binutils: PASSED: 327, FAILED: 0, SKIPPED: 5
  gas:      PASSED: 2091, FAILED: 0, SKIPPED: 4
  ld:       PASSED: 1899, FAILED: 0, SKIPPED: 129

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../binutils/binutils-2.46.inc                |  1 +
 .../binutils/binutils/CVE-2026-6846.patch     | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.p=
atch

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipe=
s-devtools/binutils/binutils-2.46.inc
index 4948e9b576..0a8dd39667 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -39,4 +39,5 @@ SRC_URI =3D "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://CVE-2026-4647.patch \
+     file://CVE-2026-6846.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch b/=
meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
new file mode 100644
index 0000000000..e7d1c3aa00
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
@@ -0,0 +1,59 @@
+From 7a089e0302382f4d4e077941156e1eaa68d01393 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 6 Apr 2026 22:58:22 +0930
+Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
+
+The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
+sections can result in target_index > section_count.  Thus any array
+indexed by target_index must not be sized by section_count.
+
+	PR ld/34049
+	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
+	using max target_index.
+
+CVE: CVE-2026-6846
+Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.gi=
t;a=3Dcommitdiff;h=3D7a089e0302382f4d4e077941156e1eaa68d01393]
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bfd/xcofflink.c | 15 ++++++++++++++-
+ 1 file changed, 14 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
+index 1781182fa6a..7f1c0df760f 100644
+--- a/bfd/xcofflink.c
++++ b/bfd/xcofflink.c
+@@ -1335,6 +1335,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_i=
nfo *info)
+   } *reloc_info =3D NULL;
+   bfd_size_type amt;
+   unsigned short visibility;
++  unsigned int max_target_index;
+=20
+   keep_syms =3D obj_coff_keep_syms (abfd);
+=20
+@@ -1398,7 +1399,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link_=
info *info)
+      order by VMA within a given section, so we handle this by
+      scanning along the relocs as we process the csects.  We index
+      into reloc_info using the section target_index.  */
+-  amt =3D abfd->section_count + 1;
++  max_target_index =3D 0;
++  for (o =3D abfd->section_last; o !=3D NULL; o =3D o->prev)
++    if (o->target_index !=3D 0)
++      {
++	/* The last section added from the object file will have the
++	   highest target_index.  See coffgen.c coff_real_object_p and
++	   make_a_section_from_file.  Sections added by
++	   xcoff_link_create_extra_sections will have a zero
++	   target_index.  */
++	max_target_index =3D o->target_index;
++	break;
++      }
++  amt =3D max_target_index + 1;
+   amt *=3D sizeof (struct reloc_info_struct);
+   reloc_info =3D bfd_zmalloc (amt);
+   if (reloc_info =3D=3D NULL)
+--=20
+2.43.7
+
--=20
2.34.1


