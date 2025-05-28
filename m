Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6449C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 05:41:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.9400.1748410881121267653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 22:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Yig+ihb7;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e16234307so4883615ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 22:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748410880; x=1749015680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7/RBVoJvApbYcPVVPgMJuAc5QNDHjsG/peyLULrGWUk=;
        b=Yig+ihb77pEDhIyQjiYsIX/tFEO2DswicGrd7iEQ7Xxdtymp43WdKKXwx3+TF417nm
         guc2KxvTJtuJh5A/9kQgv42cjiXBHrbJabPvGxGLMj8ZW2Cwiy1FFeppCLMamUvXxdsY
         fbsDusKewXUx0LmpkpLNgK/H+pbcpxAxcX/7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410880; x=1749015680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/RBVoJvApbYcPVVPgMJuAc5QNDHjsG/peyLULrGWUk=;
        b=vUXK4CG5KNctAOVTrDdVspn6dwBU8RnDVvSW715WpnwDeuJt6gbLpfszWRy5c8XS/t
         fj0+lnFohjZ1kk6Wo6SMJAFoUZlYGBlzSmNsRMnG8NcvQSptkIROtWwKrGKrRgAokifX
         dv2jHm6ZqIPdgEd6IQVrtU41QgULZwwDURiSWwvIuF7w2fbCuaIvBqytRxOLuEiQtAe5
         SjxUiAuvUNyuKWwEZEAGXYTM2t9WdGgtPhVk69RvqQ7ITTUMt+9agdpWANlhLYzBAVX9
         vbHt/3H3RA0uyEAodtctSc2DuS6Bfg32xHZ1jKL6ylpLZYH88XTcu2LrFSyQqCPngip5
         EBPQ==
X-Gm-Message-State: AOJu0YxUfx6ols3mMPG/ihNGLXIUJazmlGA7k6KOXspLV1Tg8rnZxC2e
	Tuxw9RBp1nuxQBHIv303sdclw64t3qh9esiagxQ04VVZxU4cDKTWFhoIB2WeG5nL+/nFv5httxE
	/HYiu
X-Gm-Gg: ASbGncvYyp+Cf3E4ugnWn4KgDNS9Fh8r53RVGnKVAGM1gUqSLQHE21JSgRrbYVDf1AA
	iTNiYRdN876jZWHOEt3Mgk7YxhGWc0x7zqPqCaX4X1EjiC7bukfqRFLrvtMwKmAqokJyaOiP4E9
	4DETlu4fJgSX6pydQkmVRrhra1xuJ/gFW5YUJWGUs0bApEY00+uzbokptsVi3lQazvGGDft4wgZ
	DZEBewvgsdzsrRyDfXG/uNYr10+JFwdXWDo6HFM4Zk6IMhg1tZtC8v3gXehmL2kP+OS5Ku3p+oA
	LTvuc2ZO8/P9mhzVsBcy54KOqqDdJHqWvuorpd+UShZ/k+D2ydKaGST3N8xEhohyFA==
X-Google-Smtp-Source: AGHT+IFaDOg6xINTvnMmr65c6ZQuysZ9iv6ccG2NnCu8rTQ36iAQYoCwAviARxUtbKTuw8A2QsEolQ==
X-Received: by 2002:a17:903:94c:b0:231:fd73:f8e5 with SMTP id d9443c01a7336-234b750c9c1mr49738145ad.24.1748410880319;
        Tue, 27 May 2025 22:41:20 -0700 (PDT)
Received: from MVIN00016.mvista.com ([150.129.170.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234d2fe1854sm3989645ad.66.2025.05.27.22.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:41:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsoup-3.4.4: Fix CVE-2025-4969
Date: Wed, 28 May 2025 11:11:10 +0530
Message-ID: <20250528054110.43326-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 05:41:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217334

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsoup/libsoup-3.4.4/CVE-2025-4969.patch | 76 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..70c5fd5593
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-4969.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index d3a0840044..21a1bbe6cd 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-46420.patch \
            file://CVE-2025-32914.patch \
            file://CVE-2025-4476.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.49.0


