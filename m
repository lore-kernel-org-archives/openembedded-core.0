Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329A5D591CC
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 06:13:08 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.14768.1731996785306576687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 22:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DjokP/dX;
 spf=pass (domain: mvista.com, ip: 209.85.216.48, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so386337a91.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 22:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731996784; x=1732601584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7iXKtyYL4VgC2/JkWmp/T2KWQsWlmtRmtX+ulT2b06Q=;
        b=DjokP/dXHq/ntDNRwyeU+pUKPbw1hEq0y695808md6CcrhHG0utFI8YL6I/fhNvCRa
         9+3GDAUa3vtLrd3UTANCS1zS3utKzXmJH2PvYDdBB/bQrmGrXv5C3DM7fW1KgpGZL7mC
         3m69zND1xBUCRDSXs2G2nhzPP0w3f9PKD2yWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731996784; x=1732601584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iXKtyYL4VgC2/JkWmp/T2KWQsWlmtRmtX+ulT2b06Q=;
        b=ojKb6Bcma3Qce+o1w/ffrZD4l2RTSxiZKgUX9/ttQekHCVEOAQ+Q4XTtj3G+r5YIeP
         qoZaozIq0aDAsDvQ1HJB7//ZdNMh2UWmP/fX6ery5bq/6xVjcDXYQUeMQUD/am/6FCcV
         gce+mfDODtCjQFL7//gCjAcxxM+Kb58acmvXzEcL1dY7N0n9Ta59gsYlQPYnjbRBPtPs
         ebKJVsw9Ew3uzF3zuuZ3+h5rOTrYI+3dx+C1YgfwSRoBPlZzlyw9Adtj59vlzWwxPV50
         CsQa2K2+v7a/PZYwKolG4NeVocilScqrzbHpb7t5cdd87JrMZ+57c4IXpodyrIdMDGM6
         iZrA==
X-Gm-Message-State: AOJu0Yxsyt0FVVXT2kuvV1gpdgXoZM7BJz43I/Rfic5dtPqDJCeLKB6d
	d/zjAL8/UkupuJsAzb938g+gy8/6P49NmvAMMGImkCYZanbFjSTN5T48d1ElzVkHoE1hR2PI2Qf
	u
X-Google-Smtp-Source: AGHT+IF3L6o9/HiQ1WLV9281g4s04rAhxho9J6O9ZSlwTaB8gUL+O2WrSobj+LCJ0NRoT9ao2VlPyA==
X-Received: by 2002:a17:90b:4a47:b0:2ea:5e0c:2848 with SMTP id 98e67ed59e1d1-2ea5e1b7311mr10129654a91.14.1731996784395;
        Mon, 18 Nov 2024 22:13:04 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ea5f7f9dbasm3660393a91.21.2024.11.18.22.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:13:04 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCHv2] libsoup: fix CVE-2024-52532
Date: Tue, 19 Nov 2024 11:42:55 +0530
Message-Id: <20241119061255.69550-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 06:13:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207380

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be && https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup-3.4.4/CVE-2024-52532-0001.patch   | 42 +++++++++++++++++++
 .../libsoup-3.4.4/CVE-2024-52532-0002.patch   | 36 ++++++++++++++++
 .../libsoup-3.4.4/CVE-2024-52532.patch        | 42 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  5 ++-
 4 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0001.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532-0002.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532.patch

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
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532.patch
new file mode 100644
index 0000000000..272abb3abf
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532.patch
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
2.25.1


