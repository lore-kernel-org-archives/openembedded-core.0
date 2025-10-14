Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D37CCD197
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.2580.1760481912581889073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Tytpzupz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b550a522a49so4856287a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481912; x=1761086712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bSv9Jjr29pQHQmmMlpqj3cUyO7lAlMf96YU4p4vA8A=;
        b=Tytpzupz/5hRedG3Cladiit21Hl6Vftv2u3p1O2MRYwMntxjjhQwdtzwom8ITJ/7Yc
         qLrrBvvhYeBlcAn/5db7CFCkWPJ21lakcNaqmy4chKay99X4hfHx5UAwzWb4FI+QVRgu
         T2Ru/UqguwY/yRN7Ekb7SSFL7phoYzOQpPmUiDJtMSvoCJpeq8562OnzJUQBuARqAo7W
         jxw71M8BJGCSNwVv8DPDWHBjjZOmawsUiLg+oyqqrL94esaflE5W4xEClVMWQWTqiGcb
         tkxYADi2miwqWildeietOvDoWub9mNoInpA5bkBqSEHKSZ4sdsIfMG017X2/gjifayu4
         P0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481912; x=1761086712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/bSv9Jjr29pQHQmmMlpqj3cUyO7lAlMf96YU4p4vA8A=;
        b=W5l5ZWR/J1V0mQxbWFFrgJqK1d0vnLubrbvRHw4YL8GvPsDiOTDpto2nlw0g9DTlBk
         NSLuzJYq6P3ycJQP0jeiDxRDle+WQ3VB1kx9LJs+sGYNSI5nV9dqeSD17flR9v1rwpX4
         9v9a7fNlPsltHjqMGpNFQfEG17ZXf9zkL8Rjw6v1vHJi02Xql52MMTP0B0WMrRpCYhFo
         nk8WljXvNaWGQRgwwn2BJzxebYy7BqGSjb6BOoCW56sCIo1v7dXekpr1l85H1pB2LlgP
         NjgpQ0OnUx4XMGWVGBCS510a2KPtHI9dVgRUBftd7k4X9/wYV50xixMy5565YRkuT1kb
         fRuw==
X-Gm-Message-State: AOJu0Yw+TQOk3HcS/GvtviJ9e6W2dIK41jOOnrJlosueO5a42rAi1QM9
	0X4c0neVto1KNx3/Xw5/25qB0+QCPRRSo8I6jkCcgVAcLAS4w4plBx53bfoFFuKp8xpvvYSQG9Z
	TK9lc
X-Gm-Gg: ASbGncueNqUnnJ3/2XAfY4Ww1DE4qq05lOFpBgT/LT1S2twlRitt94u1uKsgwP5PEtu
	6eCklFF8LpT9kabu3Diy7illoBYCKPF/M9PTEJcoZTZdontvkn8yZf9VK1mp4ibayNiMgx/T6a0
	saTM9dDWawMIozXRa0fEShZebhhtD5lKielh7RZnJAdkLIrkp3UHPIgYa54qcpI49TL+YED+UvP
	Cs01sym6ypGtldxGgkOfe3PlxO34Rief7rKpLM/HfEpQpvPqupp4thJf0o965PYxEFde2X03a0U
	wuTkUGNPr44dV+GEjX5QPrrX9pqAte0PD8Nh4/caSjB2Cqq32KWMFOC4SaGECWveE7NFIXcDbtA
	7/UT5WYjFa4MY+zV7tj7uGhpZ34KttMuHNcKNJYtxJKw=
X-Google-Smtp-Source: AGHT+IGdyrZW9fwfwfIXrxBIyUUZUIL2PMJJIzXUUoRKHdimM3PYaRgBwXbWqVloDrggUsfTXNe6Sw==
X-Received: by 2002:a17:902:ce81:b0:266:f01a:98c4 with SMTP id d9443c01a7336-2902723e35cmr376298225ad.13.1760481911676;
        Tue, 14 Oct 2025 15:45:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] glibc: Remove g_refs from condition variables
