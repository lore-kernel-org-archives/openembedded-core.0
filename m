Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 209F0CD37B2
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8178.1778224365587543464
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=srgkY0BR;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-44b052142e1so985977f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224364; x=1778829164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6q4JOB+29Cq8GBclU0L7I8HAiP7+0Im4jCGzTnZQSI=;
        b=srgkY0BRlCFW4kd71HVPNVP/JZA+kK39/EHZY1uff6IZgsBZrISF+O1cm9vp6RWL3f
         Y/SWLvvx7Rcr8UFKOlnTen0V98g5pHxS7O+ijFxP1VVjolTPNnr8fUFKpzJdrfcUQNNz
         8o63fFG9oL1c1X3Vrp6ypCgNaS+Ial9UnshoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224364; x=1778829164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6q4JOB+29Cq8GBclU0L7I8HAiP7+0Im4jCGzTnZQSI=;
        b=i4tg6pLLKA3LK2S0l3CLEP6K+2SUbYVwraCYrm6AlVYe1O/jOkxmYMZPfrAO3tlHMt
         DtLzpPd+PDKDiFyIey0TUmeRWtllzeIL5amyM2kH8nKUpTt2GBEzmvy9GCgCibCpNIAC
         FxhZ0UNk//AiHY8zqYoYXI8TMZJMO958z3VczOTlP5JCO6pXvsm/Bh6Kw7EE8BxG5thJ
         2SE+ymO8NIUC/hY05Axavw6U4s9BRxHEJArvoNnMaYdAw4udPdPO6dHLDtCoy9ha6i6v
         TZXk9O52yT7Y7lQQ6BOE7JltBTO6iuDiPmPmRbrD1q+QaBG8p6HSbdiFlxQaxOJIMnM5
         CWDA==
X-Gm-Message-State: AOJu0YyDRqVOLOKVJLV5ng0938XI1O0lV8bloBLpqWAsFGn8sLRncsLe
	lpFCE/B7oSTaPRSllAiuOPGLgRpCdh9ooW8UeO07aZvnwQLqbUpP73//Aab7Kd7L05rMkolQE72
	5dpN8pw8=
X-Gm-Gg: Acq92OEnrAmm8GMJRbl0WHcy/UlJBFQ3FPQBbuq8Piwu1NMMp1fycjdkHmrhUkLB5UI
	z26F2fSIOyEFySTsk8TlScKZACTg2/I2gLFIheyxD90LLr9KkrO/VKg815Sxezw1I9fb+urjjYa
	woUvD7G2BMAqdHYpQ8vc9s35a6YSNhAW9gfOQyVDw3BwVE/ltNKv+qFQ3/F3dUk2CGVLqcC0Gc6
	DGI/qAVWDwIfVzjFQKv4NDAx52lDsEjAsTqdWDJqAQeFOoWnDKstZBqaQhg8GB5RUzdwxuTeHwW
	bCKjzdsYVvigX3nw+1eq5iflTTzWlWjhy62g6cirMnFEP8wUB9lVCR5VPY7gvy+wEKF9RaWlS4R
	yp5ADgTVZN1FDm/ZZoERMIgKXlGcotRHmT5wZSeZmX/vME76SUx1cjZn668j33Xy8LjQ5aCXEQM
	Zn3cuRBYR6nvAE1ooC8UcJdZHQazisaBiqVmKThV2PI5iFaICLnS9uUTz6BVUQkVPIbjmalhN7t
	ji7IiWbOViOtYHZTNFUMR4HRvs=
X-Received: by 2002:a05:6000:2310:b0:43d:6f0f:32fe with SMTP id ffacd0b85a97d-4515d5c54a9mr16850933f8f.31.1778224363053;
        Fri, 08 May 2026 00:12:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 43/52] libsoup: patch CVE-2026-5119
Date: Fri,  8 May 2026 09:11:36 +0200
Message-ID: <5b40cc1b51f243d2bdb9d7e65da4922488e7afba.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236685

From: Peter Marko <peter.marko@siemens.com>

Pick commit which closed [1].

[1] https://gitlab.gnome.org/GNOME/libsoup/-/work_items/502#note_cb3be24d375814549d21c03821672ed6749df36a

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cdc9de40b460c65f642ff2d128f016b023ff170a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsoup/libsoup/CVE-2026-5119.patch       | 122 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.6.bb |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch b/meta/recipes-support/libsoup/libsoup/CVE-2026-5119.patch
new file mode 100644
index 00000000000..f5e3f91b000
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
index 206daa091f2..b36976a2be4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.6.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.6.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://CVE-2025-32049-1.patch \
             file://CVE-2025-32049-3.patch \
             file://CVE-2025-32049-4.patch \
             file://CVE-2026-1539.patch \
+            file://CVE-2026-5119.patch \
 "
 
 PROVIDES = "libsoup-3.0"

