Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E064DCA0FE1
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 19:09:12 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.22903.1756062549173587434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Aug 2025 12:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=P4KkPXmo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202508241909070f38c40457ae59349d-qv8x7b@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202508241909070f38c40457ae59349d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Aug 2025 21:09:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QjtjB1QTsbErtlXm+isDyM379i6HU3TywZjHg7/EGpY=;
 b=P4KkPXmoyuTFO7AdlAP6Aq8WLjwZLl0hkoqGlF+sJqRBawwNArjNpiKQhJpomkP2CdrWXr
 fnAiRsv/wsypTakZc7MYrfxAEQWZoyZKzgrUDtfBA1RhjyZE+nCo+ZBp5L38Dz3rdzwftKq6
 D2/tgQ9SYnxBuZaREeaKNrtjmjSpfzUG/t8zPZ1SX/+VHo+WNk0p5OGuGgpEhjnJSVowujug
 KhYjHaiUMAk/FwALvbdaXJkV5j13DwnvOZsNDV4N+nxwROatMZFrJI20URAFePNz1QI1O6A7
 6ySYsTHNwUsJAO5c/yEORYtAHe6OFkdIiCmChWUDthkD/HEbBgug50AA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 2/2] glib-2.0: patch CVE-2025-6052
Date: Sun, 24 Aug 2025 21:08:03 +0200
Message-Id: <20250824190803.730828-2-peter.marko@siemens.com>
In-Reply-To: <20250824190803.730828-1-peter.marko@siemens.com>
References: <20250824190803.730828-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 19:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222393

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
Also pick commits from [2] which is referencing this CVE as the original
fix was not complete.

[1] https://security-tracker.debian.org/tracker/CVE-2025-6052
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4681

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-6052-01.patch  | 69 +++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-6052-02.patch  | 97 +++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-6052-03.patch  | 35 +++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  3 +
 4 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-03.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-01.patch
