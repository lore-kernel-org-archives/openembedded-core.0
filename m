Return-Path: <jason.stasiak@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E984CA5FB5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 20:51:21 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6709.1790715074730681489
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 13:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OTCLjJZR;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: jason.stasiak@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so2647045eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790715074; x=1791319874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6jNBkOItkJfDUEFBQ0eP14mVgZfUZuO0gJ0R1xz2aZE=;
        b=OTCLjJZRijLedDULBCJMIjXEs1ww7k46uuLGgwUJXODPOGzgybaTEBtr0pOdtDmWu4
         p6oWV3TXSAPCIGQZ81pS+rKN+C/6anPVZb9qZIo25pACZdjI8Yc/EWBn3IYzndvfJhbR
         fUZRyWBiYvkMA2kcn0qT7vkeFlTgd5WrdtEeuqa7XUsKBi+kGSmvCMPxWNmvGqG3m7GM
         dSwO8CcHt5/WuDkvzoTbOkLAN3TcbxUwrJbHxUlHufFweIpFkBjuhsKHy+qL6WjPTUWw
         +56o/+txU3G4nIZPUBZMv70p+GId5gt9f+yCaQL26BCGEAfvu8z0FNrwPNwGXhRMOPaW
         fkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715074; x=1791319874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6jNBkOItkJfDUEFBQ0eP14mVgZfUZuO0gJ0R1xz2aZE=;
        b=rBB6ESfWSA0RHuicjTQXF6+q0Yd+PdUELHRuXWGOCPhNIJipPSrDkCnH0C02I50kqw
         nTMQSIXeT2ux6Nq5as/RU65Y4mdCmwYWmcXROAvXBjIRzNgOAwKmneeoK4xhPpY+fE7k
         ZZKvaS+f8cY2TW3ZZ+sW+uZSBJLP6pWDQak6RxhptBfBtA4hQnH72FahLqbBaScNg9fG
         JkenC1JGdO0N+3Yzrk0Ed/N8/Ha62eCPs86VTrUxWfo1/3KSSuCLt0pAYVXkKNs5ivGQ
         8cilijoW30pLPeSXKV+UegmaDJwrD+SKrkCg2+6IrK86vQO3m1ZxXw2dKBR7u5aYPigq
         FBnA==
X-Gm-Message-State: AFuF++lNvWujoM4rrE+7Os3KhtS+BZF87zy5g+CBOoWwK5k4IzhgtrEu
	/XHnOO45PmYih0wmh+jt7dmw9Z951rBe7IO5z+B5VUoOeK8qsd6iKYROqPepcw==
X-Gm-Gg: AYBFou3zFnrfMccAjVoFvLTwPhkvcFBT1+UpFtMjL3F4pP2/j/rDY4KJU/brYa77PTf
	aQJrRXwGWy7V9xayXt15KFw3KVkYVqiGYLpfPC8xi5LaNL78HAivX9RBJWZwfisNooZoEk16vle
	2lOi5g0jHd1S+aXLKynd+lRSOwtQoa1zFk0X8kfQmnn0NKr39XqElWOD4hjBZFbTHIwvUYgWbA3
	wUPDrZ80bMahW4gPkggV29ZQDzGBB5Z37pwfA8dogPmiSwu+irJYSUD7O1iPYDptu16hGAsFjlD
	bx+Le9wXlpGfQLTrs58fVbdoJ787pUHvZ0bxH7IIQvw+SmCd3xzG5uiMauXeOYoMKA82PFzlaxu
	Q2JsEjjTBoiYYKaAYEgxbkzlmybDHrDs4tDpqAvpVoKOHQtT+t4Ri3j55GDjStBPdWRzsJVZrnn
	whkJEJT+lSzbjma/i7jSMCcVhg5zxCxy+6xNKNxS18bud/2PnkxEviKhGr76owIS3yiSR12kQSo
	8KdIa41c/4QjhjCLhhs
X-Received: by 2002:a05:7301:fd08:b0:34a:ab59:81ea with SMTP id 5a478bee46e88-34c64fad9bfmr582983eec.36.1790715073977;
        Tue, 29 Sep 2026 13:51:13 -0700 (PDT)
