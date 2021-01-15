Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.51])
 by mx.groups.io with SMTP id smtpd.web08.2091.1610721162005018532
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 06:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=pmoI+jbP;
 spf=pass (domain: windriver.com, ip: 40.107.243.51, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYQmzg/AoPkHNUxuI7Yv0Bx3gj8+k6CjhFLO0b2dhp/Wn6gmc7e0W4HxGOo6ZUa+wqdo/GQyWL8OJ7gJm77KLuTP6uY1aHybDJlvD12nZjwZzy2NVhum5kTIAxJObr7rEZ/sDEf3JpqfI14WBIl3xsn/t8IOrFBmM64S5icmDQqA3bnaBg9jO+X/nYGGwc/RFESHVSICQpvns0NvBNiG16BbqKTTBSWkAPNJR5LNT0F92eL/L+45GxKJWS3HiDXfzE8GA6Cf3Is8O+rwmcLUJau1zweX+tHTOimUkax2nw5v457T5c4zldHbL73iw+/xWGB1frFnlUkrTqxNiBYpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN/7XwteiSLOU+zlcJAl3OsMAgZqWLYHxnwJQIDdUvg=;
 b=TFYCjM1+8mT/+FAzNiGpAz8LUmKbABCAmE6cnDOpP5KpIaPooMgWlUAnUDrcMO30qCbDi7CFg7Ak/EQGkSmOmGCfTjwdHf6928otPsM4725+YVreIAAgDAAXOsY7Hsi/7bmqWn4+fcSIA/MzVb4pieXMQG5GaauUS/UlLIk/eQKhlGP35NLZkiFm0ZUMWNFZ8qZrOPkq8CIVc/f6xRoBYF0QCLBZdFBihYAcJXqBrQKBcfB7yzs9jYIkcqm26s6+CLRmWrE3r6oBgVcbcXEI13wOUNt8dRDilPp3W2+6KMmgTITxwXMu5EsIzCG2kPtXosMmeqv36BTmIwQSWRD75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN/7XwteiSLOU+zlcJAl3OsMAgZqWLYHxnwJQIDdUvg=;
 b=pmoI+jbPDmSNpO8V1BB7aRd3seQcPueu6VYoAb9MRr2FK/dTjTbVJoT94eCDBaJxzLdyOjv6dT+lA45CyDd2oIU+WDJl5jydK1V97tgiSVyazS9BPBR7KSMvS0mvbOgJjZLbHd6H17NhjkK1d6Fm7s6FFiJd9e0fMqUCt4UpYY0=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2686.namprd11.prod.outlook.com (2603:10b6:805:59::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 14:32:39 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 14:32:39 +0000
From: yifan.yu@windriver.com
To: yifan.yu@windriver.com,
	openembedded-core@lists.openembedded.org,
	randy.macleod@windriver.com
Subject: [oe-core][PATCH] binutils: Fix CVE-2020-35448
Date: Fri, 15 Jan 2021 09:32:24 -0500
Message-ID: <20210115143224.38513-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 14:32:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a679e10-5b20-40f3-471f-08d8b96268bd
X-MS-TrafficTypeDiagnostic: SN6PR11MB2686:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB268652E0583ACCF4A7AA94B280A70@SN6PR11MB2686.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	m+1aLjWEKbG7i1kJYZfzHOhG3eRmS3APU15tDmFk4GMg68PkMeJv5J3eYhGyBhUYC4tt0KVplFsz9kWu1gZKJHFYQYx5nwInx4ProPC+OHugMkAYUXFvVXaxlAFhNp/uldFFDopuYWiz/J1ZIUA15+T8DrUWNv+HbsZ6aqKT3tlBV0vNWl5T5o5LzPlzXlo3wHsKnu4IZBM+j4FX0EacLW4UGqTTdC0wZRXEhmeTC+EQRyxXzqlCLeHCn+YkgmGFNhohri2i4KM4a2msSHqMxcUMapYIKY1Mxp/w/WeNaoAj4de8mFn+RimmML8hMc20MYj+bWpHmm6Nj1HmbRfUvH5t5ozxo4ZGR1K/eXd9Yt0vPo1XlcKMeyOvWxpsHZBXvIpxfv4Jx4RpxJUPOVBBITh9yopq2MmE3vczIZUhvwvZAfuRge0DSwjXM2ETu552DgBPr9dXab1Gm0kTHouQ3gpalwZdLNFiggbSLmyZr5MB5RpvgVkuoSWOsUH0r4BMLANiClZ+Z6rKvKW0RT7NCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(6636002)(36756003)(6666004)(966005)(66946007)(8676002)(6486002)(2616005)(316002)(956004)(2906002)(52116002)(86362001)(6512007)(83380400001)(1076003)(83080400002)(8936002)(16526019)(186003)(5660300002)(478600001)(26005)(6506007)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?aAPa54ELVqr1aHLyv7vjgDTbQ8PCVYB/FtHLbOcT1EN/UlLowPpjQxYwJvaL?=
 =?us-ascii?Q?iNvkgeHlBTHanz0oG4GtOvS4hWpD7EyMK+cgDQOd2RBv8HNyKeWuupN4JFMA?=
 =?us-ascii?Q?s1/Qhlgf+hmcfaSpMRxeBO93C/jRWwK8GlkbUmCatLYwDlCWfIPbcH6qoTRM?=
 =?us-ascii?Q?r6kDtp7r6pc6lACTbQTWqW+9hNUO30v10nqV8n9kb9t53sakCt6Oz5sBmuTH?=
 =?us-ascii?Q?e0MAA2DP6ctPCHhf1MwGxmhQ7dIP2TJnzBYykJBeVZW0mGd0OqGLU7sag42d?=
 =?us-ascii?Q?3FQMZq3aeUQZk22Ky13y0aqXUpzRV3I/vCT2Qxtw+rbUwl9brFH9UzVE7RFd?=
 =?us-ascii?Q?GLk9YgWYs/ltU23weuemo8p7+p/G9QFWwh281jtiffGiYGLCXa7rqUDR4TWj?=
 =?us-ascii?Q?7KjnFWL05UgkW1l0iP3sovwUOCddBGXyO58O5qk+26EjX3iowXNjLFIxSXRC?=
 =?us-ascii?Q?ZPfdrEEvJzRaExuNxD66l+3fjKyBTFsbpbU6eXtHi3yHik4vl+lQH7iUCM7F?=
 =?us-ascii?Q?GikEu5tJES9py7ggmzECUiGyMb3S8RvYdhRxfZtDFuX806JMbAEy7G2DdY53?=
 =?us-ascii?Q?sZYMvRDyi1/uNfB0qOmZucLYFtTSaQknNSn+S1EPHqfaMmPZ6W/Fmj/E1mJe?=
 =?us-ascii?Q?KnyTz5yot3Ur3Hj3/imK60lMGlPHUeaqsriDczxGKRhIzIZHo45sAuT6J2V3?=
 =?us-ascii?Q?3qnxg+JL8SuFfHg48lmAWIK2iqqMsCfw00FDrXZEzm/Sn3FWX+L8v2AAU/Q8?=
 =?us-ascii?Q?hbOx/pmYf/yWnHB8Pmt4ZlYts1xAYWnQbUaD/QpmSS/P7auXUlXvRQmnu+c9?=
 =?us-ascii?Q?uGnUqLgTFFleHD7az/8L3QJMekUjiq67JEx9DDvnQWNta+L2FlOFgY1d1hif?=
 =?us-ascii?Q?/BurTt/yHmNFoyAVuU39ojBNKDM1DpBwKa9L7ljHGVbysh/Mrg1B+eYAAbqd?=
 =?us-ascii?Q?WYpscGzNKovmYmwqxqdkZnOGlUqUWupxO119Un3JoEFWSef/m//s3Av7gNpx?=
 =?us-ascii?Q?wbF5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a679e10-5b20-40f3-471f-08d8b96268bd
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 14:32:39.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TcNCJ84F0h54v9K8mD08OcbypJ6iTjINZjFuTROKwgaiWDnEj+R0HRS8789VmCRLYdpdjuyJjkWdSQf+kvGUaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2686
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix related to a buffer overflow in bfd library

CVE Details https://nvd.nist.gov/vuln/detail/CVE-2020-35448

Upstream Tracking https://sourceware.org/bugzilla/show_bug.cgi?id=3D26574

Patch from Upstream
    https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;
    h=3D8642dafaef21aa6747cec01df1977e9c52eb4679

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../binutils/binutils-2.35.1.inc              |  1 +
 .../binutils/binutils/CVE-2020-35448.patch    | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2020-35448.=
patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.35.1.inc b/meta/reci=
pes-devtools/binutils/binutils-2.35.1.inc
index c92cb75543..775af2b8f2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.35.1.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.35.1.inc
@@ -43,5 +43,6 @@ SRC_URI =3D "\
      file://0016-Check-for-clang-before-checking-gcc-version.patch \
      file://0017-gas-improve-reproducibility-for-stabs-debugging-data.patc=
h \
      file://0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patc=
h \
+     file://CVE-2020-35448.patch \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch b=
/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
new file mode 100644
index 0000000000..3b0f18bdb1
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
@@ -0,0 +1,78 @@
+From dc40540e4b4b1771182a9c0fc6ba5f1a830802bc Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 4 Sep 2020 19:19:18 +0930
+Subject: [PATCH] PR26574, heap buffer overflow in
+ _bfd_elf_slurp_secondary_reloc_section
+
+A horribly fuzzed object with section headers inside the ELF header.
+Disallow that, and crazy reloc sizes.
+
+   PR 26574
+   * elfcode.h (elf_object_p): Sanity check section header offset.
+   * elf.c (_bfd_elf_slurp_secondary_reloc_section): Sanity check
+   sh_entsize.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinut=
ils-gdb.git;h=3D8642dafaef21aa6747cec01df1977e9c52eb4679]
+---
+ bfd/elf.c     | 4 +++-
+ bfd/elfcode.h | 8 ++++----
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index fe375e7346..9f29166399 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -12527,7 +12527,9 @@ _bfd_elf_slurp_secondary_reloc_section (bfd *     =
 abfd,
+       Elf_Internal_Shdr * hdr =3D & elf_section_data (relsec)->this_hdr;
+=20
+       if (hdr->sh_type =3D=3D SHT_SECONDARY_RELOC
+-    && hdr->sh_info =3D=3D (unsigned) elf_section_data (sec)->this_idx)
++    && hdr->sh_info =3D=3D (unsigned) elf_section_data (sec)->this_idx
++    && (hdr->sh_entsize =3D=3D ebd->s->sizeof_rel
++        || hdr->sh_entsize =3D=3D ebd->s->sizeof_rela))
+   {
+     bfd_byte * native_relocs;
+     bfd_byte * native_reloc;
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index f4a7829f27..54ef890637 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -568,7 +568,7 @@ elf_object_p (bfd *abfd)
+=20
+   /* If this is a relocatable file and there is no section header
+      table, then we're hosed.  */
+-  if (i_ehdrp->e_shoff =3D=3D 0 && i_ehdrp->e_type =3D=3D ET_REL)
++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_type =3D=3D ET_REL=
)
+     goto got_wrong_format_error;
+=20
+   /* As a simple sanity check, verify that what BFD thinks is the
+@@ -578,7 +578,7 @@ elf_object_p (bfd *abfd)
+     goto got_wrong_format_error;
+=20
+   /* Further sanity check.  */
+-  if (i_ehdrp->e_shoff =3D=3D 0 && i_ehdrp->e_shnum !=3D 0)
++  if (i_ehdrp->e_shoff < sizeof (x_ehdr) && i_ehdrp->e_shnum !=3D 0)
+     goto got_wrong_format_error;
+=20
+   ebd =3D get_elf_backend_data (abfd);
+@@ -615,7 +615,7 @@ elf_object_p (bfd *abfd)
+       && ebd->elf_osabi !=3D ELFOSABI_NONE)
+     goto got_wrong_format_error;
+=20
+-  if (i_ehdrp->e_shoff !=3D 0)
++  if (i_ehdrp->e_shoff >=3D sizeof (x_ehdr))
+     {
+       file_ptr where =3D (file_ptr) i_ehdrp->e_shoff;
+=20
+@@ -807,7 +807,7 @@ elf_object_p (bfd *abfd)
+   }
+     }
+=20
+-  if (i_ehdrp->e_shstrndx !=3D 0 && i_ehdrp->e_shoff !=3D 0)
++  if (i_ehdrp->e_shstrndx !=3D 0 && i_ehdrp->e_shoff >=3D sizeof (x_ehdr)=
)
+     {
+       unsigned int num_sec;
+=20
+--=20
+2.29.2
+
--=20
2.29.2

