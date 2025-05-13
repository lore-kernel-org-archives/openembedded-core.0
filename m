Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F02C3ABD9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 19:08:34 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.84426.1747163305585022731
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 12:08:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LRKBcwg4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22e45088d6eso76377085ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747163305; x=1747768105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZo8fTPtqK6BvRVzAMME5LGVgdRv3TtfPIyv9iAEMaE=;
        b=LRKBcwg4hc1ZXsCCoXgLaY50pluokvgBWDSYvx+NNeM6yh4vlZcTsL6qgkLj+QtLGd
         s6mZ/eTz+fOvkH4HlNZw5UfOwBM6iXhg6AlNi3zFJvcWRfpQp8xxUl3uO84Lw0qjbFuf
         k/xUBCRF26LTUJ7M3vHudN0gspF5lDPcGw9lntQtHzOpTz89kHahZTBSqp3Xjj8ywPFf
         AwWBwuOBAH1GABIBT2Et14IfNJRqKjZjtp37vf+IQCeGxGptg8Xj6gxfqmYtplIjZDfV
         QcXtAtYqqB9rkCXJlBoiCPYK/zGIWC2scz1Wubj4z2N87xzjyHUl0IZ3CSTE1p9tJPPO
         qw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163305; x=1747768105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZo8fTPtqK6BvRVzAMME5LGVgdRv3TtfPIyv9iAEMaE=;
        b=QE0OTS01nXoXgLW62zfHf9eca169yJ95N2+XjFZYW5kANDDlEkudoiuMLxgnlGPiiV
         OemYJlDznEdSN9x3M3JEu5HvbaTo1IyGHtjZxc13T5aotQLt1VlYK5+vTWkur27mMEw5
         r1pbUXjOnjv3btN+ruyR8zZqwGrRY015j+jrANU0XGATWa76auE5QFSY4eJiiZzZDCDN
         CQjNlq0SYMtbS6KbEcnZaWQwk9Lox2HzIH2GMkU+8T50SpoPNO5Pc3u04r5HmPpf6hV7
         rk5JtaJo4KFRp3yBUHM9orDc8NbfGjNs1z0g8I//9iX+WBAR9q8tDpjoOKBHDnDadYVC
         JJTA==
X-Gm-Message-State: AOJu0YxWGKBBCEM4AaQMDaDkL3PLafmbjckLV8wSC7amD1E1DHhagc9k
	jHv5pHu3j90i3HDedhoo2kv8dl0rfV2vIo7TwV0gyCfQFw3H064ods9PPBjeEXGSDJ9e9hnyPFD
	N
X-Gm-Gg: ASbGnctHcHBubgMsUv0hGx2cCPAWBFRyBOx99jAqAY9K4ty0F5b6rkijNbpDa29fdE/
	KXD4bp6a7h0GNVZ0Cfxwp9mVPsLDGtfbgXPg+R8XJoVaPKSOCQcJxccM8cxpkSrZBxrve8lIfoP
	Zq/8fO+HbHl6TevasSRivUMU+Z5yENY9zI3dHcn/H97EEMxPUwRLuf876CMjq2Vgm+kY8j+BWpm
	/I3RDTzuCU6aMqJg1xnhcH1VCl91vwLPilipT94aQmHQpvA9xlrC67YJUE5QNLol+m4vkGjdHic
	acU//X8dh21JNUsrbO9EPf9nY4mz7RCLcEV14mVr/8o=
X-Google-Smtp-Source: AGHT+IHAfYUJ28aEudHzz05o4c1HPwXS1vKjMviXSiq2/BFU7V0bopAuXQ/S9qbGoU8oPUAfL3A7Sg==
X-Received: by 2002:a17:903:1109:b0:223:635d:3e38 with SMTP id d9443c01a7336-231980cf7c1mr9367735ad.15.1747163304721;
        Tue, 13 May 2025 12:08:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:37ec:faaf:5b57:6b2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc829d425sm84851005ad.202.2025.05.13.12.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:08:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] libsoup-2.4: Fix CVE-2025-32906
Date: Tue, 13 May 2025 12:08:00 -0700
Message-ID: <2b938dd6beb1badca59804ffbe395deb679bc1b1.1747163155.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747163155.git.steve@sakoman.com>
References: <cover.1747163155.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 19:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216436

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


