Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 3C78760291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 15:26:06 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 32AC3AE820;
	Wed, 13 Mar 2019 11:26:08 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id F4_LLDjlTc67; Wed, 13 Mar 2019 11:26:07 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 9E678AE818;
	Wed, 13 Mar 2019 11:26:07 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 9E678AE818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552490767;
	bh=DTDBX01dUFSZL9VnI3OxgL23JHhWM+AxokGfPabybkk=;
	h=From:To:Date:Message-Id;
	b=jDXG+xYKWS55ZTJ4G96izjCjz/fd3OXiXLyZ4wUH5KgJlkipc5mswC0fesEl0IrCq
	6CNnDiWvoVNKAP6YNAHq/ZGgt5NoktmJPKCi0zvfjb2/b9TAHaUtEiv/Uj0UBX3WTV
	4d++Lvvth/Tnuf/69CVJJZ5+K6oy8NiECxQhswnZVaToRibevNLAeAnYY8c8pfgvyY
	HnqMEb/6K7K8Drswo7BcPsEt+Vwbr2NWQuDLmmp773jyS9HSdnLG+Ijlj/QELwxZ3l
	hy29bHtNCGhrvFHQIGN8kJ/9sZYDaAtWVGVrIifqibuXXunz0FP3227SeO6J7fEP75
	bM6yIE20nikQQ==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id OAu3qoBeCr4Y; Wed, 13 Mar 2019 11:26:07 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id 6F554AE804;
	Wed, 13 Mar 2019 11:26:07 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 15:25:58 +0000
Message-Id: <20190313152558.16408-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [Thud][PATCH] glibc: Drop upstream rejected patches
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
X-List-Received-Date: Wed, 13 Mar 2019 15:26:07 -0000

From: Khem Raj <raj.khem@gmail.com>

These patches were applied, hoping that they will eventually be accepted
upstream but they have been rejected, I think its best that they are
dropped so we can avoid novel unintended behaviours that no other
distros will be seeing

(From OE-Core rev:54550aa42378ce4b215bccbfd95e5e650b0d2efa)

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

As a remainder, these glibc patches led to deadlock for the lttng-ust
python agent.

For a base test, I builded a core-image-sato and played around a bit in it.

Cheer

---
 ...set-dl_load_write_lock-after-forking.patch | 37 -----------
 ...ck-before-switching-to-malloc_atfork.patch | 65 -------------------
 meta/recipes-core/glibc/glibc_2.28.bb         |  2 -
 3 files changed, 104 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
deleted file mode 100644
index 71ddc1234b..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From efb0fca7db742f4195e1771d8ba4c7fba4938819 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH] reset dl_load_write_lock after forking
-
-The patch in this Bugzilla entry was requested by a customer:
-
-  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
-
-The __libc_fork() code reset dl_load_lock, but it also needed to reset
-dl_load_write_lock.  The patch has not yet been integrated upstream.
-
-Upstream-Status: Pending [ No Author See bugzilla]
-
-Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/nptl/fork.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index ec56a827eb..0f48933ff1 100644
---- a/sysdeps/nptl/fork.c
-+++ b/sysdeps/nptl/fork.c
-@@ -130,9 +130,9 @@ __libc_fork (void)
- 	  _IO_list_resetlock ();
- 	}
- 
--      /* Reset the lock the dynamic loader uses to protect its data.  */
-+      /* Reset the locks the dynamic loader uses to protect its data.  */
-       __rtld_lock_initialize (GL(dl_load_lock));
--
-+      __rtld_lock_initialize (GL(dl_load_write_lock));
-       /* Run the handlers registered for the child.  */
-       __run_fork_handlers (atfork_run_child);
-     }
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
deleted file mode 100644
index dd37f2cd4d..0000000000
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 6ea962e0946da7564a774b08dd3eda28d64e9e56 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH] Acquire ld.so lock before switching to malloc_atfork
-
-The patch is from
-  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
-
-If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
-RT_DELETE at the time another thread calls fork(), then the child exit code
-from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
-dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
-subsequently requires ld.so functionality before calling exec(), then the
-assertion will fire.
-
-The patch acquires dl_load_lock on entry to fork() and releases it on exit
-from the parent path.  The child path is initialized as currently done.
-This is essentially pthreads_atfork, but forced to be first because the
-acquisition of dl_load_lock must happen before malloc_atfork is active
-to avoid a deadlock.
-
-The patch has not yet been integrated upstream.
-
-Upstream-Status: Pending [ Not Author See bugzilla]
-
-Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
-Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- sysdeps/nptl/fork.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index 0f48933ff1..eef3f9669b 100644
---- a/sysdeps/nptl/fork.c
-+++ b/sysdeps/nptl/fork.c
-@@ -25,6 +25,7 @@
- #include <tls.h>
- #include <hp-timing.h>
- #include <ldsodefs.h>
-+#include <libc-lock.h>
- #include <stdio-lock.h>
- #include <atomic.h>
- #include <nptl/pthreadP.h>
-@@ -56,6 +57,9 @@ __libc_fork (void)
-   bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
- 
-   __run_fork_handlers (atfork_run_prepare);
-+  /* grab ld.so lock BEFORE switching to malloc_atfork */
-+  __rtld_lock_lock_recursive (GL(dl_load_lock));
-+  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
- 
-   /* If we are not running multiple threads, we do not have to
-      preserve lock state.  If fork runs from a signal handler, only
-@@ -150,6 +154,9 @@ __libc_fork (void)
- 
-       /* Run the handlers registered for the parent.  */
-       __run_fork_handlers (atfork_run_parent);
-+      /* unlock ld.so last, because we locked it first */
-+      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
-+      __rtld_lock_unlock_recursive (GL(dl_load_lock));
-     }
- 
-   return pid;
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index d072939254..72cee04d9a 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -40,8 +40,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
-           file://0026-reset-dl_load_write_lock-after-forking.patch \
-           file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-localedef-add-to-archive-uses-a-hard-coded-locale-pa.patch \
            file://0030-intl-Emit-no-lines-in-bison-generated-files.patch \
-- 
2.17.1


