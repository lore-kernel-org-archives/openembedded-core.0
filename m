Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDD5C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:58:11 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.106293.1747238290908582703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sUzZ4/1s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b170c99aa49so4756730a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747238290; x=1747843090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zCyqNUh/khDglWHJ0hvqfs0c+KBE2JdvPeahEkbOdw=;
        b=sUzZ4/1sYPl4g5f8+NaB2w8AI0PeRUfsV+2Oe9DhLej/YKqDK6hPOR4/JEVBLZ3A/6
         ZmDWmuK7QWw0xvVeagDP8ygGaN1Go/9lGBIzxOl+cS90x9ESiYsbxgkkVaQZ2PYM0KeM
         L8O3+iky+OsGvnv1FXaUkF96OE5idYrfAkGSgfQqvYqBVewotT0aJBbzifJRTQG+DQD+
         zQhHE+vPmSc05kgeUMmL6D0TTLX9fhavJqoWj54sn5wC7BKsvavNTs0rf81O6o26EQSU
         JUWG/yJifTha/Pbxf4g0qKymSBFmYlBl2N/6G9U+eZo30j6dGqwVB/Mq8pAsgAL2VjD8
         eRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747238290; x=1747843090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zCyqNUh/khDglWHJ0hvqfs0c+KBE2JdvPeahEkbOdw=;
        b=ooIwsNhPLZWUx9s0PBm1VZdC9hcR9tXxvZLAyGsHiGZxy04dtZX4hIAho35buKWAqm
         s+U17F+jsQvYzxLOIO/iB9JVAk3A1LW1SWQd7FBdGVhchZGGjXSCjT1CRArtf1LUd4uA
         vfx81ezhsJ5jKx7PjVZyVXdekS5Lv+JOHGcfxUWZagS911/v2DyMXS69Ox3Le3ksCKrr
         Cw24qosFYyeLmjbP4v19d6+iRqnDVE/dVV7Vt7Tb0rcHc+nBViPDr/URee12gZoNUbP5
         wsgd4mu5DZvHf0jTIQZlRAFojSC095L8jzs6k5FjLH5QCzNBb0uGiOfyk1F45uUg7R5K
         3oQA==
X-Gm-Message-State: AOJu0YxmTazhJU9HZh+0jQA4TB+ob27WbjKpzMWj+ZukI+DF+PJ1VURg
	eTF627a+92pZvSvLhznopTqrOLbs4hvzGkGD1j820nUwT4L1u7VGNYUnaybapwqBdarDxc50Ah+
	L
X-Gm-Gg: ASbGnct2MekImLCzdfsCDEYTfeMgOaL1Sgcrz738/R0DnwWXlz2UGx87n202PZ0vmr+
	z0r+csanZgW6cdv37X+DrHSFI27yPDVcP9ECq71e3OL51Y8yiaTYvD3zY6X4A4iylux5RR1PaRN
	yffuEPxwehvuZX54/JyHhiYABsemXfMQNYXmSWkDOS2xoG4gNQ1jAxkxEMCpNgzhnDSMPV7LnmS
	X+Plm/G4WmW46V9bJeYwZtsOGKUoadQrsIcQPXxupek1z5I7pIxpk8CN9znmsGaRUEoqB4SfZJD
	WjDIfxW/4Ae8ZXbzkTgnYcvfm+QN8Xr2gl41cZx0
X-Google-Smtp-Source: AGHT+IGFmo3Q3rleuPyYt9WN0tAD0pzmVU2BmwHHOYV34g2zfC3r3ONQCEXRqqF6FhjxAdkkPzqR5w==
X-Received: by 2002:a17:902:f70a:b0:220:c63b:d93c with SMTP id d9443c01a7336-2319815c171mr70587065ad.44.1747238289841;
        Wed, 14 May 2025 08:58:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:671:bf16:d45b:ad8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271bcfsm101347385ad.125.2025.05.14.08.58.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:58:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/12] libsoup-2.4: fix CVE-2024-52532
Date: Wed, 14 May 2025 08:57:50 -0700
Message-ID: <e91fb129f132aae628b3a942afe9259c25f1b539.1747238138.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747238138.git.steve@sakoman.com>
References: <cover.1747238138.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216506

From: Changqing Li <changqing.li@windriver.com>

CVE-2024-52532:
GNOME libsoup before 3.6.1 has an infinite loop, and memory consumption.
during the reading of certain patterns of WebSocket data from clients.

