Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DADC5321C
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7152.1785054627713054731
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mj2U1FWe;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so13019945e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054626; x=1785659426; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HBhZ2iYfxLI3QbYKW2Xl7jtQhRDm1L1sybvs1qF1UGQ=;
        b=mj2U1FWe4GtPoJ1eng6QLD+g6IkRx20L0lBYAoNOOvxCYgqwYWX8+hk/y+6LrFmMlv
         weyj3IEjcNwQXI49AQ/saMD0vJV7MR2codufBEh2EgHOyZfFkHngdpctaoPphRdu69CQ
         CbOLV8qRe4GIoo5USIj3n+MFkT+18/nnkV6Bw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054626; x=1785659426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HBhZ2iYfxLI3QbYKW2Xl7jtQhRDm1L1sybvs1qF1UGQ=;
        b=ay/ixgOKP80cY99xtqLy+28iqfUVBSNVIKYgfb1tWzik+1JW08eM9A69L4LXnvH6VZ
         lh4hNUyfS8gWTJaSkSY3bUFz8fw3SGfcfwT0IyxuWrn0Pf90vjIQLPxPEIZfUmfzGVkV
         hImRDKVP+TK4/b96Do/8ndSkpLEXE7RMg7C5rusbVRn+K0JWzN/UGyTm9orhZ/tyAITa
         Op6FnrdBGX7tvAAXDW+gWRtsCmlAlpTT3rzApzyzJiTAAhVBFLhh+2XYqNCDZH+cVsW/
         Deoxgkbl+bEjQeFUmFTJNc5DdC8XtpVh5E0uF79fX2ux3pbpAhFalO0J9Gq/kmCDB9TX
         UVjQ==
X-Gm-Message-State: AOJu0YyRILGqAQVuozqaEev1rbgbYBTYg3AvVGtkQzEz20fY6Me5hM5d
	q7tlSQp1fSbLDcGN1/JEM2Z4gh0NAHxBaXvZMUF51WZgh8PGQm8BvFQQD3d+q3/cYJ/KD/B0VWU
	jPWEB21k=
X-Gm-Gg: AR+sD12SFTOyYHKIxmyoEEvKlfSOCfaTxpG/VB1jzVpCs8tIzHSAIBGvY7nRFl2ZfCN
	bzPkNd2e4fFn288b/nwp8PIY5iyOzQAG7FXQ636MMg/aOmh0H4W63jYBWLvh0VRlswgaC3qRsik
	1svjbcfplFRnYAoi67CA0oqaoGTldCaQ9xTy4Z7zruKPiALQZAWvmKuWKiA93plJgZevz5rX7Wz
	woaiqsEin91BukBovpg/ige4nqT0axEgqSsuSOuZG/nkXwFZXW6qu2OVPDYnE3X02UlpWZFTIEa
	hz/gMapjyUPVsaHt/T1pjPDPM6IphVbZEF5XkTGOpZhn6zjccNc2hSflZ04g98glG1dBS4oD1uL
	lA1tb0lq4dlWgEhfsjQw1673eIjXSZFdopQmmIgV9/paZ+NXfjhkaZimLN5QXaxhl45oH3O34J1
	TJCMHhRb/Wi/dKI4xkJsLZNWdAsWKUB4ml7GeA2+L/CVAw3MI3TmDTtmbtHlBEHMoXQSOwSIozf
	ytb4840itcuLkrD
X-Received: by 2002:a05:600c:4fc6:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-496b5735169mr53026835e9.38.1785054625925;
        Sun, 26 Jul 2026 01:30:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/31] glib-2.0: fix CVE-2026-58012
