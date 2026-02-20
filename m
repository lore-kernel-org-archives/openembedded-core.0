Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4B3C5ACD9
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 16:21:59 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1304.1771604515336189111
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 08:21:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=h//ps0Fv;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202602201621564edf55881a00020781-kdmsfj@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202602201621564edf55881a00020781
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 17:21:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=ZJevI+YXsNc42IChLojkm9X1UMzgGYHAwCnPKWK1u00=;
 b=h//ps0FvGdaS5zN2Fb95Y/sARVoFR3xoBw1VTFqN7jt9ltjluEE66nIwI6F8d9oeyo4UTT
 6HCJy1MmUm00BUfWOPJCtfqKZ9MyQ8xk4gGxh5ymx2FAhCA9MrZnUCV7i8+qhsH/N6p5g18K
 fgqY42pXor5V6T5NOOKQOTnKsuyptLHmJ2+HiFHrw4fhXKh+1iHoYLswn38HCvUev+OaabZN
 Rf6iqUw8o6wxkP1tOzVssQFEkZk30bVijQXP+2w5Yq/lXrDAA5RkNfMFMaQyxTbC8kazkZd7
 fF+1KyAteYbsh4BvG4E1SlOqwPgb1lBQzWin5fSuXdwtO6XKiqrD5zgg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] glib-2.0: patch CVE-2026-1489
Date: Fri, 20 Feb 2026 17:21:17 +0100
Message-Id: <20260220162117.8626-3-peter.marko@siemens.com>
In-Reply-To: <20260220162117.8626-1-peter.marko@siemens.com>
References: <20260220162117.8626-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 16:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231538

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3872
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4984

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +++
 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 ++
 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   4 +
 5 files changed, 434 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
