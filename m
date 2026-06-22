Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8EBCD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:01:51 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42279.1782133309942241338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:01:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=N91dTBem;
 spf=pass (domain: est.tech, ip: 52.101.69.24, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmbkQ1052SzvMO9iv8oSV4DhasmwAqlHpPVvGTXwRjdIfHjbRyrZ4H4uIQ7A03wkQ0S7WqqnKIx/fW3zzgxGA34JdTNtaMM+VZrQKIY2oyh5jx8oxqDtJOsZN4WwgTHd9HfvXnVQTY6bIOdt2XRzKyCTLIBjo4kJrukeNdO7qEPFYl/dZwPVcnGcVEFuQa3PQ1CrJbEO3huJG+TSP0o+LSAeLuuer16AA85cm0R2RXvqyItZSlKJFclWbkS7KUJu32ysPfiFkbRytBebIikYmyXHDNf6cmugHkI9UXpGur+zQW6D5pPiz8ab+Q8bErV1y/pR3ppAv3LeqS9dERCZ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y70BVIhyDEN5xjDYOg03Z2LjomkTYkcccUk3WChZ2c8=;
 b=MzFH4FblCrnNeRPF97+K2m1YoCQpr3TzYXPf5oCYuF/W1YJwKjHaPvNxt4eJnS/PkqcdK1ZyRnw/Y8HFgoiwkAbl7zliUjU7xQ27XRWajEIbwdZCpQRb5bYzhe8NHKXXc4VKjs0D5olCdvSqMBhTixJpsjgxlT2fRmbczX9N6fP4IhBsbmfsfIi0ImNpp7dPt9lCjZWSHPi/unc3ztprWZ9tBUX5oGYE08IsL/TD1DBfZA7nBJOm2QplEF1xsqcXS8uVaVdzrcu2//UDqnw4L2rL2PvZozUvmaafO9DI4Rdxe5eX4tclJnfidHNF6UvZHn8MNMFbyjEuRQZ0FCtOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y70BVIhyDEN5xjDYOg03Z2LjomkTYkcccUk3WChZ2c8=;
 b=N91dTBem078G0QJwhUVGBeAOT4ksh+PpUDlDeA99+unv3jrnUGKReadRFeL/oK5L8XK61vayD7BitrMvwa5FzecfVsLoS1+8vg1aPueLMk7SBdaoaTcTMCG+llsvYyN1KXTO3Eg6pWPAcnkZKWDA+kWlPFFNzuDZdVFa8hbii0/Sd6L0M8ZSVR4E2qzqO46yEJF70ArPQWfjvEufjt0LkBQlX+ed/D5BtNvmz4Sqlv0CiAa837z7i45gUXOhNfjfXZaNMCo1RnX2FgsVSdPQKVgrEG91OjNOe8mxB+Qi2J6EasSce+OtwE+iI0Zi/GotoKlr7O3/f+jx0O0CpbPvDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AM7P189MB0727.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 22 Jun
 2026 13:01:45 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::18b0:e114:b839:ca49%8]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 13:01:45 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: spushpka@cisco.com,
	jeremy.rosen@smile.fr,
	Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH] binutils: Fix CVE-2026-6846
