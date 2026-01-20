Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07957D2ED1B
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5041.1768910958250106107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Um9KEsuW;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso44009905e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910956; x=1769515756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UrqJr1TTWp36RFih9mEq60Ynmchr9fLnTbNCkpppUgY=;
        b=Um9KEsuWNZS8EBdXuN+zik74DBKZXqVLdUedK2crvtb0Pp6WCS8VLAPFf84ZVTWxBo
         GZ6Ldc9J7XbIOA3nr8rP3yxA29V7Kk5vnwOaBxd3U2ojIx7hGYYB2utcz8SeyD6DP0ix
         asAYNkyaza/bHLO5dFoHZK9CvXpi8glYFaNo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910956; x=1769515756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UrqJr1TTWp36RFih9mEq60Ynmchr9fLnTbNCkpppUgY=;
        b=RVzCkCO+4SCwuHqubq/w5OXkLQ5t3Ci8VytGy5E1I7kFLUSYgwtyOtkfhMGDgDRR3P
         swSk4kVci9E6k8eMg7YY4WWpg8ue+OAaiZPGjXLrXCxIYcSF86qE0JUEynHCVoQYAzUz
         4j1kYAJBpxXkXaBWBMKIP+1phSq0aM7SqcudypCtteL43llUi9EF5Rn+fa0psnPHvnLv
         8a36Le1tcAEmdRKD22yaY5xRU8Hm9h9FUazJRMyprfALVrZe2VD1Nlyr+OwUKUo2jb0X
         ci+5ZTv4ebigcuECOt1ibqHFGyuiUlemJMCfJu+PjhtH9W/52N3QS5wRoNHhJvvKr8d3
         xW7A==
X-Gm-Message-State: AOJu0Yw7gm9CHYx22eYQmj6XQSeaDAWfHTlBC1PhP9YXC2tR7wiz/UTR
	jc6KFrk1hQG1HoVAlQej5y9O4a8+NdafF/IxjOPcFN117Ty7oBoNkH+reyNepCd8dSiRRhtPbNW
	zQYZl
X-Gm-Gg: AZuq6aL+8Y/PfQBAwptLbxG+LuzYNtUsJW4x7uIBehe5jdYhfZFwDXNPqZxSeXnBgOj
	Ezsl2n3TWcpxxUIkKKdL69/iQRAVq+LpdtwUIL4o+UMP9LHTt53DVBBr9wTGFcq5to9cD4nAOOp
	50baIdmSVchu1kyk2UnGLPPXIVGoHb6VomWGCUFF2/n20zNqWxyd+cruX6uHAvYmxSGa/bxognz
	AtTVqyv87tUfe0xcAhBdymLcYkNJ/p7WNfCpEXH3J+ZlQ5+cyqGrTG/qLJE36KHjM8EFne1bkvx
	iOEdnADn+Lwdm1SCKvtsplRxbliW/xOw2MryYQKCa332PzbbzxrezLalvw115qN8sdYzfcBMIo0
	9Rh43LQYIk1sgXNAKcdgReNqSPidWpXjSGr0aFHmmaSbVI4T9qAu+sIVdiqTX7PbDUyt099XES2
	+Bohom1aeegoukbyNbwDU1xz0u8gROmrTPKwxkZLJwOXuNboZnmPAkyNXOgE0NClw1L63Jm8k6C
	KTXUh0CSnGXleznugMubw==
X-Received: by 2002:a05:6000:186f:b0:432:7d2a:2be4 with SMTP id ffacd0b85a97d-4358ff6fb27mr2282772f8f.60.1768910956174;
        Tue, 20 Jan 2026 04:09:16 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/22] glib-2.0: patch CVE-2025-14087
Date: Tue, 20 Jan 2026 13:08:20 +0100
Message-ID: <ca9d8b3d71615c26f8cf7aa2814cb697c5e6c872.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229684

