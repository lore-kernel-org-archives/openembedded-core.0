Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DCDCA0FFC
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:30:19 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.6601.1756330212403533203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PgxaY9RJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-246181827e9so3182365ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330212; x=1756935012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RuAHpp2jIbI8ObGbY+7KKGdkNI574/9vokZgsvh17Uc=;
        b=PgxaY9RJ1jxnAF/gSjUqD2x3prp3/B0jwqpjnJ69EYY0SEF9D06Vq/5KOUh3CCh7bw
         3u7E96FD2BzWKu2K3ruzV+1dIt2LIq5KswHkDfbdoJLsaAzcz7yZ2FGXcKj9VONKllFZ
         O5tEaj7v72xMo5eD7VDVqAxR/9eoHBA3/rdjWqJP6g4RsBe7HoCKrLaDiuRMAAxg1Ny5
         NpOj6wnyh8OWvWES7dcneaeGlBod3n7oLuLvSwtjmvn6Mn6pKJzzN0AKD6g+wErFo4PY
         NRG6AtzHnuDyJXs6VsNm0S7aJ/P8vY08MW7yqSUt2TxxILKntcksA+yONoMXfUf7XNZH
         Impw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330212; x=1756935012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RuAHpp2jIbI8ObGbY+7KKGdkNI574/9vokZgsvh17Uc=;
        b=I3+mVfRAgaBt0RT6sZ6gzpH0gqg0q9uz831Q7YROCiU8SqcFfNm7tYtbJERYm4CLUs
         u6na15/eJHDIwtotgI1Bi3Lm+aznD1u9AywC/uR2dZN7rrCr7RqoS5/WVcKXnfwH1BaU
         kx/JjmPiRQgljgSme6Zd5l441Wln6lGTm5Ql9tdZ8E/PT1k7Ke8duALE9qxI4b+g3rZ1
         jJGxA3ruzrL5FxBlpzD2Ov7hGckah2QeVPhT1WUg6w7gmsfMzpZRYlX5fCs8ynSiUA4s
         48TZbwWZCz4u+F8ygsl/vaOwUN9JDMpXQgFayphtpEzC3ZIYw56sJ3P0btGZTy5ez7/P
         fysQ==
X-Gm-Message-State: AOJu0YyAqfCu+UeIh8gyD0lk2KXyqvHx+qywE5gARz0nI2bMLpqPURK1
	+ZMQCVC7lFBtAxFOyDSY+Ry00ovVFJ1YWemWVqHwhbAsmNMwUX25G4s0HAxQpMEh2TnTEWzx1Qj
	GQtlj
X-Gm-Gg: ASbGnctoh8gaEzZ8RM/QyTpdFK4Guu0Lh1M30DGdJi9pRFyPqnP1P1WFJsWLlPg7NMK
	/UtTpefBmvyIdZIytm1EFqs93Gg3bPTl0YqRA7P+X5cgkeH3ebc/AOadiBjQFmeWtKI/LL9ZDjO
	a66xMYAGt5ZQf0IoJ4tah54qdO2oq/fhWXZvKoIGUGAGPo5KMmC6MnGWg3dvjH1HsLqVHsX3GAL
	gMk3YbtNNx3+yc0qQxRYgeAOpcA7NnAEv7fR83wrcTaEZJ3cVbU695TtSPGoK98iV9TuXJwj9Tv
	Cz53HwdHVhT0jehDiIgGr1MwBggP7GYNOfFTUk06lydT+oEgmtFpHumphFxkl2in8rcF/2Oa3MR
	envv/Xp+aB2XCZrn8UpCh0NFs
X-Google-Smtp-Source: AGHT+IH9QniD3Wm0F0FwjlsinzHnMp0QUCGHXJPsXBsw/1FoBMhDpKvo9RuyDIs0BFxuTLoummVCCA==
X-Received: by 2002:a17:903:2349:b0:248:abeb:c104 with SMTP id d9443c01a7336-248abebc290mr38064735ad.15.1756330211457;
        Wed, 27 Aug 2025 14:30:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.30.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:30:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/33] glib-2.0: patch CVE-2025-6052
Date: Wed, 27 Aug 2025 14:29:17 -0700
Message-ID: <8e85effc1a79e78f34b0b17341dd223bb80b25e4.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222518

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
Also pick commits from [2] which is referencing this CVE as the original
fix was not complete.

[1] https://security-tracker.debian.org/tracker/CVE-2025-6052
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4681

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


