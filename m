Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD77FCCD198
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:17 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2576.1760481909523206385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HlOO1wVw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b6271ea39f4so4030095a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481909; x=1761086709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4W0NFmClxkHVtp0MzCXxfiXohoZUzlhJuhbz4h977U=;
        b=HlOO1wVwRsLMzuWkMmjZ/XXD8A0QORVWjSkI4R+emgwrpSZ1FTawX2dvwJPMLmraLp
         1zkGigs5rhtxGtWBo48mKBkD+o0kQEqIk1Cfh0Wg3I+JX3VwqTABZOKyyUP0E7m88nwa
         VczrXGvF9mRb9+5Q550vI+PURPatAs0BPdJiKGovF0sZwKhMi5vjWPB0srAoqSvh0iZA
         gvA3k/If5nlCcnvabeVoO31SK0APzUOEKfXV5CdLCwYPShimOdoAmldp51dHq07nxNwE
         1m6axF9xfF1qspwqKg8PKAdDVw+aOlcPvlbVp7p/FE6/KmnvqApvVmraj1G4/R6moDhZ
         9yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481909; x=1761086709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4W0NFmClxkHVtp0MzCXxfiXohoZUzlhJuhbz4h977U=;
        b=UifVKXpagB7MZAXQQ8aEdt6bzTPimCi1Ajt9laBlZvEUAEq7nvxJJYBcC87T28TUWd
         fPuPCvvL2WJimBygj6bXvYLmA364zsdxluPR300By8rZ6CLiYj6+dCMxfSI+ZGMDFR8O
         mWRYOJmu3gyNq2xIMjGD+Hy0hlBpicK+UnnWpfO4wX25N9JzlyxFb7SIQXEDEEbiXR6m
         0cbMBEZmIVHputJB0mmwqHtgRNIkG3dlEEsLYjOxe3WkW9rnaScKwO7uDVM3PDZlw9sd
         ntNIpEiHkcoKLTcUhPptpKHDv2n1GV9P8bn8bhsRu0LdMLUGWMUKWgRZoLregImZvynG
         QA/g==
X-Gm-Message-State: AOJu0YwB49LTVGBuz2dUcqdsDKCQbjWTOHNR74WnkjoE6Ds9m3BxV+p/
	azWvZF40k13RwkeX7H5IouXBvdlr0+dHhxQcDdD1s8hzgE7XX8rvd11snVVSR9lJoEIz4gQ89ZN
	4x+gj
X-Gm-Gg: ASbGncsHsMrYSetohvNcF/2f+WUZdKLFp7GfPLh1ok7WmniXCnaNoGW+lBBhoSa+Vzx
	NjgX4xtJXI/Chg9gmFgLdWGc/Lp9mNZKY32L83vr9ReexAqEno7ftt8YicV/DXYRJI/Sv0a+MUD
	JATbg8j+KZHQTpsbYpXe7jN9JKo1FPgdgJ6uzZFl4OnbmvviMJRPHoR29RLBu5oYqdhxEqZ4KMp
	TZmfR2n/JU2xZXQVtYzXpywimYFw9OF7NzIJjnDCqdRgGZIf5LbCSsLWGxEpfxUlvqDH8LK0nOL
	kdncwWR7HnZxOeMZjbuk6PZJVt4UuOAcZR+i/NqAY0cLLWB54mlGCCzUfvqoE9RN7lSkEjGgqtG
	eEZmUB1oPSDr1RDXNSkRoSAgUlzPB0BKg5tz4bFffwco=
X-Google-Smtp-Source: AGHT+IGvQDhWlwxb5NDJCZYMeo+lBRIwek+uX910S1FIz+BZn5OEkxfK1cx6XHaMAeeT2WiRvMvisA==
X-Received: by 2002:a17:902:f70b:b0:250:1c22:e78 with SMTP id d9443c01a7336-29027356cdbmr347094855ad.1.1760481908626;
        Tue, 14 Oct 2025 15:45:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.45.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:45:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/14] glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
Date: Tue, 14 Oct 2025 15:44:44 -0700
Message-ID: <18b4f22aaae19cd0efb21433f0c23c5580246a2e.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760481775.git.steve@sakoman.com>
References: <cover.1760481775.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224861

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
  [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e
  [2] https://sourceware.org/pipermail/libc-stable/2025-July/002274.html

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-3.patch          | 79 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
new file mode 100644
index 0000000000..4228be95d1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
@@ -0,0 +1,79 @@
+From 5f22e8cf95cf6b3b2e16ddb03820ae3e77fd420d Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Tue, 14 Oct 2025 04:47:48 -0700
+Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar group
+ switch
+
+This wake is unnecessary. We only switch groups after every sleeper in a group
+has been woken. Sure, they may take a while to actually wake up and may still
+hold a reference, but waking them a second time doesn't speed that up. Instead
+this just makes the code more complicated and may hide problems.
+
+In particular this safety wake wouldn't even have helped with the bug that was
+fixed by Barrus' patch: The bug there was that pthread_cond_signal would not
+switch g1 when it should, so we wouldn't even have entered this code path.
+
+The following commits have been cherry-picked from Glibc master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+commit: b42cc6af11062c260c7dfa91f1c89891366fed3e
+
+Upstream-Status: Submitted
+[https://sourceware.org/pipermail/libc-stable/2025-July/002274.html]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 31 +------------------------------
+ 1 file changed, 1 insertion(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 350a16fa..f976a533 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 have already received a signal and been woken. If they
+-       haven't woken yet, they will be closed out immediately by the advancing
+-       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+-       which will prevent waiters from blocking using a futex on
+-       __g_signals since it provides enough signals for all possible
+-       remaining waiters.  As a result, they can each consume a signal
+-       and they will eventually remove their group reference.  */
++     * Waiters in G1 have already received a signal and been woken.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+@@ -240,29 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 
+   unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
+ 
+-  /* If any waiters still hold group references (and thus could be blocked),
+-     then wake them all up now and prevent any running ones from blocking.
+-     This is effectively a catch-all for any possible current or future
+-     bugs that can allow the group size to reach 0 before all G1 waiters
+-     have been awakened or at least given signals to consume, or any
+-     other case that can leave blocked (or about to block) older waiters..  */
+-  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
+-   {
+-    /* First advance signals to the end of the group (i.e. enough signals
+-       for the entire G1 group) to ensure that waiters which have not
+-       yet blocked in the futex will not block.
+-       Note that in the vast majority of cases, this should never
+-       actually be necessary, since __g_signals will have enough
+-       signals for the remaining g_refs waiters.  As an optimization,
+-       we could check this first before proceeding, although that
+-       could still leave the potential for futex lost wakeup bugs
+-       if the signal count was non-zero but the futex wakeup
+-       was somehow lost.  */
+-    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
+-
+-    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+-   }
+-
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 732cb96f94..0787dfe236 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
+           file://0026-PR25847-3.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


