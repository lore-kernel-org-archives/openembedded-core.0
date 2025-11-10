Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37A4CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 09:57:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44913.1762768614070802580
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 01:56:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=e9Gh7tGD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=340953b96a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA4VXlP1745292
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=U0y1yBGsDaFw2zlJSSJ5
	53ktx9Ai+0mX1Q5BFDbs9aI=; b=e9Gh7tGD7ZghcSXQ4op6UOoBQdqZdl44pAuX
	J0IhrhGtRMUSgqJDdHYaFYP9MTLLuxNUK36U9eNHjI+d3cxInnkbOQzAuxrzT4/g
	GIX3bLLSmEi7NIeez7S1LAcyF/S8dxiUhVnPvIXdSQyuQoGzjItS3P/DE/FlgqKi
	CTdJKEg7TTcu9k4tG0buCpzUIxwzDszgS8DVBmDpvRIT5lDAYYuVskkV4T0qn/Lf
	4YLnU1Tum7O42k89WfzH4VybSzOyeGwyeIwhsSlwZC1B9ddQL9eKGg4BdpAYbjHB
	cciFgwYjVRrs4E4BDVG3vNJkwZHXqgFwbH3gWXcwZl9M1kOH3g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu91q2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:56:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 10 Nov 2025 01:56:51 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 10 Nov 2025 01:56:51 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] valgrind: Upgrade 3.25.1 -> 3.26.0
Date: Mon, 10 Nov 2025 17:56:50 +0800
Message-ID: <20251110095650.3192469-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDA4NiBTYWx0ZWRfX4SQTCUwOVfap
 DpZHh3WCK14j/e7EkfDePmejPmIMLNFtZhfs1w9ERAVlCGfArUZ0fCJQxMbQjuc7ocBUaXgnc/x
 ze/e8zU2XJF/02/Ely6bqRdWJ2tQr2MyS/7jQOi+PWmWgx/ZzCjbKpGS913j8zhlsqvr8GnZsmW
 xuCFLHN3Xa1KyCUmjRBcPn23YsGWxxILS5b8C5H7VJ/J6Om/6PWp/Q1S5ZNRl65PoWf+jKn+Vf1
 EfM+8TW++W1es6nEUkMxXIiSIQRgzsazTRRAmDFZ41os7zLPcLQ6nfmQ6aXy0abGFmo9zT1TLBU
 dJn4pPbbleEoQ8waA3a6Y+bFJ+FH2U3DhrjKAaWtSotNKYQNlqr3L8qZQ9X9aVCsxv3/WPy4xYB
 0X0AIz6SD1moIVY3gSvGnsbGNbdaTg==
X-Proofpoint-GUID: HfAfcKWukK5VBhpMXnA2mRb7DdmAsInp
X-Proofpoint-ORIG-GUID: HfAfcKWukK5VBhpMXnA2mRb7DdmAsInp
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6911b6e4 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=CCpqsmhAAAAA:8 a=3fyaaF4VAAAA:8
 a=vMm7aj2tAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=VCx6LyyBQXypQnP3CUYA:9
 a=QVpHfkqoFdcA:10 a=ul9cdbp4aOFLsgKbc677:22 a=r6sWxlpsa93XciTrHfvA:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 09:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226103

From: Mingli Yu <mingli.yu@windriver.com>

License-Update:
 License version and the copyright year updated [1].

Remove 0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
as the logic has been already included in the new version [2].

