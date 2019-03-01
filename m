Return-Path: <jonathan.rajotte-julien@efficios.com>
X-Greylist: delayed 552 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Mar 2019 23:01:02 UTC
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 436CC7CDEF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 23:01:02 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id BF8A61C63C3;
	Fri,  1 Mar 2019 17:51:51 -0500 (EST)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id KacODPOVS4iF; Fri,  1 Mar 2019 17:51:51 -0500 (EST)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 104271C63C0;
	Fri,  1 Mar 2019 17:51:51 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 104271C63C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1551480711;
	bh=/cGDqIKaIxa8hdhyQ2DVHAKZSl8saXYwZBQx2LoBCoY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Z/AXtIiQ8Ma55KlrIQeu7Zf2dK4S8fAO/ySHbuH/XgG00KZniSd9AtGsRNFK+mWev
	EmG8mUdH4/gGHz2ORe9xj3juhklq+MXDAEQiPyPfVA7gYmIVSskNeUL9cFiq/nV09t
	AxqQprNb04Bty9OunlAFWfTb+YWMx2z9whyXZ8RDoe8RTkoTGQmRYuqhsPhXW36qzT
	+woWnfFIcC//3+/1BfpRnGWCPFAyu0ldqBy5MhBUztfPEEKlnaFkOOc5KTWsjzJ6d+
	VhK3P07fZjOw/x/2/+/PgSMmcDO/XNbbMKfFcInUbR3T8vCOc9GIcX5gybe9RPFLIN
	9gZpfFbCHDmdw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id FpKTMtut5OiW; Fri,  1 Mar 2019 17:51:50 -0500 (EST)
