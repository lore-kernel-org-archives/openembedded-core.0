Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id BB1C16D56C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 15:21:13 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id C0B14AE66C;
	Wed, 13 Mar 2019 11:21:14 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id O7qJ-dELE1ym; Wed, 13 Mar 2019 11:21:14 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id 1D829AE665;
	Wed, 13 Mar 2019 11:21:14 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 1D829AE665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1552490474;
	bh=eJ8+G0FReqVOvpJl4n3gtSWg4etHM/vjMvaucIPkLKM=;
	h=From:To:Date:Message-Id;
	b=KETEBefJWyOahC7W2ka3O5OUUVD7hQavGibze0w4geYVewh0i9Dn/lP0uBeckL8WL
	tYEcIEmxzPZKe3HI1bxOSmoaU2cm9n4HGMETHvOVFWE6KqedUJ8SKgV/qZeL2B7b7O
	BDA3Djz+Lhe9opx1cZvKbW6oM0dRdajsGvZ+nrQC83K3dtHPR2xYl3PovbOAiOVWyM
	AR4G0DOI/J6Ur15QCGGyMjcaAnjgFbvK2I8fkcPF6ufZUtT3uM6dGdAL9WT/JzpB3E
	B952XQEkTnfWWyxpLooLDwwveUA1s9oVUvTp8iyj+dBAI1tsrKemdsfT6mGfu1Re9m
	nigDWTW/PbGLg==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id UBGgqfdQ3TlV; Wed, 13 Mar 2019 11:21:14 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-157-41.qc.cable.ebox.net [192.222.157.41])
	by mail.efficios.com (Postfix) with ESMTPSA id E678FAE65E;
	Wed, 13 Mar 2019 11:21:13 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2019 15:20:57 +0000
Message-Id: <20190313152057.16336-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [Sumo][PATCH] glibc: Drop upstream rejected patches
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
X-List-Received-Date: Wed, 13 Mar 2019 15:21:15 -0000

From: Khem Raj <raj.khem@gmail.com>

These patches were applied, hoping that they will eventually be accepted
upstream but they have been rejected, I think its best that they are
dropped so we can avoid novel unintended behaviours that no other
distros will be seeing

(From OE-Core: 54550aa42378ce4b215bccbfd95e5e650b0d2efa)

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

As a remainder, these glibc patches led to deadlock for the lttng-ust
python agent.

For a base test, I builded a core-image-sato, played around a bit in it.

Cheer.

---
 ...set-dl_load_write_lock-after-forking.patch | 40 -----------
 ...ck-before-switching-to-malloc_atfork.patch | 70 -------------------
 meta/recipes-core/glibc/glibc_2.27.bb         |  2 -
 3 files changed, 112 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
deleted file mode 100644
index eca1193dd3..0000000000
--- a/meta/recipes-core/glibc/glibc/0026-reset-dl_load_write_lock-after-forking.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 847d37d5a34e4bf294de4ba98de3668950e28bc7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:05:07 -0800
-Subject: [PATCH 26/27] reset dl_load_write_lock after forking
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
-index 846fa49ef2..f87506f398 100644
---- a/sysdeps/nptl/fork.c
-+++ b/sysdeps/nptl/fork.c
-@@ -194,9 +194,9 @@ __libc_fork (void)
- 	  _IO_list_resetlock ();
- 	}
- 
--      /* Reset the lock the dynamic loader uses to protect its data.  */
-+      /* Reset the locks the dynamic loader uses to protect its data.  */
-       __rtld_lock_initialize (GL(dl_load_lock));
--
-+      __rtld_lock_initialize (GL(dl_load_write_lock));
-       /* Run the handlers registered for the child.  */
-       while (allp != NULL)
- 	{
--- 
-2.16.1
-
diff --git a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch b/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
deleted file mode 100644
index 9ec234bd51..0000000000
--- a/meta/recipes-core/glibc/glibc/0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 94225ab4bcc1613531558a632270b5edce779bc9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jan 2018 10:08:04 -0800
-Subject: [PATCH 27/27] Acquire ld.so lock before switching to malloc_atfork
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
- sysdeps/nptl/fork.c | 9 +++++++++
- 1 file changed, 9 insertions(+)
-
-diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
-index f87506f398..225e7b51f8 100644
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
-@@ -60,6 +61,10 @@ __libc_fork (void)
-      but our current fork implementation is not.  */
-   bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
- 
-+  /* grab ld.so lock BEFORE switching to malloc_atfork */
-+  __rtld_lock_lock_recursive (GL(dl_load_lock));
-+  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
-+
-   /* Run all the registered preparation handlers.  In reverse order.
-      While doing this we build up a list of all the entries.  */
-   struct fork_handler *runp;
-@@ -246,6 +251,10 @@ __libc_fork (void)
- 
- 	  allp = allp->next;
- 	}
-+
-+      /* unlock ld.so last, because we locked it first */
-+      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
-+      __rtld_lock_unlock_recursive (GL(dl_load_lock));
-     }
- 
-   return pid;
--- 
-2.16.1
-
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index adee494c2e..650de727b4 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -40,8 +40,6 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
-           file://0026-reset-dl_load_write_lock-after-forking.patch \
-           file://0027-Acquire-ld.so-lock-before-switching-to-malloc_atfork.patch \
            file://0028-bits-siginfo-consts.h-enum-definition-for-TRAP_HWBKP.patch \
            file://0029-Replace-strncpy-with-memccpy-to-fix-Wstringop-trunca.patch \
            file://0030-plural_c_no_preprocessor_lines.patch \
-- 
2.17.1