Received: from CHA-FQKPM83.ad.garmin.com ([65.175.40.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c378c9b64sm2655843eec.6.2026.09.29.13.51.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:51:13 -0700 (PDT)
From: Jason Stasiak <jason.stasiak@gmail.com>
X-Google-Original-From: Jason Stasiak <jason.stasiak@garmin.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 4/5] libsoup-2.4: fix CVE-2026-5119
Date: Tue, 29 Sep 2026 13:50:54 -0700
Message-ID: <20260929205055.2403390-5-jason.stasiak@garmin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929205055.2403390-1-jason.stasiak@garmin.com>
References: <20260929205055.2403390-1-jason.stasiak@garmin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 20:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246897

Backport fix for CVE-2026-5119 from upstream libsoup 3 patch [1].

[1] https://gitlab.gnome.org/GNOME/libsoup/-/commit/b0626fff8538e3dd4a52f148d91c8348d51d64d1

Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
---
 .../libsoup/libsoup-2.4/CVE-2026-5119.patch   | 129 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
new file mode 100644
index 0000000000..4df1a98ab8
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2026-5119.patch
@@ -0,0 +1,129 @@
+From b0626fff8538e3dd4a52f148d91c8348d51d64d1 Mon Sep 17 00:00:00 2001
+From: Carlos Garcia Campos <cgarcia@igalia.com>
+Date: Fri, 27 Feb 2026 12:03:25 +0100
+Subject: [PATCH] Fix CVE-2026-25119
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/b0626fff8538e3dd4a52f148d91c8348d51d64d1]
+CVE: CVE-2026-5119
+
+Signed-off-by: Jason Stasiak <jason.stasiak@gmail.com>
+---
+ libsoup/soup-cookie-jar.c | 25 +++++++++++++++------
+ tests/proxy-test.c        | 46 +++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 64 insertions(+), 7 deletions(-)
+
+diff --git a/libsoup/soup-cookie-jar.c b/libsoup/soup-cookie-jar.c
+index c8231f0e..b9abdc82 100644
+--- a/libsoup/soup-cookie-jar.c
++++ b/libsoup/soup-cookie-jar.c
+@@ -12,6 +12,7 @@
+ #include <string.h>
+ 
+ #include "soup-cookie-jar.h"
++#include "soup-connection.h"
+ #include "soup-message-private.h"
+ #include "soup-misc-private.h"
+ #include "soup.h"
+@@ -818,18 +819,28 @@ process_set_cookie_header (SoupMessage *msg, gpointer user_data)
+ 	g_slist_free (new_cookies);
+ }
+ 
++static gboolean
++allow_cookies_for_request (SoupMessage *msg)
++{
++	/* Do not send cookies to a HTTP proxy for a HTTPS request */
++	return msg->method != SOUP_METHOD_CONNECT || !soup_connection_is_tunnelled (soup_message_get_connection (msg));
++}
++
+ static void
+ msg_starting_cb (SoupMessage *msg, gpointer feature)
+ {
+ 	SoupCookieJar *jar = SOUP_COOKIE_JAR (feature);
+-	GSList *cookies;
++	GSList *cookies = NULL;
++
++	if (allow_cookies_for_request (msg)) {
++		cookies = soup_cookie_jar_get_cookie_list_with_same_site_info (jar, soup_message_get_uri (msg),
++		                                                               soup_message_get_first_party (msg),
++		                                                               soup_message_get_site_for_cookies (msg),
++		                                                               TRUE,
++		                                                               SOUP_METHOD_IS_SAFE (msg->method),
++		                                                               soup_message_get_is_top_level_navigation (msg));
++	}
+ 
+-	cookies = soup_cookie_jar_get_cookie_list_with_same_site_info (jar, soup_message_get_uri (msg),
+-	                                                               soup_message_get_first_party (msg),
+-							               soup_message_get_site_for_cookies (msg),
+-								       TRUE,
+-							               SOUP_METHOD_IS_SAFE (msg->method),
+-							               soup_message_get_is_top_level_navigation (msg));
+ 	if (cookies != NULL) {
+ 		char *cookie_header = soup_cookies_to_cookie_header (cookies);
+ 		soup_message_headers_replace (msg->request_headers, "Cookie", cookie_header);
+diff --git a/tests/proxy-test.c b/tests/proxy-test.c
+index 105a02a6..d8c7e8a1 100644
+--- a/tests/proxy-test.c
++++ b/tests/proxy-test.c
+@@ -435,6 +435,51 @@ do_proxy_auth_cache_test (void)
+ 	g_object_unref (cache);
+ }
+ 
++static void
++connect_message_wrote_headers_cb (SoupMessage *msg, guint *counter)
++{
++	SoupMessageHeaders *hdrs;
++
++	*counter += 1;
++
++	if (msg->method == SOUP_METHOD_CONNECT)
++		g_assert_null (soup_message_headers_get_one (msg->request_headers, "Cookie"));
++	else
++		g_assert_nonnull (soup_message_headers_get_one (msg->request_headers, "Cookie"));
++}
++
++static void
++request_queued_cb (SoupSession *session, SoupMessage *msg, guint *counter)
++{
++	g_signal_connect (msg, "wrote-headers", G_CALLBACK (connect_message_wrote_headers_cb), counter);
++}
++
++static void
++do_proxy_secure_cookies_test (void)
++{
++	SoupSession *session;
++	SoupMessage *msg;
++	SoupCookieJar *jar;
++	guint counter = 0;
++
++	SOUP_TEST_SKIP_IF_NO_APACHE;
++	SOUP_TEST_SKIP_IF_NO_TLS;
++
++	session = soup_test_session_new (SOUP_TYPE_SESSION_SYNC, SOUP_SESSION_PROXY_RESOLVER, proxy_resolvers[SIMPLE_PROXY], NULL);
++	g_signal_connect (session, "request-queued", G_CALLBACK (request_queued_cb), &counter);
++
++	soup_session_add_feature_by_type (session, SOUP_TYPE_COOKIE_JAR);
++	jar = SOUP_COOKIE_JAR (soup_session_get_feature (session, SOUP_TYPE_COOKIE_JAR));
++
++	msg = soup_message_new (SOUP_METHOD_GET, HTTPS_SERVER);
++	soup_cookie_jar_set_cookie (jar, soup_message_get_uri (msg), "user=password; secure");
++	soup_session_send_message (session, msg);
++	soup_test_assert_message_status (msg, SOUP_STATUS_OK);
++	g_assert_cmpuint (counter, ==, 2);
++
++	soup_test_session_abort_unref (session);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -470,6 +515,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/proxy/redirect", do_proxy_redirect_test);
+ 	g_test_add_func ("/proxy/auth-redirect", do_proxy_auth_redirect_test);
+ 	g_test_add_func ("/proxy/auth-cache", do_proxy_auth_cache_test);
++	g_test_add_func ("/proxy/secure-cookies", do_proxy_secure_cookies_test);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.55.0
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 18f82f8ef7..c79bced69d 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -44,6 +44,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2026-1539.patch \
            file://CVE-2026-1801.patch \
            file://CVE-2026-2443.patch \
+           file://CVE-2026-5119.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.55.0


