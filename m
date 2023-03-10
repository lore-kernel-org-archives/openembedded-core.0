Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D479C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 08:32:48 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.14674.1678437164474560592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 00:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ASNVex2V;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id y11so4838030plg.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 00:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678437163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP+HnnB6KuFUApY1tlIE4tOPwAogSzMCtuNXqIWH43o=;
        b=ASNVex2VrK1s2HD9d4ZP0o72iXnvUL0tRmdQpYnGU9ykmS6/GsR8v6aHy5H27CVDfW
         cvddheQCHOGdP0gyImdm4N85u0pxWDLHB3Q0bOIUewYVHO5WLe06FYJ7jwmDxIzncz+3
         Z6EOwlpYM5SDDmJklHe/mMzuqFRyVbJHqZmHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zP+HnnB6KuFUApY1tlIE4tOPwAogSzMCtuNXqIWH43o=;
        b=sdNMPtPnZ8Le37O8l/QwFrQQorAEiVoNhYAmAcYC994M/QkQ+gVnmi7MwHwG2Nzz0O
         Rq/b1lMopEWhFldRzSEoKIT8NCkYYxIhh9/7s1FQEDBxLV4xMckKiI9JFp/yDBvkJE15
         7I4C3WKIz9yEMWZ6JaXY73Om6jscked4NGZrwBzlP08kk2T44Rm439VQBUifM+u+GHjp
         PekioedyqQQ0Qn9gj3zyNO1xiEdoNMdBpjCVqpq73OIeKw+MyKlNSdGbtYfZn6jh8jFP
         oM2fjNMnqbgZ5npYtDZ9PfO2kCk7im6EtyUdq/d73QQQofZjDmpctUOu730MKtZVJkHb
         BYdg==
X-Gm-Message-State: AO0yUKUYMBdJgv3cocKEGPyzwKpO+jmIp2G3d1XrK4mmU9yjDkJY8urw
	PMqigZPmMUJDMkrWnQOb+TpyRrYU8c+1Qjr5zTs=
X-Google-Smtp-Source: AK7set8cWWsB04b1N/pUZa/Q7XCWJRC894UXvmyX+A9Y6wJqT3BwJBN6cFjKfI7GzbOtadmLCbtAIA==
X-Received: by 2002:a17:90b:4d83:b0:237:b702:499f with SMTP id oj3-20020a17090b4d8300b00237b702499fmr25390245pjb.22.1678437163320;
        Fri, 10 Mar 2023 00:32:43 -0800 (PST)
Received: from siddharth-latitude-3420.mvista.com ([49.34.95.216])
        by smtp.gmail.com with ESMTPSA id pi7-20020a17090b1e4700b00233ccd04a15sm1209853pjb.24.2023.03.10.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:32:43 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] harfbuzz: Security fix for CVE-2023-25193
Date: Fri, 10 Mar 2023 14:00:36 +0530
Message-Id: <20230310083036.135887-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 08:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178311

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 +++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 185 ++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   4 +-
 3 files changed, 323 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
