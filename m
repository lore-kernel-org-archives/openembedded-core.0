Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1279E78D78
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43985.1770629364105654069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2OdzVDo5;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43638a3330dso1182395f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629362; x=1771234162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kC0f1o6y5qYzMJoQmiV4crFawuF7AW4/wgODRj8Rfv4=;
        b=2OdzVDo5cSR/PAFOiZA0RAKBC0687g17bUQjF69AL2WeMk4HkylVePIlfapk4tyGcs
         zWCLXkIrOiuovgPnKm7LsANDdSRQE/ELcQfC6c3APYyYNCrQhhDwQdXiHUvdj8vxgMV2
         C/fTA2yErnK782cTtT2zKpbJNp1PZMqLNb7t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629362; x=1771234162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kC0f1o6y5qYzMJoQmiV4crFawuF7AW4/wgODRj8Rfv4=;
        b=qfyfn6cQE5uEy1R73U5sewqG+cUjI4ufRkSZytaLQbS8K24e5dNuU/uJ7HKvQ7/Dp5
         DepAGvoR+kAKX4JID/NzXWmlEx8ev4SkE37/ju+lOC5oT367YONnIFSyyRaY+39pnlq2
         QxVTWMcULsqvt7gqfkkn8n27PjO2EpA4XI+CVLQLMM+f12PyQzqskSLxozpMS4svi0+g
         Cuehcu9DoEbQRNRjnRKyrTN6jSdaqloqpzhZhc4clodb3+YdKZCRtZVRJ4F2tAHBMoqN
         FvMzrHWCQ4tQmKtsRPKU4kJS0vVxNYOtorg/Vox6cfyP4CLZulod6WsRg8ttRefs4O6p
         7OoA==
X-Gm-Message-State: AOJu0Yzyefy5AYkM54alkbxb8+odyvjSCjBicqGA9/w8daMCA01aeTXD
	REY9S1rfIdIH+Et8u1rPEJbLUrrdIVpTKaYLr8CpYNojnROjnKC+zd7ZmGa5cONdnsznRmQDUtI
	lCVaQMA8=
X-Gm-Gg: AZuq6aLidqL4bI6MwgG2ahquDxaQVtIMcFmhGPe3hIaTztnz01yheAiwvre/BJSLPhC
	ytB5lL7AVkK0jTfxj5QM2vvopCyYQRr19GqYyTX5x7HY1Kdlp0Pbv4Qzrn1kQzGKZlo5SmpojUe
	mCpK0gt29HjeJ6XY5N8nUqDnVhJqdIH+3mSNC/YVlEEtMBpGTqCxyOROWTlu74oMXzXizTbp56h
	X0xazo2H4A8Hfybq/dOIo3f/n+Gb2qoLO4y3xDquByMvS+JawYp+MvUVfqOcVCZY7eSmMqV2Ge0
	VQnLIDdAiSBKAZoo6DpYvV/KNdonNTKB7ffpqEGzvTIi2uq2JAuPr5Uu+taOwQiJgSqWRsEK263
	JfC3iEN5hT02uxqzQh5Lv1Psc0sDeWjQkQx8hXLzA8YWsMFa+nH9sxlzJagRWe/K7G2sk7AJ7v1
	K1w1a5K1zthGwVrutOyCClO+nAcKl5sHYTVxc1rlNc1z6Q9PvIxQIbCJBkWvyGP1bEAppGFcn3Q
	YKMCLIZyMc06ZoTkVuQXlEo+g==
X-Received: by 2002:a05:6000:2411:b0:435:a4a9:6f79 with SMTP id ffacd0b85a97d-4362933bef4mr14301341f8f.8.1770629362181;
        Mon, 09 Feb 2026 01:29:22 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:21 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/25] glib-2.0: patch CVE-2026-0988
Date: Mon,  9 Feb 2026 10:28:48 +0100
Message-ID: <266cd9b505f0da7655a0270adfea1e1f276dbce7.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230756

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from [2] linked from [1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3851
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4944

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index c7e18c7bc41..97618d1d40b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -39,6 +39,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

