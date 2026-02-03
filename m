Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BA3E6E7E6
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13490.1770113974827839431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0PIfroOY;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so39725655e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113973; x=1770718773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PneNM+LL4PY1N7lo+BrLmYDP0Iy/01guJ5KbRiE5Zbk=;
        b=0PIfroOYhoiXLgnbLhUrqRh4gztMxZb/3KutFc9jCKJsyD4VtcW5DN1aBEwqNAmBbV
         xIiOXnYdbZ3+NAWAPAIYPEn3qMtZws5x309ojWFQSeN+hOP/h5QP5WYH8Z5DsvdeHxZu
         5BaXXWwKDGDxuSU5enGwKmTX6J3XBiSF/UEY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113973; x=1770718773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PneNM+LL4PY1N7lo+BrLmYDP0Iy/01guJ5KbRiE5Zbk=;
        b=EA8YGadx2OsYh27R1p5JRyhC1Ud+LtoYLUcb4+VC/hqNdE7OvYLAm1OjkBptVfNj/x
         J/gMoWQq4nODoMwx5YwwqdXQ5RjkCqGYDY4nMZwhtBYrKBQWFufm2e3N9AmxBw308tFk
         reEz8NaoyQ9gEGf7nLO72bFgJxAfGDyje9Bu5rBLwNWdXI6X38YLY9xp1cjDd+bILtWZ
         Lqd52jFdBNhpAwLb0v5V0yHaB7MX1+qplfU7ywoAV/NovP7lKnE+JVaUT/FhqnEoB6Ms
         +2XRG8xNafjEqD49fG2S77AISTrW1JPt8kslZ3XbLduJLND9jaIViPsrixOCRLSt9Slk
         3sJA==
X-Gm-Message-State: AOJu0Yw//Zw9kFGfBIOferWDL5iwjyIITJZdOzNd/VuhhkZVVdixKjXS
	1eWCxTpq4iZxZBjUWnJeLQkzbEtIPpjbO/YGdiWd6oBorclNEqi40gRXnSDuXb/qFbrj8yXXTvX
	/Rke/Oc8=
X-Gm-Gg: AZuq6aKJWMqhQ/LCXDPujxdQgt+K+pASFvhh6l7wd9PjJbqJfFEWUuu1R4tIt5euiDm
	taMWN0nnVL50+1Oxc1rWLiwVGZC2lSwnGXuPtRvMvZQK3GfaY+SsZpsOSJInWJ15KDrTSjvOSae
	Nu0LkB4XyNg4ig3bTmt4J/7l2l62qH0qkq+54I00n6U8YytY21TtKB7Wy/jnHJhiwMJGEddC/kC
	U4+d2R1nxmls2d/dfa7ZRiSSPjevpC2WcBaQWxahILLE370mtyWKY24P3QI12XyF/Da7QG0h4mo
	PYDNhuxC0jKYTC4VBEQ7FgcBPT9o9CuIrhqqqRVGHmsAuPtnCbEFzuTrtNOC4JvtX8hpxpA7FEX
	qgemy+wM1iALIs0DTPl18oxtvVYnOaBso5nYpyFlO7e8u4EnZHZuuPDaKNhXogH9D48zZDMCnGI
	k6Pfshf2opVwGDtQUkhL1KJzi/+8k2wCUkau8/zBUpjXl3bjnFvNwFzeUII37g+rj+75UpfVQ/1
	gJxmQ6jJQo9/Sw=
X-Received: by 2002:adf:fdcc:0:b0:435:faa5:c15e with SMTP id ffacd0b85a97d-435faa5c20fmr12416438f8f.30.1770113972930;
        Tue, 03 Feb 2026 02:19:32 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 16/22] glib-2.0: patch CVE-2026-0988
Date: Tue,  3 Feb 2026 11:16:45 +0100
Message-ID: <baeecbe9e9a1c20c03896f44f604e08b913bcb2e.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230444

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from [2] linked from [1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3851
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4944

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 0316decd300839be34b384381a6de7fa3e68f8e0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/files/CVE-2026-0988.patch        | 58 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
new file mode 100644
index 00000000000..daf86224d5d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index bd87d9c601b..2e15cc7675b 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -231,6 +231,7 @@ SRC_URI += "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

