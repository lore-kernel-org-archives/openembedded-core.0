Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7B8CA9ECA
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23460.1791708100901681068
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jqCkmlMZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c5358fc28so690461f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708099; x=1792312899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mwrZqK4Qplpg6atDCoeQoX12HRu82oZKicCONPa8fEk=;
        b=jqCkmlMZpolG4PdaERSxSFzvfV2OKwo5w0exKswzKcAzNvKATvmdMhEIV2CK1p5VM3
         gTzvh1n72HJg3aF7c2Rf7IXe2bfo1jek2qoLtoimt1cWRm5zNAr/l+05+MMEYxJKLQmv
         ANCfMKPHB5xqFcFOyT7Hhizstw5LJrj4stvk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708099; x=1792312899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mwrZqK4Qplpg6atDCoeQoX12HRu82oZKicCONPa8fEk=;
        b=M/76FU9sQn9ESLHiwBWkRHlXpmMb/Hqc8MeQ8gpCeXpFpEzEphCwpxHrXGr5oLqxQz
         /LlG2pRnhAyXFksIhqQL1Xm62R1454YeUC7yuxOgV/e5mJSspsTDPrB0qlUkeT945TC4
         Uo1B39h7N0j7rj+QxN8e8jFQHjCtJU0lqOfNeeDbUd1hSiQFxRiJ6wmdLWCbPbvJOweB
         faBvoJXrLjmwN3zCPzFlaKStMCR6RCi0NgRypquO90BRblvLdsVHpTsR3c9SSUrl55Wa
         6xCYb2ACGeyUeSjDzcEYYhpHsNY/fFcMsXacSPeQbhtZBQ1fr6jSO63cpU+mVhRalFCD
         SZ+A==
X-Gm-Message-State: AFq9FYKSUnDEaFpef5dCc0aNI7sbzYPlyEpaMh/kSJ2yehCxDA1SC0XE
	SIhcmiXZ6bCYLJth82rjCMEGDG6ULIZW7v2ChuvO/lKyHaAZp7jmMDQLy8WkP5A7sGebP0KuRZR
	zN+qD2CI=
X-Gm-Gg: AYBFou3Q/qtIrk3so1RnMtJHlLRWUthpVZrQyUU1RlmelVOoJJ7TuUn81wv++b6g+Hq
	1E23WkN2rsGZchKc/CKk3hmpSplM/wMtSh+8t1Bk0EogNeeWNLHyGB7U80Ap0LDOkdbpPieti7k
	yT6xwUfizplxdHrq8BVskzYNJVItVHoG/hPo9d1BT4S2djat1cT9A3x/UzQc6VgsBSpzmIiyYCY
	/48qrtGNBn+3Sq2DcPP8jCa/6b2ON4RnQCCfoxqirWqmCEdm9zOgT7h/InRXwT6O3Paj6L/W8uu
	BjvAHTRH0v2akpWo6Zeck5kFmJpUC6MZpnYznAHX8yFG5QeziUKCxgajuPzGY2SnAvgZZ0JvvS1
	AXPgXdv3lWmNSUr2j/0mU8IOZwCp8dYCxQAAE57YAawyNwSu8iB3ryju8CFzonyhJnzC6I6Vmz6
	/5EjhGawFF+rGcHyi/e7JTYvLBatKzrbpoKbyHRTy3FKdxkak2SccillrHVk0pIvYPNmPxTAAcx
	/N9aLuHZBNTVqJTmHpbJL0WU5htzjQGBQFHR+NoDFaQbxx37B5pROJGNkOj3sUpnSx60hTbqA==
X-Received: by 2002:adf:f24d:0:b0:485:8c16:5ee9 with SMTP id ffacd0b85a97d-48dbaaef911mr8531132f8f.35.1791708098864;
        Sun, 11 Oct 2026 01:41:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 59/60] libpcre2: patch CVE-2026-86145
Date: Sun, 11 Oct 2026 10:40:32 +0200
Message-ID: <2bd1c40bcfc139c47eb5433b3a2e3aa5de18ae53.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247568

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide valid commit hash.

