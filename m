Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4311BF3C985
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21483.1771943597860874444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WZXZoOjJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so61255275e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943596; x=1772548396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8RVZPhrBp6x51+x9aeI8YajEc3hAfqPomgRo4lUGdc=;
        b=WZXZoOjJPsEAf2QepUGNN3VkknLSrBMBtwy7x8e4+MH6EmfEbLisX7A8vTuYKsVARb
         hGoD7k4aznGu4TPRqDvSEwI9lDnmp9XpEjdObcceAkjwKI1uyk7rmP7yygC555HafIal
         AdLq8pGpqEycCuKjgCeLYI9+jHWseaTFXodiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943596; x=1772548396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8RVZPhrBp6x51+x9aeI8YajEc3hAfqPomgRo4lUGdc=;
        b=xUkHTUEYJt/7ZpTYCBMqmSSwYmgkWqJEmFMHeeOLKQ/QdQVvgbYjPLoEUIZG+sZ1kF
         mBN9FBwe6uyE009GmriCOCZ4gq7WOtVEOQpULs126l7k0Zb7chyecFUbXPCDDegZydOG
         gRo/PouoGWKbRXQEPripcVzNG05fE1mwaOJkLVE4cPjSux6XcrqEPCSGvTR+GRLQICHv
         nMeLOKi7+0CR8YScmoSbncAKgVeU93Yl+crtjUgB5nGNXGm/EOY8PCMFwdf3/CgaN6xd
         F/fofAOo7ZU4RcZexvlzTDZwz/SO8B9L5dmFpLJdhItIR3uglSZq4OuuNY1nbRkXEg77
         i43A==
X-Gm-Message-State: AOJu0YxGOGyEjg5EaFrQH7y37uB/H2jiCBAtLaQ0F9Y2VRbNHxZGJg3E
	IYsskk/EV08bp6MZQwck0OI6O23aYBA6XejveD074Wn6C8G+HpiiG3IGVQ26WhAHfjJt+40I+nL
	DCCx7
X-Gm-Gg: AZuq6aKrl5xaHBcrEy9qWFtsR69qllumHR4TZtcO2sBKdbrFJoRnwaI0CuSFXmw6XEV
	CCnRMMt8Fo6q6YaJgjHTtINpFHAh7iEhDPsKa0xX0hvRNhH8t7zK21k7iOiThe9tc4bw0kygpOD
	6/X9jR2qDsY9y6d6gVnV5KOOR+lzTXD3n0zv5oJnP1tgqT4UDCTVp0BZulV5OCFcJdunY7dK2N0
	8+4vNV3DdnCI24t9AQqHJNStAMt6Drj/5h+v4zzJHiJKg4Vny+ih6kYklmbhwKerIzoMc41s01a
	hsB6wkyiwEdpomjA+DIWY8ASOBihGIHk7sYaiEKIix2z8XgHsw9vLTVG9+ckNc+1VDU7sAEBSJV
	dX05Cw5F2ViGRyN86XbpOigDOvC4Xth6o+5ZOq2nQMOE1gBwhjvoT33td7HA8p7/NXmqUgct3+Z
	qfC5zrE+gQZCmayvLHvI1UrEioKQ3TBRY1RiSoN7tbbik9lwZw8S9pvBT0ZJIsAUeEJNYf+sc2N
	/Lxozg4iHywKmMNmoWmG5sdcPqej7+dVT0qsWrN6ckA
X-Received: by 2002:a05:600c:1e1d:b0:480:6999:27ec with SMTP id 5b1f17b1804b1-483a95bebcdmr231539175e9.13.1771943595723;
        Tue, 24 Feb 2026 06:33:15 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:15 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 38/44] glib-2.0: patch CVE-2026-1489
Date: Tue, 24 Feb 2026 15:32:06 +0100
Message-ID: <f1e3ac42bd2bbd7c805449ea36ee818b6b686260.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231845

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3872
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4984

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +++
 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 ++
 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   4 +
 5 files changed, 434 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
