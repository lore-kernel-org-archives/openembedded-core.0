Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12DDE77188
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.18130.1735998126887657503
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fM4aUjHl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166f1e589cso223692965ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998126; x=1736602926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcVrwhQMqkyw0gRpz3Hr2WFykpARnGeW5m7r7BFUlPo=;
        b=fM4aUjHlXmuJ6PvzQwBPQRmdTX6qdX1roIlDGaproszDFrgfxcggl19RV2i2tKbetn
         H7QdQWBC5oQzP+mwndR6LI6K3uQYOoZeNt4+m5qU4bkm+1kN9Xs1XqCEV5xllM+LQKHP
         8BYjespB28c24ykXtsHNJpkulho89x6j7vP4Hq3zTO08j0YGR2BalwAEUgaGiTJTdTJe
         DIip59zwJq3vgp4ACeCF103n1ppR0WxQ+HM5I97n2upAg9g37BCKW/QhOCb4J47hpzkS
         BP9x7BwR/z6of903+8BRXwJIhWln1LGTCyY9hXUEIL120fn5O7sWh9UZ79OIwTdoW9SW
         79CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998126; x=1736602926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcVrwhQMqkyw0gRpz3Hr2WFykpARnGeW5m7r7BFUlPo=;
        b=W1FO0XUavt1mCVVbRrC6e4LHzu0bDDoyG1fNZCQsIx4dgwIDGy/54CrJy9PgVjFHrt
         vCw0LNjR5kI1vFnKkwX/z1LzH9STs/ZyNltliAyp71/SBsGGFWNz4awes+3fM0T3uf+d
         NTYiyKmWx/Ri6EVVfp+vvoUSPypsehPPRcmIEkMdoSF6X8Sxih0ifZkzbx980urDiTBX
         Bx+clgUfUslPykenxf6vmG3g3xOaKtkRhgGg7S6rk/CGWFqKTQB8fJPmVaeQ3tzlgw1h
         uWKcZU1uAd9zkec8znvMrs5wLFt70TbB+BqQqp27OdYyNZlDmiieNYKj2bFdoUZshbeX
         ycDA==
X-Gm-Message-State: AOJu0YyzsCpfUbnTnkds0X7SeO/c4yK12HeKNNidStZtJlqFU48qi+fm
	3MjuHKqi74Tfp8DmplcvcmEeyXNT+DmYjtNYp3dOqQ6xoYWuV+OVQGrSttFSBSnRXVU8jovp0Rs
	f
X-Gm-Gg: ASbGncvu7ivE4Uf2mDgkXRX/1h/V9CtSQglBqDrRmKA45eY+JNVmtPiaOpc1YuA1FYA
	jJPgbvER/nqvxFZwQUWf0oSaoiCJs2a0LUHu+YBxIzqKUjoLCoPH7LHPXaacu85rGmOXkBokLHa
	gKQo37+aglhJsm52SEH5syNpIG0TuAgCcwV45EK8kpv+/5fwLac8shFXP9r77Q6HJ+EnV/nJrDb
	EraCVrTxefc0RPXNLD9nBckYrQuGoXvJ2xWR0+vGtAOSQ==
X-Google-Smtp-Source: AGHT+IFvKDRCPrMclDwXx63NY8M3dOQJQ+UCtisv4VDV4w4OoY1QqMPZivuKGWSssRIcfG081f+1ag==
X-Received: by 2002:a05:6a00:4098:b0:725:c8ea:b30a with SMTP id d2e1a72fcca58-72abde2ab0emr75754713b3a.14.1735998126007;
        Sat, 04 Jan 2025 05:42:06 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/25] gstreamer1.0-plugins-good: patch CVE-2024-47613
Date: Sat,  4 Jan 2025 05:41:29 -0800
Message-ID: <6236088fc43f7d2e8a01bb6e3937969ced8a7f6d.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209374

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ck-if-initializing-the-video-info-ac.patch | 53 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.22.12.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
new file mode 100644
index 0000000000..502b26f9d5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
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
+CVE: CVE-2024-47613
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1d1c9d63be51d85f9b80f0c227d4b3469fee2534]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/gdk_pixbuf/gstgdkpixbufdec.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ext/gdk_pixbuf/gstgdkpixbufdec.c b/ext/gdk_pixbuf/gstgdkpixbufdec.c
+index 5482998c0d..de5f054964 100644
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
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
index 94c34cf908..ca26290340 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.22.12.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0011-qtdemux-Actually-handle-errors-returns-from-various-.patch \
            file://0012-qtdemux-Check-for-invalid-atom-length-when-extractin.patch \
            file://0013-qtdemux-Add-size-check-for-parsing-SMI-SEQH-atom.patch \
+           file://0014-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch \
           "
 
 SRC_URI[sha256sum] = "9c1913f981900bd8867182639b20907b28ed78ef7a222cfbf2d8ba9dab992fa7"
-- 
2.43.0