Refer:
https://nvd.nist.gov/vuln/detail/CVE-2024-52532

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-2.4/CVE-2024-52532-1.patch        | 37 ++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-2.patch        | 43 +++++++++++++++++
 .../libsoup-2.4/CVE-2024-52532-3.patch        | 48 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  5 +-
 4 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
new file mode 100644
index 0000000000..cb1f096110
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-1.patch
@@ -0,0 +1,37 @@
+From a693d49bff058fc20a448dc4e7d324ff0dc6597e Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 11 Sep 2024 11:52:11 +0200
+Subject: [PATCH 1/3] websocket: process the frame as soon as we read data
+
+Otherwise we can enter in a read loop because we were not
+validating the data until the all the data was read.
+
+Fixes #391
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/6adc0e3eb74c257ed4e2a23eb4b2774fdb0d67be#f1d67ca0386b145ea201cf88d27f72724d7c6715]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index a4095e1..65c1492 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -1140,9 +1140,8 @@ soup_websocket_connection_read (SoupWebsocketConnection *self)
+ 		}
+ 
+ 		pv->incoming->len = len + count;
+-	} while (count > 0);
+-
+-	process_incoming (self);
++		process_incoming (self);
++	} while (count > 0 && !pv->close_sent && !pv->io_closing);
+ 
+ 	if (end) {
+ 		if (!pv->close_sent || !pv->close_received) {
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
new file mode 100644
index 0000000000..dcadafe944
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-2.patch
@@ -0,0 +1,43 @@
+From f5b76410de1318f49844dacf6e68692522b6c856 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Wed, 2 Oct 2024 11:17:19 +0200
+Subject: [PATCH] websocket-test: disconnect error copy after the test ends
+
+Otherwise the server will have already sent a few more wrong
+bytes and the client will continue getting errors to copy
+but the error is already != NULL and it will assert
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/29b96fab2512666d7241e46c98cc45b60b795c0c]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 5e40cf3..1ec9ff6 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1331,8 +1331,9 @@ test_receive_invalid_encode_length_64 (Test *test,
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
+@@ -1345,6 +1346,7 @@ test_receive_invalid_encode_length_64 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++	g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+         g_thread_join (thread);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
new file mode 100644
index 0000000000..ab6af72291
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2024-52532-3.patch
@@ -0,0 +1,48 @@
+From d97bb2e340f5a6d7e56a7738403f9d18bc406b70 Mon Sep 17 00:00:00 2001
+From: Simon McVittie <smcv@debian.org>
+Date: Wed, 13 Nov 2024 14:14:23 +0000
+Subject: [PATCH 3/3] websocket-test: Disconnect error signal in another place
+
+This is the same change as commit 29b96fab "websocket-test: disconnect
+error copy after the test ends", and is done for the same reason, but
+replicating it into a different function.
+
+Fixes: 6adc0e3e "websocket: process the frame as soon as we read data"
+Resolves: https://gitlab.gnome.org/GNOME/libsoup/-/issues/399
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+CVE: CVE-2024-52532
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/commit/4c9e75c6676a37b6485620c332e568e1a3f530ff]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ tests/websocket-test.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tests/websocket-test.c b/tests/websocket-test.c
+index 2b19a7b..0699a06 100644
+--- a/tests/websocket-test.c
++++ b/tests/websocket-test.c
+@@ -1300,8 +1300,9 @@ test_receive_invalid_encode_length_16 (Test *test,
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
+@@ -1314,6 +1315,7 @@ test_receive_invalid_encode_length_16 (Test *test,
+ 	WAIT_UNTIL (error != NULL || received != NULL);
+ 	g_assert_error (error, SOUP_WEBSOCKET_ERROR, SOUP_WEBSOCKET_CLOSE_PROTOCOL_ERROR);
+ 	g_clear_error (&error);
++        g_signal_handler_disconnect (test->client, error_id);
+ 	g_assert_null (received);
+ 
+ 	g_thread_join (thread);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 25e0d7dcbc..22cbbdb1b8 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -13,7 +13,10 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://0001-Fix-build-with-libxml2-2.12.0-and-clang-17.patch \
-           file://0001-CVE-2025-32911.patch"
+           file://0001-CVE-2025-32911.patch \
+           file://CVE-2024-52532-1.patch \
+           file://CVE-2024-52532-2.patch \
+           file://CVE-2024-52532-3.patch"
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
 CVE_PRODUCT = "libsoup"
-- 
2.43.0