Date: Mon, 22 Jun 2026 15:01:15 +0200
Message-ID: <20260622130115.23394-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AM7P189MB0727:EE_
X-MS-Office365-Filtering-Correlation-Id: d5174b64-6b11-4651-3e89-08ded05e6992
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	HQNJ/M32fH3/DM/5rFRMAbyvUCnYcEB9fBNs9lNkdYB5Wvso3Q7DvfVF3Few1BNaxj5rjpUXIVAJVLiji0iHGkRzFPezTNUlzDhUbuBW5xJmwL2M8DKABCuDv7+K3l21/xsWO2goj8bEB73sXVmnJs9ESJqDR7vk48BS96NycAHaEjJRcs6yKfWt+icYWxtZ1awVDac+EodNm8MINKYoBmJv8MiMm7DEqnZOjKnAEt+eb40Sd8o8PMdmTT59lr99sR3kAgkhKq42JtmsScTeplsxXaMfIGZLWF4xsGJBYkKdzaGH2NxG4qgOjsNfoHEFomb6DU3mrGL3pOQF3Ag/nzWMK/K7IHtbPiVUQ022Qv2rmTyETfaykpFoaiSYd6nYb7lTj9NepFtuVEnY9AJLkND5dI+P2HKEizje0l6qhC+2IsxSj0xwvkddkOiTxMHe3D+qOrtFF0BqoTKYGBuKZ4HqeP/gX/c5KbGmEaLbzQBrcaSvjA3xOCAj+j+3T4//uOtaOefQB16ITmABXnMEyPO6GVqDF+iSWIvLl67nDwBs8h6XkgsKU9PpFtAcXH/er1Wtw8P+sJqEJESMyzgfFp2MWaehRhybBXbyUERO6mTBlI6eG9Od/omwoYG/sqdY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rQ7QpQ5wKf+kF2uzzREvhU8f0goOXWG0NTDxKiu4CW9SZR/B2C8k4xh+k6LU?=
 =?us-ascii?Q?OSh8rgotYl35wN/6xQ84EkkfYbHwolf/jHxY5w4KG7vrGaqiN/dHVXcZu6Qk?=
 =?us-ascii?Q?1X/DWLTnnm5IFkALpwJQUHstz8YvmtT81dHQURvO8YZum2Ry31aa7zefERpV?=
 =?us-ascii?Q?/YA1hWSm8dFDsJ9EGQFKjOE6hJmAY8oDXHMJIxwPfI7dXfU5h1hc1tzn5RDq?=
 =?us-ascii?Q?6dCj4n5k4xQfNSOgtGl+k01Mxoj2rZW7q8d+Js4t9ggXP/2D3JvtQCkYQ1Tm?=
 =?us-ascii?Q?PakBb6u1f+OZ7qJO/tKh4OSR94MlEjcarkHjD9STfSoTfB6j8hJwOR2iREpe?=
 =?us-ascii?Q?l2+zxUajE/vZ4ysv58usqZxqqn0iFilS4ryQ9a+aCsHgqcnM8VLs/Kg34++q?=
 =?us-ascii?Q?NXLSrTeX2ziwK0eKtmBuWdbLRZsgxWxEvlYyR0dVghz96/VptyicXmlFoyPW?=
 =?us-ascii?Q?zWJ1bcTeM43rjEezmhWs4U2w8BFwayHW/ZUZ5DARAcXef925pT8NXO8xDvZY?=
 =?us-ascii?Q?q9nr12haxy76Li3GkG/FFrVSYHrOGFOdARpgoUyyPqvfvRxUO9APZYrYCc27?=
 =?us-ascii?Q?tzK6irhotXaR/TpTVCURHLOqlQVbw4NMFZAGpx9EmE5pjiHDryyO6JQ1vjvu?=
 =?us-ascii?Q?OFIM7Va6NkKeToI08ij8/LNMHmv5RwzSvoLx4Y9AODKOYrL9WANQ2Um3sEc8?=
 =?us-ascii?Q?u0pcMOaG4MhBwQ0TrRlL4tNgscRPcwDEEBUH3Pqh9lZjvCYHp7Dt91DQ4uyP?=
 =?us-ascii?Q?77iFDaFbPOCzTKHdI65GsMJPDD2f7kpwHAQy67O8HWjSkKWI27C+jRI3GQhE?=
 =?us-ascii?Q?TJmO88a1q36+Iz2u2pLHAErSGxWH1tSn4Ao9PY+Axr/sxUGv1b6XkMgFcmmn?=
 =?us-ascii?Q?FD4RCtdJ3yqSEw2mlaRIlU+0BcSy5BswTN749VC6i6etvzPscpmSZSWKuLaK?=
 =?us-ascii?Q?xkhMgKcmT7JWV5F516T9+8/OAq1v7lTuA1/Tacfuqfvbn2x4odUewe0ykaBZ?=
 =?us-ascii?Q?4zOj03MMozvutYRysjXyOo8XMjiM2Ppw7A8TZWyjV05Mw7V9aSaQv0o22BuD?=
 =?us-ascii?Q?0GaPGsSFWF+/1DgwQwl1Hghj0MB4qVzpRhAWB5iU7nRP/6/3AnQBtJQ5oesl?=
 =?us-ascii?Q?NBhf/NW7RjkZnWViHeEOo5ppRL9/Oy/8u/lb0SpdUshPKg9YR36iP9C6k/Jj?=
 =?us-ascii?Q?EgsZhMAsAtEK4EdajYosB7kfm/tzWaxWbB1Dka8H5qN5ouFoIb4mm+mFH2zj?=
 =?us-ascii?Q?Q3apW6VJHkt/uYMV5c87BtZ/LzzCqhQEmYZAd26FfU+Qk3OrkwQXwd/MwodA?=
 =?us-ascii?Q?jJ1Eohyti8FPNtdk2/2lF8X/YtunSPNLXXPcoVwjOJUM3YujSlJC88QgNB/6?=
 =?us-ascii?Q?uLMQANyBH3LWOAw+z79pNCLmB+2FQtaF67bX6APD4+v1yeWSZi3AI/QvkzjJ?=
 =?us-ascii?Q?T4vb2QxYs6W1y3Ag8214f8uRE6gNhch0DFQ6Q7zmdLmNz3U2MRwSNTtRI0MN?=
 =?us-ascii?Q?1FC1NnTXcU2J5sqFj63BWC4zSgmVb3hdU2Sq9ma1vkSGqw9YbQxgeK5cvMu8?=
 =?us-ascii?Q?RBYV1XpRmizdSs70109uDB3RwaSPze27HyfTH5+YzLJPI9s6lhKmZWpuySJ4?=
 =?us-ascii?Q?thZ7WNXR8PVygJMEccCiu0hQCzBAv57toMDDbddfC3y83QpV/XMBrMWbVRke?=
 =?us-ascii?Q?uZ2LdvmsUG5mxolu3WSmEDz3YkXiDmNU3cjxt82Ypyiu792zvjl3WFHfbt6x?=
 =?us-ascii?Q?3jpiHK2fmQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d5174b64-6b11-4651-3e89-08ded05e6992
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 13:01:45.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: erCcR9s/27QZaw7+hq4xovn/eRjH+ze4yxZnbjsM4TE6cNwHAV7eaNjVrS8qFtUSlYXRcBQYo9ofbVm7yDKqK14rlrAza3eRrNFw9hio6RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0727
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239288

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
index 13d2a02108..cab270cea5 100644
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


