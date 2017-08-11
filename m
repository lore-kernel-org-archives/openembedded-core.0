Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C34B781F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 03:17:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7B3HMtf001940
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 20:17:23 -0700
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 20:17:22 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 11:16:41 +0800
Message-ID: <1502421401-112341-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] glibc: add ld.so locks in _libc_fork
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
X-List-Received-Date: Fri, 11 Aug 2017 03:17:22 -0000
Content-Type: text/plain

The patch in this Bugzilla entry was requested by a customer:
  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282

If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
RT_DELETE at the time another thread calls fork(), then the child exit code
from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
subsequently requires ld.so functionality before calling exec(), then the
assertion will fire.

The patch acquires dl_load_lock on entry to fork() and releases it on exit
from the parent path.  The child path is initialized as currently done.
This is essentially pthreads_atfork, but forced to be first because the
acquisition of dl_load_lock must happen before malloc_atfork is active
to avoid a deadlock.

The __libc_fork() code reset dl_load_lock, but it also needed to reset
dl_load_write_lock.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 .../0001-Bug-4578-add-ld.so-lock-while-fork.patch  | 57 ++++++++++++++++++++++
 ...bc-reset-dl-load-write-lock-after-forking.patch | 37 ++++++++++++++
 meta/recipes-core/glibc/glibc_2.25.90.bb           |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-lock-while-fork.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-load-write-lock-after-forking.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-lock-while-fork.patch b/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-lock-while-fork.patch
new file mode 100644
index 0000000..ab82866
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Bug-4578-add-ld.so-lock-while-fork.patch
@@ -0,0 +1,57 @@
+The patch in this Bugzilla entry was requested by a customer:
+  https://sourceware.org/bugzilla/show_bug.cgi?id=4578
+
+If a thread happens to hold dl_load_lock and have r_state set to RT_ADD or
+RT_DELETE at the time another thread calls fork(), then the child exit code
+from fork (in nptl/sysdeps/unix/sysv/linux/fork.c in our case) re-initializes
+dl_load_lock but does not restore r_state to RT_CONSISTENT. If the child
+subsequently requires ld.so functionality before calling exec(), then the
+assertion will fire.
+
+The patch acquires dl_load_lock on entry to fork() and releases it on exit
+from the parent path.  The child path is initialized as currently done.
+This is essentially pthreads_atfork, but forced to be first because the
+acquisition of dl_load_lock must happen before malloc_atfork is active
+to avoid a deadlock.
+The patch has not yet been integrated upstream.
+
+Upstream-Status: Pending [ Not Author See bugzilla]
+
+Signed-off-by: Raghunath Lolur <Raghunath.Lolur@kpit.com>
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+Index: git/sysdeps/nptl/fork.c
+===================================================================
+--- git.orig/sysdeps/nptl/fork.c	2017-08-03 16:02:15.674704080 +0800
++++ git/sysdeps/nptl/fork.c	2017-08-04 18:15:02.463362015 +0800
+@@ -25,6 +25,7 @@
+ #include <tls.h>
+ #include <hp-timing.h>
+ #include <ldsodefs.h>
++#include <libc-lock.h>
+ #include <stdio-lock.h>
+ #include <atomic.h>
+ #include <nptl/pthreadP.h>
+@@ -60,6 +61,10 @@
+      but our current fork implementation is not.  */
+   bool multiple_threads = THREAD_GETMEM (THREAD_SELF, header.multiple_threads);
+ 
++  /* grab ld.so lock BEFORE switching to malloc_atfork */
++  __rtld_lock_lock_recursive (GL(dl_load_lock));
++  __rtld_lock_lock_recursive (GL(dl_load_write_lock));
++
+   /* Run all the registered preparation handlers.  In reverse order.
+      While doing this we build up a list of all the entries.  */
+   struct fork_handler *runp;
+@@ -258,6 +263,10 @@
+ 
+ 	  allp = allp->next;
+ 	}
++
++      /* unlock ld.so last, because we locked it first */
++      __rtld_lock_unlock_recursive (GL(dl_load_write_lock));
++      __rtld_lock_unlock_recursive (GL(dl_load_lock));
+     }
+ 
+   return pid;
diff --git a/meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-load-write-lock-after-forking.patch b/meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-load-write-lock-after-forking.patch
new file mode 100644
index 0000000..777b253
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-glibc-reset-dl-load-write-lock-after-forking.patch
@@ -0,0 +1,37 @@
+From a6bb73d1cfd20a73fbbe6076008376fb87879d1b Mon Sep 17 00:00:00 2001
+From: Yuanjie Huang <yuanjie.huang@windriver.com>
+Date: Thu, 18 Aug 2016 17:59:13 +0800
+Subject: [PATCH] reset dl_load_write_lock after forking
+
+The patch in this Bugzilla entry was requested by a customer:
+
+  https://www.sourceware.org/bugzilla/show_bug.cgi?id=19282
+
+The __libc_fork() code reset dl_load_lock, but it also needed to reset
+dl_load_write_lock.  The patch has not yet been integrated upstream.
+
+Upstream-Status: Pending [ Not Author See bugzilla]
+
+Signed-off-by: Damodar Sonone <damodar.sonone@kpit.com>
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ sysdeps/nptl/fork.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sysdeps/nptl/fork.c b/sysdeps/nptl/fork.c
+index 2b9ae4b..3d0b8da 100644
+--- a/sysdeps/nptl/fork.c
++++ b/sysdeps/nptl/fork.c
+@@ -174,8 +174,9 @@ __libc_fork (void)
+       /* Reset locks in the I/O code.  */
+       _IO_list_resetlock ();
+ 
+-      /* Reset the lock the dynamic loader uses to protect its data.  */
++      /* Reset the locks the dynamic loader uses to protect its data.  */
+       __rtld_lock_initialize (GL(dl_load_lock));
++      __rtld_lock_initialize (GL(dl_load_write_lock));
+ 
+       /* Run the handlers registered for the child.  */
+       while (allp != NULL)
+-- 
+1.9.1
diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb b/meta/recipes-core/glibc/glibc_2.25.90.bb
index caf1ff4..1335407 100644
--- a/meta/recipes-core/glibc/glibc_2.25.90.bb
+++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
@@ -41,6 +41,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
            file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
            file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
+           file://0001-glibc-reset-dl-load-write-lock-after-forking.patch \
+           file://0001-Bug-4578-add-ld.so-lock-while-fork.patch \
 "
 
 NATIVESDKFIXES ?= ""
-- 
1.9.1


