Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1677FC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 10:43:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.5741.1744886618967847382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 03:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Zi1ss3ah;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33e5013aso7206235ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 03:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744886617; x=1745491417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbfFwHfFBGA0DblcycTd+RxS2Xz3rknvKxHj+JH3eT4=;
        b=Zi1ss3ah2BAedOA5NSxpWTwM2/oQcx9VMsYlx5D02BOFVyn7bdEK1PMQ2jqqmYILJf
         uUxsS+eDC+kYOM3JmI0qOYn09/fLtg9LwqhB0mAVK1D1qqkx5c4KXOSS3k3hUwMN5eEV
         KSCKDifIhhmDYnb5B79IR4gNH5lJmrx2W24qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744886617; x=1745491417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbfFwHfFBGA0DblcycTd+RxS2Xz3rknvKxHj+JH3eT4=;
        b=Es9bMMujNLjmx2d3ZJDDIex/Fj2JOw/Yl4qjPb3pzjO8v/axAL7Gc8lMeIOJOeE/q3
         qsCpUMweuf2sAwciFwN+RZVIes6vPS/WwQDILB8fQNsrDRqLOp29H2CqvkJkLIgGlAcP
         t2A8hodTRW6yD5R2EC6J40hT4ERAEQ5aFrlqgAcNJ+Nh+4jmlnhJavGEJNWJxfHcQPrW
         +jTNuZq0V6Igzp6BmRUHD+Zt5hioOoEZULmLwz/jKmFxOrv6bh4klWcnHp8Dx/Wtzqz4
         mM8mBxoP7tN+ASuofMhXu0EcVl2Q2p5KSI3H1d5U6d5FFHWkYU2N1Gqi1qT2UMabKFJ7
         vIxA==
X-Gm-Message-State: AOJu0YwlWlo57f/K9Zm7AHaqtA1jkXIR4kAzf0uYanufQ/33gerJBHZt
	3y6900+JZlp4iE9gen0tu9IMApfSAklcwrAQixQDZRYvZF5BZsEt6indpF4rAmt8yMQ5AhR1Bxx
	H96Q=
X-Gm-Gg: ASbGncvONBiAW1lLYcRDOFMh3Hpk6IEgpt1wTqBkynKbQzdrd11XJprNPyPdxWCaiWu
	X+H/RCLYbXcsnp9t1q3hX+rNDKU7z+zwfiUQtTaG/tVsrDUM/zYKWQLvUI1Qwi530R7mmWDQz9e
	ALCZeCYIjkgEj1Ykh6vLsg3VaEhJ2a4hcifyEcLjRwSMSYpVDURRVAHyV7SnHSxaqQvX8xEHpQy
	F+oplPwHvZal2xkld7ju8EsyU/PSb0UW0xS7YpuP+b/bJFWOzoUXv/4QMr3Go4HYkJLeWhOEIzl
	BbhWHWcru1Kayb55W+8yu0zNdVldyT8EcPyjUFEmqe1JdXtE+I0bm0D9pWw9uHQ=
X-Google-Smtp-Source: AGHT+IHpHNxUU4lDqR74TzgIBUMFfDEJeObbGa0KiAyhjV/j+xrMF09mXdIXAYGUiOHqNsVcVA6sig==
X-Received: by 2002:a17:902:f686:b0:216:53fa:634f with SMTP id d9443c01a7336-22c35983c46mr84255975ad.48.1744886617528;
        Thu, 17 Apr 2025 03:43:37 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.223.203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef1025sm30346605ad.39.2025.04.17.03.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 03:43:36 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH v2 5/5] libsoup: Fix CVE-2025-32906
Date: Thu, 17 Apr 2025 16:12:58 +0530
Message-Id: <20250417104258.64180-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250417104258.64180-1-vanusuri@mvista.com>
References: <20250417104258.64180-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 10:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215063

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-3.4.4/CVE-2025-32906-1.patch      | 61 ++++++++++++++
 .../libsoup-3.4.4/CVE-2025-32906-2.patch      | 83 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-1.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-1.patch
