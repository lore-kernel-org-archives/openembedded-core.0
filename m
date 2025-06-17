Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8CBCC71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:44 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.31260.1750195239956533398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hKFxXB/3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-879d2e419b9so6021312a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195239; x=1750800039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10ugOS6cwtlatol2TXAJjhsW3STIz75dMqtku1MtlCU=;
        b=hKFxXB/3qhNSGKd0v7tr3/reGKgMRMzbeeqWIqY0sSPGUpUHItNJm6BVZ5Hv5NR1sg
         MbqeHUzhwgiDJeAj1Wq05ppkFpqPB4p3hZJy/JHrBX59ZQsfOi3/TbpSoI9cnf5PiyS8
         tP8C08t9PmnGcmk4NBjBndlpA9xdcphqvHdrIv9UmDk5qX2aW66GVHtKPTBD8OHL9b8m
         6uvmJjgo/vgGCWqt8hL9uhXZFZmssQCkouMXU0Zs52saiBQIQkAQTpfi+HydO5jUUttI
         2Wu3YQUrSt1ZTB5b4qU+uSN7k7bFOvkMlxvtCR9p4vvpbyI0pvk29VBiRM1d3B0ouB15
         d9rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195239; x=1750800039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10ugOS6cwtlatol2TXAJjhsW3STIz75dMqtku1MtlCU=;
        b=dqfTvZA2biA2RQ58wia0tQ4YrGc/t2AcX9kMN+FKaZwfDJknFjmubAexMQ7aBcYbC3
         RglzRxI3aEPJz9Oxabpj+YkBdeJYLqrKyXrSdWyZbO7iPFm2p87sh7TUvWmkALA5CLmC
         EaDb2gapFwa+TE1uZdPw3ktmfhwb2ZsvPLTYgDK/pvNQ8aAhHAbQ/f76N3MgDEEzKN+B
         OMxTTYJmhf8K5n49qxQKIGoXs7693AWOYYUPV4VR7MhJ50wKgfiLCnpmbtGul/aCh37i
         b3nwy9B1557XMu4J6pRYKalMLYzsmi/ya5I1CFJbIHtO7Ag/jg5/RBn2v8luoqoXLZMq
         r/AA==
X-Gm-Message-State: AOJu0YxTkNH4pyp7qj3uUbImpPg3UKgbS3J87ON5haj+n8D5xVr2I5J3
	vFtEt+qn4kOTYsHaVQ+z4bvQyoRFcnc9QunZ/bk9pNscKtNGU/EgoS546MPbKrq+TthDe9Ay6Ue
	rzMOt
X-Gm-Gg: ASbGncs4RuRRPTCrIpT/ZL0BgEC10BXtdZoBJ7jI6tDHk7+iEBrrBLzsCxtjX+aCg4A
	jiWLCTjh3ZKX5HN8OLsI2tGz7iYM886WpeY4QeAZl6tNuHGYGdiF2+n+N+rkXOsVJEKzYJeRmaR
	WMXv5TqGZ5jL9Ow5qL7cBJIlywZUxLqb3Juzo6rO05hgU55PR4h0/JfyS5KnYl1h5jQQ/t2yKjO
	UtvyFzsvFIKv5tkedYOZNBr6ifxKleB9f5Pe2iWT8LMRPJye8xWq5VEofCbWziRLN4CRMa1QqjR
	Idx9UB0/UOl0qfQzvQ3f6HLap5FxlOU1ehjNRnSFaLY7bFy+3dZvgcY0H0iQuZNB
X-Google-Smtp-Source: AGHT+IFINYa/ZkhLUuTCWvSFQ6nwCsyZDM8TsP09YTHReh8yY91WZK34LDPmgdWKyNYIFF75LXNIsw==
X-Received: by 2002:a05:6a21:a343:b0:21f:5b6f:36eb with SMTP id adf61e73a8af0-21fbd68e189mr19031917637.39.1750195238907;
        Tue, 17 Jun 2025 14:20:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/27] libsoup-2.4: Fix CVE-2025-2784
Date: Tue, 17 Jun 2025 14:20:01 -0700
Message-ID: <5cea727e87489b144cba9b2aa491d0c90f34f93d.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218921

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]

