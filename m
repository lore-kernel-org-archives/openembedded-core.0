Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D833C7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:32 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.27811.1750604551238475773
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kxelXlnt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747ef5996edso2491805b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604550; x=1751209350; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eR1Nm13rICRDac20kubTrKj0gusCPe6VrULwNpIqSXY=;
        b=kxelXlntpzogMzrcOZnl46ix8ApUoJ2ykeHHGbqhrpayHoxcscAy0oU4erG9vwSXLO
         Yai/GeifCI60/fEaT2Xaw4SQjQOO1XIGP+Ge7TBrH1tMDEb9lgiZ81pz2EyzxnDWCppA
         +5JRJiKXeUCNpnMjB2XHNlt0LhCt/T0khjQGs2QtrBsSwMygw8DYD8uKyZjp7gpmIUFS
         w7ZGJ3Hhyo4kAI4zhrXLgy3qWO3SkWX6YWvjRs6KNEOSpq4JybcKLe2dVSndVgGwRB33
         wr9gcRuuoJeE21xxDztpA5fKg7/tOY0IMcSG3vdaYsEqzi4lIJvrksWb79uHpUZsVnAz
         PySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604550; x=1751209350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eR1Nm13rICRDac20kubTrKj0gusCPe6VrULwNpIqSXY=;
        b=dD+dh89XY0gzLqP/Lsmpb2LVJRUHi8QXx2XQHCF6YnqaNJ+hCJ9puTcO8MZMAvQJzf
         gtIxgW22g6CKEQAJIxwG9kXN284XYhY+dz2V/b4aqPjwiPYSMJ/E6FQHm5BVU8JksmUL
         ATqBFSMhbLyDqzSrUVvi8tY2Ryuyt4ThRRXgCOO9ejW2MsGe/D/GBGoYnbmdo24aQ6tg
         XJTqGF5Bm8eU95EkbSJtoL4f7IKrTHz6mUJJ+gjitXoVFzEKyqX4+WV1KyPshmCmDe/n
         KSR2hCvRcba/DSgpjwtTzcuWBvaE2+sbsyzvO/4LKRF8Od10p5yM6+kNdOzkxpUfMShO
         RCkg==
X-Gm-Message-State: AOJu0Yydnc7QTsWcYP/c1nDJMT37YUtz0KFeOKYZiduBZXGXsTTO0CMA
	eaXXr8nEDMP7J2Ebc7jNtudQp1G9bbKcko338sfo5H2htYwV/j8JANKaKxiyJvxQCfiPwU5ieQd
	jpKLd2iw=
X-Gm-Gg: ASbGncvItYZaQk41TVWEf3hwY+qjlDOtBcpYi9laG8zzrEpqF9xm0XG3XDlBT4aem6x
	ovPV9GzCygDUmmRfIxnfk38Pwwb77w+iCNFC17Z6TGvBq/QTWGF/ZfkJfbYnP+nzm79bTCX4CtC
	X+aNaBCUrpIWRKNrHXLjU5lVtD8a4mYtNPM52PRywu1QaNDNr+Re+iRgmg65J1y2fLItYlPFg8o
	L9JwK6mNUkM5TJwQrB0tX9UbqN6fKo8F78Y2JAMIxnLiqULjEg1gTn/zqQTuU555ITYQoCMtzWO
	8BtLv+UggnXpQMvgJb/E6n9uI7Hbh/++HxSJugUtEPsVQhId3k+EDA==
X-Google-Smtp-Source: AGHT+IHBaVt1w8bfxZ3OTbOaERG4Aeb/2xWAy1W1gDdcECOb7MqYpgzJwxoijYmsRQQPyBFONB/Gqg==
X-Received: by 2002:a05:6a21:6d9c:b0:1f5:8153:93fb with SMTP id adf61e73a8af0-22026e8cef8mr13689083637.10.1750604550318;
        Sun, 22 Jun 2025 08:02:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/14] libsoup: fix CVE-2025-46421
