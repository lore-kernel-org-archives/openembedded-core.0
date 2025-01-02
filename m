Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 380F7E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 13:34:09 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.8095.1735824848538973778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 05:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QF1153Uf;
 spf=pass (domain: mvista.com, ip: 209.85.166.52, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so442606839f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 05:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735824847; x=1736429647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMRYZF9cCQsqVgiDfObYX4B+p7MR5bChBwHXG40zmQM=;
        b=QF1153UfhkiXsqyinZVFbV5HiLeqbGslQRZN505+JArdfekUqNSQrDf4D4Qh4m8yJr
         cEGpqBPXLFJ/F2LYA1H7peJaObR6zFdJasohU/CW/0BXb7iBXgrFBlleQkD40u4Vqyjd
         8vMqxJ/FKba3F5WA3KB03UCP6FTkGCefPyHYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824847; x=1736429647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMRYZF9cCQsqVgiDfObYX4B+p7MR5bChBwHXG40zmQM=;
        b=OC/26A7gFOjvrXl1G9zjZItlPej0gP8Z5yARAlbkD6SOH2isYNuMVk/MtdS7N3i0hn
         fQClto1FvxqGeAZc3uGkFvGQrBPdPwI/MZgTqe++7qjiSNi/g2PPlqM6svB361B08j2F
         iKIDio+McHQOfMCVUOWe7keB9K1wx1KYez3tOpu/tX4DKanswcwN+f+n9Op48EJOkFsP
         gUjgtpjx6oxYhkP73+ZLNbuuDNb89u2dT9zFl1+t7yr5Cvgm4g43SQ/c77COqh8nKhr3
         npk16o1Z8nD6f+gOfFc1S1wLEnUZ4If55rerLT9QHLuKWuNMxzCP79laX2k9NvV5JzFS
         pF4w==
X-Gm-Message-State: AOJu0YwUhHzdima1Btqqgprfar8YkKqMslSr85bnh/ihe6cgbHchFEB8
	BMmDvFz1A8/cSnO1kXaz3lxPyB84wt6+4yi/0oFaCP4Eiz39B51PJ+vVZ/I90EYN/OHphBpA9Kj
	sJSA=
X-Gm-Gg: ASbGncv8D5JSv3aYL/tdIUOWDPcirR1oIs9Yq/4zVTCUwThFUvq7k6pFkedO37wK3G6
	u7BkguqssD4l86ftG8rLOLdWc7yHrnsodlPppxiFxKDvUJYTjari6sDW/3+GRgvZAiJr2CGsYEI
	IT/1yGJDN3iya/GNMXTuXGfhHN4lDVFyCNnlgdV5mZ0HqhIz9y3hvAqrAosSJYU5KqJsvj4JTqn
	zjH4cDKOINfXIExOOMDeyVdCqno03r4sc+i3mRcyzFbV+bVJpfp1rmT1+CnBJ1i6Vf6JF4=
X-Google-Smtp-Source: AGHT+IGOZXhOp4b5HDR2+R9PwKWJ8Jh0MVb9nBWowCTxOXXr5A37icmAW3H5U1XPwuw82qBOO1ddjQ==
X-Received: by 2002:a05:6602:3428:b0:7f6:8489:2679 with SMTP id ca18e2360f4ac-8499ec27bbcmr3674642639f.8.1735824847395;
        Thu, 02 Jan 2025 05:34:07 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:79d6:d2bf:f7c6:a6fe:8968])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8aa81bsm685493139f.36.2025.01.02.05.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 05:34:05 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 6/7] gstreamer1.0-plugins-good: Fix CVE-2024-47774
Date: Thu,  2 Jan 2025 19:03:17 +0530
Message-Id: <20250102133318.642859-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102133318.642859-1-vanusuri@mvista.com>
References: <20250102133318.642859-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 13:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209308

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8043

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...size-checks-and-avoid-overflows-when.patch | 46 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
new file mode 100644
index 0000000000..b9624a148c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch
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
index bb85f4d2e9..42c9b86471 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
            file://0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
            file://0023-gdkpixbufdec-Check-if-initializing-the-video-info-ac.patch \
+           file://0024-avisubtitle-Fix-size-checks-and-avoid-overflows-when.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


