Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C98C7115B
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:15 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.31279.1750195271917005527
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vOoGn6Sg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so90974b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195271; x=1750800071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ep62FNMWcnUYn81+hk0f+oUs3Hqk4erI1Xwgyr+s5Y=;
        b=vOoGn6SgQ6wBDTxrLaRVYAHpl3NwVf30x4DJA+9ofYz2h3briYcwg2jGkOtpelgcDg
         olnpU00Dhota0oPjOk8kv9kdeTU0UGL9QnVYSCtZsUNViTr0ddWbs3HxfdDZQ15I6DSw
         4FDIkDH85CzIM18j91z2DuEXB/5vVO0GYnDDwuSTvUZ/IlPvCJIeyxjyQ0fs4Sn5zZxo
         MV+Ae72kxp+Yd++X/YVDDV1KiK4wMAQy6NPNV+kusm82x43j6GoMBvJQLNzUth1L7uwp
         HwupJH7Hqx7NEZNnTTp0aEBhFcNwh2I5ZoRpobvbGfh3YM6GGJt0J1rtrxfp9ap7Peb8
         rv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195271; x=1750800071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ep62FNMWcnUYn81+hk0f+oUs3Hqk4erI1Xwgyr+s5Y=;
        b=VaJLOdQx+ViqHxITjJJYOZYkwfAthIryVqjRCVPSG4fWjGZLLbS0lxczP69vXEymOc
         PKInc/7j9PtzhBVJdLjVT4KFNISaiqEwT7hTFDuAwnI+DwedwqzTcvbwm3I5QY1fU+H8
         Yx2PYGfO97KTO0ObB+fAZ1rU0fy4HVegEo+KSoKkdbL92QiZ1zSGAV63I/rAU/rb+23k
         lyc/bTrtsJUMpQCNW//pyguOiKJgc3BuljLjs/CUGU+fkKcfNdP6qoazRWjdy2bGv8C3
         D//qZBKCGhrpJ5XitqjZtRmEZhiC58AUBF5mKyz+HO7vM3ft4tcZM00Q2HbMz8lpr3NF
         toeg==
X-Gm-Message-State: AOJu0YyI2ydz/IK6bdADUH08bYCpb9sIlWvloQGbRc0F42TSjUqpBgNd
	7iABSPdY4fFhv279sJ0dbZjZ8M8YcLZkgk6OjIrW3REFFGAHwWgDiz/VEo/9hdIgn+08WdDJ+19
	rTFxi
X-Gm-Gg: ASbGncs5KfJWz0QnN7L0lmQ5kmNEAzHz2/5J301FqcDtVr8rMHq2c6zZqWTMZj7/JWS
	tYUYlKUnbEC/ZQ4Ig0VYBoUjVEfTQao+GRurejt6j02GCFetFsAqiGa1Ka61hCdmhqIBHHYTRGM
	9CVQQzs0+XEOZY+sBuCb/hvTl3HyHIZdDz1tTaaErbEe3Qr/nTnAy2pOlxWytLAelU989m3s2CB
	zHQOqlNXEP97zIDA2xcTIZ1H5TYdKXrl1yK/Ud06FsvrHoiaywKpxssGQCgiSa5eEPpXtgm4l0O
	Y2Z+OFWeKgesteQClY5kD8a64jqusqkbxmBBAOirm2+ceFQvzXcpGw==
X-Google-Smtp-Source: AGHT+IEIPlK9YCwF51qSAHWSZH7PjDb/BIQjs/A458JzvbuO8ISzq7A9AKP13wLUIB+Xtyxb4KiGlw==
X-Received: by 2002:a05:6a00:2282:b0:748:e289:6bc with SMTP id d2e1a72fcca58-748e6ec48dcmr108012b3a.1.1750195270751;
        Tue, 17 Jun 2025 14:21:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/27] glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
Date: Tue, 17 Jun 2025 14:20:20 -0700
Message-ID: <761758340002f9dbff8e0668f4883ff623b232a0.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218940

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-4.patch          | 117 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
new file mode 100644
index 0000000000..f8674d62ae
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
@@ -0,0 +1,117 @@
+From 16b9af737c77b153fca4f36cbdbe94f7416c0b42 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:38:40 -0700
+Subject: [PATCH] nptl: Remove unnecessary quadruple check in pthread_cond_wait
+
+pthread_cond_wait was checking whether it was in a closed group no less than
+four times. Checking once is enough. Here are the four checks:
+
+1. While spin-waiting. This was dead code: maxspin is set to 0 and has been
+   for years.
+2. Before deciding to go to sleep, and before incrementing grefs: I kept this
+3. After incrementing grefs. There is no reason to think that the group would
+   close while we do an atomic increment. Obviously it could close at any
+   point, but that doesn't mean we have to recheck after every step. This
+   check was equally good as check 2, except it has to do more work.
+4. When we find ourselves in a group that has a signal. We only get here after
+   we check that we're not in a closed group. There is no need to check again.
+   The check would only have helped in cases where the compare_exchange in the
+   next line would also have failed. Relying on the compare_exchange is fine.
+
+Removing the duplicate checks clarifies the code.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 49 ----------------------------------------
+ 1 file changed, 49 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index cee1968756..47e834cade 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -366,7 +366,6 @@ static __always_inline int
+ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     clockid_t clockid, const struct __timespec64 *abstime)
+ {
+-  const int maxspin = 0;
+   int err;
+   int result = 0;
+ 
+@@ -425,33 +424,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+ 	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-	  /* Spin-wait first.
+-	     Note that spinning first without checking whether a timeout
+-	     passed might lead to what looks like a spurious wake-up even
+-	     though we should return ETIMEDOUT (e.g., if the caller provides
+-	     an absolute timeout that is clearly in the past).  However,
+-	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
+-	     user will (ab)use pthread_cond_wait as a check for whether a
+-	     point in time is in the past, and (3) spinning first without
+-	     having to compare against the current time seems to be the right
+-	     choice from a performance perspective for most use cases.  */
+-	  unsigned int spin = maxspin;
+-	  while (spin > 0 && ((int)(signals - lowseq) < 2))
+-	    {
+-	      /* Check that we are not spinning on a group that's already
+-		 closed.  */
+-	      if (seq < (g1_start >> 1))
+-		break;
+-
+-	      /* TODO Back off.  */
+-
+-	      /* Reload signals.  See above for MO.  */
+-	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	      g1_start = __condvar_load_g1_start_relaxed (cond);
+-	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-	      spin--;
+-	    }
+-
+ 	  if (seq < (g1_start >> 1))
+ 	    {
+ 	      /* If the group is closed already,
+@@ -482,24 +454,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     an atomic read-modify-write operation and thus extend the release
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	  g1_start = __condvar_load_g1_start_relaxed (cond);
+-	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+-
+-	  if (seq < (g1_start >> 1))
+-	    {
+-	      /* group is closed already, so don't block */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      goto done;
+-	    }
+-
+-	  if ((int)(signals - lowseq) >= 2)
+-	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the
+-	         refcount */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      break;
+-	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -533,9 +487,6 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	  /* Reload signals.  See above for MO.  */
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-
+-       if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-	 goto done;
+     }
+   /* Try to grab a signal.  See above for MO.  (if we do another loop
+      iteration we need to see the correct value of g1_start)  */
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 5e1f45608e..bb5d22cfe8 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -65,6 +65,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
            file://0026-PR25847-3.patch \
+           file://0026-PR25847-4.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