new file mode 100644
index 0000000000..916a41a71f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-1.patch
@@ -0,0 +1,61 @@
+From 1f509f31b6f8420a3661c3f990424ab7b9164931 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Tue, 11 Feb 2025 14:36:26 -0600
+Subject: [PATCH] headers: Handle parsing edge case
+
+This version number is specifically crafted to pass sanity checks allowing it to go one byte out of bounds.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931]
+CVE: CVE-2025-32906 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c      |  2 +-
+ tests/header-parsing-test.c | 12 ++++++++++++
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 85385cea..9d6d00a3 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -225,7 +225,7 @@ soup_headers_parse_request (const char          *str,
+ 	    !g_ascii_isdigit (version[5]))
+ 		return SOUP_STATUS_BAD_REQUEST;
+ 	major_version = strtoul (version + 5, &p, 10);
+-	if (*p != '.' || !g_ascii_isdigit (p[1]))
++	if (p + 1 >= str + len || *p != '.' || !g_ascii_isdigit (p[1]))
+ 		return SOUP_STATUS_BAD_REQUEST;
+ 	minor_version = strtoul (p + 1, &p, 10);
+ 	version_end = p;
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 07ea2866..10ddb684 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -6,6 +6,10 @@ typedef struct {
+ 	const char *name, *value;
+ } Header;
+ 
++static char unterminated_http_version[] = {
++        'G','E','T',' ','/',' ','H','T','T','P','/','1', '0', '0', '.'
++};
++
+ static struct RequestTest {
+ 	const char *description;
+ 	const char *bugref;
+@@ -383,6 +387,14 @@ static struct RequestTest {
+ 	  { { NULL } }
+ 	},
+ 
++        /* This couldn't be a C string as going one byte over would have been safe. */
++	{ "Long HTTP version terminating at missing minor version", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/404",
++	  unterminated_http_version, sizeof (unterminated_http_version),
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
++	},
++
+ 	{ "Non-HTTP request", NULL,
+ 	  "GET / SOUP/1.1\r\nHost: example.com\r\n", -1,
+ 	  SOUP_STATUS_BAD_REQUEST,
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-2.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-2.patch
new file mode 100644
index 0000000000..5baad15648
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32906-2.patch
@@ -0,0 +1,83 @@
+From af5b9a4a3945c52b940d5ac181ef51bb12011f1f Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Wed, 12 Feb 2025 11:30:02 -0600
+Subject: [PATCH] headers: Handle parsing only newlines
+
+Closes #404
+Closes #407
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f]
+CVE: CVE-2025-32906
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c      |  4 ++--
+ tests/header-parsing-test.c | 13 ++++++++++++-
+ 2 files changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 9d6d00a3..52ef2ece 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -186,7 +186,7 @@ soup_headers_parse_request (const char          *str,
+ 	/* RFC 2616 4.1 "servers SHOULD ignore any empty line(s)
+ 	 * received where a Request-Line is expected."
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+@@ -371,7 +371,7 @@ soup_headers_parse_response (const char          *str,
+ 	 * after a response, which we then see prepended to the next
+ 	 * response on that connection.
+ 	 */
+-	while ((*str == '\r' || *str == '\n') && len > 0) {
++	while (len > 0 && (*str == '\r' || *str == '\n')) {
+ 		str++;
+ 		len--;
+ 	}
+diff --git a/tests/header-parsing-test.c b/tests/header-parsing-test.c
+index 10ddb684..4faafbd6 100644
+--- a/tests/header-parsing-test.c
++++ b/tests/header-parsing-test.c
+@@ -6,10 +6,15 @@ typedef struct {
+ 	const char *name, *value;
+ } Header;
+ 
++/* These are not C strings to ensure going one byte over is not safe. */
+ static char unterminated_http_version[] = {
+         'G','E','T',' ','/',' ','H','T','T','P','/','1', '0', '0', '.'
+ };
+ 
++static char only_newlines[] = {
++        '\n', '\n', '\n', '\n'
++};
++
+ static struct RequestTest {
+ 	const char *description;
+ 	const char *bugref;
+@@ -387,7 +392,6 @@ static struct RequestTest {
+ 	  { { NULL } }
+ 	},
+ 
+-        /* This couldn't be a C string as going one byte over would have been safe. */
+ 	{ "Long HTTP version terminating at missing minor version", "https://gitlab.gnome.org/GNOME/libsoup/-/issues/404",
+ 	  unterminated_http_version, sizeof (unterminated_http_version),
+ 	  SOUP_STATUS_BAD_REQUEST,
+@@ -457,6 +461,13 @@ static struct RequestTest {
+ 	  SOUP_STATUS_BAD_REQUEST,
+            NULL, NULL, -1,
+ 	  { { NULL } }
++	},
++
++	{ "Only newlines", NULL,
++	  only_newlines, sizeof (only_newlines),
++	  SOUP_STATUS_BAD_REQUEST,
++           NULL, NULL, -1,
++	  { { NULL } }
+ 	}
+ };
+ static const int num_reqtests = G_N_ELEMENTS (reqtests);
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 2db854baa4..3a5758a1cc 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -26,6 +26,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32912-2.patch \
            file://CVE-2025-32912-3.patch \
            file://CVE-2025-32912-4.patch \
+           file://CVE-2025-32906-1.patch \
+           file://CVE-2025-32906-2.patch \
           "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.25.1


