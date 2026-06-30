Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC41EC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:25:22 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16581.1782807918068290339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 01:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=x6dXH8Ra;
 spf=pass (domain: est.tech, ip: 52.101.70.65, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fH6R+IxtsJX7iDWRsIGHEHChd4gDfDsTIZd2JDecm7MbtctNRNeqqwQpO0h112kODGyW6bXHTjITfc04+udLVB6ih8Y0shCcUJLm8Cgelil83XzegR4Ytzx2ey4YHUlZoPjPk6aRrXCuuSJPGCw74ZjgN1tXqQ43+NZASdoKp49GEGwrb6qTEbQA1dWmtUI2ADZu7rHzhGcY2PAqiqtcZnGViJm9zdXfrnnlRydvDGjPtVhksDsgwjNMRb1oiJU6DzAC2tmiLROM2gLodiFbp9L3ci2FBqitwST3VOU00lHPNb8PJDaIpRRne37MkG40K2Lg0oqIFFh1gB2NJz5ORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2Ni7NsLXtE4qJGyUCrlXhkWQTjuAKvam+flKlz6784=;
 b=HKUsR2nP8nch0y3EZWsnW5T9arAys0eVf29G5HdITyg1fs9fTXMfot6DSiywO2F40JtJ/69Xxmhg4fCthKa0PrtFvMZZJ59NYUDJ5F3ye5mBpUCv5CVXfsU0QZqM6l5k/hdZ1G6A8vZMO1zSVzRXdSEzJOxEglH1kBccOU2uo2f7fWl7qgXRBg0ZfFUNArr2Q56zXAkI1CLxsA+xaF4snfFIZT+zk10PRP7afLv1BAhox3gQvk4zmK/8416YlEDiVQ+Epyc0somvfOT3iWHAreFmxx6koQtNdR+uCwoNMA8BXIq4lqcG5/cw+EvRcTigR2HrR5OXgdNrJfX+8WeCcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2Ni7NsLXtE4qJGyUCrlXhkWQTjuAKvam+flKlz6784=;
 b=x6dXH8Ra/3djFq1k32bUVGXl+6qupVdzlpB6nVCXCWzo5ORpQgR67EAy1egVWLrI3oAxeYsOiBcXhbB7JpOZ9foFPCU9sNAwHiSK690ZdoC43eb2eVn9IunE/Rkn5BsUP7df4EJliM43cgtieNTCe+2Psky01YfckX3jr+nNzkWQ6Ifoc7jDderAkU9bqpXCn96EvnBbmkXAFMfziFJP2mEPa5i+7uqUYKjSmozSpTLZz27BmgrKP+ZnwQ/b7jlJCzQ3YUe/nD3Ib+eoIFyTcsoMXXIWoKCzVVFw6sJnZ6DR53CvmQpR+syJrEgBOrLLbgwBfUmlLZdlYu0jjpOpiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AM7P189MB1026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 08:25:13 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 08:25:13 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] binutils: fix CVE-2025-69649, and CVE-2025-69652
