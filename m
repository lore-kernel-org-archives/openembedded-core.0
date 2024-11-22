Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F92EE6919D
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:58 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.35400.1732310813417694785
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LoWrWekm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2127d4140bbso25725295ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310813; x=1732915613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZTA4alSFwCYkav6k9/jPqqXoI8kNOjIZkYy2hH5epdM=;
        b=LoWrWekmMAFf4ge/TlaTTFogi/f+yCwLiptzYa+dlDYF+vfTGhJyjqvpUnqutAkuep
         ub2c1f5KoAMRraglql/usCit+sG4+Kg6u1dbw2oDuxTlWeVqJoIMTTwBj4rbYXJ2BWPZ
         ySErOo6VFFj8P/BqZqtPQ1XDodCfib430t6oHTRUzzp+65uAQh3sEhXn65uXHJo91Ipy
         RGymvS6IGaA60JhYUPcRk+Qp+1W6OB2rDpH4a9DEMe/S7GCL15n4aGu9SMgQKSJGG7hT
         SgyMeNWORbnj0UYrLdvYs9ipaOGEVLxvlq/l1vkZHhf8KDFlHfkJ8pWc/fSWAAffzNSc
         BiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310813; x=1732915613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZTA4alSFwCYkav6k9/jPqqXoI8kNOjIZkYy2hH5epdM=;
        b=ugDG5oNGtC0aYTPmkKvhJ90X0RfghU3Kz6Bde1njQochUO2eI2OgUtPVkwBcPnwVl0
         BHh0DaihWeeiDQKBrLMWPCExLgpt+1CbOkuJp+UeSL5/3oIvJsHzHVX3LEY1XtFGFqBG
         VWHe21E81wCNVJElz/5b7fShgiRvkN2qA8bSvprYdHFZ1XBv7wAPoF+u1Kb1BhmcNSLm
         tfejKZaDPY+nG1QMOmSJQeZ7lQLTi+zNdvYq3wykuOfyOuB7eP33zyAbvPQuHN6a1J4z
         GMWw4UwOx74HPzVdxYCu0S0isspxBCYJbtlUKi68iVFzvoxUPiLirHSncx1Iw2zDgBNU
         QYBA==
X-Gm-Message-State: AOJu0YzL9CdUBTZxZcowOHIhOaABv7+WcdIk3rTUHgdmvqTn6h4DguHw
	FucBwzVwgRuQ/9wIF9nWkG29YNMLWV7f6JERSS14C7V6jdU2fvfPo13eIld3MWpxFhujoimyWym
	s
X-Gm-Gg: ASbGnctCdNln3vazL050ERx89jt/oiJw8QQtmihqfWgwbp7z7wEq+PKbFMX1InROxIS
	tDW3OJi9hOJjdccIltX/cCOe3ROMtbW/s81iC9aZaEUuAMEUW1LO/Gt9yxshnFpXYW9DciXx6yd
	BnCx35Gt/g77y3srr4aWgzeQ1rcluVSfWoao6Lj5TAbMkgp1AeWdch+h6tET0mjmxtvmkT+U0Ke
	jdHnRO+F+SaQ52q7G50OFExJq4/WzrSmi6wvBk=
X-Google-Smtp-Source: AGHT+IHooj/9n0rWVFGzjKTd75kNsUDATByA1JGKY+316Ifiy0YHn8aeATv+dtesPRhLk8DbNSS2oA==
X-Received: by 2002:a17:903:32cd:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-2129f288ba5mr63264625ad.41.1732310812548;
        Fri, 22 Nov 2024 13:26:52 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/19] libsoup-2.4: Backport fix for CVE-2024-52530 and CVE-2024-52532
Date: Fri, 22 Nov 2024 13:26:22 -0800
Message-Id: <87b0badcb1d10eddae31ac7b282a4e44778d63af.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207653

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/04df03bc092ac20607f3e150936624d4f536e68b
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2024-52530.patch  | 149 ++++++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-1.patch        |  36 +++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        |  42 +++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   3 +
 4 files changed, 230 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
new file mode 100644
index 0000000000..bd62a748eb
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52530.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..68eb942762
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
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
+ libsoup/soup-websocket-connection.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index a4095e1..9d5f4f8 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -1140,9 +1140,9 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		pv->incoming->len = len + count;
+-	} while (count > 0);
+ 
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !pv->close_sent && !pv->io_closing);
+ 
+ 	if (end) {
+ 		if (!pv->close_sent || !pv->close_received) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..e4e2d03d58
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index be286e1849..b1962961ce 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -13,6 +13,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-meson.build-set-c_std-to-gnu99.patch \
+           file://CVE-2024-52530.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.34.1


