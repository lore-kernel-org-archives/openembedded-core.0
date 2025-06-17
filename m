Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DA6C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:25 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.31439.1750195276569450290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j3DyBrGC;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so5070444a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195276; x=1750800076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jETi5rplYRmxTDWSiK8F3DabK0IwNd1381dc/j9zDuM=;
        b=j3DyBrGC0fsQRgHrt0KMI47MwnMFUeogr90lhoeiRT4cUuoO1elNo6jFMPpD0oahL5
         ckVuMjlj6U3aqKi3Dhx5cIy+fhJq7WZP1393jlYxkkZAAD1bRJBqHZx+cvO/TS2Ob6KA
         1gkS1DAH9YTMhbH6Audbx755XSoFBdx3+kNVxwYbvaeJtA+XrpqZTjKAjD6I+qAmA3UL
         KKDegPFd3YaHiUU44L8MyxdP0i8NdW0IdTBA7vvsLBRlfHXE5InkBMPLSCiW8SwZJQWy
         bztfintn90bezCH7UF8Gy0V9cxk2J7Lh9UtTTRUBVCO5KIbHB2DHFrbahuLKlhgG9ZI5
         dnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195276; x=1750800076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jETi5rplYRmxTDWSiK8F3DabK0IwNd1381dc/j9zDuM=;
        b=rpP+RuNfjvwgyTKkXbYonZWHc7Na3Gk3v6Tl3aBeh51xhSPmi+mttSKYIXcm/lX7lr
         xvb1aVLqOv0oJA7H6ildrFe7hffMTr9nWSEyOFc3DLStrSeOCSLNVw0RTzJfFyTS26GS
         4PE6Z3glNCmVYaw/wPwUAJwwuchA4afh4Z74SQXvGIDMSqEXCSn0Vt1KqaPZKBm8KVLB
         dgW8fHsEwq6KcZKy4LC8cJc+WrHF8pVPR65hBg6lLKa7R2NuwsECh/1jjCiReuVPjdVV
         FFyBQ9z0vgmNPzd783LTYxqcuHgcolZxY4qH6aDS9NW6yPWChlwKHc+EXwlUS/qj2dbb
         sWBQ==
X-Gm-Message-State: AOJu0YzpIQXfP55SeAdZyPjJY/KOCYGNPOd0Ggj1O7VL5z95bRQPGw+z
	UUZ/4CPbhUy7iRbl9JIB12i54HcGM+IJ0yBcGZxMNvbH3wAoMsR2cVP/oaqZ55sPUteD7iRKZEx
	6RCau
X-Gm-Gg: ASbGncufMsYU0DeM8Oas5dNhSbUocSK1Sq48ttSFCOTMHj5uBa82041OtQYK6BsMA2n
	xBkhMmHBEQe4z8tFKuUDXZwnkpam0EGMQOjeBM702LiE0MYl22UjciUwz1jKhwNFzmLVe46W76P
	UhOfZ1y19qfcYCS76qfPdQW8HGNQYsEKV9lfz17LxwYTm2vTXSgcQ5HFA6iDBKk/LPFWhb0gImV
	22MmxIlhV7t8ZWTrOk7ZffGs6YGut7wMyhsZPL8HIRxd1IwMSGBZsJdP11xstSbvAUkYEuNOTQI
	HbtcztPsiS+tbSBAOA/K28pn6FboYO7BYf2NKTQVM9CBrZHs5P4ASg==
X-Google-Smtp-Source: AGHT+IEFAUjLqTsV/AD3wcDyhTfxwvKWQSDo71J7gAtnyhhadrYNixLyd9stLwmIl1u2CE78IPIhCQ==
X-Received: by 2002:a05:6a20:6f08:b0:21f:543f:f124 with SMTP id adf61e73a8af0-21fbd5f1ecamr25624547637.24.1750195275545;
        Tue, 17 Jun 2025 14:21:15 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 26/27] glibc: nptl rename __condvar_quiesce_and_switch_g1
