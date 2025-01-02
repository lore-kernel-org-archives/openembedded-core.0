Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39432E77194
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 13:34:09 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web10.8091.1735824842925770536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 05:34:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QnGxZmc8;
 spf=pass (domain: mvista.com, ip: 209.85.166.47, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-8442ec2adc7so420273939f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 05:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735824842; x=1736429642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16QIwKogNRouynofyfKMQI8sIaKB5QxlrNt1MPGhdJI=;
        b=QnGxZmc8uP57yeS5O200rmQymPilIFWnNuD/tFA9gqrojxIPSOlQSBkvNlsoz+xhu2
         q6VIQVm8z9KurCs+qc45X762V7b8tlV2XE4JWLLL9JpWAOUhamIpWLGFUAazjcdGW4LW
         8aniMrj4E4wFbtdaUTvEwr+IXSsZbLAHHpN+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824842; x=1736429642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16QIwKogNRouynofyfKMQI8sIaKB5QxlrNt1MPGhdJI=;
        b=rcGoerf6KJmZwc+plBwzuB0EKsCExQDStgPdfXmyFVgv4RQJGeoeOiQeSlCoDqq3FA
         xPavPgJB5LqHwCxMUJnRxoyWf7qr6UvEWTK6z9xB40sLfp5tspQdBiJtaNN2CMT1BwOZ
         3CFInWSW8Z7/FeTxpfX4Ema1cjof/NwJKphxJDYUr+bwtNkX/OeSQl7JZOAvZbEYuaAB
         XaAnWMej6jZwvTdFKQRRZn0VgU9YlByFQ8R2HdauiT3uDDxCvmSkIkwaVtJh7BN+JVAQ
         yTsAIEW3q7c6IfEhh1wJyI3FBi83B9Np/kWtxJlsZIbI7FDN7gAoCVzxU4g302FBa3lC
         QRbA==
X-Gm-Message-State: AOJu0YyO4+inMcbIseRWFnXngtyJ7JKHuit4YO5QbMARmPEtfek2oHvx
	XQUAchN1QqllJeC0nDXbRCD09MEw7oydD6edAXBK5vtB/mg1SKD/QCQm6QeWWk+9/9Hscsd1ziG
	HbPo=
X-Gm-Gg: ASbGncsARKKj0H4aeosxpx719SRsg/yPtZtnAYCHfdJas/pARfOwY5VpxN+80PHeU+T
	7ihSjRnfNzSv2TqzJnoR0CLPRpwU94Sc/mFSX/C3Etx/omg5B8GnpvySO92Latx0N0bFsR6PzIx
	wLAXTELwxUmxehlMCRE9GHDewLBQWESHTwbBnMI+BnA94kECHS6hWkJmmWdqsDR8iSveJiRBGSP
	WUsOMaw56zVOmm/oqEqypA3ipcHlO4ldHVVfCxWPnNOCNkBZQAXBPLBG3fmLb+4cJwVBo0=
X-Google-Smtp-Source: AGHT+IHMLYJK/gL/QQXqyYbJFsy6DPwJkQwOL5O1xy+/yjbPwVSK3zrsSBCbxEisXoeyS7qSSVTr3Q==
X-Received: by 2002:a05:6602:1490:b0:844:debf:24dc with SMTP id ca18e2360f4ac-8499e4c7bf9mr3857033939f.5.1735824841732;
        Thu, 02 Jan 2025 05:34:01 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:79d6:d2bf:f7c6:a6fe:8968])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8aa81bsm685493139f.36.2025.01.02.05.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 05:33:59 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 5/7] gstreamer1.0-plugins-good: Fix CVE-2024-47613
Date: Thu,  2 Jan 2025 19:03:16 +0530
Message-Id: <20250102133318.642859-5-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102133318.642859-1-vanusuri@mvista.com>
References: <20250102133318.642859-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 13:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209307

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...ck-if-initializing-the-video-info-ac.patch | 53 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
new file mode 100644
index 0000000000..d60086deb4
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch
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
index 8b9354aec2..bb85f4d2e9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
+           file://0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


