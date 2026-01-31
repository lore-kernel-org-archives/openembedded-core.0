Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831C9D79756
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 07:57:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5110.1769846228500065441
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 23:57:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OJFOZAFf;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48068127f00so23871675e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 23:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846227; x=1770451027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PneNM+LL4PY1N7lo+BrLmYDP0Iy/01guJ5KbRiE5Zbk=;
        b=OJFOZAFf3RTee/ry/IdPY/R+qiaiJaSiYZfvn+oP43fHM8WPwVojU9drDwr5ZcfjVR
         IB5Ue6JS4JCO7WhUNgS0WMEcjoxVNtGUilXdi2Y3TBO69l+GOTCrxLVv9Yru2X5VPlB9
         XACvj8FRychFhY0DgcG2W+QL66R9XYSeVz9rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846227; x=1770451027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PneNM+LL4PY1N7lo+BrLmYDP0Iy/01guJ5KbRiE5Zbk=;
        b=YeTv68BgZC5Vm0YJPmfnH0b8WKEsVzyaKPWre3mt5ZcPZVuT7ZAQlEiV0pY4hbOl92
         vAkceHWX8fLKk9tc6at2GTM9jV5nh3LQVWX+TSNeAawB85KfndZaPSTL0214rCExu56o
         FGNEKK7tjABj7lGVuYIhac50Qp/VKKvf+JoB56Ib7R5SmoavJIrh58oGMVwYR7JvK+bm
         2RvZ7CsKq6O+8lFP/uUYS950cBNGgMNal3aqvQn/v6snFWOG6LnBouWTt9K9LsD2YQrs
         ARLv80FcGXiyQBqcYofnPyzo6RP5zQdh8vtThqdM7jwpHO6C5WBAubbBg5WSPrNgJASK
         L+dQ==
X-Gm-Message-State: AOJu0YyqYJbIVSARDOyzWBa4Jx1csXAehtd4fzNGhc8PH6Dbia2eb1M7
	4WqxM/tymFDnF77pq5xp3UPmFh5RY4QEg0tuoavZvr/jXFvQ2jnblIi6sjDU/mC9ZC2yJ/PINU/
	FS3z/IYQ=
X-Gm-Gg: AZuq6aL2Pvry58jtOwbX7Nj5OdELvNG7M1uba76i/+JL8/KuUP3EN2sVIBPEF7bUXCP
	nzgIy1OS98xT0pnM2OKlF+CqoYZS4xz9YHOxMzmFT2rHD2NU+HjmWxGt+JhkQLuTddj8UU1OInn
	QT1s4gpeoeOe2KUAvLx9PHV2H1wlifP65Euynh5HwdahtBmDOiByP2ge9L6Z7g8AtWqljyjfQcx
	GScKQbI5kfPDf3KQ3HOKOnlov/Wgf6mWZ0iKvt/8FVsaCYwfwenCnT5VBKH2QEKuseMATobLUfe
	lSIVjdirOJo19qeyD4ElVnKKfxkpIvkmMCD9IJcbsdLVW9+PM3PItz/i2Ud5yw+q4eLiytUtmmc
	S1A84m23pTfLE+5qRWFMmZYav3bBv5XSKfcH4jMCzlHFZuVtAQS9HIipI9EioMJeH+PCzyb2pdy
	GgmEXmITxhs8ZqI5aE7SBOvP/RllnWj6cVzesZU4RDMRvKqPu/Txgf+G8pMwbY904vTnvFierxf
	8NI55YalWT5H90y
X-Received: by 2002:a05:600c:8b27:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-482db4997c7mr60050155e9.26.1769846226561;
        Fri, 30 Jan 2026 23:57:06 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fa8b238ae1dd6dd8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fa8b:238a:e1dd:6dd8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce564f9sm258621475e9.14.2026.01.30.23.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 23:57:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 18/22] glib-2.0: patch CVE-2026-0988
Date: Sat, 31 Jan 2026 08:56:29 +0100
Message-ID: <8bd91211061d1fe5e7a8c9f76faa7d12c4f945af.1769845858.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
References: <cover.1769845858.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 07:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230223

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

