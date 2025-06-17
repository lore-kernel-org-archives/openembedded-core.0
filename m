Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBD2C71157
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:25 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.31282.1750195278088123620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SYRDLHlz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b3182c6d03bso4809279a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195277; x=1750800077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AU695REQAYVC5NLmzHcU6sGZI/04E7EdmnZFU7mivaM=;
        b=SYRDLHlzQlxAgQ0E6+itBh6OhTYzg47dpkOFZSORAvBYLY2w4svPUabtooGCZmrg4z
         t6MQaFT/ccYNrn3vbhYov5ukVh+BvfPMSBiip91zEZa6ofcOgMLZb/Wn/c7CNvvJk3X4
         +ZowOd3zWz2M42sTxDzQ2+svak/AzmyLEevqcWG5lI7NdngZL0VOaJ7IAvQj7jIpIn8u
         PFohZYAqKonglnneGkpkex4nhva2AFzBya/f4fcRgeI36RmXE6LzjSQ2f0bXYKd5zxtp
         FmAl2WzRjVif9K4I1gsxaXXJUeFxLagzG5pFK3cBMKCyOuvaBt07xJytqFEeN/x5tQvG
         xJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195277; x=1750800077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AU695REQAYVC5NLmzHcU6sGZI/04E7EdmnZFU7mivaM=;
        b=WZ2lwmgyHE7ujJ0tND9s6naOnXO7PoMKoqyeb5Et4bNmHvZIy7B0EcDn/mJEfRZAfw
         6xBepmdqEeOqqMB+mwwpIswSxzmWp8uo1eJkd7YmoOrSS0oQRLNlc/wz3WQaHfmUoZ5l
         aA1MNUwqXz6cq7nOT7pVyXmgak6sMEUDxp20Czr3dKF9dS3gYRcCdLWqsXRVEu1SynLB
         bPJMDJ4Fyhva7F4LX/m/b87GvcLbwlViLw+nAdXM3vM9LFSZOZ7XONXklHyXofqAvg4r
         yobV1RlzFfCLxmmyDTnY7+abdb48RwOeaORoXsgaGH6lbtzh3CYRnFiukOkw1vDm/cke
         nD1A==
X-Gm-Message-State: AOJu0YwJfeWuA4GgFYsLPDlEbwDGQi+3ddsHjOQqBjyaBnu23ng5tSQ4
	D0IiM0DDMjEHrla8BzpGMNf3EPj0H5xx+nKdlvkUh9/5+sKUHZv693c/SD8rPGkBifqg9L/zT1h
	0K+Hl
X-Gm-Gg: ASbGncsxfQLjaMcLg41fnKzXUUyClCoO4x52ijjw46ZLlEy2WCNwWMAaucIANp+3pN2
	Rq4nHcsHbi5aSp/HT9QjeKZ2sClC78/u39AVWMvcPkjvAlqtqK4fu9kGF9aQtc8oJc4RDdDdDxK
	pqTLC7K2nWYT9Ndmb8FiwdXrjojRBdlVFYd+wEko7cllxtA2GzUi/sJpgoW5bW2D8OQ2tnRIgE0
	H4hy/UjIsfsXIpDdNdJMSq21MPO6seHOAb0mPHDYUCLEyPYFh8WXf4gbMJPIBesgdKHhjVy2zlk
	i+Jp36QRtgl9pRhpxgVFg8aXfhFzfaI1Zol/DGx8vv2JDWxJJBWkZw==
X-Google-Smtp-Source: AGHT+IGDrwwbtNvsz6YGULnv0HT5OtkUfl+wSEbtOVRan2Dy/6G4Ip1IJvU/4WBrtKRL85c/PvZbjA==
X-Received: by 2002:a05:6a20:6a20:b0:218:c51:4d75 with SMTP id adf61e73a8af0-21fbd5568c1mr24963908637.24.1750195277082;
        Tue, 17 Jun 2025 14:21:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 27/27] glibc: nptl Use all of g1_start and g_signals
