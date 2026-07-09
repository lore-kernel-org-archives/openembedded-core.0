Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9DDC44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 12:37:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8179.1783600668873458940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 05:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ToEszMhl;
 spf=pass (domain: est.tech, ip: 52.101.84.44, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wrFOciedlCeK5LnwKtWjkLf1/fFxyBgnzH97hgDURcnaVFSlnnp+J47bEMduZykYFbUVDcMUoPsBSRUQxZiJ+tWI4SjuLVHm4AjGtIFiStibl21ebaW5zI3z+ldfthEkqKK4HAjudIUfqgNhe2SapV6RPl6LgALA3zVyLMcXx2wqIDcBDVrgPTks6t1qA3KE7/CAZNrzToPVckfQs5gzPtdLmiDUdLjgB53HDnlMpYFTTbdyx/K4NMtPj3ZDxVyIsh1sHMr2ppwOQ4MNT0Sj0syxt9tNXEC/1PiRajIAKQAkQ6rcmbek8p22s58SZfdmxtaJg835BKXzU0sFFw9XaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5aqz959nSfFg26OEgOkZaqGqyDJH86ImNgugEiCWZk=;
 b=eTw5IXxnz1MPI6Tj3PH/qL3AY1vxI5NtNmTDoSo54xdoVYK5pdO8XnVq+jWhiI9F1byqVXiPc1q4bFLxeWfpEBEfEeuoHqu8GixsEviIiV9x/vx/ZcwWwz0/mEQ1HH8Uw67qV/VhlOepL0sqQ7M9sHeK6Rf42GJX5PIK+/uvpH14wdgPYFstkVYldhUK+2ztcksTUk+UUUMriuezhOd07cPx1F8ZFR2Tcv1jRjtmJOxUclD2TUOK1U5EpPhWJN302cTui4m+Kj3JCyjkh+vGkIFSkrReMBshMMFX2+J8PaEkDBXK40K8W2wux6hWfvEMHMGIOpCTsJgIDNUPk3QE0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5aqz959nSfFg26OEgOkZaqGqyDJH86ImNgugEiCWZk=;
 b=ToEszMhl1PTHwzTuvThh99rsWtnisFeNpG9fzoUA3AmtUz2kM0H4htjFY1ymHr0LQq+kTxKUcL1MY8HN4cWIlICkVFL8kgk7QvCsBh5jBxctkhOspsJRkSNgUb+PPU8+znU4J/7Ow2GtrwJ7DLMmhp+5henYuejhkS5+bIM09voR6Gq0Qu+VYdBfuBNMvr0s4kGtYFWam9e/SSK7E9IFwAi6SM0xJxeTnXaEYhRSr0qCHvM/HQoLan67h33novt7Wxnl43p+U5MZlCXZYCD+8akSnQkr2slDt/pqYsW2FtPbBOjoo3I8ievl6dnRIIAgS8++QJEpVedvH+rkCRT/Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:127::14)
 by DU2PPFB830855DA.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 9 Jul
 2026 12:37:45 +0000
Received: from DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b]) by DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 ([fe80::6c51:738c:1290:f77b%4]) with mapi id 15.21.0181.012; Thu, 9 Jul 2026
 12:37:45 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2 1/1] binutils: fix CVE-2025-69649, and CVE-2025-69652
