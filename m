Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F326CE7AE0
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.6171.1695869339447928644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sgSENH/W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68fdcc37827so10098478b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869338; x=1696474138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VgWMIG1vVhdJabW2WwJuBFB410gaaCitM8vzNJBI7n0=;
        b=sgSENH/WY7dUxhwpkGpw+AvUH+AloYV7rbgaC9bpB6wtN5vd8xGGIQfZCwQ1ix9PvO
         c34PJPXCfB37NdF8kdAt4YVXY7MQ4yyxMSFbhYM9jkWn5Cd0hhbWdc6brN6AgdQlhvMS
         Pco0WbKFE7M940/Wih+FLyym2XFOZHNBap0hmOAJ1bPRzdvCQ54HRA1JreRzRvv5oZ+O
         b/Niq0HWGkt+PIlgnaCC4wcm3sq1P39Epk+HOQRZ1iYYsXEHhl2nMErMQU88dLnFE4IS
         lZYbZni1oQobJTJBiy0A52sO9D9Qaz8Dwa6jjjN3qtCuFlpTfCKlAduRJNpaLDJiYDe3
         6koQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869338; x=1696474138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VgWMIG1vVhdJabW2WwJuBFB410gaaCitM8vzNJBI7n0=;
        b=mykYbN4Hex8va2Jof/8fzLHL7du1gXbTXI/NYpskZi94MPVKBairno6FSU4nUpIOBA
         7On2N1gqDIh3kuYRJwWREHYiVOZRvi0k2SpJhpJyaRFkl9Nd5vOmlzm7YLahBHIOOFim
         je8cJJxCiycpChmkBOgPDF1xdmh4BVAk8GQvexoHwf0v5/+kuniq5k9tYtxPeTUmeN+1
         X/k5KpyCw1n8O7LYlVrXdupR72WHnZHUbkdK7ZpQUWSfUSn93f3/C3Xv19c3X+h+GRig
         b+GQjzRt0zUlv+z8RHnHZchzdZdfuuRmp4snJFLYvaH/lWMtuiKyFzmcpc0ZYmL7ltaE
         e4Lg==
X-Gm-Message-State: AOJu0YxdVm3GagOHurmJiAagZNJJ92hOiP60L/EcmWdZ/79oyq7PjTH9
	ypGP8w5XNETbVO9W31H8rPjeUOQnNHXjvBXWWQw=
X-Google-Smtp-Source: AGHT+IFY0cQvBDsCxxJzuY2knDf/6B43K7gyOUPT52Z6srry89Cxo6Ng6FqoRQqWZDUvLNFUPQsOmA==
X-Received: by 2002:a05:6a20:4413:b0:140:61f8:53f6 with SMTP id ce19-20020a056a20441300b0014061f853f6mr6924105pzb.29.1695869338463;
        Wed, 27 Sep 2023 19:48:58 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/17] gstreamer1.0-plugins-bad: fix CVE-2023-40475
Date: Wed, 27 Sep 2023 16:48:33 -1000
Message-Id: <e5b5f7118320eecd77a6501a90d9cc73c578babc.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188354

From: Archana Polampalli <archana.polampalli@windriver.com>

gst-plugins-bad: Integer overflow leading to heap overwrite in MXF file handling with AES3 audio

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-40475.patch                      | 49 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch
new file mode 100644
index 0000000000..ab9ac7afaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40475.patch
@@ -0,0 +1,49 @@
+From 72742dee30cce7bf909639f82de119871566ce39 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 10 Aug 2023 15:47:03 +0300
+Subject: [PATCH] mxfdemux: Check number of channels for AES3 audio
+
+Only up to 8 channels are allowed and using a higher number would cause
+integer overflows when copying the data, and lead to out of bound
+writes.
+
+Also check that each buffer is at least 4 bytes long to avoid another
+overflow.
+
+Fixes ZDI-CAN-21661, CVE-2023-40475
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2897
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5362>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/72742dee30cce7bf909639f82de119871566ce39]
+CVE: CVE-2023-40475
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/mxf/mxfd10.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gst/mxf/mxfd10.c b/gst/mxf/mxfd10.c
+index 03854d9303..0ad0d2d283 100644
+--- a/gst/mxf/mxfd10.c
++++ b/gst/mxf/mxfd10.c
+@@ -101,7 +101,7 @@ mxf_d10_sound_handle_essence_element (const MXFUL * key, GstBuffer * buffer,
+   gst_buffer_map (buffer, &map, GST_MAP_READ);
+
+   /* Now transform raw AES3 into raw audio, see SMPTE 331M */
+-  if ((map.size - 4) % 32 != 0) {
++  if (map.size < 4 || (map.size - 4) % 32 != 0) {
+     gst_buffer_unmap (buffer, &map);
+     GST_ERROR ("Invalid D10 sound essence buffer size");
+     return GST_FLOW_ERROR;
+@@ -201,6 +201,7 @@ mxf_d10_create_caps (MXFMetadataTimelineTrack * track, GstTagList ** tags,
+     GstAudioFormat audio_format;
+
+     if (s->channel_count == 0 ||
++        s->channel_count > 8 ||
+         s->quantization_bits == 0 ||
+         s->audio_sampling_rate.n == 0 || s->audio_sampling_rate.d == 0) {
+       GST_ERROR ("Invalid descriptor");
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 52acb30d74..d5f1e794cd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://CVE-2023-40474.patch \
+           file://CVE-2023-40475.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


