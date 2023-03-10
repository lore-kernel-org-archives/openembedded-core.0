Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472BFC6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:27:38 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.15332.1678440451528489911
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:27:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=b+YeARhk;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id fr5-20020a17090ae2c500b0023af8a036d2so8365960pjb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678440450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhSH/lRK0+y2sP5M7mPEbmm3Awcd9YdEj80brZADERw=;
        b=b+YeARhkHOMbU7d3iisK3oWGhEe1h6uxPKk0wz+OF7o4qMvAf/0XqiY6/Kz71r2xu8
         hB62k1Q+9fLULUGk9X7zWhre0UsP3UL67jDHRyCis1Ut9vcUiPNhtKnmFuNk+GUKu0vv
         HSUNRoXQKW0EGpLNtSAP/CB0mo8LgWflH1bMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678440450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhSH/lRK0+y2sP5M7mPEbmm3Awcd9YdEj80brZADERw=;
        b=ruaNzj6qVrN/5UCU32cCLzjRzyCs4137qQ7SbroYjmKnlpn7coJHTi5P6kbvAr437f
         jzL/7UYsBgCrdM+5cPowIKRsvEPlM5afq0PhJ8Fp/wATTaIXi3W+CCR0KOXQUmEjefBH
         hiQpLitDxfeOXRxzjrJvhBdS57R4AXeD/S63pEFi01qUmQ2zTnUzygmcGqh9VN/MLLnE
         xgfC7tLcjx631Etjdz20A5YvKuRX8ZoFkaYafUEnJoJKjYwW9QIKZ62Q3lVF95avUJdc
         uMPOCVKvXx3+Ok9W6mLRZx13RlINhXgkqAImYZ8BAQCaV0ISFTvxjCRkulQHfYJEqTz1
         ZSqQ==
X-Gm-Message-State: AO0yUKV9JDSj59x63ScGB/N+G+zv1wnc4nzQKewPXvIuEDGBZULFAI4j
	QODVvXW0vluM5eUnEjqsEreslZN+oAnronYP16s=
X-Google-Smtp-Source: AK7set99sEpsA9WVIy5+ib8bWvUbUAKq76fFgl9qAvrKcMouWEtmYTJdoYZOH4MAhZxIIaiI0CuAxg==
X-Received: by 2002:a17:902:ce89:b0:19e:6cb9:4c8f with SMTP id f9-20020a170902ce8900b0019e6cb94c8fmr30953994plg.41.1678440450147;
        Fri, 10 Mar 2023 01:27:30 -0800 (PST)
Received: from localhost.localdomain ([49.34.95.216])
        by smtp.gmail.com with ESMTPSA id kh6-20020a170903064600b00194d2f14ef0sm1018214plb.23.2023.03.10.01.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:27:29 -0800 (PST)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH] harfbuzz: Security fix for CVE-2023-25193
Date: Fri, 10 Mar 2023 14:57:18 +0530
Message-Id: <20230310092718.138315-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178314

From: Siddharth Doshi <sdoshi@mvista.com>

Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/8708b9e081192786c027bb7f5f23d76dbe5c19e8]
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../harfbuzz/CVE-2023-25193-pre0.patch        | 335 ++++++++++++++++++
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 +++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 179 ++++++++++
 .../harfbuzz/harfbuzz_2.6.4.bb                |   5 +-
 4 files changed, 653 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre0.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre0.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre0.patch
