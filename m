Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E067CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 12:11:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.99649.1755087080545889547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 05:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0320ba7ade=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57DAtpBH3347053
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:19 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv001tk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:19 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 13 Aug 2025 05:11:16 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Wed, 13 Aug 2025 05:11:14 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 3/6] elfutils: Fix CVE-2025-1371
Date: Wed, 13 Aug 2025 17:40:59 +0530
Message-ID: <20250813121102.779009-3-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250813121102.779009-1-soumya.sambu@windriver.com>
References: <20250813121102.779009-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689c80e7 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=fxJcL_dCAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=oY9sVq7jc0uHDv3kPFoA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-ORIG-GUID: RC-gp0Dz-iIpf2JfqSFd3ogxJP-ZTK5C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDExNSBTYWx0ZWRfX7RaNooxL0bla
 uxHyFkTcQd+3q0q7JCOa5EBL1Sy6V8SE2w/8hJ1MqAH2/luncVdh0AlPzuyOraLPA5okwwVRGPm
 MPGIxCuO3rxRYfVs97vXkGWXyff+Qtc7qxzM3/gXw4IN3fW55pt8d2CLtKmECGzU8TqHrKJyxSo
 ZXhLV1Lk5TQcKYPFIUUegnv/Kyq/v4zO2Ptz3DpoC6XFwtSDSQA2OoKIPNzTnu2ZFyuMSLUn6SP
 ZtmFWUbHnEzw18vAQOCt02SAEqIa8jILLa3MCq6tmnI427j5VDjrPurshDarX3Z6aPClJlH1DRi
 1uA1OBAQcLmXX16Uud0N3qCxSY3Xp5PvXDwQKs5xghXUU+aiEUJQX+H9netrBk=
X-Proofpoint-GUID: RC-gp0Dz-iIpf2JfqSFd3ogxJP-ZTK5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 12:11:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221809

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability has been found in GNU elfutils 0.192 and classified as problematic.
This vulnerability affects the function handle_dynamic_symtab of the file readelf.c
of the component eu-read. The manipulation leads to null pointer dereference.
Attacking locally is a requirement. The exploit has been disclosed to the public and
may be used. The patch is identified as b38e562a4c907e08171c76b8b2def8464d5a104a. It
is recommended to apply a patch to fix this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-1371
https://ubuntu.com/security/CVE-2025-1371

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=b38e562a4c907e08171c76b8b2def8464d5a104a

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.192.bb                |  1 +
 .../elfutils/files/CVE-2025-1371.patch        | 41 +++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.192.bb b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
index ff40ba64ec..2f34bfeebb 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.192.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.192.bb
@@ -24,6 +24,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-libelf-Add-libeu-objects-to-libelf.a-static-archive.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
+           file://CVE-2025-1371.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
new file mode 100644
index 0000000000..9ecb045f82
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
@@ -0,0 +1,41 @@
+From b38e562a4c907e08171c76b8b2def8464d5a104a Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Sun, 9 Feb 2025 00:07:13 +0100
+Subject: [PATCH] readelf: Handle NULL phdr in handle_dynamic_symtab
+
+A corrupt ELF file can have broken program headers, in which case
+gelf_getphdr returns NULL. This could crash handle_dynamic_symtab
+while searching for the PT_DYNAMIC phdr. Fix this by checking whether
+gelf_phdr returns NULL.
+
+	  * src/readelf.c (handle_dynamic_symtab): Check whether
+          gelf_getphdr returns NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32655
+
+CVE: CVE-2025-1371
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=b38e562a4c907e08171c76b8b2def8464d5a104a]
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ src/readelf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/readelf.c b/src/readelf.c
+index 105cddf..a526fa8 100644
+--- a/src/readelf.c
++++ b/src/readelf.c
+@@ -2912,7 +2912,7 @@ handle_dynamic_symtab (Ebl *ebl)
+   for (size_t i = 0; i < phnum; ++i)
+     {
+       phdr = gelf_getphdr (ebl->elf, i, &phdr_mem);
+-      if (phdr->p_type == PT_DYNAMIC)
++      if (phdr == NULL || phdr->p_type == PT_DYNAMIC)
+ 	break;
+     }
+   if (phdr == NULL)
+-- 
+2.43.2
+
-- 
2.40.0


