Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F003CA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 19:57:02 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.732.1755547016240113324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 12:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=e47FGRfa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202508181956541f8bf76d154337d616-00eysh@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202508181956541f8bf76d154337d616
        for <openembedded-core@lists.openembedded.org>;
        Mon, 18 Aug 2025 21:56:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=L1Icqv/taP2zVVo1V0DOMfYUH+ePrueYC4EOPwKwz44=;
 b=e47FGRfanCC9NFaEWvq7h7YYaPkkrsCY2CyDmBBh90BRCxAC8vQrgfhgcrqYElrEcTe3cv
 h5xeoUA9E2tb2SCsy7axRKlDQeZNlX8XSw6CWiZJtWaUxUFMY7IOJq6/NXQiG1LaFRrNsRBF
 cqGLs5sDBbdc8JvqfPFx5wqbaL/TiBn1ohvzEIf6zvFP2NfJKmu1+qjSDbiKwD7decwMChVL
 OuSEdL8xiTsCsDXa59vpbZZkBnAMFjHp0Lywh6VY+oM4+XKnCIbFBkrsrYAnGSGI1EstkFXv
 xrVnKeZ7jcsHyKQVRPRY+TcKQ91gtHa2iHPHPNl3R2KBYFEQNnNPEZmg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] glib-2.0: patch CVE-2025-6052
Date: Mon, 18 Aug 2025 21:56:03 +0200
Message-Id: <20250818195603.2459636-2-peter.marko@siemens.com>
In-Reply-To: <20250818195603.2459636-1-peter.marko@siemens.com>
References: <20250818195603.2459636-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Aug 2025 19:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222049

From: Peter Marko <peter.marko@siemens.com>

Backport commits from [1] which references this CVE.

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4681

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/files/CVE-2025-6052-1.patch      | 97 +++++++++++++++++++
 .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 +++++++
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 3 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
new file mode 100644
index 0000000000..a344735ee4
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
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
+@@ -68,6 +68,10 @@ static void
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
+@@ -82,11 +86,7 @@ static inline void
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
+@@ -767,6 +767,23 @@ test_string_new_take_null (void)
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
+@@ -796,6 +813,7 @@ main (int   argc,
+   g_test_add_func ("/string/test-string-steal", test_string_steal);
+   g_test_add_func ("/string/test-string-new-take", test_string_new_take);
+   g_test_add_func ("/string/test-string-new-take/null", test_string_new_take_null);
++  g_test_add_func ("/string/sized-new", test_string_sized_new);
+ 
+   return g_test_run();
+ }
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
new file mode 100644
index 0000000000..703dfdf46c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
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
+@@ -232,10 +232,10 @@ g_string_append_len_inline (GString    *gstring,
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c0044b4cf9..c80396a0f1 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,8 +231,10 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://CVE-2025-6052-1.patch \
+           file://CVE-2025-6052-2.patch \
            "
-SRC_URI:append:class-native = " file://relocate-modules.patch \ 
+SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
                               "
 