[1] https://sourceware.org/git/?p=valgrind.git;a=commit;h=3392155359822c0d4e8bb371862e92425054d02a
[2] https://sourceware.org/git/?p=valgrind.git;a=commitdiff;h=2fa8581c4974db57de80de915d16ce299eb9aa84

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...tax-for-pushsection-directive-in-inl.patch | 31 ---------------
 ...c-workaround-off64_t-not-defined-in-.patch | 38 +++++++++++++++++++
 ...{valgrind_3.25.1.bb => valgrind_3.26.0.bb} | 10 ++---
 3 files changed, 43 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.25.1.bb => valgrind_3.26.0.bb} (93%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
deleted file mode 100644
index b59c5442231..00000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 2089383a0e3a50f527337ea05188b3e302069888 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 May 2025 09:29:33 -0700
-Subject: [PATCH] Use portable syntax for pushsection directive in inline
- assembly
-
-'@' does not work with clang inline assembler, but '%' works with both
-gcc and clang. Therefore use '%' to make it more portable
-
-Fixes
-<inline asm>:1:41: error: expected '%<type>' or "<type>"
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=504222]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- coregrind/vg_preloaded.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/coregrind/vg_preloaded.c b/coregrind/vg_preloaded.c
-index 5bec51d..e4c2dbc 100644
---- a/coregrind/vg_preloaded.c
-+++ b/coregrind/vg_preloaded.c
-@@ -55,7 +55,7 @@
- /* Note: The "MS" section flags are to remove duplicates.  */
- #define DEFINE_GDB_PY_SCRIPT(script_name) \
-   asm("\
--.pushsection \".debug_gdb_scripts\", \"MS\",@progbits,1\n\
-+.pushsection \".debug_gdb_scripts\", \"MS\",%progbits,1\n\
- .byte 1 /* Python */\n\
- .asciz \"" script_name "\"\n\
- .popsection \n\
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
new file mode 100644
index 00000000000..0fa8b936e3f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch
@@ -0,0 +1,38 @@
+From 15ccaa2ebe66d77c25393dd9182d394e87e15577 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 10 Nov 2025 11:21:36 +0800
+Subject: [PATCH] getdents_filter.c: workaround off64_t not defined in musl
+
+Fixes:
+  getdents_filter.c:18:5: error: unknown type name 'off64_t'; did you mean 'off_t'?
+   18 |     off64_t  d_off;
+      |     ^~~~~~~
+      |     off_t
+  make[5]: *** [Makefile:920: getdents_filter.o] Error 1
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ none/tests/linux/getdents_filter.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/none/tests/linux/getdents_filter.c b/none/tests/linux/getdents_filter.c
+index 361659f..d2c627f 100644
+--- a/none/tests/linux/getdents_filter.c
++++ b/none/tests/linux/getdents_filter.c
+@@ -13,6 +13,11 @@
+ #include <sys/syscall.h>
+ #include <sys/types.h>
+ 
++#ifndef off64_t
++typedef off_t off64_t;
++typedef ino_t ino64_t;
++#endif
++
+ struct linux_dirent64 {
+     ino64_t  d_ino;
+     off64_t  d_off;
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
similarity index 93%
rename from meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
index a8b0be5767e..6f7d67df0ec 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.25.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.26.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://valgrind.org/"
 DESCRIPTION = "Valgrind is an instrumentation framework for building dynamic analysis tools. There are Valgrind tools that can automatically detect many memory management and threading bugs, and profile your programs in detail."
 BUGTRACKER = "http://valgrind.org/support/bug_reports.html"
 LICENSE = "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=41c410e8d3f305aee7aaa666b2e4f366 \
-                    file://include/valgrind.h;beginline=1;endline=56;md5=ad3b317f3286b6b704575d9efe6ca5df \
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://include/pub_tool_basics.h;beginline=6;endline=29;md5=9ba449d120f6845e6a432073278d6e3a \
+                    file://include/valgrind.h;beginline=1;endline=56;md5=993563aaa122558df9c5d743de074d04 \
                     file://COPYING.DOCS;md5=24ea4c7092233849b4394699333b5c56"
 
 SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
@@ -25,9 +25,9 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
            file://0001-docs-Disable-manual-validation.patch \
            file://0001-tests-arm-Use-O-instead-of-O0.patch \
-           file://0001-Use-portable-syntax-for-pushsection-directive-in-inl.patch \
+           file://0001-getdents_filter.c-workaround-off64_t-not-defined-in-.patch \
            "
-SRC_URI[sha256sum] = "61deb8d0727b45c268efdc1b3b6c9e679cd97cbf5ee4b28d1dead7c8b7a271af"
+SRC_URI[sha256sum] = "8d54c717029106f1644aadaf802ab9692e53d93dd015cbd19e74190eba616bd7"
 UPSTREAM_CHECK_REGEX = "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
 
 COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64|riscv64).*-linux'
-- 
2.34.1


