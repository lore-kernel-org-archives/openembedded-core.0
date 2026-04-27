Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CF1FF8864
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 21:52:04 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7221.1777326716898058894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 14:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LoNPcnl2;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026042721515513499d931700020736-4un688@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026042721515513499d931700020736
        for <openembedded-core@lists.openembedded.org>;
        Mon, 27 Apr 2026 23:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=fuq8C3mW9J2wJS21ksvGsVHS+/ow/vhWC2w/+zEO2uU=;
 b=LoNPcnl28J8VmMMMzXqrcl39kdgBHcEbAkSw6/SgnXFevb7gF4aJpaxSIizaCq2GKev3iF
 otXiQndD7KCkDgkmVgQNOH4cO6ipguqqk71S/Ly0DuAshX8QyQxFA+1NVHFSZN0TWp/Vm75T
 9w7Ux4vO8n1KhdjNVnb7e6m9ooYIrX8GDG954KmisnG897HK1C1HABn2lIBIqF5iElERMEOK
 p9A6kSnABsEWdQYwZnDZLsNY9xfFPdTGWQBHvN09ORe7a8JqbgDkyllKxWqZHrKrzqkYJRX+
 zuRYc7ckIVljf92lCIWgPj6OtV7pPOHBEPMCZDgiQV2VbPHbL0+u/PLw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 4/4] libsoup: patch CVE-2026-5119
Date: Mon, 27 Apr 2026 23:51:20 +0200
Message-ID: <20260427215120.199335-4-peter.marko@siemens.com>
In-Reply-To: <20260427215120.199335-1-peter.marko@siemens.com>
References: <20260427215120.199335-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 21:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236034

From: Peter Marko <peter.marko@siemens.com>

Pick commit which closed [1].

