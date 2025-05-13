Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE80C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:51:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.73385.1747133502949391714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 03:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HHQ5CtoJ;
 spf=pass (domain: mvista.com, ip: 209.85.210.173, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7415d28381dso4474606b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 03:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1747133502; x=1747738302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxbLxAFaprAru4Pi+76UG/fWVcBtGGnHib+9sdl8VhI=;
        b=HHQ5CtoJqFkVO2a/WSb80HGNcyy98D3aVbP1UXoCRs/5SxNhROysOk0MZeyN/XEY4l
         fteA+ulVWG999WMW+5/2QqR9jFFNsoMhBWP5+UrR6/2u2iV3BDdkeLe9r6S5GO6Kk3Bt
         WTiu8S9nsBYDwOba3RBdzRPsQt50MMEkVhtgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133502; x=1747738302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxbLxAFaprAru4Pi+76UG/fWVcBtGGnHib+9sdl8VhI=;
        b=qX5C3h6cfH2gdwLBtEkMzKHRx/PdDUByp1nD04Ka/LdBECqdI5FYkfmWFs9Jj4a1xt
         yynxNQ7iyqUxRpRf3wpHpEDQQiraP3kMK8z9IN2h5zazEPUfhfHHN7Ox/ZzFonPyuxwc
         woK24VGhITo4kmR1YZGRFxA0Idj+Lp2DnDy/eT88b9tSWjRV0epV3oxTsB+7Q2g+TMb+
         7CsMeIMNYaBMA3MFWYZb5H5QLgfcXIxW6nSUcuYHLXD96wBKhcTr6DwIuh8SPBURQB9s
         jgt7zHXBrCr5GOa5rHcCCKvfxzWy5qfC+fzjo995N4o6Kj22uBzz6HJ0Ikx+5ApB74c1
         WugA==
X-Gm-Message-State: AOJu0YwkFPLyxFDaVckl7ldO8vd7Gd1VK4scpXxYVWsSgSOjme0pq91A
	sPaQ3oYQLDQxVFBbbznKuCFXYNZMTTiKmqqGvBvrOdgfhHuTvccvQldqXrjJUNFq3bML/Dvgpp5
	OxLU=
X-Gm-Gg: ASbGncsulMHUBGeR65ghbq1GKVnheg3fiu/vYTS3+J4wT76HSg62JSLoMqT1YN1xhfq
	r4z5MIliWH0MozE91yvjEWOHM3COQ9b1Ze04PRhiZNkKKiDUAz5WQRzbeZtMz1W0HWTEhaLtXO8
	MDrDcuEFn9EU0j8nNT8Fz/BsFkFDS+Xd9NEsmuONgQaw2HHcAA+5gg1X1j8FDob72KQ5v+lPm8o
	zhsHj1jWVkZWwOsMLafVzqxVBkFL8CHzOEX5NREZw0j+Ws4mAO9JPDdpUmSQqggrgPbTmn+nUxB
	lfFaB6Z+b/hoqkg2QgDthn5eDeKt18v4sy6lLaHoblPICqUCDLfeZqrWwqKu8MFUuwX6vxiBfA=
	=
X-Google-Smtp-Source: AGHT+IGDKKcjv7vMsdJwA+ytzXeUHGRBgZzIhnuF0iC5iRY16viFuyLaFxRGjWHbWk4GOWZjm+E1Kg==
X-Received: by 2002:a05:6a00:138c:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-7423bc1d5f4mr21080891b3a.1.1747133501960;
        Tue, 13 May 2025 03:51:41 -0700 (PDT)
Received: from localhost.localdomain ([49.207.220.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a3d861sm7796759b3a.147.2025.05.13.03.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:51:41 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 2/7] libsoup: Fix CVE-2025-32906
Date: Tue, 13 May 2025 16:21:24 +0530
Message-Id: <20250513105129.2284690-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513105129.2284690-1-vanusuri@mvista.com>
References: <20250513105129.2284690-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216412

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from
https://gitlab.gnome.org/GNOME/libsoup/-/commit/1f509f31b6f8420a3661c3f990424ab7b9164931
& https://gitlab.gnome.org/GNOME/libsoup/-/commit/af5b9a4a3945c52b940d5ac181ef51bb12011f1f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32906-1.patch    | 61 ++++++++++++++
 .../libsoup/libsoup/CVE-2025-32906-2.patch    | 83 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32906-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32906-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-1.patch
new file mode 100644
index 0000000000..916a41a71f
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-1.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-2.patch
new file mode 100644
index 0000000000..5baad15648
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32906-2.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 4b723d3150..a5b6c2f039 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -19,6 +19,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2024-52531-1.patch \
            file://CVE-2024-52531-2.patch \
            file://CVE-2024-52531-3.patch \
+           file://CVE-2025-32906-1.patch \
+           file://CVE-2025-32906-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


