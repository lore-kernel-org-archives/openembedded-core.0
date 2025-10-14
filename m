Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD727CCD196
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.2578.1760481910946458858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IKtb4528;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27ee41e0798so93651795ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481910; x=1761086710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FzsBlV/pTmorZE2GFMsUHkpAuQGkT9MnDZiIUz7ZphY=;
        b=IKtb4528RbdJHmDOzKfH+ZfGUqTFAqiJ7oXx0XqAOY4tuN0HBihiDzlB05xBHwM1yi
         gkTI9GCxBquTyw163z+x18enssLSZBLENoseuyiOy13QntvIEpTLSpXPvKcQHVRCNYCO
         Bi0xW4VFyltcKOzJfAQKu8orqQX7nlpVDXfxF08DOIYTcQvJrzaDOBMQPKi69ciW6atf
         mN16sTmramRTJGYurhWWuxUBtxK9WAzIoV6Engs5x+mBcl7jyR/LYxkY9oqMuZ4BQONw
         aoMNVkJX203KIkis3/OcVIsP2j1KowyaTkKOMKNs/wBHB4XwE7hD/ADlieBzhEnGLpbF
         e7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481910; x=1761086710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FzsBlV/pTmorZE2GFMsUHkpAuQGkT9MnDZiIUz7ZphY=;
        b=svUM3jo9WkQrCynoK4hhy8WC6w3Y/zWMSEnBuxUakesUsZzNxHUktkbAm9skuyLWtg
         5ePgLP32K7SeDwxVpmT7ILTI9krbqapO9hvW23BbxbmkdUcR07dSik4uVuz+F6Oo3eWh
         Ltn0++MEOHFi/djNJTiBU3bfqsJoX98YnEuW7iJb+DXUpQrsJGBevXHUEQLOmWqxvW9K
         oJlIq0Nlc/vXSaNRtZi2IzuRP/4y8vRznxoRMO8Y0nLyTBdTbVaYDcL13MU4zwZ6LJxk
         F7axuq6QrNudmeN/j0a8kn63VHyux81nXWWRHO7l/aRQgOlrPoV/UZKz/TRILc9Bk6cz
         yCSg==
X-Gm-Message-State: AOJu0YyGlOFji5ffwN7nnbb9XdGaHn/M52W1GabL/LfeUwntoMGEu32K
	47+5DOf9Pc4GvIP98R7DJeTYS9eOBvfJKX7QvB6C1rIcqpxd2etRWFjkPvn3gWNiPcQV3gW+bUV
	ZbXt2
X-Gm-Gg: ASbGncstPhj46o3B/voRyczafFMOnH2lwEepX8C1YrVlmO3eSgnoNbVkR7prQCiBXk7
	+yvrQnTq9G4mE0muBBv5af9DeovEPMnmaVnTB1xHAND2QSNloENN1Fpfi1RSupF6H1tDK/vVam0
	Mz9p27N2PjFWL385jQvG0eVkTuluDVx8IFLwepdGiYfvHSvj3GJrXuMNmG3oBWCeRtv14kdnyux
	aTaVO8M0rvZ6mbKmip8vqrPI7R6cssnlP1mUTdcTYqT55IHhz+z7Bu0AItjafZ7en/qp42qs2af
	DU6mKtKjlROEClETbNl1LKq2IrsrJy2RNENVh6G2uf4MgNtjFjsoFsMnrl7PHMJVMqfUAXA9IZ/
	cHeOA/3GKZTZXr5TeIqs8B2Gi0Yp7MhUY
X-Google-Smtp-Source: AGHT+IGE2b1PyPj8WCGhtnIF97w5LhSf9xxkhkl8axPobBU3IEUJ2nUPYKRHqbX20XXtfFQQTOjBHQ==
X-Received: by 2002:a17:903:298c:b0:265:982a:d450 with SMTP id d9443c01a7336-290273ffbf1mr352326845ad.40.1760481910080;
        Tue, 14 Oct 2025 15:45:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/14] glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
Date: Tue, 14 Oct 2025 15:44:45 -0700
Message-ID: <e6cac5aef751d698327f6ebee966462644c6c6a8.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224862

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=4f7b051f8ee3feff1b53b27a906f245afaa9cee1
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002276.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-4.patch          | 118 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-4.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
new file mode 100644
index 0000000000..475462c880
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-4.patch
@@ -0,0 +1,118 @@
+From d714165c8bb3cac420077cfa61e3df87ea7f8b2c Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 05:34:06 -0700
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
+commit: 4f7b051f8ee3feff1b53b27a906f245afaa9cee1
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002276.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_wait.c | 49 ----------------------------------------
+ 1 file changed, 49 deletions(-)
+
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index cee19687..47e834ca 100644
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
index 0787dfe236..f9086c0855 100644
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