Date: Tue, 17 Jun 2025 14:20:24 -0700
Message-ID: <e0857503de9f427d177fe85c32cf0d2748d779fb.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218944

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-8.patch          | 192 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 193 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
new file mode 100644
index 0000000000..8ea0c784ef
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
@@ -0,0 +1,192 @@
+From fc074de88796eb2036fbe9bade638e00adfd5cb2 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 02:08:36 -0700
+Subject: [PATCH] nptl: Use all of g1_start and g_signals
+
+The LSB of g_signals was unused. The LSB of g1_start was used to indicate
+which group is G2. This was used to always go to sleep in pthread_cond_wait
+if a waiter is in G2. A comment earlier in the file says that this is not
+correct to do:
+
+ "Waiters cannot determine whether they are currently in G2 or G1 -- but they
+  do not have to because all they are interested in is whether there are
+  available signals"
+
+I either would have had to update the comment, or get rid of the check. I
+chose to get rid of the check. In fact I don't quite know why it was there.
+There will never be available signals for group G2, so we didn't need the
+special case. Even if there were, this would just be a spurious wake. This
+might have caught some cases where the count has wrapped around, but it
+wouldn't reliably do that, (and even if it did, why would you want to force a
+sleep in that case?) and we don't support that many concurrent waiters
+anyway. Getting rid of it allows us to use one more bit, making us more
+robust to wraparound.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=91bb902f58264a2fd50fbce8f39a9a290dd23706]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++----------------
+ nptl/pthread_cond_signal.c    |  2 +-
+ nptl/pthread_cond_wait.c      | 14 +++++---------
+ 4 files changed, 18 insertions(+), 28 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index a07435589a..ef0943cdc5 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -57,7 +57,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Add as many signals as the remaining size of the group.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+ 
+       /* We need to wake G1 waiters before we switch G1 below.  */
+@@ -73,7 +73,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 3baac4dabc..e48f914321 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -208,9 +208,9 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      behavior.
+      Note that this works correctly for a zero-initialized condvar too.  */
+   unsigned int old_orig_size = __condvar_get_orig_size (cond);
+-  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
+-  if (((unsigned) (wseq - old_g1_start - old_orig_size)
+-	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
++  uint64_t new_g1_start = old_g1_start + old_orig_size;
++  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+   /* We have to consider the following kinds of waiters:
+@@ -221,16 +221,10 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which closes this group.  The value we add will never
+-     be negative because old_orig_size can only be zero when we switch groups
+-     the first time after a condvar was initialized, in which case G1 will be
+-     at index 1 and we will add a value of 1. Relaxed MO is fine because the
+-     change comes with no additional constraints that others would have to
+-     observe.  */
+-  __condvar_add_g1_start_relaxed (cond,
+-      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+-
+-  unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
++  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
++     the change comes with no additional constraints that others would have
++     to observe.  */
++  __condvar_add_g1_start_relaxed (cond, old_orig_size);
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -242,13 +236,13 @@ __condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
+-  /* Now advance the new G1 g_signals to the new lowseq, giving it
++  /* Now advance the new G1 g_signals to the new g1_start, giving it
+      an effective signal count of 0 to start.  */
+-  atomic_store_release (cond->__data.__g_signals + g1, lowseq);
++  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
+ 
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+-  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  unsigned int orig_size = wseq - new_g1_start;
+   __condvar_set_orig_size (cond, orig_size);
+   /* Use and addition to not loose track of cancellations in what was
+      previously G2.  */
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index a9bc10dcca..07427369aa 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -80,7 +80,7 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+          release-MO store when initializing a group in __condvar_switch_g1
+          because we use an atomic read-modify-write and thus extend that
+          store's release sequence.  */
+-      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index bb46f3605d..430cbe8a35 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+      not hold a reference on the group.  */
+   __condvar_acquire_lock (cond, private);
+ 
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+   if (g1_start > seq)
+     {
+       /* Our group is closed, so someone provided enough signals for it.
+@@ -278,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
+      * Waiters fetch-add while having acquire the mutex associated with the
+        condvar.  Signalers load it and fetch-xor it concurrently.
+    __g1_start: Starting position of G1 (inclusive)
+-     * LSB is index of current G2.
+      * Modified by signalers while having acquired the condvar-internal lock
+        and observed concurrently by waiters.
+    __g1_orig_size: Initial size of G1
+@@ -299,11 +298,9 @@ __condvar_cleanup_waiting (void *arg)
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+    __g_signals: The number of signals that can still be consumed, relative to
+-     the current g1_start.  (i.e. bits 31 to 1 of __g_signals are bits
+-     31 to 1 of g1_start with the signal count added)
++     the current g1_start.  (i.e. g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is currently reserved and 0.
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -418,9 +415,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-      if (seq < (g1_start >> 1))
++      if (seq < g1_start)
+         {
+           /* If the group is closed already,
+              then this waiter originally had enough extra signals to
+@@ -433,13 +429,13 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+          by now, perhaps in the process of switching back to an older
+          G2, but in either case we're allowed to consume the available
+          signal and should not block anymore.  */
+-      if ((int)(signals - lowseq) >= 2)
++      if ((int)(signals - (unsigned int)g1_start) > 0)
+         {
+          /* Try to grab a signal.  See above for MO.  (if we do another loop
+             iteration we need to see the correct value of g1_start)  */
+            if (atomic_compare_exchange_weak_acquire (
+                        cond->__data.__g_signals + g,
+-                       &signals, signals - 2))
++                       &signals, signals - 1))
+ 	      break;
+ 	   else
+ 	      continue;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index af122f00fb..3023e9c1ed 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -69,6 +69,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
            file://0026-PR25847-7.patch \
+           file://0026-PR25847-8.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


