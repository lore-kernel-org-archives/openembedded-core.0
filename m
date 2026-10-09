Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6C7CA9EBD
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:39 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2879.1791571658708697867
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=n7Vc+U97;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202610091847378dc3effb8d000207f0-w4ctns@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202610091847378dc3effb8d000207f0
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:47:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=0INocukSu1uZsFSbHN8lcjxRnqcXGG8r6Xjao9aEflo=;
 b=n7Vc+U978dBHDVBEMQMSasgaCb0CzNdcSG2/qs+W2jmof6V1UkYluPy+p4/pDuNNJfuqRR
 50/2cv8uq9WIbgZm9eqVZshNVIfSiOPTzQkYvfOD6sKXW6PK6bm39JP7xMN+5JOuW0TPJYDC
 GlKnB0DTl/jnMEAN3dN+fmCBnDXE2Cm7srzvPO+hvjT18XYZenxHDu/oJpRf9/tO07xJfS1z
 /YyINQCtmhhSkNlRZx9SulMRiv0p5nw73pa80t2CUlyhFGfwZfr/lkX1pRAPjQsvJN2vfR9B
 yPM5gpAU7zxJWgKeinGv4CtNCMohfCNxqc5z9fpXvHYUIo3ut2VNnmIw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 7/8] libpcre2: patch CVE-2026-86145
Date: Fri,  9 Oct 2026 20:45:47 +0200
Message-ID: <20261009184548.2962197-7-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247482

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] since [2] does not provide valid commit hash.

[1] https://security-tracker.debian.org/tracker/CVE-2026-86145
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-3r4p-g7gg-ppmf

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-86145.patch     | 158 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-86145.patch
new file mode 100644
index 0000000000..a044a006e5
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
index 2f40ef463e..60ba56014b 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89157.patch \
            file://CVE-2026-89160.patch \
            file://CVE-2026-89158.patch \
+           file://CVE-2026-86145.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

