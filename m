Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251BFC61DB8
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 16:00:23 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.37083.1749225619118255367
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 09:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k2ByG1MY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so2385885b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749225618; x=1749830418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ex7fX8vEvjANg8XHcLIwRrB6hvYUIuOLA6E7fknD644=;
        b=k2ByG1MYIeS6Ye4a90vvcaDqnAkq2YpFkHOSYNXjwRgtBnr1NQUWbx/U9GMcRPUrBZ
         NbjESckw+av6yg1YCx/rT7ON4oujqZvPZfWEpPKzc4ZSMEeBaU19E+2Se/IRBx7Gor/O
         mrFUCeoqitf87XYvtS3PMKIdnnSozC5GBb5Tcq8kgzl3oji0ratGzB9i3kuId3jPmYU/
         g0hIBXQwc35GoHsUWMkSmXZ+A1e7DeKi7rfOCkdk7icWIqhKJNz1C1ftcObI/rbKgUBZ
         TyO45Qx0h9S2LkcFXQ8t9XNhOR6Fk17LE0PtIgCj7aHJqV0qBI/S5PgV7ZiI1oYQi9TL
         0RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749225618; x=1749830418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex7fX8vEvjANg8XHcLIwRrB6hvYUIuOLA6E7fknD644=;
        b=jhDKZsto5NcQ+Xu5u9bzJ9M5PVPwe5HLmkr7cGX23j7sGQC2kxiWXKXfy6tX8qTlnf
         JKEKhG/BVl3C+yJF6g9lip+E8Jmr/AfhUge+4/MO6lz872TEA1/jiXAUJuVtrFOxrTDT
         5X9yFp13ilIAwwU0Za++zfokq6Jn1+IDF4SIo1DhA3iWRKry7hgQADKapJBYCS8kR3I9
         DuaD0+RpCD37/NYaqoSOGm0krWwrO1qmVbGRE3Tt956j4oz5tPAmmOd+iLqeI6dNtHKW
         +hOa/dCtgklcoWjo+xkMc+nsSob5LB6Kd3XtipsbZ5JIo6n1gI6LLFJ6Xn5Py/UhEJwr
         3jnw==
X-Gm-Message-State: AOJu0YzzZO3YxscwctXjq/RdsBNv3phX6dppdbT1OWqQWgXQ9vPUjPC8
	RoKYUWSm57duy60soHOrWRfGkJPPTuMa6ZI2lv0c7L8Xu2eaM7orw6FJh8SfTInthMtb8y6O3zQ
	484UL
X-Gm-Gg: ASbGncuGpzwN9PRXwe0+fsLx+uCmCnqEq6IUPznKSAOJSePQ/6+qIFdw17TxuH9dTOk
	I6Cmmx2xX2tFzq2QchzN/hhaniMIkLizCzxqnyNzTbyvu1uyAcu4cr0/trWLodmvcO7Vg2OqVXp
	4R/FKe4hhqda2zo86oRSYnkXAUzzp8KrIDNP7UjjFkO3edKbuhrhJis+AwmY+9gJNw2Nrhm92WH
	rFueHQnwkeYOjXtaqt7TJFU0WBfKQTjGVHHkalkDiRD0mccVsqQ8zFTx0hRKjFX2TdNCp8VhNbf
	bMLO1zPAVRfQPiQLc2/99w7Oew8wwC1KQ4ugJ3UseaAxWso4lO/wSBlDth80P0vO
X-Google-Smtp-Source: AGHT+IF0ICYBCgnyAeOO5zd2/SpWWbFAKSpdNIm2RDN078mdWiL+fB5c/PPnh+5+w7dyJqo0iOgzNw==
X-Received: by 2002:a05:6a00:cce:b0:73e:30dc:bb9b with SMTP id d2e1a72fcca58-74827e50eb9mr5542165b3a.2.1749225617919;
        Fri, 06 Jun 2025 09:00:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:742a:4153:2a1f:f028])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b083a9bsm1436489b3a.77.2025.06.06.09.00.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 09:00:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/12] libsoup: fix CVE-2025-32908
Date: Fri,  6 Jun 2025 08:59:54 -0700
Message-ID: <ff7440fddf5ada072f60cc25f3670cbb74f58167.1749225418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749225417.git.steve@sakoman.com>
References: <cover.1749225417.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218163

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/429

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32908-1.patch      | 89 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32908-2.patch      | 53 +++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  4 +-
 3 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
new file mode 100644
index 0000000000..8ad0e16d45
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch
new file mode 100644
index 0000000000..b53c7efb7b
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32908-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 21a1bbe6cd..c19be9b5f4 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -32,7 +32,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
            file://CVE-2025-4969.patch \
-          "
+           file://CVE-2025-32908-1.patch \
+           file://CVE-2025-32908-2.patch \
+"
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
-- 
2.43.0


