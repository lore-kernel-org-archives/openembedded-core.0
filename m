Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30091C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 12:47:22 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.75565.1747140434277092423
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 05:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VZ3HYVLM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so57942585e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747140432; x=1747745232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QP/N1nYc1yWfqCmIt8uWCglRwc5KaR0zhkp3y/FsbeA=;
        b=VZ3HYVLM1Ex1RXyiWucE1DhOq+RwZRfrAcyhSiMbrtOcqa2nwulndl2NZbkNn4csfX
         VqWgM1GmfKQdsmbj5EWQuPtIo8Z+EfFURMq3U865VadK4ZxbSs9EZI2tEJyw9VU7G9aB
         c7Zq7WfL7/KKM9jGd1KnTlJfqd/YLQdz7X9Ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140432; x=1747745232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP/N1nYc1yWfqCmIt8uWCglRwc5KaR0zhkp3y/FsbeA=;
        b=bDm83WHo5o0TMrq4wBszknBU8Hi88sk8N+wL5dMXGMhDIbaBiUQOYbw0MWFuw7pWn2
         H2iSD6KxAIoiP+r9ShV385F9hCD/2KnbhZ5shvUDFThLsrmuJrfC1oerNjgoFBDI5FxG
         t0LrnVSD42D/c8RiSwSeBT5TNaixNL5gbQgdGFB0t8Im+Il01BBUHtx7joi6Hq9y0Ess
         ZrqJt7g6dKhw2N/a2mhx2r6xXgzCU2JaYk/4p+S6x4V9yeUELC7AnJ6HB0c5WC9QCsU4
         mEWjsxXG9+WkeVchKV2ATaoBJL4Cs+nuRuzWTmutThNxgdczswXQ5svXdS8sPMsZhGe+
         dctA==
X-Gm-Message-State: AOJu0YwNnYVNzo30ywRZDKkRJHZ700E64DsCAwXytzMUbaA75NffBWaP
	pCtdeqndwuf3oeDhzjDGbggsLrW4URs/c2UeP9q3T86iUhucwV/f0IihtjmBD8frPCvCQvuZJQF
	G
X-Gm-Gg: ASbGncv1aL62qVKobkihImM87q2dLcN0WDl88YO/EnNjxsM1E845/hRFUFU0vcfjRDR
	Rj7UbW6AuFerjP77EEtDj7XIcwrrF7wlqruvL0t4W1xw0ZVg1eF1ivA5KzyivP47ld9f435ucJQ
	JhoPYzgzqMbRVOX+p9ovQoCwz+wFEiFjYIFrV5q1CDQeUwJ3NSua8ZI0prWPWdC91LOsrGnT6Kp
	xKneETAZmSuSOzgleRsUC4a758sJoDTiqfbwe9MMG/Tk/2VeV3Ud4PTMtjtfqW68eeSNYsI20KC
	XdjbAgHiQSE3Z6EfMhjirnVpbsRuaxm3is6nr53J3Ylca1h1glzP5jDvutuU5cTAkQHIdCMin3x
	YWzpXH04gfjl+9A==
X-Google-Smtp-Source: AGHT+IH/XfgCjhpdJTMyaUsXUXkQnXjOH29HgooVrclqzg3B3C7xB7aETvEdOUpJUWv8pSgvTPXY6g==
X-Received: by 2002:a5d:43d0:0:b0:39d:724f:a8ae with SMTP id ffacd0b85a97d-3a1f645ecbdmr13055050f8f.33.1747140431499;
        Tue, 13 May 2025 05:47:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8d0:97f6:fa2f:73cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fe6sm16414942f8f.58.2025.05.13.05.47.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 05:47:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libsoup-2.4: Drop recipe as obsolete
Date: Tue, 13 May 2025 13:47:06 +0100
Message-ID: <20250513124706.1312750-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250513124706.1312750-1-richard.purdie@linuxfoundation.org>
References: <20250513124706.1312750-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216421