Date: Tue, 17 Jun 2025 14:20:23 -0700
Message-ID: <e7eb16d59c81636c1fdffca307768776d990d732.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218943

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-7.patch          | 160 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
new file mode 100644
index 0000000000..a9e9cc7c48
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
@@ -0,0 +1,160 @@
+From 2a601ac9041e2ca645acad2c174b1c545cfceafe Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 01:53:25 -0700
+Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
+
+This function no longer waits for threads to leave g1, so rename it to
+__condvar_switch_g1
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |  4 ++--
+ nptl/pthread_cond_common.c    | 26 ++++++++++++--------------
+ nptl/pthread_cond_signal.c    | 17 ++++++++---------
+ nptl/pthread_cond_wait.c      |  9 ++++-----
+ 4 files changed, 26 insertions(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 5ae141ac81..a07435589a 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -60,7 +60,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 				cond->__data.__g_size[g1] << 1);
+       cond->__data.__g_size[g1] = 0;
+ 
+-      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* We need to wake G1 waiters before we switch G1 below.  */
+       /* TODO Only set it if there are indeed futex waiters.  We could
+ 	 also try to move this out of the critical section in cases when
+ 	 G2 is empty (and we don't need to quiesce).  */
+@@ -69,7 +69,7 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 
+   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
+      which case we can stop.  */
+-  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++  if (__condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index f976a533a1..3baac4dabc 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -189,16 +189,15 @@ __condvar_get_private (int flags)
+     return FUTEX_SHARED;
+ }
+ 
+-/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
+-   leave G1, converts G1 into a fresh G2, and then switches group roles so that
+-   the former G2 becomes the new G1 ending at the current __wseq value when we
+-   eventually make the switch (WSEQ is just an observation of __wseq by the
+-   signaler).
++/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
++   and then switches group roles so that the former G2 becomes the new G1
++   ending at the current __wseq value when we eventually make the switch
++   (WSEQ is just an observation of __wseq by the signaler).
+    If G2 is empty, it will not switch groups because then it would create an
+    empty G1 which would require switching groups again on the next signal.
+    Returns false iff groups were not switched because G2 was empty.  */
+ static bool __attribute__ ((unused))
+-__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+   unsigned int g1 = *g1index;
+@@ -214,8 +213,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 	  + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+-  /* Now try to close and quiesce G1.  We have to consider the following kinds
+-     of waiters:
++  /* We have to consider the following kinds of waiters:
+      * Waiters from less recent groups than G1 are not affected because
+        nothing will change for them apart from __g1_start getting larger.
+      * New waiters arriving concurrently with the group switching will all go
+@@ -223,12 +221,12 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+        are not affected.
+      * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Update __g1_start, which finishes closing this group.  The value we add
+-     will never be negative because old_orig_size can only be zero when we
+-     switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.
+-     Relaxed MO is fine because the change comes with no additional
+-     constraints that others would have to observe.  */
++  /* Update __g1_start, which closes this group.  The value we add will never
++     be negative because old_orig_size can only be zero when we switch groups
++     the first time after a condvar was initialized, in which case G1 will be
++     at index 1 and we will add a value of 1. Relaxed MO is fine because the
++     change comes with no additional constraints that others would have to
++     observe.  */
+   __condvar_add_g1_start_relaxed (cond,
+       (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+ 
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index 14800ba00b..a9bc10dcca 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -69,18 +69,17 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+   bool do_futex_wake = false;
+ 
+   /* If G1 is still receiving signals, we put the signal there.  If not, we
+-     check if G2 has waiters, and if so, quiesce and switch G1 to the former
+-     G2; if this results in a new G1 with waiters (G2 might have cancellations
+-     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
+-     new G1.  */
++     check if G2 has waiters, and if so, switch G1 to the former G2; if this
++     results in a new G1 with waiters (G2 might have cancellations already,
++     see __condvar_switch_g1), we put the signal in the new G1. */
+   if ((cond->__data.__g_size[g1] != 0)
+-      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++      || __condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Add a signal.  Relaxed MO is fine because signaling does not need to
+-	 establish a happens-before relation (see above).  We do not mask the
+-	 release-MO store when initializing a group in
+-	 __condvar_quiesce_and_switch_g1 because we use an atomic
+-	 read-modify-write and thus extend that store's release sequence.  */
++         establish a happens-before relation (see above).  We do not mask the
++         release-MO store when initializing a group in __condvar_switch_g1
++         because we use an atomic read-modify-write and thus extend that
++         store's release sequence.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 104ebd48ca..bb46f3605d 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -382,8 +382,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -414,9 +413,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       /* Now wait until a signal is available in our group or it is closed.
+          Acquire MO so that if we observe (signals == lowseq) after group
+-         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-         store and will see the prior update of __g1_start done while switching
+-         groups too.  */
++         switching in __condvar_switch_g1, we synchronize with that store and
++         will see the prior update of __g1_start done while switching groups
++         too.  */
+       unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+       uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+       unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index d3c0cbd703..af122f00fb 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -68,6 +68,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
            file://0026-PR25847-6.patch \
+           file://0026-PR25847-7.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