Date: Sun, 22 Jun 2025 08:00:00 -0700
Message-ID: <388453296c32759623ed35a8142c6af2df7f30b0.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219184

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-46421.patch      | 139 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch
new file mode 100644
index 0000000000..72683d8fce
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-46421.patch
@@ -0,0 +1,139 @@
+From 85c5227eef7370832044eb918e8a99c0bcbab86f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 16:18:10 -0600
+Subject: [PATCH] session: Strip authentication credentails on cross-origin
+ redirect
+
+This should match the behavior of Firefox and Safari but not of Chromium.
+
+CVE: CVE-2025-46421
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/436/diffs?commit_id=3e5c26415811f19e7737238bb23305ffaf96f66b]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-session.c |  6 ++++
+ tests/auth-test.c      | 77 ++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 83 insertions(+)
+
+diff --git a/libsoup/soup-session.c b/libsoup/soup-session.c
+index 631bec0..9f00b05 100644
+--- a/libsoup/soup-session.c
++++ b/libsoup/soup-session.c
+@@ -1230,6 +1230,12 @@ soup_session_redirect_message (SoupSession *session,
+ 						   SOUP_ENCODING_NONE);
+ 	}
+ 
++        /* Strip all credentials on cross-origin redirect. */
++        if (!soup_uri_host_equal (soup_message_get_uri (msg), new_uri)) {
++                soup_message_headers_remove_common (soup_message_get_request_headers (msg), SOUP_HEADER_AUTHORIZATION);
++                soup_message_set_auth (msg, NULL);
++        }
++
+         soup_message_set_request_host_from_uri (msg, new_uri);
+ 	soup_message_set_uri (msg, new_uri);
+ 	g_uri_unref (new_uri);
+diff --git a/tests/auth-test.c b/tests/auth-test.c
+index 484097f..7c3b551 100644
+--- a/tests/auth-test.c
++++ b/tests/auth-test.c
+@@ -1,6 +1,7 @@
+ /* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
+ 
+ #include "test-utils.h"
++#include "soup-uri-utils-private.h"
+ 
+ static const char *base_uri;
+ static GMainLoop *loop;
+@@ -1916,6 +1917,81 @@ do_missing_params_test (gconstpointer auth_header)
+ 	soup_test_server_quit_unref (server);
+ }
+ 
++static void
++redirect_server_callback (SoupServer        *server,
++                          SoupServerMessage *msg,
++                          const char        *path,
++                          GHashTable        *query,
++                          gpointer           user_data)
++{
++    static gboolean redirected = FALSE;
++
++    if (!redirected) {
++        char *redirect_uri = g_uri_to_string (user_data);
++        soup_server_message_set_redirect (msg, SOUP_STATUS_MOVED_PERMANENTLY, redirect_uri);
++        g_free (redirect_uri);
++        redirected = TRUE;
++        return;
++    }
++
++    g_assert_not_reached ();
++}
++
++static gboolean
++auth_for_redirect_callback (SoupMessage *msg, SoupAuth *auth, gboolean retrying, gpointer user_data)
++{
++    GUri *known_server_uri = user_data;
++
++    if (!soup_uri_host_equal (known_server_uri, soup_message_get_uri (msg)))
++        return FALSE;
++
++    soup_auth_authenticate (auth, "user", "good-basic");
++
++    return TRUE;
++}
++
++static void
++do_strip_on_crossorigin_redirect (void)
++{
++    SoupSession *session;
++    SoupMessage *msg;
++    SoupServer *server1, *server2;
++    SoupAuthDomain *auth_domain;
++    GUri *uri;
++    gint status;
++
++    server1 = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++    server2 = soup_test_server_new (SOUP_TEST_SERVER_IN_THREAD);
++
++    /* Both servers have the same credentials. */
++    auth_domain = soup_auth_domain_basic_new ("realm", "auth-test", "auth-callback", server_basic_auth_callback, NULL);
++    soup_auth_domain_add_path (auth_domain, "/");
++    soup_server_add_auth_domain (server1, auth_domain);
++    soup_server_add_auth_domain (server2, auth_domain);
++    g_object_unref (auth_domain);
++
++    /* Server 1 asks for auth, then redirects to Server 2. */
++    soup_server_add_handler (server1, NULL,
++                    redirect_server_callback,
++                   soup_test_server_get_uri (server2, "http", NULL), (GDestroyNotify)g_uri_unref);
++    /* Server 2 requires auth. */
++    soup_server_add_handler (server2, NULL, server_callback, NULL, NULL);
++
++    session = soup_test_session_new (NULL);
++    uri = soup_test_server_get_uri (server1, "http", NULL);
++    msg = soup_message_new_from_uri ("GET", uri);
++    /* The client only sends credentials for the host it knows. */
++    g_signal_connect (msg, "authenticate", G_CALLBACK (auth_for_redirect_callback), uri);
++
++    status = soup_test_session_send_message (session, msg);
++
++    g_assert_cmpint (status, ==, SOUP_STATUS_UNAUTHORIZED);
++
++    g_uri_unref (uri);
++    soup_test_server_quit_unref (server1);
++    soup_test_server_quit_unref (server2);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -1949,6 +2025,7 @@ main (int argc, char **argv)
+ 	g_test_add_func ("/auth/auth-uri", do_auth_uri_test);
+         g_test_add_func ("/auth/cancel-request-on-authenticate", do_cancel_request_on_authenticate);
+         g_test_add_func ("/auth/multiple-algorithms", do_multiple_digest_algorithms);
++        g_test_add_func ("/auth/strip-on-crossorigin-redirect", do_strip_on_crossorigin_redirect);
+         g_test_add_data_func ("/auth/missing-params/realm", "Digest qop=\"auth\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\"", do_missing_params_test);
+         g_test_add_data_func ("/auth/missing-params/nonce-md5-sess", "Digest realm=\"auth-test\", qop=\"auth,auth-int\", opaque=\"5ccc069c403ebaf9f0171e9517f40e41\" algorithm=\"MD5-sess\"", do_missing_params_test);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index be29ff0e5d..49aa28964c 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -42,6 +42,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32907-2.patch \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
+           file://CVE-2025-46421.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


