Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C136EC61DB2
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:49 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.96412.1749584085448840794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gxw/4QV5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b1fb650bdf7so3247492a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584085; x=1750188885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPCvp7wTfPX73nnMQYlqG3H52Dc1Yysym3rnAJL29PA=;
        b=gxw/4QV5LeLU/pNMK+jzodM8+Ifs8a0HBLx25wMAiUPUYRA7Bgb5P+ymMpkfo9VFvt
         /sEAEYai/XapTHq7u/gS55jYB4gO6zqlgpQPF/4Dp+kNQaRCQ1nv6abN5hlnnUk2N8in
         CIFsH6IVqzchbfsiabdMfbkwXLmr/a2Fj6qxZIpvpzCDzERlzpOkCPuEXnD+uA7BkKw6
         FLOGhpg2y1aJPFZtdB73l+aX+HixnXw5r3JiUApThbRhEChxFQwm1KuJDC8Ot8oaxJ8d
         dKqevGDdOuVbdEa+smuydI6y0jd63fzishwJnGHCTlH0E9BlLhrJtcWUi9CtSY/PXlu6
         zbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584085; x=1750188885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPCvp7wTfPX73nnMQYlqG3H52Dc1Yysym3rnAJL29PA=;
        b=YAD1RgxLHqTgpxF2PuI8cNtrO3Hj1Rgq7i5BuAdvSbj0xJMRAp0x717RqlnAJ3YZ8O
         kdJ12D/OoRW7E89gpl06rDwES5DCE+F4rC4ljwivNN7/Ziq0Be9vOnDQHkHYXJ1cLkD5
         jyPpJZL+K4jl88656IxCzOaLjl8Rd8JjDPoiCJz5gNisYEQL8AkyD+InQIX53AxLqDXN
         dSx4ouw05Ftx6z0Xu7xEo5c66E7evNUsXnSvo653thetdDJXfRNkSBoO1Ui4A6jRsakH
         wGzx2KOFnnqFs5YXV+p7cKAHZre61UfiftaPTaYwf7lYswxoB3UD2YMKypSer5Ge4yFS
         KoOA==
X-Gm-Message-State: AOJu0Yyv8fZs3lKlRGH6np1PAIIm2dnhnqv5B8vRsrqHE2MqXFqbNRkE
	jmxdHWz+F1TAXkT364UyXbvJ04+6y/Jozc4Oa9LMP0SSl38LhPiZ8ousPDDmjnQ4188LMAR8gPM
	Mx2sa
X-Gm-Gg: ASbGncvRGmoXrVJxC8faSQSfV3hFFVD1gKFPAYgRO44ZgGbL4j6cLvdJcbvX3J5hA3m
	ABvAvz5tvdO3tx9qn/k0cCRnkpyS/dAXunTp8Q4PA3G2L8BK01yVLpgZn5n8m38mhZyLBMT5Wb+
	MsF7Q5SypCQaji4qILt8CMesSzVobuT5c7oHPKAY19VT1HTxublDRCBHnI2eX1bu9H1DumH8Tga
	FN1EGOcYbDwp2bzTcrSZ3p5TAiVKejf6QY27a88KdlxXeUw10u9Yb/u6xPM+0jCE6JYgteG3+iN
	Wmy4lReZ54rB/grknKHJ3bQJ+dhUgZawvpbczfxFZR0h/xFLPvgSgQ==
X-Google-Smtp-Source: AGHT+IHFZFyTbxMXbLL5ODApw5nK/QjKvjBu5FVCLzE6HK6LeqrVxXa7iTZWqyVOLbLA/Pb5OnNfJg==
X-Received: by 2002:a17:90b:582e:b0:312:e8ed:758 with SMTP id 98e67ed59e1d1-313af10bc7dmr1051494a91.13.1749584084718;
        Tue, 10 Jun 2025 12:34:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/16] libsoup: fix CVE-2025-2784
Date: Tue, 10 Jun 2025 12:34:07 -0700
Message-ID: <504d92b01ac9a227e8e57b677f016fdfeccd5666.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218417

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/422

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-2784.patch | 137 ++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |   1 +
 2 files changed, 138 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
new file mode 100644
index 0000000000..b2e1c12d48
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-2784.patch
@@ -0,0 +1,137 @@
+From dd10ae267e33bcc35646610d7cc1841da77d05e7 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 5 Feb 2025 14:39:42 -0600
+Subject: [PATCH] Fix CVE-2025-2784
+
+CVE: CVE-2025-2784
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/435/diffs?commit_id=242a10fbb12dbdc12d254bd8fc8669a0ac055304
+https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/442/diffs?commit_id=c415ad0b6771992e66c70edf373566c6e247089d]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../content-sniffer/soup-content-sniffer.c    | 10 ++--
+ tests/meson.build                             |  4 +-
+ tests/sniffing-test.c                         | 48 +++++++++++++++++++
+ 3 files changed, 56 insertions(+), 6 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index aeee2e2..a5e18d5 100644
+--- a/libsoup/content-sniffer/soup-content-sniffer.c
++++ b/libsoup/content-sniffer/soup-content-sniffer.c
+@@ -638,8 +638,11 @@ sniff_text_or_binary (SoupContentSniffer *sniffer, GBytes *buffer)
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
+@@ -659,7 +662,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 	gsize resource_length;
+ 	const char *resource = g_bytes_get_data (buffer, &resource_length);
+ 	resource_length = MIN (512, resource_length);
+-	int pos = 0;
++	gsize pos = 0;
+ 
+ 	if (resource_length < 3)
+ 		goto text_html;
+@@ -669,9 +672,6 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		pos = 3;
+ 
+  look_for_tag:
+-	if (pos > resource_length)
+-		goto text_html;
+-
+ 	if (skip_insignificant_space (resource, &pos, resource_length))
+ 		goto text_html;
+ 
+diff --git a/tests/meson.build b/tests/meson.build
+index 7ef7ac5..95b13b8 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -95,7 +95,9 @@ tests = [
+   {'name': 'server-auth'},
+   {'name': 'server-mem-limit'},
+   {'name': 'server'},
+-  {'name': 'sniffing'},
++  {'name': 'sniffing',
++    'depends': [test_resources],
++  },
+   {'name': 'ssl',
+    'dependencies': [gnutls_dep],
+    'depends': mock_pkcs11_module,
+diff --git a/tests/sniffing-test.c b/tests/sniffing-test.c
+index 6116719..7857732 100644
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
+@@ -517,6 +563,8 @@ main (int argc, char **argv)
+ 			      "/text_or_binary/home.gif",
+ 			      test_disabled);
+ 
++	g_test_add_func ("/sniffing/whitespace", do_skip_whitespace_test);
++
+ 	ret = g_test_run ();
+ 
+ 	g_uri_unref (base_uri);
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 9b8bf5b9a2..37319f007f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -43,6 +43,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32050.patch \
            file://CVE-2025-46421.patch \
            file://CVE-2025-4948.patch \
+           file://CVE-2025-2784.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


