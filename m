Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC07CCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.2582.1760481915478986504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Oh6NixA/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27ee41e0798so93652635ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481915; x=1761086715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IC16VDRqqB8ZnJEm7ff7M6z+FJmnTO5Wg6OYO7irJ+8=;
        b=Oh6NixA/scn0U3x+cRFly2MA26dQZa5zudrEN8Gty2Hm0Ft2k/MS9L+V7KQ7g1Doaf
         g064IZBN5Qh5TavIVSBsYyWCOm4aoPh2ut7PyPCHTBUKYrTveFZAaT46ys+9JiuHoxzs
         /kxciQILF1Lh1kU+8AbDic0y2KBq16IDITyS8zvRaFCPTQgLeEbR+7dHndp+Ef07GIoq
         IBVu8Rz7vezyG69uKI7y1cNgpjqtwuVrGIz0Ex+6KgqtquenKXcgY24mur4TB8xdPv0m
         WvtT5mnl+vTrJYwVXcCdasBfpDY6apxyeoWhhaQ3XQ2ZmrJ+eFCZI6LzY8ugTxG3zSPY
         wdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481915; x=1761086715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC16VDRqqB8ZnJEm7ff7M6z+FJmnTO5Wg6OYO7irJ+8=;
        b=S1/tPMX/cFm+Dy9A+xKSWJLo5/dZn5sb13CEZrpKFOstO37ekAqex4ph8TYYPCI1hY
         UOXhhBrF7/Q+6mPsOMEnWqO6fewoCEalz3GBe/TuyI41u+l7HI1QBrbFecZjtv0QfbuX
         JhTegr6Yoz2tjldXn68XfnIlowBC6jNbTrn5uEHyp10CBmBMth/9yWFpcwXyRnHbL40n
         Dl+oq+7wU206Ai4+5ItWEEQrkHJQ9IAmd45x6IZwYyljOOiXZziPtzBwLFNVaGpKZVwL
         uzKvmGIC3SGUSx/V6wuSG414JNvwpaITG/n8fAaPy419eGvQTZ8rduiQvLCQ5t0rLwOI
         eZIA==
X-Gm-Message-State: AOJu0YwpuskLwTJ5arQRrvvmxe7SYyvl480OsYNkQSpjuKCbLsUIPID6
	Jyv4nWqkOR4wgq/RbjamcpGE7IW6b5jTbENSqmPg6APLPKPk9B4BpqCDHfz+W7Jf6UTdC9OMWvC
	sHTEd
X-Gm-Gg: ASbGncuJVg7ayBO9DqshiXfbRbY9pDN9CZvm01t3MZ6tQ3fmAaWEw9az1FSUf8nE+O1
	8OuwXt0gKaXSfvCcSWh5oPUvCtAn1cWYwQVbmDNFIjhPS2+fm2liW5N4WPsJG1R/VnlyoRT6nSz
	8zRt67xj2ryS4bmGyMhexMApKUVom+Erv4I+T6OtPHsoijCMsVWaAOwiXgqwNqasI81CCbEF0S9
	tGvA76kWFEqOxzgNXLD8cZrd3MBp6COApF9aTq6c9fnmX5ejzPaV9PiXw2nRQfSflkbgcCEeO2a
	UlWkseDrDmfs8QQOeaOC36cj+a8DZwKxue8Uqoun3HV2aTykvD5m8QFRxoGGSJVeNyv7ncwADWK
	Md3UjTVEp7GBpwRWvI3iX+K/aCboYmO1z
X-Google-Smtp-Source: AGHT+IEK875H7DoBSg4CFcd/HILiUhFkvsQcvfVXfl/iOm2I4c4dOhRiwc5Ux+GZeZQZGnT7QJ9aiA==
X-Received: by 2002:a17:903:246:b0:24c:9309:5883 with SMTP id d9443c01a7336-290273ecb35mr341425395ad.28.1760481914563;
        Tue, 14 Oct 2025 15:45:14 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/14] glibc: nptl Fix indentation
Date: Tue, 14 Oct 2025 15:44:48 -0700
Message-ID: <f54e082df2f07893f66183089518f98cb792f22e.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224865

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=ee6c14ed59d480720721aaacc5fb03213dc153da
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002280.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-7.patch          | 149 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-7.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
new file mode 100644
index 0000000000..74cb49670b
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-7.patch
@@ -0,0 +1,149 @@
+From 1077953950d1e8864c63222967141c67f51297f8 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:27:04 -0700
+Subject: [PATCH] nptl: Fix indentation
+
+In my previous change I turned a nested loop into a simple loop. I'm doing
+the resulting indentation changes in a separate commit to make the diff on
+the previous commit easier to review.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: ee6c14ed59d480720721aaacc5fb03213dc153da
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002280.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 110 +++++++++++++++++++--------------------
+ 1 file changed, 55 insertions(+), 55 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index c8c99bbf..adf26a80 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -383,65 +383,65 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+ 
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
+-	      /* If we timed out, we effectively cancel waiting.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+ 	      break;
+-	    }
++           else
++             continue;
+ 	}
+ 
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
++
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+      mutex.  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 3034461e9e..7ef2c8cb4c 100644
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


