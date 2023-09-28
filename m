Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BACCE7AE9
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:49:08 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.6268.1695869341163427514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NqYY4rKl;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3af608eb367so924101b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869340; x=1696474140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0UtW4nEo3hmoVsNeEOFGYyc02HRc7Sjaf0D9aFQyE4=;
        b=NqYY4rKlNsjbs9sLIShrFndoHt8rWffGT68fHoPE8e5LUpVVGDkmNm6OgR7wxTsid+
         2CF+Dxa/siCQ95T+LxcVglocK7xqU4Tdx2IKSN0CD23b/KSZrFJiA1Dg124RFxl85Ede
         gp1lIBA3bquJTuD/kHT4+N5CAvkR9wYImEr/UxSgUZQyAdpic2+nPy4MrPfi53o8zdph
         6NqzFdX54afZf19tXJDpfBhPZCRls8YLdL/F6UAk0h7LKgFGrcXW19JIGAG0NV8dbx7v
         AKWNEA9a6xpPO3NeqPz7ToZZXy4aHEKcxTlkIxv6S9CZGNz6Xr/RJ4ioR/CBvIbC/1s0
         J+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869340; x=1696474140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0UtW4nEo3hmoVsNeEOFGYyc02HRc7Sjaf0D9aFQyE4=;
        b=twtH41LqDezr9m34vwSI6z1Dy2G/dY1XxyVXATtyHHptFnQFhRmWHahXfSCkrLl+Hk
         3WiGvk0N29s1l3fuvUwGUA75ghzWgbIcL6UDlkFHeYJtZpNvZi7leiss74903y1GR14b
         M7hLU1X3bZhUdHS6wSP+jpD254AIgjYK7v7DXEcjXLxkHq1WtK+jV/MHt3DGHEL5V27T
         lNkbZXO8J80qIZygTxMJZbrd6WvX2D67NtKyvdkLCehrpyTTqJgPwjsRqhq6dhlHwZBE
         SCMLntDiaAIvwuB98gEujUy226l/nr/ZYyWzgOihcU9k/c2AISxQvo84hO/rUsJdwseO
         Jaqg==
X-Gm-Message-State: AOJu0YwiTIuzcDOdpcoJw4uw1SHLxa2InpbHmMCaoMJB8jmK8J18+mwU
	8mUBqqLlaYE12y+KJ17JO7g8SyaQ9v58TABWyp4=
X-Google-Smtp-Source: AGHT+IE7D+o7E0DeTBdJUA+z7e2elRYLOZg9ZG+n2hwVl4n7lEbbk6bzBnLKg3I57xVFcpnERFLRFQ==
X-Received: by 2002:a05:6808:d4a:b0:3ae:55e6:1e34 with SMTP id w10-20020a0568080d4a00b003ae55e61e34mr3778411oik.58.1695869339983;
        Wed, 27 Sep 2023 19:48:59 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/17] gstreamer1.0-plugins-bad: fix CVE-2023-40476
Date: Wed, 27 Sep 2023 16:48:34 -1000
Message-Id: <2abcf03fbe343596de38113c655028c157763245.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188355

From: Archana Polampalli <archana.polampalli@windriver.com>

gst-plugins-bad: h265parser: Fix possible overflow using max_sub_layers_minus1

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2023-40476.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch
new file mode 100644
index 0000000000..7810e98024
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2023-40476.patch
@@ -0,0 +1,44 @@
+From 1b51467ea640bcc73c97f3186350d72cbfba5cb4 Mon Sep 17 00:00:00 2001
+From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
+Date: Wed, 9 Aug 2023 12:49:19 -0400
+Subject: [PATCH] h265parser: Fix possible overflow using max_sub_layers_minus1
+
+This fixes a possible overflow that can be triggered by an invalid value of
+max_sub_layers_minus1 being set in the bitstream. The bitstream uses 3 bits,
+but the allowed range is 0 to 6 only.
+
+Fixes ZDI-CAN-21768, CVE-2023-40476
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/2895
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5364>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/ff91a3d8d6f7e2412c44663bf30fad5c7fdbc9d9]
+CVE: CVE-2023-40476
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+
+---
+ gst-libs/gst/codecparsers/gsth265parser.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gsth265parser.c b/gst-libs/gst/codecparsers/gsth265parser.c
+index a4e7549..3db1c38 100644
+--- a/gst-libs/gst/codecparsers/gsth265parser.c
++++ b/gst-libs/gst/codecparsers/gsth265parser.c
+@@ -1670,6 +1670,7 @@ gst_h265_parse_vps (GstH265NalUnit * nalu, GstH265VPS * vps)
+
+   READ_UINT8 (&nr, vps->max_layers_minus1, 6);
+   READ_UINT8 (&nr, vps->max_sub_layers_minus1, 3);
++  CHECK_ALLOWED (vps->max_sub_layers_minus1, 0, 6);
+   READ_UINT8 (&nr, vps->temporal_id_nesting_flag, 1);
+
+   /* skip reserved_0xffff_16bits */
+@@ -1849,6 +1850,7 @@ gst_h265_parse_sps (GstH265Parser * parser, GstH265NalUnit * nalu,
+   sps->vps = vps;
+
+   READ_UINT8 (&nr, sps->max_sub_layers_minus1, 3);
++  CHECK_ALLOWED (sps->max_sub_layers_minus1, 0, 6);
+   READ_UINT8 (&nr, sps->temporal_id_nesting_flag, 1);
+
+   if (!gst_h265_parse_profile_tier_level (&sps->profile_tier_level, &nr,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index d5f1e794cd..fbaabda3f9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://CVE-2023-40474.patch \
            file://CVE-2023-40475.patch \
+           file://CVE-2023-40476.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


