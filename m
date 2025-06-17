Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA5FC761AE
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:15 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.31437.1750195274847721113
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OwpPAUuY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b2f603b0ef6so4597601a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195274; x=1750800074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQ4C/tkDQao32UMPO5rgOvjp/qNsjyrn2Vi2Mq0mVhY=;
        b=OwpPAUuY1S5Sk6CbJlX7+L/2/mps6K4Sq6UuvOsanUTl/ka5OzFQDi4QUVsXukKeE5
         sJsbkSloMQkiq2YnqiQPvsewsftNZKP8rcxjZ8ePYmVthBy+xHoD+APTMukz5kvN3ajf
         hOYgESs90xMUComyjQ2UFgWJkn+cQcBdSOJ0xR2xHAhrHYKWf6IqPl3cOjS21DSHUeOC
         lUm1F5svE4caEvc6I/RmKwVaGB/n5r9VM+YhtJ8m2Lz3QZA8FOlSqAubMwdanswioYnp
         2cyqYIo15T3VxDwPcUFT47ACit9Xg84iMPhr4mJsaM7uBVlVx58upfmRSd+XMjaAyeBf
         8CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195274; x=1750800074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQ4C/tkDQao32UMPO5rgOvjp/qNsjyrn2Vi2Mq0mVhY=;
        b=QW+324oaZ8WVihqti6RWcr8fgdYsKzX0BWmsCu1nurZdEyh3yUUx8kvVHXSKZNB+xv
         GdCpzso44S9ExYB68p2Rxv8xdwSTQAIhG9eaKn8N2EZtGs8uAisCFpAQ7iPjWkVjzIhN
         NocS+rM405PM0zaj4Y+a5VJaKTW8YSIb06wbx3U288NugmsH8o86UqcOADwBJAnqNIEh
         Kl6d9swCYBeHYEeNL2cfosjGcJLYFVFEIqmFLTfV9ZMEDTnXD3+fUBJIqtO/X4chAU1R
         Y6/L/osvCrysbdc82raBKOqcNYh8wDqi9c7FHN4vrHN5SZujY6uSzJA56QU7K9hzdW2Q
         sASQ==
X-Gm-Message-State: AOJu0YylPjaXTfWxDy5AWJnc1RVm6sVn9T5kwhJbdsnga27shcGIjxut
	zvTVpvpCnwbSeVSdPqjUuVC7YsPMg70fcC/3Hwul17UvDXjcNvWHV1y983exkNrP3Y+V7OmpH2A
	QBXHJ
X-Gm-Gg: ASbGncs3psJVl0AhdORiNPXIO0Xqv22tOEgJVL4RJjKNHoIKKtJ8d1Pwd8Fmrs4jlxe
	5mIRQCY+bLcTM1A1w6HNq8pt/jh65cyFICPmRvRgoVpWrDGkXEP3WwOA5ACAOgQzvt8YJsNMg8x
	yZ3VKfZOc1oUySZBUtW5yvncTilBeo97ZTeGSKVvoTuoCyjdFpKHsCVv1njQrAO/QwZRSZM7tIP
	9smSV0Hsg1uLiGlYqaTBqV96jgD0lkri7X55XvGh3qMs2lZuoBE8sIxy0ZukagoFUGnNmkA+yVS
	ySn6CGQT1rPM7sMA5QO+830GizgdftdtB+B9/J8Q9GwRRxKI2Btgew==
X-Google-Smtp-Source: AGHT+IE271VMeZXXDJp8O4UW3eVLchrp38po9fri+qqHVC+yMOFoRRgN6UzJLbDfLCmO/OiaK/OtNg==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:4ecc:11a9 with SMTP id adf61e73a8af0-21fbd7b01ccmr21624302637.32.1750195273969;
        Tue, 17 Jun 2025 14:21:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/27] glibc: nptl Fix indentation
