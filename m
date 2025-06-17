Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8ED9C7115D
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 21:20:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.31261.1750195241600450685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 14:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rPS60Yop;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748cd3c8829so1028626b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750195241; x=1750800041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o45HpQY4+xWHleaAdWWsbU7heTrQP05fClYOWFvfVc=;
        b=rPS60YopADxEXzfj90LzIV81ZCYMWgp4qYan2ibHU8v9Sp/xlcbsUxj3cHoLQAjbHR
         KLFIHannJw8Z7nNxJHNJGardGoO4wBLlKa2AiexjaT9MZcSld4LuT0aIUO9j97e/7FxK
         iJefbxmpYodrCcgvIDHEWKe3v02m8LoRmBCSUQOKMSwqWGobSpzmQ0a/Ka89vGB++WRw
         tGAgJnLjQHWB8ej1aedoUU6/5/d7mxNGJm3V/CntAvI4iRmOTfpgr1/coMIPRVUDxpzl
         b7WEe6/RCLNVyIzbMmZR6HW5/hbUUbXCInfv4u4RIDLqb5dU6sfuoYZVyfyBMFAon/Gb
         BODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750195241; x=1750800041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3o45HpQY4+xWHleaAdWWsbU7heTrQP05fClYOWFvfVc=;
        b=HueNrAhmoWlW0Xmi5AnuX+Ts0ApZ5ZqbLMDA2nU0PTR50yDV/Ih8R1Jeo55rzdVk3u
         caOO7VptFhhR7R/P6/vOuTmupdVtp38J5TuaUDx0O5MjICFKdGvPNcqnhfQklOBlSPW+
         Zz/LylGDVUAIIx90c5c+xA61XI4VYzhPRNP88FVXGv1rx1ngN/SAEFzMtfsHZ9rTVtWO
         w0qxHe2EmFqa8I7txhvd9cGL/f3CCC7LBEzUdwVywSHC82Ighob/N5fGnV2xXK0U+Pxy
         1hcuVZ93gSIVaQhwWmzTfZSqWcx10NtIc3JFpT+RVVUcJOTwIjB5PKA3frHa5HGvOdS2
         cwVw==
X-Gm-Message-State: AOJu0YwjxFwzcprZ3HMC/YCtPNsmCb01WyGpiBA29oBrZ759KCdS2ACA
	Zsqv4Avjq5KmYhczBlZhnuYu3lCO7a+caE4k/U5x4BbWskIR1CRI9uKmiXfrf1wdhtukZLr8Rds
	ZY39I
X-Gm-Gg: ASbGncuR7ShNuIiQ61R91BNOIaLh3ibFxVu+dz01V+M1NsdalGk1tDnB8FyPTlciEpf
	ZT6G70gP3TiN0eF1mg8wBhWfOPowHtVrpalRVvm+9bQh9YATaW7Vzlk6u2SjHIYyuP6zdPjFqCI
	TnOqUst7/UjtcN7vvkWxQSO0xz55pBXgFJaCGyzMFdP17e7tQFCeS3UIiM+j5zEyuR75yeiqilj
	GeJTFcRosLKAG/NblkMaqK/a7IVG2j7rBD7HkLcG8EQKDkgXnO3sGFIvGpZppcXCOJHwrjXyAD7
	v4iHXImcYMlvcboOFipgUJA0HsiK7NZcBLl7CClffCQCzradioWMkRbejA4HaJU6
X-Google-Smtp-Source: AGHT+IEO5pMDjDczdFD+WLPnH+9HIP9GawPrexc085/xnyWwlAgMS3zkhvgfeofwgBVEoAf/fVRyXg==
X-Received: by 2002:a05:6a00:14c2:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7489ce0c6bbmr24520851b3a.8.1750195240714;
        Tue, 17 Jun 2025 14:20:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7ce4:2bd1:2434:c118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffeccf1sm9720728b3a.18.2025.06.17.14.20.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:20:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/27] libsoup: Fix CVE-2025-2784
Date: Tue, 17 Jun 2025 14:20:02 -0700
Message-ID: <b51135e1f7eaa20c97e54f5c52b98963819127e9.1750195103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750195103.git.steve@sakoman.com>
References: <cover.1750195103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 21:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218922

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]

https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-2784-1.patch     |  73 +++++++++
 .../libsoup/libsoup/CVE-2025-2784-2.patch     | 140 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |   2 +
 3 files changed, 215 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-2784-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-1.patch