[1] https://security-tracker.debian.org/tracker/CVE-2026-86145
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-3r4p-g7gg-ppmf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-86145.patch     | 158 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch
new file mode 100644
index 00000000000..a044a006e5f
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch
@@ -0,0 +1,158 @@
+From c932e70451eafef922ebef364ac25042f0031135 Mon Sep 17 00:00:00 2001
+From: Nicholas Wilson <nicholas@nicholaswilson.me.uk>
+Date: Thu, 27 Aug 2026 16:52:16 +0100
+Subject: [PATCH] Fix DFA workspace overflows; see GHSA-3r4p-g7gg-ppmf for
+ details
+
+CVE: CVE-2026-86145
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/c932e70451eafef922ebef364ac25042f0031135]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_dfa_match.c | 44 ++++++++++++++++++++++++++++++++++++-------
+ testdata/testinput6   |  7 +++++++
+ testdata/testoutput6  |  8 ++++++++
+ 3 files changed, 52 insertions(+), 7 deletions(-)
+
+diff --git a/src/pcre2_dfa_match.c b/src/pcre2_dfa_match.c
+index 314e9775..8e9512c4 100644
+--- a/src/pcre2_dfa_match.c
++++ b/src/pcre2_dfa_match.c
+@@ -405,8 +405,8 @@ return (mb->callout)(cb, mb->callout_data);
+ 
+ /* This function is called when internal_dfa_match() is about to be called
+ recursively and there is insufficient working space left in the current
+-workspace block. If there's an existing next block, use it; otherwise get a new
+-block unless the heap limit is reached.
++workspace block. If there's a sufficiently large next block, use it; get a new
++block unless the heap limit is (or has been) reached.
+ 
+ Arguments:
+   rwsptr     pointer to block pointer (updated)
+@@ -422,9 +422,18 @@ more_workspace(RWS_anchor **rwsptr, unsigned int ovecsize, dfa_match_block *mb)
+ {
+ RWS_anchor *rws = *rwsptr;
+ RWS_anchor *new;
++uint32_t requested;
++
++PCRE2_ASSERT(ovecsize <= UINT32_MAX - RWS_RSIZE - RWS_ANCHOR_SIZE);
++requested = RWS_RSIZE + ovecsize + RWS_ANCHOR_SIZE;
+ 
+ if (rws->next != NULL)
+   {
++  /* Although the initial block is large, and subsequent ones try to double, the
++  heap limit may cause the last one to be smaller; in this case, we have already
++  hit the heap limit and allocating a larger block will not be possible. */
++  if (rws->next->size < requested)
++    return PCRE2_ERROR_HEAPLIMIT;
+   new = rws->next;
+   }
+ 
+@@ -434,14 +443,30 @@ overflow. */
+ 
+ else
+   {
+-  uint32_t newsize = (rws->size >= UINT32_MAX/(sizeof(int)*2))? UINT32_MAX/sizeof(int) : rws->size * 2;
++  uint32_t newsize = (rws->size >= (UINT32_MAX/sizeof(int))/2)?
++    UINT32_MAX/sizeof(int) : rws->size * 2;
+   uint32_t newsizeK = newsize/(1024/sizeof(int));
+ 
+-  if (newsizeK + mb->heap_used > mb->heap_limit)
+-    newsizeK = (uint32_t)(mb->heap_limit - mb->heap_used);
+-  newsize = newsizeK*(1024/sizeof(int));
++  /* Clamp the allocation to the remaining heap allowance with care for overflows */
+ 
+-  if (newsize < RWS_RSIZE + ovecsize + RWS_ANCHOR_SIZE)
++  if (mb->heap_used >= mb->heap_limit)
++    {
++    newsize = 0;
++    newsizeK = 0;
++    }
++  else
++    {
++    PCRE2_SIZE availableK = mb->heap_limit - mb->heap_used;
++    /* newsize always capped at UINT32_MAX/sizeof(int), so newsizeK also capped;
++    and - if availableK is smaller - then multiplication to form newsize is safe */
++    if (newsizeK > availableK)
++      {
++      newsize = (uint32_t)(availableK*(1024/sizeof(int)));
++      newsizeK = availableK;
++      }
++    }
++
++  if (newsize < requested)
+     return PCRE2_ERROR_HEAPLIMIT;
+   new = mb->memctl.malloc(newsize*sizeof(int), mb->memctl.memory_data);
+   if (new == NULL) return PCRE2_ERROR_NOMEMORY;
+@@ -2801,6 +2826,7 @@ for (;;)
+ 
+         local_offsets = (PCRE2_SIZE *)(RWS + rws->size - rws->free);
+         local_workspace = ((int *)local_offsets) + RWS_OVEC_OSIZE;
++        PCRE2_ASSERT(rws->free >= RWS_RSIZE + RWS_OVEC_OSIZE);
+         rws->free -= RWS_RSIZE + RWS_OVEC_OSIZE;
+ 
+         while (*endasscode == OP_ALT) endasscode += GET(endasscode, 1);
+@@ -2900,6 +2926,7 @@ for (;;)
+ 
+           local_offsets = (PCRE2_SIZE *)(RWS + rws->size - rws->free);
+           local_workspace = ((int *)local_offsets) + RWS_OVEC_OSIZE;
++          PCRE2_ASSERT(rws->free >= RWS_RSIZE + RWS_OVEC_OSIZE);
+           rws->free -= RWS_RSIZE + RWS_OVEC_OSIZE;
+ 
+           while (*endasscode == OP_ALT) endasscode += GET(endasscode, 1);
+@@ -2951,6 +2978,7 @@ for (;;)
+ 
+         local_offsets = (PCRE2_SIZE *)(RWS + rws->size - rws->free);
+         local_workspace = ((int *)local_offsets) + RWS_OVEC_RSIZE;
++        PCRE2_ASSERT(rws->free >= RWS_RSIZE + RWS_OVEC_RSIZE);
+         rws->free -= RWS_RSIZE + RWS_OVEC_RSIZE;
+ 
+         /* Check for repeating a recursion without advancing the subject
+@@ -3050,6 +3078,7 @@ for (;;)
+ 
+         local_offsets = (PCRE2_SIZE *)(RWS + rws->size - rws->free);
+         local_workspace = ((int *)local_offsets) + RWS_OVEC_OSIZE;
++        PCRE2_ASSERT(rws->free >= RWS_RSIZE + RWS_OVEC_OSIZE);
+         rws->free -= RWS_RSIZE + RWS_OVEC_OSIZE;
+ 
+         if (codevalue == OP_BRAPOSZERO)
+@@ -3149,6 +3178,7 @@ for (;;)
+ 
+         local_offsets = (PCRE2_SIZE *)(RWS + rws->size - rws->free);
+         local_workspace = ((int *)local_offsets) + RWS_OVEC_OSIZE;
++        PCRE2_ASSERT(rws->free >= RWS_RSIZE + RWS_OVEC_OSIZE);
+         rws->free -= RWS_RSIZE + RWS_OVEC_OSIZE;
+ 
+         rc = internal_dfa_match(
+diff --git a/testdata/testinput6 b/testdata/testinput6
+index f6f5cbf4..197f6f76 100644
+--- a/testdata/testinput6
++++ b/testdata/testinput6
+@@ -5263,4 +5263,11 @@
+     abc\=replace=xyz
+     abc\=replace=xyz,substitute_matched
+ 
++# --------------
++
++# Test workspace resizing and workspace re-use
++
++/(*LIMIT_HEAP=4)(?=(?=(?=(?=(?=(?=(?=(?=a))(?R)))))))./
++    a\=dfa
++
+ # End of testinput6
+diff --git a/testdata/testoutput6 b/testdata/testoutput6
+index 8ecf0040..4316c8a6 100644
+--- a/testdata/testoutput6
++++ b/testdata/testoutput6
+@@ -8237,4 +8237,12 @@ Failed: error -42: pattern contains an item that is not supported for DFA matchi
+     abc\=replace=xyz,substitute_matched
+ Failed: error -41: function is not supported for DFA matching
+ 
++# --------------
++
++# Test workspace resizing and workspace re-use
++
++/(*LIMIT_HEAP=4)(?=(?=(?=(?=(?=(?=(?=(?=a))(?R)))))))./
++    a\=dfa
++Failed: error -63: heap limit exceeded
++
+ # End of testinput6
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 2f40ef463eb..60ba56014bf 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89157.patch \
            file://CVE-2026-89160.patch \
            file://CVE-2026-89158.patch \
+           file://CVE-2026-86145.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

