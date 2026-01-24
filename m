Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2C1D715FC
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 20:53:57 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27070.1769288032715859231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Jan 2026 12:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NCOBc5a7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260124205350011c296d5a00020754-pfd65b@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260124205350011c296d5a00020754
        for <openembedded-core@lists.openembedded.org>;
        Sat, 24 Jan 2026 21:53:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=94+8eJAEUoFtimlOfxLGT/VHLB0eGneL5nZ53Y2yCso=;
 b=NCOBc5a7iOU70DKfLoJex5zU26caT/a0xYrKkLUIqDFhs/IWJs3TDxm6i7pB0huIm8yhKk
 9GIZzuN2Xc9I4UvCOJckQ0wirs344AItU3dfRnDTTlPRQZwD8POmaTZGUwojOrSGFoCdMfbB
 cM7wunO9U882gWGjV4wiS6NO44W/czqromtxR0y3eVQotfooMLTj5cAuMMVSrj6gMrVcGBRF
 YrS/2kMev7pHSdreW5zfOctvbxJKV3E/5NH/fYDv61EJrXuI4iXYS8hnM4aG4pupCOMjshVe
 PV4SrLMowDqJmS7vMsn88skiFHyN3LlcvC9i1ZCUSuc670C0b7C95ufg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] glib-2.0: patch CVE-2026-0988
Date: Sat, 24 Jan 2026 21:53:46 +0100
Message-Id: <20260124205346.2059762-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Jan 2026 20:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229927

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from [2] linked from [1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3851
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4944

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 58 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
new file mode 100644
index 0000000000..1cdc3735ed
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
+@@ -588,7 +588,7 @@ g_buffered_input_stream_peek (GBufferedInputStream *stream,
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
+@@ -58,6 +58,16 @@ test_peek (void)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 7ba52b5c79..89cb126b73 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -64,6 +64,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-4373-02.patch \
            file://CVE-2025-7039-01.patch \
            file://CVE-2025-7039-02.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

