Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E17CE7AFE
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 12:19:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16550.1763122790883252358
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 04:19:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dS6N3JZf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34138fee75=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AE7s4ax685536
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:19:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=qdZgE5yTSCkbXwfgS3c6
	525S+2Pf4wgX9sxiC129rxA=; b=dS6N3JZfHpjFM/LmiUIftunpqbYe74jvCtIZ
	HBgr6zgPsR8LK6l8oLUlBkX1j5rp9JFoFheYQXAPasnHjzb8CmocFUI0rb3SEdk3
	LNi8NYxDscIzK9VMWbCPFkNEMnWw0ZGRBEAdFys0jOuOhUklXWNfbxSNmXAZ6tj6
	tPvcTqTdKVwK7dnEvGH0eaXS88/8hwAE+9Av9hAbH+tn+zUbgWrxaxgJbDCQuLF+
	JvpcOpx6g49nGq8v9InHwI+bPCWARAlCLywqZeScXawqBoipsq9VhdXO7XyzXAEE
	DXo/tFRdW6jP2hVpXQZcSsx/m2ti0QgTSN5IV/RzeVFoZjfrPw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4adtr5gggd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:19:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 14 Nov 2025 04:19:48 -0800
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 14 Nov 2025 04:19:47 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/2] elfutils: Fix CVE-2025-1376
Date: Fri, 14 Nov 2025 17:49:40 +0530
Message-ID: <20251114121941.4133042-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KY/fcAYD c=1 sm=1 tr=0 ts=69171e65 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=20KFwNOVAAAA:8 a=gVDT7s7VQLW7QZflkVIA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-GUID: Q7aCoBk_ViXDQXyWzTsS3i_1iZcgH_N8
X-Proofpoint-ORIG-GUID: Q7aCoBk_ViXDQXyWzTsS3i_1iZcgH_N8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA5OCBTYWx0ZWRfX7qN+Bt5Sg2HT
 QjS0/+ZDUPosgXvMVLGSFW8xTh10+UNx4TWwgTQcf/SIkrWinv+Zi/BPzqI2KZXe//JlBNUcs7Z
 xQ/+GNbYfrzf1V9jaF7LSz5bhsO6nzMpcjMUvEFMbDSfBBaHLc5eSG9wEEjr6JUCE4iyIGMnt//
 OHcuTYT3axm5O+b7GT5WOJ53mewwZqYyO8zIGiqvd0OrFqrjuxm8FE5c32a/EqLf19+GqDg6i1W
 f8Gcu+kCSDvbuK3iikoYQitFiO6P/EsPCJLMWpnycm4hrFewdTWcOtZoHoIsZZdHm6Ls7e9kNb+
 W3lFuX8YbZmYT5cG/jswEkQtO+XEtitLOn3Hl1J34rRjLo90W+n3NuaVz0gqq53fKRYmaQHu77I
 PVAJSwdHtTKQVIcTEki09tTLnIb+rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140098
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 12:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226289

From: Soumya Sambu <soumya.sambu@windriver.com>

A vulnerability classified as problematic was found in GNU elfutils 0.192. This
vulnerability affects the function elf_strptr in the library /libelf/elf_strptr.c
of the component eu-strip. The manipulation leads to denial of service. It is
possible to launch the attack on the local host. The complexity of an attack is
rather high. The exploitation appears to be difficult. The exploit has been
disclosed to the public and may be used. The name of the patch is
b16f441cca0a4841050e3215a9f120a6d8aea918. It is recommended to apply a patch to
fix this issue.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-1376

Upstream patch:
https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../elfutils/elfutils_0.186.bb                |  1 +
 .../elfutils/files/CVE-2025-1376.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.186.bb b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
index b945766b75..9f0fb43d50 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.186.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.186.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-debuginfod-debuginfod-client.c-use-long-for-cache-ti.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1372.patch \
+           file://CVE-2025-1376.patch \
            "
 SRC_URI:append:libc-musl = " \
            file://0003-musl-utils.patch \
diff --git a/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
new file mode 100644
index 0000000000..1f40add305
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
@@ -0,0 +1,58 @@
+From b16f441cca0a4841050e3215a9f120a6d8aea918 Mon Sep 17 00:00:00 2001
+From: Mark Wielaard <mark@klomp.org>
+Date: Thu, 13 Feb 2025 00:02:32 +0100
+Subject: [PATCH] libelf: Handle elf_strptr on section without any data
+
+In the unlikely situation that elf_strptr was called on a section with
+sh_size already set, but that doesn't have any data yet we could crash
+trying to verify the string to return.
+
+This could happen for example when a new section was created with
+elf_newscn, but no data having been added yet.
+
+        * libelf/elf_strptr.c (elf_strptr): Check strscn->rawdata_base
+        is not NULL.
+
+https://sourceware.org/bugzilla/show_bug.cgi?id=32672
+
+Signed-off-by: Mark Wielaard <mark@klomp.org>
+
+CVE: CVE-2025-1376
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=elfutils.git;a=commit;h=b16f441cca0a4841050e3215a9f120a6d8aea918]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ libelf/elf_strptr.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libelf/elf_strptr.c b/libelf/elf_strptr.c
+index c5a94f8..7be7f5e 100644
+--- a/libelf/elf_strptr.c
++++ b/libelf/elf_strptr.c
+@@ -1,5 +1,6 @@
+ /* Return string pointer from string section.
+    Copyright (C) 1998-2002, 2004, 2008, 2009, 2015 Red Hat, Inc.
++   Copyright (C) 2025 Mark J. Wielaard <mark@klomp.org>
+    This file is part of elfutils.
+    Contributed by Ulrich Drepper <drepper@redhat.com>, 1998.
+ 
+@@ -183,9 +184,12 @@ elf_strptr (Elf *elf, size_t idx, size_t offset)
+       // initialized yet (when data_read is zero). So we cannot just
+       // look at the rawdata.d.d_size.
+ 
+-      /* Make sure the string is NUL terminated.  Start from the end,
+-	 which very likely is a NUL char.  */
+-      if (likely (validate_str (strscn->rawdata_base, offset, sh_size)))
++      /* First check there actually is any data.  This could be a new
++         section which hasn't had any data set yet.  Then make sure
++         the string is at a valid offset and NUL terminated.  */
++      if (unlikely (strscn->rawdata_base == NULL))
++	__libelf_seterrno (ELF_E_INVALID_SECTION);
++      else if (likely (validate_str (strscn->rawdata_base, offset, sh_size)))
+ 	result = &strscn->rawdata_base[offset];
+       else
+ 	__libelf_seterrno (ELF_E_INVALID_INDEX);
+-- 
+2.40.0
+
-- 
2.40.0