new file mode 100644
index 0000000000..6721b1bd70
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
@@ -0,0 +1,135 @@
+From b29fbd16fa82b82bdf0dcb2f13a63f7dc23cf324 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Mon, 6 Feb 2023 13:08:52 -0700
+Subject: [PATCH] [gsubgpos] Refactor skippy_iter.match()
+
+Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/b29fbd16fa82b82bdf0dcb2f13a63f7dc23cf324]
+Comment1: To backport the fix for CVE-2023-25193, add defination for MATCH, NOT_MATCH and SKIP.
+Signed-off-by: Siddharth <sdoshi@mvista.com>
+---
+ src/hb-ot-layout-gsubgpos.hh | 94 +++++++++++++++++++++---------------
+ 1 file changed, 54 insertions(+), 40 deletions(-)
+
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index d9a068c..d17a4da 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -522,33 +522,52 @@ struct hb_ot_apply_context_t :
+     may_skip (const hb_glyph_info_t &info) const
+     { return matcher.may_skip (c, info); }
+ 
++    enum match_t {
++      MATCH,
++      NOT_MATCH,
++      SKIP
++    };
++
++    match_t match (hb_glyph_info_t &info)
++    {
++      matcher_t::may_skip_t skip = matcher.may_skip (c, info);
++      if (unlikely (skip == matcher_t::SKIP_YES))
++	return SKIP;
++
++      matcher_t::may_match_t match = matcher.may_match (info, match_glyph_data);
++      if (match == matcher_t::MATCH_YES ||
++	  (match == matcher_t::MATCH_MAYBE &&
++	   skip == matcher_t::SKIP_NO))
++	return MATCH;
++
++      if (skip == matcher_t::SKIP_NO)
++        return NOT_MATCH;
++
++      return SKIP;
++  }
++
+     bool next (unsigned *unsafe_to = nullptr)
+     {
+       assert (num_items > 0);
+       while (idx + num_items < end)
+       {
+ 	idx++;
+-	const hb_glyph_info_t &info = c->buffer->info[idx];
+-
+-	matcher_t::may_skip_t skip = matcher.may_skip (c, info);
+-	if (unlikely (skip == matcher_t::SKIP_YES))
+-	  continue;
+-
+-	matcher_t::may_match_t match = matcher.may_match (info, match_glyph_data);
+-	if (match == matcher_t::MATCH_YES ||
+-	    (match == matcher_t::MATCH_MAYBE &&
+-	     skip == matcher_t::SKIP_NO))
+-	{
+-	  num_items--;
+-	  if (match_glyph_data) match_glyph_data++;
+-	  return true;
+-	}
+-
+-	if (skip == matcher_t::SKIP_NO)
++	switch (match (c->buffer->info[idx]))
+ 	{
+-	  if (unsafe_to)
+-	    *unsafe_to = idx + 1;
+-	  return false;
++	  case MATCH:
++	  {
++	    num_items--;
++	    if (match_glyph_data) match_glyph_data++;
++	    return true;
++	  }
++	  case NOT_MATCH:
++	  {
++	    if (unsafe_to)
++	      *unsafe_to = idx + 1;
++	    return false;
++	  }
++	  case SKIP:
++	    continue;
+ 	}
+       }
+       if (unsafe_to)
+@@ -561,27 +580,22 @@ struct hb_ot_apply_context_t :
+       while (idx > num_items - 1)
+       {
+ 	idx--;
+-	const hb_glyph_info_t &info = c->buffer->out_info[idx];
+-
+-	matcher_t::may_skip_t skip = matcher.may_skip (c, info);
+-	if (unlikely (skip == matcher_t::SKIP_YES))
+-	  continue;
+-
+-	matcher_t::may_match_t match = matcher.may_match (info, match_glyph_data);
+-	if (match == matcher_t::MATCH_YES ||
+-	    (match == matcher_t::MATCH_MAYBE &&
+-	     skip == matcher_t::SKIP_NO))
+-	{
+-	  num_items--;
+-	  if (match_glyph_data) match_glyph_data++;
+-	  return true;
+-	}
+-
+-	if (skip == matcher_t::SKIP_NO)
++	switch (match (c->buffer->out_info[idx]))
+ 	{
+-	  if (unsafe_from)
+-	    *unsafe_from = hb_max (1u, idx) - 1u;
+-	  return false;
++	  case MATCH:
++	  {
++	    num_items--;
++	    if (match_glyph_data) match_glyph_data++;
++	    return true;
++	  }
++	  case NOT_MATCH:
++	  {
++	    if (unsafe_from)
++	      *unsafe_from = hb_max (1u, idx) - 1u;
++	    return false;
++	  }
++	  case SKIP:
++	    continue;
+ 	}
+       }
+       if (unsafe_from)
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
new file mode 100644
index 0000000000..a1ec1422cc
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,185 @@
+From 8708b9e081192786c027bb7f5f23d76dbe5c19e8 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Mon, 6 Feb 2023 14:51:25 -0700
+Subject: [PATCH] [GPOS] Avoid O(n^2) behavior in mark-attachment
+
+Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
+Comment1: The Original Patch [https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc] causes regression and was reverted. This Patch completes the fix.
+Comment2: The Patch contained files MarkBasePosFormat1.hh and MarkLigPosFormat1.hh which were moved from hb-ot-layout-gpos-table.hh as per https://github.com/harfbuzz/harfbuzz/commit/197d9a5c994eb41c8c89b7b958b26b1eacfeeb00
+CVE: CVE-2023-25193
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/hb-ot-layout-gpos-table.hh | 98 ++++++++++++++++++++++------------
+ src/hb-ot-layout-gsubgpos.hh   |  5 +-
+ 2 files changed, 68 insertions(+), 35 deletions(-)
+
+diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
+index 2f9186a..46b09d0 100644
+--- a/src/hb-ot-layout-gpos-table.hh
++++ b/src/hb-ot-layout-gpos-table.hh
+@@ -2150,6 +2150,25 @@ struct MarkBasePosFormat1
+ 
+   const Coverage &get_coverage () const { return this+markCoverage; }
+ 
++  static inline bool accept (hb_buffer_t *buffer, unsigned idx)
++  {
++    /* We only want to attach to the first of a MultipleSubst sequence.
++     * https://github.com/harfbuzz/harfbuzz/issues/740
++     * Reject others...
++     * ...but stop if we find a mark in the MultipleSubst sequence:
++     * https://github.com/harfbuzz/harfbuzz/issues/1020 */
++    return !_hb_glyph_info_multiplied (&buffer->info[idx]) ||
++	   0 == _hb_glyph_info_get_lig_comp (&buffer->info[idx]) ||
++	   (idx == 0 ||
++	    _hb_glyph_info_is_mark (&buffer->info[idx - 1]) ||
++	    !_hb_glyph_info_multiplied (&buffer->info[idx - 1]) ||
++	    _hb_glyph_info_get_lig_id (&buffer->info[idx]) !=
++	    _hb_glyph_info_get_lig_id (&buffer->info[idx - 1]) ||
++	    _hb_glyph_info_get_lig_comp (&buffer->info[idx]) !=
++	    _hb_glyph_info_get_lig_comp (&buffer->info[idx - 1]) + 1
++	    );
++  }
++
+   bool apply (hb_ot_apply_context_t *c) const
+   {
+     TRACE_APPLY (this);
+@@ -2157,47 +2176,46 @@ struct MarkBasePosFormat1
+     unsigned int mark_index = (this+markCoverage).get_coverage  (buffer->cur().codepoint);
+     if (likely (mark_index == NOT_COVERED)) return_trace (false);
+ 
+-    /* Now we search backwards for a non-mark glyph */
++    /* Now we search backwards for a non-mark glyph.
++     * We don't use skippy_iter.prev() to avoid O(n^2) behavior. */
++
+     hb_ot_apply_context_t::skipping_iterator_t &skippy_iter = c->iter_input;
+-    skippy_iter.reset (buffer->idx, 1);
+     skippy_iter.set_lookup_props (LookupFlag::IgnoreMarks);
+-    do {
+-      unsigned unsafe_from;
+-      if (!skippy_iter.prev (&unsafe_from))
++    unsigned j;
++    for (j = buffer->idx; j > c->last_base_until; j--)
++    {
++      auto match = skippy_iter.match (buffer->info[j - 1]);
++      if (match == skippy_iter.MATCH)
+       {
+-	buffer->unsafe_to_concat_from_outbuffer (unsafe_from, buffer->idx + 1);
+-	return_trace (false);
++       if (!accept (buffer, j - 1))
++         match = skippy_iter.SKIP;
+       }
++      if (match == skippy_iter.MATCH)
++      {
++       c->last_base = (signed) j - 1;
++       break;
++      }
++    }
++    c->last_base_until = buffer->idx;
++    if (c->last_base == -1)
++    {
++      buffer->unsafe_to_concat_from_outbuffer (0, buffer->idx + 1);
++      return_trace (false);
++    }
+ 
+-      /* We only want to attach to the first of a MultipleSubst sequence.
+-       * https://github.com/harfbuzz/harfbuzz/issues/740
+-       * Reject others...
+-       * ...but stop if we find a mark in the MultipleSubst sequence:
+-       * https://github.com/harfbuzz/harfbuzz/issues/1020 */
+-      if (!_hb_glyph_info_multiplied (&buffer->info[skippy_iter.idx]) ||
+-	  0 == _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx]) ||
+-	  (skippy_iter.idx == 0 ||
+-	   _hb_glyph_info_is_mark (&buffer->info[skippy_iter.idx - 1]) ||
+-	   _hb_glyph_info_get_lig_id (&buffer->info[skippy_iter.idx]) !=
+-	   _hb_glyph_info_get_lig_id (&buffer->info[skippy_iter.idx - 1]) ||
+-	   _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx]) !=
+-	   _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx - 1]) + 1
+-	   ))
+-	break;
+-      skippy_iter.reject ();
+-    } while (true);
++    unsigned idx = (unsigned) c->last_base;
+ 
+     /* Checking that matched glyph is actually a base glyph by GDEF is too strong; disabled */
+-    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[skippy_iter.idx])) { return_trace (false); }
++    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[idx])) { return_trace (false); }
+ 
+-    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[skippy_iter.idx].codepoint);
++    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[idx].codepoint);
+     if (base_index == NOT_COVERED)
+     {
+-      buffer->unsafe_to_concat_from_outbuffer (skippy_iter.idx, buffer->idx + 1);
++      buffer->unsafe_to_concat_from_outbuffer (idx, buffer->idx + 1);
+       return_trace (false);
+     }
+ 
+-    return_trace ((this+markArray).apply (c, mark_index, base_index, this+baseArray, classCount, skippy_iter.idx));
++    return_trace ((this+markArray).apply (c, mark_index, base_index, this+baseArray, classCount, idx));
+   }
+ 
+   bool subset (hb_subset_context_t *c) const
+@@ -2423,20 +2441,32 @@ struct MarkLigPosFormat1
+     if (likely (mark_index == NOT_COVERED)) return_trace (false);
+ 
+     /* Now we search backwards for a non-mark glyph */
++
+     hb_ot_apply_context_t::skipping_iterator_t &skippy_iter = c->iter_input;
+-    skippy_iter.reset (buffer->idx, 1);
+     skippy_iter.set_lookup_props (LookupFlag::IgnoreMarks);
+-    unsigned unsafe_from;
+-    if (!skippy_iter.prev (&unsafe_from))
++
++    unsigned j;
++    for (j = buffer->idx; j > c->last_base_until; j--)
+     {
+-      buffer->unsafe_to_concat_from_outbuffer (unsafe_from, buffer->idx + 1);
++      auto match = skippy_iter.match (buffer->info[j - 1]);
++      if (match == skippy_iter.MATCH)
++      {
++	c->last_base = (signed) j - 1;
++	break;
++      }
++    }
++    c->last_base_until = buffer->idx;
++    if (c->last_base == -1)
++    {
++      buffer->unsafe_to_concat_from_outbuffer (0, buffer->idx + 1);
+       return_trace (false);
+     }
+ 
++    j = (unsigned) c->last_base;
++
+     /* Checking that matched glyph is actually a ligature by GDEF is too strong; disabled */
+-    //if (!_hb_glyph_info_is_ligature (&buffer->info[skippy_iter.idx])) { return_trace (false); }
++    //if (!_hb_glyph_info_is_ligature (&buffer->info[j])) { return_trace (false); }
+ 
+-    unsigned int j = skippy_iter.idx;
+     unsigned int lig_index = (this+ligatureCoverage).get_coverage  (buffer->info[j].codepoint);
+     if (lig_index == NOT_COVERED)
+     {
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index 65de131..d9a068c 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -641,6 +641,9 @@ struct hb_ot_apply_context_t :
+   uint32_t random_state;
+ 
+ 
++  signed last_base = -1; // GPOS uses
++  unsigned last_base_until = 0; // GPOS uses
++
+   hb_ot_apply_context_t (unsigned int table_index_,
+ 			 hb_font_t *font_,
+ 			 hb_buffer_t *buffer_) :
+@@ -673,7 +676,7 @@ struct hb_ot_apply_context_t :
+     iter_context.init (this, true);
+   }
+ 
+-  void set_lookup_mask (hb_mask_t mask) { lookup_mask = mask; init_iters (); }
++  void set_lookup_mask (hb_mask_t mask) { lookup_mask = mask; last_base = -1; last_base_until = 0; init_iters (); }
+   void set_auto_zwj (bool auto_zwj_) { auto_zwj = auto_zwj_; init_iters (); }
+   void set_auto_zwnj (bool auto_zwnj_) { auto_zwnj = auto_zwnj_; init_iters (); }
+   void set_random (bool random_) { random = random_; }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index bdbb322e42..f7dc61ebd5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -13,7 +13,9 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2022-33068.patch \
-           file://0001-Fix-conditional.patch"
+           file://0001-Fix-conditional.patch \
+           file://CVE-2023-25193-pre1.patch \
+           file://CVE-2023-25193.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.25.1


