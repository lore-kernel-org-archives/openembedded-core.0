Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A8DE77199
	for <webhook@archiver.kernel.org>; Sat,  4 Jan 2025 13:42:16 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.18145.1735998134873496532
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 05:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Nx5kTd8V;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21683192bf9so182446045ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 05:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1735998134; x=1736602934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FOORDKyi4cwzRlGlVua3gOKYPJChadPByC5Z0qqGOs=;
        b=Nx5kTd8VsEm+3xAljj0/6BeUhoLW6IlaIh4x5DlLTHoHsJI7DrU+ufDngLJwNWvzFh
         oGLC73uiD/zJhN9Q9YDrAB4Hlgr4WYaLLYsKN/ZA3i3aSpRE26UKVxJDNRdqT8EQYTsh
         i/IvbwOjXsGKbqa0laBxdhbJ5Yhw0lfjAClqhbZTkMPsXMdGN8ZvMwV3HtB1XM5qVcuZ
         dFeG0FEcKY563wJappNH7p2gtR2A6Jl25o6AJc/hNL0ldsC4od2bwiV1X6vXzSIP9pp2
         eOmwK+KYLJCSedIp5skrff57AiFPt0tnq0C56stwuOcuVz00QFUxTdPIvgM8c24Hci9C
         vfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735998134; x=1736602934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FOORDKyi4cwzRlGlVua3gOKYPJChadPByC5Z0qqGOs=;
        b=ADk6HoLoilmbYhp3RVDrGWKa+Di5ocvLXbhMnIsX2WdFEoEw9NYmLuEpVh12cERCQf
         1nIVJddx31v4KJJyiZUFXOpUe92RhoFcZEZEZ1ckUFlTkT7g/2vC6pFwWRVBDRa4mtxK
         86o25zLfX9l7XRMtTDufIna/LNwTZX3iPdDF8WDdbZE6dkvZHSP4vFKg8a+fMO2643OM
         JhHHwf04HTAPgixCbRSl7rYujwrm3p++VY4gpVeTgNLSnanop/R1CHqUs4Xj5XPvzmY+
         DdoAE6RncVgyQjqmFtYlxvSJvz1/fGA79EAOI8kpchKUMQ/uKZGDMyPJ+t6R2jvhvMSK
         2Y2g==
X-Gm-Message-State: AOJu0Ywo6QRcoo118kYuN8+9ami8NSbPrceOUrFXl9YDNT6HHN83UE5E
	1p+W33mujXPpKHlrBVqojNUL2ovhOtXQK9DrOqZ+SBHNt8eSQ9gnCW/wTvMjoqPWH9b8j0Gayw7
	e
X-Gm-Gg: ASbGncv8X/jCnmRQSTTfvIbOv9egkjnNuXr7bwhXdNT/2fvQZpX8DzTb8tJeTR9zBBq
	6lV9a+Db1a0+FAxZzjf18Z+Vy4zkAN9um8CxbdiGeZKgl3ba4EoaRhRLCRB5EvT1MqlSFTcCPST
	aAX4HUcTBCl0bsjroHpQJykzz4MtrC2sddh8mhQXItZtqtAfxJNSooIsVjVgzjC6/g4AcJp1gi5
	iORd8my0trusoNUbCX0uzVsbLezaVJRtfRQu8nCySo5KA==
X-Google-Smtp-Source: AGHT+IGGMKMWGMokXhtJDZIkDrllnlzCk1KqzxWp5EMV0YGdQz2saY3vfgvGsaTbH+aQdCDCLitmSw==
X-Received: by 2002:a05:6a20:7f8b:b0:1d9:4837:ada2 with SMTP id adf61e73a8af0-1e5e0801d62mr95758071637.35.1735998134107;
        Sat, 04 Jan 2025 05:42:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8faf93sm27966257b3a.153.2025.01.04.05.42.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 05:42:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/25] gstreamer1.0-plugins-base: patch CVE-2024-47600
Date: Sat,  4 Jan 2025 05:41:34 -0800
Message-ID: <13e66d4e616e66d278cd96bb04da4cc7e599626b.1735997984.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1735997984.git.steve@sakoman.com>
References: <cover.1735997984.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 13:42:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209379

From: Peter Marko <peter.marko@siemens.com>

Pick commit from:
* https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8034

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-print-channel-layout-for-more-than-.patch | 38 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.22.12.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch
new file mode 100644
index 0000000000..6762f256e0
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch
@@ -0,0 +1,38 @@
+From aa07d94c10d71fac389dbbb264a59c1f6117eead Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Mon, 30 Sep 2024 18:19:30 +0300
+Subject: [PATCH] discoverer: Don't print channel layout for more than 64
+ channels
+
+64+ channels are always unpositioned / unknown layout.
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-248
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3864
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8034>
+
+CVE: CVE-2024-47600
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/aa07d94c10d71fac389dbbb264a59c1f6117eead]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ tools/gst-discoverer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/gst-discoverer.c b/tools/gst-discoverer.c
+index e3f048bed5..4a2a1b4bc4 100644
+--- a/tools/gst-discoverer.c
++++ b/tools/gst-discoverer.c
+@@ -222,7 +222,7 @@ format_channel_mask (GstDiscovererAudioInfo * ainfo)
+ 
+   channel_mask = gst_discoverer_audio_info_get_channel_mask (ainfo);
+ 
+-  if (channel_mask != 0) {
++  if (channel_mask != 0 && channels <= 64) {
+     gst_audio_channel_positions_from_mask (channels, channel_mask, position);
+ 
+     for (i = 0; i < channels; i++) {
+-- 
+2.30.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
index 793b8afc3d..982389d657 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.12.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0008-ssaparse-Search-for-closing-brace-after-opening-brac.patch \
            file://0009-ssaparse-Don-t-use-strstr-on-strings-that-are-potent.patch \
            file://0010-id3v2-Don-t-try-parsing-extended-header-if-not-enoug.patch \
+           file://0011-discoverer-Don-t-print-channel-layout-for-more-than-.patch \
            "
 SRC_URI[sha256sum] = "73cfadc3a6ffe77ed974cfd6fb391c605e4531f48db21dd6b9f42b8cb69bd8c1"
 
-- 
2.43.0


