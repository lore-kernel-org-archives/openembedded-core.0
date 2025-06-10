Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A46BC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:38 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.90706.1749571769940290230
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PBvhl6zc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-879d2e419b9so4935115a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571769; x=1750176569; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZ67EFYr/BX4qNgDEdZ8MOxk1Co4uh4BfsmAbmUCefQ=;
        b=PBvhl6zcheEkFt8CUJA5b0O4OLcBPMSM0eXdAoAcsLelA82YYvLY/G/g9iPrg4uhrG
         yTl7i/XN4K86kdTJVwpgGYOiFvFkuGoUg5JDCn1l4Jhone1RcOXxMkZe4kNBFKjXdjps
         +8T2SYc7T9nmElF8VWs3N2QLk3BIOasVu8e3501CxkNA3qopaYuG7jtKIFY1CRlE8v7Y
         ar858l+J/VJuOm5hG8ys+7OD6gLYHa+oOO1fkhQ9r+WjoA7bIdYbNto6z+EhRE7MhMCg
         0Ce6gi5RaV4V2X9jy/5VsX5WH4Rbljpk16wgM6EHI4aKAiG8V45XRyMdl8vr29yYFZus
         Ch/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571769; x=1750176569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ67EFYr/BX4qNgDEdZ8MOxk1Co4uh4BfsmAbmUCefQ=;
        b=ucGfXGzArBwrp0GkfAe6nhOMUYvRnoJem36ClZUhcyJGt9KEzm4lvgHXD981asW13X
         rnP9XHOnEjT7u5yCiiLES9H+KGKt3AHLhW28wrrzA/FhLo/N/i1nfznUnj26UiIHk1t4
         ueYSY+XhfxkrAZYv8v5+UETzHuXUuwF3WNsSQvBcW/x1NyRmqw6b/Xguu8FLmveKgeAD
         0qibLvGw6ceyBJgqC7hKsZo1ox+AfbDeh+iDamnUH2x7BGPAis1inPkHbcodZUrjkE9m
         IOBjoaLzsjGCGU92xiG1LIWr+6Vnb/9rEDRdotWcdwqux09oRxNHfd6/wVA1riveZ1k2
         tE+w==
X-Gm-Message-State: AOJu0YzZHUire8xyfVUm8Z+dJjdwcYco/R28DC+qkGSEC+LlBhIJ3VIe
	hGOJlpEmAPV6SEkYxuII6sBxEZlLVf09hGJKpJh1TgnbryON367keIYQGVGY/EfhDIHAXaOwJKS
	B7562
X-Gm-Gg: ASbGncuzw4GDOOW3zAVZh8OU/8uoZZ3133NFVG7R95GFo374eLFYLlPgoZpJfAMp/Rd
	gN1zoqnOy6c71TMZgWe0RHBtiXLh59FuKTftNaDbTCUTImtyILrKDxNeHfycMuusAlJ5pZ++oGl
	gZn56iSzZ2J7iGbHcllDe5A/OWoMRl9sC6DJvzx5IPbqGqdDQPxqSaKHgHbLOk1Ek/Bx5NNRiVt
	B2qJFiS+QuSWIQrYE00xegp1vGJ9Ao+cIV0eytTqPeWcQu9p4eyrrrZ/liMpyzunG5NVcMS/CC1
	nBzyIDKTha2kpzkZIxCFu5kM/D2nOojMBt7z1UX2sImfsyX9qWSMHQ==
X-Google-Smtp-Source: AGHT+IGOtrahOvXA+6+Y8MLdtZmu94np4MyxCb4hctYAeC1yIQw0wEwa6DaJYuA4foK5n96mITqDzQ==
X-Received: by 2002:a17:90b:6c4:b0:311:c5d9:2c70 with SMTP id 98e67ed59e1d1-313af139e4emr207710a91.15.1749571769063;
        Tue, 10 Jun 2025 09:09:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 23/32] libsoup: fix CVE-2025-32908
