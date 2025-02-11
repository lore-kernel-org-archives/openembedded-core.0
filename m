Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA5AC021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 20:09:37 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3299.1739304573837627028
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 12:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DcVFMXMg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f2339dcfdso1976405ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 12:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739304573; x=1739909373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jiB1/BcROFpN3yTcfi0VW6wrbhccI+j6dwF7VYeLvb8=;
        b=DcVFMXMgTbqwT6n2dYbTXXfDgWhD09AKUD7SnAjnz0mhXn1uY61EPPphZIIxfq+Ni6
         QTaxeJQEvCOvG9wdhUEr1bY4THn2jgTmZBE8E1pCrcEEI9p7SJhs68+TutuR3ohDZ8Kk
         dV8cvuiQbVN7B//gGVDSLD3kO2U12xoRpnyqUCPTo9VwyzlNLgS/z5mVaI7jfT4AnUG1
         tT+3xSL3BzJWe5swtyKmfjLLfqsOndKVbLg9GntwS/tV+8OnRAxlQUwaTHgF5DRV/Xnh
         pwHZ2lKYlH6nglK+MpHbn0mbnKzqTjwuZdP9JOi8U4LjPy9ye91A68ctmCVfAuDHQDrK
         uv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304573; x=1739909373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiB1/BcROFpN3yTcfi0VW6wrbhccI+j6dwF7VYeLvb8=;
        b=iPLSnYT4bbYx8HPF7IozUaSs0GpOt1Zsl0roPHH2W1nyF/VTmARTn3oJYt7BoMEYQ9
         hvhVc5QL5/vCDxK62ySf8H9T/cIOOvsMErKEHiV6DLeNl2YTAK/00D0XuS3GoMn7wyw3
         6iVXAohY2j/BnCrR8i9yZgFmSIadT/5zgQPmRblwyaT4g+gxeT+mmofr1zrXTZxnNy1V
         7tEmWCgAIuVCCT3WLFXjQgLLbc2qgcR4YMmWub55wruJAydy8kju15fzGN32SyEH07X8
         1B0Iy9x4S2hASPJKv3oYyTIlPaqvki4e/OJ+4bnmxRpR1nHaMz8NcJ4I8/08PI7/jRRs
         b6Ng==
X-Gm-Message-State: AOJu0YyYLs2zC2FX/m4N6gW4X1xn9gao4i470Lj5wbSIhmzxaQ5Wo0iq
	gQFINOoaVOVUgqlWByGQsqMGO/soSjN4RXe6Bp8vbEUgUmS9/NuyCwYSMG6bh8TUhkp+P5IyUU+
	Q
X-Gm-Gg: ASbGncvScLt63IiMlJ0FhkEg1zMm1VdU3+I88i9UIuHOqH1j5UZFpYcmPRf7J+aklaW
	e4BI6yh73gu6QGa7wNnhqdiXYspmzGD3ZU0EVTfMKhJPMTO9V3cQ8sD8pFZBwHHj6zof7gNbUHT
	/a3GxV6GUxVa7pqd/DMcDMz2MsZ+VAvu5kcrTDVHX9qU2IKwA+4zEAOJPKhAbIglyybXSMOa+H3
	vnC4Ukz7yVX5TVNf0SeSllAq2ia/vqE+HCQJWn2YxjlJPj3ShiGYqQfqrP0FLRfgClbH6C1TD1y
	UO9r
X-Google-Smtp-Source: AGHT+IFYumU8mHv4c7aKaz6V3VnEymJxZ5/415k0dkmypdJfMziKM+CMnSfZUBQW/GxD8BteoypFMQ==
X-Received: by 2002:a17:902:d2cc:b0:21f:6167:183a with SMTP id d9443c01a7336-21fb6f1219cmr76668905ad.15.1739304572994;
        Tue, 11 Feb 2025 12:09:32 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687e696sm100486485ad.209.2025.02.11.12.09.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 12:09:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/14] gstreamer1.0-rtsp-server: fix CVE-2024-44331
Date: Tue, 11 Feb 2025 12:09:07 -0800
Message-ID: <3e7b7697ec32b0fa2808efcff4a6bd544261b3fe.1739304425.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739304425.git.steve@sakoman.com>
References: <cover.1739304425.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 20:09:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211177

From: Archana Polampalli <archana.polampalli@windriver.com>

Incorrect Access Control in GStreamer RTSP server 1.25.0 in gst-rtsp-server/rtsp-media.c
allows remote attackers to cause a denial of service via a series of specially crafted
hexstream requests.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-44331.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-rtsp-server_1.22.12.bb       |  4 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/CVE-2024-44331.patch
new file mode 100644
index 0000000000..eea58d3538
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
+index 8c62b0d..cbdc9f9 100644
+--- a/gst/rtsp-server/rtsp-media.c
++++ b/gst/rtsp-server/rtsp-media.c
+@@ -2755,15 +2755,13 @@ gst_rtsp_media_get_rates (GstRTSPMedia * media, gdouble * rate,
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
index c89c22f334..3cd21e7181 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.12.bb
@@ -8,7 +8,9 @@ DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
 
-SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
+SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz \
+           file://CVE-2024-44331.patch \
+          "
 
 SRC_URI[sha256sum] = "bf6c7871e7cf3528e4ec87ddc2f2949691cd269f98e536482ae744c1405cf451"
 
-- 
2.43.0