From: Peter Marko <peter.marko@siemens.com>

Pick commits from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4933
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3834

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |  69 +++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 +++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   3 +
 4 files changed, 462 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
new file mode 100644
index 0000000000..6ff7747018
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
+@@ -597,7 +597,7 @@ ast_resolve (AST     *ast,
+ {
+   GVariant *value;
+   gchar *pattern;
+-  gint i, j = 0;
++  size_t i, j = 0;
+ 
+   pattern = ast_get_pattern (ast, error);
+ 
+@@ -1621,9 +1621,9 @@ string_free (AST *ast)
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
+@@ -1684,7 +1684,7 @@ string_parse (TokenStream  *stream,
+   gsize length;
+   gchar quote;
+   gchar *str;
+-  gint i, j;
++  size_t i, j;
+ 
+   token_stream_start_ref (stream, &ref);
+   token = token_stream_get (stream);
+@@ -1814,7 +1814,7 @@ bytestring_parse (TokenStream  *stream,
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
index 0000000000..787c2564ab
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
+@@ -650,9 +650,9 @@ static AST *parse (TokenStream  *stream,
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
+@@ -661,10 +661,10 @@ ast_array_append (AST  ***array,
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
+@@ -673,11 +673,11 @@ ast_array_free (AST  **array,
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
+@@ -709,7 +709,7 @@ ast_array_get_pattern (AST    **array,
+          * pair of values.
+          */
+         {
+-          int j = 0;
++          size_t j = 0;
+ 
+           while (TRUE)
+             {
+@@ -957,7 +957,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Array;
+ 
+ static gchar *
+@@ -990,7 +990,7 @@ array_get_value (AST                 *ast,
+   Array *array = (Array *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_array (type))
+     return ast_type_error (ast, type, error);
+@@ -1076,7 +1076,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Tuple;
+ 
+ static gchar *
+@@ -1086,7 +1086,7 @@ tuple_get_pattern (AST     *ast,
+   Tuple *tuple = (Tuple *) ast;
+   gchar *result = NULL;
+   gchar **parts;
+-  gint i;
++  size_t i;
+ 
+   parts = g_new (gchar *, tuple->n_children + 4);
+   parts[tuple->n_children + 1] = (gchar *) ")";
+@@ -1116,7 +1116,7 @@ tuple_get_value (AST                 *ast,
+   Tuple *tuple = (Tuple *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_tuple (type))
+     return ast_type_error (ast, type, error);
+@@ -1308,9 +1308,16 @@ typedef struct
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
+@@ -1325,7 +1332,7 @@ dictionary_get_pattern (AST     *ast,
+     return g_strdup ("Ma{**}");
+ 
+   key_pattern = ast_array_get_pattern (dict->keys,
+-                                       abs (dict->n_children),
++                                       (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? 1 : dict->n_children,
+                                        error);
+ 
+   if (key_pattern == NULL)
+@@ -1356,7 +1363,7 @@ dictionary_get_pattern (AST     *ast,
+     return NULL;
+ 
+   result = g_strdup_printf ("M%s{%c%s}",
+-                            dict->n_children > 0 ? "a" : "",
++                            (dict->n_children > 0 && dict->n_children != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? "a" : "",
+                             key_char, value_pattern);
+   g_free (value_pattern);
+ 
+@@ -1370,7 +1377,7 @@ dictionary_get_value (AST                 *ast,
+ {
+   Dictionary *dict = (Dictionary *) ast;
+ 
+-  if (dict->n_children == -1)
++  if (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY)
+     {
+       const GVariantType *subtype;
+       GVariantBuilder builder;
+@@ -1403,7 +1410,7 @@ dictionary_get_value (AST                 *ast,
+     {
+       const GVariantType *entry, *key, *val;
+       GVariantBuilder builder;
+-      gint i;
++      size_t i;
+ 
+       if (!g_variant_type_is_subtype_of (type, G_VARIANT_TYPE_DICTIONARY))
+         return ast_type_error (ast, type, error);
+@@ -1444,12 +1451,12 @@ static void
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
+@@ -1467,7 +1474,7 @@ dictionary_parse (TokenStream  *stream,
+     maybe_wrapper, dictionary_get_value,
+     dictionary_free
+   };
+-  gint n_keys, n_values;
++  size_t n_keys, n_values;
+   gboolean only_one;
+   Dictionary *dict;
+   AST *first;
+@@ -1510,7 +1517,7 @@ dictionary_parse (TokenStream  *stream,
+         goto error;
+ 
+       g_assert (n_keys == 1 && n_values == 1);
+-      dict->n_children = -1;
++      dict->n_children = DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY;
+ 
+       return (AST *) dict;
+     }
+@@ -1543,6 +1550,7 @@ dictionary_parse (TokenStream  *stream,
+     }
+ 
+   g_assert (n_keys == n_values);
++  g_assert (n_keys != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY);
+   dict->n_children = n_keys;
+ 
+   return (AST *) dict;
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
new file mode 100644
index 0000000000..38348c0927
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
+@@ -91,7 +91,9 @@ g_variant_parser_get_error_quark (void)
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
+@@ -106,14 +108,16 @@ parser_set_error_va (GError      **error,
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
+@@ -140,11 +144,15 @@ parser_set_error (GError      **error,
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
+@@ -175,7 +183,7 @@ token_stream_set_error (TokenStream  *stream,
+ static gboolean
+ token_stream_prepare (TokenStream *stream)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+   const gchar *end;
+ 
+   if (stream->this != NULL)
+@@ -405,7 +413,7 @@ static void
+ pattern_copy (gchar       **out,
+               const gchar **in)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+ 
+   while (**in == 'a' || **in == 'm' || **in == 'M')
+     *(*out)++ = *(*in)++;
+@@ -2742,7 +2750,7 @@ g_variant_builder_add_parsed (GVariantBuilder *builder,
+ static gboolean
+ parse_num (const gchar *num,
+            const gchar *limit,
+-           guint       *result)
++           size_t      *result)
+ {
+   gchar *endptr;
+   gint64 bignum;
+@@ -2752,10 +2760,12 @@ parse_num (const gchar *num,
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
+@@ -2766,7 +2776,7 @@ add_last_line (GString     *err,
+ {
+   const gchar *last_nl;
+   gchar *chomped;
+-  gint i;
++  size_t i;
+ 
+   /* This is an error at the end of input.  If we have a file
+    * with newlines, that's probably the empty string after the
+@@ -2911,7 +2921,7 @@ g_variant_parse_error_print_context (GError      *error,
+ 
+   if (dash == NULL || colon < dash)
+     {
+-      guint point;
++      size_t point;
+ 
+       /* we have a single point */
+       if (!parse_num (error->message, colon, &point))
+@@ -2929,7 +2939,7 @@ g_variant_parse_error_print_context (GError      *error,
+       /* We have one or two ranges... */
+       if (comma && comma < colon)
+         {
+-          guint start1, end1, start2, end2;
++          size_t start1, end1, start2, end2;
+           const gchar *dash2;
+ 
+           /* Two ranges */
+@@ -2945,7 +2955,7 @@ g_variant_parse_error_print_context (GError      *error,
+         }
+       else
+         {
+-          guint start, end;
++          size_t start, end;
+ 
+           /* One range */
+           if (!parse_num (error->message, dash, &start) || !parse_num (dash + 1, colon, &end))
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index e80ddab4d6..f4df61c896 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -35,6 +35,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-6052-03.patch \
            file://CVE-2025-13601-01.patch \
            file://CVE-2025-13601-02.patch \
+           file://CVE-2025-14087-01.patch \
+           file://CVE-2025-14087-02.patch \
+           file://CVE-2025-14087-03.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

