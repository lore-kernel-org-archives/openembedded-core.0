Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB2AC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:11:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.99648.1755087077870902308
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320ba7ade=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DAthZS3792344
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvk21q3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:11:14 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:11:12 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 2/6] elfutils: Fix CVE-2025-1365
Date: Wed, 13 Aug 2025 17:40:58 +0530
Message-ID: <20250813121102.779009-2-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250813121102.779009-1-soumya.sambu@windriver.com>
References: <20250813121102.779009-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNSBTYWx0ZWRfXyQ6hBEWLkFQL
 3t+kl9JFOZ+5YmBwQRHlKHC2Gxe0P8GS5zd1dC/eG0NWciVOnuywpxJlILfj2PIty0BlfFeMZiS
 ACei2c/3Gvyr0WkIIIJ3oNL0Qv0POAKeXi2np6trGaD7V5DLbdu4eNt1/oNsMit1eyE3LJV/Alo
 lp4Q4m2f12yzDkqCsHov/kt7ushx9A/V0H0mARwKkVRhll5wltJwz3uMPqCtB+q5fvmJBxnCuHP
 nKtY6tGDkDf+7HGxOmN99amI6TLxa31MNDf9ybcwe7eejsJ64gLETeCD115heCVJ9oiooHg+P1c
 uqGKJ7BZKjdlXpQONIEasjjbAINtT/YaizHkJUuW93asnHE/zL2gbvPjZ5AOFc=
X-Proofpoint-ORIG-GUID: 1NBUrXfYMCkBTPQubuB-az0YKBmtu649
X-Proofpoint-GUID: 1NBUrXfYMCkBTPQubuB-az0YKBmtu649
X-Authority-Analysis: v=2.4 cv=PsOTbxM3 c=1 sm=1 tr=0 ts=689c80e5 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=wcQEek_B8788ZG99LD0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221808

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as critical, was found in GNU elfutils
0.192. This affects the function process_symtab of the file readelf.c of the
component eu-readelf. The manipulation of the argument D/a leads to buffer
overflow. Local access is required to approach this attack. The exploit has
been disclosed to the public and may be used. The identifier of the patch is
5e5c0394d82c53e97750fe7b18023e6f84157b81. It is recommended to apply a patch
to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1365
https://ubuntu.com/security/CVE-2025-1365

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.192.bb                |   1 +
 .../elfutils/files/CVE-2025-1365.patch        | 152 ++++++++++++++++++
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index 829d9bf94f..ff40ba64ec 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-config-eu.am-do-not-force-Werror.patch \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
            file://CVE-2025-1352.patch \