new file mode 100644
index 00000000000..8f72bf972e8
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
+@@ -772,13 +772,13 @@ get_locale_type (void)
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
index 00000000000..4d3db5bf4eb
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
+@@ -798,7 +798,7 @@ output_marks (const char **p_inout,
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
index 00000000000..9ff9a37fcba
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
+@@ -772,14 +772,36 @@ get_locale_type (void)
+   return LOCALE_NORMAL;
+ }
+ 
+-static size_t
+-output_marks (const char **p_inout,
+-	      char        *out_buffer,
+-	      gboolean     remove_dot)
++G_ALWAYS_INLINE static inline void
++increase_size (size_t *sizeptr, size_t add)
++{
++  g_assert (G_MAXSIZE - *(sizeptr) >= add);
++  *(sizeptr) += add;
++}
++
++G_ALWAYS_INLINE static inline void
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
+@@ -787,7 +809,7 @@ output_marks (const char **p_inout,
+       if (ISMARK (TYPE (c)))
+ 	{
+ 	  if (!remove_dot || c != 0x307 /* COMBINING DOT ABOVE */)
+-	    len += g_unichar_to_utf8 (c, out_buffer ? out_buffer + len : NULL);
++            append_utf8_char_to_buffer (c, out_buffer, in_out_len);
+ 	  p = g_utf8_next_char (p);
+ 	}
+       else
+@@ -795,14 +817,14 @@ output_marks (const char **p_inout,
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
+@@ -814,10 +836,12 @@ output_special_case (gchar *out_buffer,
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
+@@ -858,11 +882,13 @@ real_toupper (const gchar *str,
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
+@@ -875,17 +901,17 @@ real_toupper (const gchar *str,
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
+@@ -896,8 +922,8 @@ real_toupper (const gchar *str,
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
+@@ -917,7 +943,7 @@ real_toupper (const gchar *str,
+ 	      /* Some lowercase letters, e.g., U+000AA, FEMININE ORDINAL INDICATOR,
+ 	       * do not have an uppercase equivalent, in which case val will be
+ 	       * zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -927,7 +953,7 @@ real_toupper (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -965,6 +991,8 @@ g_utf8_strup (const gchar *str,
+    * We use a two pass approach to keep memory management simple
+    */
+   result_len = real_toupper (str, len, NULL, locale_type);
++  g_assert (result_len < G_MAXSIZE);
++
+   result = g_malloc (result_len + 1);
+   real_toupper (str, len, result, locale_type);
+   result[result_len] = '\0';
+@@ -1022,14 +1050,15 @@ real_tolower (const gchar *str,
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
+@@ -1037,19 +1066,19 @@ real_tolower (const gchar *str,
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
+@@ -1058,8 +1087,8 @@ real_tolower (const gchar *str,
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
+@@ -1082,7 +1111,7 @@ real_tolower (const gchar *str,
+ 	  else
+ 	    val = 0x3c2;	/* GREEK SMALL FINAL SIGMA */
+ 
+-	  len += g_unichar_to_utf8 (val, out_buffer ? out_buffer + len : NULL);
++          append_utf8_char_to_buffer (val, out_buffer, &len);
+ 	}
+       else if (IS (t,
+ 		   OR (G_UNICODE_UPPERCASE_LETTER,
+@@ -1093,7 +1122,7 @@ real_tolower (const gchar *str,
+ 
+ 	  if (val >= 0x1000000)
+ 	    {
+-	      len += output_special_case (out_buffer ? out_buffer + len : NULL, val - 0x1000000, t, 0);
++              append_special_case (out_buffer, &len, val - 0x1000000, t, 0);
+ 	    }
+ 	  else
+ 	    {
+@@ -1112,7 +1141,7 @@ real_tolower (const gchar *str,
+ 
+ 	      /* Not all uppercase letters are guaranteed to have a lowercase
+ 	       * equivalent.  If this is the case, val will be zero. */
+-	      len += g_unichar_to_utf8 (val ? val : c, out_buffer ? out_buffer + len : NULL);
++              append_utf8_char_to_buffer (val ? val : c, out_buffer, &len);
+ 	    }
+ 	}
+       else
+@@ -1122,7 +1151,7 @@ real_tolower (const gchar *str,
+ 	  if (out_buffer)
+ 	    memcpy (out_buffer + len, last, char_len);
+ 
+-	  len += char_len;
++          increase_size (&len, char_len);
+ 	}
+ 
+     }
+@@ -1159,6 +1188,8 @@ g_utf8_strdown (const gchar *str,
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
index 00000000000..15322efacd5
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
+@@ -600,6 +600,7 @@ test_casemap_and_casefold (void)
+   const char *locale;
+   const char *test;
+   const char *expected;
++  size_t line = 0;
+   char *convert;
+   char *current_locale = setlocale (LC_CTYPE, NULL);
+   char *old_lc_all, *old_lc_messages, *old_lang;
+@@ -620,6 +621,7 @@ test_casemap_and_casefold (void)
+ 
+   while (fgets (buffer, sizeof (buffer), infile))
+     {
++      line++;
+       if (buffer[0] == '#')
+         continue;
+ 
+@@ -662,6 +664,9 @@ test_casemap_and_casefold (void)
+ 
+       convert = g_utf8_strup (test, -1);
+       expected = strings[4][0] ? strings[4] : test;
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, expected, line);
++
+       g_assert_cmpstr (convert, ==, expected);
+       g_free (convert);
+ 
+@@ -681,9 +686,11 @@ test_casemap_and_casefold (void)
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
+@@ -693,6 +700,9 @@ test_casemap_and_casefold (void)
+       test = strings[0];
+ 
+       convert = g_utf8_casefold (test, -1);
++      g_test_message ("Converting '%s' => '%s' (line %" G_GSIZE_FORMAT ")",
++                      test, strings[1], line);
++
+       g_assert_cmpstr (convert, ==, strings[1]);
+       g_free (convert);
+ 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index fefa3ad7d6e..b8212c9d12b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -43,6 +43,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1484-01.patch \
            file://CVE-2026-1484-02.patch \
            file://CVE-2026-1485.patch \
+           file://CVE-2026-1489-01.patch \
+           file://CVE-2026-1489-02.patch \
+           file://CVE-2026-1489-03.patch \
+           file://CVE-2026-1489-04.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