new file mode 100644
index 0000000000..d46886c57f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-1.patch
@@ -0,0 +1,73 @@
+From 242a10fbb12dbdc12d254bd8fc8669a0ac055304 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:39:42 -0600
+Subject: [PATCH] sniffer: Fix potential overflow
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304]
+CVE: CVE-2025-2784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 2 +-
+ tests/meson.build                              | 4 +++-
+ tests/sniffing-test.c                          | 5 +++++
+ tests/soup-tests.gresource.xml                 | 1 +
+ 4 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index d7c46c8..648ea04 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -666,7 +666,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
++	if (pos >= resource_length)
+ 		goto text_html;
+ 
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+diff --git a/tests/meson.build b/tests/meson.build
+index 7851e57..450becb 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -92,7 +92,9 @@ tests = [
+   {'name': 'session'},
+   {'name': 'server-auth'},
+   {'name': 'server'},
+-  {'name': 'sniffing'},
++  {'name': 'sniffing',
++    'depends': [test_resources],
++  },
+   {'name': 'socket'},
+   {'name': 'ssl',
+    'dependencies': [gnutls_dep],
+diff --git a/tests/sniffing-test.c b/tests/sniffing-test.c
+index 6116719..b542817 100644
+--- a/tests/sniffing-test.c
++++ b/tests/sniffing-test.c
+@@ -512,6 +512,11 @@ main (int argc, char **argv)
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
+diff --git a/tests/soup-tests.gresource.xml b/tests/soup-tests.gresource.xml
+index 9c08d17..cbef1d4 100644
+--- a/tests/soup-tests.gresource.xml
++++ b/tests/soup-tests.gresource.xml
+@@ -25,5 +25,6 @@
+     <file>resources/text.txt</file>
+     <file>resources/text_binary.txt</file>
+     <file>resources/tux.webp</file>
++    <file>resources/whitespace.html</file>
+   </gresource>
+ </gresources>
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-2.patch
new file mode 100644
index 0000000000..5ac837f9b8
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-2784-2.patch
@@ -0,0 +1,140 @@
+From c415ad0b6771992e66c70edf373566c6e247089d Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 18 Feb 2025 14:29:50 -0600
+Subject: [PATCH] sniffer: Add better coverage of skip_insignificant_space()
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]
+CVE: CVE-2025-2784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../content-sniffer/soup-content-sniffer.c    | 10 ++--
+ tests/sniffing-test.c                         | 53 +++++++++++++++++--
+ tests/soup-tests.gresource.xml                |  1 -
+ 3 files changed, 53 insertions(+), 11 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index 648ea04..ebe8f6d 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -635,8 +635,11 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, GBytes *buffer)
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
+@@ -656,7 +659,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -666,9 +669,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos >= resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+ 
+diff --git a/tests/sniffing-test.c b/tests/sniffing-test.c
+index b542817..7857732 100644
+--- a/tests/sniffing-test.c
++++ b/tests/sniffing-test.c
+@@ -342,6 +342,52 @@ test_disabled (gconstpointer data)
+ 	g_uri_unref (uri);
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
++        soup_message_headers_set_content_type (soup_message_get_response_headers (msg), "text/html", NULL);
++
++        for (guint i = 0; i < G_N_ELEMENTS (test_cases); i++) {
++                const char *trailing_data = test_cases[i];
++                gsize leading_zeros = 512 - MARKUP_LENGTH - strlen (trailing_data);
++                gsize testsize = MARKUP_LENGTH + leading_zeros + strlen (trailing_data);
++                guint8 *data = g_malloc0 (testsize);
++                guint8 *p = data;
++                char *content_type;
++                GBytes *buffer;
++
++                // Format of <!--[0x00 * $leading_zeros]-->$trailing_data
++                memcpy (p, "<!--", strlen ("<!--"));
++                p += strlen ("<!--");
++                p += leading_zeros;
++                memcpy (p, "-->", strlen ("-->"));
++                p += strlen ("-->");
++                if (strlen (trailing_data))
++                        memcpy (p, trailing_data, strlen (trailing_data));
++                // Purposefully not NUL terminated.                
++
++                buffer = g_bytes_new_take (g_steal_pointer (&data), testsize);
++                content_type = soup_content_sniffer_sniff (sniffer, msg, buffer, NULL);
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
+@@ -512,16 +558,13 @@ main (int argc, char **argv)
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
+ 	g_uri_unref (base_uri);
+diff --git a/tests/soup-tests.gresource.xml b/tests/soup-tests.gresource.xml
+index cbef1d4..9c08d17 100644
+--- a/tests/soup-tests.gresource.xml
++++ b/tests/soup-tests.gresource.xml
+@@ -25,6 +25,5 @@
+     <file>resources/text.txt</file>
+     <file>resources/text_binary.txt</file>
+     <file>resources/tux.webp</file>
+-    <file>resources/whitespace.html</file>
+   </gresource>
+ </gresources>
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 87ffb34f7d..74110b21c3 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -30,6 +30,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-2784-1.patch \
+           file://CVE-2025-2784-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


