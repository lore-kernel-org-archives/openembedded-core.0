Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F228C25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 11:54:03 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.10626.1715342042655126351
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 04:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FU7xC3iA;
 spf=pass (domain: mvista.com, ip: 209.85.161.42, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5aa20adda1dso1108473eaf.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 04:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1715342041; x=1715946841; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z25f9ugNmTrD3lCpr8N7Ry6c/K3oWe1BgOUfHBgkuu0=;
        b=FU7xC3iAlbsAGdUYFIB2MWXgfeAkbNXfXQ0Hbe9duCqlkaTmO7oVHKK/sFCCFGwREe
         0RpEmnGZOlL7FIxflyKCB8XYAg/OcFBbUI2nwDJy/RZsusPdlylmA069X/FxdPaTa+4B
         Hf+u5X6A+Ts3LLP/4KFSN07Xmmur+Yl0ljwbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715342041; x=1715946841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z25f9ugNmTrD3lCpr8N7Ry6c/K3oWe1BgOUfHBgkuu0=;
        b=kXztkWmzeRNoKomtNDYZ/KY8y83EoI8/k26FRifScbo1Z1CSnKcZSmRjxsmi72mxRa
         ImtDDpsP3gx9Rf5cAHWMY3g5i/rzMhC/up2osShgrZY2EQPyUbyw3yZoJNJsKx4n49Sq
         zklTm/Wtm0JQGb50kg7SbDCbghUlOEPypZrBrZuBm9vitVAoH9lV/NxmFn1lAQHUHunK
         JEuzxFiE6RwF2YHJGq6DoLlVyhSX5hu0h4Alh4Jwksbd2cWHjuvVnkaYadO34YRA4hgE
         lnwEpIscVnZ3MRM4jpGTbexH7zNiyDuHpN3KIA1XZjUjDOs2mKBw8IPgcwl0B3YKDsCy
         C7Qw==
X-Gm-Message-State: AOJu0YwbSRmE2Noqk+oIHAlLSQGMT4UaI5uCDCXkFoQDjdNX02fSOMyk
	puzXL2QXF5ZwMDsA5xCRHRK86f+EiG3CQ/Sw4nUMZklRLXjvlTU5IFr1XDE56dRflSdzFmB5Agl
	Yv9c=
X-Google-Smtp-Source: AGHT+IEfejQO1i9np1YkicsWGSxpgzlsw8BiEP9jo9pk3Y98fKwRVCd8BpT4WNfEhAoh/o40dv3tkQ==
X-Received: by 2002:a4a:8c6b:0:b0:5b2:9d0:4d91 with SMTP id 006d021491bc7-5b281860313mr2479716eaf.1.1715342041423;
        Fri, 10 May 2024 04:54:01 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882d:9a7a:1286:c90b:57b3:b7bc])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5b26de894besm693174eaf.29.2024.05.10.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 04:54:00 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gstreamer1.0-plugins-bad: fix CVE-2023-50186
Date: Fri, 10 May 2024 17:23:44 +0530
Message-Id: <20240510115344.327832-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 11:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199197

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a46737a73155fe1c19fa5115df40da35426f9fb5]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


