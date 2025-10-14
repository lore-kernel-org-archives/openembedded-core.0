Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97356CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2521.1760481914014727207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OLH/kkJ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-27c369f898fso84710215ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481913; x=1761086713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7RDkLUWowFPw+2PFZjFHI4glTHju6UNbdMufEcWvLY=;
        b=OLH/kkJ06GSi5Dnqax923ufEA7o+/amdFmtnTOxw+JjEy8HXUOwxsjseGf0OMtCRyE
         YKc1u1jgqhJJsrlKbmIEFLbK4nJk1537PfrDywWiTaqSwL6HrP2WlzbFTb0cU1izRUds
         fzy+s26LFrHj21uCPzsNQDOszlSPePmMUxhtPaK1RAt85mfSvCfst8LO6g5gcftiivE0
         KMdG2mU6O0DWdSNKX+ohlmleZ/Q8hXPBaxLKZNI14BUQ8OqiRmGBqnnHidZNvlxlX6M7
         uPMVECXokJNvHh+eKivQpGlHurh/TANp4zY/jKWXG7fvi1flWWmtfsbBJxJ+N4hRFiON
         9hVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481913; x=1761086713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7RDkLUWowFPw+2PFZjFHI4glTHju6UNbdMufEcWvLY=;
        b=oVj5ex59nWKf7M4gOrBtBaALOoXjDUGoNSqU+T6apKmqmBEkwWNaqZtx/4gpiNdjdt
         wQd4jUWTvHO6Eruwf/sGcK6eWy/pNqzn9kz92gwf19YUctHdZTha9ToN5Fqc20VcMYaz
         aElrdLxULOrhuPQdk8cHjHJF+Bi//rkBv0o8xjZbhhCYkFKdqhVnGJSaI5oyVZ/kkith
         L3nRvzcU4JL2p2IYdcB8srHdT2Wz6Hi7mmvASxMd6Val0Ty1NJEHLERR3beocYCxHczt
         9GYd3dUYT4pRaoPJwiAGnosBcensCqUEF4Ry25dPd2zA8DDhhkMuweGnUF5YkZ5f0cTO
         pZ0g==
X-Gm-Message-State: AOJu0YxZ0sgLMTMFUEJkdHu/lEmJNSKabNUGKs+IGnczZHb87Uwx9E9H
	5DE83D+iOblpwhyVVcfDS4j1Y2LlS3LiwUPs4X1u+x8K9ONzfIAG/9W2CYfexCctua8+nDMQyJt
	sMX8L
X-Gm-Gg: ASbGncsu5Mb3u9OtPlm+feeBC2fOhEfpP9LShhN9pGYVBCw3yr11dVPjwfz5EweTJvS
	wNPXkmV2xhTCFQpAYE3AIPywu0nYaQfS6yylszdFBMRTjfXbON7hI/YQNUMfP38hSdbQjrsFoIt
	8Ey/lvqh8EY6m6Yo4JWWepiEAaRxDWJ1SQm6Z33+bGK7x+NTHEp8LlonvDsays9Np5BOZUFnQGy
	g4tTEg6g1Pg0+fvtXTq/zatcxAFevnpuc77yFQD70rxfQjbUMleOkwYdPdLh6VkozCHFDVJopn7
	qNzYcsb/vRyM+Y+ssTyBU7KOAQAhEUGZb0W4GTWf1ep/OL/MOB7MvF4hzDq9Y/neVJxQ40VaDYa
	mZkheD2iwzW02oLulXeXW1JbtqmSdi3WYcDX7dBNzdYY=
X-Google-Smtp-Source: AGHT+IGyk6RhdDmmQYRKa43EWL5xy59i1Kmz2auZR5K0UsuCeOok5NwbH2acEVA9iI6lHZYGamQSvg==
X-Received: by 2002:a17:903:9cb:b0:24d:f9f:de8f with SMTP id d9443c01a7336-2902723ca52mr370275655ad.17.1760481913135;
        Tue, 14 Oct 2025 15:45:13 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/14] glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested loop
Date: Tue, 14 Oct 2025 15:44:47 -0700
Message-ID: <75bbc8cb3a94640120d778916abb2edf78b89fd0.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224864

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002279.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-6.patch          | 103 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-6.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
new file mode 100644
index 0000000000..7d5c4fda5f
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-6.patch
@@ -0,0 +1,103 @@
+From bbd7c84a1a14bf93bf1e5976d8a1540aabbf901b Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 06:19:02 -0700
+Subject: [PATCH] nptl: Use a single loop in pthread_cond_wait instaed of a
+ nested loop
+
+The loop was a little more complicated than necessary. There was only one
+break statement out of the inner loop, and the outer loop was nearly empty.
+So just remove the outer loop, moving its code to the one break statement in
+the inner loop. This allows us to replace all gotos with break statements.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: 929a4764ac90382616b6a21f099192b2475da674
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002279.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 8a9219e0..c8c99bbf 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -382,17 +382,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-  /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe (signals == lowseq) after group
+-     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-     store and will see the prior update of __g1_start done while switching
+-     groups too.  */
+-  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-
+-  do
+-    {
++
+       while (1)
+ 	{
++	  /* Now wait until a signal is available in our group or it is closed.
++	     Acquire MO so that if we observe (signals == lowseq) after group
++	     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++	     store and will see the prior update of __g1_start done while switching
++	     groups too.  */
++	  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+@@ -401,7 +399,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+-	       goto done;
++	       break;
+ 	    }
+ 
+ 	  /* If there is an available signal, don't block.
+@@ -410,7 +408,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+ 	  if ((int)(signals - lowseq) >= 2)
+-	    break;
++           {
++             /* Try to grab a signal.  See above for MO.  (if we do another loop
++                iteration we need to see the correct value of g1_start)  */
++                     if (atomic_compare_exchange_weak_acquire (
++                               cond->__data.__g_signals + g,
++                       &signals, signals - 2))
++                       break;
++                     else
++                       continue;
++           }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -431,19 +438,9 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If we timed out, we effectively cancel waiting.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+-	      goto done;
++	      break;
+ 	    }
+-
+-	  /* Reload signals.  See above for MO.  */
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-    }
+-  /* Try to grab a signal.  See above for MO.  (if we do another loop
+-     iteration we need to see the correct value of g1_start)  */
+-  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+-						&signals, signals - 2));
+-
+- done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index e744260e87..3034461e9e 100644
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


