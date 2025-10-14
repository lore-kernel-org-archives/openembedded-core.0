Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9739FCCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.2516.1760481907956994138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=t+JD1gBP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b679450ecb6so3181820a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481907; x=1761086707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTn+1TAubpA/0VMcd+9uMUhVDl7wkhf58OS5EPzyWzk=;
        b=t+JD1gBPCQAfrale/9D9p171PvUyxuG/obGiy9OvKsVjVq6H6wGdkyUkKiC9n7DZVE
         T25HOvARlhFgQzPD6YkZmZsrbdArnT9px+LUJSYeO+A415O0ksSum8DV/sizWrTtqye5
         wFnE1O2MVIRrpyizCoQ89nE80+KgBui0skGxqAZez9Dmq7HyxtksDy/2+gepI0RXA/nh
         iRqGYcwIppstDVMu78bmFgBywbpL+1pxkvUTf5n8YCd5g0vvOjdGG0kZUuENILpphX38
         TBXaYJcVzaXKexUkJqepAms/ZfM+dgOlZ3yHbnO8UsXcvr51RzOZrSD5bX1pBvuuWWOb
         wt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481907; x=1761086707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTn+1TAubpA/0VMcd+9uMUhVDl7wkhf58OS5EPzyWzk=;
        b=hCpL9Psp/1M1WgBCH8axWJR0uHZqJqp2szNvHxUsZKIoWe4TKCduRIoRokgwv5rfpg
         UnCer3jO9d/wYoyYzGUyqAPqubWZRrtCjqsMKfIcFNT+y0uglqtcYIh1oIa/KJ5JyWZ1
         rE1YHkWjD+n7mgkaSi1c6CbqCeKbqrZalNWCVjiTc3m9YxpHLk/1khAzcc1rL+GAffij
         LaMJSEFKOQeSWRvWypOzqbtZm0VZXQpGPxqjSoA7e8cnxIwShQhLARRF11g1VltHssUk
         Ekx8NDYfuTg+0lefl5f/3zwh5mCEUMzj3cSljYBOyRQekMuYHlDcB1FV46tUA3daQ4Nr
         VkNA==
X-Gm-Message-State: AOJu0Yy8sQd8A7+r3lmkD04mOX2AkgGOtP995tE4qeYBoR3bhPWcorHc
	Aj06b4uQLgr5zQVxcMKDPf2dNIO0LUezEL7snt+zhFzHiLCF9mMjDr2AoeNob2yzsY2wIJuniie
	NuPMo
X-Gm-Gg: ASbGncvM3Sp6iom354ZQjjSzKX6bPxWWlhPhcTc1A/6lURwsy5L8MWegrzmK6ZK3NL5
	U0TwbwGIX9g6o+uXTknQfc57E9FHpiWYJMUQhSjePPVAAT+LeFC85yF6Dz5EOTHrLH2KHwhsnRI
	qwS3/2TDsgDUkywKlTt1AnaA3ML9OlvPhcXWhj6Uc++9MkE9mDVUhKepQCsJY3z/8HQsV3efhRF
	9wi6U1BGs6ILOVVf4uHjkpJIYLREbOnkhetMpCmSLGr0s9H0cSFm3atbWc3vMDbYPzHdOCJ+XGq
	wCQz7WXw5BfT4PC0CHST8FLVCBRgZi/RTEMmdBnQf96kWdmPPGZAOvqriNhGni6XdtvfM+ObvUI
	OVAGvS94Xe+/mhJ7E2LzhnmNfTljTL/SzUGXVXEjTgnA=
X-Google-Smtp-Source: AGHT+IH9yDHkrZyov68bEnBpez3tN9XBgpFCFdrM3byvUExikVJQ/egZZG6laWTp1nV2R1W7WWDMrg==
X-Received: by 2002:a17:903:2c03:b0:24c:d6c6:c656 with SMTP id d9443c01a7336-290272135a1mr275888705ad.4.1760481907069;
        Tue, 14 Oct 2025 15:45:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/14] glibc: nptl Update comments and indentation for new condvar implementation
Date: Tue, 14 Oct 2025 15:44:43 -0700
Message-ID: <bf3d91124c2584b9d3000098d1f81d9459d143fc.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224860

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=0cc973160c23bb67f895bc887dd6942d29f8fee3
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002275.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-2.patch          | 145 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
new file mode 100644
index 0000000000..a9ed702170
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
@@ -0,0 +1,145 @@
+From 306ea7810f5f6709ef3942a7be75077203b5d201 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 04:27:19 -0700
+Subject: [PATCH] nptl: Update comments and indentation for new condvar
+ implementation
+
+Some comments were wrong after the most recent commit. This fixes that.
+Also fixing indentation where it was using spaces instead of tabs.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 0cc973160c23bb67f895bc887dd6942d29f8fee3
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002275.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c |  5 +++--
+ nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
+ 2 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index a55eee3e..350a16fa 100644
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
+index 1cb3dbf7..cee19687 100644
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
index 15179899d4..732cb96f94 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
+           file://0026-PR25847-2.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


