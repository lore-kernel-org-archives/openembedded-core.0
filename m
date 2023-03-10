Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9436C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 18:35:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.27581.1678473301225198054
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 10:35:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HWJCHGzU;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: sdoshi@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id ix20so59610plb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 10:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678473300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKLZPuUP5/XOJP5xQMuDUdy2bAE7u2TPgao/lgjDMK4=;
        b=HWJCHGzUGCKuUlLIxN93Lkynb5AsbDMxoKKxKyA/b3SWRn7nI4ldmlB+EiVLx07oG9
         3P99G4L4F4xhEs4xZRRrcMA+axjckGmfVMqmmH9jZrmmkGa2xu0hUSQOgWRZr6ESDlF3
         M5+bTY7cwhO1K4H/bT6kOOXYqKPV0UwzNPHTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678473300;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKLZPuUP5/XOJP5xQMuDUdy2bAE7u2TPgao/lgjDMK4=;
        b=Q7CAblBPsw+4ARenbJMV+79+9zdQtSP4Arg8tPpRdNJYV2rfA2rGrWPNXT63PhdTia
         yjlGmQ1WkIJmp7Ilk5e0OjeaaC6uOkY2oYrw0r09eB44EVLwGn8OMWUiiFiDBSh5vY0G
         p0m6/1kaMn5Bc+Xw4KQYXV+2PhlvGA9pALVCs1T0vvQKc2km6JMpolC+lyptUAKfVeYz
         Lo+cn/Vbo48LpI32h5KDf8XA8DKoIlLo50ON88p2pv1CTgoQQNEohRQ3kWaexYfb3Cac
         3thT7Z6wziJb891K2FQ9RTZdVjR4OPtISPUkoeAEsyTJGTjzF9xZ7JzkS41HRqVVmucW
         /R8Q==
X-Gm-Message-State: AO0yUKWjH1VbWM8L0fYH6RolTgwnkFoWowK+RFuVr0+2xtYnP6tEBrSp
	1RE6vyzxnUEeP3ywgGTkX2Eki/RuN35lx1bJ1/I=
X-Google-Smtp-Source: AK7set93yJFeLZu0BApTsmULV9XcY4PdFQO6eq1Yc5rtZTnfevsOt2C+TWn3zzhw6Rui25nPWp+4zg==
X-Received: by 2002:a17:90b:3b49:b0:234:56aa:f176 with SMTP id ot9-20020a17090b3b4900b0023456aaf176mr2475375pjb.24.1678473299830;
        Fri, 10 Mar 2023 10:34:59 -0800 (PST)
Received: from localhost.localdomain ([2409:4041:2d9e:cf00:64ea:421c:e3fb:5ce2])
        by smtp.gmail.com with ESMTPSA id ei8-20020a17090ae54800b0023b15e55569sm230458pjb.49.2023.03.10.10.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 10:34:59 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][langdale][PATCH] harfbuzz: Security fix for CVE-2023-25193
Date: Sat, 11 Mar 2023 00:04:50 +0530
Message-Id: <20230310183450.14185-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 18:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178341

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 191 ++++++++++++++++++
 .../harfbuzz/harfbuzz_5.1.0.bb                |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
new file mode 100644
index 0000000000..b72e23aa83
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,191 @@
+From 8708b9e081192786c027bb7f5f23d76dbe5c19e8 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Mon, 6 Feb 2023 14:51:25 -0700
+Subject: [PATCH] [GPOS] Avoid O(n^2) behavior in mark-attachment
+
+Better implementation; avoids arbitrary limit on look-back.
+Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
+CVE: CVE-2023-25193
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
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
+index c77ec12..b009f43 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -687,6 +687,9 @@ struct hb_ot_apply_context_t :
+   uint32_t random_state = 1;
+   unsigned new_syllables = (unsigned) -1;
+ 
++  signed last_base = -1; // GPOS uses
++  unsigned last_base_until = 0; // GPOS uses
++
+   hb_ot_apply_context_t (unsigned int table_index_,
+ 			 hb_font_t *font_,
+ 			 hb_buffer_t *buffer_) :
+@@ -724,7 +727,7 @@ struct hb_ot_apply_context_t :
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
index 8e06acc011..7227dd50b7 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_5.1.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6ee0f16281694fb6aa689cca1e0fb3da \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-fix-signedness-of-char-in-tests.patch \
+           file://CVE-2023-25193.patch \
            "
 SRC_URI[sha256sum] = "2edb95db668781aaa8d60959d21be2ff80085f31b12053cdd660d9a50ce84f05"
 
-- 
2.25.1


