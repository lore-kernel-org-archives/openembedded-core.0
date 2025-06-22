Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1909FC7EE2A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 15:02:32 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.27809.1750604549241584457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 08:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DCpFQbtm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2275784b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750604548; x=1751209348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WDdYMUqxVIDE9lywS6Hz5JbnaYE8FpslTLShypvcHM=;
        b=DCpFQbtmgnboyw1jtTq4BMJRvnUVQ4f0OxMRUw2/FAj4VE3nre80Ggbjy1ustgLZ6M
         bXmKUm4FaZ/6LHjDZJLhemz1yQnTTqCSNXDKpN1cZMvPqvnU+50mdhF0ptXec+1PbAEy
         GEyFB44vHrkby8ef+rBEKkhMrvV0JahfChO9U4Q5MBfxE3DZ3KW3G+cW1Bh0fMZdtIfC
         6zdZ7VOKsWTAbY7ZC2aQFfr6qsSAe8DtO7xGdiIQgUHja7FRFe6FT+u8d2QLEUeJhyyL
         xregH7coMgrn+USt8ho1rG2tcIADqiJ1KW0vsVXDwq/hlfD77oTf+hLBVJ7RXs15mp1D
         DIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750604548; x=1751209348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8WDdYMUqxVIDE9lywS6Hz5JbnaYE8FpslTLShypvcHM=;
        b=fbA7GddaGWGMS4CPFBGE1ZCDlG/dpQLE6PtnhgjQ7INNXvnuvXVT48b8uxnRDNUEH4
         dICdCXB+nsRhaMNTh6qCj10dQy5fxKj1FJxvwkXq4YU0Mcqgv3qZ64lqgptwtiq79OW9
         MZ5X0HoT1EedN6nISSxUIG+ErOfqJF8T3zOQBLavqHvCmL/cNSN5NdqtsQKzTLp6INDX
         CNG/7CjPoCtgMk2y0wm7fVmwNYRHQKVWHvFfrN2XZgyOuy8J+T4P+XvLRtJU3mfTZI5c
         kYxvsuJ4QRtX6CQVKglV43IuCu9d6ieSi31SDJ9sVnQMCZ1y97z8e6AXwYdNoEbZi3/n
         2MaQ==
X-Gm-Message-State: AOJu0Yy5dzY2qQvJqmGMjYCLpt1MzbZVo6Khge0JSmIOpYdcEGqw6J7U
	BdGJ+DVwXXMfjCZrykuZMlchh53WqxB4tNWu13OuS05sNrqpIgz83yXE+LBqRsENT7pUOvbOt+f
	mp/e4duM=
X-Gm-Gg: ASbGncv2cSL37MlcamFdP1pPv1YldIYrGT1JgxeeGKCGyE63zcaYjoAK1BXRF7YfXXQ
	0mNvT0tQ/023k9KfteRq4jjuF3lordhKiPlYGZ31Vo0dvu0tGRMzHZfBao3762Qx01ZfluX3fbV
	qzupxZ1FbXShBg8Or9Pjg3tfPo9X4jGZ8DF4uqG742OOf+oy+JHTzN9tUZXB3DF9I1BS0j3HOzE
	WdiNk3vvALAtAgBLZLn7sm3PaGfaFJ+TpZUHfzeZqaanNmEOmRTdmAT8RIOu1PXKWmUsELMBeWG
	7X/3DjC28pRM2BUrS88SxGLLY/vbE8JGinJENWwlK8h3d9L/M0UMIg==
X-Google-Smtp-Source: AGHT+IGwBPzNMBqk00+3OHUrx7GpTas8V/R3llg7cCz/hgj+IsGLIVKjB/fi4zXs1erStOzX4sS6tg==
X-Received: by 2002:a05:6a00:a1f:b0:748:2e1a:84e3 with SMTP id d2e1a72fcca58-7490d9aae0emr16047153b3a.8.1750604548385;
        Sun, 22 Jun 2025 08:02:28 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a75:9ad8:d661:8bd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a46eb71sm6222521b3a.22.2025.06.22.08.02.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 08:02:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/14] libsoup: fix CVE-2025-32051
