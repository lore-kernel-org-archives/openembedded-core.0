Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7106DC9830C
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6466.1768916287400707389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HooRoeVI;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so3713702f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916285; x=1769521085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxhpCNFrRzXpV0FHEcGKfqBUrkCV6U0qI63mBASk2Ro=;
        b=HooRoeVIaeoXUPRc3LB8nrSIW38CTpSs3kNgesDFANgf2tbTMr6uqDHUv7OcZlUPhj
         mU32ptNq2QzdqU12lMyh/btHiBxQBMVSaVsLcpF00B+k7DYjt98r/ihNu+9GkBcVhv+K
         ZD0gWchIqycYhNG/THcmoqh+ODMJ4jgcYgGso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916285; x=1769521085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxhpCNFrRzXpV0FHEcGKfqBUrkCV6U0qI63mBASk2Ro=;
        b=VmWpOJPU5gtUnTu70Q2rASH1SGFLx/k9b+XRmeHZyQnZZdnP4yqqkUQosIV9Mbr3yH
         bm1j7p+/7PNEF8RLRya2oZmzjH253B3qeVJzMJjDiM1lQAr41aMmTuF3WuAtL/dR5W9F
         MrBVpx3Yq+xVf1jiQ6TOlUQbne34Ikr4b22VVAr4hdSfgLlufUwXArDxPXtZuQNGxgVM
         wwfKafxD5vz39vZ9HzTTXG9m6800xWgY1WrGk2/gt7wVUkssA8NI79CfTtBZyeItxj09
         /DXG4FCNJyehTt+QatSa5CX3qG+H02eZoxXE9iS9dLaUwU5uyW35AJRWMSKIOgnyqHzt
         UC9g==
X-Gm-Message-State: AOJu0YwhxCe0iJfr/oiG8YZ3urgq0E+8NhunYRuiNGN0ZlPwAO1eWdPG
	MvMFJbngh8qBbpCjPUKO0rGm3DjGBgZrT94lJOuPXtHbdH/D1GvAVu9z3fW67dwdbw9Lcg33VIR
	YwmGN
X-Gm-Gg: AY/fxX79HHBI2hfB3EekDY0Uk89UgaqzbNdDHjmDAv5b5Pz0S/0fjWHEB8Hl328mS5t
	Gzuo1B0wenzxdLSgGpfHP+Cx/nN5D3ebWvij4kFuYBtyc95bAeL2K6jt/G6YoPDGP1C7tdewMRx
	BgioqHKs/jsXH59Su20zxbG0kBnqra7b28+oYpFx9F4xQCunJdhitBACzJsM8XqPhranjFhf6Xg
	Ags+1NYRYfRdMPMGbsZiceYn6NC7yX6UBo06qSfrEZkC3A9Iwy3a/m6R4zuTWPz0B5CEDUMVnbk
	Ci+5nzkdCJD35dzIgvulSOvc9HB8NrECMmNtWWLERzWx1y9p1wZQwkLJHdN7KKQJOkrg7VZ6ZwZ
	4NFBNU06eurGe+sAYXbtTqWqrWItiO2b2AYvGuW4hc+sb1JDqOEy1umY+zPEzwq7z9dMT+QIGCd
	lTLnaCD8x1cGOD15JaHiJWt3KcrOMFFa0FQH05K2cDrZmbaeY3+RFv/iZMegEYaU6m4dqZsJ+Dz
	pNy0gcsqA4im3MwpTbneBFz78xKUJzX
X-Received: by 2002:a05:600c:45d1:b0:477:7ae0:cd6e with SMTP id 5b1f17b1804b1-4801eab5602mr178036165e9.5.1768916285013;
        Tue, 20 Jan 2026 05:38:05 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:04 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/26] glib-2.0: patch CVE-2025-14087
Date: Tue, 20 Jan 2026 14:37:25 +0100
Message-ID: <c69806ec2a64175c4f8dc694d85f7dcd013a90d1.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229709

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4933
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3834

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |  69 +++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   3 +
 4 files changed, 462 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
