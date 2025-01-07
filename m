Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F3DE7719B
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:03 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.92.1736273336886841226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iPjXGrJI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166022c5caso207777535ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273336; x=1736878136; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rHI/fqvyL1pEegyyTmiOaQx9hhJoYj/z8r/QORDmHGs=;
        b=iPjXGrJIpUF3Rkmm7L1rlQXUPk60xc/LqJvdatWK4bZi9ZKVosvl9QrGwsWhgVxwhL
         jUnxIeR1VbwAYa8s7umAfIbbIDOpvk9/YCHjre5KgRR2AeF/KKE37GDa0ep4G0n2T+uO
         9yXuC9wEAE+yuaQUAfah5Oy87CrC9nceoBfgNDM0XE1PXgxkblj6SdMzJhfJyCovCKWG
         0+0eRzBVd/worXTNfL10VHiKOZQ/WiEH7IzeasMe8QHf3lCBUZDwXQ5nNm66yqtiFOd3
         YTVsl+rQhOYD+bVrl0sijnCxiOMimCOKqYaEUVd9F9ZW8QSoXJFW1TG4dt8H3J37WR2J
         +Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273336; x=1736878136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHI/fqvyL1pEegyyTmiOaQx9hhJoYj/z8r/QORDmHGs=;
        b=NagREO2UNg8KZ4uxbx1aHx8Vwxfl41Ij4LjD1pGAv/de/xOluIoHWUTVw3ydiBL5Zv
         M+t3UOarM+QX/HCjdo3h15zJBi4VzRqBB5cVhG484/Nrm3ExQzuMz3mu0BngE34SNcFR
         P9rJmVgkSclln/Bb8Npz5z3ufIw/r6H2S0GnxiT1p35rNNJvQtPtlMKQao/laV+TR+xG
         ZFYaIw6nfOrpkos5e5fRZ3iT+fF0sQiuD+G9yEWPXoHmdAh3J/GY8+bdZGfVT2lLOb6n
         8JNYmIBtP7lVozYNSHstJUcpRi+/Afy50vKPszlhCnbKkcWmQtlevMCCgqnlm2vOPUY2
         wr1g==
X-Gm-Message-State: AOJu0YyPWXBJuNaum/znmanxMGZs0eif/mpGHhBqWXMs+ywiYTm4x/02
	8HH3L+vcEtzKG9btKlqw1Q67q9VLCpX8KIQoM4w1StTgE7xWrHuwYS/hi1zwqlBTA/m1hNr9t4F
	Ee20=
X-Gm-Gg: ASbGncuzJcIWm822EIWm0IL6tqOvEKL9GPo7dJsA3cyiUI0CO+EfmvAd1zpWj2qo1og
	e9dwSSP3IX335HghceP5w9qh4GoISGoGS0ncaHZSxGBJOVLZRmLTfixCG5KUGWOSmid0bq8rBWk
	UGLuOc0hbK/rpzTJ9t88AxTftOuOdLQHjvf+sGt3ICPfd4Ugb2JxCKdI2NOJqTDC1S8alTY1/IN
	lFeW6sAoPUh1SwJWocSKtavPf16qjtHi78wmCW6An0HlQ==
X-Google-Smtp-Source: AGHT+IExh6NIWixhOTGAQZXvvErZ1YPVlF/Mw311i20/jUsmD8PElGeqLB227K62djVEfXPStBNU/A==
X-Received: by 2002:a17:902:f54b:b0:216:386e:dbf with SMTP id d9443c01a7336-21a83f5514cmr101105ad.20.1736273336117;
        Tue, 07 Jan 2025 10:08:56 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/19] gstreamer1.0-plugins-good: Fix CVE-2024-47613
Date: Tue,  7 Jan 2025 10:08:25 -0800
Message-ID: <ffabed7c5cbfa1109e43390a4d36b38323cb7425.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209488

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47613.patch                      | 53 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47613.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47613.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47613.patch
new file mode 100644
index 0000000000..d60086deb4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47613.patch
@@ -0,0 +1,53 @@
+From 1d1c9d63be51d85f9b80f0c227d4b3469fee2534 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Wed, 2 Oct 2024 14:44:21 +0300
+Subject: [PATCH] gdkpixbufdec: Check if initializing the video info actually
+ succeeded
+
+Otherwise a 0-byte buffer would be allocated, which gives NULL memory when
+mapped.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-118
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3876
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1d1c9d63be51d85f9b80f0c227d4b3469fee2534]
+CVE: CVE-2024-47613
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ .../gst-plugins-good/ext/gdk_pixbuf/gstgdkpixbufdec.c    | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/subprojects/gst-plugins-good/ext/gdk_pixbuf/gstgdkpixbufdec.c b/subprojects/gst-plugins-good/ext/gdk_pixbuf/gstgdkpixbufdec.c
+index 5482998c0d60..de5f05496466 100644
+--- a/ext/gdk_pixbuf/gstgdkpixbufdec.c
++++ b/ext/gdk_pixbuf/gstgdkpixbufdec.c
+@@ -322,7 +322,8 @@ gst_gdk_pixbuf_dec_flush (GstGdkPixbufDec * filter)
+ 
+ 
+     gst_video_info_init (&info);
+-    gst_video_info_set_format (&info, fmt, width, height);
++    if (!gst_video_info_set_format (&info, fmt, width, height))
++      goto format_not_supported;
+     info.fps_n = filter->in_fps_n;
+     info.fps_d = filter->in_fps_d;
+     caps = gst_video_info_to_caps (&info);
+@@ -384,6 +385,12 @@ channels_not_supported:
+         ("%d channels not supported", n_channels));
+     return GST_FLOW_ERROR;
+   }
++format_not_supported:
++  {
++    GST_ELEMENT_ERROR (filter, STREAM, DECODE, (NULL),
++        ("%d channels with %dx%d not supported", n_channels, width, height));
++    return GST_FLOW_ERROR;
++  }
+ no_buffer:
+   {
+     GST_DEBUG ("Failed to create outbuffer - %s", gst_flow_get_name (ret));
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index ab14dea58d..828b5f1083 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47540_47601_47602_47603_47834-6.patch \
            file://CVE-2024-47540_47601_47602_47603_47834-7.patch \
            file://CVE-2024-47606.patch \
+           file://CVE-2024-47613.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.43.0