Date: Thu,  9 Jul 2026 14:37:40 +0200
Message-ID: <20260709123740.150315-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709123740.150315-1-roland.kovacs@est.tech>
References: <20260709123740.150315-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0136.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::12) To DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:127::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8P189MB0732:EE_|DU2PPFB830855DA:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb86e99-8c32-48d6-f3ab-08deddb6e008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	4EuR9YGQEFInqpptOQX0ZTmaFWwdObZyH5ilx0XL2dciDbgbWTFXCElX6OUUxPhVLM78e91WXYo4vzRAgLHdLl+WpjqN5AInFqeU0ABkxo5NXNo8CW8izph12IJEXn7Ed0b14wOIvIwkrzUBuMfchzBggGdWVtQf3O0M1PXkz84xi9Pb+j8jNjdOl88rSKI+Ds9zHKP15GADA/mUkfsR4x7TvuuVUdYviyI8GyEIeQODHdaJpGMcV2FtfwOZmVPBkcP2JELguxZFmPW9tYvd5+Gq1XnHq4VMkzC9E5zBx6kLQYBf3KgMKaUKuzVMpqPLQW6dt24GKOSemOymmJQB3pzdo/2Zkmtg9a8FPDmSuq4kET1ZHBfS6lN96vzBSPMDRrfbhukMdHDjUnwwkdBfGih4kpzJPsJvdjKwl7SAgwwySw2Zv2l/YDckvO949yBta/qY0bKAS/PZT7vvpnpyDJg3g1kWA6FG5r4TZoolxp0vM8W4hsovOTaDe/mDy/LwSCi7vdXCLicEPKKsZTNPwzazR7l1zGNyCcKvKxm+QwPuSJdhJKiXxpA2gaDKPcYzhy6j3kKF2gGoICpDBdo25tKzqPzfjnJFgS44ZP1joIE3k7KY9lmEMxtPUh7eGs31
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P189MB0732.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ngMLU+cGRDJfIFTQwJm/TRLNWVM/dv7pT3zLj47CGdsk1htq6vEBlgTtMcre?=
 =?us-ascii?Q?asjeEot/K6QsWrXZ84pjQOce66AZUA25W8xdRPx4L0Jew+mBBnWsanbPNZ5m?=
 =?us-ascii?Q?9fD4NRFrk043TlbvuQDxUFM2mxUjM+0khtSGe5O4aw7wgPDWwiXZzwDC5LD0?=
 =?us-ascii?Q?K0jvLGpiRT+XWY5S6B1YyYgG+qLcHLQJijFg8TeceVtQp8TtvPoS0uBjtaGM?=
 =?us-ascii?Q?VFQH1uvftDST6KH83iFWRgmTUwUx/Qa0MWSm24xmKrvGj3RYJ+7wC0IErUtN?=
 =?us-ascii?Q?+7tArnJj5hl+rncYlB8J0XLZOaItkS4qD5I/bE1R1lsxO7Qf1jvTXBMYNC+K?=
 =?us-ascii?Q?GcS5eyLAUMNoQ5ELr2FOVkQeda2KwuooiPIAJK2/bmKvBHmXkdwl4De7H5l+?=
 =?us-ascii?Q?9P7goFcOZu+1g3FCOgIy5ABzm28dLqTgyRcW0VEyT3pSPNS+E2SWdaK57Pv2?=
 =?us-ascii?Q?HRd2Ya+cqcIqsYBSw8/ZrObH9u43ihf7enMsubelp6nVIHWY025++oiaQJj6?=
 =?us-ascii?Q?7smKbnBBoSw1q/c+Mng1TPeok29Ki7C0ZJRyVrMeuS4BQFoKwqKjnc/b5t0O?=
 =?us-ascii?Q?zUJDdY1phORzm83sYNV5LJkG4ZqD7iywYlSpqB3olYr/x2P/jwviVpHm0AU1?=
 =?us-ascii?Q?Dd4OYAnTBiO2biXZclTLEbD3tR+TgN6MvFf92/aU0ylUFDE2plhMlWRtAMNm?=
 =?us-ascii?Q?2+0bWY0sTlstiXcZ1SPeqmGTX9O7FWwDFg7iRwrXIM2nSPp50tZIugmd6X0S?=
 =?us-ascii?Q?qYA0xtn34JYvjzmc4imz1xyEr7QoEElLiXvzIh05H1aczJcGZyNNQJTfWsJG?=
 =?us-ascii?Q?U27bXPdoVTD32VnaBGaJHiQFfH4yibK3uP4FSah/wh5cMjiGYFUH3Vi+r+vz?=
 =?us-ascii?Q?9tRICun6vhXlQjj41/qH6E/ZOQEiqaRX1awz5VfHLnu3K/YNo9BI1/1/1SUf?=
 =?us-ascii?Q?p0tc6XMCmGH1ofaPqlZ540k87/TdqCJkteh2l06NSkWjbLTLuQfncMDUc1g0?=
 =?us-ascii?Q?HHIYmpU/Pa540Z8rwqEyxv05248qpPXxcrdZAArmZzOoTDTGEygRR39xK/Ou?=
 =?us-ascii?Q?CCfds/x5VLJUos4csCx3HOcG4zv9C1w+jlTpQKD4DwCzEXf5mtV09G1luijM?=
 =?us-ascii?Q?6dVi1yWydUEbd3VRnX++219PV9nU0wHWtj8sxKwOopH2Zg0j0sy888XnvpUW?=
 =?us-ascii?Q?lBJ7RJSG3/N/aM5xsCmtssWnZY2zIC5MIEEfg0SkMTOs2wQAWZvoVOmH68ZH?=
 =?us-ascii?Q?OkY3PGmu76g9Q6y/SgowxaxNjLC3OeBRL3db5fgyOO0xT79cUUe6n9buW2Dx?=
 =?us-ascii?Q?91GB8SeqQ1nwLH+O6kNfcJta/DGP0Q/+5O2Cjcc7viAOoSBVaiGHkNfOOwZ+?=
 =?us-ascii?Q?ejG+79y8fH36ms8dvOWx77PPilDJJ3hNeOGXpOQmWov6niO496EGovhPXqfj?=
 =?us-ascii?Q?LyBkkeENNl/2BtQSJY9gnP27/MHE4Anja8noVyNr3AJANQKw/nW30w524Ehn?=
 =?us-ascii?Q?vj9P5g+x/jnLhK2P5ylH+rXG1vyRGqVBx2/kWAijn3F/qeHo58S8r1efj5ww?=
 =?us-ascii?Q?MYgRh95vDVQbsJSfaf8+pO3r2IKSwuztQug81qxk9o1lM+p84OLGPP7pcWHv?=
 =?us-ascii?Q?tknVA8qfMWFlPBhlur1Su7YQQ8FSQUsLQOgBqPCVO4cF+8OJak4liUkLiwuB?=
 =?us-ascii?Q?y4U5DboobUCTopQXc/EBfBPchDEJRcm0h4XQi3iV3ufNLnJBK0JOy8AxawS4?=
 =?us-ascii?Q?Hz+xNm4CvA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb86e99-8c32-48d6-f3ab-08deddb6e008
