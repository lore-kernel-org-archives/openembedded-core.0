Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232A7D591A6
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 06:01:38 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.14605.1731996089574710774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 22:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GZU7dwYN;
 spf=pass (domain: mvista.com, ip: 209.85.215.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fb632bfc0eso1822987a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 22:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731996088; x=1732600888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8TNuxF3YpcqYXG1I8FGTMZdwBSlvj20Oj/wnKM1qksU=;
        b=GZU7dwYNwE8JfL6HQJ6D2D57a/U07tgVfdoonQtUEQm4Ma3tXPnulS4nA6hTOqGsM3
         4nm6QykwyWU6H3LpeWp0XAciz1rQ7/KOlNAhIAcwrwk1fnNBT2GWOoJMH2MuPHPe6qJq
         kXhRj+Xs2uRNVXziywfbHfGc4nU34lyPzAL1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731996088; x=1732600888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8TNuxF3YpcqYXG1I8FGTMZdwBSlvj20Oj/wnKM1qksU=;
        b=rZreNav4oyEclMIX+l811DqlLI3V4ptc4WWHKHajXX+ZYPBdhTCNPz3vzxTheHgEXJ
         7Q8lMZ4QR/mfs/Ke4xxYBik259TwyJ6BNY3CLpj4Hc3l9u6Sq38d0TEUKiXW8Y8nCTRX
         sZIOdg1/czsooy/1zHvSjkinAl4qko4E15NQigK13RDa2U9jnWbKTWx/6S7hsZnw4sKf
         1zcg8QBNhi0dsVs11jAaaF1lh3JFI1dp1OdHli2lljhTbTNZ/0ZoVjnVKPXmZTeN76zx
         WXXXSeiPTt+77cZjgt1PyyjbuzMfoX5+IxVEHn+G7uZbvQT6e+u/Kejk3QBzpbVBfFcT
         gBVg==
X-Gm-Message-State: AOJu0YwvV/u+bSqOwoKyfUu+wS7pTh03ra1Mqdm330ySKUIz3tBlvHFZ
	YFpyyEV9dv791pJdWiKD69413joJ4gWCKdUqGMVydBrlBRpTxbaWz5cxJEDLobOAwhFEH1pqgdR
	VCbs=
X-Google-Smtp-Source: AGHT+IEOAWEPt8UGxlnNN3ytaWuEvpOYwefuekB0ogEIxvym0glyyCpZ0N+64dyExiVAFBhBIj3iUA==
X-Received: by 2002:a05:6a20:4308:b0:1d8:fdf8:973c with SMTP id adf61e73a8af0-1dc90bd1370mr24467472637.29.1731996088357;
        Mon, 18 Nov 2024 22:01:28 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882e:fb89:7f83:d84a:1c7c:faba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7247711ce4bsm7207673b3a.47.2024.11.18.22.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 22:01:27 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsoup: Fix for CVE-2024-52530 and CVE-2024-52532
Date: Tue, 19 Nov 2024 11:31:17 +0530
Message-Id: <20241119060117.34610-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 06:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207379

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2024-52530.patch      | 149 ++++++++++++++++++
 .../libsoup/libsoup/CVE-2024-52532-1.patch    |  36 +++++
 .../libsoup/libsoup/CVE-2024-52532-2.patch    |  42 +++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   6 +-
 4 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2024-52532-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52530.patch
new file mode 100644
index 0000000000..bd62a748eb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52530.patch
@@ -0,0 +1,149 @@
+From 04df03bc092ac20607f3e150936624d4f536e68b Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 8 Jul 2024 12:33:15 -0500
+Subject: [PATCH] headers: Strictly don't allow NUL bytes
+
+In the past (2015) this was allowed for some problematic sites. However Chromium also does not allow NUL bytes in either header names or values these days. So this should no longer be a problem.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b]
+CVE: CVE-2024-52530
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c      | 15 +++------
+ tests/header-parsing-test.c | 62 +++++++++++++++++--------------------
+ 2 files changed, 32 insertions(+), 45 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index a0cf351ac..f30ee467a 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -51,13 +51,14 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	 * ignorable trailing whitespace.
+ 	 */
+ 
++	/* No '\0's are allowed */
++	if (memchr (str, '\0', len))
++		return FALSE;
++
+ 	/* Skip over the Request-Line / Status-Line */
+ 	headers_start = memchr (str, '\n', len);
+ 	if (!headers_start)
+ 		return FALSE;
+-	/* No '\0's in the Request-Line / Status-Line */
+-	if (memchr (str, '\0', headers_start - str))
+-		return FALSE;
+ 
+ 	/* We work on a copy of the headers, which we can write '\0's
+ 	 * into, so that we don't have to individually g_strndup and
+@@ -69,14 +70,6 @@ soup_headers_parse (const char *str, int len, SoupMessageHeaders *dest)
+ 	headers_copy[copy_len] = '\0';
+ 	value_end = headers_copy;
+ 
+-	/* There shouldn't be any '\0's in the headers already, but
+-	 * this is the web we're talking about.
+-	 */
+-	while ((p = memchr (headers_copy, '\0', copy_len))) {
+-		memmove (p, p + 1, copy_len - (p - headers_copy));
+-		copy_len--;
+-	}
+-
+ 	while (*(value_end + 1)) {
+ 		name = value_end + 1;
+ 		name_end = strchr (name, ':');
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index edf8eebb3..715c2c6f2 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -358,24 +358,6 @@ static struct RequestTest {
+ 	  }
+ 	},
+ 
+-	{ "NUL in header name", "760832",
+-	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
+-	  SOUP_STATUS_OK,
+-	  "GET", "/", SOUP_HTTP_1_1,
+-	  { { "Host", "example.com" },
+-	    { NULL }
+-	  }
+-	},
+-
+-	{ "NUL in header value", "760832",
+-	  "GET / HTTP/1.1\r\nHost: example\x00" "com\r\n", 35,
+-	  SOUP_STATUS_OK,
+-	  "GET", "/", SOUP_HTTP_1_1,
+-	  { { "Host", "examplecom" },
+-	    { NULL }
+-	  }
+-	},
+-
+ 	/************************/
+ 	/*** INVALID REQUESTS ***/
+ 	/************************/
+@@ -448,6 +430,21 @@ static struct RequestTest {
+ 	  SOUP_STATUS_EXPECTATION_FAILED,
+ 	  NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
++	{ "NUL in header name", NULL,
++	  "GET / HTTP/1.1\r\nHost\x00: example.com\r\n", 36,
++	  SOUP_STATUS_BAD_REQUEST,
++	  NULL, NULL, -1,
++	  { { NULL } }
++	},
++
++	{ "NUL in header value", NULL,
++	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+@@ -620,22 +617,6 @@ static struct ResponseTest {
+ 	    { NULL } }
+ 	},
+ 
+-	{ "NUL in header name", "760832",
+-	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
+-	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
+-	  { { "Foo", "bar" },
+-	    { NULL }
+-	  }
+-	},
+-
+-	{ "NUL in header value", "760832",
+-	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
+-	  SOUP_HTTP_1_1, SOUP_STATUS_OK, "OK",
+-	  { { "Foo", "bar" },
+-	    { NULL }
+-	  }
+-	},
+-
+ 	/********************************/
+ 	/*** VALID CONTINUE RESPONSES ***/
+ 	/********************************/
+@@ -768,6 +749,19 @@ static struct ResponseTest {
+ 	  { { NULL }
+ 	  }
+ 	},
++
++	// https://gitlab.gnome.org/GNOME/libsoup/-/issues/377
++	{ "NUL in header name", NULL,
++	  "HTTP/1.1 200 OK\r\nF\x00oo: bar\r\n", 28,
++	  -1, 0, NULL,
++	  { { NULL } }
++	},
++
++	{ "NUL in header value", "760832",
++	  "HTTP/1.1 200 OK\r\nFoo: b\x00" "ar\r\n", 28,
++	  -1, 0, NULL,
++	  { { NULL } }
++	},
+ };
+ static const int num_resptests = G_N_ELEMENTS (resptests);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..8fdf50aed4
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-1.patch
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
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/websocket/soup-websocket-connection.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/websocket/soup-websocket-connection.c b/libsoup/websocket/soup-websocket-connection.c
+index a1a730473..a14481340 100644
+--- a/libsoup/websocket/soup-websocket-connection.c
++++ b/libsoup/websocket/soup-websocket-connection.c
+@@ -1199,9 +1199,9 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
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
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..e4e2d03d58
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2024-52532-2.patch
@@ -0,0 +1,42 @@
+From 29b96fab2512666d7241e46c98cc45b60b795c0c Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already != NULL and it will assert
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
+CVE: CVE-2024-52532
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 06c443bb5..6a48c1f9b 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1539,8 +1539,9 @@ test_receive_invalid_encode_length_64 (Test *test,
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
+@@ -1553,6 +1554,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+         g_thread_join (thread);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 59cc4a1d0a..919fef5107 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -11,7 +11,11 @@ DEPENDS = "glib-2.0 glib-2.0-native libxml2 sqlite3 libpsl nghttp2"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
+           file://CVE-2024-52530.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
+          "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
 PROVIDES = "libsoup-3.0"
-- 
2.25.1


