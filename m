Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A56AC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:58:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.79448.1746547078621451449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=W0xbZU6Q;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22d95f0dda4so83976735ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1746547077; x=1747151877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYV63sfKHSOQ3ewV+09RyFdsAIsPR2On+PtvPNwjbkc=;
        b=W0xbZU6Q0cgyf5cUE/VIIYU2kDbgIAbXeKMOb/jReSepeB9L5SM6VIZ4gU6DRnuFs2
         qu8SrEDs5dDaIWx5CB5oM0mi+0SLGuelpEs+iRYsf/3QLsNfHxaWAwKJiBcl6o2fKS4K
         Bw6BRLEbS8sUaxeqHk4cJzVzVDb4edVZrl22Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547077; x=1747151877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYV63sfKHSOQ3ewV+09RyFdsAIsPR2On+PtvPNwjbkc=;
        b=UYDemWnz9P7ljPJN/Cwvp2SaQQoucBcyUfpo+H9mzw0ATOauvLlNl5C2KSFsbhbwhx
         PnJVffqZvf8wUZseyYxJt2boAT4QUL95F7KytDenVIMehOG/KgIeTGgOGzKf1sZbtV5e
         j6FjMi3oKD+Z2eyxW9JEaGutsdwJEAKtDdGQYYopaTwtqdTopDNoVJmn92mnw/P6Blxu
         DI0WBJu8oZBhRHn/lBdaTMTm5EAbNNHcQt1anot06E48CriUTODng7nrSZeB9Ov2hxJD
         3OIIyaGX1ui2cMEH1LJF49u6VeaLn0HiLKUsqjJ3I9T+WRXUxEU8JBCrDs4Kgctyv/Aq
         Dk7A==
X-Gm-Message-State: AOJu0Yyat9NTbVNmXUB/abxa9D3Jb7LfdhJQySw1Cw3PAhuhiU1ezL2u
	syvJSmSTLl9dOt38Hlf/YLv5uY/kCJP8T/q9Q2Q1HS+IsI2nSfm4bZJsSpBcs+mjc0AGh8ocigr
	TZwQ=
X-Gm-Gg: ASbGncsTSoPvjTgwdGX3tPfkZeuSaX3qp00bQqfDCoTEydPJObNJ1OXeaBIcer12mZQ
	sltuQbeJTybxO7Tt1PkFC7kGN1oJRzqR8EXcAhSs68W2uEisM79D/6olBctCEmQt4gZVfigqTjX
	guPp086wT9EwEXzTomv4z9Jsv66D0T7cjQ31ONxDDxj1SWOrJg2jXydJlSOYdx+ge69NIYJSSrA
	BpIkBOdA4uHvaIIAwwD05EHGKuCIeqSJUPObli75pudZpVPfuZd3brg0w487XRHgNr51W/mvNYu
	PKiF1lgxiyO3QmloRiFTRfBbv1L8S96eRKSn1UW7wI8VozJPWbE=
X-Google-Smtp-Source: AGHT+IERM74zlIcqZziSCfkMtwerN6dND5TYJNCtahnRSck+ddWq4p77js1oyiQVmoAuVMkYOGC+PA==
X-Received: by 2002:a17:902:fc8d:b0:216:3d72:1712 with SMTP id d9443c01a7336-22e365af0demr56076745ad.48.1746547077522;
        Tue, 06 May 2025 08:57:57 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.214.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm75502685ad.140.2025.05.06.08.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:57:57 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][PATCH 4/5] libsoup-2.4: Fix CVE-2025-32906
Date: Tue,  6 May 2025 21:27:30 +0530
Message-Id: <20250506155731.677168-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506155731.677168-1-vanusuri@mvista.com>
References: <20250506155731.677168-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216071

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-2.4/CVE-2025-32906-1.patch        | 61 ++++++++++++++
 .../libsoup-2.4/CVE-2025-32906-2.patch        | 83 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch
new file mode 100644
index 0000000000..916a41a71f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch
new file mode 100644
index 0000000000..5baad15648
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32906-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 6125c0624a..c0c2209501 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-1.patch \
            file://CVE-2024-52532-2.patch \
            file://CVE-2024-52532-3.patch \
+           file://CVE-2025-32906-1.patch \
+           file://CVE-2025-32906-2.patch \
           "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.25.1


