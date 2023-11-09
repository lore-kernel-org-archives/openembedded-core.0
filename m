Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F74C41535
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.111812.1699493157650071101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AM/irT8b;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A90jrHK031000;
	Wed, 8 Nov 2023 17:25:56 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=t/7uvrjFlXdyns5Jubi0pab5XWY07I4zq8BaxftULyg=; b=
	AM/irT8bsPYjTiZ+tW/UI9BDJ3OXg8hMofoDkpBum4v7eZE0PrHes0S3QncsDzM9
	Z2YKOVNGhI55D0+Usa+7zkjw29DA4QLEWxfYIWke/6IO3PLtegjU0GjrsQ3KbB21
	Bh+rwqFQtCNpUy4cY8rd1X8qe12yKd9pV9t09iwknbCQB/2T9wbD7W5wlTGuMwMn
	wew5NkFYIAtA7Hzixdm2bRLyKpwTmvgf/bKVTc5XH0CAhRYkWInq1eeSHcKAhdPD
	bGzW80lfwbvQrXXT/quwsBIvWFMDGLZ+IZBbSns+w32wKCRbPNOLJ7g1+7w/Ce9W
	QJTc5Kxsm9Juv7uyD5PyGA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2shcsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Nov 2023 17:25:56 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 17:25:59 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 17:25:59 -0800
From: <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [RFC 3/5] valgrind: drop context API musl patch
Date: Wed, 8 Nov 2023 17:25:53 -0800
Message-ID: <20231109012555.4074359-3-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: iOwi9GmgOCYJOdKKoj0MDv9A66qKD_QM
X-Proofpoint-ORIG-GUID: iOwi9GmgOCYJOdKKoj0MDv9A66qKD_QM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190370

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Drop 002-context-APIs-are-not-available-on-musl.patch
since this is handled in a different way by the following
upstream commits:
   c9e88f345 configure, drd: Only build the swapcontext test if swapcontext() is available
   7cd4d7816 memcheck/tests/linux/stack_changes: Only run this test if setcontext() is available
And the that tracked the error:
   https://bugs.kde.org/show_bug.cgi?id=434775
is closed.

No regression in musl qemux86-64/kvm ptest resutls.:

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ntext-APIs-are-not-available-on-musl.patch | 92 -------------------
 .../valgrind/valgrind_3.22.0.bb               |  1 -
 2 files changed, 93 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
deleted file mode 100644
index 7f0e38cb95..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-available-on-musl.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Tue, 16 Oct 2018 21:27:46 -0400
-Subject: [PATCH] context APIs are not available on musl
-
-Updated patch for valgrind-3.14
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
-
-Apply same patch to drd/tests/swapcontext.c
-for valgrind-3.17.
-
-Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=434775]
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- drd/tests/swapcontext.c              | 6 ++++++
- memcheck/tests/linux/stack_changes.c | 7 ++++++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
-index 622c70bc5..5e72bb0f3 100644
---- a/drd/tests/swapcontext.c
-+++ b/drd/tests/swapcontext.c
-@@ -20,6 +20,7 @@
- 
- #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
- 
-+#ifdef __GLIBC__
- typedef struct thread_local {
-   ucontext_t uc[3];
-   size_t nrsw;
-@@ -67,9 +68,11 @@ void *worker(void *data)
-   swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
-   return NULL;
- }
-+#endif
- 
- int main(int argc, char *argv[])
- {
-+#ifdef __GLIBC__
-   enum { NR = 32 };
-   thread_local_t tlocal[NR];
-   pthread_t thread[NR];
-@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
- 
-   for (i = 0; i < NR; i++)
-     pthread_join(thread[i], NULL);
-+#else
-+    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
-+#endif
- 
-   return 0;
- }
-diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/stack_changes.c
-index 7f97b90a5..a26cb4ae6 100644
---- a/memcheck/tests/linux/stack_changes.c
-+++ b/memcheck/tests/linux/stack_changes.c
-@@ -10,6 +10,7 @@
- // This test is checking the libc context calls (setcontext, etc.) and
- // checks that Valgrind notices their stack changes properly.
- 
-+#ifdef __GLIBC__
- typedef  ucontext_t  mycontext;
- 
- mycontext ctx1, ctx2, oldc;
-@@ -51,9 +52,11 @@ int init_context(mycontext *uc)
- 
-     return ret;
- }
-+#endif
- 
- int main(int argc, char **argv)
- {
-+#ifdef __GLIBC__
-     int c1 = init_context(&ctx1);
-     int c2 = init_context(&ctx2);
- 
-@@ -66,6 +69,8 @@ int main(int argc, char **argv)
-     //free(ctx1.uc_stack.ss_sp);
-     VALGRIND_STACK_DEREGISTER(c2);
-     //free(ctx2.uc_stack.ss_sp);
--
-+#else
-+    printf("libc context call APIs e.g. getcontext() are deprecated by posix\n");
-+#endif
-     return 0;
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index 6dcd028075..0ebf08eb28 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -25,7 +25,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
-           file://0002-context-APIs-are-not-available-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
-- 
2.42.0


