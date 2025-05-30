Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617F7C5B55A
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:26 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.447.1748640137788225212
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jGzaUgfM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22d95f0dda4so31203045ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640137; x=1749244937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tesgmEoGoyW+VFdsWbx8jJxFuDavreRspdTQCiyrPZo=;
        b=jGzaUgfMDK2rKCzt1PPe9gdxDUJ+BXN6otzRW50I7xVoyRwMTJ33UAdaGx/AT7t7I/
         aB1aFDMNiKodWkbkHhtnaIhNSUnlBl0vWDruEeD8XZr8UDMfFDez2axlH/Zp10v5clRP
         gBA2fgl0nc6HLHIHRREYDsmCj5O6lt/v0U4tlF0ATeTNI6a7KxnIRA0DVkegt6+dPuTF
         ObyJLjqfLpuaxQlI3+rOkdL/snu67TpeFxw68WNkUfzqD8ZrQybJ37PuiRwWYayOGVoK
         7LUCNR2acqdcF0QbapqZaAtHvq1SUnU30dPVS5IUPCb59grHObTgZEhWAKJ4XpSoLfk9
         9QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640137; x=1749244937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tesgmEoGoyW+VFdsWbx8jJxFuDavreRspdTQCiyrPZo=;
        b=iliBRZLxlFZpHbcSFRsbURJwa5wwTSgk1ZNFaoe72tENxDBocvHhp3j7xIu6S8EAFN
         bgVu3VEe+fGemk5aqvLDrVGBIy4Zp0GiJjMr41g/IZ7ZnMjIeQFWkRznzYNgNkB+W+Up
         KwmFup2QJrCzZ5oj/IqyowXT7oTr2iXByULEVKQVaOMUqYFYdFU1hp3/VuUrQ6PYbp2C
         qVY2Xd0vTnHyhUpqkjrHkFP1h3sWX4XWQvGkBRK4nify1jJz+N0P7HfqxxLl+2eNXN17
         xKq4hiMeGnjfTnQzvHlJTsTXor0kk/BohViG1lY2PUvWzLhMU3+5FpQfCUT6dIgQOEfr
         DsLQ==
X-Gm-Message-State: AOJu0Yz4nDVsBEOisrKWYSNXS33iIzyk29R/m75+5ofmk5poukANNrAP
	XUid8aDEKmstN/yJcm2Y6p/lnJpT+L235gAe4ucMs+ySyOlY/K9azprnNPdDGiwB5WEe3KlAQm1
	aLrNq
X-Gm-Gg: ASbGncvnsawTUXJVXqq3478ZacQCUMopWivtH4KFPLXdIXiAn4IGEqDOPFqQd8BCjbm
	CJB/nLxaLvIQQKzP7bDEUfSZueGRNMjz1DGTNddX9S/S0ybei+UsXVaTa/wCEX8VhC/7TrmeeZn
	aiK/F7puTC/d1zoSXUNRQBzNKEVGLGGXmwohGLmusu39UexFrXx8f0mwko+U4rhUsxjubKV1mUd
	r3zAfu9z82wuFk5q0vjJunCCgFnOfpPBbc5gLOE77km0MKPodaFvkMcsooff/PvBIbN48rj5hsa
	VBybIF6qdSfiRvMLDVwxdKLjIUpq4FVUmem2oU+Oth2ofLZkrMwo7Q==
X-Google-Smtp-Source: AGHT+IFrUGmK4ZQPKkY6Aoz/aHFPMeNs7xDFSZQUTSBBouemY8LSUgFUGNQ7G7tKKdaVJBtezS6clg==
X-Received: by 2002:a17:903:983:b0:235:779:edec with SMTP id d9443c01a7336-23529911416mr63011015ad.42.1748640137046;
        Fri, 30 May 2025 14:22:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/14] libsoup-2.4: Fix CVE-2025-4969
Date: Fri, 30 May 2025 14:21:52 -0700
Message-ID: <9058886006f1a446597611e1ca36c9aa2deda013.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217540

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libsoup/-/commit/07b94e27afafebf31ef3cd868866a1e383750086

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-4969.patch   | 76 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
new file mode 100644
index 0000000000..d45b2a2cb0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-4969.patch
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
+index dd93973..b3611db 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -108,7 +108,7 @@ find_boundary (const char *start, const char *end,
+ 			continue;
+ 
+ 		/* Check that it's at start of line */
+-		if (!(b == start || (b[-1] == '\n' && b[-2] == '\r')))
++		if (!(b == start || (b - start >= 2 && b[-1] == '\n' && b[-2] == '\r')))
+ 			continue;
+ 
+ 		/* Check for "--" or "\r\n" after boundary */
+diff --git a/tests/multipart-test.c b/tests/multipart-test.c
+index 834b181..980eb68 100644
+--- a/tests/multipart-test.c
++++ b/tests/multipart-test.c
+@@ -562,6 +562,27 @@ test_multipart_bounds_bad (void)
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
++	soup_message_headers_free (headers);
++	g_bytes_unref (bytes);
++}
++
+ int
+ main (int argc, char **argv)
+ {
+@@ -593,6 +614,7 @@ main (int argc, char **argv)
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index b986e2eea2..df97a68b9c 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-1.patch \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32914.patch \
+           file://CVE-2025-4969.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.43.0


