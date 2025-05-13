Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A43C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 09:04:01 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.72063.1747127033922202535
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 02:03:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GB4Y7AlS;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ae727e87c26so3669106a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 02:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747127033; x=1747731833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHapH8kc42fzlTniiO/LbURp0yAPINOy9rcFEj7w8TI=;
        b=GB4Y7AlSvjCI2PZonyUwdB24+R23W/i9s9mNLAZUF0tL8A28O+z8WDsx6NUo0uRtgj
         zKtTALChO4fb9JD0u0p2cCPYKNgAx/aT0GvElkZW77v1lr+YDAOtgmd2iOxutBjDP/Mn
         y+jR7TtsPT0coN6Eh9fSLMeyXXPK+cZVyxG98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127033; x=1747731833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHapH8kc42fzlTniiO/LbURp0yAPINOy9rcFEj7w8TI=;
        b=p4xUFRhMUk3EiNjX1TlfZ4Mq0xqIUS7gi+sUTg9yRK7oVGtJcZsmwPHlaLWcaSA2+M
         RqpGEGSx+qhPrzTbCaikZTCfFoVL/Sq5P3snq1Y78CO0gkx9TDtchD4v+vWE+Y8TmWeM
         rn/UKKAej1I0QZIXed8Yc5NK0LGJyRccm+MuxbVjKhxGal41J/ZEFV5XnvdkAlnPFNuA
         XwswDNNEHilrixjdLSlBQN8WYKmWzuoAJK+kdNzFaTN0GBLgcLorjvaCShX1ZchrOvyq
         WSIew6XLzEcc82iDiULIKrKfXynzEoC5/pKO9McWSlilTuXJwZlDDLidzYgpq+WO7wm6
         t37g==
X-Gm-Message-State: AOJu0YyhC6kaVopp9s+sV9xzpnx5cxzuwjgoX6P6NpEf50Z9ARPFbTOU
	t8ve3t7fpV73LpbJ4vRvvb6zFWzj920YVnAeXCkIKXkqa6VOy90hJPSQe2He2u1kGbUPz7C6oqD
	D9L4=
X-Gm-Gg: ASbGncuK9BCI78QjuSeEd6LJTZ4wx6rz9esCN7+cJf+sgEZPWhTUSwvY9wY+Ctt61sr
	o/88kG0uL1H+pPGNLSXM8Ud5UTC/ZYKSY91i7rf73MhkHnjvwKB0jiQRvaFJaR7x5Lt/nQMbsOI
	KoXf+brsWVj14cXuq08Kmp00UZQ0eTc6FxwWKkOJDGTEsD43Gaf562eWU9TwS5zly++wfKvuKv0
	i49rfZdmpeHf2SLFWCnSOlyz0BFheJInov8FGEHw7dQOx7Ye1IOtP6OOAo1vwAcwom0sFE05mHb
	49t/ypEHvmOCMBreB8kbSP2tfiwbL0d5Bs4jdY2Qaii2zyXPSTnuf/T7bZLWb5Uaj8FF//OmZA=
	=
X-Google-Smtp-Source: AGHT+IE6oMmb+hmpt6UBeuR9QoG6pzaucnMbjxzXA+TsKuW8KL1UmQylm5aqzdjOeiYU6eaU0D8mVw==
X-Received: by 2002:a17:902:cf06:b0:223:517c:bfa1 with SMTP id d9443c01a7336-22fc9185e59mr270652305ad.38.1747127032813;
        Tue, 13 May 2025 02:03:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829f388sm76574885ad.214.2025.05.13.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:03:52 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/3] libsoup-2.4: Fix CVE-2025-32906
Date: Tue, 13 May 2025 14:33:39 +0530
Message-Id: <20250513090340.2209255-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513090340.2209255-1-vanusuri@mvista.com>
References: <20250513090340.2209255-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216404

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup-2.4/CVE-2025-32906-1.patch        | 61 ++++++++++++++
 .../libsoup-2.4/CVE-2025-32906-2.patch        | 83 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  2 +
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
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index b299fcf6de..f409816fc2 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52532-3.patch \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
+           file://CVE-2025-32906-1.patch \
+           file://CVE-2025-32906-2.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