X-MS-Exchange-CrossTenant-AuthSource: DB8P189MB0732.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 12:37:45.0551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSlZ8WKaSH/WC4HWbpqfy8p2UrzWELmsRBpGUJ39/B6D6kvMY2jd/ASprzXPdTbG15jSVQj6ldC3k4kwjcFqoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPFB830855DA
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 12:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240575

CVE-2025-69649:
  Null pointer dereference in readelf before 2.46 results in segfault when
  processing a crafted ELF binary with malformed header fields.
  No evidence of memory corruption beyond the null pointer dereference, nor
  any possibility of code execution, was observed.

CVE-2025-69652:
  Null pointer dereference in readelf when processing a crafted ELF binary
  with malformed DWARF abbrev or debug information which leads to SIGABORT.
  No evidence of memory corruption or code execution was observed; the impa=
ct
  is limited to denial of service.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../binutils/binutils-2.42.inc                |  2 +
 .../binutils/binutils/CVE-2025-69649.patch    | 44 +++++++++++++++++++
 .../binutils/binutils/CVE-2025-69652.patch    | 39 ++++++++++++++++
 3 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 7e83f72632..7edd051e9f 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,7 @@ SRC_URI =3D "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69644-CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..8852ba4cb5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,44 @@
+From 37c8055eed3178a46417045dda63db7af21fd046 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 15:58:33 +1030
+Subject: [PATCH] PR 33697, fuzzer segfault
+
+	PR 33697
+	* readelf.c (process_relocs): Don't segfault on no sections.
+
+CVE: CVE-2025-69649
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D66a3492ce68e1ae45b2489bd9a815c39ea5d7f66]
+
+Note:
+  The difference between this patch on v2.42 and upstream v2.46 is due to
+  the loop body printing the relocations in-line, which then in commit
+  8e8d0b63ff15896cc2c228c01f18dfcf2a4a9305 have been factored out to a
+  separate 'display_relocations()' function.
+
+  See: [https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3D=
binutils/readelf.c;h=3Dfa0de3a7e0d9c2acc18fe047a7019e09f1ce3894;hp=3Dc10064=
80b7bc3e83dd87fb20d215342375614af9;hb=3D8e8d0b63ff15896cc2c228c01f18dfcf2a4=
a9305;hpb=3D31c21e2c13d85793b525f74aa911eb28700ed89c]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/readelf.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/readelf.c b/binutils/readelf.c
+index 5e4ad6ea6ad..8c1987ffaec 100644
+--- a/binutils/readelf.c
++++ b/binutils/readelf.c
+@@ -8961,9 +8961,9 @@ process_relocs (Filedata * filedata)
+       size_t i;
+       bool found =3D false;
+=20
+-      for (i =3D 0, section =3D filedata->section_headers;
+-	   i < filedata->file_header.e_shnum;
+-	   i++, section++)
++      section =3D filedata->section_headers;
++      if (section !=3D NULL)
++	for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++)
+ 	{
+ 	  if (   section->sh_type !=3D SHT_RELA
+ 	      && section->sh_type !=3D SHT_REL
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
new file mode 100644
index 0000000000..a3380ae420
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,39 @@
+From cb4f8fe24cc86a9f050be4cf9c619940f632ea6a Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 8 Dec 2025 16:04:44 +1030
+Subject: [PATCH] PR 33701, abort in byte_get_little_endian
+
+	PR 33701
+	* dwarf.c (process_debug_info): Set debug_info_p NULL when
+	DEBUG_INFO_UNAVAILABLE.
+
+CVE: CVE-2025-69652
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D44b79abd0fa12e7947252eb4c6e5d16ed6033e01]
+
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ binutils/dwarf.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 615e051b2bf..13b11b46e41 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -4222,9 +4222,11 @@ process_debug_info (struct dwarf_section * section,
+ 	      break;
+ 	    }
+=20
+-	  debug_info *debug_info_p =3D
+-	    (debug_information && unit < alloc_num_debug_info_entries)
+-	    ? debug_information + unit : NULL;
++	  debug_info *debug_info_p =3D NULL;
++	  if (debug_information
++	      && num_debug_info_entries !=3D DEBUG_INFO_UNAVAILABLE
++	      && unit < alloc_num_debug_info_entries)
++	    debug_info_p =3D debug_information + unit;
+=20
+ 	  assert (!debug_info_p
+ 		  || (debug_info_p->num_loc_offsets
+--=20
+2.34.1
+
--=20
2.34.1


