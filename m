Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0616C25B7B
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.58754.1715602704735923880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GrgOjjgl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1ee5235f5c9so32197805ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602704; x=1716207504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fC7C5vXMLOZCTLnWgeWGYPywrTNk/ZsS+y27pcllK0I=;
        b=GrgOjjglGUpQ0OmeJ2WLSLbG+8JN2bUAdoY4iEzaKeUc27BdgkBqkctq5YiRyQh661
         2q/wf0MVqi+zIB+Ely+x6AoMH95oqBdkEU+DngtXKFNLMF0jm17XB0lyHD50xaPIoL6W
         cArl87HhXHFJ3uWEGjOkAqBc/GkS3Bp6IqciOBvcXNj3z4pPlAjQG52Avou/f8q/HxSB
         GWtvzuZUEuZ8JZHdCiXHn9+BRgxr7d93R3x6z1jHZi3AlSv5MaKJyDUFT1sQI9ApoxEj
         E3vKU/qRhp2O5ijkab4+0PjztktT3kEALGGG5BcoP5ieh2p/f5HjEn9l0NEGfP8RqQBC
         VA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602704; x=1716207504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fC7C5vXMLOZCTLnWgeWGYPywrTNk/ZsS+y27pcllK0I=;
        b=UcZkaAdnOxpFiVLx924I+HQewGFlaC7NSWbzmvIg0d9NeXBV6Nh6x9ERiqo5E9Oq1A
         ++8iDlJ3zkm4cl+XofVvspCxmzj9yXZ9nLVF0LSfyefLmB4pC//ARKqiD6FlCOKol6Dd
         FBgSS7tadfabBSZwwSFiRcNOulI1oT8yPeH00YikOsBuMgZZatvPOdm+pl/qVwdEeuk0
         SY+cDrLPcR5AXT8vZe4xjC7eunpHYDQF2uMIo7xJgfyyy0i/W9Wp2M2F0J21DNqiSj7i
         vAf7GgQXYMWXpLg0xODGwU2jDT2bBpUX2dfA02aQMgd29zCT0ZU85/Yuip8LowYpYp/C
         NiNg==
X-Gm-Message-State: AOJu0YwCWIQn1ifXku9AT/hIy+/DwTYETRTmzU7eltoOR4/ARiPECoGl
	QGHeekTxvFm7w6QnodImbaQ5VUA73lRoa3fO5NicXXNjJS+oCieH3Yso205QxKpDXXCMsW7PBNM
	3rRo=
X-Google-Smtp-Source: AGHT+IFDc5gZQIL1aLfEpkLcjuVtEqckaXHGEiE8ofqkG/W52Ohf3V/Thkskqstih/+8Fb7F+2b+qQ==
X-Received: by 2002:a17:903:2306:b0:1ec:53de:a527 with SMTP id d9443c01a7336-1ef4405999amr117682285ad.59.1715602703966;
        Mon, 13 May 2024 05:18:23 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/6] gstreamer1.0-plugins-bad: fix CVE-2023-50186