Date: Sun, 26 Jul 2026 10:29:51 +0200
Message-ID: <b11588f572c1ce6af24da9020793e96404a028b4.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242009

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58012. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/d337aabd24ee2b8ac2a690dba3ccf26aa70e638f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58012

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-58012.patch    | 228 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch
new file mode 100644
index 00000000000..7f8435809c6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch
@@ -0,0 +1,228 @@
+From 74564fefcec22fc1efc187c36aa1fb8dcfe34454 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 31 Mar 2026 16:13:57 +0100
+Subject: [PATCH] gregex: Fix case changing substitutions with G_REGEX_RAW
+
+In `G_REGEX_RAW` mode, the input string is treated as a byte array
+(basically ASCII) rather than a unichar array. Accordingly, the case
+changing code for substitutions needs to operate on bytes with
+`G_REGEX_RAW`, rather than operating on unichars.
+
+This fixes a potential buffer overflow when trying to do a case change
+on a match of a set of bytes which are a truncated multi-byte UTF-8
+encoding at the end of the input buffer.
+
+Spotted by linhlhq as #YWH-PGM9867-193. I adapted their reproducer as
+the unit test, but implemented the fix in `gregex.c` independently.
+
+Fixes: #3918
+
+CVE: CVE-2026-58012
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/d337aabd24ee2b8ac2a690dba3ccf26aa70e638f]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit d337aabd24ee2b8ac2a690dba3ccf26aa70e638f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gregex.c      | 59 ++++++++++++++++++++++++++++++++++------------
+ glib/tests/regex.c | 53 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 97 insertions(+), 15 deletions(-)
+
+diff --git a/glib/gregex.c b/glib/gregex.c
+index 116ecacbb..496b34bbd 100644
+--- a/glib/gregex.c
++++ b/glib/gregex.c
+@@ -3147,19 +3147,25 @@ split_replacement (const gchar  *replacement,
+   return g_list_reverse (list);
+ }
+ 
+-/* Change the case of c based on change_case. */
+-#define CHANGE_CASE(c, change_case) \
++/* Change the case of c based on change_case.
++ * g_ascii_to*() will happily pass through non-ASCII bytes unchanged. */
++#define UTF8_CHANGE_CASE(c, change_case) \
+         (((change_case) & CHANGE_CASE_LOWER_MASK) ? \
+                 g_unichar_tolower (c) : \
+                 g_unichar_toupper (c))
++#define RAW_CHANGE_CASE(c, change_case) \
++        (((change_case) & CHANGE_CASE_LOWER_MASK) ? \
++                g_ascii_tolower (c) : \
++                g_ascii_toupper (c))
+ 
++/* If @text_is_raw is set, @text might not be valid UTF-8 (but will be
++ * nul-terminated). */
+ static void
+ string_append (GString     *string,
+                const gchar *text,
++               gboolean     text_is_raw,
+                ChangeCase  *change_case)
+ {
+-  gunichar c;
+-
+   if (text[0] == '\0')
+     return;
+ 
+@@ -3169,22 +3175,44 @@ string_append (GString     *string,
+     }
+   else if (*change_case & CHANGE_CASE_SINGLE_MASK)
+     {
+-      c = g_utf8_get_char (text);
+-      g_string_append_unichar (string, CHANGE_CASE (c, *change_case));
+-      g_string_append (string, g_utf8_next_char (text));
++      if (!text_is_raw)
++        {
++          gunichar c = g_utf8_get_char (text);
++          g_string_append_unichar (string, UTF8_CHANGE_CASE (c, *change_case));
++          g_string_append (string, g_utf8_next_char (text));
++        }
++      else
++        {
++          g_string_append_c (string, RAW_CHANGE_CASE (text[0], *change_case));
++          g_string_append (string, text + 1);
++        }
++
+       *change_case = CHANGE_CASE_NONE;
+     }
+   else
+     {
+-      while (*text != '\0')
++      if (!text_is_raw)
+         {
+-          c = g_utf8_get_char (text);
+-          g_string_append_unichar (string, CHANGE_CASE (c, *change_case));
+-          text = g_utf8_next_char (text);
++          while (*text != '\0')
++            {
++              gunichar c = g_utf8_get_char (text);
++              g_string_append_unichar (string, UTF8_CHANGE_CASE (c, *change_case));
++              text = g_utf8_next_char (text);
++            }
++        }
++      else
++        {
++          while (*text != '\0')
++            {
++              char c = *text;
++              g_string_append_c (string, RAW_CHANGE_CASE (c, *change_case));
++              text++;
++            }
+         }
+     }
+ }
+ 
++/* @match_info is (nullable) */
+ static gboolean
+ interpolate_replacement (const GMatchInfo *match_info,
+                          GString          *result,
+@@ -3194,6 +3222,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+   InterpolationData *idata;
+   gchar *match;
+   ChangeCase change_case = CHANGE_CASE_NONE;
++  gboolean is_raw = (match_info != NULL && (match_info->regex->orig_compile_opts & G_REGEX_RAW));
+ 
+   for (list = data; list; list = list->next)
+     {
+@@ -3201,10 +3230,10 @@ interpolate_replacement (const GMatchInfo *match_info,
+       switch (idata->type)
+         {
+         case REPL_TYPE_STRING:
+-          string_append (result, idata->text, &change_case);
++          string_append (result, idata->text, is_raw, &change_case);
+           break;
+         case REPL_TYPE_CHARACTER:
+-          g_string_append_c (result, CHANGE_CASE (idata->c, change_case));
++          g_string_append_c (result, UTF8_CHANGE_CASE (idata->c, change_case));
+           if (change_case & CHANGE_CASE_SINGLE_MASK)
+             change_case = CHANGE_CASE_NONE;
+           break;
+@@ -3212,7 +3241,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch (match_info, idata->num);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+@@ -3220,7 +3249,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch_named (match_info, idata->text);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+diff --git a/glib/tests/regex.c b/glib/tests/regex.c
+index d7a698ec6..bffb52a87 100644
+--- a/glib/tests/regex.c
++++ b/glib/tests/regex.c
+@@ -2529,6 +2529,58 @@ test_compiled_regex_after_jit_failure (void)
+   g_regex_unref (regex);
+ }
+ 
++static void
++test_replace_raw_change_case (void)
++{
++  GError *local_error = NULL;
++  GRegex *regex = NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3918");
++  g_test_summary ("Test that case changes as part of a replacement are handled correctly in G_REGEX_RAW mode");
++
++  /*
++   * Match a multi-byte sequence in RAW mode. The pattern matches
++   * exactly 2 bytes. The subject contains a 4-byte UTF-8 lead (0xF4)
++   * followed by only one continuation byte, then NUL.
++   *
++   * The matched substring will be "\xf4\x80" (2 bytes, heap-allocated
++   * as 3-byte buffer with NUL). If the code regresses and tries to handle
++   * the replacement as UTF-8 then g_utf8_get_char() would see 0xF4 and try
++   * to read 4 bytes, going 1 byte past the NUL into OOB territory.
++   */
++  regex = g_regex_new ("..", G_REGEX_RAW, 0, &local_error);
++  g_assert_no_error (local_error);
++
++  /*
++   * Build a subject string with truncated UTF-8.
++   * \xF4 = 4-byte UTF-8 lead byte
++   * \x80 = continuation byte
++   * No 3rd/4th continuation bytes — the match is only 2 bytes.
++   *
++   * \U\0 = uppercase the entire match → triggers string_append()
++   * with case change on the 2-byte non-UTF-8 match.
++   */
++  char subject[] = "\xf4\x80";
++  char *result = g_regex_replace (regex, subject, -1, 0, "\\U\\0", 0, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_pointer (&result, g_free);
++  g_clear_pointer (&regex, g_regex_unref);
++
++  /*
++   * Second variant: single-char case change \u with \0 backreference.
++   */
++  regex = g_regex_new (".", G_REGEX_RAW, 0, &local_error);
++  g_assert_no_error (local_error);
++
++  char subject2[] = "\xe6\xb0";  /* 3-byte UTF-8 lead, only 2 bytes */
++  result = g_regex_replace (regex, subject2, -1, 0, "\\u\\0", 0, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_pointer (&result, g_free);
++  g_clear_pointer (&regex, g_regex_unref);
++}
++
+ int
+ main (int argc, char *argv[])
+ {
+@@ -2550,6 +2602,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/regex/jit-unsupported-matching", test_jit_unsupported_matching_options);
+   g_test_add_func ("/regex/unmatched-named-subpattern", test_unmatched_named_subpattern);
+   g_test_add_func ("/regex/compiled-regex-after-jit-failure", test_compiled_regex_after_jit_failure);
++  g_test_add_func ("/regex/replace-raw-change-case", test_replace_raw_change_case);
+ 
+   /* TEST_NEW(pattern, compile_opts, match_opts) */
+   TEST_NEW("[A-Z]+", G_REGEX_CASELESS | G_REGEX_EXTENDED | G_REGEX_OPTIMIZE, G_REGEX_MATCH_NOTBOL | G_REGEX_MATCH_PARTIAL);
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index a2de973e218..6dc3e0cc9cd 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -51,6 +51,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58016-2.patch \
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
+           file://CVE-2026-58012.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

