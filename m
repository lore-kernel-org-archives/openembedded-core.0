Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD66D4920E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 05:26:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.14222.1731994009577318660
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 21:26:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B4J7VUKv;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-211c1bd70f6so37001065ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731994009; x=1732598809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j//utmCLmHbOfmRxJW3HVRPBa+PJ0D/eZ4j9V3ZnD8k=;
        b=B4J7VUKv15RRZTRZFrOoWlvc+syO+CNUpQfA0wpnNpV4PG0IKbvVNhRc8iNZJWZiUs
         ReOWvmBaQ9GmvvWfaCXnx0HvSr0Bv6a3KFdQzuB0rHJ7fcpRSix8a3NNqt7/UzR1cYE4
         89nbwN16CmCt+2H7L5H98x3VURl/DFPxTsXXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731994009; x=1732598809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j//utmCLmHbOfmRxJW3HVRPBa+PJ0D/eZ4j9V3ZnD8k=;
        b=YG9dFbKnU17LjdaKJe2LlNhGiuqR/3vh7A9VSrLJ3HO7D54KKT4ACm6OMFcaeGHtqP
         6i6nmxxM1giNi7Qvde1JKuW8yJpEYc8NZL6oYvrEwiemCM4hZ6+AfjiBmHvyxJkI0Xzi
         Cy/jXvOncyOfsuCQnTR94Bu6s0+mwO2rdR/3aFeT8zuG6shSGCkyT8hmA4E9jb+FqMcV
         4i54Dnx9ewvdGgVud0bOG2fZwMTE9erR/wghvdYZiquSW8S21PqcrIB3VcKyb/NrIWJK
         mFyM0r3jbQ4xLZFqLMigQJlf8IvGvBtmbYKTyylW9BwN4PVqNPNXQBzEBDVWol/Scuoh
         4ndA==
X-Gm-Message-State: AOJu0YyPDTs3u/ARVe/fjW/fQTBPsHaDAP2aE3nz+/2E6Sd1q/z3ncHo
	Ot/fnFcdWPjwYmQx0TfTa3DKlBZGiu8ysLOQ5c2t3y4oYTaVd1m3n2el1aZIUunC+vLRhR2sMF1
	9
X-Google-Smtp-Source: AGHT+IG13rZ9XkS6ogpHQuvaaekcUakLIo3pjk6S4JV6ZLHXyXFsfFA5BL/0tnTLzAB/7OO6pCOYdw==
X-Received: by 2002:a17:903:98f:b0:20b:db4:d913 with SMTP id d9443c01a7336-2124e8d02fbmr26030685ad.11.1731994008871;
        Mon, 18 Nov 2024 21:26:48 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.173])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ec9370sm65513415ad.102.2024.11.18.21.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 21:26:48 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsoup: fix CVE-2024-52532
Date: Tue, 19 Nov 2024 10:56:40 +0530
Message-Id: <20241119052640.55850-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 05:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207378

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup-3.4.4/CVE-2024-52532.patch        | 42 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2024-52532.patch

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
index 6f7cac4cf8..c21cc8ad0e 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -11,7 +11,9 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2024-52532.patch \
+          "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
 PROVIDES = "libsoup-3.0"
-- 
2.25.1