https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-2784-1.patch |  52 +++++++
 .../libsoup/libsoup-2.4/CVE-2025-2784-2.patch | 135 ++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |   2 +
 3 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-1.patch
new file mode 100644
index 0000000000..bc2538329f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-1.patch
@@ -0,0 +1,52 @@
+From 242a10fbb12dbdc12d254bd8fc8669a0ac055304 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:39:42 -0600
+Subject: [PATCH] sniffer: Fix potential overflow
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsoup2.4/tree/debian/patches/CVE-2025-2784-1.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304]
+CVE: CVE-2025-2784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c |   2 +-
+ tests/meson.build                              |   4 +++-
+ tests/resources/whitespace.html                | Bin 0 -> 512 bytes
+ tests/sniffing-test.c                          |   5 +++++
+ tests/soup-tests.gresource.xml                 |   1 +
+ 5 files changed, 10 insertions(+), 2 deletions(-)
+ create mode 100644 tests/resources/whitespace.html
+
+--- libsoup2.4-2.70.0.orig/libsoup/soup-content-sniffer.c
++++ libsoup2.4-2.70.0/libsoup/soup-content-sniffer.c
+@@ -642,7 +642,7 @@ sniff_feed_or_html (SoupContentSniffer *
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
++	if (pos >= resource_length)
+ 		goto text_html;
+ 
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+--- libsoup2.4-2.70.0.orig/tests/sniffing-test.c
++++ libsoup2.4-2.70.0/tests/sniffing-test.c
+@@ -601,6 +601,11 @@ main (int argc, char **argv)
+ 			      "type/text_html; charset=UTF-8/test.html => text/html; charset=UTF-8",
+ 			      do_sniffing_test);
+ 
++        /* Test hitting skip_insignificant_space() with number of bytes equaling resource_length. */
++	g_test_add_data_func ("/sniffing/whitespace",
++			      "type/text_html/whitespace.html => text/html",
++			      do_sniffing_test);
++
+ 	/* Test that disabling the sniffer works correctly */
+ 	g_test_add_data_func ("/sniffing/disabled",
+ 			      "/text_or_binary/home.gif",
+--- libsoup2.4-2.70.0.orig/tests/soup-tests.gresource.xml
++++ libsoup2.4-2.70.0/tests/soup-tests.gresource.xml
+@@ -25,5 +25,6 @@
+     <file>resources/text.txt</file>
+     <file>resources/text_binary.txt</file>
+     <file>resources/tux.webp</file>
++    <file>resources/whitespace.html</file>
+   </gresource>
+ </gresources>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-2.patch
new file mode 100644
index 0000000000..c9d9c04087
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-2784-2.patch
@@ -0,0 +1,135 @@
+From c415ad0b6771992e66c70edf373566c6e247089d Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 18 Feb 2025 14:29:50 -0600
+Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
+
+Upstream-Status: Backport [import from ubuntu  https://git.launchpad.net/ubuntu/+source/libsoup2.4/tree/debian/patches/CVE-2025-2784-2.patch?h=ubuntu/focal-security
+Upstream commit https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]
+CVE: CVE-2025-2784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../content-sniffer/soup-content-sniffer.c    |  10 ++--
+ tests/resources/whitespace.html               | Bin 512 -> 0 bytes
+ tests/sniffing-test.c                         |  53 ++++++++++++++++--
+ tests/soup-tests.gresource.xml                |   1 -
+ 4 files changed, 53 insertions(+), 11 deletions(-)
+ delete mode 100644 tests/resources/whitespace.html
+
+--- libsoup2.4-2.70.0.orig/libsoup/soup-content-sniffer.c
++++ libsoup2.4-2.70.0/libsoup/soup-content-sniffer.c
+@@ -612,8 +612,11 @@ sniff_text_or_binary (SoupContentSniffer
+ }
+ 
+ static gboolean
+-skip_insignificant_space (const char *resource, int *pos, int resource_length)
++skip_insignificant_space (const char *resource, gsize *pos, gsize resource_length)
+ {
++        if (*pos >= resource_length)
++	        return TRUE;
++
+ 	while ((resource[*pos] == '\x09') ||
+ 	       (resource[*pos] == '\x20') ||
+ 	       (resource[*pos] == '\x0A') ||
+@@ -632,7 +635,7 @@ sniff_feed_or_html (SoupContentSniffer *
+ {
+ 	const char *resource = (const char *)buffer->data;
+ 	int resource_length = MIN (512, buffer->length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -642,9 +645,6 @@ sniff_feed_or_html (SoupContentSniffer *
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos >= resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+ 
+--- libsoup2.4-2.70.0.orig/tests/sniffing-test.c
++++ libsoup2.4-2.70.0/tests/sniffing-test.c
+@@ -432,6 +432,53 @@ test_disabled (gconstpointer data)
+ 	soup_uri_free (uri);
+ }
+ 
++static const gsize MARKUP_LENGTH = strlen ("<!--") + strlen ("-->");
++
++static void
++do_skip_whitespace_test (void)
++{
++        SoupContentSniffer *sniffer = soup_content_sniffer_new ();
++        SoupMessage *msg = soup_message_new (SOUP_METHOD_GET, "http://example.org");
++        const char *test_cases[] = {
++                "",
++                "<rdf:RDF",
++                "<rdf:RDFxmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"",
++                "<rdf:RDFxmlns=\"http://purl.org/rss/1.0/\"",
++        };
++
++        soup_message_headers_set_content_type (msg->response_headers, "text/html", NULL);
++
++		guint i;
++        for (i = 0; i < G_N_ELEMENTS (test_cases); i++) {
++                const char *trailing_data = test_cases[i];
++                gsize leading_zeros = 512 - MARKUP_LENGTH - strlen (trailing_data);
++                gsize testsize = MARKUP_LENGTH + leading_zeros + strlen (trailing_data);
++                guint8 *data = g_malloc0 (testsize);
++                guint8 *p = data;
++                char *content_type;
++                GBytes *buffer;
++
++                /* Format of <!--[0x00 * $leading_zeros]-->$trailing_data */
++                memcpy (p, "<!--", strlen ("<!--"));
++                p += strlen ("<!--");
++                p += leading_zeros;
++                memcpy (p, "-->", strlen ("-->"));
++                p += strlen ("-->");
++                if (strlen (trailing_data))
++                        memcpy (p, trailing_data, strlen (trailing_data));
++                /* Purposefully not NUL terminated. */
++
++                buffer = g_bytes_new_take (g_steal_pointer (&data), testsize);
++                content_type = soup_content_sniffer_sniff (sniffer, msg, (SoupBuffer *) buffer, NULL);
++
++                g_free (content_type);
++                g_bytes_unref (buffer);
++        }
++
++        g_object_unref (msg);
++        g_object_unref (sniffer);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -601,16 +648,13 @@ main (int argc, char **argv)
+ 			      "type/text_html; charset=UTF-8/test.html => text/html; charset=UTF-8",
+ 			      do_sniffing_test);
+ 
+-        /* Test hitting skip_insignificant_space() with number of bytes equaling resource_length. */
+-	g_test_add_data_func ("/sniffing/whitespace",
+-			      "type/text_html/whitespace.html => text/html",
+-			      do_sniffing_test);
+-
+ 	/* Test that disabling the sniffer works correctly */
+ 	g_test_add_data_func ("/sniffing/disabled",
+ 			      "/text_or_binary/home.gif",
+ 			      test_disabled);
+ 
++	g_test_add_func ("/sniffing/whitespace", do_skip_whitespace_test);
++
+ 	ret = g_test_run ();
+ 
+ 	soup_uri_free (base_uri);
+--- libsoup2.4-2.70.0.orig/tests/soup-tests.gresource.xml
++++ libsoup2.4-2.70.0/tests/soup-tests.gresource.xml
+@@ -25,6 +25,5 @@
+     <file>resources/text.txt</file>
+     <file>resources/text_binary.txt</file>
+     <file>resources/tux.webp</file>
+-    <file>resources/whitespace.html</file>
+   </gresource>
+ </gresources>
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index bb15e8b926..5e8a141dc5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -32,6 +32,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-2784-1.patch \
+           file://CVE-2025-2784-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.43.0


