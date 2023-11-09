Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90979C0018C
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 01:26:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.111825.1699493157981856787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 17:25:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZJtbVF4p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9677a88a23=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A90jrHL031000;
	Wed, 8 Nov 2023 17:25:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=s8jsjjAYaU5vz1RGZXgiY3wp+vfJOSC1Bubw2kiBSp8=; b=
	ZJtbVF4pmZeMU0swxm+DF07a3fhOlHSsGwrL88nrQOs++aekZl21WVwL+sTVnNIw
	UU8kPiNMrLrwRSnVth3QnFfV1dDL8fa9Fp+QL6IiugkueNEfGE1LB0Wx/lp4xCRk
	5cpDwSE/60nW0KF9blHgHdGrsFMRuRH1tbyfOh1+0k9wIj0S3QZzL1Fjx79quqV7
	dKoliYLxHdHYOMPC6qb+nFwzHWAYevJH3RrzdcZwySo62+9fBAweYVUUPx8LAUo6
	8pcomN6AYBsGIiedHT7/YeH3UN152KuggWD+KYa/sgPVvKBASG6nvBsrYF72o73a
	9MbMh9Ae7OuKiEV2NBUZyA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2shcsj-2
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
Subject: [RFC 5/5] valgrind: drop Make-local-function-static patch
Date: Wed, 8 Nov 2023 17:25:55 -0800
Message-ID: <20231109012555.4074359-5-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
References: <20231109012555.4074359-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: rED3ARTMWklP2HIPmyDt58xMWgy2N1vU
X-Proofpoint-ORIG-GUID: rED3ARTMWklP2HIPmyDt58xMWgy2N1vU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=773 mlxscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311090009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 01:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190371

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Drop: 0001-Make-local-functions-static-to-avoid-assembler-error.patch
since this was fixed upstream by commit:
   d6da48fe5 mips: use local labels for do_acasW()
Confirmed with:
   MACHINE=qemumips TCLIBC=musl bitbake valgrind

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ions-static-to-avoid-assembler-error.patch | 182 ------------------
 .../valgrind/valgrind_3.22.0.bb               |   1 -
 2 files changed, 183 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
deleted file mode 100644
index 8d2ca5733e..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 2155c1b2cf00e744e280c493eb74bf457dfcc3b1 Mon Sep 17 00:00:00 2001
-From: Randy MacLeod <Randy.MacLeod@windriver.com>
-Date: Sun, 21 Oct 2018 15:09:31 -0400
-Subject: [PATCH] Make local functions static to avoid assembler error
-
-Avoid mips32 x-compiler warnings such as:
-
-| ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
-|  void do_signal ( UWord* w )
-|       ^~~~~~~~~
-
-by making functions and global variables that are file scope be static
-and more importantly also avoid an assembler error:
-
-/tmp/cce22iiw.s: Assembler messages:
-/tmp/cce22iiw.s:446: Error: symbol `exit_0' is already defined
-/tmp/cce22iiw.s:448: Error: symbol `exit' is already defined
-/tmp/cce22iiw.s:915: Error: symbol `exit_0' is already defined
-/tmp/cce22iiw.s:917: Error: symbol `exit' is already defined
-
-Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=400164
-
-Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
----
- helgrind/tests/annotate_hbefore.c | 34 +++++++++++++++----------------
- 1 file changed, 17 insertions(+), 17 deletions(-)
-
-diff --git a/helgrind/tests/annotate_hbefore.c b/helgrind/tests/annotate_hbefore.c
-index e311714f7..f55514e45 100644
---- a/helgrind/tests/annotate_hbefore.c
-+++ b/helgrind/tests/annotate_hbefore.c
-@@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;
- 
- // ppc64
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord old, success;
- 
-@@ -57,7 +57,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // ppc32
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord old, success;
- 
-@@ -90,7 +90,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // amd64
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-    UWord block[4] = { (UWord)addr, expected, nyu, 2 };
-    __asm__ __volatile__(
-@@ -113,7 +113,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // x86
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-    UWord block[4] = { (UWord)addr, expected, nyu, 2 };
-    __asm__ __volatile__(
-@@ -138,7 +138,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // arm
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord old, success;
-   UWord block[2] = { (UWord)addr, nyu };
-@@ -171,7 +171,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // arm64
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord old, success;
-   UWord block[2] = { (UWord)addr, nyu };
-@@ -204,7 +204,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // s390x
- /* return 1 if success, 0 if failure */
--UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
- {
-    int cc;
- 
-@@ -223,7 +223,7 @@ UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
- 
- // mips32
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord success;
-   UWord block[3] = { (UWord)addr, nyu, expected};
-@@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- // mips64
- /* return 1 if success, 0 if failure */
--UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
-+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- {
-   UWord success;
-   UWord block[3] = { (UWord)addr, nyu, expected};
-@@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
- 
- #endif
- 
--void atomic_incW ( UWord* w )
-+static void atomic_incW ( UWord* w )
- {
-    while (1) {
-       UWord old = *w;
-@@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )
- 
- #define NNN 1000000
- 
--void* thread_fn ( void* arg )
-+static void* thread_fn ( void* arg )
- {
-   UWord* w = (UWord*)arg;
-   int i;
-@@ -331,10 +331,10 @@ int main ( void )
- 
- #endif
- 
--int shared_var = 0;  // is not raced upon
-+static int shared_var = 0;  // is not raced upon
- 
- 
--void delayXms ( int i )
-+static void delayXms ( int i )
- {
-    struct timespec ts = { 0, 1 * 1000 * 1000 };
-    // We do the sleep in small pieces to have scheduling
-@@ -348,7 +348,7 @@ void delayXms ( int i )
-    }
- }
- 
--void do_wait ( UWord* w )
-+static void do_wait ( UWord* w )
- {
-   UWord w0 = *w;
-   UWord volatile * wV = w;
-@@ -357,7 +357,7 @@ void do_wait ( UWord* w )
-   ANNOTATE_HAPPENS_AFTER(w);
- }
- 
--void do_signal ( UWord* w )
-+static void do_signal ( UWord* w )
- {
-   ANNOTATE_HAPPENS_BEFORE(w);
-   atomic_incW(w);
-@@ -365,7 +365,7 @@ void do_signal ( UWord* w )
- 
- 
- 
--void* thread_fn1 ( void* arg )
-+static void* thread_fn1 ( void* arg )
- {
-   UWord* w = (UWord*)arg;
-   delayXms(500);    // ensure t2 gets to its wait first
-@@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
-   return NULL;
- }
- 
--void* thread_fn2 ( void* arg )
-+static void* thread_fn2 ( void* arg )
- {
-   UWord* w = (UWord*)arg;
-   do_wait(w);      // wait for h-b edge from first thread
--- 
-2.17.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
index c3c1bc0b2c..2d846cedc4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
@@ -26,7 +26,6 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-arch.patch \
            file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.patch \
            file://0003-correct-include-directive-path-for-config.h.patch \
-           file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
            file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patch \
            file://0001-memcheck-vgtests-remove-fullpath-after-flags.patch \
-- 
2.42.0