new file mode 100644
index 0000000000..90d4cfefb4
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre0.patch
@@ -0,0 +1,335 @@
+From 3122c2cdc45a964efedad8953a2df67205c3e3a8 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Sat, 4 Dec 2021 19:50:33 -0800
+Subject: [PATCH] [buffer] Add HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
+
+Fixes https://github.com/harfbuzz/harfbuzz/issues/1463
+Upstream-Status: Backport from [https://github.com/harfbuzz/harfbuzz/commit/3122c2cdc45a964efedad8953a2df67205c3e3a8]
+Comment1: To backport the fix for CVE-2023-25193, add defination for HB_GLYPH_FLAG_UNSAFE_TO_CONCAT. This patch is needed along with CVE-2023-25193-pre1.patch for sucessfull porting.
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ src/hb-buffer.cc             | 10 ++---
+ src/hb-buffer.h              | 76 ++++++++++++++++++++++++++++++------
+ src/hb-buffer.hh             | 33 ++++++++++------
+ src/hb-ot-layout-gsubgpos.hh | 39 +++++++++++++++---
+ src/hb-ot-shape.cc           |  8 +---
+ 5 files changed, 124 insertions(+), 42 deletions(-)
+
+diff --git a/src/hb-buffer.cc b/src/hb-buffer.cc
+index 6131c86..bba5eae 100644
+--- a/src/hb-buffer.cc
++++ b/src/hb-buffer.cc
+@@ -610,14 +610,14 @@ done:
+ }
+ 
+ void
+-hb_buffer_t::unsafe_to_break_impl (unsigned int start, unsigned int end)
++hb_buffer_t::unsafe_to_break_impl (unsigned int start, unsigned int end, hb_mask_t mask)
+ {
+   unsigned int cluster = (unsigned int) -1;
+   cluster = _unsafe_to_break_find_min_cluster (info, start, end, cluster);
+-  _unsafe_to_break_set_mask (info, start, end, cluster);
++  _unsafe_to_break_set_mask (info, start, end, cluster, mask);
+ }
+ void
+-hb_buffer_t::unsafe_to_break_from_outbuffer (unsigned int start, unsigned int end)
++hb_buffer_t::unsafe_to_break_from_outbuffer (unsigned int start, unsigned int end, hb_mask_t mask)
+ {
+   if (!have_output)
+   {
+@@ -631,8 +631,8 @@ hb_buffer_t::unsafe_to_break_from_outbuffer (unsigned int start, unsigned int en
+   unsigned int cluster = (unsigned int) -1;
+   cluster = _unsafe_to_break_find_min_cluster (out_info, start, out_len, cluster);
+   cluster = _unsafe_to_break_find_min_cluster (info, idx, end, cluster);
+-  _unsafe_to_break_set_mask (out_info, start, out_len, cluster);
+-  _unsafe_to_break_set_mask (info, idx, end, cluster);
++  _unsafe_to_break_set_mask (out_info, start, out_len, cluster, mask);
++  _unsafe_to_break_set_mask (info, idx, end, cluster, mask);
+ }
+ 
+ void
+diff --git a/src/hb-buffer.h b/src/hb-buffer.h
+index d5cb746..42dc92a 100644
+--- a/src/hb-buffer.h
++++ b/src/hb-buffer.h
+@@ -77,26 +77,76 @@ typedef struct hb_glyph_info_t
+  * @HB_GLYPH_FLAG_UNSAFE_TO_BREAK: Indicates that if input text is broken at the
+  * 				   beginning of the cluster this glyph is part of,
+  * 				   then both sides need to be re-shaped, as the
+- * 				   result might be different.  On the flip side,
+- * 				   it means that when this flag is not present,
+- * 				   then it's safe to break the glyph-run at the
+- * 				   beginning of this cluster, and the two sides
+- * 				   represent the exact same result one would get
+- * 				   if breaking input text at the beginning of
+- * 				   this cluster and shaping the two sides
+- * 				   separately.  This can be used to optimize
+- * 				   paragraph layout, by avoiding re-shaping
+- * 				   of each line after line-breaking, or limiting
+- * 				   the reshaping to a small piece around the
+- * 				   breaking point only.
++ * 				   result might be different.
++ *
++ * 				   On the flip side, it means that when this
++ * 				   flag is not present, then it is safe to break
++ * 				   the glyph-run at the beginning of this
++ * 				   cluster, and the two sides will represent the
++ * 				   exact same result one would get if breaking
++ * 				   input text at the beginning of this cluster
++ * 				   and shaping the two sides separately.
++ *
++ * 				   This can be used to optimize paragraph
++ * 				   layout, by avoiding re-shaping of each line
++ * 				   after line-breaking.
++ *
++ * @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT: Indicates that if input text is changed on one
++ * 				   side of the beginning of the cluster this glyph
++ * 				   is part of, then the shaping results for the
++ * 				   other side might change.
++ *
++ * 				   Note that the absence of this flag will NOT by
++ * 				   itself mean that it IS safe to concat text.
++ * 				   Only two pieces of text both of which clear of
++ * 				   this flag can be concatenated safely.
++ *
++ * 				   This can be used to optimize paragraph
++ * 				   layout, by avoiding re-shaping of each line
++ * 				   after line-breaking, by limiting the
++ * 				   reshaping to a small piece around the
++ * 				   breaking positin only, even if the breaking
++ * 				   position carries the
++ * 				   #HB_GLYPH_FLAG_UNSAFE_TO_BREAK or when
++ * 				   hyphenation or other text transformation
++ * 				   happens at line-break position, in the following
++ * 				   way:
++ *
++ * 				   1. Iterate back from the line-break position till
++ * 				   the the first cluster start position that is
++ * 				   NOT unsafe-to-concat, 2. shape the segment from
++ * 				   there till the end of line, 3. check whether the
++ * 				   resulting glyph-run also is clear of the
++ * 				   unsafe-to-concat at its start-of-text position;
++ * 				   if it is, just splice it into place and the line
++ * 				   is shaped; If not, move on to a position further
++ * 				   back that is clear of unsafe-to-concat and retry
++ * 				   from there, and repeat.
++ *
++ * 				   At the start of next line a similar algorithm can
++ * 				   be implemented. A slight complication will arise,
++ * 				   because while our buffer API has a way to
++ * 				   return flags for position corresponding to
++ * 				   start-of-text, there is currently no position
++ * 				   corresponding to end-of-text.  This limitation
++ * 				   can be alleviated by shaping more text than needed
++ * 				   and looking for unsafe-to-concat flag within text
++ * 				   clusters.
++ *
++ * 				   The #HB_GLYPH_FLAG_UNSAFE_TO_BREAK flag will
++ * 				   always imply this flag.
++ *
++ * 				   Since: REPLACEME
++ *
+  * @HB_GLYPH_FLAG_DEFINED: All the currently defined flags.
+  *
+  * Since: 1.5.0
+  */
+ typedef enum { /*< flags >*/
+   HB_GLYPH_FLAG_UNSAFE_TO_BREAK		= 0x00000001,
++  HB_GLYPH_FLAG_UNSAFE_TO_CONCAT	= 0x00000002,
+ 
+-  HB_GLYPH_FLAG_DEFINED			= 0x00000001 /* OR of all defined flags */
++  HB_GLYPH_FLAG_DEFINED			= 0x00000003 /* OR of all defined flags */
+ } hb_glyph_flags_t;
+ 
+ HB_EXTERN hb_glyph_flags_t
+diff --git a/src/hb-buffer.hh b/src/hb-buffer.hh
+index b5596d9..beac7b6 100644
+--- a/src/hb-buffer.hh
++++ b/src/hb-buffer.hh
+@@ -67,8 +67,8 @@ enum hb_buffer_scratch_flags_t {
+   HB_BUFFER_SCRATCH_FLAG_HAS_DEFAULT_IGNORABLES		= 0x00000002u,
+   HB_BUFFER_SCRATCH_FLAG_HAS_SPACE_FALLBACK		= 0x00000004u,
+   HB_BUFFER_SCRATCH_FLAG_HAS_GPOS_ATTACHMENT		= 0x00000008u,
+-  HB_BUFFER_SCRATCH_FLAG_HAS_UNSAFE_TO_BREAK		= 0x00000010u,
+-  HB_BUFFER_SCRATCH_FLAG_HAS_CGJ			= 0x00000020u,
++  HB_BUFFER_SCRATCH_FLAG_HAS_CGJ			= 0x00000010u,
++  HB_BUFFER_SCRATCH_FLAG_HAS_GLYPH_FLAGS		= 0x00000020u,
+ 
+   /* Reserved for complex shapers' internal use. */
+   HB_BUFFER_SCRATCH_FLAG_COMPLEX0			= 0x01000000u,
+@@ -324,8 +324,19 @@ struct hb_buffer_t
+       return;
+     unsafe_to_break_impl (start, end);
+   }
+-  HB_INTERNAL void unsafe_to_break_impl (unsigned int start, unsigned int end);
+-  HB_INTERNAL void unsafe_to_break_from_outbuffer (unsigned int start, unsigned int end);
++  void unsafe_to_concat (unsigned int start,
++			 unsigned int end)
++  {
++    if (end - start < 2)
++      return;
++    unsafe_to_break_impl (start, end, HB_GLYPH_FLAG_UNSAFE_TO_CONCAT);
++  }
++  HB_INTERNAL void unsafe_to_break_impl (unsigned int start, unsigned int end,
++					 hb_mask_t mask = HB_GLYPH_FLAG_UNSAFE_TO_BREAK | HB_GLYPH_FLAG_UNSAFE_TO_CONCAT);
++  HB_INTERNAL void unsafe_to_break_from_outbuffer (unsigned int start, unsigned int end,
++						   hb_mask_t mask = HB_GLYPH_FLAG_UNSAFE_TO_BREAK | HB_GLYPH_FLAG_UNSAFE_TO_CONCAT);
++  void unsafe_to_concat_from_outbuffer (unsigned int start, unsigned int end)
++  { unsafe_to_break_from_outbuffer (start, end, HB_GLYPH_FLAG_UNSAFE_TO_CONCAT); }
+ 
+ 
+   /* Internal methods */
+@@ -377,12 +388,7 @@ struct hb_buffer_t
+   set_cluster (hb_glyph_info_t &inf, unsigned int cluster, unsigned int mask = 0)
+   {
+     if (inf.cluster != cluster)
+-    {
+-      if (mask & HB_GLYPH_FLAG_UNSAFE_TO_BREAK)
+-	inf.mask |= HB_GLYPH_FLAG_UNSAFE_TO_BREAK;
+-      else
+-	inf.mask &= ~HB_GLYPH_FLAG_UNSAFE_TO_BREAK;
+-    }
++      inf.mask = (inf.mask & ~HB_GLYPH_FLAG_DEFINED) | (mask & HB_GLYPH_FLAG_DEFINED);
+     inf.cluster = cluster;
+   }
+ 
+@@ -398,13 +404,14 @@ struct hb_buffer_t
+   void
+   _unsafe_to_break_set_mask (hb_glyph_info_t *infos,
+ 			     unsigned int start, unsigned int end,
+-			     unsigned int cluster)
++			     unsigned int cluster,
++			     hb_mask_t mask)
+   {
+     for (unsigned int i = start; i < end; i++)
+       if (cluster != infos[i].cluster)
+       {
+-	scratch_flags |= HB_BUFFER_SCRATCH_FLAG_HAS_UNSAFE_TO_BREAK;
+-	infos[i].mask |= HB_GLYPH_FLAG_UNSAFE_TO_BREAK;
++	scratch_flags |= HB_BUFFER_SCRATCH_FLAG_HAS_GLYPH_FLAGS;
++	infos[i].mask |= mask;
+       }
+   }
+ 
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index 579d178..a6ca456 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -369,7 +369,7 @@ struct hb_ot_apply_context_t :
+     may_skip (const hb_glyph_info_t &info) const
+     { return matcher.may_skip (c, info); }
+ 
+-    bool next ()
++    bool next (unsigned *unsafe_to = nullptr)
+     {
+       assert (num_items > 0);
+       while (idx + num_items < end)
+@@ -392,11 +392,17 @@ struct hb_ot_apply_context_t :
+ 	}
+ 
+ 	if (skip == matcher_t::SKIP_NO)
++	{
++	  if (unsafe_to)
++	    *unsafe_to = idx + 1;
+ 	  return false;
++	}
+       }
++      if (unsafe_to)
++        *unsafe_to = end;
+       return false;
+     }
+-    bool prev ()
++    bool prev (unsigned *unsafe_from = nullptr)
+     {
+       assert (num_items > 0);
+       while (idx > num_items - 1)
+@@ -419,8 +425,14 @@ struct hb_ot_apply_context_t :
+ 	}
+ 
+ 	if (skip == matcher_t::SKIP_NO)
++	{
++	  if (unsafe_from)
++	    *unsafe_from = hb_max (1u, idx) - 1u;
+ 	  return false;
++	}
+       }
++      if (unsafe_from)
++        *unsafe_from = 0;
+       return false;
+     }
+ 
+@@ -834,7 +846,12 @@ static inline bool match_input (hb_ot_apply_context_t *c,
+   match_positions[0] = buffer->idx;
+   for (unsigned int i = 1; i < count; i++)
+   {
+-    if (!skippy_iter.next ()) return_trace (false);
++    unsigned unsafe_to;
++    if (!skippy_iter.next (&unsafe_to))
++    {
++      c->buffer->unsafe_to_concat (c->buffer->idx, unsafe_to);
++      return_trace (false);
++    }
+ 
+     match_positions[i] = skippy_iter.idx;
+ 
+@@ -1022,8 +1039,14 @@ static inline bool match_backtrack (hb_ot_apply_context_t *c,
+   skippy_iter.set_match_func (match_func, match_data, backtrack);
+ 
+   for (unsigned int i = 0; i < count; i++)
+-    if (!skippy_iter.prev ())
++  {
++    unsigned unsafe_from;
++    if (!skippy_iter.prev (&unsafe_from))
++    {
++      c->buffer->unsafe_to_concat_from_outbuffer (unsafe_from, c->buffer->idx);
+       return_trace (false);
++    }
++  }
+ 
+   *match_start = skippy_iter.idx;
+ 
+@@ -1045,8 +1068,14 @@ static inline bool match_lookahead (hb_ot_apply_context_t *c,
+   skippy_iter.set_match_func (match_func, match_data, lookahead);
+ 
+   for (unsigned int i = 0; i < count; i++)
+-    if (!skippy_iter.next ())
++  {
++    unsigned unsafe_to;
++    if (!skippy_iter.next (&unsafe_to))
++    {
++      c->buffer->unsafe_to_concat (c->buffer->idx + offset, unsafe_to);
+       return_trace (false);
++    }
++  }
+ 
+   *end_index = skippy_iter.idx + 1;
+ 
+diff --git a/src/hb-ot-shape.cc b/src/hb-ot-shape.cc
+index 5d9a70c..5d10b30 100644
+--- a/src/hb-ot-shape.cc
++++ b/src/hb-ot-shape.cc
+@@ -1008,7 +1008,7 @@ hb_propagate_flags (hb_buffer_t *buffer)
+   /* Propagate cluster-level glyph flags to be the same on all cluster glyphs.
+    * Simplifies using them. */
+ 
+-  if (!(buffer->scratch_flags & HB_BUFFER_SCRATCH_FLAG_HAS_UNSAFE_TO_BREAK))
++  if (!(buffer->scratch_flags & HB_BUFFER_SCRATCH_FLAG_HAS_GLYPH_FLAGS))
+     return;
+ 
+   hb_glyph_info_t *info = buffer->info;
+@@ -1017,11 +1017,7 @@ hb_propagate_flags (hb_buffer_t *buffer)
+   {
+     unsigned int mask = 0;
+     for (unsigned int i = start; i < end; i++)
+-      if (info[i].mask & HB_GLYPH_FLAG_UNSAFE_TO_BREAK)
+-      {
+-	 mask = HB_GLYPH_FLAG_UNSAFE_TO_BREAK;
+-	 break;
+-      }
++      mask |= info[i].mask & HB_GLYPH_FLAG_DEFINED;
+     if (mask)
+       for (unsigned int i = start; i < end; i++)
+ 	info[i].mask |= mask;
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
new file mode 100644
index 0000000000..4994e0ef68
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
+index a6ca456..5a7e564 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -369,33 +369,52 @@ struct hb_ot_apply_context_t :
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
+@@ -408,27 +427,22 @@ struct hb_ot_apply_context_t :
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
++	switch (match (c->buffer->out_info[idx]))
+ 	{
+-	  num_items--;
+-	  if (match_glyph_data) match_glyph_data++;
+-	  return true;
+-	}
+-
+-	if (skip == matcher_t::SKIP_NO)
+-	{
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
index 0000000000..8243117551
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,179 @@
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
+ src/hb-ot-layout-gpos-table.hh | 101 ++++++++++++++++++++++++---------
+ src/hb-ot-layout-gsubgpos.hh   |   5 +-
+ 2 files changed, 77 insertions(+), 29 deletions(-)
+
+diff --git a/src/hb-ot-layout-gpos-table.hh b/src/hb-ot-layout-gpos-table.hh
+index 024312d..88df13d 100644
+--- a/src/hb-ot-layout-gpos-table.hh
++++ b/src/hb-ot-layout-gpos-table.hh
+@@ -1458,6 +1458,25 @@ struct MarkBasePosFormat1
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
++          0 == _hb_glyph_info_get_lig_comp (&buffer->info[idx]) ||
++          (idx == 0 ||
++           _hb_glyph_info_is_mark (&buffer->info[idx - 1]) ||
++           !_hb_glyph_info_multiplied (&buffer->info[idx - 1]) ||
++           _hb_glyph_info_get_lig_id (&buffer->info[idx]) !=
++           _hb_glyph_info_get_lig_id (&buffer->info[idx - 1]) ||
++           _hb_glyph_info_get_lig_comp (&buffer->info[idx]) !=
++           _hb_glyph_info_get_lig_comp (&buffer->info[idx - 1]) + 1
++           );
++  }
++
+   bool apply (hb_ot_apply_context_t *c) const
+   {
+     TRACE_APPLY (this);
+@@ -1465,37 +1484,46 @@ struct MarkBasePosFormat1
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
+-      if (!skippy_iter.prev ()) return_trace (false);
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
++    unsigned j;
++    for (j = buffer->idx; j > c->last_base_until; j--)
++    {
++      auto match = skippy_iter.match (buffer->info[j - 1]);
++      if (match == skippy_iter.MATCH)
++      {
++       if (!accept (buffer, j - 1))
++         match = skippy_iter.SKIP;
++      }
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
++
++    unsigned idx = (unsigned) c->last_base;
+ 
+     /* Checking that matched glyph is actually a base glyph by GDEF is too strong; disabled */
+-    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[skippy_iter.idx])) { return_trace (false); }
++    //if (!_hb_glyph_info_is_base_glyph (&buffer->info[idx])) { return_trace (false); }
+ 
+-    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[skippy_iter.idx].codepoint);
++    unsigned int base_index = (this+baseCoverage).get_coverage  (buffer->info[idx].codepoint);
+     if (base_index == NOT_COVERED) return_trace (false);
++    {
++      buffer->unsafe_to_concat_from_outbuffer (idx, buffer->idx + 1);
++      return_trace (false);
++    }
+ 
+-    return_trace ((this+markArray).apply (c, mark_index, base_index, this+baseArray, classCount, skippy_iter.idx));
++    return_trace ((this+markArray).apply (c, mark_index, base_index, this+baseArray, classCount, idx));
+   }
+ 
+   bool subset (hb_subset_context_t *c) const
+@@ -1587,15 +1615,32 @@ struct MarkLigPosFormat1
+     if (likely (mark_index == NOT_COVERED)) return_trace (false);
+ 
+     /* Now we search backwards for a non-mark glyph */
++
+     hb_ot_apply_context_t::skipping_iterator_t &skippy_iter = c->iter_input;
+-    skippy_iter.reset (buffer->idx, 1);
+     skippy_iter.set_lookup_props (LookupFlag::IgnoreMarks);
+-    if (!skippy_iter.prev ()) return_trace (false);
++
++    unsigned j;
++    for (j = buffer->idx; j > c->last_base_until; j--)
++    {
++      auto match = skippy_iter.match (buffer->info[j - 1]);
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
++
++    j = (unsigned) c->last_base;
+ 
+     /* Checking that matched glyph is actually a ligature by GDEF is too strong; disabled */
+-    //if (!_hb_glyph_info_is_ligature (&buffer->info[skippy_iter.idx])) { return_trace (false); }
++    //if (!_hb_glyph_info_is_ligature (&buffer->info[idx])) { return_trace (false); }
+ 
+-    unsigned int j = skippy_iter.idx;
+     unsigned int lig_index = (this+ligatureCoverage).get_coverage  (buffer->info[j].codepoint);
+     if (lig_index == NOT_COVERED) return_trace (false);
+ 
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index 5a7e564..437123c 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -503,6 +503,9 @@ struct hb_ot_apply_context_t :
+   uint32_t random_state;
+ 
+ 
++  signed last_base = -1; // GPOS uses
++  unsigned last_base_until = 0; // GPOS uses
++
+   hb_ot_apply_context_t (unsigned int table_index_,
+ 		      hb_font_t *font_,
+ 		      hb_buffer_t *buffer_) :
+@@ -536,7 +539,7 @@ struct hb_ot_apply_context_t :
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
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
index ee08c12bee..0cfe01f1e5 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
@@ -7,7 +7,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz \
+           file://CVE-2023-25193-pre0.patch \
+           file://CVE-2023-25193-pre1.patch \
+           file://CVE-2023-25193.patch"
 SRC_URI[md5sum] = "2b3a4dfdb3e5e50055f941978944da9f"
 SRC_URI[sha256sum] = "9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12"
 
-- 
2.25.1


