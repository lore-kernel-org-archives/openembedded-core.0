Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27634C7115D
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:22 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.27629.1750604539495393854
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=x0j8QfKO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so2575305b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604539; x=1751209339; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DsAa3/0zmBRENWUydgBVcMrL7HKCIeNqDEmHgOkTn0E=;
        b=x0j8QfKOztueamlkukO9RuXtcyIKP2UcQNq2WDQ3A01ueUshstWby8R/GeDyP6EljI
         LyCTp+bG4OV73md4XnNRyqkdU/LD07+bMwqIU7g4s1qhpcUztVBAANHfAAl5uQws/zom
         0xTsDtc2O9l5bFMgE9L1TxngW6yv9OEXBGXnbYi1DCPt6YUH1pOhwVvcIt3p9gAkS9uW
         GaCUfaJ+Cff3hf9o2vMHpXZNPv3abQ7i72c6EbQ0szQuW4Q1Bw4+iPsV5s08MYTmPnot
         KtRoDZabZ904skgoM5AcSxakWaXJ2fCqTFJXo5xQPvwHdA+sj8RsffWAchtM86hkhrBa
         pzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604539; x=1751209339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DsAa3/0zmBRENWUydgBVcMrL7HKCIeNqDEmHgOkTn0E=;
        b=MjOHbYdDjVN/0VVoWPmyLTLm16IlMLbjAciRP2bQD9KzCiMnSJI7KnZM71lO5Ac5po
         jLqyhmXtcTOgQdD8wZJrTMuc6hbHRF2y8bei4e5XO4AUkFybJqy+nFUuE/smGBp5eYoP
         4f9Oe1WQg/P/bDDpyx0yrWwXzdI20Pzt62HvFh+at1VNfSGvVXgenfx+DiolaFTCQ2ei
         Vp3kjUemyJbaIn+kDo0tY5WHU62d11gr5xDKHp6iaQUZSbclsUzJ7p1AiX74LGM1xU9L
         P8Y/FzZlIzGhib5yV1aHvP+7mD//NDYXYbCCjmLdQcBSIgbwkzu/9UWV5OUHAMxaM7My
         UI6Q==
X-Gm-Message-State: AOJu0YzEtk8MFHhWBQYGM1egVJpC+NdCr5zNI/C9/wglTmKU1h+MH/jF
	ymiYO5Z5JgCwEccsfHQSTD3Cnqs8UyEc2mhNlmRYHVio57hHLd+DQdqJ5roSQ/iZMWuSVEUk95K
	0989oYWM=
X-Gm-Gg: ASbGnctvZDcZbgv79lhrNbrec5VzrARkbos1ncY7+SM2X6SiUnb/UbovN30al1rKovZ
	7oxW8qECFxxgx4VqHxjAZl8NHGKSNE7QKaoZ9U+oRzGeFZLzrCYPGAIDo6eZXpoBgLMc0bAkhr3
	NnDRYUFRrUMkOBQDCynYfdH//uZWGCimLgg2fNQ5qakXHM5I3PkptXJmIrirPtbIm5Vo29BRNHp
	XCXSNV2lvc9CLPlTaAnn9sNRVkuQM4uDP9atY/5ozFEBOVyCfB5EF6X+DFTOymgSpxC5k2KCVsZ
	GnnbvJ8QZfjtm79PZUJ5ohTZRmE+qfwr+GtGItbLzaEZ9qXpXYZVYQ==
X-Google-Smtp-Source: AGHT+IFvc30qk2p9udB5mf4En/3tOA4MopePbqUDRXtzDiB5lcbDs7HznVU7IpXZdiwB+jGHt7LGKg==
X-Received: by 2002:a05:6a00:8605:b0:748:e2d8:100d with SMTP id d2e1a72fcca58-7490f572ad3mr8652173b3a.8.1750604538675;
        Sun, 22 Jun 2025 08:02:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/14] libsoup: Fix CVE-2025-4969
Date: Sun, 22 Jun 2025 07:59:57 -0700
Message-ID: <ea267b82e1fdc5cc7bf055d3eec1190e19ae79de.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219181

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-4969.patch       | 76 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
new file mode 100644
index 0000000000..70c5fd5593
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-4969.patch
@@ -0,0 +1,76 @@
+From 07b94e27afafebf31ef3cd868866a1e383750086 Mon Sep 17 00:00:00 2001
+From: Milan Crha <mcrha@redhat.com>
+Date: Mon, 19 May 2025 17:48:27 +0200
+Subject: [PATCH] soup-multipart: Verify array bounds before accessing its
+ members
+
+The boundary could be at a place which, calculated, pointed
+before the beginning of the array. Check the bounds, to avoid
+read out of the array bounds.
+
+Closes https://gitlab.gnome.org/GNOME/libsoup/-/issues/447
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086]
+CVE: CVE-2025-4969
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libsoup/soup-multipart.c |  2 +-
+ tests/multipart-test.c   | 22 ++++++++++++++++++++++
+ 2 files changed, 23 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index 102ce37..e1c442e 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -104,7 +104,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index ab5f41c..84852e2 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -527,6 +527,27 @@ test_multipart_bounds_bad (void)
+ 	g_bytes_unref (bytes);
+ }
+ 
++static void
++test_multipart_bounds_bad_2 (void)
++{
++	SoupMultipart *multipart;
++	SoupMessageHeaders *headers;
++	GBytes *bytes;
++	const char *raw_data = "\n--123\r\nline\r\n--123--\r";
++
++	headers = soup_message_headers_new (SOUP_MESSAGE_HEADERS_MULTIPART);
++	soup_message_headers_append (headers, "Content-Type", "multipart/mixed; boundary=\"123\"");
++
++	bytes = g_bytes_new (raw_data, strlen (raw_data));
++
++	multipart = soup_multipart_new_from_message (headers, bytes);
++	g_assert_nonnull (multipart);
++
++	soup_multipart_free (multipart);
++	soup_message_headers_unref (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -556,6 +577,7 @@ main (int argc, char **argv)
+ 	g_test_add_data_func ("/multipart/async-small-reads", GINT_TO_POINTER (ASYNC_MULTIPART_SMALL_READS), test_multipart);
+ 	g_test_add_func ("/multipart/bounds-good", test_multipart_bounds_good);
+ 	g_test_add_func ("/multipart/bounds-bad", test_multipart_bounds_bad);
++	g_test_add_func ("/multipart/bounds-bad-2", test_multipart_bounds_bad_2);
+ 
+ 	ret = g_test_run ();
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 83ed88e785..d0cd1f436a 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -37,6 +37,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32053.patch \
            file://CVE-2025-46420.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


