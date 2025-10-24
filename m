Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0629FCCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:21:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10907.1761312052939261250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:20:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nga2ryDp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=23922b9735=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59OAQZt02735480
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:20:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uLNXV9pLnEw/bgNmpOyI
	PqHLL3XFVnJq32y3+UX7hwE=; b=nga2ryDpZlxZ/q25pdDVoHy4/LAMUIw6eVc6
	xiVPDg95yj+JUVuQsZnygxRisOmgT5xDjOq5Trnz/kHghaI5iWxAvl67VrO/XA1U
	xKH71s43IF9PhAvy/GCaHgSlSYSeo1HDj7Up85FPxAbd0OhOlurX+/2zLiVlPXER
	o917NhK8o2oDugRx14l8Kr5iLMLwc3au/AqeYPEd9a+8eFhawAwMQKZjRHgJorsW
	68R88Z6Sp6ghinf1rLayH5RSVCCYuUNvqDWaGnVGEgUgD4UNxQzEg97qx40wJoSw
	gedhSRfGjaEHoOX3FpUTgbWDEmqG0mqoitd1saa5/R8/N5KPyQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v660f6e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:20:52 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Fri, 24 Oct 2025 06:20:52 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Fri, 24 Oct 2025 06:20:50 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 1/2] elfutils: Fix CVE-2025-1376
Date: Fri, 24 Oct 2025 18:50:47 +0530
Message-ID: <20251024132047.1245402-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=VN3QXtPX c=1 sm=1 tr=0 ts=68fb7d34 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8
 a=t7CeM3EgAAAA:8 a=n9Nvxce8AAAA:8 a=20KFwNOVAAAA:8 a=gVDT7s7VQLW7QZflkVIA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=V4tbcg9hxeXQX3VEsxKP:22
X-Proofpoint-ORIG-GUID: 6VLO91pED5GEKp16Vbd59xsZusx1P4f_
X-Proofpoint-GUID: 6VLO91pED5GEKp16Vbd59xsZusx1P4f_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI0MDExOSBTYWx0ZWRfX0PNATS5rXKWY
 vLRAdRFXxnoWAVhQIRDfJca/0LKlqkMW4Tl8nGWO5cz4xDR5v3n3WYGDqMcOIea7x3/EvY+oamA
 PUZd5tvilrDRa26Y/0EUHTmabcKITUeGUbSrNSGSDMT2FUAvFq7sjbRxGu0gZfAbp7pcO23VBJi
 tOiq+tEJwfI9QZEV8Kf106IWV603b8mFpLsLTEeCGN/vMWX6AwZfGdJwhSr3TNXPJsuJotN/9NS
 gPBv/HfjCwqrh2Ml06Rn7SYM0+HkgWA3X4KgzIG2mosaiCFViRJ8FXTMmjf3ZnZMOYks6F8Qvr9
 GC2wS4oBsuVobmHjkHE2RHkeWLxhSB+mrhM+LKchpEVIWBmTuucrQ2lGvIex2I+5PcqOyyLXMmf
 SG26bbxidWmqoty++I0auWTbhP3MZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510240119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225296

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
 .../elfutils/elfutils_0.191.bb                |  1 +
 .../elfutils/files/CVE-2025-1376.patch        | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index fcb91e41aa..c5f357eb93 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://CVE-2025-1372.patch \
            file://CVE-2025-1371.patch \
            file://0007-Fix-build-with-gcc-15.patch \
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