The last user in OE-Core was gst-examples. This has been upgraded and the dependency
dropped, all other users can use libsoup3 instead. Therefore remove the obsolete and
deprecated version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/distro_alias.inc     |   1 -
 meta/conf/distro/include/maintainers.inc      |   1 -
 .../libsoup-2.4/0001-CVE-2025-32911.patch     |  74 ---------
 ...ild-with-libxml2-2.12.0-and-clang-17.patch |  44 ------
 ...-Fix-possibly-uninitialized-warnings.patch |  43 ------
 ...-http-and-https-aliases-support-test.patch | 145 ------------------
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  37 -----
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  43 ------
 .../libsoup-2.4/CVE-2024-52532-3.patch        |  48 ------
 .../libsoup/libsoup-2.4_2.74.3.bb             |  66 --------
 10 files changed, 502 deletions(-)
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
 delete mode 100644 meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index a938c007e8a..8052464f1d9 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -157,7 +157,6 @@ DISTRO_PN_ALIAS:pn-libpod-plainer-perl = "OSPDT"
 DISTRO_PN_ALIAS:pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 DISTRO_PN_ALIAS:pn-libsdl2 = "Fedora=sdl2 Opensuse=libsdl2 Ubuntu=libsdl2 Debian=libsdl2"
 DISTRO_PN_ALIAS:pn-libsndfile1 = "Meego=libsndfile Fedora=libsndfile OpenSuSE=libsndfile Ubuntu=libsndfile Mandriva=libsndfile Debian=libsndfile"
-DISTRO_PN_ALIAS:pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup Ubuntu=libsoup2.4 Mandriva=libsoup Debian=libsoup2.4"
 DISTRO_PN_ALIAS:pn-libtelepathy = "Debian=libtelepathy2 Ubuntu=libtelepathy2"
 DISTRO_PN_ALIAS:pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 DISTRO_PN_ALIAS:pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 69f6a2d2846..6c19e306cfa 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -400,7 +400,6 @@ RECIPE_MAINTAINER:pn-libsm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libsoup = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libssh2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
