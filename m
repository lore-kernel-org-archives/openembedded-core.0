Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E019ACCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:21:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10915.1761312070377181001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lTwFZyE5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23922b9735=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59O8v1mp4060990
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=6IR9xuU3zfRjal/BfyyF
	vN6GBPh3a0fx6WNtaURm8p4=; b=lTwFZyE5bSSn8hSXTuvOpr4yLTDXr2im2/zZ
	ekt5+V4RbmlRCxMQUy8J982H0AG++wdMAxZ0oSHRckaJcnPlW5fGLBXmG4oao5Tn
	WtXjxkynjrDJ5fyF4ctTtdCqtikwGNY32U9uS7qbNxdlNejBmptOLtwevxyKz4OO
	G52wdeapKp1NNAJc0wH0tZ+SUOYupVNxhZqQ5w8utfG3VP3YgkTicxMvJekng+9X
	kz/V+DtZrJawH+6qFBtRw4KXQKnSsdhtFF0uHrHImiedMMCAc1sLr2J8eV4iFMGl
	xNPQIvYdlBHaO/Y4b7QfOLbX3M8KFbMp0wd6OQq8DXmIscExeQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49wrpxd8me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:21:09 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 06:21:08 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 06:21:07 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 2/2] elfutils: Fix CVE-2025-1377
Date: Fri, 24 Oct 2025 18:51:03 +0530
Message-ID: <20251024132103.1246994-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=b9O/I9Gx c=1 sm=1 tr=0 ts=68fb7d45 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=y-d2qrJoStY-tIdE7G0A:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-GUID: Sf_cfRRHW-16PV049z-US5vLW1dQ1EBF
X-Proofpoint-ORIG-GUID: Sf_cfRRHW-16PV049z-US5vLW1dQ1EBF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExOSBTYWx0ZWRfX1yeMg0cLILfe
 x0Ep+Z0a4rGTdoFJIjfXxJ7X1HrK3eaD6B7QIiVmbAjV/w3BEF9UTlXUkbz8k4qfmBSYjKlbIyl
 5C1eSFE5VnSMxfl0V8ZZEL91dMBlJW5FGNiYnNAkWpzX4/BikYK6UraTe2PS3w0k0lAZDKYXZEe
 IOhRcOFf0PF1P3AYzvmY8BOHNQWyMV1fPhlw4Lqdy7rWnaTxZkHGkhbjBjUV4EDFSBHC5X4gvRh
 WiEPsodQlu+I7VQpvjzN83E+pLZU2yYaPNEoyDqqblh/Q7MFCm8hcAGkQxLyQI3jhM4/cYqute3
 F0e5InpgMnp8LdI9LreEoj17X5mWycxnvTqo5QrckcyTi3OueTLiOk63oUSdzskPVg7MYe/YNld
 Sv6OfEA1Wfjp4BL+YioJIJGFQRv0lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:21:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225297

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
https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1377.patch        | 69 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index c5f357eb93..0fd6d31af1 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1371.patch \
            file://0007-Fix-build-with-gcc-15.patch \
            file://CVE-2025-1376.patch \
+           file://CVE-2025-1377.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
new file mode 100644
index 0000000000..31a9ec33f2
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
@@ -0,0 +1,69 @@
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
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=fbf1df9ca286de3323ae541973b08449f8d03aba]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/strip.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/src/strip.c b/src/strip.c
+index 6436443..16922e9 100644
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
+2.40.0
+
-- 
2.40.0


