Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AACEFCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:12:28 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.34019.1756973546687706107
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout12.t-online.de (Postfix) with SMTP id 8F0FEE6B1
	for <openembedded-core@lists.openembedded.org>; Thu,  4 Sep 2025 10:12:24 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.163.17]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uu54x-2nKrOj0; Thu, 4 Sep 2025 10:12:24 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][RFC][PATCH] glib-2.0: update 2.84.4 -> 2.85.4
Date: Thu,  4 Sep 2025 10:12:12 +0200
Message-ID: <20250904081212.1692731-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1756973544-777FD9EC-10B19099/0/0 CLEAN NORMAL
X-TOI-MSGID: 031db04a-6570-4821-a9c5-a71d8af4f5c8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:12:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222906

indirect requirement for gtk4 4.20.0

developement version: useful for testing the upcoming gnome environment

- remove backport patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../glib-2.0/files/CVE-2025-6052-1.patch      | 97 -------------------
 .../glib-2.0/files/CVE-2025-6052-2.patch      | 35 -------
 ...l_2.84.4.bb =3D> glib-2.0-initial_2.85.4.bb} |  0
 ...{glib-2.0_2.84.4.bb =3D> glib-2.0_2.85.4.bb} |  0
 meta/recipes-core/glib-2.0/glib.inc           |  4 +-
 5 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patc=
h
 delete mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patc=
