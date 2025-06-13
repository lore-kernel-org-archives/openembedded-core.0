Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A11C7114A
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:18 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3302.1749793511047027845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZW5WhJxW;
 spf=pass (domain: mvista.com, ip: 209.85.210.179, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1483886b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793510; x=1750398310; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YKtKVgkChbmp6jddBcEZqZ7A4L7PdbvG0iMu1hwvA0=;
        b=ZW5WhJxWFXdgHxScawHHdYrvmSOqK6M7DuWwXdruZK2vFuX5Bv819V0Bfitc9MUP8V
         DVKBsEQl3ivwvhyr6uJxzd2pSXLx7Oor2uCRM4RCi82FfVs+lwC1wIH2Cp1ptxEe3Cva
         5yMs82OfNcw7cTZd4kUiZSiY63BQp9/rPAKPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793510; x=1750398310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YKtKVgkChbmp6jddBcEZqZ7A4L7PdbvG0iMu1hwvA0=;
        b=tFfF7B7qs0bBlmsQNy6XyrpfvBwgkRAf7AjXitPi3A/ZODPQDEV7wm2OvhikDo8eh3
         tcW8+GYT0RwAAS9LAWJgp5cQO/U6HTG32k2ioQ5jm41cHVV7plZfacZa3DzLl+Io+bTL
         CN11qLmElaZVbMK0ItTe4NWqAO0yT7R7FqMqhYtNXxYsmGqiKXe8NAerNOPNEyd6RAWw
         XO2TLs2ja7r3DdY2LRPEVIgklfXtNQT9wH8rZ7OarZ8ZuQMhnsAxhHc6lZQvjwhgbTUx
         aaihIhweXNl6w+gZaZ5TN9pQ1L8W0ipUOSU4Ml/jqrr57LOnZbZAweBxLQ9PMPuTbsYh
         MYTg==
X-Gm-Message-State: AOJu0Yy7Ae5mbEI1T0uVhm1uDBjkdzeFmC/fqlm9L43Qmu0wsySYjC7y
	wr+t+1ZJqmIu77NU/QVM/gzCz7BVbDYlzI6xGPLWPdBjXVihAnKwE6K5mjJwG6gzsu5x3eF05xv
	XbD9I
X-Gm-Gg: ASbGnct8IwnfpGp5qYhCkJs35l8ESgYNcuT9ZIWfU8dOGM9XnvqkSHYuSoPYrx1MCXK
	MR0BHMvv0fqj+zLMkMTue+R+HFqXFfnMnAFQdomadzVmUl3NF7UWOBC7qPDkXXEencv3MWsXXSj
	hJad38wpmeytH8PTjurjcogsDgCR5cn0yJYbEEn5QbRG9LKZlpJ/UUMwNeK7QXN5fYI6AmJqxXg
	kE5Y+GBYclUkq5LcDz4wLWZ7y5EmJXTBTuIf8nn65ek4SPfLwvmClgKj93c0snu92J0MWBoRtlS
	JMzTW6K8mQ6IuupQWykyZeJIOwzXVntTot2LUGI81/X1pSLSfxmeWLB7Cji8zRUXfQKyXHCu
X-Google-Smtp-Source: AGHT+IGgUOnbi85G5omNfkVdp5nK12Y+QsyhmBi7Kc/4IgbjZ6LWaRRUHYgXTNUKY/pT+JwESV95Gg==
X-Received: by 2002:a05:6a00:2d0e:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-7488f746e46mr2696751b3a.23.1749793509459;
        Thu, 12 Jun 2025 22:45:09 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:08 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/9] libsoup: Fix CVE-2025-2784
Date: Fri, 13 Jun 2025 11:14:47 +0530
Message-Id: <20250613054454.112590-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218577

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]

https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


