Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED847706E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 03:14:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0S3EJNl030146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 19:14:19 -0800
Received: from Flora.wrs.com (128.224.163.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 27 Jan 2016 19:14:18 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jan 2016 11:21:10 +0800
Message-ID: <1453951270-19246-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH] glibc: Fix BZ#19048 and BZ#19243
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
X-List-Received-Date: Thu, 28 Jan 2016 03:14:19 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

BZ#19048 malloc: arena free list can become cyclic, increasing
contention

When a thread leaves, arena_thread_freeres is called, the malloc
arena associated with the thread is added to the head of free_list,
and free_list set to the arena of the exiting thread.

  A common problem can be described as:
1. thread "t1" uses arena "a"
2. thread "t2" uses arena "a"
3. "t1" exit, making:
        a->next_free = free_list;
        free_list = a;
4. "t2" exits, but since free_list == a, it ends with
   free_list->next_free = free_list;

  When a program has several short lived threads, and most commonly
when there are more threads than arenas, one arena will end up being
used by most threads, causing significant contention.

BZ#19243 malloc: reused_arena can pick an arena on the free list,
leading to an assertion failure and reference count corruption

This was introduced by the fix for bug 19048.

If reused_arena picks an arena on the free list (which means that
arena_get2 did not see it yet, and there was a concurrent thread exit,
updating the free list), it will increase the thread reference count of
the arena.  At this point, this invariant in get_free_list no longer
holds:

821  /* Arenas on the free list are not attached to any thread.  */
822  assert (result->attached_threads == 0);

Therefore, the assert is incorrect.  I am not sure if we should simply
remove it and not change anything, or if we should change reused_arena
to avoid this race condition.

Written-by Florian Weimer.

Patches backported from upstream 2.23.

(LOCAL REV; NOT UPSTREAM) -- sent to oe-core on 2016-01-27.

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 ...ite-with-explicit-TLS-access-using-__thre.patch | 267 +++++++++++++++++
 ...ent-arena-free_list-from-turning-cyclic-B.patch | 228 +++++++++++++++
 ...attached-thread-reference-count-handling-.patch | 325 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |   3 +
 4 files changed, 823 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-malloc-Rewrite-with-explicit-TLS-access-using-__thre.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-malloc-Prevent-arena-free_list-from-turning-cyclic-B.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-malloc-Fix-attached-thread-reference-count-handling-.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-malloc-Rewrite-with-explicit-TLS-access-using-__thre.patch b/meta/recipes-core/glibc/glibc/0030-malloc-Rewrite-with-explicit-TLS-access-using-__thre.patch
