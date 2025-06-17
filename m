Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D10C7115F
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:15 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web11.31436.1750195273282730357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NSn8ZdcD;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b2f62bbb5d6so5070406a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195272; x=1750800072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/bqgyilaqk6UIx4dpsmeB5JIKMqTNMymqgluZio464=;
        b=NSn8ZdcDSRr7sHfWRmuP6CwBJhb9OvwB797nCGK2LmNdoyENPgMsJDBIeU1BrIKbQ+
         Ioz+bQ1FmJYmYnFVdddzTLb5Kbaa2MP2wfhDDgQ9Zvc4XNp05Bzy2P/4mQAEAcQQ09ZN
         Z+NMkKrzu4l3yzVUcjrpKytzcyTXA6Akb36OFIchhELBc1zU3/ipn3Rzu441kFMlPW6D
         lfN4SkM6bXjZfp4HKYmaMTlTTyeW2acof7E6NQfr3t/2i6bts0RANRh4SVn0322jhX+x
         jQDQ4miNYJGOZYAGV/JjnVkVj6jjji7pk19SSTfEMNw7lUpAg0uU408nUqQlOfQBPve/
         6xjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195272; x=1750800072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/bqgyilaqk6UIx4dpsmeB5JIKMqTNMymqgluZio464=;
        b=dcJr6M1JEBqzbcvUDfzBfD9D2BBAAOD4zVGkpNXLdhLfLzikRebtm3G29xkipQCQ1t
         0U2Yc+0tMRZTnET+XsDxoZ9JAv2oJ98OZcJuQolWLPZoFw3QIF0m0Hk2wH1PJ2vkz/A/
         sMovVEtghcbe92vyM5zOIABH7vSybc/19PrM5NQ83dq/glnee7D4S3p3mQrzGEqyGvqm
         gRbqQfu8+dlxkLk8SW7B1aiE+aQ0es3KNEnY9CVywauqAQfzgVJQNWGAV5iXy5ZQQ45q
         KRu8YAHL74QPrx6Y+FUtNGEds/UxYhKk3vT/wrt/wrIeAedTRC9EygM6JzewtkgGPCfG
         XTRg==
X-Gm-Message-State: AOJu0Ywu54mXvP8MrYtiVPr0DMd0uMztbHGVWWwD3byzd1oTBJHSpVIw
	WZErztZVZwaG52K5XlchTuTQktroKiN0ANtgNUkmL/tU2naK/Lh2AM31TKczTsd540OuAJme66r
	tDYcy
X-Gm-Gg: ASbGncuvGwNxvTwrfLInOwYpyQN3yd//v/nl7WnPFXYAB7+ProG0RR38gaDn4TO3zzb
	INR3yModWeLr8w2pPW5+VU8yS0X3nfNyJe7HMqQAGveI1iwGlPWs2q45CvnR0Cc58ysuVkuk0h1
	JnjuZIKoKV5dsbpP04NfmAGBpl7DEQtlSN7beFVQzFDWjPK+vQOXWA78JdSGfeHhcqxqWzhkERD
	gi78Ixu/RARAYdsExzsK870zWdaSPdkVt14G+liruIsNukSffC7mIeVne1BBLLP/wVVfDP+SZGH
	s1c2jCV2WUeoz0g0DxNe4WHoNbPFiwjWpj0wlazDBuDhyLF8chxa6Q==
X-Google-Smtp-Source: AGHT+IGR4PM9ft5ujoZmKLp/JjCJYQ/M9Q48VdNGm0rJCZXekiQoaEyNkVwFE9dbRUsFFESEcwbqTQ==
X-Received: by 2002:a05:6a20:a115:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-21fbd668cacmr22957642637.38.1750195272317;
        Tue, 17 Jun 2025 14:21:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/27] glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested loop
Date: Tue, 17 Jun 2025 14:20:21 -0700
Message-ID: <eab44f7a027414ef29f6d07617997cc50fc515cd.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218941

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-5.patch          | 105 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-5.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
new file mode 100644
index 0000000000..16fe6f8460
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-5.patch
@@ -0,0 +1,105 @@
+From d9ffb50dc55f77e584a5d0275eea758c7a6b04e3 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:53:35 -0700
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
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=929a4764ac90382616b6a21f099192b2475da674]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 41 +++++++++++++++++++---------------------
+ 1 file changed, 19 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 47e834cade..5c86880105 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -410,17 +410,15 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
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
+@@ -429,7 +427,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+-	       goto done;
++	       break;
+ 	    }
+ 
+ 	  /* If there is an available signal, don't block.
+@@ -438,8 +436,16 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+ 	  if ((int)(signals - lowseq) >= 2)
+-	    break;
+-
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
+ 	  /* No signals available after spinning, so prepare to block.
+ 	     We first acquire a group reference and use acquire MO for that so
+ 	     that we synchronize with the dummy read-modify-write in
+@@ -479,21 +485,12 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 		 the lock during cancellation is not possible.  */
+ 	      __condvar_cancel_waiting (cond, seq, g, private);
+ 	      result = err;
+-	      goto done;
++	      break;
+ 	    }
+ 	  else
+ 	    __condvar_dec_grefs (cond, g, private);
+ 
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
index bb5d22cfe8..04dcb22c3d 100644
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


