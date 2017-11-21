Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BECC782FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Nov 2017 05:52:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 207so9336824pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 21:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t6euVuczUKwZA61fcyuYZvOnCeex8pq8cs9ZY/Xz++E=;
	b=XXR7itmzi3BlQlaIPbkulQAbfZUPvwlpncVk7TYjVkRUofH4IZE8dy20xetMVQACun
	tIt6uUFKNntCN+bNoIFtzeBkAPtpSYA1BieLRTz6dziy8H7TBlgbQPGfNQuRq4rl+kcO
	uMapYkpPVYSa3KLEQZnXqxF7uTQQ67gV9dQ5lkNeZVQvGuGLAK2fEEK10MS6zCQ9HAUk
	b/bwTb88vV3JSRxK9ilZwx8IrHAEyj4lbxeYfdsVEojHXuqaUTOAr/dx+WQF936SNP8X
	lCyPD1GORzapcE8qK71cZABAaMbbBRono5jtJb3I+DSmCwEDDgSxC+LmWtOwWnI9hUAV
	8TlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t6euVuczUKwZA61fcyuYZvOnCeex8pq8cs9ZY/Xz++E=;
	b=H4EH4tPsL73qMHS3M1/mYdGvtzHUAxF2VB+QXu8oL6Uh3CyqiM6Yboq1IU/xVAcL5w
	6IsfTSd1PqGvuoMIlSvpYiBJIk6gYwwtxseh/fK+dMPnLC63xcFGCEvEE8fHGuNPCxBU
	I5lPS8Xb0YlC1v0n612iS+mAF1uTCMs5e47iT2y5lqwaOh3QdLv6Vp9naZSOYEGgpsas
	Np0br3424O1YVuK3+deuRvlwdhl6Bos/HCZseXh5w+Hoyka+lbhhOmgmAp9FALV40mjp
	8hchK9OgNUm3CAjlKbzlweuvO1LwzkEpARoSLp2t477xcovkIlBbYReeSJDlRvy8hKUK
	IqLw==
X-Gm-Message-State: AJaThX64qV0n2sf9oAiLJ6wiDd1jSbfdBpzLqwNf0OKn7PSyutskrk6m
	kWjarUelNSPhpE0jQU567IyY3mAgxz+wkTIvjZE=
X-Google-Smtp-Source: AGs4zMa8auVmUMyw8BrjV2jwbX0/rzF0hdufcIr2yPyxUbXVejvj9BucABr9hPPIG6kpUlIoAgRCHZrMCBXC5dXym3Q=
X-Received: by 10.98.155.129 with SMTP id e1mr14230569pfk.119.1511243554477;
	Mon, 20 Nov 2017 21:52:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Mon, 20 Nov 2017 21:52:04 -0800 (PST)
In-Reply-To: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
References: <1511163855-163322-1-git-send-email-zhixiong.chi@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Nov 2017 21:52:04 -0800
Message-ID: <CAMKF1spBa+-7TzEwKNQ-a=Hf-gNT514mi4fGsKnt6SSSXRBCyw@mail.gmail.com>
To: Zhixiong Chi <zhixiong.chi@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: malloc: Add missing arena lock in malloc_info
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
X-List-Received-Date: Tue, 21 Nov 2017 05:52:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 19, 2017 at 11:44 PM, Zhixiong Chi
<zhixiong.chi@windriver.com> wrote:
> There are the multiple process crashes seen while using malloc_info.
> Obtain the size information while the arena lock is acquired, and only
> print it later.
>
> Backport patch from https://sourceware.org/git/gitweb.cgi?p=glibc.git;
> h=7a9368a1174cb15b9f1d6342e0e10dd90dae238d
>

this is fine

> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> ---
>  ...loc-add-missing-arena-lock-in-malloc-info.patch | 172 +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.26.bb              |   1 +
>  2 files changed, 173 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch b/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
> new file mode 100644
> index 0000000..e12400d
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0029-malloc-add-missing-arena-lock-in-malloc-info.patch
> @@ -0,0 +1,172 @@
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 15 Nov 2017 11:39:01 +0100
> +Subject: [PATCH] malloc: Add missing arena lock in malloc_info [BZ #22408]
> +
> +Obtain the size information while the arena lock is acquired, and only
> +print it later.
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
> +
> +Index: git/malloc/Makefile
> +===================================================================
> +--- git.orig/malloc/Makefile   2017-09-04 17:34:06.758018978 +0800
> ++++ git/malloc/Makefile        2017-11-20 14:57:43.440337572 +0800
> +@@ -34,6 +34,7 @@
> +        tst-interpose-nothread \
> +        tst-interpose-thread \
> +        tst-alloc_buffer \
> ++       tst-malloc_info \
> +
> + tests-static := \
> +        tst-interpose-static-nothread \
> +@@ -242,3 +243,5 @@
> + $(objpfx)tst-dynarray-fail-mem.out: $(objpfx)tst-dynarray-fail.out
> +       $(common-objpfx)malloc/mtrace $(objpfx)tst-dynarray-fail.mtrace > $@; \
> +       $(evaluate-test)
> ++
> ++$(objpfx)tst-malloc_info: $(shared-thread-library)
> +Index: git/malloc/malloc.c
> +===================================================================
> +--- git.orig/malloc/malloc.c   2017-09-04 17:34:06.758018978 +0800
> ++++ git/malloc/malloc.c        2017-11-20 15:01:02.412338959 +0800
> +@@ -5547,6 +5547,15 @@
> +         avail += sizes[NFASTBINS - 1 + i].total;
> +       }
> +
> ++      size_t heap_size = 0;
> ++      size_t heap_mprotect_size = 0;
> ++      if (ar_ptr != &main_arena)
> ++      {
> ++        heap_info *heap = heap_for_ptr (top (ar_ptr));
> ++        heap_size = heap->size;
> ++        heap_mprotect_size = heap->mprotect_size;
> ++      }
> ++
> +       __libc_lock_unlock (ar_ptr->mutex);
> +
> +       total_nfastblocks += nfastblocks;
> +@@ -5580,13 +5589,12 @@
> +
> +       if (ar_ptr != &main_arena)
> +       {
> +-        heap_info *heap = heap_for_ptr (top (ar_ptr));
> +         fprintf (fp,
> +                  "<aspace type=\"total\" size=\"%zu\"/>\n"
> +                  "<aspace type=\"mprotect\" size=\"%zu\"/>\n",
> +-                 heap->size, heap->mprotect_size);
> +-        total_aspace += heap->size;
> +-        total_aspace_mprotect += heap->mprotect_size;
> ++                 heap_size, heap_mprotect_size);
> ++        total_aspace += heap_size;
> ++        total_aspace_mprotect += heap_mprotect_size;
> +       }
> +       else
> +       {
> +Index: git/malloc/tst-malloc_info.c
> +===================================================================
> +--- /dev/null  1970-01-01 00:00:00.000000000 +0000
> ++++ git/malloc/tst-malloc_info.c       2017-11-20 15:02:03.208339383 +0800
> +@@ -0,0 +1,101 @@
> ++/* Smoke test for malloc_info.
> ++   Copyright (C) 2017 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <http://www.gnu.org/licenses/>.  */
> ++
> ++/* The purpose of this test is to provide a quick way to run
> ++   malloc_info in a multi-threaded process.  */
> ++
> ++#include <array_length.h>
> ++#include <malloc.h>
> ++#include <stdlib.h>
> ++#include <support/support.h>
> ++#include <support/xthread.h>
> ++
> ++/* This barrier is used to have the main thread wait until the helper
> ++   threads have performed their allocations.  */
> ++static pthread_barrier_t barrier;
> ++
> ++enum
> ++  {
> ++    /* Number of threads performing allocations.  */
> ++    thread_count  = 4,
> ++
> ++    /* Amount of memory allocation per thread.  This should be large
> ++       enough to cause the allocation of multiple heaps per arena.  */
> ++    per_thread_allocations
> ++      = sizeof (void *) == 4 ? 16 * 1024 * 1024 : 128 * 1024 * 1024,
> ++  };
> ++
> ++static void *
> ++allocation_thread_function (void *closure)
> ++{
> ++  struct list
> ++  {
> ++    struct list *next;
> ++    long dummy[4];
> ++  };
> ++
> ++  struct list *head = NULL;
> ++  size_t allocated = 0;
> ++  while (allocated < per_thread_allocations)
> ++    {
> ++      struct list *new_head = xmalloc (sizeof (*new_head));
> ++      allocated += sizeof (*new_head);
> ++      new_head->next = head;
> ++      head = new_head;
> ++    }
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++
> ++  /* Main thread prints first statistics here.  */
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++
> ++  while (head != NULL)
> ++    {
> ++      struct list *next_head = head->next;
> ++      free (head);
> ++      head = next_head;
> ++    }
> ++
> ++  return NULL;
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  xpthread_barrier_init (&barrier, NULL, thread_count + 1);
> ++
> ++  pthread_t threads[thread_count];
> ++  for (size_t i = 0; i < array_length (threads); ++i)
> ++    threads[i] = xpthread_create (NULL, allocation_thread_function, NULL);
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++  puts ("info: After allocation:");
> ++  malloc_info (0, stdout);
> ++
> ++  xpthread_barrier_wait (&barrier);
> ++  for (size_t i = 0; i < array_length (threads); ++i)
> ++    xpthread_join (threads[i]);
> ++
> ++  puts ("\ninfo: After deallocation:");
> ++  malloc_info (0, stdout);
> ++
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb b/meta/recipes-core/glibc/glibc_2.26.bb
> index 135ec4f..05d1e2c 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -43,6 +43,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
>             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch \
>             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> +           file://0029-malloc-add-missing-arena-lock-in-malloc-info.patch \
>  "
>
>  NATIVESDKFIXES ?= ""
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