new file mode 100644
index 0000000000..ec7b1fecaa
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
@@ -0,0 +1,69 @@
+From 31f82e22e21bae520b7228f7f57d357fb20df8a4 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:02:56 +0000
+Subject: [PATCH] gvariant-parser: Fix potential integer overflow parsing
+ (byte)strings
+
+The termination condition for parsing string and bytestring literals in
+GVariant text format input was subject to an integer overflow for input
+string (or bytestring) literals longer than `INT_MAX`.
+
+Fix that by counting as a `size_t` rather than as an `int`. The counter
+can never correctly be negative.
+
+Spotted by treeplus. Thanks to the Sovereign Tech Resilience programme
+from the Sovereign Tech Agency. ID: #YWH-PGM9867-145
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Fixes: #3834
+
+CVE: CVE-2025-14087
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/31f82e22e21bae520b7228f7f57d357fb20df8a4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gvariant-parser.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 2f1d3db9f..2d6e9856f 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -594,7 +594,7 @@ ast_resolve (AST     *ast,
+ {
+   GVariant *value;
+   gchar *pattern;
+-  gint i, j = 0;
++  size_t i, j = 0;
+ 
+   pattern = ast_get_pattern (ast, error);
+ 
+@@ -1555,9 +1555,9 @@ string_free (AST *ast)
+  * No leading/trailing space allowed. */
+ static gboolean
+ unicode_unescape (const gchar  *src,
+-                  gint         *src_ofs,
++                  size_t       *src_ofs,
+                   gchar        *dest,
+-                  gint         *dest_ofs,
++                  size_t       *dest_ofs,
+                   gsize         length,
+                   SourceRef    *ref,
+                   GError      **error)
+@@ -1618,7 +1618,7 @@ string_parse (TokenStream  *stream,
+   gsize length;
+   gchar quote;
+   gchar *str;
+-  gint i, j;
++  size_t i, j;
+ 
+   token_stream_start_ref (stream, &ref);
+   token = token_stream_get (stream);
+@@ -1748,7 +1748,7 @@ bytestring_parse (TokenStream  *stream,
+   gsize length;
+   gchar quote;
+   gchar *str;
+-  gint i, j;
++  size_t i, j;
+ 
+   token_stream_start_ref (stream, &ref);
+   token = token_stream_get (stream);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
new file mode 100644
index 0000000000..595f9c1b93
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
@@ -0,0 +1,240 @@
+From ac9de0871281cf734f6e269988f90a2521582a08 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:19:16 +0000
+Subject: [PATCH] gvariant-parser: Use size_t to count numbers of child
+ elements
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Rather than using `gint`, which could overflow for arrays (or dicts, or
+tuples) longer than `INT_MAX`. There may be other limits which prevent
+parsed containers becoming that long, but we might as well make the type
+system reflect the programmer’s intention as best it can anyway.
+
+For arrays and tuples this is straightforward. For dictionaries, it’s
+slightly complicated by the fact that the code used
+`dict->n_children == -1` to indicate that the `Dictionary` struct in
+question actually represented a single freestanding dict entry. In
+GVariant text format, that would be `{1, "one"}`.
+
+The implementation previously didn’t define the semantics of
+`dict->n_children < -1`.
+
+Now, instead, change `Dictionary.n_children` to `size_t`, and define a
+magic value `DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY` to indicate that
+the `Dictionary` represents a single freestanding dict entry.
+
+This magic value is `SIZE_MAX`, and given that a dictionary entry takes
+more than one byte to represent in GVariant text format, that means it’s
+not possible to have that many entries in a parsed dictionary, so this
+magic value won’t be hit by a normal dictionary. An assertion checks
+this anyway.
+
+Spotted while working on #3834.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-14087
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ac9de0871281cf734f6e269988f90a2521582a08]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gvariant-parser.c | 58 ++++++++++++++++++++++++------------------
+ 1 file changed, 33 insertions(+), 25 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 2d6e9856f..519baa3f3 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -647,9 +647,9 @@ static AST *parse (TokenStream  *stream,
+                    GError      **error);
+ 
+ static void
+-ast_array_append (AST  ***array,
+-                  gint   *n_items,
+-                  AST    *ast)
++ast_array_append (AST    ***array,
++                  size_t   *n_items,
++                  AST      *ast)
+ {
+   if ((*n_items & (*n_items - 1)) == 0)
+     *array = g_renew (AST *, *array, *n_items ? 2 ** n_items : 1);
+@@ -658,10 +658,10 @@ ast_array_append (AST  ***array,
+ }
+ 
+ static void
+-ast_array_free (AST  **array,
+-                gint   n_items)
++ast_array_free (AST    **array,
++                size_t   n_items)
+ {
+-  gint i;
++  size_t i;
+ 
+   for (i = 0; i < n_items; i++)
+     ast_free (array[i]);
+@@ -670,11 +670,11 @@ ast_array_free (AST  **array,
+ 
+ static gchar *
+ ast_array_get_pattern (AST    **array,
+-                       gint     n_items,
++                       size_t   n_items,
+                        GError **error)
+ {
+   gchar *pattern;
+-  gint i;
++  size_t i;
+ 
+   /* Find the pattern which applies to all children in the array, by l-folding a
+    * coalesce operation.
+@@ -706,7 +706,7 @@ ast_array_get_pattern (AST    **array,
+          * pair of values.
+          */
+         {
+-          int j = 0;
++          size_t j = 0;
+ 
+           while (TRUE)
+             {
+@@ -891,7 +891,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Array;
+ 
+ static gchar *
+@@ -924,7 +924,7 @@ array_get_value (AST                 *ast,
+   Array *array = (Array *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_array (type))
+     return ast_type_error (ast, type, error);
+@@ -1010,7 +1010,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Tuple;
+ 
+ static gchar *
+@@ -1020,7 +1020,7 @@ tuple_get_pattern (AST     *ast,
+   Tuple *tuple = (Tuple *) ast;
+   gchar *result = NULL;
+   gchar **parts;
+-  gint i;
++  size_t i;
+ 
+   parts = g_new (gchar *, tuple->n_children + 4);
+   parts[tuple->n_children + 1] = (gchar *) ")";
+@@ -1050,7 +1050,7 @@ tuple_get_value (AST                 *ast,
+   Tuple *tuple = (Tuple *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_tuple (type))
+     return ast_type_error (ast, type, error);
+@@ -1242,9 +1242,16 @@ typedef struct
+ 
+   AST **keys;
+   AST **values;
+-  gint n_children;
++
++  /* Iff this is DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY then this struct
++   * represents a single freestanding dict entry (`{1, "one"}`) rather than a
++   * full dict. In the freestanding case, @keys and @values have exactly one
++   * member each. */
++  size_t n_children;
+ } Dictionary;
+ 
++#define DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY ((size_t) -1)
++
+ static gchar *
+ dictionary_get_pattern (AST     *ast,
+                         GError **error)
+@@ -1259,7 +1266,7 @@ dictionary_get_pattern (AST     *ast,
+     return g_strdup ("Ma{**}");
+ 
+   key_pattern = ast_array_get_pattern (dict->keys,
+-                                       abs (dict->n_children),
++                                       (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? 1 : dict->n_children,
+                                        error);
+ 
+   if (key_pattern == NULL)
+@@ -1290,7 +1297,7 @@ dictionary_get_pattern (AST     *ast,
+     return NULL;
+ 
+   result = g_strdup_printf ("M%s{%c%s}",
+-                            dict->n_children > 0 ? "a" : "",
++                            (dict->n_children > 0 && dict->n_children != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? "a" : "",
+                             key_char, value_pattern);
+   g_free (value_pattern);
+ 
+@@ -1304,7 +1311,7 @@ dictionary_get_value (AST                 *ast,
+ {
+   Dictionary *dict = (Dictionary *) ast;
+ 
+-  if (dict->n_children == -1)
++  if (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY)
+     {
+       const GVariantType *subtype;
+       GVariantBuilder builder;
+@@ -1337,7 +1344,7 @@ dictionary_get_value (AST                 *ast,
+     {
+       const GVariantType *entry, *key, *val;
+       GVariantBuilder builder;
+-      gint i;
++      size_t i;
+ 
+       if (!g_variant_type_is_subtype_of (type, G_VARIANT_TYPE_DICTIONARY))
+         return ast_type_error (ast, type, error);
+@@ -1378,12 +1385,12 @@ static void
+ dictionary_free (AST *ast)
+ {
+   Dictionary *dict = (Dictionary *) ast;
+-  gint n_children;
++  size_t n_children;
+ 
+-  if (dict->n_children > -1)
+-    n_children = dict->n_children;
+-  else
++  if (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY)
+     n_children = 1;
++  else
++    n_children = dict->n_children;
+ 
+   ast_array_free (dict->keys, n_children);
+   ast_array_free (dict->values, n_children);
+@@ -1401,7 +1408,7 @@ dictionary_parse (TokenStream  *stream,
+     maybe_wrapper, dictionary_get_value,
+     dictionary_free
+   };
+-  gint n_keys, n_values;
++  size_t n_keys, n_values;
+   gboolean only_one;
+   Dictionary *dict;
+   AST *first;
+@@ -1444,7 +1451,7 @@ dictionary_parse (TokenStream  *stream,
+         goto error;
+ 
+       g_assert (n_keys == 1 && n_values == 1);
+-      dict->n_children = -1;
++      dict->n_children = DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY;
+ 
+       return (AST *) dict;
+     }
+@@ -1477,6 +1484,7 @@ dictionary_parse (TokenStream  *stream,
+     }
+ 
+   g_assert (n_keys == n_values);
++  g_assert (n_keys != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY);
+   dict->n_children = n_keys;
+ 
+   return (AST *) dict;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
new file mode 100644
index 0000000000..4a474f39fc
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
@@ -0,0 +1,150 @@
+From acaabfedff42e974334dd5368e6103d2845aaba6 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:25:58 +0000
+Subject: [PATCH] gvariant-parser: Convert error handling code to use size_t
+
+The error handling code allows for printing out the range of input bytes
+related to a parsing error. This was previously done using `gint`, but
+the input could be longer than `INT_MAX`, so it should really be done
+using `size_t`.
+
+Spotted while working on #3834.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-14087
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/acaabfedff42e974334dd5368e6103d2845aaba6]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gvariant-parser.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 519baa3f3..1b1ddd654 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -88,7 +88,9 @@ g_variant_parser_get_error_quark (void)
+ 
+ typedef struct
+ {
+-  gint start, end;
++  /* Offsets from the start of the input, in bytes. Can be equal when referring
++   * to a point rather than a range. The invariant `end >= start` always holds. */
++  size_t start, end;
+ } SourceRef;
+ 
+ G_GNUC_PRINTF(5, 0)
+@@ -103,14 +105,16 @@ parser_set_error_va (GError      **error,
+   GString *msg = g_string_new (NULL);
+ 
+   if (location->start == location->end)
+-    g_string_append_printf (msg, "%d", location->start);
++    g_string_append_printf (msg, "%" G_GSIZE_FORMAT, location->start);
+   else
+-    g_string_append_printf (msg, "%d-%d", location->start, location->end);
++    g_string_append_printf (msg, "%" G_GSIZE_FORMAT "-%" G_GSIZE_FORMAT,
++                            location->start, location->end);
+ 
+   if (other != NULL)
+     {
+       g_assert (other->start != other->end);
+-      g_string_append_printf (msg, ",%d-%d", other->start, other->end);
++      g_string_append_printf (msg, ",%" G_GSIZE_FORMAT "-%" G_GSIZE_FORMAT,
++                              other->start, other->end);
+     }
+   g_string_append_c (msg, ':');
+ 
+@@ -137,11 +141,15 @@ parser_set_error (GError      **error,
+ 
+ typedef struct
+ {
++  /* We should always have the following ordering constraint:
++   *   start <= this <= stream <= end
++   * Additionally, unless in an error or EOF state, `this < stream`.
++   */
+   const gchar *start;
+   const gchar *stream;
+   const gchar *end;
+ 
+-  const gchar *this;
++  const gchar *this;  /* (nullable) */
+ } TokenStream;
+ 
+ 
+@@ -172,7 +180,7 @@ token_stream_set_error (TokenStream  *stream,
+ static gboolean
+ token_stream_prepare (TokenStream *stream)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+   const gchar *end;
+ 
+   if (stream->this != NULL)
+@@ -402,7 +410,7 @@ static void
+ pattern_copy (gchar       **out,
+               const gchar **in)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+ 
+   while (**in == 'a' || **in == 'm' || **in == 'M')
+     *(*out)++ = *(*in)++;
+@@ -2666,7 +2674,7 @@ g_variant_builder_add_parsed (GVariantBuilder *builder,
+ static gboolean
+ parse_num (const gchar *num,
+            const gchar *limit,
+-           guint       *result)
++           size_t      *result)
+ {
+   gchar *endptr;
+   gint64 bignum;
+@@ -2676,10 +2684,12 @@ parse_num (const gchar *num,
+   if (endptr != limit)
+     return FALSE;
+ 
++  /* The upper bound here is more restrictive than it technically needs to be,
++   * but should be enough for any practical situation: */
+   if (bignum < 0 || bignum > G_MAXINT)
+     return FALSE;
+ 
+-  *result = (guint) bignum;
++  *result = (size_t) bignum;
+ 
+   return TRUE;
+ }
+@@ -2690,7 +2700,7 @@ add_last_line (GString     *err,
+ {
+   const gchar *last_nl;
+   gchar *chomped;
+-  gint i;
++  size_t i;
+ 
+   /* This is an error at the end of input.  If we have a file
+    * with newlines, that's probably the empty string after the
+@@ -2835,7 +2845,7 @@ g_variant_parse_error_print_context (GError      *error,
+ 
+   if (dash == NULL || colon < dash)
+     {
+-      guint point;
++      size_t point;
+ 
+       /* we have a single point */
+       if (!parse_num (error->message, colon, &point))
+@@ -2853,7 +2863,7 @@ g_variant_parse_error_print_context (GError      *error,
+       /* We have one or two ranges... */
+       if (comma && comma < colon)
+         {
+-          guint start1, end1, start2, end2;
++          size_t start1, end1, start2, end2;
+           const gchar *dash2;
+ 
+           /* Two ranges */
+@@ -2869,7 +2879,7 @@ g_variant_parse_error_print_context (GError      *error,
+         }
+       else
+         {
+-          guint start, end;
++          size_t start, end;
+ 
+           /* One range */
+           if (!parse_num (error->message, dash, &start) || !parse_num (dash + 1, colon, &end))
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 1c4c21614a..c5704a27bc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -66,6 +66,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-7039-02.patch \
            file://CVE-2025-13601-01.patch \
            file://CVE-2025-13601-02.patch \
+           file://CVE-2025-14087-01.patch \
+           file://CVE-2025-14087-02.patch \
+           file://CVE-2025-14087-03.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

