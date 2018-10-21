Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDF8279C3E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2018 20:48:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9LKmJDw006914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Oct 2018 13:48:19 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 21 Oct 2018 13:48:18 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20181020054026.9619-1-Randy.MacLeod@windriver.com>
	<20181020054026.9619-2-Randy.MacLeod@windriver.com>
	<CAMKF1sp3xrV_1zG0UhknY26csC1TMbBjd+dMixrCbUXBwzQ2Uw@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <625e1152-8cfe-f9dc-c80f-e93a7fb74b26@windriver.com>
Date: Sun, 21 Oct 2018 16:48:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp3xrV_1zG0UhknY26csC1TMbBjd+dMixrCbUXBwzQ2Uw@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: update from 3.13.0 to 3.14.0
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
X-List-Received-Date: Sun, 21 Oct 2018 20:48:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/21/18 5:47 AM, Khem Raj wrote:
> fails ptest compile on musl/mips
> http://errors.yoctoproject.org/Errors/Details/197122/

I have a fix that I'll send later tonight or tomorrow morning
once I've tested it a bit more. I'll paste it inline below in
case anyone wants it now.

I did notice that the ptest build of valgrind takes a more than
30 minutes!:

0: valgrind-3.14.0-r0 do_compile_ptest_base - 2306s (pid 21911)

It's building:
   none/tests/mips32/msa_fpu.c
which is from a commit [1] that tries to cover
all MIPS SIMD architecture instructions. I'll
drop that test unless someone objects since it's overkill
for a ptest IMO.

../Randy


[1] from valgrind.git

commit 0e1fa562e977c9ff86b56d7a29d12588b6a2c731
Author: Petar Jovanovic <mips32r2@gmail.com>
Date:   Fri Oct 27 16:26:24 2017 +0200

     mips: MSA tests

     This set of tests covers the whole MSA instruction set:


       none/tests/mips32/msa_arithmetic
       none/tests/mips32/msa_comparison
       none/tests/mips32/msa_data_transfer
       none/tests/mips32/msa_fpu
       none/tests/mips32/msa_logical_and_shift
       none/tests/mips32/msa_shuffle

       none/tests/mips64/msa_arithmetic         (symlink to mips32)
       none/tests/mips64/msa_comparison         (symlink to mips32)
       none/tests/mips64/msa_data_transfer
       none/tests/mips64/msa_fpu                (symlink to mips32)
       none/tests/mips64/msa_logical_and_shift  (symlink to mips32)
       none/tests/mips64/msa_shuffle            (symlink to mips32)

     Contributed by:
       Tamara Vlahovic, Aleksandar Rikalo and Aleksandra Karadzic.


-- 
# Randy MacLeod
# Wind River Linux



commit d9cd7744a30b9c35a2b0c128209b959511bb1583
Author: Randy MacLeod <Randy.MacLeod@windriver.com>
Date:   Sun Oct 21 15:09:31 2018 -0400

     Fix compiler warnings by making functions static

     Avoid compiler warnings such as:
     | ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6: 
warning: no previous prototype for 'do_signal' [-Wmissing-prototypes]
     |  void do_signal ( UWord* w )
     |       ^~~~~~~~~
     by making functions and global variables that are file scope be static.

     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

diff --git a/helgrind/tests/annotate_hbefore.c 
b/helgrind/tests/annotate_hbefore.c
index e311714f7..f55514e45 100644
--- a/helgrind/tests/annotate_hbefore.c
+++ b/helgrind/tests/annotate_hbefore.c
@@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;

  // ppc64
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord old, success;

@@ -57,7 +57,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )

  // ppc32
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord old, success;

@@ -90,7 +90,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )

  // amd64
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
     UWord block[4] = { (UWord)addr, expected, nyu, 2 };
     __asm__ __volatile__(
@@ -113,7 +113,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  // x86
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
     UWord block[4] = { (UWord)addr, expected, nyu, 2 };
     __asm__ __volatile__(
@@ -138,7 +138,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  // arm
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord old, success;
    UWord block[2] = { (UWord)addr, nyu };
@@ -171,7 +171,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  // arm64
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord old, success;
    UWord block[2] = { (UWord)addr, nyu };
@@ -204,7 +204,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  // s390x
  /* return 1 if success, 0 if failure */
-UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
  {
     int cc;

@@ -223,7 +223,7 @@ UWord do_acasW(UWord* addr, UWord expected, UWord nyu )

  // mips32
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord success;
    UWord block[3] = { (UWord)addr, nyu, expected};
@@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  // mips64
  /* return 1 if success, 0 if failure */
-UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
  {
    UWord success;
    UWord block[3] = { (UWord)addr, nyu, expected};
@@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord 
nyu )

  #endif

-void atomic_incW ( UWord* w )
+static void atomic_incW ( UWord* w )
  {
     while (1) {
        UWord old = *w;
@@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )

  #define NNN 1000000

-void* thread_fn ( void* arg )
+static void* thread_fn ( void* arg )
  {
    UWord* w = (UWord*)arg;
    int i;
@@ -331,10 +331,10 @@ int main ( void )

  #endif

-int shared_var = 0;  // is not raced upon
+static int shared_var = 0;  // is not raced upon


-void delayXms ( int i )
+static void delayXms ( int i )
  {
     struct timespec ts = { 0, 1 * 1000 * 1000 };
     // We do the sleep in small pieces to have scheduling
@@ -348,7 +348,7 @@ void delayXms ( int i )
     }
  }

-void do_wait ( UWord* w )
+static void do_wait ( UWord* w )
  {
    UWord w0 = *w;
    UWord volatile * wV = w;
@@ -357,7 +357,7 @@ void do_wait ( UWord* w )
    ANNOTATE_HAPPENS_AFTER(w);
  }

-void do_signal ( UWord* w )
+static void do_signal ( UWord* w )
  {
    ANNOTATE_HAPPENS_BEFORE(w);
    atomic_incW(w);
@@ -365,7 +365,7 @@ void do_signal ( UWord* w )



-void* thread_fn1 ( void* arg )
+static void* thread_fn1 ( void* arg )
  {
    UWord* w = (UWord*)arg;
    delayXms(500);    // ensure t2 gets to its wait first
@@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
    return NULL;
  }

-void* thread_fn2 ( void* arg )
+static void* thread_fn2 ( void* arg )
  {
    UWord* w = (UWord*)arg;
    do_wait(w);      // wait for h-b edge from first thread