Received: from joraj-alpa (192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id D16801C63B9;
	Fri,  1 Mar 2019 17:51:50 -0500 (EST)
Date: Fri, 1 Mar 2019 17:51:50 -0500
From: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190301225150.GB13998@joraj-alpa>
MIME-Version: 1.0
In-Reply-To: <1504585784-112682-1-git-send-email-zhixiong.chi@windriver.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: openembedded-core@lists.openembedded.org, schwab@suse.com
Subject: [PATCH v2] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Fri, 01 Mar 2019 23:01:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

One of our customer reported that lttng tracing with python (using the python
agent) resulted in a hang for their applications on Rocko (and up).

After a bit of investigation, it seems that it is related to the second patch
[1] of this patch series to be applied top of glibc. I know, we are late to the
party.

[1] file://0028-Bug-4578-add-ld.so-lock-while-fork.patch

Still, you will understand that by the nature of lttng-ust we depend quite a
bit on specific behaviours of glibc and try to do our best to comply with it.

When tracing using the lttng python agent, a python thread will end up
performing a dl_open, acquire the dl_locks* along the way, lttng-ust will
initialize (library constructor), spawn a listener thread and perform a fork to
modify our process-wide umask for a shm_open call. Our problem arise at the fork
moment since the dl_locks_* are already taken by the python thread (performing a
dl_open). I'll spare you the complete deadlock explanation (ust_lock and all).

We do have a patch (lttng-ust) to move all this code to the thread performing
the library constructor function. This should solve our issue since dl_locks_*
are nestable.

Anyhow, I believe that those two patches do not have their place in
OE-core/yocto base layer. I'm not that familiar with yocto/OE, correct me if
this is the wrong terminology.

The first patch reference/fix a bug [2] that was flagged as invalid by Andreas
Schwab (schwab) [Project steward] with, from what I understand, a valid reason.

The second patch refers again to bug [2] and also points to bug [3].

From what I understand [3] could also be invalidated for the same reason as [2]
based on the reproducer. This bug and its solution were never acknowledged by
any glibc project steward.

Also, Khem Raj asked to ping the glibc bugzilla to, I think, shakes things a bit
on Sept. 5, 2017. This was never acted upon.

I'm not exactly sure why this was merged. Can one appends to the core recipe? If
so, why was this merged if a customer could carry this patch in their own
layer/overlay? This does not seems to be a "backport" from upstream glibc or
something of this nature.

Thanks,

Cheers

[2] https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
[3] https://sourceware.org/bugzilla/show_bug.cgi?id=4578
[4] https://patchwork.openembedded.org/patch/143663/

> Date: Tue, 5 Sep 2017 12:29:44 +0800
> 
> The patch in this Bugzilla entry was requested by a customer:
>   https://sourceware.org/bugzilla/show_bug.cgi?id=4578
>   https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
> 
> If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
> RT_DELETE at the time another thread calls fork(), then the child exit code
> from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
> dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
> subsequently requires ld.so functionality before calling exec(), then the
> assertion will fire.
> 
> The patch acquires dl_load_lock on entry to fork() and releases it on exit
> from the parent path.  The child path is initialized as currently done.
> This is essentially pthreads_atfork, but forced to be first because the
> acquisition of dl_load_lock must happen before malloc_atfork is active
> to avoid a deadlock.
> 
> The __libc_fork() code reset dl_load_lock, but it also needed to reset
> dl_load_write_lock.
> 
> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...bc-reset-dl-load-write-lock-after-forking.patch | 37 ++++++++++++++
>  .../0028-Bug-4578-add-ld.so-lock-while-fork.patch  | 57 ++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.26.bb              |  2 +
>  3 files changed, 96 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
> new file mode 100644
> index 0000000..777b253
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0027-glibc-reset-dl-load-write-lock-after-forking.patch
> @@ -0,0 +1,37 @@
> +From a6bb73d1cfd20a73fbbe6076008376fb87879d1b Mon Sep 17 00:00:00 2001
> +From: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Date: Thu, 18 Aug 2016 17:59:13 +0800
> +Subject: [PATCH] reset dl_load_write_lock after forking
> +
> +The patch in this Bugzilla entry was requested by a customer:
> +
> +  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
> +
> +The __libc_fork() code reset dl_load_lock, but it also needed to reset
> +dl_load_write_lock.  The patch has not yet been integrated upstream.
> +
> +Upstream-Status: Pending [ Not Author See bugzilla]
> +
> +Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +---
> + sysdeps/nptl/fork.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
> +index 2b9ae4b..3d0b8da 100644
> +--- a/sysdeps/nptl/fork.c
> ++++ b/sysdeps/nptl/fork.c
> +@@ -174,8 +174,9 @@ __libc_fork (void)
> +       /* Reset locks in the I/O code.  */
> +       _IO_list_resetlock ();
> + 
> +-      /* Reset the lock the dynamic loader uses to protect its data.  */
> ++      /* Reset the locks the dynamic loader uses to protect its data.  */
> +       __rtld_lock_initialize (GL(dl_load_lock));
> ++      __rtld_lock_initialize (GL(dl_load_write_lock));
> + 
> +       /* Run the handlers registered for the child.  */
> +       while (allp != NULL)
> +-- 
> +1.9.1
> diff --git a/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch b/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
> new file mode 100644
> index 0000000..f76237a
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-Bug-4578-add-ld.so-lock-while-fork.patch
> @@ -0,0 +1,57 @@
> +The patch in this Bugzilla entry was requested by a customer:
> +  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
> +
> +If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
> +RT_DELETE at the time another thread calls fork(), then the child exit code
> +from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
> +dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
> +subsequently requires ld.so functionality before calling exec(), then the
> +assertion will fire.
> +
> +The patch acquires dl_load_lock on entry to fork() and releases it on exit
> +from the parent path.  The child path is initialized as currently done.
> +This is essentially pthreads_atfork, but forced to be first because the
> +acquisition of dl_load_lock must happen before malloc_atfork is active
> +to avoid a deadlock.
> +The patch has not yet been integrated upstream.
> +
> +Upstream-Status: Pending [ Not Author See bugzilla]
> +
> +Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
> +Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: git/sysdeps/nptl/fork.c
> +===================================================================
> +--- git.orig/sysdeps/nptl/fork.c       2017-08-03 16:02:15.674704080 +0800
> ++++ git/sysdeps/nptl/fork.c    2017-08-04 18:15:02.463362015 +0800
> +@@ -25,6 +25,7 @@
> + #include <tls.h>
> + #include <hp-timing.h>
> + #include <ldsodefs.h>
> ++#include <libc-lock.h>
> + #include <stdio-lock.h>
> + #include <atomic.h>
> + #include <nptl/pthreadP.h>
> +@@ -60,6 +61,10 @@
> +      but our current fork implementation is not.  */
> +   bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
> + 
> ++  /* grab ld.so lock BEFORE switching to malloc_atfork */
> ++  __rtld_lock_lock_recursive (GL(dl_load_lock));
> ++  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
> ++
> +   /* Run all the registered preparation handlers.  In reverse order.
> +      While doing this we build up a list of all the entries.  */
> +   struct fork_handler *runp;
> +@@ -247,6 +252,10 @@
> + 
> + 	  allp = allp->next;
> + 	}
> ++
> ++      /* unlock ld.so last, because we locked it first */
> ++      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
> ++      __rtld_lock_unlock_recursive (GL(dl_load_lock));
> +     }
> + 
> +   return pid;
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
> index d453d8f..135ec4f 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -41,6 +41,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
>             file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
> +           file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
> +           file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
>  "
>  
>  NATIVESDKFIXES ?= ""

-- 
Jonathan Rajotte-Julien
EfficiOS

