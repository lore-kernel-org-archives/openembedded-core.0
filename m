Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13973E64024
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 21:54:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.10671.1732226064959991331
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 13:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l8dzfnmx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-724d8422f37so723023b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 13:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732226064; x=1732830864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HTViZ8zlibF3Mm53HBCOzdE7aYAcKSWhNkxhAStw/4=;
        b=l8dzfnmxUe79/sGcLfRz/TE4C7jyMwtQ2k4L8+4dTONzuT8n1FNlZpZ4DzIf6eMmJw
         SuJguW6kWHOt4SvngkI8Fbky2faDTzlAfXoUOsAFgnm9PjhRf2oIuts9Bi+btcMjrrda
         +fxrcOX82P0PJ7oXASyBjy/n1prWTBn7oEOSxt3ODKC3HfgTbhGsdvC46zo4zYz3r9gB
         ujRguSYY9L6ILdnJyqmwit0TXAgq/aIh9yEooZoeTbWCJrxZf725WlUr8TmBSg6gtZch
         WJFBzmR7gh0mLi8KMjIM+3z1p9CgqxDzUxSoYAwH1SdXLGLovmGic6wTTzv3OnvcEGpy
         G6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732226064; x=1732830864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HTViZ8zlibF3Mm53HBCOzdE7aYAcKSWhNkxhAStw/4=;
        b=k5RvrvGBQ87sTDn43n9uRz/05UKQOFthMwu9bPBpHAS8PGWK9Dna0QTRhYocWh5FbP
         PnK1fby+yAQcenneXYtJG6S0WpWiLqvkDAmqjWEQT3+N5llQzEKrS6m6dDDtVohTq5SM
         XencgUOlRF34jN5ytoFvJ6P8ShbEWJ/7Npg9k1WkYJRn4qeKwdnrp16HM49jKDCv7a8E
         jcAq2rN6biPbGgjeHkvKUfOmzNrTuuKeQ2TJ6mN2IH+tbxsYVhk/mWkLm1X9Cl+bpaSq
         RcitmKZ0VqyTDpHqTulq0VcJRuIj4vnPzg59+qgyRfujk4vaYYAsCL1YQn25qxEBbMtZ
         ETfg==
X-Gm-Message-State: AOJu0YzhdN5IMJdu4spSiwhPa1TyTGYG/xxhPPdXwXg7owctlchBNHRS
	pFSKBRGA1MXGhU7vANqIIub5uOU33P5e2x3QUNJcQAj4ay8B/tylHEmiL23qUkABlqodJ/NPjop
	b
X-Gm-Gg: ASbGncsU57ps+LGfOFbAEJ860gxw95XZwpRTpb+WxKagLRDFRE3k90+BM/gEl9gvLSm
	9TY7/B86zYbtqhTD8HMFqXd2+Hhc17qs+cQbgfnwvIvu6NLKRqTim6zKMvaFfaKYQVjYmJmNj6O
	lMyTqrr8pAptLFkftCD08Rl3oWoZB5c4XaV3ixOKpAre/f73eRyPYUwDsZUAZ4cHeAU10f23Zyp
	oF2zu6Uk1PBDQ87/kyDN1e04hej2/Nm1bY38Zk=
X-Google-Smtp-Source: AGHT+IH5yaMweKzf+I9YE7udtn0XhwWgptuT5Ih5PXIKAuGKccP7cU0CjXj5zX3aXoYhv7FeXu8MyA==
X-Received: by 2002:a05:6a00:3ccc:b0:71e:79a8:1d84 with SMTP id d2e1a72fcca58-724df3c81e3mr750684b3a.3.1732226064020;
        Thu, 21 Nov 2024 13:54:24 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de47eb05sm249710b3a.75.2024.11.21.13.54.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 13:54:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/27] libsoup: fix CVE-2024-52532
Date: Thu, 21 Nov 2024 13:53:51 -0800
Message-Id: <5a28744c74270905d4b29285589a399df4c9cb68.1732225943.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732225943.git.steve@sakoman.com>
References: <cover.1732225943.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 21:54:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207556

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be && https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2024-52532-0001.patch   | 42 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2024-52532-0002.patch   | 36 ++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  5 ++-
 3 files changed, 82 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch
new file mode 100644
index 0000000000..272abb3abf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch
@@ -0,0 +1,42 @@
+From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already != NULL and it will assert.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
+CVE: CVE-2024-52532
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index b954b01..9b37780 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1489,8 +1489,9 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 127(\x7f) as payload length with 65535 extended length */
+@@ -1503,6 +1504,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+         g_thread_join (thread);
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch
new file mode 100644
index 0000000000..a1690a9980
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch
@@ -0,0 +1,36 @@
+From 6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be]
+CVE: CVE-2024-52532
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index 2f7d920..df8f67d 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -1165,9 +1165,9 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		priv->incoming->len = len + count;
+-	} while (count > 0);
+ 
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !priv->close_sent && !priv->io_closing);
+ 
+ 	if (end) {
+ 		if (!priv->close_sent || !priv->close_received) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 6f7cac4cf8..0e66715589 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -11,7 +11,10 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2024-52532-0001.patch \
+           file://CVE-2024-52532-0002.patch \
+          "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
-- 
2.34.1


