Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9912BE77199
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:44:21 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.33639.1736055858153415348
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M2caZR1M;
 spf=pass (domain: mvista.com, ip: 209.85.166.179, mailfrom: vanusuri@mvista.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a9cb8460f7so101489135ab.2
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055857; x=1736660657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjXGO8CMC+SdHKcoEOZN3sxUursUHCaqGWqPpeydeoQ=;
        b=M2caZR1M8XNJ71hRTv4puqMP5pCibxlwiMF+uFFbC2/TDXCa794sD5MvFzAWdyEL5U
         Y8SqtX3mAkkVq7Brwd6ihTBR99XWYSLUn2cfAs/WhceuRbibOXeOnTZL5zCcI9ke3az1
         qMXBAbJMLkx6d8QHe4YwSO4Yfpr/vl9a2uGq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055857; x=1736660657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rjXGO8CMC+SdHKcoEOZN3sxUursUHCaqGWqPpeydeoQ=;
        b=HxtuWxzRsvQu6ZDUZ4iHE/lH3kIg6MfwZIx5YOskE2jVBgFSzV7mcQTpjTZ2Tak9hp
         ubHfn2uVc5CR/m+cHfIvLMnoR6EnM/OrBR7giF/arxHhQFlbU7TXfuBaWa4oFTzqmfSU
         DGeBgVs5Uifx11T0YKOhBhjmkLHaQo5C+LFtw1/W8jx58FQvQuHz3Uc4PwWW6RhWVqVs
         ETBqJVVLusVZDJJ6iigftpok2xO2LEMdi/BUr8LRi1iQWJMPlXZ2ne9f3NENJqz0dI6h
         WR51A8SSF58c+UgGubD+TMgOeRtXLGgat3ch8CRaQ4f8Yu6SSawmGaC8DOGcYnoxZJm8
         4i8w==
X-Gm-Message-State: AOJu0Yyg39JxqwrHb/D0GwX8sWUeVY7HzCUu5rni9YTKvg0IDD3DOdHw
	28Nd0uHaihUJFBZ7D8KjfzPhv5A9hJET2fHDsw3z1qbYIgLbtVXU7+Tdse+FpV2sbt6NLQTyklo
	BB/0=
X-Gm-Gg: ASbGncvtW7qOA1qy24Ow8tIcVKUryVS1W4FMFsNLBJ00lAgYI4UrMKTHFGc9qG+/Mj0
	qS95D7af87R59U6eRWv24UEH2UR0nyHkk5LtDEyBBdLdFe/oob809R+8KLYc0UDx/xGETywUxdX
	HlbsqWdh6/i7t6HFg4T7jO38alJ3gYT2fixC8WXYslHYwDG2pku309PVAId/ojiWv9JU7FW8Wl+
	Xb3r2SRh7HT4qo2R+hikah0V+mo4pJAGkJFugf/h421guL0DOGSn1NYSfDAJh1l38yE4Uw=
X-Google-Smtp-Source: AGHT+IHAPsGlNsdYvlEC3bQwPrw/7o4NoiZyNocJEXcRBrsLObHKEhq7cNyXj+y3cdPo0UNFDc+ryQ==
X-Received: by 2002:a05:6e02:489:b0:3cd:dc7e:9236 with SMTP id e9e14a558f8ab-3cddc7e93a8mr25378515ab.7.1736055857015;
        Sat, 04 Jan 2025 21:44:17 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:44:15 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 8/9] gstreamer1.0-plugins-good: Fix CVE-2024-47774
Date: Sun,  5 Jan 2025 11:13:17 +0530
Message-Id: <20250105054318.222154-8-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209413

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../CVE-2024-47774.patch                      | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch
new file mode 100644
index 0000000000..b9624a148c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47774.patch
@@ -0,0 +1,46 @@
+From 0870e87c7c02e28e22a09a7de0c5b1e5bed68c14 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Fri, 4 Oct 2024 14:04:03 +0300
+Subject: [PATCH] avisubtitle: Fix size checks and avoid overflows when
+ checking sizes
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-262
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3890
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/0870e87c7c02e28e22a09a7de0c5b1e5bed68c14]
+CVE: CVE-2024-47774
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c b/subprojects/gst-plugins-good/gst/avi/gstavisubtitle.c
+index efc5f0405186..c816934da61c 100644
+--- a/gst/avi/gstavisubtitle.c
++++ b/gst/avi/gstavisubtitle.c
+@@ -196,7 +196,7 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   /* read 'name' of subtitle */
+   name_length = GST_READ_UINT32_LE (map.data + 5 + 2);
+   GST_LOG_OBJECT (sub, "length of name: %u", name_length);
+-  if (map.size <= 17 + name_length)
++  if (G_MAXUINT32 - 17 < name_length || map.size < 17 + name_length)
+     goto wrong_name_length;
+ 
+   name_utf8 =
+@@ -216,7 +216,8 @@ gst_avi_subtitle_parse_gab2_chunk (GstAviSubtitle * sub, GstBuffer * buf)
+   file_length = GST_READ_UINT32_LE (map.data + 13 + name_length);
+   GST_LOG_OBJECT (sub, "length srt/ssa file: %u", file_length);
+ 
+-  if (map.size < (17 + name_length + file_length))
++  if (G_MAXUINT32 - 17 - name_length < file_length
++      || map.size < 17 + name_length + file_length)
+     goto wrong_total_length;
+ 
+   /* store this, so we can send it again after a seek; note that we shouldn't
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index 828b5f1083..8cf08c5088 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47540_47601_47602_47603_47834-7.patch \
            file://CVE-2024-47606.patch \
            file://CVE-2024-47613.patch \
+           file://CVE-2024-47774.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


