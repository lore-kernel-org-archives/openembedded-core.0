Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1832C4829E
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 02:41:11 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web10.2634.1707792064681207391
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 18:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZUGdOicy;
 spf=pass (domain: gmail.com, ip: 209.85.160.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-218e3197784so2425952fac.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 18:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707792064; x=1708396864; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGFo2wkXwNPY+46veBLvNMffJiaKIXaC1kYWgdF3QsM=;
        b=ZUGdOicyA2AJl6saoqksU17atf8/cn4UrRmdQ5LyudRNIOSKIvjaJ1qL37H5b6u1lW
         LJBb3pZEv4JzNLASCizOrQ9obExJecnOM4zr4m6Z9MtCnOEwqUqQ52Bi898Q307ZnEmx
         csZLEMd0LWw4b4U271pfbFZWP2BLdQE51SPc/fVASCHlwgM6L/sv7wXnD8KLXlYp1x/X
         ej6tEpfcafs6TtAXMP84B3Bi55N4k9v7WU35u7QFKugbfwDksgftiruhM3bvgTPGmIxY
         H2mO0YShy45oNDmfzG8H71eyFjVwBHrRovXrTJhGt+rmDGnngwaoWXhKuzo7qWflrqbe
         pl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707792064; x=1708396864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGFo2wkXwNPY+46veBLvNMffJiaKIXaC1kYWgdF3QsM=;
        b=nqb/u8jphJM+CA/SYGB6DQ3y8eDtLqAIILjMeD/Ib5ReswFIREw87MWNF8i0NYVNlL
         X0PYtzRFgHvOb5l4HRh/tlOQ++i5Hep5xTQJKULe++uKSN4XzpOXyhFUq7w1omJugtmB
         N3GTH+kUEOaLHDHVQAB9AU92CYULfwpq7x8ejrCFtnaIFAWDId/D2b6aCRxn1+Esue6L
         xfnflLS17Mcf+8WB8PQ3+naUndCotIdW/RKiKmkcZ0m7S6WoeLZpkrSGhjafefSwOnRF
         GpfM6zU4iESPTQPIerEbZ9u0TbsYwSKGXppfs8XCxqyYrR1a9SSW5+s7j/x9tse91YJT
         LWQw==
X-Gm-Message-State: AOJu0YxggxAzj6yqn/Nchjt7L9BQaM7oD8XjspqBF0HvuqcBAmffgtlQ
	WSvfAecu3MU4lhDjuGlQ9yUqOWEjpMiCjT+p46AN04IyhXWrXofo2iRbwyBIEA3+yjqMBPANog6
	7ct/F2cLUwQvIZnJuQsf78ASao2s=
X-Google-Smtp-Source: AGHT+IEi5xaOs9M7iSZm95PlAqf7Ayu8TR4VSiQ1g8CWklaLPCGHvGGSOVkOJ+gXztgJVBRKk2+0c1ffsLH8DoKZk2U=
X-Received: by 2002:a05:6871:580c:b0:219:fedf:74e2 with SMTP id
 oj12-20020a056871580c00b00219fedf74e2mr10137907oac.12.1707792063274; Mon, 12
 Feb 2024 18:41:03 -0800 (PST)
MIME-Version: 1.0
References: <20240212220501.3571864-1-Randy.MacLeod@windriver.com> <20240212220501.3571864-2-Randy.MacLeod@windriver.com>
In-Reply-To: <20240212220501.3571864-2-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Feb 2024 18:40:36 -0800
Message-ID: <CAMKF1srXDihZLKoPUtAq1uGwiOftJR=yZGfYSGKZ3dLRS7Ct-g@mail.gmail.com>
Subject: Re: [PATCH 2/3] valgrind: update from 3.21.0 to 3.22.0
To: Randy.MacLeod@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 02:41:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195367

Thanks, my run with clang/musl with this patchset, I guess, it needs a
little more investigation

   tput: No value for $TERM and no -T specified
                  'drd/tests/sem_as_mutex',
                  'drd/tests/sem_as_mutex2',
                  'drd/tests/sem_as_mutex3',
                  'drd/tests/sem_open',
                  'drd/tests/sem_open2',
                  'drd/tests/sem_open3',
                  'drd/tests/sem_open_traced',
                  'drd/tests/shared_timed_mutex',
                  'drd/tests/sigalrm',
                  'drd/tests/std_atomic',
                  'drd/tests/std_list',
                  'drd/tests/std_mutex',
                  'drd/tests/std_string',
                  'drd/tests/std_thread',
                  'drd/tests/tc01_simple_race',
                  'drd/tests/tc02_simple_tls',
                  'drd/tests/tc03_re_excl',
                  'drd/tests/tc05_simple_race',
                  'drd/tests/tc06_two_races',
                  'drd/tests/tc07_hbl1',
                  'drd/tests/tc08_hbl2',
                  'drd/tests/tc09_bad_unlock',
                  'drd/tests/tc11_XCHG',
                  'drd/tests/tc16_byterace',
                  'drd/tests/tc17_sembar',
                  'drd/tests/tc19_shadowmem',
                  'drd/tests/tc21_pthonce',
                  'drd/tests/tc22_exit_w_lock',
                  'drd/tests/tc23_bogus_condwait',
                  'drd/tests/tc24_nonzero_sem',
                  'drd/tests/thrd_create',
                  'drd/tests/thread_name',
                  'drd/tests/threaded-fork-vcs',
                  'drd/tests/threaded-fork',
                  'drd/tests/timed_mutex',
                  'drd/tests/tls_threads',
                  'massif/tests/pages_as_heap',
                  'dhat/tests/copy',
                  'none/tests/amd64/bug132918',
                  'none/tests/amd64/fcmovnu',
                  'none/tests/amd64/fxtract',
                  'none/tests/amd64/sse4-64',
                  'none/tests/amd64/x87trigOOR',
                  'none/tests/exec-sigmask',
                  'none/tests/linux/brk-overflow1',
                  'none/tests/linux/brk-overflow2',
                  'none/tests/linux/clonev',
                  'none/tests/linux/mremap',
                  'none/tests/rcrl',
                  'none/tests/require-text-symbol-2',
                  'none/tests/resolv',
                  'none/tests/thread-exits',
                  'none/tests/unit_debuglog']}

