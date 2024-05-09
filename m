Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E92C25B7A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.8615.1715256313739345004
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ma0G8bSm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f45020ac2cso678493b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256313; x=1715861113; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LEoWgYdFX/oD6M0Nbmis709WBZyNMGbyWPvoSdf/gG4=;
        b=Ma0G8bSmJNWcM57tu21bwUP72jTeGgIB4DKDmhvEqFqTcfzUQmKZih0xeVqZMB7TTq
         VmrrhI0dobacxDMENvcUZ3hyyApHrUcTWHZZLkncBPbk9hCWhWNrEMu4CUvBtuKVA2gk
         TUbIhRZVioHg0nHJDlQQEbOA6wrTP+GlYkwGrmgdyuripq/btUuYf8KmQQQEn0fFYB98
         xerGkfCdkyTN4yd5YnwZERkYOl+Cucu+gcp6QGI1l6PyfFbkmMuq7OX0vAmm8+Y8m68h
         aTpDyZwGPYa9uwp+zOqpn0MqihLG/5isb+jnzTSBC8wxg3xtHE8xsF3wlyaYdKaLA7rf
         mjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256313; x=1715861113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEoWgYdFX/oD6M0Nbmis709WBZyNMGbyWPvoSdf/gG4=;
        b=KMtppDg8h+c9QOSxU8OI3rs6FeLX8ZdBcA5fZhWCmql8ts9A4h0EkLtMDsyT8WzIQF
         oVw7UNhi04uwwKgbfGCTgky1PMHb//qFXBrDUJLs7hp6ENZMJNn6/H5iM+JH5tjFi0H7
         onOiNl0OAjN7KMkPi2VkA4mF1x1wMZ7/pnJN/jzT7PGC8R4A8Sn3UzjlKjNhBGhm59jB
         edhAULbuv6WnM/UkqRPke//tPxi9CZHYQaO1ElEDzQcITKuyp+B2wnZa6XZAyeI1KPv3
         UYwvY3x5FBSTWHrTcVixn3Zm+YC99oK0jhoqiI4iCoaMpzU4dxOYN+BcjL/Q+ytpfLeW
         XnLg==
X-Gm-Message-State: AOJu0YzjyTZStZad3LsmvW+FLC8Xvt++ue/Z5n4lDVDpgWo2fN18r/pa
	+g6kUQwwnWcWHJTd/94tSSz13xkoJDEuX+9BrQdcuHiT9bWjbtTTOE009iJxtr3WkD1fwx1vhZ6
	w
X-Google-Smtp-Source: AGHT+IERh5sclbeaQXFR+DWNt9/FpgXF8ttxheY4pFaOFag4urXgqRk6twPFYNgho/c2xNhEzmPhRg==
X-Received: by 2002:aa7:8506:0:b0:6f4:7606:aa85 with SMTP id d2e1a72fcca58-6f49c2addd8mr5778357b3a.32.1715256312920;
        Thu, 09 May 2024 05:05:12 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/23] gstreamer1.0-plugins-bad: fix CVE-2024-0444
Date: Thu,  9 May 2024 05:04:41 -0700
Message-Id: <e261dfd6e547aa28e115cb9e8e9150c56d39035b.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199150

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-0444.patch                       | 42 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.20.7.bb        |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch
new file mode 100644
index 0000000000..6265f4293e
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/CVE-2024-0444.patch
@@ -0,0 +1,42 @@
+From 394d5066f8a7b728df02fe9084e955b2f7d7f6fe Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Wed, 10 Jan 2024 03:33:59 +0900
+Subject: [PATCH] av1parser: Fix potential stack overflow during tile list
+ parsing
+
+The tile_count_minus_1 must be less than or equal to 511 as specified
+in spec "6.11.1 General tile list OBU semantics"
+
+Fixes #3214 / CVE-2024-0444 / ZDI-CAN-22873
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/5971>
+
+CVE: CVE-2024-0444
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/394d5066f8a7b728]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst-libs/gst/codecparsers/gstav1parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/gst-libs/gst/codecparsers/gstav1parser.c b/gst-libs/gst/codecparsers/gstav1parser.c
+index 68f8a76..bab404e 100644
+--- a/gst-libs/gst/codecparsers/gstav1parser.c
++++ b/gst-libs/gst/codecparsers/gstav1parser.c
+@@ -4352,6 +4352,13 @@ gst_av1_parser_parse_tile_list_obu (GstAV1Parser * parser,
+   tile_list->output_frame_width_in_tiles_minus_1 = AV1_READ_BITS (br, 8);
+   tile_list->output_frame_height_in_tiles_minus_1 = AV1_READ_BITS (br, 8);
+   tile_list->tile_count_minus_1 = AV1_READ_BITS (br, 16);
++  if (tile_list->tile_count_minus_1 + 1 > GST_AV1_MAX_TILE_COUNT) {
++    GST_WARNING ("Invalid tile_count_minus_1 %d",
++        tile_list->tile_count_minus_1);
++    retval = GST_AV1_PARSER_BITSTREAM_ERROR;
++    goto error;
++  }
++
+   for (tile = 0; tile <= tile_list->tile_count_minus_1; tile++) {
+     if (AV1_REMAINING_BITS (br) < 8 + 8 + 8 + 16) {
+       retval = GST_AV1_PARSER_NO_MORE_DATA;
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
index 504cfce1fd..219ebe4fa7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.7.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://CVE-2023-40475.patch \
            file://CVE-2023-40476.patch \
            file://CVE-2023-44429.patch \
+           file://CVE-2024-0444.patch \
            "
 SRC_URI[sha256sum] = "87251beebfd1325e5118cc67774061f6e8971761ca65a9e5957919610080d195"
 
-- 
2.34.1