+           file://CVE-2025-1365.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
new file mode 100644
index 0000000000..b779685efd
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
@@ -0,0 +1,152 @@
+From 5e5c0394d82c53e97750fe7b18023e6f84157b81 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sat, 8 Feb 2025 21:44:56 +0100
+Subject: [PATCH] libelf, readelf: Use validate_str also to check dynamic
+ symstr data
+
+When dynsym/str was read through eu-readelf --dynamic by readelf
+process_symtab the string data was not validated, possibly printing
+unallocated memory past the end of the symstr data. Fix this by
+turning the elf_strptr validate_str function into a generic
+lib/system.h helper function and use it in readelf to validate the
+strings before use.
+
+	* libelf/elf_strptr.c (validate_str): Remove to...
+	* lib/system.h (validate_str): ... here. Make inline, simplify
+	check and document.
+	* src/readelf.c (process_symtab): Use validate_str on symstr_data.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32654
+
+CVE: CVE-2025-1365
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=5e5c0394d82c53e97750fe7b18023e6f84157b81]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ lib/system.h        | 27 +++++++++++++++++++++++++++
+ libelf/elf_strptr.c | 18 ------------------
+ src/readelf.c       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 21 deletions(-)
+
+diff --git a/lib/system.h b/lib/system.h
+index 0db12d9..0698e5f 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -34,6 +34,7 @@
+ #include <config.h>
+ 
+ #include <errno.h>
++#include <stdbool.h>
+ #include <stddef.h>
+ #include <stdint.h>
+ #include <string.h>
+@@ -117,6 +118,32 @@ startswith (const char *str, const char *prefix)
+   return strncmp (str, prefix, strlen (prefix)) == 0;
+ }
+ 
++/* Return TRUE if STR[FROM] is a valid string with a zero terminator
++   at or before STR[TO - 1].  Note FROM is an index into the STR
++   array, while TO is the maximum size of the STR array.  This
++   function returns FALSE when TO is zero or FROM >= TO.  */
++static inline bool
++validate_str (const char *str, size_t from, size_t to)
++{
++#if HAVE_DECL_MEMRCHR
++  // Check end first, which is likely a zero terminator,
++  // to prevent function call
++  return (to > 0
++	  && (str[to - 1] == '\0'
++	      || (to > from
++		  && memrchr (&str[from], '\0', to - from - 1) != NULL)));
++#else
++  do {
++    if (to <= from)
++      return false;
++
++    to--;
++  } while (str[to]);
++
++  return true;
++#endif
++}
++
+ /* A special gettext function we use if the strings are too short.  */
+ #define sgettext(Str) \
+   ({ const char *__res = strrchr (_(Str), '|');			      \
+diff --git a/libelf/elf_strptr.c b/libelf/elf_strptr.c
+index 79a24d2..c5a94f8 100644
+--- a/libelf/elf_strptr.c
++++ b/libelf/elf_strptr.c
+@@ -53,24 +53,6 @@ get_zdata (Elf_Scn *strscn)
+   return zdata;
+ }
+ 
+-static bool validate_str (const char *str, size_t from, size_t to)
+-{
+-#if HAVE_DECL_MEMRCHR
+-  // Check end first, which is likely a zero terminator, to prevent function call
+-  return ((to > 0 && str[to - 1]  == '\0')
+-	  || (to - from > 0 && memrchr (&str[from], '\0', to - from - 1) != NULL));
+-#else
+-  do {
+-    if (to <= from)
+-      return false;
+-
+-    to--;
+-  } while (str[to]);
+-
+-  return true;
+-#endif
+-}
+-
+ char *
+ elf_strptr (Elf *elf, size_t idx, size_t offset)
+ {
+diff --git a/src/readelf.c b/src/readelf.c
+index 3e97b64..105cddf 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2639,6 +2639,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       char typebuf[64];
+       char bindbuf[64];
+       char scnbuf[64];
++      const char *sym_name;
+       Elf32_Word xndx;
+       GElf_Sym sym_mem;
+       GElf_Sym *sym
+@@ -2650,6 +2651,19 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+       /* Determine the real section index.  */
+       if (likely (sym->st_shndx != SHN_XINDEX))
+         xndx = sym->st_shndx;
++      if (use_dynamic_segment == true)
++	{
++	  if (validate_str (symstr_data->d_buf, sym->st_name,
++			    symstr_data->d_size))
++	    sym_name = (char *)symstr_data->d_buf + sym->st_name;
++	  else
++	    sym_name = NULL;
++	}
++      else
++	sym_name = elf_strptr (ebl->elf, idx, sym->st_name);
++
++      if (sym_name == NULL)
++	sym_name = "???";
+ 
+       printf (_ ("\
+ %5u: %0*" PRIx64 " %6" PRId64 " %-7s %-6s %-9s %6s %s"),
+@@ -2662,9 +2676,7 @@ process_symtab (Ebl *ebl, unsigned int nsyms, Elf64_Word idx,
+               get_visibility_type (GELF_ST_VISIBILITY (sym->st_other)),
+               ebl_section_name (ebl, sym->st_shndx, xndx, scnbuf,
+                                 sizeof (scnbuf), NULL, shnum),
+-              use_dynamic_segment == true
+-                  ? (char *)symstr_data->d_buf + sym->st_name
+-                  : elf_strptr (ebl->elf, idx, sym->st_name));
++              sym_name);
+ 
+       if (versym_data != NULL)
+         {
+-- 
+2.43.2
+
-- 
2.40.0


