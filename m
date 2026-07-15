Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B333C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:11 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.373.1784136129372618327
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NUd9NR76;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9556; q=dns/txt;
  s=iport01; t=1784136129; x=1785345729;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LbNSY/3foQvgK3kS7yMJCC9GYUsI1esYG0ZYuG5DRUQ=;
  b=NUd9NR76HlDR5oJ233kvQcGLExd6pd1P+8W1cR0umiDTYLfbyLOJ9qr4
   Gs+NyE9JtS/c6nZXn1yQjEBZ3kXZdbp5Bxyt+7YQEzWXd3RY4kbh/pZ6X
   fMvWqy8/Sd1I4n7s2tYkYjMBnR+5IvyG8XiKlxbQ6agCekBlbhSu+dz06
   /Yra7eJhXZWiW2jeIjidCmThyXqicAGfUGdG2WVm8dsKIAoDbFY/kBYZo
   V0RS6jGmHddTp2f5KcOE0LFnM+bGbsMy+Ww6VkXjeG0hVy4LhkZgV8qJn
   TPIsf6fj9G1li/Q9k/hoPyRQt7DIqcE1HpFLmPQw0CihOz5IsVVoMiZKa
   w==;
X-CSE-ConnectionGUID: YQ5NaR6iQUKMZEOV1Gmwfw==
X-CSE-MsgGUID: +fTRmwSVSMGDhNfhad6WBg==
X-IPAS-Result: =?us-ascii?q?A0BJAgD+wFdq/4z/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA54bgX4PAQEBD0QNBAEBhQUCjVECJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBVhwDAQIDAiYCAisjCBEIgwIBg?=
 =?us-ascii?q?nQDEb0Fen8zgQGDaAJDUNsuAQUGFAGBCi6FP4MdAYUCXBgBhHwnGxuBcoEVg?=
 =?us-ascii?q?2mBBYFcAYU8gmoEgiKBDIFagiSNckiBAhwDWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XNFgbBwWBHYFQgQKEdiMfAzl/gTB1SnctahIXgVGCFIEYAwsYDUgRL?=
 =?us-ascii?q?DcUGwQ9AW4HjUklgjgGAYEECgErIn6BLpMTAQmSNKESCiiDdYwhlToaM4QEl?=
 =?us-ascii?q?BeSUQuYfY4Klg5ChGmBaDyBRAMLB3AVO4JnUxkPjioDCwuFX4MUyQU8NQsyA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:J4/A/64z8KZlZZyaVfBEZgxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mMdUDyDM/yKYzOmLoh2bty+8U4B7JWAy4UwS1E/+3o3Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1NtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eDLRF3O9NX2B3y
 N89Gh0qUEmsgv243+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEXUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeNK4DSHZ0IxC50o
 EqF8VjDBw4hCue65haF1Hysj+ORogn0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:O+VzcatbhcIZScW5+qi1LiKn7skDVNV00zEX/kB9WHVpm6uj5q
 eTdZUgpHvJYVkqNk3I9ersBEDEewK+yXcX2/h1AV7dZmjbUQKTRekIh7cKgQeQeREWndQz6U
 4PScRD4aXLbWRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: =?us-ascii?q?9a23=3Ate0H9GrdE+9pJK3s0PELAvTmUfEcL1vU9inRGnK?=
 =?us-ascii?q?bLFREb4PMZlqP9rwxxg=3D=3D?=
X-Talos-MUID: 9a23:psiyNwgvpZRVnharvr9ilMMpd8lU2aGxM342tLoqu++KNSV8ZQi3g2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="509400052"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:22:08 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 179B0180001C0
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:08 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 39B86CC037D; Wed, 15 Jul 2026 22:52:06 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/6] glib-2.0: Fix CVE-2026-58012
Date: Wed, 15 Jul 2026 22:51:39 +0530
Message-Id: <20260715172142.1146263-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
References: <20260715172142.1146263-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241022

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58012. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/e680a53224e23cc8037dcf54761d6dad0f3396f9
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58012

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58012.patch       | 228 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58012.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58012.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58012.patch
new file mode 100644
index 0000000000..b76098a9a5
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58012.patch
@@ -0,0 +1,228 @@
+From ad9d1b063a6e46d5541e40198725d21f0804de9f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/e680a53224e23cc8037dcf54761d6dad0f3396f9]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit e680a53224e23cc8037dcf54761d6dad0f3396f9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gregex.c      | 59 ++++++++++++++++++++++++++++++++++------------
+ glib/tests/regex.c | 53 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 97 insertions(+), 15 deletions(-)
+
+diff --git a/glib/gregex.c b/glib/gregex.c
+index 52d09f1e4..c26171415 100644
+--- a/glib/gregex.c
++++ b/glib/gregex.c
+@@ -3422,19 +3422,25 @@ split_replacement (const gchar  *replacement,
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
+@@ -3444,22 +3450,44 @@ string_append (GString     *string,
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
+@@ -3469,6 +3497,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+   InterpolationData *idata;
+   gchar *match;
+   ChangeCase change_case = CHANGE_CASE_NONE;
++  gboolean is_raw = (match_info != NULL && (match_info->regex->orig_compile_opts & G_REGEX_RAW));
+ 
+   for (list = data; list; list = list->next)
+     {
+@@ -3476,10 +3505,10 @@ interpolate_replacement (const GMatchInfo *match_info,
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
+@@ -3487,7 +3516,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch (match_info, idata->num);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+@@ -3495,7 +3524,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch_named (match_info, idata->text);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+diff --git a/glib/tests/regex.c b/glib/tests/regex.c
+index a774683f7..ed1585141 100644
+--- a/glib/tests/regex.c
++++ b/glib/tests/regex.c
+@@ -2531,6 +2531,58 @@ test_compiled_regex_after_jit_failure (void)
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
+@@ -2552,6 +2604,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/regex/jit-unsupported-matching", test_jit_unsupported_matching_options);
+   g_test_add_func ("/regex/unmatched-named-subpattern", test_unmatched_named_subpattern);
+   g_test_add_func ("/regex/compiled-regex-after-jit-failure", test_compiled_regex_after_jit_failure);
++  g_test_add_func ("/regex/replace-raw-change-case", test_replace_raw_change_case);
+ 
+   /* TEST_NEW(pattern, compile_opts, match_opts) */
+   TEST_NEW("[A-Z]+", G_REGEX_CASELESS | G_REGEX_EXTENDED | G_REGEX_OPTIMIZE, G_REGEX_MATCH_NOTBOL | G_REGEX_MATCH_PARTIAL);
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c961dbf660..767f63d6d9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -235,6 +235,7 @@ SRC_URI += "\
            file://skip-timeout.patch \
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
+           file://CVE-2026-58012.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


