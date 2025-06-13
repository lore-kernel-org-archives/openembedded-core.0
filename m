Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D61C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.3301.1749793506568140146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jg9onEMn;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74865da80c4so1138137b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793505; x=1750398305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=83rMAAMwWZwlcIpjAOZuGpq6/XtvSqQexaSK3zZYX/o=;
        b=jg9onEMnyTEAf5i2lp/2La0WHCgIq4kU/kMWgy3ZmrHDeyXg566sMZhjT9flT32OoB
         vX/Onydn3bw17VBFFPWOw3KlwIjILkfI0SAc3wRlukrw6GwLC6MVq/d84E6zkyoyi+iR
         +tNfHQC0cgonYwg2msE08Dz9yA1xxCASjQCNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793505; x=1750398305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83rMAAMwWZwlcIpjAOZuGpq6/XtvSqQexaSK3zZYX/o=;
        b=AKZeOS6idsUqRbyajjhOnqxFoGHHvapw01ZAiFM59zP0Gwa5EZcEXTptGPF1EYL7Tj
         kF3mU9VUPFsS9Gkl7b5IyGNXYC2IynNtxrIb+GJqFVrIIPYLr53g2c57Y/glrLE16lKq
         OlWrZr572TA2AmmigMrNj6U54TcAEQnnGNRDJ08sfs/Q08SNjJZMxOdhfFyR+S4XPANK
         31m4V20IpTRBXGtRPCqxPnni3EIcm/jD2XlQkSUsH+qvGEy+w//Ii6E5+5Lg69ld48/P
         6hOMmKKlVNCkgsfCSeKZ+8hRgVUJrM2X1H0M91QAIItxQfRVz1FyPVnc+p4o67j71DQJ
         PUvA==
X-Gm-Message-State: AOJu0YyJkm0MSh3lkCqHfu8ymTBc4+JxnuX+fikFMY9V0CzwTqZ334i/
	Rq3EDXysFIiTIHmu9U71918IoE+qPHLhPrg+vtvluxPFz25bI4WZX48GfhS+fCgCXX+LePsynSb
	sRVcI
X-Gm-Gg: ASbGnctTQW+Ag2pd5V7DSLyRdgo3VQYc71onnQGep+lICdjnEViMpqH1PqTmaT6PSSv
	kFsNo/QkYZWntlY8TFGZtWDw2IDRG1yxOxwGiCfyUfmhi7t1VY7O3+JJCEkLcnyBJCwwi4HvZFQ
	PzigK0fWF5c5FQXCM4ZDijvcwtTcZJA9QaSkmJyYpUyeCy9XAc910kvC245RwDdjr8MnzxQ0fRu
	plTj3Jsf6LmsMZQlJa6DnNG5gC9OZnzAxLb+6LS1bs8k+vP4MCkPvqHZcEDUIZLg3L8j+LYkuih
	vYJvd1zgSHAmkECZ7dwb6mBVQcmlQuPZX6HvGuwsdngJ6nYgxpDZjGOrPerF46ZbFqDFAPPU
X-Google-Smtp-Source: AGHT+IGOvCBpBIbyo2pc5sWWf08kO/eWZ8HFfTXx3zcA3aLGfRzhvlk95MACuhAI7DXEFMMg+C9B5w==
X-Received: by 2002:a05:6a00:3cd2:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-7488f6e7e26mr2444160b3a.5.1749793505476;
        Thu, 12 Jun 2025 22:45:05 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:04 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/9] libsoup-2.4: Fix CVE-2025-2784
Date: Fri, 13 Jun 2025 11:14:46 +0530
Message-Id: <20250613054454.112590-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218576

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/242a10fbb12dbdc12d254bd8fc8669a0ac055304
&
https://gitlab.gnome.org/GNOME/libsoup/-/commit/c415ad0b6771992e66c70edf373566c6e247089d]

https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


