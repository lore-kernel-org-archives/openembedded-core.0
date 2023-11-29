Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4144C46CA0
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:18 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.57558.1701299112519228086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hasSMbKm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c60026e8dbso285525a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299111; x=1701903911; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4N/rc8clN7EkJkVnpbAnOKi0dibNc6+t8hSy1cOB/AQ=;
        b=hasSMbKmA5EmJpayzUA/ppqvssrSGP3Hg8F9colarg+vN9I0MUmyR+WQ1RzWc1VbL8
         WznH1tYWHBe519TVno1+TOILQvAWsakO3M9ZetfuGlM7Qq8ZZtJv7i0XzGgl43RTEwBQ
         6m1S5uPpBjFZ3lb71WtL+ueLPxeebQg21v9yA5T2cV7y1TSpO/5+TZOJvDf/2KX2fNjD
         Q/KA5IYYVQGreinf75r6Rr+w2RFEs6KzJiJZ05nx7sisDN7DNH343cStl463i5qxpjZI
         L5BDjViBhERu0C8YgttWRVBzcKeW76XNd7VI2JsAfC3MDg5Rus4JLEXYf6efZ2HEQ9k4
         g02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299111; x=1701903911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4N/rc8clN7EkJkVnpbAnOKi0dibNc6+t8hSy1cOB/AQ=;
        b=NZVJyvLOI0nGe7UoFJhEM+/vlRrQMpjPp9G+Kw2Fsb/EmxPAaWvVmu2zwpflDRrDEy
         M7v3O6iRghN6gTI6CROo7pnyQqXqS+IYZFUMEQsWNAx3jxiyLFgdm7dVyyu/z6+x3ijY
         CnvxYt3Vf/NbrlRQqk7v2GuLVRJf4xb4iJPus6X3u9rnQaztX3mY19GLBSRAcreIfwFj
         oKRqoqpcY0SgZk46ODcTWnbMOzjiN/a8S6kT2OEa7BiKBzfl4kOcdn2S08cgyfdP9ymf
         /UbbOPjWC5fV9LHEEqsPbo6FuEV5ST6Tt5xRd+m1L+qA4OC7TVu1D1Kd5Ng3Tc6NvNwM
         MF6g==
X-Gm-Message-State: AOJu0YwDQ5LghPOkvcMC977pKKWFxSgx3GRkbxorDq0vd4gwrqD2RD41
	zwA5+vgu4Lf/qtP3C7NWCW4QVUIYoF386dWvJ+Hz+A==
X-Google-Smtp-Source: AGHT+IFwqyOxBipAOx7Wu6ERf977OTrao/KqvbKZh9KU83MGSmWl1jY0j19oI6bvbgAMwm2drWUpBw==
X-Received: by 2002:a05:6a21:788b:b0:18c:19e2:5735 with SMTP id bf11-20020a056a21788b00b0018c19e25735mr19960486pzc.54.1701299111103;
        Wed, 29 Nov 2023 15:05:11 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] gstreamer1.0-plugins-bad: fix CVE-2023-44429
Date: Wed, 29 Nov 2023 13:04:54 -1000
Message-Id: <76b97dc17349419059de739b2342853219c2e4ec.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191465

From: Archana Polampalli <archana.polampalli@windriver.com>

AV1 codec parser buffer overflow

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-44429.patch                      | 38 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch
new file mode 100644
index 0000000000..5070d6b865
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-44429.patch
@@ -0,0 +1,38 @@
+From 1db83d3f745332cbda6adf954b2c53a10caa205e Mon Sep 17 00:00:00 2001
+From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
+Date: Wed, 4 Oct 2023 11:14:38 +0200
+Subject: [PATCH] codecparsers: av1: Clip max tile rows and cols values
+
+Clip tile rows and cols to 64 as describe in AV1 specification.
+
+Fixes ZDI-CAN-22226 / CVE-2023-44429
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3015
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5634>
+
+CVE: CVE-2023-44429
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/1db83d3f745332cbda6adf954b2c53a10caa205e]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/codecparsers/gstav1parser.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstav1parser.c b/gst-libs/gst/codecparsers/gstav1parser.c
+index 7b9378c..68f8a76 100644
+--- a/gst-libs/gst/codecparsers/gstav1parser.c
++++ b/gst-libs/gst/codecparsers/gstav1parser.c
+@@ -2219,6 +2219,8 @@ gst_av1_parse_tile_info (GstAV1Parser * parser, GstBitReader * br,
+       ((parser->state.mi_cols + 31) >> 5) : ((parser->state.mi_cols + 15) >> 4);
+   sb_rows = seq_header->use_128x128_superblock ? ((parser->state.mi_rows +
+           31) >> 5) : ((parser->state.mi_rows + 15) >> 4);
++  sb_cols = MIN (GST_AV1_MAX_TILE_COLS, sb_cols);
++  sb_rows = MIN (GST_AV1_MAX_TILE_ROWS, sb_rows);
+   sb_shift = seq_header->use_128x128_superblock ? 5 : 4;
+   sb_size = sb_shift + 2;
+   max_tile_width_sb = GST_AV1_MAX_TILE_WIDTH >> sb_size;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index fbaabda3f9..504cfce1fd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-40474.patch \
            file://CVE-2023-40475.patch \
            file://CVE-2023-40476.patch \
+           file://CVE-2023-44429.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


