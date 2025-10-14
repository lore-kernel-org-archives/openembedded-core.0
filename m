Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25EFCCD195
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.2585.1760481917023925570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dW/9g5UZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-791c287c10dso4985793b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481916; x=1761086716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9l+3Q7eG3L1nlRP5yN5OY2qk4dWecU9QlhI2Mj4y7T4=;
        b=dW/9g5UZ0qCuG2zin9UIxCXnpIybYVRVVklixZXJOMbi2EkQPfM4cAW8y+qVpw+aJo
         I1Svi3gXUf6CGKgExFfvHbLrNDNtO/9e84nsVsJMWer/fsNOp67TE2nyEIBg+CShuemJ
         GOllF4btGCsoY7wQfWTCLXybIYWQI2KEls76QsKqCcpychWxBCdRJrhZb0asbqEcHbwY
         pjQCBKdLsZxFTabD3P5+S7X2YXL9Ick1q4z+jr3VObfwpKkpGQRaB50HDF/W3VXlvNQt
         YduaeXb4bYkCDbQUGt0NZnDw3mkMWCrmrbjL99dvt0GUxCukTWw3DekqjsdNYbrdR1KO
         zNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481916; x=1761086716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9l+3Q7eG3L1nlRP5yN5OY2qk4dWecU9QlhI2Mj4y7T4=;
        b=UHP4fOVcgOf6hvGyumU8N4Af5x8dfsTiqmNd1sB3Be5TiO12QojvCxIc8v023rwkhX
         Ks2CVKGorYg2PS473aW3A4k/Fbc6U7X16BMmBHNQb0ZDvEHCpnorsaHT+wwHXEI6D8uA
         8JX5SAbdFfDJ+wnm/HmvmeRU+Ap3aOGC24C0F61Oj5pYhrHNVRVhtyNyG0DXRV1dTedj
         yxY4hSqhKJg3pYVR2SmjjTtEIUTCsW/CD4fj4Ra8NPKI6SqxCeOlRkFoEUf/2zx7SYTZ
         VL48md0zPadlvrZUZ9yHZYYREDFfc+muwjLDXubngSe4Sqno4wxV8I+FO2fGUsTX/9HX
         hRfA==
X-Gm-Message-State: AOJu0Yy+FLYs7KebEPNU4SyKzs5W/Jdt2jJ5sh013LXRoMYfGMSLAJi7
	mFi8PdHRGLj89QCd2iWnjfsrKmUV07qbKzJW7tRVALjhLYWefPQ0MZ0QVPuQEH7lu3ZDbuF9IXz
	nUGI6
X-Gm-Gg: ASbGncvOeMUQ+dbHsZKJkIgWJkwI0KoATcHBamOQeRPHcwQOPNK5Fa1ZvUHJOukwK1u
	/SRzPJyxs4sG7A5hQZLkl9vtF1IjImrl/z9vVnpMHNBsmtfG5WFpjF/THPkcqqy5jiXFEMLw1Ic
	o9JJ1sPvggHuggvhcnLuSle1moQDdJWM6/RrsT7AJYjvYELR1ryL9vg4dfAJy4eJybqt7+01Kz8
	OcXIP91XE8ghfNijrmJe8vyVnjqvgzDyPKEY9zd16L72gbQM6mTA14KLZFQGKPbfQCbAIsHCgwO
	kaCtYybGGv0SQOlVz4nHxDugWPSNOI1H3F8H/i750lmWpuKjaXlF0q6442jon/jN+qh3GWMKjBE
	YOJpxU1zdVCu4LNUg+OvgRqw7sBVoM5YwBmx9jSmOPWA=
X-Google-Smtp-Source: AGHT+IEMcvCD0BNuai7mT9c2RPZ2caleHJGuQBixwEWFVl8ZjLwqbl0TQhZ9xseQvG0eSNFD9ljtaw==
X-Received: by 2002:a17:902:f651:b0:24b:1589:5054 with SMTP id d9443c01a7336-2902723c4acmr325737015ad.23.1760481916107;
        Tue, 14 Oct 2025 15:45:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/14] glibc: nptl rename __condvar_quiesce_and_switch_g1
Date: Tue, 14 Oct 2025 15:44:49 -0700
Message-ID: <0a9ccd040037c12aa2e7fbc2213ca60b30dafcc4.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224866

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=4b79e27a5073c02f6bff9aa8f4791230a0ab1867
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002281.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-8.patch          | 161 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 162 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-8.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
new file mode 100644
index 0000000000..83d9ca01a9
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-8.patch
@@ -0,0 +1,161 @@
+From 20d84dfa0b9a32f88259269bbeaae588744ae4ae Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:33:50 -0700
+Subject: [PATCH] nptl: rename __condvar_quiesce_and_switch_g1
+
+This function no longer waits for threads to leave g1, so rename it to
+__condvar_switch_g1
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 4b79e27a5073c02f6bff9aa8f4791230a0ab1867
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002281.html]
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
+index 5ae141ac..a0743558 100644
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
+index f976a533..3baac4da 100644
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
+index 14800ba0..a9bc10dc 100644
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
+index adf26a80..40a74342 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -354,8 +354,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -387,9 +386,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
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
index 7ef2c8cb4c..265dcb9129 100644
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


