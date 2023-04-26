Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FC7C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 06:46:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.2027.1682491607162366987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 23:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mRLwkYPb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3480121a11=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q694ux008998
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 23:46:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=ju8mTdeNuSaw5pMOaPGMf+eXjBOVj4KSrQHU3nTs8FA=;
 b=mRLwkYPbeQ/SKL7Ckh4I1VxVvOROs6Gsjh951gkwfnlSAJCFghxSmIl6Sfb1QG39hmSN
 342VSgv0kbfIVnbbdOGzgzqaVMNtz9n7R1UloX0z63KlrOQ6H3EzF6/Csqfq+tjLt6rM
 5GOUxW2xPmt8LcoHTnr+Vq9qgsvMbdkzxqPH2tnlq1FIkvy39qYz0UrFRjWEnkp844OU
 Iamnj3Hxp8fNjZiBvuC3akgNnvKmdpcMqFUijCo5BkIg+vHAPUD9cjfMO9dL5zN8LWw1
 nnycMXTANfEjPONZEOn9Qmd6APBBNC2It7oAZsgdOos3TjaYOqiLni+/CvKGeTT5lmYT 1Q== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q4f3mkrpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 23:46:46 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 25 Apr 2023 23:46:44 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <archana.polampalli@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] nasm: fix CVE-2022-44370
Date: Wed, 26 Apr 2023 06:46:18 +0000
Message-ID: <20230426064618.3206190-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: qS3SgOUQP1AMAtkNJB5MIWjdcLvwUAzz
X-Proofpoint-GUID: qS3SgOUQP1AMAtkNJB5MIWjdcLvwUAzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-26_02,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 mlxlogscore=964 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 06:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180406

NASM v2.16 was discovered to contain a heap buffer overflow in the
component quote_for_pmake() asm/nasm.c:856

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-44370

Upstream patches:
https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../nasm/nasm/CVE-2022-44370.patch            | 104 ++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
new file mode 100644
index 0000000000..b131460a69
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
@@ -0,0 +1,104 @@
+From b37677f7e40276bd8f504584bcba2c092f1146a8 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@zytor.com>
+Date: Mon, 7 Nov 2022 10:26:03 -0800
+Subject: [PATCH] quote_for_pmake: fix counter underrun resulting in segfault
+
+while (nbs--) { ... } ends with nbs == -1. Rather than a minimal fix,
+introduce mempset() to make these kinds of errors less likely in the
+future.
+
+Fixes: https://bugzilla.nasm.us/show_bug.cgi?id=3392815
+Reported-by: <13579and24680@gmail.com>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-4437
+
+Reference to upstream patch:
+[https://github.com/netwide-assembler/nasm/commit/2d4e6952417ec6f08b6f135d2b5d0e19b7dae30d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ asm/nasm.c         | 12 +++++-------
+ configure.ac       |  1 +
+ include/compiler.h |  7 +++++++
+ 3 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/asm/nasm.c b/asm/nasm.c
+index 7a7f8b4..675cff4 100644
+--- a/asm/nasm.c
++++ b/asm/nasm.c
+@@ -1,6 +1,6 @@
+ /* ----------------------------------------------------------------------- *
+  *
+- *   Copyright 1996-2020 The NASM Authors - All Rights Reserved
++ *   Copyright 1996-2022 The NASM Authors - All Rights Reserved
+  *   See the file AUTHORS included with the NASM distribution for
+  *   the specific copyright holders.
+  *
+@@ -814,8 +814,7 @@ static char *quote_for_pmake(const char *str)
+     }
+
+     /* Convert N backslashes at the end of filename to 2N backslashes */
+-    if (nbs)
+-        n += nbs;
++    n += nbs;
+
+     os = q = nasm_malloc(n);
+
+@@ -824,10 +823,10 @@ static char *quote_for_pmake(const char *str)
+         switch (*p) {
+         case ' ':
+         case '\t':
+-            while (nbs--)
+-                *q++ = '\\';
++            q = mempset(q, '\\', nbs);
+             *q++ = '\\';
+             *q++ = *p;
++            nbs = 0;
+             break;
+         case '$':
+             *q++ = *p;
+@@ -849,9 +848,8 @@ static char *quote_for_pmake(const char *str)
+             break;
+         }
+     }
+-    while (nbs--)
+-        *q++ = '\\';
+
++    q = mempset(q, '\\', nbs);
+     *q = '\0';
+
+     return os;
+diff --git a/configure.ac b/configure.ac
+index 39680b1..940ebe2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -199,6 +199,7 @@ AC_CHECK_FUNCS(strrchrnul)
+ AC_CHECK_FUNCS(iscntrl)
+ AC_CHECK_FUNCS(isascii)
+ AC_CHECK_FUNCS(mempcpy)
++AC_CHECK_FUNCS(mempset)
+
+ AC_CHECK_FUNCS(getuid)
+ AC_CHECK_FUNCS(getgid)
+diff --git a/include/compiler.h b/include/compiler.h
+index db3d6d6..b64da6a 100644
+--- a/include/compiler.h
++++ b/include/compiler.h
+@@ -256,6 +256,13 @@ static inline void *mempcpy(void *dst, const void *src, size_t n)
+ }
+ #endif
+
++#ifndef HAVE_MEMPSET
++static inline void *mempset(void *dst, int c, size_t n)
++{
++    return (char *)memset(dst, c, n) + n;
++}
++#endif
++
+ /*
+  * Hack to support external-linkage inline functions
+  */
+--
+2.40.0
diff --git a/meta/recipes-devtools/nasm/nasm_2.15.05.bb b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
index edc17aeebf..59b1121bd4 100644
--- a/meta/recipes-devtools/nasm/nasm_2.15.05.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.15.05.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
+           file://CVE-2022-44370.patch \
            "
 
 SRC_URI[sha256sum] = "3c4b8339e5ab54b1bcb2316101f8985a5da50a3f9e504d43fa6f35668bee2fd0"
-- 
2.40.0