Date: Mon, 13 May 2024 05:18:10 -0700
Message-Id: <ce2d6ba5d69867471919fe698467e243d5f0e73c.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199236

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a46737a73155fe1c19fa5115df40da35426f9fb5]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-50186.patch                      | 70 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-50186.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-50186.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-50186.patch
new file mode 100644
index 0000000000..86bae8fcaa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-50186.patch
@@ -0,0 +1,70 @@
+From a46737a73155fe1c19fa5115df40da35426f9fb5 Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Thu, 23 Nov 2023 20:24:42 +0900
+Subject: [PATCH] av1parser: Fix array sizes in scalability structure
+
+Since the AV1 specification is not explicitly mentioning about
+the array size bounds, array sizes in scalability structure
+should be defined as possible maximum sizes that can have.
+
+Also, this commit removes GST_AV1_MAX_SPATIAL_LAYERS define from
+public header which is API break but the define is misleading
+and this patch is introducing ABI break already
+
+ZDI-CAN-22300
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5824>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a46737a73155fe1c19fa5115df40da35426f9fb5]
+CVE: CVE-2023-50186
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gst-libs/gst/codecparsers/gstav1parser.h | 11 +++++------
+ gst/videoparsers/gstav1parse.c           |  2 +-
+ 2 files changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/gst-libs/gst/codecparsers/gstav1parser.h b/gst-libs/gst/codecparsers/gstav1parser.h
+index 31f5945..ef6ce9e 100644
+--- a/gst-libs/gst/codecparsers/gstav1parser.h
++++ b/gst-libs/gst/codecparsers/gstav1parser.h
+@@ -71,9 +71,8 @@ G_BEGIN_DECLS
+ #define GST_AV1_MAX_TILE_COUNT                 512
+ #define GST_AV1_MAX_OPERATING_POINTS    \
+   (GST_AV1_MAX_NUM_TEMPORAL_LAYERS * GST_AV1_MAX_NUM_SPATIAL_LAYERS)
+-#define GST_AV1_MAX_SPATIAL_LAYERS             2  /* correct? */
+-#define GST_AV1_MAX_TEMPORAL_GROUP_SIZE        8  /* correct? */
+-#define GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES  8  /* correct? */
++#define GST_AV1_MAX_TEMPORAL_GROUP_SIZE        255
++#define GST_AV1_MAX_TEMPORAL_GROUP_REFERENCES  7
+ #define GST_AV1_MAX_NUM_Y_POINTS               16
+ #define GST_AV1_MAX_NUM_CB_POINTS              16
+ #define GST_AV1_MAX_NUM_CR_POINTS              16
+@@ -968,9 +967,9 @@ struct _GstAV1MetadataScalability {
+   gboolean spatial_layer_dimensions_present_flag;
+   gboolean spatial_layer_description_present_flag;
+   gboolean temporal_group_description_present_flag;
+-  guint16 spatial_layer_max_width[GST_AV1_MAX_SPATIAL_LAYERS];
+-  guint16 spatial_layer_max_height[GST_AV1_MAX_SPATIAL_LAYERS];
+-  guint8 spatial_layer_ref_id[GST_AV1_MAX_SPATIAL_LAYERS];
++  guint16 spatial_layer_max_width[GST_AV1_MAX_NUM_SPATIAL_LAYERS];
++  guint16 spatial_layer_max_height[GST_AV1_MAX_NUM_SPATIAL_LAYERS];
++  guint8 spatial_layer_ref_id[GST_AV1_MAX_NUM_SPATIAL_LAYERS];
+   guint8 temporal_group_size;
+ 
+   guint8 temporal_group_temporal_id[GST_AV1_MAX_TEMPORAL_GROUP_SIZE];
+diff --git a/gst/videoparsers/gstav1parse.c b/gst/videoparsers/gstav1parse.c
+index f127856..ef1bc74 100644
+--- a/gst/videoparsers/gstav1parse.c
++++ b/gst/videoparsers/gstav1parse.c
+@@ -1229,7 +1229,7 @@ gst_av1_parse_handle_sequence_obu (GstAV1Parse * self, GstAV1OBU * obu)
+   }
+ 
+   val = (self->parser->state.operating_point_idc >> 8) & 0x0f;
+-  for (i = 0; i < (1 << GST_AV1_MAX_SPATIAL_LAYERS); i++) {
++  for (i = 0; i < GST_AV1_MAX_NUM_SPATIAL_LAYERS; i++) {
+     if (val & (1 << i))
+       self->highest_spatial_id = i;
+   }
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 4151e54284..dbe2b64c32 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -16,6 +16,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-44429.patch \
            file://CVE-2024-0444.patch \
            file://CVE-2023-44446.patch \
+           file://CVE-2023-50186.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


