Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6114CE7B00
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:19:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16678.1763122791896796946
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P81KIStQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34138fee75=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE5kxaK2778369
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:19:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=wvkf9nTS7g1wdsYr17oJa/wwhWBP9FhnrC4wCVKHYOc=; b=P81KIStQjqxq
	okRjQD3Ywza2xdb5USPVELHF/WRiS/EiMbWtiorEM6q025rdzcykAH+SRtU7B3Du
	ogzt5R4KvOb/WW7tkuG+0CVGZXyDzcxoWHAHsX54/tNmkQiJrXY419Rc7cY8f+nD
	kwOWpl5bEINB7SANKlKqN/16ogd78B5283ggGwbiw/DF4VqMM6HHUhPvSu4Hrb9T
	vGgxFCQwBNBtOzPnmEF1dghUDVDFmymsLwkQMzdYG3+/v9J8taerX5FLGyas01wE
	luB5JeB6EWy02Z8wSa7boG2Iy+Kr38ExCFdO7i76GY1lirs7cLunI/aLIZisv4/I
	4t5t0kGa7g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtr2gg70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 04:19:51 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 04:19:50 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 04:19:49 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 2/2] elfutils: Fix CVE-2025-1377
Date: Fri, 14 Nov 2025 17:49:41 +0530
Message-ID: <20251114121941.4133042-2-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20251114121941.4133042-1-soumya.sambu@windriver.com>
References: <20251114121941.4133042-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5OCBTYWx0ZWRfXzqktPRjl/kcZ
 gVRM/Gf84ZkCLSf4+kOtnl4MwWZ0vtnEID8xRDKB2TYmkuk8HA85r8LY0EQ7+dWmKjbNDVI13xf
 WbOkAcNXX263VFyNjgsOhKcGSdzVDtRfm6deQjybGutVpJF6XDQr1ZimlfhymTmA5LqjgpknPSp
 mQmmpEL/SKhqvtf/5PlpFqwA7cXrvJbo2X4yKwwm4MUGplqy0J0K8/0HxAb5McbR/0h+0xw332q
 FkVPzGbE6GVC8iREOZEsSwuUOdTAfcullQKJ4kiXMHStQCRVrFYCg2VqGR2lG5ejPFoCTU774S7
 yFo3U0lWGAucmLsahsYQIIvXcylIC8tyVarq8Uqihx/qFeA2JDV4Ckcnv8tLABfngp8tWuX+tXx
 /IbJDh3wrWKI4Dp26wfqh6EgBQ+hxw==
X-Proofpoint-GUID: TUjWW_mSWtJ8Yw_rBFghecKoOXhwhry2
X-Authority-Analysis: v=2.4 cv=fMM0HJae c=1 sm=1 tr=0 ts=69171e67 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=Cf4WFWjvce3MkOfJXmwA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-ORIG-GUID: TUjWW_mSWtJ8Yw_rBFghecKoOXhwhry2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226290

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability, which was classified as problematic, has been found in GNU elfutils
0.192. This issue affects the function gelf_getsymshndx of the file strip.c of the
component eu-strip. The manipulation leads to denial of service. The attack needs to
be approached locally. The exploit has been disclosed to the public and may be used.
The identifier of the patch is fbf1df9ca286de3323ae541973b08449f8d03aba. It is
recommended to apply a patch to fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1377

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.186.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 68 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index 9f0fb43d50..f97a97c673 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..3a4c0136b8
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
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1377
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index d5b753d..0cfd8c8 100644
+--- a/src/strip.c
++++ b/src/strip.c
+@@ -127,13 +127,14 @@ static char *tmp_debug_fname = NULL;
+ /* Close debug file descriptor, if opened. And remove temporary debug file.  */
+ static void cleanup_debug (void);
+ 
+-#define INTERNAL_ERROR(fname) \
++#define INTERNAL_ERROR_MSG(fname, msg) \
+   do { \
+     cleanup_debug (); \
+     error (EXIT_FAILURE, 0, _("%s: INTERNAL ERROR %d (%s): %s"),      \
+-	   fname, __LINE__, PACKAGE_VERSION, elf_errmsg (-1)); \
++	   fname, __LINE__, PACKAGE_VERSION, msg); \
+   } while (0)
+ 
++#define INTERNAL_ERROR(fname) INTERNAL_ERROR_MSG(fname, elf_errmsg (-1))
+ 
+ /* Name of the output file.  */
+ static const char *output_fname;
+@@ -632,7 +633,13 @@ remove_debug_relocations (Ebl *ebl, Elf *elf, GElf_Ehdr *ehdr,
+ 	     resolve relocation symbol indexes.  */
+ 	  Elf64_Word symt = shdr->sh_link;
+ 	  Elf_Data *symdata, *xndxdata;
+-	  Elf_Scn * symscn = elf_getscn (elf, symt);
++	  Elf_Scn *symscn = elf_getscn (elf, symt);GElf_Shdr symshdr_mem;
++          GElf_Shdr *symshdr = gelf_getshdr (symscn, &symshdr_mem);
++          if (symshdr == NULL)
++            INTERNAL_ERROR (fname);
++          if (symshdr->sh_type == SHT_NOBITS)
++            INTERNAL_ERROR_MSG (fname, "NOBITS section");
++
+ 	  symdata = elf_getdata (symscn, NULL);
+ 	  xndxdata = get_xndxdata (elf, symscn);
+ 	  if (symdata == NULL)
+-- 
+2.40.0
+
-- 
2.40.0


