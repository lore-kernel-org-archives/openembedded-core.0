Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D463E7719A
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.18128.1735998122248211624
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sy8ERdbC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2166f1e589cso223692345ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998121; x=1736602921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOOzNJK8VL7PT1r0IP+ZkL8AufpoKe2ahx+rthtSWno=;
        b=sy8ERdbCqU3mJxE6l1o6w7Az9jX2iwlv3DW/H7Kg4EICU6Mh+8qO4ATwcA6dk/fw3n
         cwwDLEBno+3dEiP2teuLFqSGHq+MRBeg8GvzpxEDjFYc13V4oPQxHjxML5gs0znJ5XPR
         7JBthHIXNEpd3/TS3gYyS9jDXz2qGZ+shl5VF8WufecS04eTshxjswp31O4ZtlR7d08v
         DNhFhkA6xPUsnmpQEHUsQ313ltP6rEmpPem0+bvnkr2tNzy0bEJuIoMs7XVjHJ3MoBNI
         ITDfyTHxdpAVAYdXtJyMFgvS9BYmTr40zohjPiNGy68b4z59/j6VO9RFqkJI7FzYt4b2
         edow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998121; x=1736602921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOOzNJK8VL7PT1r0IP+ZkL8AufpoKe2ahx+rthtSWno=;
        b=GEmGEImHSnyBZVhwk7xV0iOkxuyrumS+UdEFLpthCqRdX/D8KOMcsi7LR9SozEPbSp
         cj6tw7lI2iqZKY+x03HTIP6yhlxXfLJ4lBAImGWCqBRvXd0/XUWWE4ToZSDZ17AhpN+A
         UGPMMJrr9BtjqkkHxmSskJBJUFdQtBvt7nQPPz6ZgfDQYq1NfyCY3I5vf05BeoHUTwUZ
         v8KGadT/WdpJceXQUKjgnnnaox9+NkmaHudNMQRiS075HkqeKAfUYZDmp1Ns6ViCpvhi
         k9yyq5cjJBF7RQBRK6KTWomnmNtw2pyvRqVd9UKuai7r7SKrlVrcRpt418pr009YnMpM
         QeCg==
X-Gm-Message-State: AOJu0Ywx0K/Lc0l3WwUFIgVWZlQSxlebsT09y8ULTmLKC0Y/MfA9pA5j
	yW7NbKgcnh8oa3f4EUABiMs1bZnQvH3QndeSQZj655wcchXaLheuKnTBob8UFqadsT45qTczqCc
	7
X-Gm-Gg: ASbGnctVAGKM0Y1SWcCjLETBChtDf/GsDQpUEmRpmnRr0C1uIF05CvxqhlvpqBnwrgU
	cNL+ENhvc4yBfmmrN7fMslOK/HrYuBUyOMsFtUBiHrEATbh5OV23hT0jjcJ/LWM0V0kg4ZeDY/P
	Yr8muK3QTZ+RMdPRDoDZS2ujcsvXacwApKk7E9wMgLUED0FM4htXI49ENxvZkro84GDOr0VKZJu
	KYQOQUx4XadzjkLBrD0A28FpqJMT0Jq4GS3rOf+fQaeaw==
X-Google-Smtp-Source: AGHT+IFQ8D6PsBP3MCLvnNrt1xyL+ZGC4byO6WT68/wj+0Kqrx942V+BKtB6VzbFmN6pnFhZ/SYZkQ==
X-Received: by 2002:a05:6a00:301a:b0:72a:a7a4:9c6d with SMTP id d2e1a72fcca58-72abdeb6fc1mr85068440b3a.24.1735998121401;
        Sat, 04 Jan 2025 05:42:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/25] gstreamer1.0-plugins-base: patch CVE-2024-47607
Date: Sat,  4 Jan 2025 05:41:27 -0800
Message-ID: <0cdac58a6a7ec25404b8a67508604844d282345a.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209372

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8037

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...at-most-64-channels-to-NONE-position.patch | 41 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch
new file mode 100644
index 0000000000..7a27af1291
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch
@@ -0,0 +1,41 @@
+From 2838374d6ee4a0c9c4c4221ac46d5c1688f26e59 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 1 Oct 2024 13:22:50 +0300
+Subject: [PATCH] opusdec: Set at most 64 channels to NONE position
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-116
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3871
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8037>
+
+CVE: CVE-2024-47607
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/2838374d6ee4a0c9c4c4221ac46d5c1688f26e59]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ ext/opus/gstopusdec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ext/opus/gstopusdec.c b/ext/opus/gstopusdec.c
+index 99289fa7d2..d3f461d9a8 100644
+--- a/ext/opus/gstopusdec.c
++++ b/ext/opus/gstopusdec.c
+@@ -440,12 +440,12 @@ gst_opus_dec_parse_header (GstOpusDec * dec, GstBuffer * buf)
+         posn = gst_opus_channel_positions[dec->n_channels - 1];
+         break;
+       default:{
+-        gint i;
++        guint i, max_pos = MIN (dec->n_channels, 64);
+ 
+         GST_ELEMENT_WARNING (GST_ELEMENT (dec), STREAM, DECODE,
+             (NULL), ("Using NONE channel layout for more than 8 channels"));
+ 
+-        for (i = 0; i < dec->n_channels; i++)
++        for (i = 0; i < max_pos; i++)
+           pos[i] = GST_AUDIO_CHANNEL_POSITION_NONE;
+ 
+         posn = pos;
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index fbdd599eb9..ffae227154 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            file://0004-vorbisdec-Set-at-most-64-channels-to-NONE-position.patch \
+           file://0005-opusdec-Set-at-most-64-channels-to-NONE-position.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


