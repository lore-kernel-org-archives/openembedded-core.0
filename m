Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.79])
 by mx.groups.io with SMTP id smtpd.web12.5283.1610732504738395333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 09:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=K4SSC0Gh;
 spf=pass (domain: windriver.com, ip: 40.107.244.79, mailfrom: yifan.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3Vjz8KuJtiw/MsS/bDnfNDgphqJVQ543oaKaJTnSfTWgiHb3nTrZQFdRTWJw9+vawrmVd6UZjeoNUHcsc+1go3x5rekPUW+mhhvel0TxeUuKBM5BiD4D/vc6N5S+7HeZ23wHLwt74DnHZmijuP5dDuV9384Q6x0t9Gk3HqU462nrEUY6DwxtTkTn+H766XFQt/VBDLAsyp3QLFKCKqss7HkHqiZyMNSCoWoqUv2fMDyaj7ngv21EmBLQ69oAjA6qoPvYx/wLOwmXwFoyxY+H0hfdQExbDRAszpFyTgR2jkSeKAyKODB+Rasz5iO72AnZyCoDoBUwDA7JuuDYMdDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF+eypyf8mNq/O/UPB/xJSlXczNjIUSdcwhM76zbTVM=;
 b=hNe7FlR+K/WcjUeEu3TCsFH8kgjfu1At+KCbSndHYuOy8IzInIjF2aUXIWykl6ThxTRU4PwtvTjRSGkwQZcQxNVLsyt01BQTS4X5TBBufYD7nTLw1UzQPKydzhx8S/6h9T42e0ICLcRxA3O5frPuvxVh3bgAb7wBgR2oIlvwfOgX959s8ujO6Qwe9/lLbo5QSKiIEJLxkNyHBPQhm7t/FGD415moHyx5uBgTEzqgU9Cs+MsxC0fqio4VIf1Twn+ALq1oxrt6zkHtRiqW+qQEnMVDhQmTo+Pya+d+Ry6JPEvw8DVqpqpG1Y/8z8hsUxMnwwfRTGjoOYEKr1iN8BOiNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF+eypyf8mNq/O/UPB/xJSlXczNjIUSdcwhM76zbTVM=;
 b=K4SSC0GhbtZb0vrT/IX5De6h7mNfQ6kZtmcD8GwPM/pqyfoK2dWfdQaBbfeaLRrjeqyGGfAkuantIZx5Zxu2ye/1oBZSt2oNlNYXjOPDOAASBgeLZJRaWgabEuFnsP6CEG4Oc3IaJBhHKGCMmEfoEM7vHCIEUwNhq5x9+fK0LQQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17)
 by SN6PR11MB2910.namprd11.prod.outlook.com (2603:10b6:805:da::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 15 Jan
 2021 17:41:42 +0000
Received: from SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3]) by SA0PR11MB4719.namprd11.prod.outlook.com
 ([fe80::1c2f:159e:f6f6:36f3%9]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 17:41:42 +0000
From: "Yi Fan Yu" <yifan.yu@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: yifan.yu@windriver.com,
	randy.macleod@windriver.com
Subject: [oe-core][PATCH v2] binutils: Fix CVE-2020-35448
Date: Fri, 15 Jan 2021 12:41:29 -0500
Message-ID: <20210115174129.15819-1-yifan.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To SA0PR11MB4719.namprd11.prod.outlook.com
 (2603:10b6:806:95::17)
Return-Path: yifan.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-lpggp3.wrs.com (128.224.252.2) by YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend Transport; Fri, 15 Jan 2021 17:41:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c012430e-3b88-4077-8db8-08d8b97cd235
X-MS-TrafficTypeDiagnostic: SN6PR11MB2910:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB2910D2112FC749CB2C067BF180A70@SN6PR11MB2910.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DqYKPmCEtUO40BrXGt9OGJFZYl5gSaciW1p/LtbkMk1l9RfV7uradxzzEjdUffXxJkppAmlSzhwYAIL6Sb0Dp2HgbgVuUTmEcn/o2AaF21H4fK8ovknanbiD8Y8f1koG0cYBbqpvCpWZzZZztd3QBY8ZlKS6wyUdnkJZeeWNskqb9+u88qqkbqLHXz5BkXHL3r9Bl88cLo5hU184OpYrUR6Jjz7V1dSqxAu7zWBeK2dZUepV0xJtfr5TbIUQEQQfI2NF7x9Wfll50OKLwVtOxTGYF+IMZPnu5RZTuoPOVOrsYEgfDVN20stqiP09l2mMW6DBztbY7prqbU7hUs46aQ1YllBh4h+7y8QnY6ywdkvTD0od3F19lFK3ZlxgDKajMGb4lVcDQY1xxSZckj51eFFbZyWrLfu3mIrM8uN83e6qHg5CiEgc0En4Lq/dvaB5biiv0gu6mygZbzzsUsgCiqI4iDKs8bDVfs2T5jw851z9JwK7ZyRUcKXtSV3MOiNUrFwttU8D2NFir3wWfOmpdQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4719.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39850400004)(6916009)(26005)(5660300002)(4326008)(6666004)(8676002)(8936002)(1076003)(316002)(6512007)(6506007)(2906002)(52116002)(66946007)(107886003)(16526019)(186003)(478600001)(6486002)(2616005)(66476007)(966005)(66556008)(86362001)(83080400002)(83380400001)(956004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XxleIGot2aPrUyE+iCzhHzGg7hPITNPqR8mmAsNtmN5NrVsWWtaVCsgbRIIh?=
 =?us-ascii?Q?yVyUmOmsmHWJC7OJo2NKB+jinpgyUQHMNw5/2E94CSIuFxBH6ItdUYXIoD30?=
 =?us-ascii?Q?4ACtnE4NFrraxuFCjFEAaK+Pjwg8GiWxQW8/k1RSHW/Ru9yuyNZNk338tej5?=
 =?us-ascii?Q?0Q72i706VSmCgxGxn6benIfKGE2mpHsaX8w0RpiAG5MZufJjMoAQebVqeYsz?=
 =?us-ascii?Q?CDGabQGoO0ZJGIZLudovLbPSrzeaEmqGC5ehU9ib6Iq42OHIFGOlmZnlEkP/?=
 =?us-ascii?Q?MUoTSbpaa3UpyRPxVabXGDxXDABBHk7zbGS2Obex0Wcua18MFg1uoA/dMyKQ?=
 =?us-ascii?Q?/iBUNUb7SkHKWrzaWGLb7lWyKzKYWstsmQvReNDT9wIql1KFL68MT1VAAfQ9?=
 =?us-ascii?Q?ObfODVQBIS0BkvXtWmfqpzX5EGJsfyFDBa79Xt1QruK4hEAPUVI/TUbjpirh?=
 =?us-ascii?Q?Jq8h3apGSqpCn7cUQE78h3VU/6kdM1LaciUjd4/vr508/HyaOQWnbTkhH7oV?=
 =?us-ascii?Q?2zD0M9NNbYa8UEI1JLnhY/nE3cN3LfvKb2L1FybpdEBp0It1nPuOyVY1U4PB?=
 =?us-ascii?Q?a27SmRPLPxzriIP4UhtJwqBFK/EpmcBgWn3eNgD0VLg4xMSu9VEOhtgdUVqn?=
 =?us-ascii?Q?2aangsBseSjteRERebNoh8+ONmlbP5eqXXGSvtPGNsGZyb0Aa5BwjBMMXnJk?=
 =?us-ascii?Q?aVkHHvru55/QcxfUu56yujRjk3GKNBYLHBKF9KG6W0wBg+1Z/Yl+i9o14kpo?=
 =?us-ascii?Q?T42KAALX9N0H7SqbaPErn+9zKlL7okWllaQmCuGXZCp8go0rT+MKuEqQHihq?=
 =?us-ascii?Q?BSganrcZKXpkvCAjyxB9l9a5Ac/YBd3NvjHuxdy0plbiAUhJDvj/t2JbUFgx?=
 =?us-ascii?Q?ljsmYWovkvmv5KdnIt2/iIdzBVIP579PsU0H1Z2TMELi1vaX0nFAvpSj8FhI?=
 =?us-ascii?Q?pT5ZRXyN9bHznHKYSavX1WM16v8QmF3WWU5+Jp3Jmu0sbKVVF7dbzxWNSPiF?=
 =?us-ascii?Q?cHgb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c012430e-3b88-4077-8db8-08d8b97cd235
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 17:41:42.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJ7dAFp8GIZttEBopXA/SsVslw0JAw4ayQx8Yf1nP9t0YgFWeSHuoJ1nhbEBLqJZJGMLM3qc5Bg1E4Cf+JhMFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2910
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
 .../binutils/binutils/CVE-2020-35448.patch    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
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
index 0000000000..3bc64776e5
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2020-35448.patch
@@ -0,0 +1,85 @@
+From 6caa41daeb7aa17c400b7300fb78d207cf064d70 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 4 Sep 2020 19:19:18 +0930
+Subject: [PATCH] PR26574, heap buffer overflow in
+ _bfd_elf_slurp_secondary_reloc_section
+
+A horribly fuzzed object with section headers inside the ELF header.
+Disallow that, and crazy reloc sizes.
+
+	PR 26574
+	* elfcode.h (elf_object_p): Sanity check section header offset.
+	* elf.c (_bfd_elf_slurp_secondary_reloc_section): Sanity check
+	sh_entsize.
+
+Upstream-Status: Backport
+CVE: CVE-2020-35448
+
+Reference to upstream patch:
+https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;
+    h=3D8642dafaef21aa6747cec01df1977e9c52eb4679
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
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
+-	  && hdr->sh_info =3D=3D (unsigned) elf_section_data (sec)->this_idx)
++	  && hdr->sh_info =3D=3D (unsigned) elf_section_data (sec)->this_idx
++	  && (hdr->sh_entsize =3D=3D ebd->s->sizeof_rel
++	      || hdr->sh_entsize =3D=3D ebd->s->sizeof_rela))
+ 	{
+ 	  bfd_byte * native_relocs;
+ 	  bfd_byte * native_reloc;
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
+ 	}
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

