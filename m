Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB0D779BE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 04:21:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9M4Ldh6017614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 21:21:50 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 21 Oct 2018 21:21:17 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 00:21:16 -0400
Message-ID: <20181022042116.7383-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [PATCH] valgrind: Make local functions static to avoid assembler error
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2018 04:22:00 -0000
Content-Type: text/plain

Avoid mips32 x-compiler warnings such as:

| ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
|  void do_signal ( UWord* w )
|       ^~~~~~~~~

by making functions and global variables that are file scope be static
and more importantly also avoid an assembler error:

/tmp/cce22iiw.s: Assembler messages:
/tmp/cce22iiw.s:446: Error: symbol `exit_0' is already defined
/tmp/cce22iiw.s:448: Error: symbol `exit' is already defined
/tmp/cce22iiw.s:915: Error: symbol `exit_0' is already defined
/tmp/cce22iiw.s:917: Error: symbol `exit' is already defined

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ions-static-to-avoid-assembler-error.patch | 182 ++++++++++++++++++
 .../valgrind/valgrind_3.14.0.bb               |   1 +
 2 files changed, 183 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
new file mode 100644
index 0000000000..45e5ea3e74
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
@@ -0,0 +1,182 @@
+From 2155c1b2cf00e744e280c493eb74bf457dfcc3b1 Mon Sep 17 00:00:00 2001
+From: Randy MacLeod <Randy.MacLeod@windriver.com>
+Date: Sun, 21 Oct 2018 15:09:31 -0400
+Subject: [PATCH] Make local functions static to avoid assembler error
+
+Avoid mips32 x-compiler warnings such as:
+
+| ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6: warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
+|  void do_signal ( UWord* w )
+|       ^~~~~~~~~
+
+by making functions and global variables that are file scope be static
+and more importantly also avoid an assembler error:
+
+/tmp/cce22iiw.s: Assembler messages:
+/tmp/cce22iiw.s:446: Error: symbol `exit_0' is already defined
+/tmp/cce22iiw.s:448: Error: symbol `exit' is already defined
+/tmp/cce22iiw.s:915: Error: symbol `exit_0' is already defined
+/tmp/cce22iiw.s:917: Error: symbol `exit' is already defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+---
+ helgrind/tests/annotate_hbefore.c | 34 +++++++++++++++----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/helgrind/tests/annotate_hbefore.c b/helgrind/tests/annotate_hbefore.c
+index e311714f7..f55514e45 100644
+--- a/helgrind/tests/annotate_hbefore.c
++++ b/helgrind/tests/annotate_hbefore.c
+@@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;
+ 
+ // ppc64
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord old, success;
+ 
+@@ -57,7 +57,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // ppc32
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord old, success;
+ 
+@@ -90,7 +90,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // amd64
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+    UWord block[4] = { (UWord)addr, expected, nyu, 2 };
+    __asm__ __volatile__(
+@@ -113,7 +113,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // x86
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+    UWord block[4] = { (UWord)addr, expected, nyu, 2 };
+    __asm__ __volatile__(
+@@ -138,7 +138,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // arm
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord old, success;
+   UWord block[2] = { (UWord)addr, nyu };
+@@ -171,7 +171,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // arm64
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord old, success;
+   UWord block[2] = { (UWord)addr, nyu };
+@@ -204,7 +204,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // s390x
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
+ {
+    int cc;
+ 
+@@ -223,7 +223,7 @@ UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
+ 
+ // mips32
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord success;
+   UWord block[3] = { (UWord)addr, nyu, expected};
+@@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ // mips64
+ /* return 1 if success, 0 if failure */
+-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
++static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ {
+   UWord success;
+   UWord block[3] = { (UWord)addr, nyu, expected};
+@@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+ 
+ #endif
+ 
+-void atomic_incW ( UWord* w )
++static void atomic_incW ( UWord* w )
+ {
+    while (1) {
+       UWord old = *w;
+@@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )
+ 
+ #define NNN 1000000
+ 
+-void* thread_fn ( void* arg )
++static void* thread_fn ( void* arg )
+ {
+   UWord* w = (UWord*)arg;
+   int i;
+@@ -331,10 +331,10 @@ int main ( void )
+ 
+ #endif
+ 
+-int shared_var = 0;  // is not raced upon
++static int shared_var = 0;  // is not raced upon
+ 
+ 
+-void delayXms ( int i )
++static void delayXms ( int i )
+ {
+    struct timespec ts = { 0, 1 * 1000 * 1000 };
+    // We do the sleep in small pieces to have scheduling
+@@ -348,7 +348,7 @@ void delayXms ( int i )
+    }
+ }
+ 
+-void do_wait ( UWord* w )
++static void do_wait ( UWord* w )
+ {
+   UWord w0 = *w;
+   UWord volatile * wV = w;
+@@ -357,7 +357,7 @@ void do_wait ( UWord* w )
+   ANNOTATE_HAPPENS_AFTER(w);
+ }
+ 
+-void do_signal ( UWord* w )
++static void do_signal ( UWord* w )
+ {
+   ANNOTATE_HAPPENS_BEFORE(w);
+   atomic_incW(w);
+@@ -365,7 +365,7 @@ void do_signal ( UWord* w )
+ 
+ 
+ 
+-void* thread_fn1 ( void* arg )
++static void* thread_fn1 ( void* arg )
+ {
+   UWord* w = (UWord*)arg;
+   delayXms(500);    // ensure t2 gets to its wait first
+@@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
+   return NULL;
+ }
+ 
+-void* thread_fn2 ( void* arg )
++static void* thread_fn2 ( void* arg )
+ {
+   UWord* w = (UWord*)arg;
+   do_wait(w);      // wait for h-b edge from first thread
+-- 
+2.17.0
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
index 2fa529516b..7f0a93f6f8 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.14.0.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0003-tests-seg_override-Replace-__modify_ldt-with-syscall.patch \
            file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
            file://0001-Guard-against-__GLIBC_PREREQ-for-musl-libc.patch \
+           file://0001-Make-local-functions-static-to-avoid-assembler-error.patch \
            "
 SRC_URI[md5sum] = "74175426afa280184b62591b58c671b3"
 SRC_URI[sha256sum] = "037c11bfefd477cc6e9ebe8f193bb237fe397f7ce791b4a4ce3fa1c6a520baa5"
-- 
2.17.0