[1] https://gitlab.gnome.org/GNOME/libsoup/-/work_items/502#note_cb3be24d375814549d21c03821672ed6749df36a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsoup/libsoup/CVE-2026-5119.patch       | 122 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch
new file mode 100644
index 0000000000..f5e3f91b00
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch
@@ -0,0 +1,122 @@
+From b0626fff8538e3dd4a52f148d91c8348d51d64d1 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Fri, 27 Feb 2026 12:03:25 +0100
+Subject: [PATCH] cookies: do not send cookies to a HTTP proxy for a HTTPS
+ request
+
+Closes #502
+
+CVE: CVE-2026-5119
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/b0626fff8538e3dd4a52f148d91c8348d51d64d1]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+---
+ libsoup/cookies/soup-cookie-jar.c | 24 +++++++++++-----
+ tests/proxy-test.c                | 47 +++++++++++++++++++++++++++++++
+ 2 files changed, 64 insertions(+), 7 deletions(-)
+
+diff --git a/libsoup/cookies/soup-cookie-jar.c b/libsoup/cookies/soup-cookie-jar.c
+index 7e200f8f..6a996ffe 100644
+--- a/libsoup/cookies/soup-cookie-jar.c
++++ b/libsoup/cookies/soup-cookie-jar.c
+@@ -885,18 +885,28 @@ process_set_cookie_header (SoupMessage *msg, gpointer user_data)
+ 	g_slist_free (new_cookies);
+ }
+ 
++static gboolean
++allow_cookies_for_request (SoupMessage *msg)
++{
++        /* Do not send cookies to a HTTP proxy for a HTTPS request */
++        return soup_message_get_method (msg) != SOUP_METHOD_CONNECT || !soup_connection_is_tunnelled (soup_message_get_connection (msg));
++}
++
+ static void
+ msg_starting_cb (SoupMessage *msg, gpointer feature)
+ {
+ 	SoupCookieJar *jar = SOUP_COOKIE_JAR (feature);
+-	GSList *cookies;
++	GSList *cookies = NULL;
++
++        if (allow_cookies_for_request (msg)) {
++                cookies = soup_cookie_jar_get_cookie_list_with_same_site_info (jar, soup_message_get_uri (msg),
++                                                                               soup_message_get_first_party (msg),
++                                                                               soup_message_get_site_for_cookies (msg),
++                                                                               TRUE,
++                                                                               SOUP_METHOD_IS_SAFE (soup_message_get_method (msg)),
++                                                                               soup_message_get_is_top_level_navigation (msg));
++        }
+ 
+-	cookies = soup_cookie_jar_get_cookie_list_with_same_site_info (jar, soup_message_get_uri (msg),
+-	                                                               soup_message_get_first_party (msg),
+-							               soup_message_get_site_for_cookies (msg),
+-								       TRUE,
+-							               SOUP_METHOD_IS_SAFE (soup_message_get_method (msg)),
+-							               soup_message_get_is_top_level_navigation (msg));
+ 	if (cookies != NULL) {
+ 		char *cookie_header = soup_cookies_to_cookie_header (cookies);
+ 		soup_message_headers_replace_common (soup_message_get_request_headers (msg), SOUP_HEADER_COOKIE, cookie_header, SOUP_HEADER_VALUE_TRUSTED);
+diff --git a/tests/proxy-test.c b/tests/proxy-test.c
+index 68c97aca..945de2cc 100644
+--- a/tests/proxy-test.c
++++ b/tests/proxy-test.c
+@@ -406,6 +406,52 @@ do_proxy_connect_error_test (gconstpointer data)
+         soup_test_session_abort_unref (session);
+ }
+ 
++static void
++connect_message_wrote_headers_cb (SoupMessage *msg, guint *counter)
++{
++        SoupMessageHeaders *hdrs;
++
++        *counter += 1;
++
++        hdrs = soup_message_get_request_headers (msg);
++        if (soup_message_get_method (msg) == SOUP_METHOD_CONNECT)
++                g_assert_null (soup_message_headers_get_one (hdrs, "Cookie"));
++        else
++                g_assert_nonnull (soup_message_headers_get_one (hdrs, "Cookie"));
++}
++
++static void
++request_queued_cb (SoupSession *session, SoupMessage *msg, guint *counter)
++{
++        g_signal_connect (msg, "wrote-headers", G_CALLBACK (connect_message_wrote_headers_cb), counter);
++}
++
++static void
++do_proxy_secure_cookies_test (void)
++{
++        SoupSession *session;
++        SoupMessage *msg;
++        SoupCookieJar *jar;
++        guint counter = 0;
++
++        SOUP_TEST_SKIP_IF_NO_APACHE;
++        SOUP_TEST_SKIP_IF_NO_TLS;
++
++        session = soup_test_session_new ("proxy-resolver", proxy_resolvers[SIMPLE_PROXY], NULL);
++        g_signal_connect (session, "request-queued", G_CALLBACK (request_queued_cb), &counter);
++
++        soup_session_add_feature_by_type (session, SOUP_TYPE_COOKIE_JAR);
++        jar = SOUP_COOKIE_JAR (soup_session_get_feature (session, SOUP_TYPE_COOKIE_JAR));
++
++        msg = soup_message_new (SOUP_METHOD_GET, HTTPS_SERVER);
++        soup_cookie_jar_set_cookie (jar, soup_message_get_uri (msg), "user=password; secure");
++        soup_test_session_send_message (session, msg);
++        soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++        g_assert_cmpuint (counter, ==, 2);
++
++        soup_test_session_abort_unref (session);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -438,6 +484,7 @@ main (int argc, char **argv)
+         g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_test);
+ 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
+         g_test_add_data_func ("/proxy/connect-error", base_https_uri, do_proxy_connect_error_test);
++        g_test_add_func ("/proxy/secure-cookies", do_proxy_secure_cookies_test);
+ 
+ 	ret = g_test_run ();
+ 
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.6.bb b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
index 206daa091f..b36976a2be 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-3.patch \
             file://CVE-2025-32049-4.patch \
             file://CVE-2026-1539.patch \
+            file://CVE-2026-5119.patch \
 "
 
 PROVIDES = "libsoup-3.0"

