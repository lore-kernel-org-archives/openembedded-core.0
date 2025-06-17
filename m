Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A4C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:15 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.31277.1750195268186693155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qKgvpCN9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74264d1832eso6992382b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195267; x=1750800067; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wMvKI6kMyV6+EA4PGyXk6+dibmC6LP6nAZI8ZBHyFYs=;
        b=qKgvpCN9A2yh6/azVEg+5/K956XI+r1IpXioY4MJv6Zcc7/bIsqIQgxFDVtnHyqLYU
         MT4LMfDPYXQScwAWwj6uGJFHnaKtznE8dMgj10kNEkrG9FN9vVzwxq51K1pxHjoq9+QJ
         Dp/57wE4agJ2Xeb7GbFQMgMwLkZwJS08R103atGJLjnaF2Xj6mHP6z7nAb3xrvx3cPQt
         yNj8GUS5kfPMCbxwFnu8E5Ih4lnycLobHQp509iS43Q2sJLMCgUz0RbzKbo6hjBz7Erc
         7zCdjtWzZjS9l/CMVrJ9KjMakc+FYBJVVnpUCRrlwJd148C6aVrC3Tg8NIu2tPDxnZYV
         RPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195267; x=1750800067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wMvKI6kMyV6+EA4PGyXk6+dibmC6LP6nAZI8ZBHyFYs=;
        b=QkSp8mu4F9KUQGzgIAqxYwVOGDx/StuLWihm4jMMnhk95chyKKRLLQ3iXWykMswWvf
         lkzmZZBzgWPa4RFxfT5argOE7qtnA+E63VHK6yJTovwa0FqKUUbNb3FuTdmVe9F4bH7Q
         f6v9wrfLt9emjKWmU9TfZ2MrFuLXk78y+E5vMQzFVR18wzVu2m6By9EKrV0G6xIJc4WL
         s3iVJcDiFcC8sl0VKQxcQCV63NmSgn2FoBiHQSiYXhiW/ERRYQKajMDuKIvrux4Vr3Dm
         dRXHCIx40Or2zL9A6/ZQVEMe+9IKIOVfNXj3nEd67mZT56izZhu7ElsI0OsVmEx53P6/
         xLCg==
X-Gm-Message-State: AOJu0YwRDCdv/GyxalbPSoNFqMWcLzNule4ILXhSuc7i5KfyWcI3tqw7
	kyRVECPHlh3Qk1PGUT6PacElqBEQAqYcdpzJ/mElz7NaVIPvCT0bDqvE34O7yxYdyKZzNFSskMT
	oYoCI
X-Gm-Gg: ASbGncsPoYarcsvaBlVXhQopZcbckWLIb+1wqtQZX9Xee4V1T8Mn8nrqAdxrB02ML36
	09Ek/fJKf4THj4hMklC5h9cKl0ouJZh4KP5MS8Kx99RQQfClS/loi55mUe4CKrOigrLD2mLzYDL
	8qdax7iG4r2SUAhRdjBMSGZvu89q1fICnXZi33xoxbPbupKWetDRv5NnCD7OlOFLNpt/g9/hpr0
	iqQUQdFtfTM63eoN8tVUBSRPHVQQfXHsI1x3XodLrBkEWlHXQ2vl8rbF5WCJXxm8TfbbCyPMp7o
	1Trv8D8u4nCXOhTivtib5azoq4OEizWS1SOXn+fd0KIJkC7mAUSfRQ==
X-Google-Smtp-Source: AGHT+IFqPgaTjwL1AwBzWnPx41tYnZtlgIaOmwd7E7dYeEJadd/ICdZERAjO9/j4kSLERVhu3d6D/g==
X-Received: by 2002:a05:6a00:8ca:b0:740:5927:bb8b with SMTP id d2e1a72fcca58-7489ccdeea2mr19754441b3a.0.1750195267201;
        Tue, 17 Jun 2025 14:21:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/27] glibc: nptl Update comments and indentation for new condvar implementation
Date: Tue, 17 Jun 2025 14:20:18 -0700
Message-ID: <e5296415e97e4d704c4c8d11ad243061a1e14997.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218938

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-2.patch          | 144 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 145 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
new file mode 100644
index 0000000000..cb89431769
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
@@ -0,0 +1,144 @@
+From 6aab1191e35a3da66e8c49d95178a9d77c119a1f Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:17:53 -0700
+Subject: [PATCH] nptl: Update comments and indentation for new condvar
+ implementation
+
+Some comments were wrong after the most recent commit. This fixes that.
+Also fixing indentation where it was using spaces instead of tabs.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c |  5 +++--
+ nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
+ 2 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 8dd7037923..306a207dd6 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by the advancing of
+-       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++     * Waiters in G1 have already received a signal and been woken. If they
++       haven't woken yet, they will be closed out immediately by the advancing
++       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+        which will prevent waiters from blocking using a futex on
+        __g_signals since it provides enough signals for all possible
+        remaining waiters.  As a result, they can each consume a signal
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 1cb3dbf7b0..cee1968756 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
+    figure out whether they are in a group that has already been completely
+    signaled (i.e., if the current G1 starts at a later position that the
+    waiter's position).  Waiters cannot determine whether they are currently
+-   in G2 or G1 -- but they do not have too because all they are interested in
++   in G2 or G1 -- but they do not have to because all they are interested in
+    is whether there are available signals, and they always start in G2 (whose
+    group slot they know because of the bit in the waiter sequence.  Signalers
+    will simply fill the right group until it is completely signaled and can
+@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+   /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe a value of zero written after group
++     Acquire MO so that if we observe (signals == lowseq) after group
+      switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+      store and will see the prior update of __g1_start done while switching
+      groups too.  */
+@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
+-          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-              g1_start = __condvar_load_g1_start_relaxed (cond);
+-              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	      g1_start = __condvar_load_g1_start_relaxed (cond);
++	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* If the group is closed already,
++	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+ 	       goto done;
+-            }
++	    }
+ 
+ 	  /* If there is an available signal, don't block.
+-             If __g1_start has advanced at all, then we must be in G1
++	     If __g1_start has advanced at all, then we must be in G1
+ 	     by now, perhaps in the process of switching back to an older
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-          g1_start = __condvar_load_g1_start_relaxed (cond);
+-          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  g1_start = __condvar_load_g1_start_relaxed (cond);
++	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* group is closed already, so don't block */
++	      /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      /* a signal showed up or G1/G2 switched after we grabbed the
++	         refcount */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      break;
+-            }
++	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+ 	 goto done;
+     }
+-  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+-     of __g1_start below (see spinning above for a similar case).  In
+-     particular, if we steal from a more recent group, we will also see a
+-     more recent __g1_start below.  */
++  /* Try to grab a signal.  See above for MO.  (if we do another loop
++     iteration we need to see the correct value of g1_start)  */
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index f15e031971..92c4dad023 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0025-CVE-2025-4802.patch \
            file://0026-PR25847-1.patch \
+           file://0026-PR25847-2.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