deleted file mode 100644
index 9ef0643837f..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From 52c5859b82fe79f2c32d883e048d218e0d7f2182 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 30 Apr 2025 14:59:55 +0800
-Subject: [PATCH] CVE-2025-32911
-
-CVE: CVE-2025-32911
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-message-headers.c | 13 +++++++++----
- tests/header-parsing-test.c    | 15 +++++++++++++++
- 2 files changed, 24 insertions(+), 4 deletions(-)
-
-diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-headers.c
-index 39ad14a..78b2455 100644
---- a/libsoup/soup-message-headers.c
-+++ b/libsoup/soup-message-headers.c
-@@ -1454,10 +1454,15 @@ soup_message_headers_get_content_disposition (SoupMessageHeaders  *hdrs,
- 	 */
- 	if (params && g_hash_table_lookup_extended (*params, "filename",
- 						    &orig_key, &orig_value)) {
--		char *filename = strrchr (orig_value, '/');
--
--		if (filename)
--			g_hash_table_insert (*params, g_strdup (orig_key), filename + 1);
-+                if (orig_value) {
-+                        char *filename = strrchr (orig_value, '/');
-+
-+                        if (filename)
-+                                g_hash_table_insert (*params, g_strdup (orig_key), g_strdup(filename + 1));
-+                } else {
-+                        /* filename with no value isn't valid. */
-+                        g_hash_table_remove (*params, "filename");
-+                }
- 	}
- 	return TRUE;
- }
-diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
-index 946f118..752196e 100644
---- a/tests/header-parsing-test.c
-+++ b/tests/header-parsing-test.c
-@@ -1034,6 +1034,7 @@ do_param_list_tests (void)
- #define RFC5987_TEST_HEADER_FALLBACK "attachment; filename*=Unknown''t%FF%FF%FFst.txt; filename=\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE  "filename=\"test.txt\""
- #define RFC5987_TEST_HEADER_NO_TYPE_2  "filename=\"test.txt\"; foo=bar"
-+#define RFC5987_TEST_HEADER_EMPTY_FILENAME ";filename"
- 
- static void
- do_content_disposition_tests (void)
-@@ -1133,6 +1134,20 @@ do_content_disposition_tests (void)
- 	g_assert_cmpstr (filename, ==, RFC5987_TEST_FALLBACK_FILENAME);
-         parameter2 = g_hash_table_lookup (params, "foo");
-         g_assert_cmpstr (parameter2, ==, "bar");
-+	g_hash_table_destroy (params);
-+
-+	 /* Empty filename */
-+	soup_message_headers_clear (hdrs);
-+	soup_message_headers_append (hdrs, "Content-Disposition",
-+								 RFC5987_TEST_HEADER_EMPTY_FILENAME);
-+	if (!soup_message_headers_get_content_disposition (hdrs,
-+													   &disposition,
-+													   &params)) {
-+			soup_test_assert (FALSE, "empty filename decoding FAILED");
-+			return;
-+	}
-+	g_free (disposition);
-+	g_assert_false (g_hash_table_contains (params, "filename"));
- 	g_hash_table_destroy (params);
- 
- 	soup_message_headers_free (hdrs);
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
deleted file mode 100644
index d867e5bc176..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ced3c5d8cad0177b297666343f1561799dfefb0d Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 22 Nov 2023 18:49:10 -0800
-Subject: [PATCH] Fix build with libxml2-2.12.0 and clang-17
-
-Fixes build errors about missing function prototypes with clang-17
-
-Fixes
-| ../libsoup-2.74.3/libsoup/soup-xmlrpc-old.c:512:8: error: call to undeclared function 'xmlParseMemory'; ISO C99 and later do not support implicit function declarations
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/385]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libsoup/soup-xmlrpc-old.c | 1 +
- libsoup/soup-xmlrpc.c     | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libsoup/soup-xmlrpc-old.c b/libsoup/soup-xmlrpc-old.c
-index c57086b6..527e3b23 100644
---- a/libsoup/soup-xmlrpc-old.c
-+++ b/libsoup/soup-xmlrpc-old.c
-@@ -11,6 +11,7 @@
- 
- #include <string.h>
- 
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- 
- #include "soup-xmlrpc-old.h"
-diff --git a/libsoup/soup-xmlrpc.c b/libsoup/soup-xmlrpc.c
-index 42dcda9c..e991cbf0 100644
---- a/libsoup/soup-xmlrpc.c
-+++ b/libsoup/soup-xmlrpc.c
-@@ -17,6 +17,7 @@
- 
- #include <string.h>
- #include <errno.h>
-+#include <libxml/parser.h>
- #include <libxml/tree.h>
- #include "soup-xmlrpc.h"
- #include "soup.h"
--- 
-2.43.0
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
deleted file mode 100644
index fcd442c13af..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Fix-possibly-uninitialized-warnings.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1159686379184a1c899eabb2174258aba5e0fd79 Mon Sep 17 00:00:00 2001
-From: Patrick Griffis <pgriffis@igalia.com>
-Date: Mon, 20 Sep 2021 15:41:31 -0500
-Subject: [PATCH] Fix possibly uninitialized warnings
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/fb98e9a8c3062c75357b961543af091de2dd5459]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 2 +-
- tests/samesite-test.c               | 3 +++
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index 65c1492..585d45c 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -471,7 +471,7 @@ send_message (SoupWebsocketConnection *self,
- 	GByteArray *bytes;
- 	gsize frame_len;
- 	guint8 *outer;
--	guint8 mask_offset;
-+	guint8 mask_offset = 0;
- 	GBytes *filtered_bytes;
- 	GList *l;
- 	GError *error = NULL;
-diff --git a/tests/samesite-test.c b/tests/samesite-test.c
-index 0b081b2..60c9b8e 100644
---- a/tests/samesite-test.c
-+++ b/tests/samesite-test.c
-@@ -60,6 +60,9 @@ assert_highest_policy_visible (GSList *cookies, SoupSameSitePolicy policy)
- 	case SOUP_SAME_SITE_POLICY_NONE:
- 		expected_count = 1;
- 		break;
-+	default:
-+		g_assert_not_reached ();
-+		break;
- 	}
- 
- 	g_assert_cmpuint (size, ==, expected_count);
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
deleted file mode 100644
index 0d4139ec084..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/0001-Remove-http-and-https-aliases-support-test.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From 0e3bfa22b23451531caf8cc30b1771ac6a41fcad Mon Sep 17 00:00:00 2001
-From: Carlos Garcia Campos <cgarcia@igalia.com>
-Date: Thu, 11 Feb 2021 10:47:09 +0100
-Subject: [PATCH] Remove http and https aliases support test
-
-Upstream has removed the whole function of http and https aliases
-support, this commit partially cherry pick it, only remove the test to
-mute the warning:
-| ../libsoup-2.74.3/tests/server-test.c: In function 'do_one_server_aliases_test':
-| ../libsoup-2.74.3/tests/server-test.c:180:17: warning: 'g_socket_client_set_tls_validation_flags' is deprecated [-Wdeprecated-declarations]
-|   180 |                 g_socket_client_set_tls_validation_flags (client, 0);
-|       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/111ae4ebe7cc2e389573cff5b9ac76509d6cbac0]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/server-test.c | 104 --------------------------------------------
- 1 file changed, 104 deletions(-)
-
-diff --git a/tests/server-test.c b/tests/server-test.c
-index 8976103..cb7e815 100644
---- a/tests/server-test.c
-+++ b/tests/server-test.c
-@@ -154,108 +154,6 @@ do_star_test (ServerData *sd, gconstpointer test_data)
- 	soup_uri_free (star_uri);
- }
- 
--static void
--do_one_server_aliases_test (SoupURI    *uri,
--			    const char *alias,
--			    gboolean    succeed)
--{
--	GSocketClient *client;
--	GSocketConnectable *addr;
--	GSocketConnection *conn;
--	GInputStream *in;
--	GOutputStream *out;
--	GError *error = NULL;
--	GString *req;
--	static char buf[1024];
--
--	debug_printf (1, "  %s via %s\n", alias, uri->scheme);
--
--	/* There's no way to make libsoup's client side send an absolute
--	 * URI (to a non-proxy server), so we have to fake this.
--	 */
--
--	client = g_socket_client_new ();
--	if (uri->scheme == SOUP_URI_SCHEME_HTTPS) {
--		g_socket_client_set_tls (client, TRUE);
--		g_socket_client_set_tls_validation_flags (client, 0);
--	}
--	addr = g_network_address_new (uri->host, uri->port);
--
--	conn = g_socket_client_connect (client, addr, NULL, &error);
--	g_object_unref (addr);
--	g_object_unref (client);
--	if (!conn) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		return;
--	}
--
--	in = g_io_stream_get_input_stream (G_IO_STREAM (conn));
--	out = g_io_stream_get_output_stream (G_IO_STREAM (conn));
--
--	req = g_string_new (NULL);
--	g_string_append_printf (req, "GET %s://%s:%d HTTP/1.1\r\n",
--				alias, uri->host, uri->port);
--	g_string_append_printf (req, "Host: %s:%d\r\n",
--				uri->host, uri->port);
--	g_string_append (req, "Connection: close\r\n\r\n");
--
--	if (!g_output_stream_write_all (out, req->str, req->len, NULL, NULL, &error)) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		g_string_free (req, TRUE);
--		return;
--	}
--	g_string_free (req, TRUE);
--
--	if (!g_input_stream_read_all (in, buf, sizeof (buf), NULL, NULL, &error)) {
--		g_assert_no_error (error);
--		g_error_free (error);
--		g_object_unref (conn);
--		return;
--	}
--
--	if (succeed)
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 200 "));
--	else
--		g_assert_true (g_str_has_prefix (buf, "HTTP/1.1 400 "));
--
--	g_io_stream_close (G_IO_STREAM (conn), NULL, NULL);
--	g_object_unref (conn);
--}
--
--static void
--do_server_aliases_test (ServerData *sd, gconstpointer test_data)
--{
--	char *http_aliases[] = { "dav", NULL };
--	char *https_aliases[] = { "davs", NULL };
--	char *http_good[] = { "http", "dav", NULL };
--	char *http_bad[] = { "https", "davs", "fred", NULL };
--	char *https_good[] = { "https", "davs", NULL };
--	char *https_bad[] = { "http", "dav", "fred", NULL };
--	int i;
--
--	g_test_bug ("703694");
--
--	g_object_set (G_OBJECT (sd->server),
--		      SOUP_SERVER_HTTP_ALIASES, http_aliases,
--		      SOUP_SERVER_HTTPS_ALIASES, https_aliases,
--		      NULL);
--
--	for (i = 0; http_good[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_good[i], TRUE);
--	for (i = 0; http_bad[i]; i++)
--		do_one_server_aliases_test (sd->base_uri, http_bad[i], FALSE);
--
--	if (tls_available) {
--		for (i = 0; https_good[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_good[i], TRUE);
--		for (i = 0; https_bad[i]; i++)
--			do_one_server_aliases_test (sd->ssl_base_uri, https_bad[i], FALSE);
--	}
--}
--
- static void
- do_dot_dot_test (ServerData *sd, gconstpointer test_data)
- {
-@@ -1382,8 +1280,6 @@ main (int argc, char **argv)
- 
- 	g_test_add ("/server/OPTIONS *", ServerData, NULL,
- 		    server_setup, do_star_test, server_teardown);
--	g_test_add ("/server/aliases", ServerData, NULL,
--		    server_setup, do_server_aliases_test, server_teardown);
- 	g_test_add ("/server/..-in-path", ServerData, NULL,
- 		    server_setup, do_dot_dot_test, server_teardown);
- 	g_test_add ("/server/ipv6", ServerData, NULL,
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
deleted file mode 100644
index cb1f0961100..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 11 Sep 2024 11:52:11 +0200
-Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
-
-Otherwise we can enter in a read loop because we were not
-validating the data until the all the data was read.
-
-Fixes #391
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- libsoup/soup-websocket-connection.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
-index a4095e1..65c1492 100644
---- a/libsoup/soup-websocket-connection.c
-+++ b/libsoup/soup-websocket-connection.c
-@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
- 		}
- 
- 		pv->incoming->len = len + count;
--	} while (count > 0);
--
--	process_incoming (self);
-+		process_incoming (self);
-+	} while (count > 0 && !pv->close_sent && !pv->io_closing);
- 
- 	if (end) {
- 		if (!pv->close_sent || !pv->close_received) {
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
deleted file mode 100644
index dcadafe9449..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
-From: Ignacio Casal Quinteiro <qignacio@amazon.com>
-Date: Wed, 2 Oct 2024 11:17:19 +0200
-Subject: [PATCH] websocket-test: disconnect error copy after the test ends
-
-Otherwise the server will have already sent a few more wrong
-bytes and the client will continue getting errors to copy
-but the error is already != NULL and it will assert
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 5e40cf3..1ec9ff6 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	GError *error = NULL;
- 	InvalidEncodeLengthTest context = { test, NULL };
- 	guint i;
-+	guint error_id;
- 
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
-+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
- 
- 	/* We use 127(\x7f) as payload length with 65535 extended length */
-@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
- 	WAIT_UNTIL (error != NULL || received != NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
- 	g_clear_error (&error);
-+	g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
- 
-         g_thread_join (thread);
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
deleted file mode 100644
index ab6af722914..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
-From: Simon McVittie <smcv@debian.org>
-Date: Wed, 13 Nov 2024 14:14:23 +0000
-Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
-
-This is the same change as commit 29b96fab "websocket-test: disconnect
-error copy after the test ends", and is done for the same reason, but
-replicating it into a different function.
-
-Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
-Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
-Signed-off-by: Simon McVittie <smcv@debian.org>
-
-CVE: CVE-2024-52532
-Upstream-Status: Backport
-[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- tests/websocket-test.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/tests/websocket-test.c b/tests/websocket-test.c
-index 2b19a7b..0699a06 100644
---- a/tests/websocket-test.c
-+++ b/tests/websocket-test.c
-@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	GError *error = NULL;
- 	InvalidEncodeLengthTest context = { test, NULL };
- 	guint i;
-+	guint error_id;
- 
--	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
-+	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
- 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
- 
- 	/* We use 126(~) as payload length with 125 extended length */
-@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
- 	WAIT_UNTIL (error != NULL || received != NULL);
- 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
- 	g_clear_error (&error);
-+        g_signal_handler_disconnect (test->client, error_id);
- 	g_assert_null (received);
- 
- 	g_thread_join (thread);
--- 
-2.34.1
-
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
deleted file mode 100644
index 7e275a48f4c..00000000000
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "An HTTP library implementation in C"
-DESCRIPTION = "libsoup is an HTTP client/server library for GNOME. It uses GObjects \
-and the glib main loop, to integrate well with GNOME applications."
-HOMEPAGE = "https://wiki.gnome.org/Projects/libsoup"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/gnome/libs"
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
-           file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch \
-           file://0001-Fix-possibly-uninitialized-warnings.patch \
-           file://0001-Remove-http-and-https-aliases-support-test.patch \
-           file://CVE-2024-52532-1.patch \
-           file://CVE-2024-52532-2.patch \
-           file://CVE-2024-52532-3.patch"
-
-SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
-
-CVE_PRODUCT = "libsoup"
-
-S = "${WORKDIR}/libsoup-${PV}"
-
-inherit meson gettext pkgconfig upstream-version-is-even gobject-introspection gtk-doc
-
-UPSTREAM_CHECK_REGEX = "libsoup-(?P<pver>2(\.(?!99)\d+)+)\.tar"
-
-GIR_MESON_ENABLE_FLAG = 'enabled'
-GIR_MESON_DISABLE_FLAG = 'disabled'
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[brotli] = "-Dbrotli=enabled,-Dbrotli=disabled,brotli"
-# libsoup-gnome is entirely deprecated and just stubs in 2.42 onwards
-PACKAGECONFIG[gnome] = "-Dgnome=true,-Dgnome=false"
-PACKAGECONFIG[gssapi] = "-Dgssapi=enabled,-Dgssapi=disabled,krb5"
-PACKAGECONFIG[ntlm] = "-Dntlm=enabled,-Dntlm=disabled"
-PACKAGECONFIG[sysprof] = "-Dsysprof=enabled,-Dsysprof=disabled,sysprof"
-
-# Tell libsoup where the target ntlm_auth is installed
-do_write_config:append:class-target() {
-    cat >${WORKDIR}/soup.cross <<EOF
-[binaries]
-ntlm_auth = '${bindir}/ntlm_auth'
-EOF
-}
-EXTRA_OEMESON:append:class-target = " --cross-file ${WORKDIR}/soup.cross"
-
-EXTRA_OEMESON += "-Dvapi=disabled -Dtls_check=false"
-
-GTKDOC_MESON_OPTION = "gtk_doc"
-
-# When built without gnome support, libsoup-2.4 will contain only one shared lib
-# and will therefore become subject to renaming by debian.bbclass. Prevent
-# renaming in order to keep the package name consistent regardless of whether
-# gnome support is enabled or disabled.
-DEBIAN_NOAUTONAME:${PN} = "1"
-
-# glib-networking is needed for SSL, proxies, etc.
-RRECOMMENDS:${PN} = "glib-networking"
-
-BBCLASSEXTEND = "native nativesdk"

