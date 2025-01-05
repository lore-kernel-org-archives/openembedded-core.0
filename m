Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99100E77198
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:44:21 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.33636.1736055851540284460
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fHqdoVlG;
 spf=pass (domain: mvista.com, ip: 209.85.166.175, mailfrom: vanusuri@mvista.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3a813899384so52031135ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055850; x=1736660650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb572NG620zK6v5Hp2yg/SQ6RWT6RKNU+bWl67Lwzd8=;
        b=fHqdoVlG/25ZRJ4jLAZZYnauIFu4BYwheJPctW3KCFFnRvjN6iZ5hAhPx94u8aAuRu
         z1p05Gmm3/GdllHFBKHTj4hqA7/5jtQPbSmq+prE+nfQzT9MxikisivIWzUXusMaqMeA
         gdt3ThIn5bndy4TPcx24ersUwPlDqvw6kEva8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055850; x=1736660650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eb572NG620zK6v5Hp2yg/SQ6RWT6RKNU+bWl67Lwzd8=;
        b=uHxWw6kwQo4WDkoMzvELVOIpPvw1KFBBdeqHnPcBUh+ju7vPlt0W3aZE02qQ1fkTN3
         sXt9f/G1RtHECBFJlOj7oRto3XpM1Nm0h7w0P7OoR7a8ANQXRBa4cW6/rBgYnplWXsdS
         TKqJshE0jFeUCCFBY/0WlEFzdLQY6L/2KXckcT1rOkoNiV2e3pro8Q5TYZpuv7urUTzZ
         jQIjNz64siGEiQXQ4zPzUk902jiVSKdyjKJ4uU/+8+K79VXvXtYR4DqcKdMzIFgi8jZJ
         TD9J9eFA5oQl2BxOkNovupfpnM60wZat7kOEtrT06aFGQKuBswkbRWmtibwsD72zhKGJ
         tBBg==
X-Gm-Message-State: AOJu0YxxmZmd2RgbrBhk/SH3QznptFzH1CmiXMPVSj1sCtiq30NKeDyo
	YhSug3hY1rV+RSgQ4ygF+engRTK5WKP641GoqLzxSMtAr7yxL/SEdi89Ua5dwXIjB80i/AXgDZg
	QnRA=
X-Gm-Gg: ASbGncvXLI8K0Un6ckQZSwKa6+Qeu61tDrBZPKSLFGwNC1UGAq/tS2UAYHA4WXvgxd7
	EnA+GyPRmwJCai3mxEQmqSM1FnuRk+Pg7r9OeFUnL5ThYgi82+dRISsH3I/ylXFxc9FHnqnG6Za
	y5bfT95N48HrzAc/FhgopdkD95zNWdowF373X9HmuNcuMmxM6yWLuEnYFWrcDhWSGjU+ErvFK8s
	f71BlIsVVMujc2fejXflpFlYUwiXkMg4JwvpDf51MUGPK6c3kp+gfU4Dmy0uUR4b8dLzUU=
X-Google-Smtp-Source: AGHT+IHXW98IlxK2kuOwVsMTZpzLMhKK0AkGmMWUCpLUNJL27BCEKbSsg7ql/cpWT/2J3PYm+6vFLQ==
X-Received: by 2002:a05:6e02:1d0d:b0:3a7:e286:a56b with SMTP id e9e14a558f8ab-3c2d1aa30d8mr407739765ab.5.1736055850319;
        Sat, 04 Jan 2025 21:44:10 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:44:09 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 7/9] gstreamer1.0-plugins-good: Fix CVE-2024-47613
Date: Sun,  5 Jan 2025 11:13:16 +0530
Message-Id: <20250105054318.222154-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209412

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8041

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