Date: Tue, 10 Jun 2025 09:08:36 -0700
Message-ID: <6605a2b1f00e70e0756f73febc73ef01967ecb2a.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218392

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32908-1.patch    | 89 +++++++++++++++++++
 .../libsoup/libsoup/CVE-2025-32908-2.patch    | 53 +++++++++++
 meta/recipes-support/libsoup/libsoup_3.6.5.bb |  4 +-
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
new file mode 100644
index 0000000000..8ad0e16d45
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-1.patch
@@ -0,0 +1,89 @@
+From 56b8eb061a02c4e99644d6f1e62e601d0d814beb Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Tue, 15 Apr 2025 09:59:05 +0200
+Subject: [PATCH 1/2] soup-server-http2: Check validity of the constructed
+ connection URI
+
+The HTTP/2 pseudo-headers can contain invalid values, which the GUri rejects
+and returns NULL, but the soup-server did not check the validity and could
+abort the server itself later in the code.
+
+Closes #429
+
+CVE: CVE-2025-32908
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/451/diffs?commit_id=a792b23ab87cacbf4dd9462bf7b675fa678efbae]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../http2/soup-server-message-io-http2.c      |  4 +++
+ tests/http2-test.c                            | 28 +++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup/server/http2/soup-server-message-io-http2.c
+index 943ecfd..f1fe2d5 100644
+--- a/libsoup/server/http2/soup-server-message-io-http2.c
++++ b/libsoup/server/http2/soup-server-message-io-http2.c
+@@ -771,9 +771,13 @@ on_frame_recv_callback (nghttp2_session     *session,
+                 char *uri_string;
+                 GUri *uri;
+ 
++		if (msg_io->scheme == NULL || msg_io->authority == NULL || msg_io->path == NULL)
++			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+                 uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path);
+                 uri = g_uri_parse (uri_string, SOUP_HTTP_URI_FLAGS, NULL);
+                 g_free (uri_string);
++		if (uri == NULL)
++			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+                 soup_server_message_set_uri (msg_io->msg, uri);
+                 g_uri_unref (uri);
+ 
+diff --git a/tests/http2-test.c b/tests/http2-test.c
+index ef097f4..df86d9b 100644
+--- a/tests/http2-test.c
++++ b/tests/http2-test.c
+@@ -1241,6 +1241,30 @@ do_connection_closed_test (Test *test, gconstpointer data)
+         g_uri_unref (uri);
+ }
+ 
++static void
++do_broken_pseudo_header_test (Test *test, gconstpointer data)
++{
++	char *path;
++	SoupMessage *msg;
++	GUri *uri;
++	GBytes *body = NULL;
++	GError *error = NULL;
++
++	uri = g_uri_parse_relative (base_uri, "/ag", SOUP_HTTP_URI_FLAGS, NULL);
++
++	/* an ugly cheat to construct a broken URI, which can be sent from other libs */
++	path = (char *) g_uri_get_path (uri);
++	path[1] = '%';
++
++	msg = soup_message_new_from_uri (SOUP_METHOD_GET, uri);
++	body = soup_test_session_async_send (test->session, msg, NULL, &error);
++	g_assert_error (error, G_IO_ERROR, G_IO_ERROR_PARTIAL_INPUT);
++	g_assert_null (body);
++	g_clear_error (&error);
++	g_object_unref (msg);
++	g_uri_unref (uri);
++}
++
+ static gboolean
+ unpause_message (SoupServerMessage *msg)
+ {
+@@ -1549,6 +1573,10 @@ main (int argc, char **argv)
+                     setup_session,
+                     do_connection_closed_test,
+                     teardown_session);
++        g_test_add ("/http2/broken-pseudo-header", Test, NULL,
++                    setup_session,
++                    do_broken_pseudo_header_test,
++                    teardown_session);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
new file mode 100644
index 0000000000..b53c7efb7b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32908-2.patch
@@ -0,0 +1,53 @@
+From aad0dcf22ee9fdfefa6b72055268240cceccfe4c Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 28 Apr 2025 10:55:42 +0200
+Subject: [PATCH 2/2] soup-server-http2: Correct check of the validity of the
+ constructed connection URI
+
+RFC 5740: the CONNECT has unset the "scheme" and "path", thus allow them unset.
+
+The commit a792b23ab87cacbf4dd9462bf7b675fa678efbae also missed to decrement
+the `io->in_callback` in the early returns.
+
+Related to #429
+
+CVE: CVE-2025-32908
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/453/diffs?commit_id=527428a033df573ef4558ce1106e080fd9ec5c71]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../server/http2/soup-server-message-io-http2.c   | 15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/libsoup/server/http2/soup-server-message-io-http2.c b/libsoup/server/http2/soup-server-message-io-http2.c
+index f1fe2d5..913afb4 100644
+--- a/libsoup/server/http2/soup-server-message-io-http2.c
++++ b/libsoup/server/http2/soup-server-message-io-http2.c
+@@ -771,13 +771,18 @@ on_frame_recv_callback (nghttp2_session     *session,
+                 char *uri_string;
+                 GUri *uri;
+ 
+-		if (msg_io->scheme == NULL || msg_io->authority == NULL || msg_io->path == NULL)
+-			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+-                uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path);
++                if (msg_io->authority == NULL) {
++                        io->in_callback--;
++                        return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                }
++                /* RFC 5740: the CONNECT has unset the "scheme" and "path", but the GUri requires the scheme, thus let it be "(null)" */
++                uri_string = g_strdup_printf ("%s://%s%s", msg_io->scheme, msg_io->authority, msg_io->path == NULL ? "" : msg_io->path);
+                 uri = g_uri_parse (uri_string, SOUP_HTTP_URI_FLAGS, NULL);
+                 g_free (uri_string);
+-		if (uri == NULL)
+-			return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                if (uri == NULL) {
++                        io->in_callback--;
++                        return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
++                }
+                 soup_server_message_set_uri (msg_io->msg, uri);
+                 g_uri_unref (uri);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.6.5.bb b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
index 3cd4342bd4..a8c0546677 100644
--- a/meta/recipes-support/libsoup/libsoup_3.6.5.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.6.5.bb
@@ -15,7 +15,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-32907-1.patch \
-           file://CVE-2025-32907-2.patch"
+           file://CVE-2025-32907-2.patch \
+           file://CVE-2025-32908-1.patch \
+           file://CVE-2025-32908-2.patch"
 SRC_URI[sha256sum] = "6891765aac3e949017945c3eaebd8cc8216df772456dc9f460976fbdb7ada234"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


