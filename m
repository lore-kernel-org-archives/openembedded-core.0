Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933CBC7618D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:01:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.8779.1678888891891890454
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Uimye7C+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id i5so20135840pla.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678888891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DO65b+bW/A/tM3ooily17M5HEaZHeT2lb+yx3rl8Kl0=;
        b=Uimye7C+8oNzqZ4tftMHOLPfhss7drqD4BDjE7exGu2CR75bDD7a5J4wHqStNsRRVq
         YrCZsZrb+LoTZB+A6yhOKj6sZY1DuiLAr65AMsqXotW50VVcEKR8I8hi5j02u7Botn8G
         1FaR+tuv//1EglSk9ouEds9I30K3Qz5Xx2E3aHcp/w5iL2B3EFC1fnVs94w9/IR4AuGW
         R30IcpzHmaWjoYkOj5i/CRuqMm2nfg7jcV6tJb8i0IOjjzVpZ8YiEHLeRPyHZH8rZqFL
         gyx4pIVvovvYgeTMhmVFuAPVIHU1d0vh4CoK+UbcJ0o1j0O0axreN9/K6YVASbvWq78z
         oL0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678888891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO65b+bW/A/tM3ooily17M5HEaZHeT2lb+yx3rl8Kl0=;
        b=WNIN82licpPK1UOgSHAGeZBFYK+Man1ru2295Tp6Mod6FXFeOa9K9wyXNF48Th+6ae
         ndqbq5rNuK7rb6+NBfaw1ri0uVpBdaBb0PgaZ/3GjuxhryozP9fPJmoNv1/EElTJkQcu
         lEKAk/RY5L5Fvd1rPKoB82Qdz50QLc2mpZ/0wnVwisVgsVpsgh7s8mVX1bA10/WBHZhg
         qbG9iTYiLO339YaXSo6mrBohVi4Q7tFvA48Lu+rPkTKzIloyAOZjmfreDiZecZIYqefE
         BO8mXqOj1/1lphdjpwcYLR5dy3Ukfn9oAYWad8x5/sqUCSLo3tFjAAVDRWBfJ2yCe9S2
         55og==
X-Gm-Message-State: AO0yUKWwNDN4EiYAys8+vP2euQc/uFMeBSrI6fTwdCqsrQrqEtBpOX3f
	2Sn+9T+r/4W7WtbcAvkhpM8XypDer1OdQZNOOCw=
X-Google-Smtp-Source: AK7set9LWR3vQ/ujtkOGXorSdiHk8fu8L5YOxga1Qu+TCZZJOmStKxivieFmEk8WQyvPBVUTFt0mrA==
X-Received: by 2002:a17:902:e54c:b0:1a0:428b:d8c5 with SMTP id n12-20020a170902e54c00b001a0428bd8c5mr3186294plf.45.1678888890701;
        Wed, 15 Mar 2023 07:01:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902f54600b001a0432ca99csm3663755plf.269.2023.03.15.07.01.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 07:01:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/22] harfbuzz: Security fix for CVE-2023-25193
Date: Wed, 15 Mar 2023 04:00:55 -1000
Message-Id: <58e212a6109a639ca0675e73967da74d6c4c5aa3.1678888649.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678888649.git.steve@sakoman.com>
References: <cover.1678888649.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 14:01:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178555

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