new file mode 100644
index 0000000000..1bfe31131c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-01.patch
@@ -0,0 +1,69 @@
+From 987309f23ada52592bffdb5db0d8a5d58bd8097b Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 3 Jun 2025 11:31:04 +0100
+Subject: [PATCH] gstring: Fix overflow check when expanding the string
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+After commit 34b7992fd6e3894bf6d2229b8aa59cac34bcb1b5 the overflow check
+was only done when expanding the string, but we need to do it before
+checking whether to expand the string, otherwise that calculation could
+overflow and falsely decide that the string is big enough already.
+
+As a concrete example, consider a `GString` which has:
+ * `.len = G_MAXSIZE / 2 + 1`
+ * `.allocated_len = G_MAXSIZE / 2 + 1`
+and `g_string_append()` is called on it with an input string of length
+`G_MAXSIZE / 2`.
+
+This results in a call `g_string_maybe_expand (string, G_MAXSIZE / 2)`,
+which calculates `string->len + len` as `(G_MAXSIZE / 2 + 1) +
+(G_MAXSIZE / 2)` which evaluates to `1` as it overflows. This is not
+greater than `string->allocated_len` (which is `G_MAXSIZE / 2 + 1`), so
+`g_string_expand()` is *not* called, and `g_string_maybe_expand()`
+returns successfully. The caller then assumes that there’s enough space
+in the buffer, and happily continues to cause a buffer overflow.
+
+It’s unlikely anyone could hit this in practice because it requires
+ludicrously big strings and `GString` allocations, which likely would
+have been blocked by other code, but if we’re going to have the overflow
+checks in `GString` then they should be effective.
+
+Spotted by code inspection.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+CVE: CVE-2025-6052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/987309f23ada52592bffdb5db0d8a5d58bd8097b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gstring.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index 2a399ee21..8a489ca0d 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -78,10 +78,6 @@ static void
+ g_string_expand (GString *string,
+                  gsize    len)
+ {
+-  /* Detect potential overflow */
+-  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
+-    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
+-
+   string->allocated_len = g_nearest_pow (string->len + len + 1);
+   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
+    * memory for this string and don't over-allocate.
+@@ -96,6 +92,10 @@ static inline void
+ g_string_maybe_expand (GString *string,
+                        gsize    len)
+ {
++  /* Detect potential overflow */
++  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
++    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
++
+   if (G_UNLIKELY (string->len + len >= string->allocated_len))
+     g_string_expand (string, len);
+ }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-02.patch
new file mode 100644
index 0000000000..a28425a4ff
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-02.patch
@@ -0,0 +1,97 @@
+From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 7 Jul 2025 20:52:24 +0200
+Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
+
+If glib is compiled with -Dglib_assert=false, i.e. no asserts
+enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
+fault due to an out of boundary write.
+
+This happens because the overflow check was moved into
+g_string_maybe_expand which is not called by g_string_sized_new.
+
+By assuming that string->allocated_len is always larger than
+string->len (and the code would be in huge trouble if that is not true),
+the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
+avoid a potential G_MAXSIZE overflow.
+
+This in turn leads to 150-200 bytes smaller compiled library
+depending on gcc and clang versions, and one less check for the most
+common code paths.
+
+Reverts https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655 and
+reorders internal g_string_maybe_expand check to still fix
+CVE-2025-6052.
+
+CVE: CVE-2025-6052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6aa97beda32bb337370858862f4efe2f3372619f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gstring.c      | 10 +++++-----
+ glib/tests/string.c | 18 ++++++++++++++++++
+ 2 files changed, 23 insertions(+), 5 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index 010a8e976..24c4bfb40 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -78,6 +78,10 @@ static void
+ g_string_expand (GString *string,
+                  gsize    len)
+ {
++  /* Detect potential overflow */
++  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
++    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
++
+   string->allocated_len = g_nearest_pow (string->len + len + 1);
+   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
+    * memory for this string and don't over-allocate.
+@@ -92,11 +96,7 @@ static inline void
+ g_string_maybe_expand (GString *string,
+                        gsize    len)
+ {
+-  /* Detect potential overflow */
+-  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
+-    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len);
+-
+-  if (G_UNLIKELY (string->len + len >= string->allocated_len))
++  if (G_UNLIKELY (len >= string->allocated_len - string->len))
+     g_string_expand (string, len);
+ }
+ 
+diff --git a/glib/tests/string.c b/glib/tests/string.c
+index aa363c57a..e3bc4a02e 100644
+--- a/glib/tests/string.c
++++ b/glib/tests/string.c
+@@ -743,6 +743,23 @@ test_string_new_take_null (void)
+   g_string_free (g_steal_pointer (&string), TRUE);
+ }
+ 
++static void
++test_string_sized_new (void)
++{
++
++  if (g_test_subprocess ())
++    {
++      GString *string = g_string_sized_new (G_MAXSIZE);
++      g_string_free (string, TRUE);
++    }
++  else
++    {
++      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
++      g_test_trap_assert_failed ();
++      g_test_trap_assert_stderr ("*string would overflow*");
++    }
++}
++
+ int
+ main (int   argc,
+       char *argv[])
+@@ -772,6 +789,7 @@ main (int   argc,
+   g_test_add_func ("/string/test-string-steal", test_string_steal);
+   g_test_add_func ("/string/test-string-new-take", test_string_new_take);
+   g_test_add_func ("/string/test-string-new-take/null", test_string_new_take_null);
++  g_test_add_func ("/string/sized-new", test_string_sized_new);
+ 
+   return g_test_run();
+ }
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-03.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-03.patch
new file mode 100644
index 0000000000..3f6e564544
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-6052-03.patch
@@ -0,0 +1,35 @@
+From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <tobias@stoeckmann.org>
+Date: Mon, 7 Jul 2025 20:57:41 +0200
+Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
+
+Use the same style for the G_LIKELY check here as in g_string_sized_new.
+The check could overflow on 32 bit systems.
+
+Also improve the memcpy/memmove check to use memcpy if val itself is
+adjacent to end + len_unsigned, which means that no overlapping exists.
+
+CVE: CVE-2025-6052
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/3752760c5091eaed561ec11636b069e529533514]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ glib/gstring.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gstring.h b/glib/gstring.h
+index e817176c9..c5e64b33a 100644
+--- a/glib/gstring.h
++++ b/glib/gstring.h
+@@ -228,10 +228,10 @@ g_string_append_len_inline (GString    *gstring,
+   else
+     len_unsigned = (gsize) len;
+ 
+-  if (G_LIKELY (gstring->len + len_unsigned < gstring->allocated_len))
++  if (G_LIKELY (len_unsigned < gstring->allocated_len - gstring->len))
+     {
+       char *end = gstring->str + gstring->len;
+-      if (G_LIKELY (val + len_unsigned <= end || val > end + len_unsigned))
++      if (G_LIKELY (val + len_unsigned <= end || val >= end + len_unsigned))
+         memcpy (end, val, len_unsigned);
+       else
+         memmove (end, val, len_unsigned);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index c129be1328..9f93655739 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -30,6 +30,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-4373-01.patch \
            file://CVE-2025-4373-02.patch \
            file://CVE-2025-7039.patch \
+           file://CVE-2025-6052-01.patch \
+           file://CVE-2025-6052-02.patch \
+           file://CVE-2025-6052-03.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

