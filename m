Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B2F8E9A047
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 12:14:51 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10710.1771416888603070283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 04:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P4MwXc7U;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8231061d234so1395307b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 04:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1771416887; x=1772021687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D77mQaz1upcUgVBw85MCZSOMIj3ezZONH2wcqO7wW3g=;
        b=P4MwXc7U+uA/4JeTGLs+OJ70mBpTHtKhTzJM/E81rhokFp0gyDcf6Dtl+MtsIGPoE2
         05VUbk58VDECufV1amPcVLbICNJh5k3hluTpkV73Z1jSp4/NO1URNJEBaAeyEK3NLRDG
         teXRbCx5UHvh3aWAtNnOuVb6XcdW+nP28f9oU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771416887; x=1772021687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D77mQaz1upcUgVBw85MCZSOMIj3ezZONH2wcqO7wW3g=;
        b=Hyq0J26GAE5krz3JrDGvJTjZi4UJxnzdFy7kbqAcGbOmbIJ98OZDGMdcIU6T+lTA3W
         l9SnPVNX240ag83f14LuIZQLrlw3GSuk9k7pXJyXD57r2A5C9w36gLvRV27Ie9UG2lLb
         yjmoxLY7Sr4e3bLYP7HfEQ5NOnQn3uDMUl/3IySlELJtcUKohnBYP3HhLWE3ejo4O41e
         53FSqai0p3S296RuSiPDEHUdccWXaD9UpYa6NRwBuOX5XSP/cccWSp1lLZrjUmnNfHMS
         gyjRVAtY3825P0BqhO9GTzSYjXs4w5YhlEUyr2EhTooVhNWJFNug1JU6KroYTWBmKQ0R
         GEzA==
X-Gm-Message-State: AOJu0YzAVNtIplIgBmihEZRaAfhk/rB50G8C7G0sEkWMCbdxh7419XWy
	vMTA4F3fKaTEsNgfhiz5hcRnkzCbMeQn36jSsLUzCXEbsdRh6SX6B0TvWxdO3Bzp725l8hKg5Yv
	e+3jvQcQ=
X-Gm-Gg: AZuq6aL6j0NUMZvw98R1/NT1o5ndIjpGkvxw6b6xpSbRP7/rlpjEMNFCVbaQzaAwCtg
	Ie8jTsomOzocZl2YkeVdOacyXTc2hOpk7EXn4FyUNR/o5gAbjQ/IH0Gw9HB7ePS05TwvkZMF13p
	hpLgPWPbF5pbINccJzBh3Fpnl8Tv1Yjsv2NHI2L7t3sK5nqhA1aGqxYIfGJDJCargdRZc8F6pql
	2yRVkWUlwzFdZ2rZG+eJ4RpnDl/5BedIJEfcRj/DZhvrHvnVEaaD+0b4wUb6U/JA6Xd+jSqoEut
	ZwFJE+JIboZ1AfKCQna3ZO1h94UsaDnFwuoGF7u1MfatobOWv0kHJ3J1kK0TeFVDHRY37+3QM4h
	aMLSOX+3govAYt64voS1g+b6k/fiGEjNVPoiEGXnjE79EB+uD4eq/kAp/87ZP1lI/Z5jHFxDJn1
	uFo10/P9hWzuN9hZdCZqkVXaU3PZ28cU8Pbw==
X-Received: by 2002:a05:6a00:4f90:b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-82527489095mr1641757b3a.12.1771416887465;
        Wed, 18 Feb 2026 04:14:47 -0800 (PST)
Received: from localhost.localdomain ([2406:7400:54:795d:4eaf:bc6:7db0:f8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69ee6sm16559532b3a.32.2026.02.18.04.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 04:14:46 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: Fix CVE-2026-0988
Date: Wed, 18 Feb 2026 17:44:38 +0530
Message-Id: <20260218121438.514114-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 12:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231296

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/commit/c5766cff61ffce0b8e787eae09908ac348338e5f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 61 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
new file mode 100644
index 0000000000..1b67b162af
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
@@ -0,0 +1,61 @@
+From c5766cff61ffce0b8e787eae09908ac348338e5f Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 18 Dec 2025 23:12:18 +0000
+Subject: [PATCH] gbufferedinputstream: Fix a potential integer overflow in
+ peek()
+
+If the caller provides `offset` and `count` arguments which overflow,
+their sum will overflow and could lead to `memcpy()` reading out more
+memory than expected.
+
+Spotted by Codean Labs.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3851
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c5766cff61ffce0b8e787eae09908ac348338e5f]
+CVE: CVE-2026-0988
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gio/gbufferedinputstream.c        |  2 +-
+ gio/tests/buffered-input-stream.c | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
+index 9e6bacc62d..56d656be04 100644
+--- a/gio/gbufferedinputstream.c
++++ b/gio/gbufferedinputstream.c
+@@ -591,7 +591,7 @@ g_buffered_input_stream_peek (GBufferedInputStream *stream,
+ 
+   available = g_buffered_input_stream_get_available (stream);
+ 
+-  if (offset > available)
++  if (offset > available || offset > G_MAXSIZE - count)
+     return 0;
+ 
+   end = MIN (offset + count, available);
+diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-input-stream.c
+index a1af4eefff..2b2a0d9aa9 100644
+--- a/gio/tests/buffered-input-stream.c
++++ b/gio/tests/buffered-input-stream.c
+@@ -60,6 +60,16 @@ test_peek (void)
+   g_assert_cmpint (npeek, ==, 0);
+   g_free (buffer);
+ 
++  buffer = g_new0 (char, 64);
++  npeek = g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM (in), buffer, 8, 0);
++  g_assert_cmpint (npeek, ==, 0);
++  g_free (buffer);
++
++  buffer = g_new0 (char, 64);
++  npeek = g_buffered_input_stream_peek (G_BUFFERED_INPUT_STREAM (in), buffer, 5, G_MAXSIZE);
++  g_assert_cmpint (npeek, ==, 0);
++  g_free (buffer);
++
+   g_object_unref (in);
+   g_object_unref (base);
+ }
+-- 
+GitLab
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 50701be3d0..7c0ed01f55 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -70,6 +70,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.25.1