new file mode 100644
index 00000000000..612bb8bec52
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
@@ -0,0 +1,42 @@
+From 662aa569efa65eaa4672ab0671eb8533a354cd89 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:00:17 +0100
+Subject: [PATCH] guniprop: Use size_t for output_marks length
+
+The input string length may overflow, and this would lead to wrong
+behavior and invalid writes.
+
+Spotted by treeplus.
+Thanks to the Sovereign Tech Resilience programme from the Sovereign
+Tech Agency.
+
+ID: #YWH-PGM9867-171
+Closes: #3872
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/662aa569efa65eaa4672ab0671eb8533a354cd89]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index fe0033fd6..1a0cc6408 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -753,13 +753,13 @@ get_locale_type (void)
+   return LOCALE_NORMAL;
+ }
+ 
+-static gint
++static size_t
+ output_marks (const char **p_inout,
+ 	      char        *out_buffer,
+ 	      gboolean     remove_dot)
+ {
+   const char *p = *p_inout;
+-  gint len = 0;
++  size_t len = 0;
+   
+   while (*p)
+     {
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
new file mode 100644
index 00000000000..7587a9e09e1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
@@ -0,0 +1,30 @@
+From 58356619525a1d565df8cc348e9784716f020f2f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:01:49 +0100
+Subject: [PATCH] guniprop: Do not convert size_t to gint
+
+We were correctly using size_t in output_special_case() since commit
+362f92b69, but then we converted the value back to int
+
+Related to: #3872
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/58356619525a1d565df8cc348e9784716f020f2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index 1a0cc6408..fe50a287c 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -779,7 +779,7 @@ output_marks (const char **p_inout,
+   return len;
+ }
+ 
+-static gint
++static size_t
+ output_special_case (gchar *out_buffer,
+ 		     int    offset,
+ 		     int    type,
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
new file mode 100644
index 00000000000..1755254ff7d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
@@ -0,0 +1,290 @@
+From 170dc8c4068db4c4cbf63c7d27192e230436da21 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Wed, 21 Jan 2026 22:04:22 +0100
+Subject: [PATCH] guniprop: Ensure we do not overflow size in
+ g_utf8_{strdown,gstrup}()
+
+While this is technically not a security issue, when repeatedly adding
+to a size_t value, we can overflow and start from 0.
+
+Now, while being unlikely, technically an utf8 lower or upper string can
+have a longer size than the input value, and if the output string is
+bigger than G_MAXSIZE we'd end up cutting it silently.
+
+Let's instead assert each time we increase the output length
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/170dc8c4068db4c4cbf63c7d27192e230436da21]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/guniprop.c | 109 +++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 70 insertions(+), 39 deletions(-)
+
+diff --git a/glib/guniprop.c b/glib/guniprop.c
+index fe50a287c..86020b6e0 100644
+--- a/glib/guniprop.c
++++ b/glib/guniprop.c
+@@ -753,14 +753,36 @@ get_locale_type (void)
+   return LOCALE_NORMAL;
+ }
+ 
+-static size_t
+-output_marks (const char **p_inout,
+-	      char        *out_buffer,
+-	      gboolean     remove_dot)
++static inline void
++increase_size (size_t *sizeptr, size_t add)
++{
++  g_assert (G_MAXSIZE - *(sizeptr) >= add);
++  *(sizeptr) += add;
++}
++
++static inline void
++append_utf8_char_to_buffer (gunichar  c,
++                            char     *out_buffer,
++                            size_t   *in_out_len)
++{
++  gint utf8_len;
++  char *buffer;
++
++  buffer = out_buffer ? out_buffer + *(in_out_len) : NULL;
++  utf8_len = g_unichar_to_utf8 (c, buffer);
++
++  g_assert (utf8_len >= 0);
++  increase_size (in_out_len, utf8_len);
++}
++
++static void
++append_mark (const char **p_inout,
++             char        *out_buffer,
++             size_t      *in_out_len,
++             gboolean     remove_dot)
+ {
+   const char *p = *p_inout;
+-  size_t len = 0;
+-  
++
+   while (*p)
+     {
+       gunichar c = g_utf8_get_char (p);
+@@ -768,7 +790,7 @@ output_marks (const char **p_inout,
+       if (ISMARK (TYPE (c)))
+ 	{
+ 	  if (!remove_dot || c != 0x307 /* COMBINING DOT ABOVE */)
+-	    len += g_unichar_to_utf8 (c, out_buffer ? out_buffer + len : NULL);
++            append_utf8_char_to_buffer (c, out_buffer, in_out_len);
+ 	  p = g_utf8_next_char (p);
+ 	}
+       else
+@@ -776,14 +798,14 @@ output_marks (const char **p_inout,
+     }
+ 
+   *p_inout = p;
+-  return len;
+ }
+ 
+-static size_t
+-output_special_case (gchar *out_buffer,
+-		     int    offset,
+-		     int    type,
+-		     int    which)
++static void
++append_special_case (char   *out_buffer,
++                     size_t *in_out_len,
++                     int     offset,
++                     int     type,
++                     int     which)
+ {
+   const gchar *p = special_case_table + offset;
+   gint len;
+@@ -795,10 +817,12 @@ output_special_case (gchar *out_buffer,
+     p += strlen (p) + 1;
+ 
+   len = strlen (p);
+-  if (out_buffer)
+-    memcpy (out_buffer, p, len);
++  g_assert (len < G_MAXSIZE - *in_out_len);
+ 
+-  return len;
++  if (out_buffer)
++    memcpy (out_buffer + *in_out_len, p, len);
++
++  increase_size (in_out_len, len);
+ }
+ 
+ static gsize
+@@ -839,11 +863,13 @@ real_toupper (const gchar *str,
+ 		  decomp_len = g_unichar_fully_decompose (c, FALSE, decomp, G_N_ELEMENTS (decomp));
+ 		  for (i=0; i < decomp_len; i++)
+ 		    {
++
+ 		      if (decomp[i] != 0x307 /* COMBINING DOT ABOVE */)
+-			len += g_unichar_to_utf8 (g_unichar_toupper (decomp[i]), out_buffer ? out_buffer + len : NULL);
++                        append_utf8_char_to_buffer (g_unichar_toupper (decomp[i]),
++                                                    out_buffer, &len);
+ 		    }
+-		  
+-		  len += output_marks (&p, out_buffer ? out_buffer + len : NULL, TRUE);
++
++                  append_mark (&p, out_buffer, &len, TRUE);
+ 
+ 		  continue;
+ 		}
+@@ -856,17 +882,17 @@ real_toupper (const gchar *str,
+       if (locale_type == LOCALE_TURKIC && c == 'i')
+ 	{
+ 	  /* i => LATIN CAPITAL LETTER I WITH DOT ABOVE */
+-	  len += g_unichar_to_utf8 (0x130, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (0x130, out_buffer, &len);
+ 	}
+       else if (c == 0x0345)	/* COMBINING GREEK YPOGEGRAMMENI */
+ 	{
+ 	  /* Nasty, need to move it after other combining marks .. this would go away if
+ 	   * we normalized first.
+ 	   */
+-	  len += output_marks (&p, out_buffer ? out_buffer + len : NULL, FALSE);
++          append_mark (&p, out_buffer, &len, TRUE);
+ 
+ 	  /* And output as GREEK CAPITAL LETTER IOTA */
+-	  len += g_unichar_to_utf8 (0x399, out_buffer ? out_buffer + len : NULL); 	  
++          append_utf8_char_to_buffer (0x399, out_buffer, &len);
+ 	}
+       else if (IS (t,
+ 		   OR (G_UNICODE_LOWERCASE_LETTER,
+@@ -877,8 +903,8 @@ real_toupper (const gchar *str,
+ 
+ 	  if (val >= 0x1000000)
+ 	    {
+-	      len += output_special_case (out_buffer ? out_buffer + len : NULL, val - 0x1000000, t,
+-					  t == G_UNICODE_LOWERCASE_LETTER ? 0 : 1);
++              append_special_case (out_buffer, &len, val - 0x1000000, t,
++                                   t == G_UNICODE_LOWERCASE_LETTER ? 0 : 1);
+ 	    }
+ 	  else
+ 	    {
+@@ -898,7 +924,7 @@ real_toupper (const gchar *str,
+ 	      /* Some lowercase letters, e.g., U+000AA, FEMININE ORDINAL INDICATOR,
+ 	       * do not have an uppercase equivalent, in which case val will be
+ 	       * zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -908,7 +934,7 @@ real_toupper (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -946,6 +972,8 @@ g_utf8_strup (const gchar *str,
+    * We use a two pass approach to keep memory management simple
+    */
+   result_len = real_toupper (str, len, NULL, locale_type);
++  g_assert (result_len < G_MAXSIZE);
++
+   result = g_malloc (result_len + 1);
+   real_toupper (str, len, result, locale_type);
+   result[result_len] = '\0';
+@@ -1003,14 +1031,15 @@ real_tolower (const gchar *str,
+             {
+               /* I + COMBINING DOT ABOVE => i (U+0069)
+                * LATIN CAPITAL LETTER I WITH DOT ABOVE => i (U+0069) */
+-              len += g_unichar_to_utf8 (0x0069, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (0x0069, out_buffer, &len);
++
+               if (combining_dot)
+                 p = g_utf8_next_char (p);
+             }
+           else
+             {
+               /* I => LATIN SMALL LETTER DOTLESS I */
+-              len += g_unichar_to_utf8 (0x131, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x131, out_buffer, &len);
+             }
+         }
+       /* Introduce an explicit dot above when lowercasing capital I's and J's
+@@ -1018,19 +1047,19 @@ real_tolower (const gchar *str,
+       else if (locale_type == LOCALE_LITHUANIAN && 
+                (c == 0x00cc || c == 0x00cd || c == 0x0128))
+         {
+-          len += g_unichar_to_utf8 (0x0069, out_buffer ? out_buffer + len : NULL); 
+-          len += g_unichar_to_utf8 (0x0307, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (0x0069, out_buffer, &len);
++          append_utf8_char_to_buffer (0x0307, out_buffer, &len);
+ 
+           switch (c)
+             {
+             case 0x00cc: 
+-              len += g_unichar_to_utf8 (0x0300, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0300, out_buffer, &len);
+               break;
+             case 0x00cd: 
+-              len += g_unichar_to_utf8 (0x0301, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0301, out_buffer, &len);
+               break;
+             case 0x0128: 
+-              len += g_unichar_to_utf8 (0x0303, out_buffer ? out_buffer + len : NULL); 
++              append_utf8_char_to_buffer (0x0303, out_buffer, &len);
+               break;
+             }
+         }
+@@ -1039,8 +1068,8 @@ real_tolower (const gchar *str,
+                 c == 'J' || c == G_UNICHAR_FULLWIDTH_J || c == 0x012e) &&
+                has_more_above (p))
+         {
+-          len += g_unichar_to_utf8 (g_unichar_tolower (c), out_buffer ? out_buffer + len : NULL); 
+-          len += g_unichar_to_utf8 (0x0307, out_buffer ? out_buffer + len : NULL); 
++          append_utf8_char_to_buffer (g_unichar_tolower (c), out_buffer, &len);
++          append_utf8_char_to_buffer (0x0307, out_buffer, &len);
+         }
+       else if (c == 0x03A3)	/* GREEK CAPITAL LETTER SIGMA */
+ 	{
+@@ -1063,7 +1092,7 @@ real_tolower (const gchar *str,
+ 	  else
+ 	    val = 0x3c2;	/* GREEK SMALL FINAL SIGMA */
+ 
+-	  len += g_unichar_to_utf8 (val, out_buffer ? out_buffer + len : NULL);
++          append_utf8_char_to_buffer (val, out_buffer, &len);
+ 	}
+       else if (IS (t,
+ 		   OR (G_UNICODE_UPPERCASE_LETTER,
+@@ -1074,7 +1103,7 @@ real_tolower (const gchar *str,
+ 
+ 	  if (val >= 0x1000000)
+ 	    {
+-	      len += output_special_case (out_buffer ? out_buffer + len : NULL, val - 0x1000000, t, 0);
++              append_special_case (out_buffer, &len, val - 0x1000000, t, 0);
+ 	    }
+ 	  else
+ 	    {
+@@ -1093,7 +1122,7 @@ real_tolower (const gchar *str,
+ 
+ 	      /* Not all uppercase letters are guaranteed to have a lowercase
+ 	       * equivalent.  If this is the case, val will be zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -1103,7 +1132,7 @@ real_tolower (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -1140,6 +1169,8 @@ g_utf8_strdown (const gchar *str,
+    * We use a two pass approach to keep memory management simple
+    */
+   result_len = real_tolower (str, len, NULL, locale_type);
++  g_assert (result_len < G_MAXSIZE);
++
+   result = g_malloc (result_len + 1);
+   real_tolower (str, len, result, locale_type);
+   result[result_len] = '\0';
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
new file mode 100644
index 00000000000..779d36ccda4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
@@ -0,0 +1,68 @@
+From b96966058f4291db8970ced70ee22103e63679e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Marco=20Trevisan=20=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
+Date: Fri, 23 Jan 2026 17:39:34 +0100
+Subject: [PATCH] glib/tests/unicode: Add test debug information when parsing
+ input files
+
+On case of failures makes it easier to understand on what line of the
+source file we're at, as it might not be clear for non-ascii chars
+
+CVE: CVE-2026-1489
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/b96966058f4291db8970ced70ee22103e63679e5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/tests/unicode.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/glib/tests/unicode.c b/glib/tests/unicode.c
+index 90b5a98b8..44d1083dd 100644
+--- a/glib/tests/unicode.c
++++ b/glib/tests/unicode.c
+@@ -546,6 +546,7 @@ test_casemap_and_casefold (void)
+   const char *locale;
+   const char *test;
+   const char *expected;
++  size_t line = 0;
+   char *convert;
+   char *current_locale = setlocale (LC_CTYPE, NULL);
+ 
+@@ -555,6 +556,7 @@ test_casemap_and_casefold (void)
+ 
+   while (fgets (buffer, sizeof (buffer), infile))
+     {
++      line++;
+       if (buffer[0] == '#')
+         continue;
+ 
+@@ -588,6 +590,9 @@ test_casemap_and_casefold (void)
+ 
+       convert = g_utf8_strup (test, -1);
+       expected = strings[4][0] ? strings[4] : test;
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, expected, line);
++
+       g_assert_cmpstr (convert, ==, expected);
+       g_free (convert);
+ 
+@@ -607,9 +612,11 @@ test_casemap_and_casefold (void)
+ 
+   infile = fopen (filename, "r");
+   g_assert (infile != NULL);
++  line = 0;
+ 
+   while (fgets (buffer, sizeof (buffer), infile))
+     {
++      line++;
+       if (buffer[0] == '#')
+         continue;
+ 
+@@ -619,6 +626,9 @@ test_casemap_and_casefold (void)
+       test = strings[0];
+ 
+       convert = g_utf8_casefold (test, -1);
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, strings[1], line);
++
+       g_assert_cmpstr (convert, ==, strings[1]);
+       g_free (convert);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 37a5fd34a96..8d349af1d5d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -74,6 +74,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
            file://CVE-2026-1485.patch \
+           file://CVE-2026-1489-01.patch \
+           file://CVE-2026-1489-02.patch \
+           file://CVE-2026-1489-03.patch \
+           file://CVE-2026-1489-04.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