On Mon, Feb 12, 2024 at 2:05=E2=80=AFPM <Randy.MacLeod@windriver.com> wrote=
:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Full release notes: https://valgrind.org/docs/manual/dist.news.html
>
> In summary, there is a new configure option: --with-gdbscripts-dir
> that lets you install the gdb valgrind python monitor scripts in a specif=
ic location.
> It's not used in the valgrind recipe yet. Also, there were a few Memcheck=
 and Cachegrind
> improvements made and many bugs fixed.
>
> The update required removing the patch:
>    0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
> as it's dealt with by these commits:
>    f7e4bb4af Bug 382034 - Testcases build fixes for musl
>    306232d40 musl: another fix for building testcases
> as described on: https://bugs.kde.org/show_bug.cgi?id=3D382034
>
> Drop: 002-context-APIs-are-not-available-on-musl.patch
> since this is handled in a different way by the following
> upstream commits:
>    c9e88f345 configure, drd: Only build the swapcontext test if swapconte=
xt() is available
>    7cd4d7816 memcheck/tests/linux/stack_changes: Only run this test if se=
tcontext() is available
> And the that tracked the error:
>    https://bugs.kde.org/show_bug.cgi?id=3D434775
> is closed.
> No regression in musl qemux86-64/kvm ptest results.
>
> Drop: 0001-fix-opcode-not-supported-on-mips32-linux.patch
> The resolved (works for me) upstream defect rejected this patch:
>    https://bugs.kde.org/show_bug.cgi?id=3D396905
> and suggested using CFLAGS=3D"-mips32". With this patch dropped, the
> qemumips build succeeds perhaps due to using -march=3Dmips32r2
>
> Drop: 0001-Make-local-functions-static-to-avoid-assembler-error.patch
> since this was fixed upstream by commit:
>    d6da48fe5 mips: use local labels for do_acasW()
> Confirmed with:
>    MACHINE=3Dqemumips TCLIBC=3Dmusl bitbake valgrind
>
> Ptest Resutls for qemux86-64/kvm
>
> glibc:
> =3D=3D=3D Test Summary =3D=3D=3D
> TOTAL: 792
> PASSED: 759
> FAILED: 14
> SKIPPED: 19
>
> musl:
> =3D=3D=3D Test Summary =3D=3D=3D
> TOTAL: 792
> PASSED: 559
> FAILED: 211
> SKIPPED: 22
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  ...ions-static-to-avoid-assembler-error.patch | 182 ------------------
>  ...opcode-not-supported-on-mips32-linux.patch |  82 --------
>  ...inux-seg_override.c-add-missing-incl.patch |  30 ---
>  ...ntext-APIs-are-not-available-on-musl.patch |  92 ---------
>  ...{valgrind_3.21.0.bb =3D> valgrind_3.22.0.bb} |   6 +-
>  5 files changed, 1 insertion(+), 391 deletions(-)
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Make-loc=
al-functions-static-to-avoid-assembler-error.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-fix-opco=
de-not-supported-on-mips32-linux.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-none-tes=
ts-x86-linux-seg_override.c-add-missing-incl.patch
>  delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0002-context-=
APIs-are-not-available-on-musl.patch
>  rename meta/recipes-devtools/valgrind/{valgrind_3.21.0.bb =3D> valgrind_=
3.22.0.bb} (96%)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-func=
tions-static-to-avoid-assembler-error.patch b/meta/recipes-devtools/valgrin=
d/valgrind/0001-Make-local-functions-static-to-avoid-assembler-error.patch
> deleted file mode 100644
> index 8d2ca5733e..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-Make-local-functions-s=
tatic-to-avoid-assembler-error.patch
> +++ /dev/null
> @@ -1,182 +0,0 @@
> -From 2155c1b2cf00e744e280c493eb74bf457dfcc3b1 Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod <Randy.MacLeod@windriver.com>
> -Date: Sun, 21 Oct 2018 15:09:31 -0400
> -Subject: [PATCH] Make local functions static to avoid assembler error
> -
> -Avoid mips32 x-compiler warnings such as:
> -
> -| ../../../valgrind-3.14.0/helgrind/tests/annotate_hbefore.c:360:6: warn=
ing: no previous prototype for 'do_signal' [-Wmissing-prototypes]
> -|  void do_signal ( UWord* w )
> -|       ^~~~~~~~~
> -
> -by making functions and global variables that are file scope be static
> -and more importantly also avoid an assembler error:
> -
> -/tmp/cce22iiw.s: Assembler messages:
> -/tmp/cce22iiw.s:446: Error: symbol `exit_0' is already defined
> -/tmp/cce22iiw.s:448: Error: symbol `exit' is already defined
> -/tmp/cce22iiw.s:915: Error: symbol `exit_0' is already defined
> -/tmp/cce22iiw.s:917: Error: symbol `exit' is already defined
> -
> -Upstream-Status: Submitted https://bugs.kde.org/show_bug.cgi?id=3D400164
> -
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ----
> - helgrind/tests/annotate_hbefore.c | 34 +++++++++++++++----------------
> - 1 file changed, 17 insertions(+), 17 deletions(-)
> -
> -diff --git a/helgrind/tests/annotate_hbefore.c b/helgrind/tests/annotate=
_hbefore.c
> -index e311714f7..f55514e45 100644
> ---- a/helgrind/tests/annotate_hbefore.c
> -+++ b/helgrind/tests/annotate_hbefore.c
> -@@ -24,7 +24,7 @@ typedef  unsigned long int  UWord;
> -
> - // ppc64
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord old, success;
> -
> -@@ -57,7 +57,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord ny=
u )
> -
> - // ppc32
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord old, success;
> -
> -@@ -90,7 +90,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord ny=
u )
> -
> - // amd64
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -    UWord block[4] =3D { (UWord)addr, expected, nyu, 2 };
> -    __asm__ __volatile__(
> -@@ -113,7 +113,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - // x86
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -    UWord block[4] =3D { (UWord)addr, expected, nyu, 2 };
> -    __asm__ __volatile__(
> -@@ -138,7 +138,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - // arm
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord old, success;
> -   UWord block[2] =3D { (UWord)addr, nyu };
> -@@ -171,7 +171,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - // arm64
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord old, success;
> -   UWord block[2] =3D { (UWord)addr, nyu };
> -@@ -204,7 +204,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - // s390x
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW(UWord* addr, UWord expected, UWord nyu )
> - {
> -    int cc;
> -
> -@@ -223,7 +223,7 @@ UWord do_acasW(UWord* addr, UWord expected, UWord ny=
u )
> -
> - // mips32
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord success;
> -   UWord block[3] =3D { (UWord)addr, nyu, expected};
> -@@ -256,7 +256,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - // mips64
> - /* return 1 if success, 0 if failure */
> --UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> -+static UWord do_acasW ( UWord* addr, UWord expected, UWord nyu )
> - {
> -   UWord success;
> -   UWord block[3] =3D { (UWord)addr, nyu, expected};
> -@@ -287,7 +287,7 @@ UWord do_acasW ( UWord* addr, UWord expected, UWord =
nyu )
> -
> - #endif
> -
> --void atomic_incW ( UWord* w )
> -+static void atomic_incW ( UWord* w )
> - {
> -    while (1) {
> -       UWord old =3D *w;
> -@@ -301,7 +301,7 @@ void atomic_incW ( UWord* w )
> -
> - #define NNN 1000000
> -
> --void* thread_fn ( void* arg )
> -+static void* thread_fn ( void* arg )
> - {
> -   UWord* w =3D (UWord*)arg;
> -   int i;
> -@@ -331,10 +331,10 @@ int main ( void )
> -
> - #endif
> -
> --int shared_var =3D 0;  // is not raced upon
> -+static int shared_var =3D 0;  // is not raced upon
> -
> -
> --void delayXms ( int i )
> -+static void delayXms ( int i )
> - {
> -    struct timespec ts =3D { 0, 1 * 1000 * 1000 };
> -    // We do the sleep in small pieces to have scheduling
> -@@ -348,7 +348,7 @@ void delayXms ( int i )
> -    }
> - }
> -
> --void do_wait ( UWord* w )
> -+static void do_wait ( UWord* w )
> - {
> -   UWord w0 =3D *w;
> -   UWord volatile * wV =3D w;
> -@@ -357,7 +357,7 @@ void do_wait ( UWord* w )
> -   ANNOTATE_HAPPENS_AFTER(w);
> - }
> -
> --void do_signal ( UWord* w )
> -+static void do_signal ( UWord* w )
> - {
> -   ANNOTATE_HAPPENS_BEFORE(w);
> -   atomic_incW(w);
> -@@ -365,7 +365,7 @@ void do_signal ( UWord* w )
> -
> -
> -
> --void* thread_fn1 ( void* arg )
> -+static void* thread_fn1 ( void* arg )
> - {
> -   UWord* w =3D (UWord*)arg;
> -   delayXms(500);    // ensure t2 gets to its wait first
> -@@ -376,7 +376,7 @@ void* thread_fn1 ( void* arg )
> -   return NULL;
> - }
> -
> --void* thread_fn2 ( void* arg )
> -+static void* thread_fn2 ( void* arg )
> - {
> -   UWord* w =3D (UWord*)arg;
> -   do_wait(w);      // wait for h-b edge from first thread
> ---
> -2.17.0
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-=
supported-on-mips32-linux.patch b/meta/recipes-devtools/valgrind/valgrind/0=
001-fix-opcode-not-supported-on-mips32-linux.patch
> deleted file mode 100644
> index 39b624d9f6..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-fix-opcode-not-support=
ed-on-mips32-linux.patch
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -From fb5362f205b37c5060fcd764a7ed393abe4f2f3d Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Fri, 27 Jul 2018 17:39:37 +0800
> -Subject: [PATCH 1/2] fix opcode not supported on mips32-linux
> -
> -While build tests(`make check') on mips32-linux, there are
> -serial failures such as:
> -[snip]
> -| mips-wrsmllib32-linux-gcc  -meb -mabi=3D32 -mhard-float -c
> --o atomic_incs-atomic_incs.o `test -f 'atomic_incs.c' || echo
> -'../../../valgrind-3.13.0/memcheck/tests/'`atomic_incs.c
> -| /tmp/ccqrmINN.s: Assembler messages:
> -| /tmp/ccqrmINN.s:247: Error: opcode not supported on this
> -processor: mips1 (mips1) `ll $t3,0($t1)'
> -| /tmp/ccqrmINN.s:249: Error: opcode not supported on this
> -processor: mips1 (mips1) `sc $t3,0($t1)'
> -[snip]
> -
> -Since the following commit applied, it defines CLFAGS for mips32,
> -but missed to pass them to tests which caused the above failure
> -...
> -3e344c57f Merge in a port for mips32-linux
> -...
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=3D39690=
5]
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - helgrind/tests/Makefile.am    | 5 +++++
> - memcheck/tests/Makefile.am    | 5 +++++
> - none/tests/mips32/Makefile.am | 4 ++++
> - 3 files changed, 14 insertions(+)
> -
> -diff --git a/helgrind/tests/Makefile.am b/helgrind/tests/Makefile.am
> -index ad1af191a..6209d35a7 100644
> ---- a/helgrind/tests/Makefile.am
> -+++ b/helgrind/tests/Makefile.am
> -@@ -214,6 +214,11 @@ check_PROGRAMS +=3D annotate_rwlock
> - endif
> -
> - AM_CFLAGS   +=3D $(AM_FLAG_M3264_PRI)
> -+
> -+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
> -+AM_CFLAGS   +=3D $(AM_CFLAGS_MIPS32_LINUX)
> -+endif
> -+
> - AM_CXXFLAGS +=3D $(AM_FLAG_M3264_PRI)
> -
> - LDADD =3D -lpthread
> -diff --git a/memcheck/tests/Makefile.am b/memcheck/tests/Makefile.am
> -index 84e49405f..aff861a32 100644
> ---- a/memcheck/tests/Makefile.am
> -+++ b/memcheck/tests/Makefile.am
> -@@ -443,6 +443,11 @@ check_PROGRAMS +=3D reach_thread_register
> - endif
> -
> - AM_CFLAGS   +=3D $(AM_FLAG_M3264_PRI)
> -+
> -+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
> -+AM_CFLAGS   +=3D $(AM_CFLAGS_MIPS32_LINUX)
> -+endif
> -+
> - AM_CXXFLAGS +=3D $(AM_FLAG_M3264_PRI)
> -
> - if VGCONF_PLATFORMS_INCLUDE_ARM_LINUX
> -diff --git a/none/tests/mips32/Makefile.am b/none/tests/mips32/Makefile.=
am
> -index d11591d45..602cd26f6 100644
> ---- a/none/tests/mips32/Makefile.am
> -+++ b/none/tests/mips32/Makefile.am
> -@@ -99,6 +99,10 @@ check_PROGRAMS =3D \
> -       round_fpu64 \
> -       fpu_branches
> -
> -+if VGCONF_PLATFORMS_INCLUDE_MIPS32_LINUX
> -+AM_CFLAGS   +=3D $(AM_CFLAGS_MIPS32_LINUX)
> -+endif
> -+
> - AM_CFLAGS    +=3D @FLAG_M32@
> - AM_CXXFLAGS  +=3D @FLAG_M32@
> - AM_CCASFLAGS +=3D @FLAG_M32@
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-=
linux-seg_override.c-add-missing-incl.patch b/meta/recipes-devtools/valgrin=
d/valgrind/0001-none-tests-x86-linux-seg_override.c-add-missing-incl.patch
> deleted file mode 100644
> index 5e36c28523..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-x86-linux-s=
eg_override.c-add-missing-incl.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 978d9ed7f857f2cdcd2a8632f3c2feb56b99c825 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 8 May 2023 11:56:35 +0200
> -Subject: [PATCH] none/tests/x86-linux/seg_override.c: add missing includ=
e for
> - musl builds
> -
> -Otherwise SYS_modify_ldt is undefined.
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=3D38203=
4]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> ----
> - none/tests/x86-linux/seg_override.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/none/tests/x86-linux/seg_override.c b/none/tests/x86-linux/=
seg_override.c
> -index ca8fbfe..4ef4394 100644
> ---- a/none/tests/x86-linux/seg_override.c
> -+++ b/none/tests/x86-linux/seg_override.c
> -@@ -3,6 +3,10 @@
> - #include <errno.h>
> - #include <string.h>
> - #include "../../../config.h"
> -+#if defined(MUSL_LIBC)
> -+#include <syscall.h>
> -+#include <unistd.h>
> -+#endif
> -
> -
> - /* Stuff from Wine. */
> diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-ar=
e-not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/000=
2-context-APIs-are-not-available-on-musl.patch
> deleted file mode 100644
> index 7f0e38cb95..0000000000
> --- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-a=
vailable-on-musl.patch
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
> -From: Randy MacLeod <Randy.MacLeod@windriver.com>
> -Date: Tue, 16 Oct 2018 21:27:46 -0400
> -Subject: [PATCH] context APIs are not available on musl
> -
> -Updated patch for valgrind-3.14
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> -
> -Apply same patch to drd/tests/swapcontext.c
> -for valgrind-3.17.
> -
> -Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=3D43477=
5]
> -
> -Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> ----
> - drd/tests/swapcontext.c              | 6 ++++++
> - memcheck/tests/linux/stack_changes.c | 7 ++++++-
> - 2 files changed, 12 insertions(+), 1 deletion(-)
> -
> -diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
> -index 622c70bc5..5e72bb0f3 100644
> ---- a/drd/tests/swapcontext.c
> -+++ b/drd/tests/swapcontext.c
> -@@ -20,6 +20,7 @@
> -
> - #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
> -
> -+#ifdef __GLIBC__
> - typedef struct thread_local {
> -   ucontext_t uc[3];
> -   size_t nrsw;
> -@@ -67,9 +68,11 @@ void *worker(void *data)
> -   swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
> -   return NULL;
> - }
> -+#endif
> -
> - int main(int argc, char *argv[])
> - {
> -+#ifdef __GLIBC__
> -   enum { NR =3D 32 };
> -   thread_local_t tlocal[NR];
> -   pthread_t thread[NR];
> -@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
> -
> -   for (i =3D 0; i < NR; i++)
> -     pthread_join(thread[i], NULL);
> -+#else
> -+    printf("libc context call APIs e.g. getcontext() are deprecated by =
posix\n");
> -+#endif
> -
> -   return 0;
> - }
> -diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux=
/stack_changes.c
> -index 7f97b90a5..a26cb4ae6 100644
> ---- a/memcheck/tests/linux/stack_changes.c
> -+++ b/memcheck/tests/linux/stack_changes.c
> -@@ -10,6 +10,7 @@
> - // This test is checking the libc context calls (setcontext, etc.) and
> - // checks that Valgrind notices their stack changes properly.
> -
> -+#ifdef __GLIBC__
> - typedef  ucontext_t  mycontext;
> -
> - mycontext ctx1, ctx2, oldc;
> -@@ -51,9 +52,11 @@ int init_context(mycontext *uc)
> -
> -     return ret;
> - }
> -+#endif
> -
> - int main(int argc, char **argv)
> - {
> -+#ifdef __GLIBC__
> -     int c1 =3D init_context(&ctx1);
> -     int c2 =3D init_context(&ctx2);
> -
> -@@ -66,6 +69,8 @@ int main(int argc, char **argv)
> -     //free(ctx1.uc_stack.ss_sp);
> -     VALGRIND_STACK_DEREGISTER(c2);
> -     //free(ctx2.uc_stack.ss_sp);
> --
> -+#else
> -+    printf("libc context call APIs e.g. getcontext() are deprecated by =
posix\n");
> -+#endif
> -     return 0;
> - }
> ---
> -2.17.1
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.22.0.bb
> similarity index 96%
> rename from meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> rename to meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> index 0903008e61..dc00edb24e 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.21.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.22.0.bb
> @@ -25,10 +25,7 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgr=
ind-${PV}.tar.bz2 \
>             file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patc=
h \
>             file://0001-makefiles-Drop-setting-mcpu-to-cortex-a8-on-arm-a=
rch.patch \
>             file://0001-sigqueue-Rename-_sifields-to-__si_fields-on-musl.=
patch \
> -           file://0002-context-APIs-are-not-available-on-musl.patch \
>             file://0003-correct-include-directive-path-for-config.h.patch=
 \
> -           file://0001-fix-opcode-not-supported-on-mips32-linux.patch \
> -           file://0001-Make-local-functions-static-to-avoid-assembler-er=
ror.patch \
>             file://0001-Return-a-valid-exit_code-from-vg_regtest.patch \
>             file://0001-valgrind-filter_xml_frames-do-not-filter-usr.patc=
h \
>             file://0001-memcheck-vgtests-remove-fullpath-after-flags.patc=
h \
> @@ -36,9 +33,8 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgri=
nd-${PV}.tar.bz2 \
>             file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-path=
s.patch \
>             file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
>             file://0001-docs-Disable-manual-validation.patch \
> -           file://0001-none-tests-x86-linux-seg_override.c-add-missing-i=
ncl.patch \
>             "
> -SRC_URI[sha256sum] =3D "10ce1618bb3e33fad16eb79552b0a3e1211762448a0d7fce=
11c8a6243b9ac971"
> +SRC_URI[sha256sum] =3D "c811db5add2c5f729944caf47c4e7a65dcaabb9461e472b5=
78765dd7bf6d2d4c"
>  UPSTREAM_CHECK_REGEX =3D "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"
>
>  COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-=
linux'
> --
> 2.43.0
>

