Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AEAC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:21:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.31435.1750195270138280294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:21:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iEhuWxD4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c49373c15so4892887a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195269; x=1750800069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgFhSEwT2qsL6bInNgs/2Kd/G9seENhxwDAYJfnA6vo=;
        b=iEhuWxD45iNYyqgbZnIFbSuB1V9X8pfTJ7Q8cYqCp43WjmZ5GRvMJlfzhYbCUS9YU8
         CMV6tjrGhuwB41tAtdzjWPO/o2g83VufmSYkAVLK5B+7rakT9AXLTK240jSM03K0tzSF
         dZmpD5b7/Q+/r1rjJJ7MCp2o7ifolMzpRVRU829MGDwU5JvSl1YvUl87SeHH+9gI5A/e
         FIqX/gP7ijAan1sNH9SBsKQiLi50A0D62RsmfmSB/wKDzY6p0luUcp+YgwUGw7rWkgdL
         P4uAQXbpxpUgZmZiguZaDUXuOM7o8EMn0o/D+0yu7dHo68v3tu5LV0x8WvdkYZAUyk3j
         Nyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195269; x=1750800069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgFhSEwT2qsL6bInNgs/2Kd/G9seENhxwDAYJfnA6vo=;
        b=MxycYdc65uRAsw1sdtqRHMKpoe5q9zouC0vgVlr9H4eXk2KCQ1jox4M9UiY+bnC6dq
         V6pmUkm51BbvQsnOF+U1P4KHqy1hjIjMuocpa9C3xeygSSQl8E8K6MNLFWa8VT5T0xk0
         vPEuu0U2iN0lIJb6dbfqptBC90sMvt7Gx0cc56rTJE423e9tX9+2lQnBDN3Gw5E/8JvH
         VUaJVBjVepyUtCuHmwXyKX5hRIocPlzBRHHU9qJ/L4t7XbINYjeViKRgv1aWRQh0fsJT
         uY47LjqtkqPVgzEKTsQ0WU2V4hfRTgal21k98APamhkXBvJFwkgx+y7FB+ucAzDiuaCL
         pzaQ==
X-Gm-Message-State: AOJu0YyyKyBMX36p034Q3hsGr8Lub7TQXVF5gY80aee0CiOtH7gvmiEb
	dCl5bjlvTpVHGoLrUEAgjfk1vd7e4gHeUdJZ+cmsfJIdlorKeGuCXLFkXwGsSWSD8LHCQOCgcqu
	/uuYi
X-Gm-Gg: ASbGncsFYbWGwGuT0+C3By2vIlLDCZVCvPcZussh2JjAgdrx2+arc85XyXWM7Vi6vaL
	wwPcSq92yCilJcDAZvGCQaKVok+ebi3sCuh+mZRaUzVVVF2qpSOdzIGC8HdYQkga86W5knagjD/
	i8AZ2dGwd14q6TSgZxn+UT8cSImaGELWqf2n1Dz/yY22pxeTe1JPyigtKA+c/7LeMxhDV2991RV
	6s1xHAyewlYRKAb0gJk/wgxXQBdCqmQeePk55UxR4WBquLnGScJJ8jTUIbd9gbqq0/ei/W184yW
	EN8m/eG+vlZIBF2CDRMXW1tZDSFUU/BX/udWwbR5+PgDM9Gu8+lfV0Co13rK6uiK
X-Google-Smtp-Source: AGHT+IGudAHHopu53N7tpG/x8168SiTNU4SKuONzo3OxcKIF2skhdmHuhbAtZwBbx/AzATDSYWdMhQ==
X-Received: by 2002:a05:6a21:3298:b0:21a:d503:f47c with SMTP id adf61e73a8af0-21fbd63484dmr22390584637.28.1750195269176;
        Tue, 17 Jun 2025 14:21:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.21.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:21:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/27] glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
Date: Tue, 17 Jun 2025 14:20:19 -0700
Message-ID: <02f2ac08edb506ec43cec93a5b09f5e6d7df02ec.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:21:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218939

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport
[https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glibc/glibc/0026-PR25847-3.patch          | 77 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
new file mode 100644
index 0000000000..4cfcca846c
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
@@ -0,0 +1,77 @@
+From 28a5082045429fdc5a4744d45fdc5b5202528eaa Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 16 Jun 2025 23:29:49 -0700
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
+
+Upstream-Status: Backport
+[https://sourceware.org/git/?p=glibc.git;a=commit;h=b42cc6af11062c260c7dfa91f1c89891366fed3e]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 30 +-----------------------------
+ 1 file changed, 1 insertion(+), 29 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 306a207dd6..f976a533a1 100644
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
+@@ -240,28 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
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
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 92c4dad023..5e1f45608e 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -64,6 +64,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0025-CVE-2025-4802.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
+           file://0026-PR25847-3.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.43.0