Date: Sun, 22 Jun 2025 07:59:59 -0700
Message-ID: <4af9a40f53a6a9607999f0f4b28d2ce1eaf325a2.1750604257.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750604257.git.steve@sakoman.com>
References: <cover.1750604257.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 15:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219183

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/401

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup/libsoup/CVE-2025-32051-1.patch    | 29 ++++++++++
 .../libsoup/libsoup/CVE-2025-32051-2.patch    | 57 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  2 +
 3 files changed, 88 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
new file mode 100644
index 0000000000..efeda48b11
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-1.patch
@@ -0,0 +1,29 @@
+From dc5db30989f385303c79ec3188c52e33f6f5886e Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Sat, 16 Nov 2024 11:50:09 -0600
+Subject: [PATCH 1/2] Fix possible NULL deref in soup_uri_decode_data_uri
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/0713ba4a719da938dc8facc89fca99cd0aa3069f]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index be2b79b..0251279 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -303,6 +303,8 @@ soup_uri_decode_data_uri (const char *uri,
+ 
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
++        if (!uri_string)
++                return NULL;
+ 
+         start = uri_string + 5;
+         comma = strchr (start, ',');
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
new file mode 100644
index 0000000000..24c184bb86
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32051-2.patch
@@ -0,0 +1,57 @@
+From 7d1557a60145927806c88d321e8322a9d9f49bb2 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Fri, 22 Nov 2024 13:39:51 -0600
+Subject: [PATCH 2/2] soup_uri_decode_data_uri(): Handle URIs with a path
+ starting with //
+
+CVE: CVE-2025-32051
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/79cfd65c9bd8024cd45dd725c284766329873709]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-uri-utils.c | 8 ++++++++
+ tests/uri-parsing-test.c | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/libsoup/soup-uri-utils.c b/libsoup/soup-uri-utils.c
+index 0251279..1ff11cd 100644
+--- a/libsoup/soup-uri-utils.c
++++ b/libsoup/soup-uri-utils.c
+@@ -286,6 +286,7 @@ soup_uri_decode_data_uri (const char *uri,
+         gboolean base64 = FALSE;
+         char *uri_string;
+         GBytes *bytes;
++        const char *path;
+ 
+         g_return_val_if_fail (uri != NULL, NULL);
+ 
+@@ -301,6 +302,13 @@ soup_uri_decode_data_uri (const char *uri,
+         if (content_type)
+                 *content_type = NULL;
+ 
++        /* g_uri_to_string() is picky about paths that start with `//` and will assert. */
++        path = g_uri_get_path (soup_uri);
++        if (path[0] == '/' && path[1] == '/') {
++                g_uri_unref (soup_uri);
++                return NULL;
++        }
++
+         uri_string = g_uri_to_string (soup_uri);
+         g_uri_unref (soup_uri);
+         if (!uri_string)
+diff --git a/tests/uri-parsing-test.c b/tests/uri-parsing-test.c
+index 1f16273..418391e 100644
+--- a/tests/uri-parsing-test.c
++++ b/tests/uri-parsing-test.c
+@@ -141,6 +141,8 @@ static struct {
+         { "data:text/plain;base64,aGVsbG8=", "hello", "text/plain" },
+         { "data:text/plain;base64,invalid=", "", "text/plain" },
+         { "data:,", "", CONTENT_TYPE_DEFAULT },
++        { "data:.///", NULL, NULL },
++        { "data:/.//", NULL, NULL },
+ };
+ 
+ static void
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 90733a73e8..be29ff0e5d 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -40,6 +40,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-4969.patch \
            file://CVE-2025-32907-1.patch \
            file://CVE-2025-32907-2.patch \
+           file://CVE-2025-32051-1.patch \
+           file://CVE-2025-32051-2.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.43.0


