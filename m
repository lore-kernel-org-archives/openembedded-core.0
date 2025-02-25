Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6205EC021BB
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:42 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9101.1740493832236895931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H6IOpx8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2211acda7f6so127635925ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493831; x=1741098631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgyPLgVwuqkDAYH8iUe6eILGpVkRFjiBciWjILnGzQo=;
        b=H6IOpx8VRGcVwYxR2BbNKLUyowkZzE+y9lxPlJzneCa4sneJpkfpo7MK6Nx+iNoP9C
         5Mi+xYkH6MdKuWn8IRb7xZsIQcTGQRVYmk/CZ2cEJzeCrGSs6QmeFsYiMaWUHtmSMF19
         78dfS+ECUHmb8dQ5pBtOPzgdFGi5K2ZwFy84shZVsugUcEn8kc/uQYsjJuBsmMWV2Uao
         Au3x6Wpq3RJdyyYKRn9AD0woGLLnPBdIpO1ksJTnzr74BmW0xyqFVdtoPMrqM4Dj5NnS
         0EiZrwzhzBSxvcQrJfVfES0Owv81mQ4UAzmBsKEKVU4qZdFLw0kUDetxNKtl51YKrOsB
         ze9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493831; x=1741098631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgyPLgVwuqkDAYH8iUe6eILGpVkRFjiBciWjILnGzQo=;
        b=xMaNwDtenfhUixteTEwW7ogJfLRvsndDCIbZIvhYjWFX5YI0QBYClOFTx+cffq9k/X
         dFPyv2XZNNmCXq8sZtVGVEUyFM+X751HgqB+nCirVBQOUHBwNIJcejzn7aIzvexW/+yN
         xXNx9cwVYpWv+0Uk4SXFLE53kmO5hx6jYmYstuDodN5q/k+s92DwDFuaC0AHKj8vz1od
         Gv/SFcg44mjPET2yQ1X4/4RmGRvkSF7yoyJJt5v1sqa7Aqh/E18X8HbvkHdEjzyKuNGw
         XBdP+0iPN31gGA50pBe8t2Vv68x5A3tz4NQMzDSwcawOscSIwVF9nX4qGS4HRTt6149u
         2bbA==
X-Gm-Message-State: AOJu0Yx286r9AKB/4nghOwuVu4Tp1D7dJMLvLlNskyGzoQoWxn5E9zJ6
	EKQBknXVN9Ix6bQizJkknsoRm7NRJSYrC05oT5aaBG4caw/+Dol8GKT+hQNv1vN9CR73sKDbXsB
	7
X-Gm-Gg: ASbGncsEc4GlaaX0hx1yA83Ed/5iZ/SBm/JRr3+uBBHQvxk4VDKC/Y3k1XXDrmnnlVm
	hwyQpQAyv21lYeA7MJAfm6/bKKh2R08bf8wIVksNcQbMHVOF6FcZRuxfw3IeDP3GGBwcLEt7hDa
	OoBc1qNrfP+TgflgxUvXeKOzYRR5rSlVyqgXjGteo20ro0v8WP4i5dx4kVbrDxtqP0jtu+skxXS
	y56xygTxLE7LkjY6CSxEYuRXOK46/Hn/CmZblScdbsfeHOXwouTMAyvWbJLV3KDGXv4Dy5r1fiZ
	VOSbzKV/5cWngdiwMQ==
X-Google-Smtp-Source: AGHT+IE9sVhVgLOI+QWRvr2dGvLbSAAMLKUNCbkP9+ihXfKLxFDU9pgSn5AdYmoAgylgAhRGmlShtw==
X-Received: by 2002:a17:902:da8c:b0:220:d469:5380 with SMTP id d9443c01a7336-2219ffa7c85mr268455655ad.40.1740493831436;
        Tue, 25 Feb 2025 06:30:31 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 17/22] gstreamer1.0-rtsp-server: fix CVE-2024-44331
Date: Tue, 25 Feb 2025 06:29:52 -0800
Message-ID: <ce328462a12eeaa59994e2236071aa17a083c263.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211902

From: Archana Polampalli <archana.polampalli@windriver.com>

Incorrect Access Control in GStreamer RTSP server 1.25.0 in gst-rtsp-server/rtsp-media.c
allows remote attackers to cause a denial of service via a series of specially crafted
hexstream requests.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-44331.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-rtsp-server_1.20.7.bb        |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
new file mode 100644
index 0000000000..e78fef7b93
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
@@ -0,0 +1,44 @@
+From aa3e97d67c05d4648ea58c7ff7675e24a81ca72b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 24 Oct 2024 20:12:55 +0300
+Subject: [PATCH] rtsp-server: Remove pointless assertions that can happen if
+ client provides invalid rates
+
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3731
+Fixes CVE-2024-44331
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7739>
+
+CVE: CVE-2024-44331
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/aa3e97d67c05d4648ea58c7ff7675e24a81ca72b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ gst/rtsp-server/rtsp-media.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/gst/rtsp-server/rtsp-media.c b/gst/rtsp-server/rtsp-media.c
+index 88bf7a7..e482b44 100644
+--- a/gst/rtsp-server/rtsp-media.c
++++ b/gst/rtsp-server/rtsp-media.c
+@@ -2737,15 +2737,13 @@ gst_rtsp_media_get_rates (GstRTSPMedia * media, gdouble * rate,
+           first_stream = FALSE;
+         } else {
+           if (save_rate != *rate || save_applied_rate != *applied_rate) {
+-            /* diffrent rate or applied_rate, weird */
+-            g_assert (FALSE);
++            /* different rate or applied_rate, weird */
+             result = FALSE;
+             break;
+           }
+         }
+       } else {
+-        /* complete stream withot rate and applied_rate, weird */
+-        g_assert (FALSE);
++        /* complete stream without rate and applied_rate, weird */
+         result = FALSE;
+         break;
+       }
+--
+2.40.0
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
index 2901be69d2..a7d17e3b1e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.20.7.bb
@@ -8,7 +8,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://CVE-2024-44331.patch \
+          "
 
 SRC_URI[sha256sum] = "2c8f46aa9df2245e5b39a2082be8e9d3edc0f61bc34f667803d7a21da1b51987"
 
-- 
2.43.0