Date: Tue, 14 Oct 2025 15:44:46 -0700
Message-ID: <1972b6776fa8a23b9d373d516ace32e136e9058f.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224863

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=c36fc50781995e6758cae2b6927839d0157f213c
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002278.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-5.patch          | 188 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
new file mode 100644
index 0000000000..e50e942471
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
@@ -0,0 +1,188 @@
+From f904a81ff8d0469ceaf3220329e716c03fcbd2d3 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 05:59:02 -0700
+Subject: [PATCH] nptl: Remove g_refs from condition variables
+
+This variable used to be needed to wait in group switching until all sleepers
+have confirmed that they have woken. This is no longer needed. Nothing waits
+on this variable so there is no need to track how many threads are currently
+asleep in each group.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+cmmit: c36fc50781995e6758cae2b6927839d0157f213c
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002278.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c                | 52 +------------------------
+ nptl/tst-cond22.c                       | 12 +++---
+ sysdeps/nptl/bits/thread-shared-types.h |  3 +-
+ sysdeps/nptl/pthread.h                  |  2 +-
+ 4 files changed, 9 insertions(+), 60 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 47e834ca..8a9219e0 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -143,23 +143,6 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+     }
+ }
+ 
+-/* Wake up any signalers that might be waiting.  */
+-static void
+-__condvar_dec_grefs (pthread_cond_t *cond, unsigned int g, int private)
+-{
+-  /* Release MO to synchronize-with the acquire load in
+-     __condvar_quiesce_and_switch_g1.  */
+-  if (atomic_fetch_add_release (cond->__data.__g_refs + g, -2) == 3)
+-    {
+-      /* Clear the wake-up request flag before waking up.  We do not need more
+-	 than relaxed MO and it doesn't matter if we apply this for an aliased
+-	 group because we wake all futex waiters right after clearing the
+-	 flag.  */
+-      atomic_fetch_and_relaxed (cond->__data.__g_refs + g, ~(unsigned int) 1);
+-      futex_wake (cond->__data.__g_refs + g, INT_MAX, private);
+-    }
+-}
+-
+ /* Clean-up for cancellation of waiters waiting for normal signals.  We cancel
+    our registration as a waiter, confirm we have woken up, and re-acquire the
+    mutex.  */
+@@ -171,8 +154,6 @@ __condvar_cleanup_waiting (void *arg)
+   pthread_cond_t *cond = cbuffer->cond;
+   unsigned g = cbuffer->wseq & 1;
+ 
+-  __condvar_dec_grefs (cond, g, cbuffer->private);
+-
+   __condvar_cancel_waiting (cond, cbuffer->wseq >> 1, g, cbuffer->private);
+   /* FIXME With the current cancellation implementation, it is possible that
+      a thread is cancelled after it has returned from a syscall.  This could
+@@ -327,15 +308,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   It is essential that the last field in pthread_cond_t is __g_signals[1]:
+-   The previous condvar used a pointer-sized field in pthread_cond_t, so a
+-   PTHREAD_COND_INITIALIZER from that condvar implementation might only
+-   initialize 4 bytes to zero instead of the 8 bytes we need (i.e., 44 bytes
+-   in total instead of the 48 we need).  __g_signals[1] is not accessed before
+-   the first group switch (G2 starts at index 0), which will set its value to
+-   zero after a harmless fetch-or whose return value is ignored.  This
+-   effectively completes initialization.
+-
+ 
+    Limitations:
+    * This condvar isn't designed to allow for more than
+@@ -440,21 +412,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    break;
+ 
+-	  /* No signals available after spinning, so prepare to block.
+-	     We first acquire a group reference and use acquire MO for that so
+-	     that we synchronize with the dummy read-modify-write in
+-	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the advancement of __g_signals
+-	     to the upcoming new g1_start that occurs with a concurrent
+-	     attempt to reuse the group's slot.
+-	     We use acquire MO for the __g_signals check to make the
+-	     __g1_start check work (see spinning above).
+-	     Note that the group reference acquisition will not mask the
+-	     release MO when decrementing the reference count because we use
+-	     an atomic read-modify-write operation and thus extend the release
+-	     sequence.  */
+-	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+ 	  struct _condvar_cleanup_buffer cbuffer;
+@@ -471,18 +428,11 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+ 	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
++	      /* If we timed out, we effectively cancel waiting.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+ 	      goto done;
+ 	    }
+-	  else
+-	    __condvar_dec_grefs (cond, g, private);
+ 
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+diff --git a/nptl/tst-cond22.c b/nptl/tst-cond22.c
+index 1336e9c7..bdcb45c5 100644
+--- a/nptl/tst-cond22.c
++++ b/nptl/tst-cond22.c
+@@ -106,13 +106,13 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u, %u/%u, %u, %u }\n",
+ 	  c.__data.__wseq.__value32.__high,
+ 	  c.__data.__wseq.__value32.__low,
+ 	  c.__data.__g1_start.__value32.__high,
+ 	  c.__data.__g1_start.__value32.__low,
+-	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
+-	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g_signals[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_size[1],
+ 	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   if (pthread_create (&th, NULL, tf, (void *) 1l) != 0)
+@@ -152,13 +152,13 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++  printf ("cond = { 0x%x:%x, 0x%x:%x, %u/%u, %u/%u, %u, %u }\n",
+ 	  c.__data.__wseq.__value32.__high,
+ 	  c.__data.__wseq.__value32.__low,
+ 	  c.__data.__g1_start.__value32.__high,
+ 	  c.__data.__g1_start.__value32.__low,
+-	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
+-	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g_signals[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_size[1],
+ 	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   return status;
+diff --git a/sysdeps/nptl/bits/thread-shared-types.h b/sysdeps/nptl/bits/thread-shared-types.h
+index 5653507e..6f17afa4 100644
+--- a/sysdeps/nptl/bits/thread-shared-types.h
++++ b/sysdeps/nptl/bits/thread-shared-types.h
+@@ -95,8 +95,7 @@ struct __pthread_cond_s
+ {
+   __atomic_wide_counter __wseq;
+   __atomic_wide_counter __g1_start;
+-  unsigned int __g_refs[2] __LOCK_ALIGNMENT;
+-  unsigned int __g_size[2];
++  unsigned int __g_size[2] __LOCK_ALIGNMENT;
+   unsigned int __g1_orig_size;
+   unsigned int __wrefs;
+   unsigned int __g_signals[2];
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index dedad4ec..bbb36540 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -152,7 +152,7 @@ enum
+ 
+ 
+ /* Conditional variable handling.  */
+-#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, {0, 0} } }
++#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, 0, 0, {0, 0} } }
+ 
+ 
+ /* Cleanup buffers */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index f9086c0855..e744260e87 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -66,6 +66,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
+           file://0026-PR25847-5.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


