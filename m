Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13A7C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 11:24:35 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.42872.1678533866980672521
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 03:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=aVpnk/I6;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id x11so8187567pln.12
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 03:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678533866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8xHX1+g7VyJTedbBAsuxgHdHwinWIBS+odWfbS8Rb00=;
        b=aVpnk/I6SEaLXtSral7gI48JoTLergHivxYprooZxQZ5XKHkCq/sAosBFgjRMHV1II
         kdbX6CYaanWbltUztpYvAW3ktOfNC6YLHog04c19Q9HjX8Io+TnfwGwt9vPretol5H7t
         tRaq7jPDrGpgqhvx0lo9qD/7w+Tli1SFdUiTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xHX1+g7VyJTedbBAsuxgHdHwinWIBS+odWfbS8Rb00=;
        b=7mr7EIMlzf8OqDRhw9r0QJSpgcbZyuoKWxuaCL+7+xWQ4TeBw+RbXCoJE2CNr1Azlq
         gQp8mqPtoawHW0cgtWX0YVYE/0SEFETKqeGdN4+5SZ9mRyf2Z2aLdFWcRSkARxbkBKAq
         lLM7F8MJUKXObM+tmOuEHyhRzAd8Xkse2hFLL6LBCbMtXVLGlWPxT/bGS7iw1p39g75e
         qgUnGrTHdrdAEzsKyXU02i5p8HrvSsuN2V88rnmp8ayiBlSKPe2jbEuIwfqkoqX/LJoR
         +DuinEp7VLsSoIHmkVkS7pJDZ2OIFvov61OhlzIxw8o1Ww0h4UFOF3up6WX5UMKj8yZ3
         UVrw==
X-Gm-Message-State: AO0yUKW6uLhwhd5MgE61k9s4rsdByVnPiVouc0xg0gbbIfoJOfS0T/o5
	/oUvCNrhXie9F7sX8PjEzCw0LPppqbI3d/Pj9+0=
X-Google-Smtp-Source: AK7set98PjIHZyfrRpuURSR9/IZSfDs6MKjR5q0n7xF6GvdJNnYAColYydTAl1mpvt2Tx968j7i3Xg==
X-Received: by 2002:a17:902:e844:b0:19c:ef4d:ea35 with SMTP id t4-20020a170902e84400b0019cef4dea35mr8899837plg.21.1678533865905;
        Sat, 11 Mar 2023 03:24:25 -0800 (PST)
Received: from localhost.localdomain ([49.34.214.220])
        by smtp.gmail.com with ESMTPSA id jz16-20020a170903431000b0019aa5e0aadesm1406945plb.110.2023.03.11.03.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:24:25 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth <sdoshi@mvista.com>
Subject: [OE-core][langdale][PATCHv2] harfbuzz: Security fix for CVE-2023-25193
Date: Sat, 11 Mar 2023 16:54:13 +0530
Message-Id: <20230311112413.142839-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 11:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178365

Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 ++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 192 ++++++++++++++++++
 .../harfbuzz/harfbuzz_5.1.0.bb                |   2 +
 3 files changed, 329 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
