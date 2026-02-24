Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B83EF357B3
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:21 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21474.1771943114171275075
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mNI8KWC8;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48375f10628so36299445e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943112; x=1772547912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zAJow1dDUervvLrITnJadptjHAhPPt9rRR6zq6vSw5M=;
        b=mNI8KWC8g+hAK7Jq+fhItmT2AHKXpal5V3u19XCCVTRMeY59J7fOq5edaEPbMacn00
         cWXkbWNt7B5RNqEcM/AYSou7tnfH2gw6F7/U6DcQ9Wntzhk23CxltV0ognttssRGpqBQ
         cFsRvimJaz5Aml8QX3xMiOMI13Shu8JQ5BfKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943112; x=1772547912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zAJow1dDUervvLrITnJadptjHAhPPt9rRR6zq6vSw5M=;
        b=s3BHw3feVxKTWAZvF1L1j0KlyU2inZN7BVOGOVYZI37b7/48nuIuxK+NcIn1/7R5/z
         /72OKnpOSvr2T/3qjDQ7CMk7HP2uV+ZdREy5bST49sfk6P0kuPZ8fWUzZXy9gFuDWTvY
         sWDQ8XixWHkz0kKMtmA30xupPOgM6E7nEhxPvr9/SOrKfvB5nsQbBUN3UudWwlJ0RIKJ
         utizvIR96OyD4zfRpFIe8chztQOyaU02HD6gDaHMmgEcF7yjwKXa2CtAk44yu3K6+6sE
         dIb2XN21AUyDzgw56m1tJQqcFmPA7+H+ddm5tNw1W0g+IbpKBUk01TBy0WjwAwVDDSTs
         xGPw==
X-Gm-Message-State: AOJu0YwFzFDWLtdLKCbjnbFV84oOjV7MNXdboIA2CLXHDQqwiOVpvutL
	nbeQStDr3RaO43GHFBuohFbgdJODouU2je5EQ5jHOXdKgYaEwkftqjY5na4auTsTb+2bJcMwSz0
	G2X07
X-Gm-Gg: AZuq6aLDy+6givxp7RVTV8gKMx1g/WSA9SrrtbErNjPQFwDyFPXIYMt4eIkpuhxIRPl
	WO1J1RFDvUCIcEbLSpaVq6dEEqraxzlYRB/UrnBipw2o9mZAdfRQM+rQpdOMSnwSdDXpXnZrulA
	c9KdHbPButKmUc74NrhvIxoC78NjEQ6QUiJpxTOYrDxK6CB9UYaSJuJgQOwNJCyesWW2UnavfXB
	ivQ7qGPBBuFn/48kzgi7aZoxQ1cVkvND4RwMytRnw2T4EDuoOia4k6zb6EOG+sUqQ3iUhmRTIF+
	LpEcYpr5h1lzncEUVm3HyGjimljzpoeGblCIdh1g7447uHKh46YVfdaLE3BLtdSkyVHs5q8cfDq
	v/qgkJ6c8zJ8Zp07TGx6vdXyifz2zDBN7i0o9Pe7vLpYNJKrhQp6FF1DeRbB/t02YbXQNVOYg2a
	L/kWwsoDO8ZY51ASUCumg/7rAE3IkREE1Gupojx7kGvdtZk/5TP+2axe0ysp5nbGwawLgetHXGa
	HWb7WWy3uzhdrDxib6/LdSjFJcW60l9KIqn7/aej02/
X-Received: by 2002:a05:600c:3e10:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-483a95bd836mr218382725e9.11.1771943112253;
        Tue, 24 Feb 2026 06:25:12 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:11 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/38] glib-2.0: patch CVE-2026-0988
Date: Tue, 24 Feb 2026 15:24:14 +0100
Message-ID: <b9705a69ea91ee7e51a9c9402fd6a0742d587326.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231788

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from [2] linked from [1].

[1] https://gitlab.gnome.org/GNOME/glib/-/issues/3851
[2] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4944

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     | 58 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
new file mode 100644
index 00000000000..1cdc3735edf
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
index 50701be3d03..7c0ed01f555 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -70,6 +70,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
            file://CVE-2025-14512.patch \
+           file://CVE-2026-0988.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

