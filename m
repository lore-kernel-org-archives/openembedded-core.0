Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82CAC3ABCF
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.1934.1746805567724728647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WltI+zfX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a9cd61159so2244980a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805567; x=1747410367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuHQ1an4J5dOhDxcVUsu/g5tNUhqcricVEBGjZR0560=;
        b=WltI+zfXr44mcMkNRxWSHdD/F1p+Ziz5TqEWOWb4F5nUxtEIBSKDMx+jAVQqgp3Prt
         I9felUw3c052ZZkdiCUwkNRUWhxe+rqO8UNP5sQJ0cwJKJL8yjxZkePJduA02NPDdWUy
         UcrgY8dpN8HFW+U16Z1mi6OkBnfF7ivI5qGPDPTpnYxzr4gVsPuSwNMq9OQRmmjgIKYR
         rxlEVvZpBx5kp8S1I5Y6Hhrb6tHWS+Qj8I2rbit19cT+Hh8se4nuIOzVK5qwyV/ZPQKw
         u63QMQh7vaEGFJHcYyZdAbszql2Vw6/p/2n2Vu8e9zsOP1eIXQZsdEqyo7Uvqx08A3E9
         ZGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805567; x=1747410367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuHQ1an4J5dOhDxcVUsu/g5tNUhqcricVEBGjZR0560=;
        b=Y4NbAvtzlQN06Rf5an03OL25Z/Eqd8b+5m+yfHoPV2Np3ung0/8e5i2UX+tlOk5K5c
         RslKed+bFHxYeD5WcSGPVKaiMpRM+KD8jnVGRTxkO8V0owH/k9Ww2PJ0Av8JHD9IDCAO
         W+yNl2ODDtGlZYBclX8DeSvR3XKOW15RO5u9M9Ne4ZUhy5/0ZeWOkP31nrJ3LieRllnl
         CGB/uW5fUeW3RD6GbTI2a4g/2k8mN1SlW4yQ7h6TIi89hbkaxyxYQXOPI/+J0EponuKT
         wS+02fypIf4fmpmHxRVmShBlsdxd/i/4PgFjyw6v6ZGlruUfpxdMexZ76AOUBhLpJdry
         DwVw==
X-Gm-Message-State: AOJu0Yx/SOdfxxIglBUL1Uan3S3RAljyIk5Qpwx277WSEMQ67py+lW/R
	mEpDQ6SCrzrs2kmqXeTSSieS1o+U9aNdxC5IxDwV0Tywd3CUUIYqN+VQuwvq8/TUZNf0cNivkcY
	q
X-Gm-Gg: ASbGnctIxSxiLBlyj5XDjEUe8f/AkNMixni11WoZuw4g9sikXH2jmnl3mwJDR7I+ITR
	u7kEqC0oxvH04eATpmOJSNvgAxJsmkFBmmAjeWmFfvI8bN2TBtpNv2B12wFvowABk7mO336Rfr8
	r8jlV0ExvuOYSKaRlm4g84oli48ZmTk2YTHyGcykF4IZSlyxyHz5C2fqr3M999xtFLxxPN5i3Jq
	4+tRLLqPkpkED6kwcFk4zlaSvXfevLzBCJLqABzeZJcnedjohsBi5ev6ane5uV8T3lrXBqk/o1m
	Vst/CaknpFRIl6uARmr1oCwoTsPXNWr6
X-Google-Smtp-Source: AGHT+IFWUbnRtn7iDjgTI02Jd805IbIyns+ILVNfvumPp6eUh3I0EmMebwAP+66LUqvP9/qllOrWgQ==
X-Received: by 2002:a17:90b:520d:b0:30a:9cd5:5932 with SMTP id 98e67ed59e1d1-30c4000fa4emr6197833a91.13.1746805566879;
        Fri, 09 May 2025 08:46:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/8] libsoup-2.4: Fix CVE-2024-52532
Date: Fri,  9 May 2025 08:45:50 -0700
Message-ID: <dfde13ecffad3426846bd4b366d1e0cdb77b1be0.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216229

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2024-52532-1.patch        | 36 +++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        | 42 +++++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-3.patch        | 46 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  3 ++
 4 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch

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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..edcca86e8c
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
@@ -0,0 +1,46 @@
+From 4c9e75c6676a37b6485620c332e568e1a3f530ff Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH] websocket-test: Disconnect error signal in another place
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
+CVE: CVE-2024-52532
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 6a48c1f9..723f2857 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1508,8 +1508,9 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	GError *error = NULL;
+ 	InvalidEncodeLengthTest context = { test, NULL };
+ 	guint i;
++	guint error_id;
+ 
+-	g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
++	error_id = g_signal_connect (test->client, "error", G_CALLBACK (on_error_copy), &error);
+ 	g_signal_connect (test->client, "message", G_CALLBACK (on_binary_message), &received);
+ 
+ 	/* We use 126(~) as payload length with 125 extended length */
+@@ -1522,6 +1523,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+ 	g_thread_join (thread);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index bd58773ba3..6125c0624a 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -16,6 +16,9 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52530.patch \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