Date: Tue, 17 Jun 2025 14:20:22 -0700
Message-ID: <e4b4cd362cfcb7fd6517165ae59cb218420b9039.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218942

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-6.patch          | 169 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
new file mode 100644
index 0000000000..cf87e21ddd
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
@@ -0,0 +1,169 @@
+From a2faee6d0dac6e5232255da9afda4d9ed6cfb6e5 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 17 Jun 2025 01:37:12 -0700
+Subject: [PATCH] nptl: Fix indentation
+
+In my previous change I turned a nested loop into a simple loop. I'm doing
+the resulting indentation changes in a separate commit to make the diff on
+the previous commit easier to review.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 132 ++++++++++++++++-----------------------
+ 1 file changed, 54 insertions(+), 78 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 5c86880105..104ebd48ca 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,87 +410,63 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-
+-      while (1)
+-	{
+-	  /* Now wait until a signal is available in our group or it is closed.
+-	     Acquire MO so that if we observe (signals == lowseq) after group
+-	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-	     store and will see the prior update of __g1_start done while switching
+-	     groups too.  */
+-	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* If the group is closed already,
+-	         then this waiter originally had enough extra signals to
+-	         consume, up until the time its group was closed.  */
+-	       break;
+-	    }
+-
+-	  /* If there is an available signal, don't block.
+-	     If __g1_start has advanced at all, then we must be in G1
+-	     by now, perhaps in the process of switching back to an older
+-	     G2, but in either case we're allowed to consume the available
+-	     signal and should not block anymore.  */
+-	  if ((int)(signals - lowseq) >= 2)
+-           {
+-             /* Try to grab a signal.  See above for MO.  (if we do another loop
+-                iteration we need to see the correct value of g1_start)  */
+-                     if (atomic_compare_exchange_weak_acquire (
+-                               cond->__data.__g_signals + g,
++  while (1)
++    {
++      /* Now wait until a signal is available in our group or it is closed.
++         Acquire MO so that if we observe (signals == lowseq) after group
++         switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++         store and will see the prior update of __g1_start done while switching
++         groups too.  */
++      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
++      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++      unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++
++      if (seq < (g1_start >> 1))
++        {
++          /* If the group is closed already,
++             then this waiter originally had enough extra signals to
++             consume, up until the time its group was closed.  */
++           break;
++        }
++
++      /* If there is an available signal, don't block.
++         If __g1_start has advanced at all, then we must be in G1
++         by now, perhaps in the process of switching back to an older
++         G2, but in either case we're allowed to consume the available
++         signal and should not block anymore.  */
++      if ((int)(signals - lowseq) >= 2)
++        {
++         /* Try to grab a signal.  See above for MO.  (if we do another loop
++            iteration we need to see the correct value of g1_start)  */
++           if (atomic_compare_exchange_weak_acquire (
++                       cond->__data.__g_signals + g,
+                        &signals, signals - 2))
+-                       break;
+-                     else
+-                       continue;
+-           }
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
+-	  // Now block.
+-	  struct _pthread_cleanup_buffer buffer;
+-	  struct _condvar_cleanup_buffer cbuffer;
+-	  cbuffer.wseq = wseq;
+-	  cbuffer.cond = cond;
+-	  cbuffer.mutex = mutex;
+-	  cbuffer.private = private;
+-	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+-
+-	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, signals, clockid, abstime, private);
+-
+-	  __pthread_cleanup_pop (&buffer, 0);
+-
+-	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+-	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+ 	      break;
+-	    }
+-	  else
+-	    __condvar_dec_grefs (cond, g, private);
+-
++	   else
++	      continue;
+ 	}
++      // Now block.
++      struct _pthread_cleanup_buffer buffer;
++      struct _condvar_cleanup_buffer cbuffer;
++      cbuffer.wseq = wseq;
++      cbuffer.cond = cond;
++      cbuffer.mutex = mutex;
++      cbuffer.private = private;
++      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++      err = __futex_abstimed_wait_cancelable64 (
++        cond->__data.__g_signals + g, signals, clockid, abstime, private);
++
++      __pthread_cleanup_pop (&buffer, 0);
++
++      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
++        {
++          /* If we timed out, we effectively cancel waiting.  */
++          __condvar_cancel_waiting (cond, seq, g, private);
++          result = err;
++          break;
++        }
++    }
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 04dcb22c3d..d3c0cbd703 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -67,6 +67,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-3.patch \
            file://0026-PR25847-4.patch \
            file://0026-PR25847-5.patch \
+           file://0026-PR25847-6.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