new file mode 100644
index 0000000000..47d2d7c270
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
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/hb-ot-layout-gsubgpos.hh | 94 +++++++++++++++++++++---------------
+ 1 file changed, 54 insertions(+), 40 deletions(-)
+
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index c77ec12..04b823e 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -532,33 +532,52 @@ struct hb_ot_apply_context_t :
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
++      matcher_t::may_match_t match = matcher.may_match (info, get_glyph_data ());
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
+-	hb_glyph_info_t &info = c->buffer->info[idx];
+-
+-	matcher_t::may_skip_t skip = matcher.may_skip (c, info);
+-	if (unlikely (skip == matcher_t::SKIP_YES))
+-	  continue;
+-
+-	matcher_t::may_match_t match = matcher.may_match (info, get_glyph_data ());
+-	if (match == matcher_t::MATCH_YES ||
+-	    (match == matcher_t::MATCH_MAYBE &&
+-	     skip == matcher_t::SKIP_NO))
+-	{
+-	  num_items--;
+-	  advance_glyph_data ();
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
++	    advance_glyph_data ();
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
+@@ -571,27 +590,22 @@ struct hb_ot_apply_context_t :
+       while (idx > num_items - 1)
+       {
+ 	idx--;
+-	hb_glyph_info_t &info = c->buffer->out_info[idx];
+-
+-	matcher_t::may_skip_t skip = matcher.may_skip (c, info);
+-	if (unlikely (skip == matcher_t::SKIP_YES))
+-	  continue;
+-
+-	matcher_t::may_match_t match = matcher.may_match (info, get_glyph_data ());
+-	if (match == matcher_t::MATCH_YES ||
+-	    (match == matcher_t::MATCH_MAYBE &&
+-	     skip == matcher_t::SKIP_NO))
+-	{
+-	  num_items--;
+-	  advance_glyph_data ();
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
++	    advance_glyph_data ();
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
index 0000000000..f5c5cf439d
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,192 @@
+From 8708b9e081192786c027bb7f5f23d76dbe5c19e8 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Mon, 6 Feb 2023 14:51:25 -0700
+Subject: [PATCH] [GPOS] Avoid O(n^2) behavior in mark-attachment
+
+Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
+Comment1: The Original Patch [https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc] causes regression and was reverted. This Patch completes the fix.
+CVE: CVE-2023-25193
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+
+---
+ src/OT/Layout/GPOS/MarkBasePosFormat1.hh | 76 +++++++++++++++---------
+ src/OT/Layout/GPOS/MarkLigPosFormat1.hh  | 24 ++++++--
+ src/hb-ot-layout-gsubgpos.hh             |  5 +-
+ 3 files changed, 69 insertions(+), 36 deletions(-)
+
+diff --git a/src/OT/Layout/GPOS/MarkBasePosFormat1.hh b/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
+index ebb8c31..73839a4 100644
+--- a/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
++++ b/src/OT/Layout/GPOS/MarkBasePosFormat1.hh
+@@ -90,6 +90,25 @@ struct MarkBasePosFormat1_2
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
+@@ -97,48 +116,47 @@ struct MarkBasePosFormat1_2
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
++
++    unsigned j;
++    for (j = buffer->idx; j > c->last_base_until; j--)
++    {
++      auto match = skippy_iter.match (buffer->info[j - 1]);
++      if (match == skippy_iter.MATCH)
+       {
+-        buffer->unsafe_to_concat_from_outbuffer (unsafe_from, buffer->idx + 1);
+-        return_trace (false);
++	if (!accept (buffer, j - 1))
++	  match = skippy_iter.SKIP;
+       }
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
++      return_trace (false);
++    }
+ 
+-      /* We only want to attach to the first of a MultipleSubst sequence.
+-       * https://github.com/harfbuzz/harfbuzz/issues/740
+-       * Reject others...
+-       * ...but stop if we find a mark in the MultipleSubst sequence:
+-       * https://github.com/harfbuzz/harfbuzz/issues/1020 */
+-      if (!_hb_glyph_info_multiplied (&buffer->info[skippy_iter.idx]) ||
+-          0 == _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx]) ||
+-          (skippy_iter.idx == 0 ||
+-           _hb_glyph_info_is_mark (&buffer->info[skippy_iter.idx - 1]) ||
+-           !_hb_glyph_info_multiplied (&buffer->info[skippy_iter.idx - 1]) ||
+-           _hb_glyph_info_get_lig_id (&buffer->info[skippy_iter.idx]) !=
+-           _hb_glyph_info_get_lig_id (&buffer->info[skippy_iter.idx - 1]) ||
+-           _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx]) !=
+-           _hb_glyph_info_get_lig_comp (&buffer->info[skippy_iter.idx - 1]) + 1
+-           ))
+-        break;
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
+diff --git a/src/OT/Layout/GPOS/MarkLigPosFormat1.hh b/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
+index 1a80212..4471871 100644
+--- a/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
++++ b/src/OT/Layout/GPOS/MarkLigPosFormat1.hh
+@@ -100,20 +100,32 @@ struct MarkLigPosFormat1_2
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
+index 04b823e..dc3c4b6 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -701,6 +701,9 @@ struct hb_ot_apply_context_t :
+   uint32_t random_state = 1;
+   unsigned new_syllables = (unsigned) -1;
+ 
++  signed last_base = -1; // GPOS uses
++  unsigned last_base_until = 0; // GPOS uses
++
+   hb_ot_apply_context_t (unsigned int table_index_,
+ 			 hb_font_t *font_,
+ 			 hb_buffer_t *buffer_) :
+@@ -738,7 +741,7 @@ struct hb_ot_apply_context_t :
+     iter_context.init (this, true);
+   }
+ 
+-  void set_lookup_mask (hb_mask_t mask) { lookup_mask = mask; init_iters (); }
++  void set_lookup_mask (hb_mask_t mask) { lookup_mask = mask; last_base = -1; last_base_until = 0; init_iters (); }
+   void set_auto_zwj (bool auto_zwj_) { auto_zwj = auto_zwj_; init_iters (); }
+   void set_auto_zwnj (bool auto_zwnj_) { auto_zwnj = auto_zwnj_; init_iters (); }
+   void set_per_syllable (bool per_syllable_) { per_syllable = per_syllable_; init_iters (); }
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
index 8e06acc011..0d68a4bf84 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-fix-signedness-of-char-in-tests.patch \
+           file://CVE-2023-25193-pre1.patch \
+           file://CVE-2023-25193.patch \
            "
 SRC_URI[sha256sum] = "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
 
-- 
2.25.1


