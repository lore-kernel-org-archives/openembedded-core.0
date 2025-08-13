Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43522CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:11:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.99188.1755087085615677639
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0320ba7ade=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DBIfCA3850513
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:25 -0700
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fvchhq5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 05:11:25 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:11:22 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:11:20 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 6/6] elfutils: Fix CVE-2025-1377
Date: Wed, 13 Aug 2025 17:41:02 +0530
Message-ID: <20250813121102.779009-6-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250813121102.779009-1-soumya.sambu@windriver.com>
References: <20250813121102.779009-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MHRa0g-2NOwRoO8tEwc7nlQRP2etApQC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNSBTYWx0ZWRfX1rxr0qxWf3z/
 O31ZdpVtBGBgbalDALutUX6tuuSgKzcNoBMUetvmZwKvK2NxU6iMuQoZDkFz8x6t+YO7g1jpl4J
 m5dTw8+fiA17ju8ASqOsj5HVy1kQV+kb4lee13YDye/8G3cIf8vP10Gt4/ONT98wQL5ij/XiYOf
 yaty77rm+ipZMYHBLBD9EtjI0AsLkojTlEVpEQE2wAZ4XSSg1mGB5KHbGBy6bblFCSkBLxrSCSL
 0j3u7UVCjQ60NK/hBvrz+i0DSHllKlJlr3dva6n8WNpfFZNIxDJ64PzuHQVMX8XFBppqOX731Y0
 jWTXV9gYZHclc2zNxKSkrk0TSHIybARvkokDCEdFLcFSdR1nek0q8us5KkGpv4=
X-Proofpoint-ORIG-GUID: MHRa0g-2NOwRoO8tEwc7nlQRP2etApQC
X-Authority-Analysis: v=2.4 cv=RPGzH5i+ c=1 sm=1 tr=0 ts=689c80ed cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=y-d2qrJoStY-tIdE7G0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221812

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as problematic, has been found in GNU elfutils
0.192. This issue affects the function gelf_getsymshndx of the file strip.c of the
component eu-strip. The manipulation leads to denial of service. The attack needs to
be approached locally. The exploit has been disclosed to the public and may be used.
The identifier of the patch is fbf1df9ca286de3323ae541973b08449f8d03aba. It is
recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1377
https://ubuntu.com/security/CVE-2025-1377

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index f8cf083ec6..fb4109441b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1371.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..003215017f
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
@@ -0,0 +1,68 @@
+From fbf1df9ca286de3323ae541973b08449f8d03aba Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 13 Feb 2025 14:59:34 +0100
+Subject: [PATCH] strip: Verify symbol table is a real symbol table
+
+We didn't check the symbol table referenced from the relocation table
+was a real symbol table. This could cause a crash if that section
+happened to be an SHT_NOBITS section without any data. Fix this by
+adding an explicit check.
+
+       * src/strip.c (INTERNAL_ERROR_MSG): New macro that takes a
+       message string to display.
+       (INTERNAL_ERROR): Use INTERNAL_ERROR_MSG with elf_errmsg (-1).
+       (remove_debug_relocations): Check the sh_link referenced
+       section is real and isn't a SHT_NOBITS section.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32673
+
+CVE: CVE-2025-1377
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index 403e0f6..2b5d057 100644
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -126,13 +126,14 @@ static char *tmp_debug_fname = NULL;
+ /* Close debug file descriptor, if opened. And remove temporary debug file.  */
+ static void cleanup_debug (void);
+ 
+-#define INTERNAL_ERROR(fname) \
++#define INTERNAL_ERROR_MSG(fname, msg) \
+   do { \
+     cleanup_debug (); \
+     error_exit (0, _("%s: INTERNAL ERROR %d (%s): %s"),			\
+-		fname, __LINE__, PACKAGE_VERSION, elf_errmsg (-1));	\
++		fname, __LINE__, PACKAGE_VERSION, msg);	\
+   } while (0)
+ 
++#define INTERNAL_ERROR(fname) INTERNAL_ERROR_MSG(fname, elf_errmsg (-1))
+ 
+ /* Name of the output file.  */
+ static const char *output_fname;
+@@ -631,7 +632,14 @@ remove_debug_relocations (Ebl *ebl, Elf *elf, GElf_Ehdr *ehdr,
+ 	     resolve relocation symbol indexes.  */
+ 	  Elf64_Word symt = shdr->sh_link;
+ 	  Elf_Data *symdata, *xndxdata;
+-	  Elf_Scn * symscn = elf_getscn (elf, symt);
++	  Elf_Scn *symscn = elf_getscn (elf, symt);
++	  GElf_Shdr symshdr_mem;
++	  GElf_Shdr *symshdr = gelf_getshdr (symscn, &symshdr_mem);
++	  if (symshdr == NULL)
++	    INTERNAL_ERROR (fname);
++	  if (symshdr->sh_type == SHT_NOBITS)
++	    INTERNAL_ERROR_MSG (fname, "NOBITS section");
++
+ 	  symdata = elf_getdata (symscn, NULL);
+ 	  xndxdata = get_xndxdata (elf, symscn);
+ 	  if (symdata == NULL)
+-- 
+2.43.2
+
-- 
2.40.0