h
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.4.bb =3D> glib-=
2.0-initial_2.85.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.4.bb =3D> glib-2.0_2.85=
.4.bb} (100%)

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch b/met=
a/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
deleted file mode 100644
index a344735ee4..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 6aa97beda32bb337370858862f4efe2f3372619f Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 7 Jul 2025 20:52:24 +0200
-Subject: [PATCH] gstring: Fix g_string_sized_new segmentation fault
-
-If glib is compiled with -Dglib_assert=3Dfalse, i.e. no asserts
-enabled, then g_string_sized_new(G_MAXSIZE) leads to a segmentation
-fault due to an out of boundary write.
-
-This happens because the overflow check was moved into
-g_string_maybe_expand which is not called by g_string_sized_new.
-
-By assuming that string->allocated_len is always larger than
-string->len (and the code would be in huge trouble if that is not true),
-the G_UNLIKELY check in g_string_maybe_expand can be rephrased to
-avoid a potential G_MAXSIZE overflow.
-
-This in turn leads to 150-200 bytes smaller compiled library
-depending on gcc and clang versions, and one less check for the most
-common code paths.
-
-Reverts https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4655 and
-reorders internal g_string_maybe_expand check to still fix
-CVE-2025-6052.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
6aa97beda32bb337370858862f4efe2f3372619f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- glib/gstring.c      | 10 +++++-----
- glib/tests/string.c | 18 ++++++++++++++++++
- 2 files changed, 23 insertions(+), 5 deletions(-)
-
-diff --git a/glib/gstring.c b/glib/gstring.c
-index 010a8e976..24c4bfb40 100644
---- a/glib/gstring.c
-+++ b/glib/gstring.c
-@@ -68,6 +68,10 @@ static void
- g_string_expand (GString *string,
-                  gsize    len)
- {
-+  /* Detect potential overflow */
-+  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
-+    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len=
);
-+
-   string->allocated_len =3D g_nearest_pow (string->len + len + 1);
-   /* If the new size is bigger than G_MAXSIZE / 2, only allocate enough
-    * memory for this string and don't over-allocate.
-@@ -82,11 +86,7 @@ static inline void
- g_string_maybe_expand (GString *string,
-                        gsize    len)
- {
--  /* Detect potential overflow */
--  if G_UNLIKELY ((G_MAXSIZE - string->len - 1) < len)
--    g_error ("adding %" G_GSIZE_FORMAT " to string would overflow", len=
);
--
--  if (G_UNLIKELY (string->len + len >=3D string->allocated_len))
-+  if (G_UNLIKELY (len >=3D string->allocated_len - string->len))
-     g_string_expand (string, len);
- }
-=20
-diff --git a/glib/tests/string.c b/glib/tests/string.c
-index aa363c57a..e3bc4a02e 100644
---- a/glib/tests/string.c
-+++ b/glib/tests/string.c
-@@ -767,6 +767,23 @@ test_string_new_take_null (void)
-   g_string_free (g_steal_pointer (&string), TRUE);
- }
-=20
-+static void
-+test_string_sized_new (void)
-+{
-+
-+  if (g_test_subprocess ())
-+    {
-+      GString *string =3D g_string_sized_new (G_MAXSIZE);
-+      g_string_free (string, TRUE);
-+    }
-+  else
-+    {
-+      g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
-+      g_test_trap_assert_failed ();
-+      g_test_trap_assert_stderr ("*string would overflow*");
-+    }
-+}
-+
- int
- main (int   argc,
-       char *argv[])
-@@ -796,6 +813,7 @@ main (int   argc,
-   g_test_add_func ("/string/test-string-steal", test_string_steal);
-   g_test_add_func ("/string/test-string-new-take", test_string_new_take=
);
-   g_test_add_func ("/string/test-string-new-take/null", test_string_new=
_take_null);
-+  g_test_add_func ("/string/sized-new", test_string_sized_new);
-=20
-   return g_test_run();
- }
diff --git a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch b/met=
a/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
deleted file mode 100644
index 703dfdf46c..0000000000
--- a/meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3752760c5091eaed561ec11636b069e529533514 Mon Sep 17 00:00:00 2001
-From: Tobias Stoeckmann <tobias@stoeckmann.org>
-Date: Mon, 7 Jul 2025 20:57:41 +0200
-Subject: [PATCH] gstring: Improve g_string_append_len_inline checks
-
-Use the same style for the G_LIKELY check here as in g_string_sized_new.
-The check could overflow on 32 bit systems.
-
-Also improve the memcpy/memmove check to use memcpy if val itself is
-adjacent to end + len_unsigned, which means that no overlapping exists.
-
-CVE: CVE-2025-6052
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/=
3752760c5091eaed561ec11636b069e529533514]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- glib/gstring.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/glib/gstring.h b/glib/gstring.h
-index e817176c9..c5e64b33a 100644
---- a/glib/gstring.h
-+++ b/glib/gstring.h
-@@ -232,10 +232,10 @@ g_string_append_len_inline (GString    *gstring,
-   else
-     len_unsigned =3D (gsize) len;
-=20
--  if (G_LIKELY (gstring->len + len_unsigned < gstring->allocated_len))
-+  if (G_LIKELY (len_unsigned < gstring->allocated_len - gstring->len))
-     {
-       char *end =3D gstring->str + gstring->len;
--      if (G_LIKELY (val + len_unsigned <=3D end || val > end + len_unsi=
gned))
-+      if (G_LIKELY (val + len_unsigned <=3D end || val >=3D end + len_u=
nsigned))
-         memcpy (end, val, len_unsigned);
-       else
-         memmove (end, val, len_unsigned);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb b/meta=
/recipes-core/glib-2.0/glib-2.0-initial_2.85.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0-initial_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0-initial_2.85.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.85.4.bb
similarity index 100%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.84.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.85.4.bb
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
index c80396a0f1..c7fc0f3c8d 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,14 +231,12 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-=
${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-on=
ly-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.pa=
tch \
            file://skip-timeout.patch \
-           file://CVE-2025-6052-1.patch \
-           file://CVE-2025-6052-2.patch \
            "
 SRC_URI:append:class-native =3D " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pi=
dfd-features-on-native-g.patch \
                               "
=20
-SRC_URI[sha256sum] =3D "8a9ea10943c36fc117e253f80c91e477b673525ae4576294=
2858aef57631bb90"
+SRC_URI[sha256sum] =3D "432d84c8e44fe689ff70a5d88dab6d0f70d5efcf7460b965=
ac560dbac3c6c185"
=20
 # Find any meson cross files in FILESPATH that are relevant for the curr=
ent
 # build (using siteinfo) and add them to EXTRA_OEMESON.
--=20
2.50.1