new file mode 100644
index 0000000..284aadd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-malloc-Rewrite-with-explicit-TLS-access-using-__thre.patch
@@ -0,0 +1,267 @@
+From 02fbbefb84106af7e0ec026346411425f721f2c1 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Sat, 17 Oct 2015 12:06:48 +0200
+Subject: [PATCH 1/3] malloc: Rewrite with explicit TLS access using __thread
+
+Backported form upstream (git://sourceware.org/git/glibc.git) as of
+commit id 6782806d8f6664d87d17bb30f8ce4e0c7c931e17.
+
+Upstream-Status: Backport [2.23]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ malloc/arena.c                     | 48 +++++++++++++++-----------------------
+ manual/memory.texi                 |  4 ----
+ sysdeps/generic/malloc-machine.h   |  7 ------
+ sysdeps/mach/hurd/malloc-machine.h | 10 --------
+ sysdeps/nptl/malloc-machine.h      | 10 --------
+ 5 files changed, 19 insertions(+), 60 deletions(-)
+
+diff --git a/malloc/arena.c b/malloc/arena.c
+index 21ecc5a1..c91f76e 100644
+--- a/malloc/arena.c
++++ b/malloc/arena.c
+@@ -64,9 +64,12 @@ extern int sanity_check_heap_info_alignment[(sizeof (heap_info)
+                                              + 2 * SIZE_SZ) % MALLOC_ALIGNMENT
+                                             ? -1 : 1];
+ 
+-/* Thread specific data */
++/* Thread specific data.  */
++
++static __thread mstate thread_arena attribute_tls_model_ie;
++
++/* Arena free list.  */
+ 
+-static tsd_key_t arena_key;
+ static mutex_t list_lock = MUTEX_INITIALIZER;
+ static size_t narenas = 1;
+ static mstate free_list;
+@@ -89,15 +92,10 @@ int __malloc_initialized = -1;
+    in the new arena. */
+ 
+ #define arena_get(ptr, size) do { \
+-      arena_lookup (ptr);						      \
++      ptr = thread_arena;						      \
+       arena_lock (ptr, size);						      \
+   } while (0)
+ 
+-#define arena_lookup(ptr) do { \
+-      void *vptr = NULL;						      \
+-      ptr = (mstate) tsd_getspecific (arena_key, vptr);			      \
+-  } while (0)
+-
+ #define arena_lock(ptr, size) do {					      \
+       if (ptr && !arena_is_corrupt (ptr))				      \
+         (void) mutex_lock (&ptr->mutex);				      \
+@@ -138,11 +136,9 @@ ATFORK_MEM;
+ static void *
+ malloc_atfork (size_t sz, const void *caller)
+ {
+-  void *vptr = NULL;
+   void *victim;
+ 
+-  tsd_getspecific (arena_key, vptr);
+-  if (vptr == ATFORK_ARENA_PTR)
++  if (thread_arena == ATFORK_ARENA_PTR)
+     {
+       /* We are the only thread that may allocate at all.  */
+       if (save_malloc_hook != malloc_check)
+@@ -172,7 +168,6 @@ malloc_atfork (size_t sz, const void *caller)
+ static void
+ free_atfork (void *mem, const void *caller)
+ {
+-  void *vptr = NULL;
+   mstate ar_ptr;
+   mchunkptr p;                          /* chunk corresponding to mem */
+ 
+@@ -188,8 +183,7 @@ free_atfork (void *mem, const void *caller)
+     }
+ 
+   ar_ptr = arena_for_chunk (p);
+-  tsd_getspecific (arena_key, vptr);
+-  _int_free (ar_ptr, p, vptr == ATFORK_ARENA_PTR);
++  _int_free (ar_ptr, p, thread_arena == ATFORK_ARENA_PTR);
+ }
+ 
+ 
+@@ -212,9 +206,7 @@ ptmalloc_lock_all (void)
+ 
+   if (mutex_trylock (&list_lock))
+     {
+-      void *my_arena;
+-      tsd_getspecific (arena_key, my_arena);
+-      if (my_arena == ATFORK_ARENA_PTR)
++      if (thread_arena == ATFORK_ARENA_PTR)
+         /* This is the same thread which already locks the global list.
+            Just bump the counter.  */
+         goto out;
+@@ -234,8 +226,8 @@ ptmalloc_lock_all (void)
+   __malloc_hook = malloc_atfork;
+   __free_hook = free_atfork;
+   /* Only the current thread may perform malloc/free calls now. */
+-  tsd_getspecific (arena_key, save_arena);
+-  tsd_setspecific (arena_key, ATFORK_ARENA_PTR);
++  save_arena = thread_arena;
++  thread_arena = ATFORK_ARENA_PTR;
+ out:
+   ++atfork_recursive_cntr;
+ }
+@@ -251,7 +243,7 @@ ptmalloc_unlock_all (void)
+   if (--atfork_recursive_cntr != 0)
+     return;
+ 
+-  tsd_setspecific (arena_key, save_arena);
++  thread_arena = save_arena;
+   __malloc_hook = save_malloc_hook;
+   __free_hook = save_free_hook;
+   for (ar_ptr = &main_arena;; )
+@@ -279,7 +271,7 @@ ptmalloc_unlock_all2 (void)
+   if (__malloc_initialized < 1)
+     return;
+ 
+-  tsd_setspecific (arena_key, save_arena);
++  thread_arena = save_arena;
+   __malloc_hook = save_malloc_hook;
+   __free_hook = save_free_hook;
+   free_list = NULL;
+@@ -372,8 +364,7 @@ ptmalloc_init (void)
+     __morecore = __failing_morecore;
+ #endif
+ 
+-  tsd_key_create (&arena_key, NULL);
+-  tsd_setspecific (arena_key, (void *) &main_arena);
++  thread_arena = &main_arena;
+   thread_atfork (ptmalloc_lock_all, ptmalloc_unlock_all, ptmalloc_unlock_all2);
+   const char *s = NULL;
+   if (__glibc_likely (_environ != NULL))
+@@ -755,7 +746,7 @@ _int_new_arena (size_t size)
+   set_head (top (a), (((char *) h + h->size) - ptr) | PREV_INUSE);
+ 
+   LIBC_PROBE (memory_arena_new, 2, a, size);
+-  tsd_setspecific (arena_key, (void *) a);
++  thread_arena = a;
+   mutex_init (&a->mutex);
+   (void) mutex_lock (&a->mutex);
+ 
+@@ -788,7 +779,7 @@ get_free_list (void)
+         {
+           LIBC_PROBE (memory_arena_reuse_free_list, 1, result);
+           (void) mutex_lock (&result->mutex);
+-          tsd_setspecific (arena_key, (void *) result);
++	  thread_arena = result;
+         }
+     }
+ 
+@@ -841,7 +832,7 @@ reused_arena (mstate avoid_arena)
+ 
+ out:
+   LIBC_PROBE (memory_arena_reuse, 2, result, avoid_arena);
+-  tsd_setspecific (arena_key, (void *) result);
++  thread_arena = result;
+   next_to_use = result->next;
+ 
+   return result;
+@@ -926,9 +917,8 @@ arena_get_retry (mstate ar_ptr, size_t bytes)
+ static void __attribute__ ((section ("__libc_thread_freeres_fn")))
+ arena_thread_freeres (void)
+ {
+-  void *vptr = NULL;
+-  mstate a = tsd_getspecific (arena_key, vptr);
+-  tsd_setspecific (arena_key, NULL);
++  mstate a = thread_arena;
++  thread_arena = NULL;
+ 
+   if (a != NULL)
+     {
+diff --git a/manual/memory.texi b/manual/memory.texi
+index 0729e70..cea2cd7 100644
+--- a/manual/memory.texi
++++ b/manual/memory.texi
+@@ -332,8 +332,6 @@ this function is in @file{stdlib.h}.
+ @c __libc_malloc @asulock @aculock @acsfd @acsmem
+ @c  force_reg ok
+ @c  *malloc_hook unguarded
+-@c  arena_lookup ok
+-@c   tsd_getspecific ok, TLS
+ @c  arena_lock @asulock @aculock @acsfd @acsmem
+ @c   mutex_lock @asulock @aculock
+ @c   arena_get2 @asulock @aculock @acsfd @acsmem
+@@ -341,7 +339,6 @@ this function is in @file{stdlib.h}.
+ @c     mutex_lock (list_lock) dup @asulock @aculock
+ @c     mutex_unlock (list_lock) dup @aculock
+ @c     mutex_lock (arena lock) dup @asulock @aculock [returns locked]
+-@c     tsd_setspecific ok, TLS
+ @c    __get_nprocs ext ok @acsfd
+ @c    NARENAS_FROM_NCORES ok
+ @c    catomic_compare_and_exchange_bool_acq ok
+@@ -835,7 +832,6 @@ is declared in @file{stdlib.h}.
+ @c  *__malloc_hook dup unguarded
+ @c  memset dup ok
+ @c  arena_get @asulock @aculock @acsfd @acsmem
+-@c   arena_lookup dup ok
+ @c   arena_lock dup @asulock @aculock @acsfd @acsmem
+ @c  top dup ok
+ @c  chunksize dup ok
+diff --git a/sysdeps/generic/malloc-machine.h b/sysdeps/generic/malloc-machine.h
+index 10f6e72..802d1f5 100644
+--- a/sysdeps/generic/malloc-machine.h
++++ b/sysdeps/generic/malloc-machine.h
+@@ -40,13 +40,6 @@ typedef int mutex_t;
+ # define mutex_unlock(m)        (*(m) = 0)
+ # define MUTEX_INITIALIZER      (0)
+ 
+-typedef void *tsd_key_t;
+-# define tsd_key_create(key, destr) do {} while(0)
+-# define tsd_setspecific(key, data) ((key) = (data))
+-# define tsd_getspecific(key, vptr) (vptr = (key))
+-
+-# define thread_atfork(prepare, parent, child) do {} while(0)
+-
+ #endif /* !defined mutex_init */
+ 
+ #ifndef atomic_full_barrier
+diff --git a/sysdeps/mach/hurd/malloc-machine.h b/sysdeps/mach/hurd/malloc-machine.h
+index d69d82b..7a5ed59 100644
+--- a/sysdeps/mach/hurd/malloc-machine.h
++++ b/sysdeps/mach/hurd/malloc-machine.h
+@@ -52,16 +52,6 @@
+ /* No we're *not* using pthreads.  */
+ #define __pthread_initialize ((void (*)(void))0)
+ 
+-/* thread specific data for glibc */
+-
+-#include <bits/libc-tsd.h>
+-
+-typedef int tsd_key_t[1];	/* no key data structure, libc magic does it */
+-__libc_tsd_define (static, void *, MALLOC)	/* declaration/common definition */
+-#define tsd_key_create(key, destr)	((void) (key))
+-#define tsd_setspecific(key, data)	__libc_tsd_set (void *, MALLOC, (data))
+-#define tsd_getspecific(key, vptr)	((vptr) = __libc_tsd_get (void *, MALLOC))
+-
+ /* madvise is a stub on Hurd, so don't bother calling it.  */
+ 
+ #include <sys/mman.h>
+diff --git a/sysdeps/nptl/malloc-machine.h b/sysdeps/nptl/malloc-machine.h
+index 27c9911..4d44089 100644
+--- a/sysdeps/nptl/malloc-machine.h
++++ b/sysdeps/nptl/malloc-machine.h
+@@ -58,16 +58,6 @@ extern void *__dso_handle __attribute__ ((__weak__));
+   __linkin_atfork (&atfork_mem)
+ #endif
+ 
+-/* thread specific data for glibc */
+-
+-#include <bits/libc-tsd.h>
+-
+-typedef int tsd_key_t[1];	/* no key data structure, libc magic does it */
+-__libc_tsd_define (static, void *, MALLOC)	/* declaration/common definition */
+-#define tsd_key_create(key, destr)	((void) (key))
+-#define tsd_setspecific(key, data)	__libc_tsd_set (void *, MALLOC, (data))
+-#define tsd_getspecific(key, vptr)	((vptr) = __libc_tsd_get (void *, MALLOC))
+-
+ #include <sysdeps/generic/malloc-machine.h>
+ 
+ #endif /* !defined(_MALLOC_MACHINE_H) */
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/glibc/glibc/0031-malloc-Prevent-arena-free_list-from-turning-cyclic-B.patch b/meta/recipes-core/glibc/glibc/0031-malloc-Prevent-arena-free_list-from-turning-cyclic-B.patch
new file mode 100644
index 0000000..19504cd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-malloc-Prevent-arena-free_list-from-turning-cyclic-B.patch
@@ -0,0 +1,228 @@
+From def40e7d7c566502fc96dfd69dda5b27b01f73bd Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 28 Oct 2015 19:32:46 +0100
+Subject: [PATCH 2/3] malloc: Prevent arena free_list from turning cyclic [BZ
+ #19048]
+
+	[BZ# 19048]
+	* malloc/malloc.c (struct malloc_state): Update comment.  Add
+	attached_threads member.
+	(main_arena): Initialize attached_threads.
+	* malloc/arena.c (list_lock): Update comment.
+	(ptmalloc_lock_all, ptmalloc_unlock_all): Likewise.
+	(ptmalloc_unlock_all2): Reinitialize arena reference counts.
+	(deattach_arena): New function.
+	(_int_new_arena): Initialize arena reference count and deattach
+	replaced arena.
+	(get_free_list, reused_arena): Update reference count and deattach
+	replaced arena.
+	(arena_thread_freeres): Update arena reference count and only put
+	unreferenced arenas on the free list.
+
+Backported form upstream (git://sourceware.org/git/glibc.git) as of
+commit id a62719ba90e2fa1728890ae7dc8df9e32a622e7b.
+
+Upstream-Status: Backport [2.23]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ malloc/arena.c  | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++++-----
+ malloc/malloc.c | 11 +++++++--
+ 2 files changed, 74 insertions(+), 7 deletions(-)
+
+diff --git a/malloc/arena.c b/malloc/arena.c
+index c91f76e..d8b1e36 100644
+--- a/malloc/arena.c
++++ b/malloc/arena.c
+@@ -68,7 +68,10 @@ extern int sanity_check_heap_info_alignment[(sizeof (heap_info)
+ 
+ static __thread mstate thread_arena attribute_tls_model_ie;
+ 
+-/* Arena free list.  */
++/* Arena free list.  list_lock protects the free_list variable below,
++   and the next_free and attached_threads members of the mstate
++   objects.  No other (malloc) locks must be taken while list_lock is
++   active, otherwise deadlocks may occur.  */
+ 
+ static mutex_t list_lock = MUTEX_INITIALIZER;
+ static size_t narenas = 1;
+@@ -225,7 +228,10 @@ ptmalloc_lock_all (void)
+   save_free_hook = __free_hook;
+   __malloc_hook = malloc_atfork;
+   __free_hook = free_atfork;
+-  /* Only the current thread may perform malloc/free calls now. */
++  /* Only the current thread may perform malloc/free calls now.
++     save_arena will be reattached to the current thread, in
++     ptmalloc_lock_all, so save_arena->attached_threads is not
++     updated.  */
+   save_arena = thread_arena;
+   thread_arena = ATFORK_ARENA_PTR;
+ out:
+@@ -243,6 +249,9 @@ ptmalloc_unlock_all (void)
+   if (--atfork_recursive_cntr != 0)
+     return;
+ 
++  /* Replace ATFORK_ARENA_PTR with save_arena.
++     save_arena->attached_threads was not changed in ptmalloc_lock_all
++     and is still correct.  */
+   thread_arena = save_arena;
+   __malloc_hook = save_malloc_hook;
+   __free_hook = save_free_hook;
+@@ -274,12 +283,19 @@ ptmalloc_unlock_all2 (void)
+   thread_arena = save_arena;
+   __malloc_hook = save_malloc_hook;
+   __free_hook = save_free_hook;
++
++  /* Push all arenas to the free list, except save_arena, which is
++     attached to the current thread.  */
++  if (save_arena != NULL)
++    ((mstate) save_arena)->attached_threads = 1;
+   free_list = NULL;
+   for (ar_ptr = &main_arena;; )
+     {
+       mutex_init (&ar_ptr->mutex);
+       if (ar_ptr != save_arena)
+         {
++	  /* This arena is no longer attached to any thread.  */
++	  ar_ptr->attached_threads = 0;
+           ar_ptr->next_free = free_list;
+           free_list = ar_ptr;
+         }
+@@ -712,6 +728,22 @@ heap_trim (heap_info *heap, size_t pad)
+ 
+ /* Create a new arena with initial size "size".  */
+ 
++/* If REPLACED_ARENA is not NULL, detach it from this thread.  Must be
++   called while list_lock is held.  */
++static void
++detach_arena (mstate replaced_arena)
++{
++  if (replaced_arena != NULL)
++    {
++      assert (replaced_arena->attached_threads > 0);
++      /* The current implementation only detaches from main_arena in
++	 case of allocation failure.  This means that it is likely not
++	 beneficial to put the arena on free_list even if the
++	 reference count reaches zero.  */
++      --replaced_arena->attached_threads;
++    }
++}
++
+ static mstate
+ _int_new_arena (size_t size)
+ {
+@@ -733,6 +765,7 @@ _int_new_arena (size_t size)
+     }
+   a = h->ar_ptr = (mstate) (h + 1);
+   malloc_init_state (a);
++  a->attached_threads = 1;
+   /*a->next = NULL;*/
+   a->system_mem = a->max_system_mem = h->size;
+   arena_mem += h->size;
+@@ -746,12 +779,15 @@ _int_new_arena (size_t size)
+   set_head (top (a), (((char *) h + h->size) - ptr) | PREV_INUSE);
+ 
+   LIBC_PROBE (memory_arena_new, 2, a, size);
++  mstate replaced_arena = thread_arena;
+   thread_arena = a;
+   mutex_init (&a->mutex);
+   (void) mutex_lock (&a->mutex);
+ 
+   (void) mutex_lock (&list_lock);
+ 
++  detach_arena (replaced_arena);
++
+   /* Add the new arena to the global list.  */
+   a->next = main_arena.next;
+   atomic_write_barrier ();
+@@ -766,13 +802,23 @@ _int_new_arena (size_t size)
+ static mstate
+ get_free_list (void)
+ {
++  mstate replaced_arena = thread_arena;
+   mstate result = free_list;
+   if (result != NULL)
+     {
+       (void) mutex_lock (&list_lock);
+       result = free_list;
+       if (result != NULL)
+-        free_list = result->next_free;
++	{
++	  free_list = result->next_free;
++
++	  /* Arenas on the free list are not attached to any thread.  */
++	  assert (result->attached_threads == 0);
++	  /* But the arena will now be attached to this thread.  */
++	  result->attached_threads = 1;
++
++	  detach_arena (replaced_arena);
++	}
+       (void) mutex_unlock (&list_lock);
+ 
+       if (result != NULL)
+@@ -831,6 +877,14 @@ reused_arena (mstate avoid_arena)
+   (void) mutex_lock (&result->mutex);
+ 
+ out:
++  {
++    mstate replaced_arena = thread_arena;
++    (void) mutex_lock (&list_lock);
++    detach_arena (replaced_arena);
++    ++result->attached_threads;
++    (void) mutex_unlock (&list_lock);
++  }
++
+   LIBC_PROBE (memory_arena_reuse, 2, result, avoid_arena);
+   thread_arena = result;
+   next_to_use = result->next;
+@@ -923,8 +977,14 @@ arena_thread_freeres (void)
+   if (a != NULL)
+     {
+       (void) mutex_lock (&list_lock);
+-      a->next_free = free_list;
+-      free_list = a;
++      /* If this was the last attached thread for this arena, put the
++	 arena on the free list.  */
++      assert (a->attached_threads > 0);
++      if (--a->attached_threads == 0)
++	{
++	  a->next_free = free_list;
++	  free_list = a;
++	}
+       (void) mutex_unlock (&list_lock);
+     }
+ }
+diff --git a/malloc/malloc.c b/malloc/malloc.c
+index 452f036..037d4ff 100644
+--- a/malloc/malloc.c
++++ b/malloc/malloc.c
+@@ -1709,9 +1709,15 @@ struct malloc_state
+   /* Linked list */
+   struct malloc_state *next;
+ 
+-  /* Linked list for free arenas.  */
++  /* Linked list for free arenas.  Access to this field is serialized
++     by list_lock in arena.c.  */
+   struct malloc_state *next_free;
+ 
++  /* Number of threads attached to this arena.  0 if the arena is on
++     the free list.  Access to this field is serialized by list_lock
++     in arena.c.  */
++  INTERNAL_SIZE_T attached_threads;
++
+   /* Memory allocated from the system in this arena.  */
+   INTERNAL_SIZE_T system_mem;
+   INTERNAL_SIZE_T max_system_mem;
+@@ -1755,7 +1761,8 @@ struct malloc_par
+ static struct malloc_state main_arena =
+ {
+   .mutex = MUTEX_INITIALIZER,
+-  .next = &main_arena
++  .next = &main_arena,
++  .attached_threads = 1
+ };
+ 
+ /* There is only one instance of the malloc parameters.  */
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/glibc/glibc/0032-malloc-Fix-attached-thread-reference-count-handling-.patch b/meta/recipes-core/glibc/glibc/0032-malloc-Fix-attached-thread-reference-count-handling-.patch
new file mode 100644
index 0000000..598878a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0032-malloc-Fix-attached-thread-reference-count-handling-.patch
@@ -0,0 +1,325 @@
+From ae063e840f956f89fd26fe0f4370dcb3fe9a5104 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Wed, 16 Dec 2015 12:39:48 +0100
+Subject: [PATCH 3/3] malloc: Fix attached thread reference count handling [BZ
+ #19243]
+
+reused_arena can increase the attached thread count of arenas on the
+free list.  This means that the assertion that the reference count is
+zero is incorrect.  In this case, the reference count initialization
+is incorrect as well and could cause arenas to be put on the free
+list too early (while they still have attached threads).
+
+	* malloc/arena.c (get_free_list): Remove assert and adjust
+	reference count handling.  Add comment about reused_arena
+	interaction.
+	(reused_arena): Add comments abount get_free_list interaction.
+	* malloc/tst-malloc-thread-exit.c: New file.
+	* malloc/Makefile (tests): Add tst-malloc-thread-exit.
+	(tst-malloc-thread-exit): Link against libpthread.
+
+Backported form upstream (git://sourceware.org/git/glibc.git) as of
+commit id 3da825ce483903e3a881a016113b3e59fd4041de.
+
+Upstream-Status: Backport [2.23]
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ malloc/Makefile                 |   4 +-
+ malloc/arena.c                  |  12 ++-
+ malloc/tst-malloc-thread-exit.c | 217 ++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 228 insertions(+), 5 deletions(-)
+ create mode 100644 malloc/tst-malloc-thread-exit.c
+
+diff --git a/malloc/Makefile b/malloc/Makefile
+index 272ca4d..8545b9d 100644
+--- a/malloc/Makefile
++++ b/malloc/Makefile
+@@ -30,7 +30,7 @@ tests := mallocbug tst-malloc tst-valloc tst-calloc tst-obstack \
+ 	 tst-mallocstate tst-mcheck tst-mallocfork tst-trim1 \
+ 	 tst-malloc-usable tst-realloc tst-posix_memalign \
+ 	 tst-pvalloc tst-memalign tst-mallopt tst-scratch_buffer \
+-	 tst-malloc-backtrace
++	 tst-malloc-backtrace tst-malloc-thread-exit
+ test-srcs = tst-mtrace
+ 
+ routines = malloc morecore mcheck mtrace obstack \
+@@ -55,6 +55,8 @@ libmemusage-inhibit-o = $(filter-out .os,$(object-suffixes))
+ 
+ $(objpfx)tst-malloc-backtrace: $(common-objpfx)nptl/libpthread.so \
+ 			       $(common-objpfx)nptl/libpthread_nonshared.a
++$(objpfx)tst-malloc-thread-exit: $(common-objpfx)nptl/libpthread.so \
++			       $(common-objpfx)nptl/libpthread_nonshared.a
+ 
+ # These should be removed by `make clean'.
+ extra-objs = mcheck-init.o libmcheck.a
+diff --git a/malloc/arena.c b/malloc/arena.c
+index d8b1e36..39ad5da 100644
+--- a/malloc/arena.c
++++ b/malloc/arena.c
+@@ -799,6 +799,8 @@ _int_new_arena (size_t size)
+ }
+ 
+ 
++/* Remove an arena from free_list.  The arena may be in use because it
++   was attached concurrently to a thread by reused_arena below.  */
+ static mstate
+ get_free_list (void)
+ {
+@@ -812,10 +814,8 @@ get_free_list (void)
+ 	{
+ 	  free_list = result->next_free;
+ 
+-	  /* Arenas on the free list are not attached to any thread.  */
+-	  assert (result->attached_threads == 0);
+-	  /* But the arena will now be attached to this thread.  */
+-	  result->attached_threads = 1;
++	  /* The arena will be attached to this thread.  */
++	  ++result->attached_threads;
+ 
+ 	  detach_arena (replaced_arena);
+ 	}
+@@ -843,6 +843,8 @@ reused_arena (mstate avoid_arena)
+   if (next_to_use == NULL)
+     next_to_use = &main_arena;
+ 
++  /* Iterate over all arenas (including those linked from
++     free_list).  */
+   result = next_to_use;
+   do
+     {
+@@ -877,6 +879,8 @@ reused_arena (mstate avoid_arena)
+   (void) mutex_lock (&result->mutex);
+ 
+ out:
++  /* Attach the arena to the current thread.  Note that we may have
++     selected an arena which was on free_list.  */
+   {
+     mstate replaced_arena = thread_arena;
+     (void) mutex_lock (&list_lock);
+diff --git a/malloc/tst-malloc-thread-exit.c b/malloc/tst-malloc-thread-exit.c
+new file mode 100644
+index 0000000..da7297e
+--- /dev/null
++++ b/malloc/tst-malloc-thread-exit.c
+@@ -0,0 +1,217 @@
++/* Test malloc with concurrent thread termination.
++   Copyright (C) 2015 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* This thread spawns a number of outer threads, equal to the arena
++   limit.  The outer threads run a loop which start and join two
++   different kinds of threads: the first kind allocates (attaching an
++   arena to the thread; malloc_first_thread) and waits, the second
++   kind waits and allocates (wait_first_threads).  Both kinds of
++   threads exit immediately after waiting.  The hope is that this will
++   exhibit races in thread termination and arena management,
++   particularly related to the arena free list.  */
++
++#include <errno.h>
++#include <pthread.h>
++#include <stdbool.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <unistd.h>
++
++#define TIMEOUT 7
++
++static bool termination_requested;
++static int inner_thread_count = 4;
++static size_t malloc_size = 32;
++
++static void
++__attribute__ ((noinline, noclone))
++unoptimized_free (void *ptr)
++{
++  free (ptr);
++}
++
++static void *
++malloc_first_thread (void * closure)
++{
++  pthread_barrier_t *barrier = closure;
++  void *ptr = malloc (malloc_size);
++  if (ptr == NULL)
++    {
++      printf ("error: malloc: %m\n");
++      abort ();
++    }
++  int ret = pthread_barrier_wait (barrier);
++  if (ret != 0 && ret != PTHREAD_BARRIER_SERIAL_THREAD)
++    {
++      errno = ret;
++      printf ("error: pthread_barrier_wait: %m\n");
++      abort ();
++    }
++  unoptimized_free (ptr);
++  return NULL;
++}
++
++static void *
++wait_first_thread (void * closure)
++{
++  pthread_barrier_t *barrier = closure;
++  int ret = pthread_barrier_wait (barrier);
++  if (ret != 0 && ret != PTHREAD_BARRIER_SERIAL_THREAD)
++    {
++      errno = ret;
++      printf ("error: pthread_barrier_wait: %m\n");
++      abort ();
++    }
++  void *ptr = malloc (malloc_size);
++  if (ptr == NULL)
++    {
++      printf ("error: malloc: %m\n");
++      abort ();
++    }
++  unoptimized_free (ptr);
++  return NULL;
++}
++
++static void *
++outer_thread (void *closure)
++{
++  pthread_t *threads = calloc (sizeof (*threads), inner_thread_count);
++  if (threads == NULL)
++    {
++      printf ("error: calloc: %m\n");
++      abort ();
++    }
++
++  while (!__atomic_load_n (&termination_requested, __ATOMIC_RELAXED))
++    {
++      pthread_barrier_t barrier;
++      int ret = pthread_barrier_init (&barrier, NULL, inner_thread_count + 1);
++      if (ret != 0)
++        {
++          errno = ret;
++          printf ("pthread_barrier_init: %m\n");
++          abort ();
++        }
++      for (int i = 0; i < inner_thread_count; ++i)
++        {
++          void *(*func) (void *);
++          if ((i  % 2) == 0)
++            func = malloc_first_thread;
++          else
++            func = wait_first_thread;
++          ret = pthread_create (threads + i, NULL, func, &barrier);
++          if (ret != 0)
++            {
++              errno = ret;
++              printf ("error: pthread_create: %m\n");
++              abort ();
++            }
++        }
++      ret = pthread_barrier_wait (&barrier);
++      if (ret != 0 && ret != PTHREAD_BARRIER_SERIAL_THREAD)
++        {
++          errno = ret;
++          printf ("pthread_wait: %m\n");
++          abort ();
++        }
++      for (int i = 0; i < inner_thread_count; ++i)
++        {
++          ret = pthread_join (threads[i], NULL);
++          if (ret != 0)
++            {
++              ret = errno;
++              printf ("error: pthread_join: %m\n");
++              abort ();
++            }
++        }
++      ret = pthread_barrier_destroy (&barrier);
++      if (ret != 0)
++        {
++          ret = errno;
++          printf ("pthread_barrier_destroy: %m\n");
++          abort ();
++        }
++    }
++
++  free (threads);
++
++  return NULL;
++}
++
++static int
++do_test (void)
++{
++  /* The number of top-level threads should be equal to the number of
++     arenas.  See arena_get2.  */
++  long outer_thread_count = sysconf (_SC_NPROCESSORS_ONLN);
++  if (outer_thread_count >= 1)
++    {
++      /* See NARENAS_FROM_NCORES in malloc.c.  */
++      if (sizeof (long) == 4)
++        outer_thread_count *= 2;
++      else
++        outer_thread_count *= 8;
++    }
++
++  /* Leave some room for shutting down all threads gracefully.  */
++  int timeout = TIMEOUT - 2;
++
++  pthread_t *threads = calloc (sizeof (*threads), outer_thread_count);
++  if (threads == NULL)
++    {
++      printf ("error: calloc: %m\n");
++      abort ();
++    }
++
++  for (long i = 0; i < outer_thread_count; ++i)
++    {
++      int ret = pthread_create (threads + i, NULL, outer_thread, NULL);
++      if (ret != 0)
++        {
++          errno = ret;
++          printf ("error: pthread_create: %m\n");
++          abort ();
++        }
++    }
++
++  struct timespec ts = {timeout, 0};
++  if (nanosleep (&ts, NULL))
++    {
++      printf ("error: error: nanosleep: %m\n");
++      abort ();
++    }
++
++  __atomic_store_n (&termination_requested, true, __ATOMIC_RELAXED);
++
++  for (long i = 0; i < outer_thread_count; ++i)
++    {
++      int ret = pthread_join (threads[i], NULL);
++      if (ret != 0)
++        {
++          errno = ret;
++          printf ("error: pthread_join: %m\n");
++          abort ();
++        }
++    }
++  free (threads);
++
++  return 0;
++}
++
++#define TEST_FUNCTION do_test ()
++#include "../test-skeleton.c"
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index eeb9742..01f131f 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -43,6 +43,9 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch \
            file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
            file://0029-fix-getmntent-empty-lines.patch \
+           file://0030-malloc-Rewrite-with-explicit-TLS-access-using-__thre.patch \
+           file://0031-malloc-Prevent-arena-free_list-from-turning-cyclic-B.patch \
+           file://0032-malloc-Fix-attached-thread-reference-count-handling-.patch \
 "
 
 SRC_URI += "\
-- 
1.9.1


