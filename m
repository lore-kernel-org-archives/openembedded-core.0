Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE15D715FB
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:53:47 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27071.1769288026361495608
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=AUNiDOoI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260124205344444d0dd22b00020781-vai8f_@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260124205344444d0dd22b00020781
        for <openembedded-core@lists.openembedded.org>;
        Sat, 24 Jan 2026 21:53:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Dtq6NpMD51TOdTaseZUIBVQ9q/cH94IQqVkts6XLaG0=;
 b=AUNiDOoIl5yDOjVeBedItBsxSsZt59W9TMnHCP8dGWxJPRPYmSgrnHEBsQf/j5dCm3Vrwn
 P0QeA/JUPp2QsfpHCDJ5K+niW/7chkf59bIiyPFq5QU6iPtEu4ROlMJ6d29LazKLPRdnawn3
 yf79Rsw2RcDHR3qyrUxQe+v21cT2lejQagUxbI2r4pnjdwSVpjPn4mMtokyOaMA7hLRtf2TL
 +hUTbmCoI1FFZ+Z+AvS4rqiM3P6NUcka1Fgth0TSdA4cGgnrxFt3Ni1q+BqNdMYWEWJY9uOD
 GqecHdkxQoaqqMK1FS+5ijmdguJn/6mcjft8+cE7HA8oDWZu2aaS5TKA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] glib-2.0: patch CVE-2026-0988
Date: Sat, 24 Jan 2026 21:53:40 +0100
Message-Id: <20260124205340.2057130-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 20:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229926

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from [2] linked from [1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3851
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4944

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 58 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
new file mode 100644
index 00000000000..daf86224d5d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
@@ -0,0 +1,58 @@
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
+CVE: CVE-2026-0988
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/c5766cff61ffce0b8e787eae09908ac348338e5f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gbufferedinputstream.c        |  2 +-
+ gio/tests/buffered-input-stream.c | 10 ++++++++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/gio/gbufferedinputstream.c b/gio/gbufferedinputstream.c
+index 9e6bacc62..56d656be0 100644
+--- a/gio/gbufferedinputstream.c
++++ b/gio/gbufferedinputstream.c
+@@ -590,7 +590,7 @@ g_buffered_input_stream_peek (GBufferedInputStream *stream,
+ 
+   available = g_buffered_input_stream_get_available (stream);
+ 
+-  if (offset > available)
++  if (offset > available || offset > G_MAXSIZE - count)
+     return 0;
+ 
+   end = MIN (offset + count, available);
+diff --git a/gio/tests/buffered-input-stream.c b/gio/tests/buffered-input-stream.c
+index a1af4eeff..2b2a0d9aa 100644
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 9f93655739b..79c40747536 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -33,6 +33,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-6052-01.patch \
            file://CVE-2025-6052-02.patch \
            file://CVE-2025-6052-03.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

