Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E3DCD1288
	for <webhook@archiver.kernel.org>; Sun, 31 Mar 2024 08:24:14 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13679.1711873443739739808
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Mar 2024 01:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=LNlpwFdL;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18AC5FF802;
	Sun, 31 Mar 2024 08:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711873441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N56aeg2xVxfaCK+R9Qu6FMzJLlgFNtykTtFP6gU/HVo=;
	b=LNlpwFdLna8ZnGCo7Yd2r+rXIrpxdt9Cee2kqaM4Fd6kNtnvdw78FO6TasQVLphLmWWggc
	t2j35+P7knv0ciPrC2V/R8/FuUG1T3rkpX5H+en3ygNJhTpQ5toTBwoBc7tjdub9MiyS0S
	tFzrll+mHxShLdD/WWhyUoYwOd2G19GZqXww8GQgd4e0QT1F6+YN8edtAssuYwiT4Be8z1
	1ql/3aIDNPdQoBQK14Tkh7irlcLMYK0b5ji3IsN4cZ5wgRm8e3u/4dXzI3n3fNgzwhc6pb
	Uw/d3x/cpzm58JLuKU6/hFi3EPMiiP2XJCKFHBqdt/tjInzM+1Ck5jBjRBYOfQ==
Date: Sun, 31 Mar 2024 10:24:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] valgrind: Re-enable fixed test cases
Message-ID: <20240331082400af4e1f1f@mail.local>
References: <20240329055034.3942360-1-raj.khem@gmail.com>
 <20240329055034.3942360-2-raj.khem@gmail.com>
 <36955edbe50ee6fbb2320ff5c304722ae957a344.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <36955edbe50ee6fbb2320ff5c304722ae957a344.camel@linuxfoundation.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Mar 2024 08:24:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197656

On 30/03/2024 08:31:10+0000, Richard Purdie wrote:
> On Thu, 2024-03-28 at 22:50 -0700, Khem Raj wrote:
> > These tests have been fixed in prior to 3.22 release
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > �meta/recipes-devtools/valgrind/valgrind_3.22.0.bb | 6 ------
> > �1 file changed, 6 deletions(-)
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6452/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6257/steps/13/logs/stdio
> 
> Failed ptests:
> {'valgrind': ['memcheck/tests/leak_cpp_interior', 'drd/tests/pth_mutex_signal']}
> 
> so they're not fixed.
> 

Failed test details...
drd/tests/pth_mutex_signal.stderr.diff
************
--- pth_mutex_signal.stderr.exp
+++ pth_mutex_signal.stderr.out
@@ -2,14 +2,34 @@
 mutex initialized
 thread attributes initialized
 thread created
-sleeping
-signalling
-sleeping
-nullHandler running
-unlocking
-contender locked mutex
-contender unlocking mutex
-contender unlocked mutex
-joining thread
 
-ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 0 from 0)
+Process terminating with default action of signal 6 (SIGABRT)
+   at 0x........: __pthread_kill_implementation (pthread_kill.c:?)
+   by 0x........: raise (raise.c:?)
+   by 0x........: abort (abort.c:?)
+   by 0x........: __libc_message_impl.cold (libc_fatal.c:?)
+   by 0x........: __libc_fatal (libc_fatal.c:?)
+   by 0x........: futex_fatal_error (futex-internal.h:87)
+   by 0x........: __futex_lock_pi64 (futex-internal.c:203)
+   by 0x........: __pthread_mutex_lock_full (pthread_mutex_lock.c:?)
+   by 0x........: pthread_mutex_lock (drd_pthread_intercepts.c:?)
+   by 0x........: contender_start (pth_mutex_signal.c:?)
+   by 0x........: vgDrd_thread_wrapper (drd_pthread_intercepts.c:?)
+   by 0x........: start_thread
+   by 0x........: clone (in /...libc...)
+Thread 2:
+Destroying locked mutex: mutex 0x........, recursion count 1, owner 1.
+   at 0x........: __libc_write (write.c:?)
+   by 0x........: write (write.c:?)
+   by 0x........: _IO_file_write@@GLIBC_2.2.5 (fileops.c:?)
+   by 0x........: new_do_write (fileops.c:?)
+   by 0x........: _IO_new_file_xsputn (fileops.c:?)
+   by 0x........: _IO_file_xsputn@@GLIBC_2.2.5 (fileops.c:?)
+   by 0x........: fwrite (iofwrite.c:?)
+   by 0x........: main (pth_mutex_signal.c:?)
+mutex 0x........ was first observed at:
+   at 0x........: pthread_mutex_init (drd_pthread_intercepts.c:?)
+   by 0x........: main (pth_mutex_signal.c:?)
+
+
+ERROR SUMMARY: 1 errors from 1 contexts (suppressed: 0 from 0)

Failed test details...
memcheck/tests/leak_cpp_interior.stderr.diff
************
--- leak_cpp_interior.stderr.exp
+++ leak_cpp_interior.stderr.out
@@ -1,4 +1,7 @@
 
+Conditional jump or move depends on uninitialised value(s)
+   ...
+
 valgrind output will go to log
 VALGRIND_DO_LEAK_CHECK
 x bytes in 1 blocks are definitely lost in loss record ... of ...
@@ -35,10 +38,10 @@
 LEAK SUMMARY:
    definitely lost: x (+0) bytes in 1 (+0) blocks
    indirectly lost: 0 (+0) bytes in 0 (+0) blocks
-     possibly lost: x (-x) bytes in 5 (+1) blocks
-   still reachable: x (+x) bytes in 3 (-1) blocks
+     possibly lost: x (-x) bytes in 4 (+0) blocks
+   still reachable: x (+x) bytes in 4 (+0) blocks
                       of which reachable via heuristic:
-                        newarray           : x (+x) bytes in 1 (+1) blocks
+                        newarray           : x (+x) bytes in 2 (+2) blocks
                         multipleinheritance: 0 (-x) bytes in 0 (-2) blocks
 To see details of leaked memory, give 'full' arg to leak_check
 
@@ -46,11 +49,11 @@
 LEAK SUMMARY:
    definitely lost: x (+0) bytes in 1 (+0) blocks
    indirectly lost: 0 (+0) bytes in 0 (+0) blocks
-     possibly lost: x (-x) bytes in 5 (+0) blocks
-   still reachable: x (+x) bytes in 3 (+0) blocks
+     possibly lost: x (+x) bytes in 5 (+1) blocks
+   still reachable: x (-x) bytes in 3 (-1) blocks
                       of which reachable via heuristic:
                         length64           : x (+x) bytes in 1 (+1) blocks
-                        newarray           : 0 (-x) bytes in 0 (-1) blocks
+                        newarray           : 0 (-x) bytes in 0 (-2) blocks
 To see details of leaked memory, give 'full' arg to leak_check
 
 leak_check summary heuristics stdstring
@@ -133,5 +136,6 @@
 
 All heap blocks were freed -- no leaks are possible
 
+Use --track-origins=yes to see where uninitialised values come from



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

