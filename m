Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2930C71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.96410.1749584077955917735
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GbVfsWhL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5889723a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584077; x=1750188877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YpNbkV5mdJT74wnbQdwkPYzbabp/UQZTecy9p01vjRI=;
        b=GbVfsWhL9aTrCrty15UbXraJA60qv0THlCuNgMwgfl+5j7qo1YhK3Lc7s9ar4pq6q0
         rOBvncbPH7iNv2KJ8rExo9UbPrzioctY6cKPvIlTOLGvXy3ViU1mH9YmbqfrYMta47ru
         sXScCdavd0uqacfByK2b3lpwEkg8vf74qedD2EQEhSb1yvC9lBkv6NasTN+HyJ5qpc5A
         bDoutjKQxGp22X+BPVWVjmRSoEG4EpdTKAWnG4ygI2pGHclGU5Q6VXxFi7ezIlbsi+wb
         07aGYzUrAwH/dQC/igKfZDLs2+dZCKJMoboAdpk8rbbzYvM1AKBBYqJD96ewHhFMsuBS
         Sa2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584077; x=1750188877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpNbkV5mdJT74wnbQdwkPYzbabp/UQZTecy9p01vjRI=;
        b=gKir0uFCBSZ4CxsgP6J2PK3EmCOSZHp50PdebP6OFnju2rF07bxHS8jQ/h3MMpmQf8
         18H4l6/n3h+88nXit7YlDGV+G5tUfEB46xv/xgSFig5kq6DDvpMJVPyf7XIdM+MlNRox
         NBYqwC5E01wqDo9D2eHLtKFtfSBaLgTT+52JxokKx4cHeMRsCqYRzgCp7oiYEXVMeVHD
         O5WjKCQCLHI9fSWaSR4B3p2Wz7d/lt3D+lAuMIql2SbR1w0S4unRDP/mKZ773u3NzJxQ
         eUeKyvj2SlDX1T9DM1hNqspySJgu4s+1dDAdcu/MUjeUHzKIcbKZWHmUl5bZoLCEIWES
         I6hA==
X-Gm-Message-State: AOJu0YwJAsx6MGBDQcEaphc6xiC4RV8FK8W6IaerutsY+2xAFx5N4opR
	7zqGPggF3HuzNqJWq45/ql57z8ZiREMhsDPM3s9RJYjmreKlQiG06UCpiLnflwqzyzqMNqv2/Uq
	iZeZs
X-Gm-Gg: ASbGncsBxK0P1xaxBvXkXksCtaiIfandDjMHdL1xb3CGAQElwTUrTXUOhh59JC1/ycm
	G27Z95zJXwu0G1W6H4GeFaSrwxXedmUrHH3hZ5uQPGxBU84VM2w9TaE6RBOXIMF6+hDynKQ2AsP
	9D+wpUOf2Z/my5rjBIodevc8pdiho8kq0/5WT7PErsbxsFKC0xPAEaGF9OpXiTN0y6usmY5JqJ9
	CnEiX18LRVo4jdVSVjOqesX3rC+on2zgw/4LAEe8GkrzgU6iQlrwqzBCPdRh0oKZY3Ss9q95zDA
	GuyWs0gPp/dxIGHx8yEZgSYULMZiqd9s5eMlmalVJdL4qTxrwnzx5A==
X-Google-Smtp-Source: AGHT+IERorebaBgkkkZm9mh7npVMkuayJLb6PhNkBIW9Pvw/c36WQJCL1tQoZA7+XtxHgD1hJLp5sA==
X-Received: by 2002:a17:90b:548d:b0:312:db8:dbd1 with SMTP id 98e67ed59e1d1-313af148f14mr960047a91.5.1749584077046;
        Tue, 10 Jun 2025 12:34:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/16] libsoup: fix CVE-2025-46421
Date: Tue, 10 Jun 2025 12:34:02 -0700
Message-ID: <f1450eea34202a9cc46294e3d8244c829556c369.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218412

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/439

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-46421.patch        | 139 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
new file mode 100644
index 0000000000..72683d8fce
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-46421.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 23d44d1572..473a980b1a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -41,6 +41,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
            file://CVE-2025-32050.patch \
+           file://CVE-2025-46421.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