Date: Tue, 30 Jun 2026 10:25:09 +0200
Message-ID: <20260630082509.34865-1-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR06CA0019.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::24) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|AM7P189MB1026:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb3ff16-1be9-411f-e21c-08ded6811b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	9T7iWwUub5XbeNwHBzob1RRrS4slHq0hts0DJmeTcJ/I/+XFdfmKRzu1H3by+m+Kf7SKkUJCRZ5XwCJ0wAM2I6l3b8jhE4sLpbmJAWmW3aU27PHvIXmkOwy+DosJmaQd2KuBXRDGvC9NR4BztMyc1oVt8ThjjTJQPMVkl8bFw70929A5OsfFnHtmD7EhDuhCtbGgaz3sKwJcZKm+XVC1IJgGl7Gob32corK2OOjthE5SQIFiXSGezCbEw5YawCmyb2U9hniBuS9lvWiHw86l1RMwnkOFB4x7BrQZ7hJSg1Tn/sS6VzGc7fYxx0NGkEEiT4rgY3YaqSItqHCvx0X93rHy3KnFNh8L0URTNBXrNLMKSdtObtyiEwQcBhkWASycPCNZZWlhyj7hBYnFUpcbB2BKbnP9IHJdoNl9ewYekHqBYjW/agcWKwtr8lZnHnjBAuuhW2H7a6htQ5v/wndKXpPujUinPeqvoasxhBgUBvRNZNb/KzUn706ZpVWTDw5WeeTeC1gg0gPb25Wm5AaR8hNe1VFXAb0yFWz6HG7y6J9OweaFn4Q1gpjAmddsU6sTnUM9DL8siAQvPLsdjbfbflI3vQYjce/RfNXnbv8sz4k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?03YmoHMkXLU2re05p3RAkg+o+pn7eYgBz4x8+mnlpA6KPt9ew1ivDIUQwGS8?=
 =?us-ascii?Q?rF9wXCF2YRnNyRohXIl4V+8585KIIMmNrs76qYt3aw2LVj/DkXFwRqk8GZsE?=
 =?us-ascii?Q?ZZuNj0MUE62zbH2IfC8EDfQFuEZsqnypcxnULwjUdbeV68PMyb78d0okf/Mq?=
 =?us-ascii?Q?mLfHkt+M+5UUhyJrtppdBkVbSsZh859IZXriNmHpJFg7X/b2F3t4vOqB6LIy?=
 =?us-ascii?Q?dBVz4A+ktqM2naPNdifiPpNbqTbLA3x7zamTBDL4ptsZLnEwSQQCc1h4HnOB?=
 =?us-ascii?Q?cQnS8hOFmf5mQqBAvdD2uVzc7fEVuBTe/FAai8eCy15Lrc0a1DJ88YhAlSm9?=
 =?us-ascii?Q?vxxz8qnjWyJqIwteO1vrR2O0/7QowzqiFxzvVKSVeDTGlVAfFW5bnfdtfdpo?=
 =?us-ascii?Q?+pZOTZXcY19h/+JzT5n1blQA1usO7a25Ab+FWbvSSJB6WuzD8WQC2gY+yK9V?=
 =?us-ascii?Q?In8o+LlyJV3ThBhHD0LV9BC+1LSTy9IufJ+3Jyw+8QRfU2Gm+ewwdiC1l1aU?=
 =?us-ascii?Q?aduq8hubg2liK5/P4TTch6EUfAEBcYnEjEosq+p8fFcev+DsM9RybgCHkZX9?=
 =?us-ascii?Q?66DT1BOx6ni3byDei00OjxOPIKiLq9cX6vQcCxN7jI9UIklYQPDliJC6FgzR?=
 =?us-ascii?Q?iA+Tfsf6wwJj6Yjbs6r+sDXchY0UJ1omh/CYcoSTWHYIE8+h4jZNvq/G49st?=
 =?us-ascii?Q?dvHoBuHjqLzMeKdu5Rx9rpOdXo+l3bc6blKxcvzmVkeoodfIpJki/8iLk4q6?=
 =?us-ascii?Q?xjqED3xhst+pIHnrA4AZZgMUzZTbmExmYHOIxTYVGTlco/NVKiuKxOZywinW?=
 =?us-ascii?Q?Io3nK+hHRuWvo5AIDFc9r4jqLBiOifk+29Z95zhqJHw9TfB9v+bvo1rTBAle?=
 =?us-ascii?Q?uWRQYOLySmaKjC0c6W4VBZpkZIBrO2izz2+rKtLLtTtTS93HyoRv08EiSCoJ?=
 =?us-ascii?Q?xmaWNDxRjrRzFtBd1zet3JTcvqB8AnQEDCqtBATJOaFmjUTwMAJSo9zvLBdO?=
 =?us-ascii?Q?AZRXH9UxH5mVEeyK+Zsa3VpBwnSiqHGAmgCFOxf+PFy2TvYPaF/67Wa2qk5t?=
 =?us-ascii?Q?VRI03yEy97ZJbd+7YjQyr42MDCYVyw5DTTRCQ4iFCB+JfAavlda+vJ1IcJh0?=
 =?us-ascii?Q?k7g9udRhYdMfNR++nIqpTR30XBX8gn/swO9xVK2RGFQmXRmDhtkmnn5JNHek?=
 =?us-ascii?Q?6x3riUJ1HxLO0h986IqhzpHuPwosmXY1HEpeBj7sutbvEXGeo5ad0Kb5XtdT?=
 =?us-ascii?Q?KqhlPGFaxUjXri91vfc/4KDQeb+h0FxPSPWyaKfLw28tzy2asXxgh5g9zVmv?=
 =?us-ascii?Q?T2t+IiTN14ysMuZsLFMuALP0+SeaV1HNiENr7zR58elzbTdsTKMQ5G89Xnqn?=
 =?us-ascii?Q?zj+lCPfhtNcRqg6pgYtcaYQ11FjIvoLmCUha/cyLGDnsisLftG3sBi1HB6s3?=
 =?us-ascii?Q?dmlHGtzJshLXHc0A7OCB7b9JLF9FoL0/nlC1VUlWRr+B+KWKy66NaYsMPlH/?=
 =?us-ascii?Q?ldZrbLVCbz8iERDK1H94T1aocZWB+BycZ27tLxARa6vviWFsoRbuhieRYjqK?=
 =?us-ascii?Q?BLpIgQFXO9AD22QjanvhuOYVo9feAUzZUXYqLyvq/0dcKLsazr3TT27INhA1?=
 =?us-ascii?Q?573CNgSAkuaLdjnqHKeCWn1TCLj2Oq/gTQgEtHbW8O4HCM+2t/JfLkEkCIlb?=
 =?us-ascii?Q?wV/FwPjXM+ytHWYk8kaRRqLgW/Fc1FYi4cisQ/ewjcfTN+IH4hLL8rD7QHxX?=
 =?us-ascii?Q?cMbNh4DVtA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb3ff16-1be9-411f-e21c-08ded6811b44
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 08:25:13.0999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PA7jHi5XBkXPwb7PNZJ1ZLZg1lUHDptdzZFbDeK3iTPDtfAF9CvbgDCKTXD6rLwDLoygGkHpLzDYsS0JklOhRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:25:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239868

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
 .../binutils/binutils/CVE-2025-69649.patch    | 36 +++++++++++++++++
 .../binutils/binutils/CVE-2025-69652.patch    | 39 +++++++++++++++++++
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.=
patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 1a865c45f4..da954fc138 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -74,5 +74,7 @@ SRC_URI =3D "\
      file://0030-CVE-2025-11840.patch \
      file://CVE-2025-69647.patch \
      file://CVE-2025-69648.patch \
+     file://CVE-2025-69649.patch \
+     file://CVE-2025-69652.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
new file mode 100644
index 0000000000..4865ad6535
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
@@ -0,0 +1,36 @@
+From 9d26af3871d5b8f8dd9c6b17987845e1f774eac4 Mon Sep 17 00:00:00 2001
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
index 0000000000..a085d20095
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
@@ -0,0 +1,39 @@
+From 034627143b85563fe4b4e416422d9dea8e66bd6f Mon Sep 17 00:00:00 2001
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


