Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D6CE77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 18:09:03 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.91.1736273335438336843
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 10:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kHfg6Xiq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so23236230a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 10:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736273335; x=1736878135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ses48oObRa/xC0inmVs0sVNcKOLmiM/3m76WwOoKMec=;
        b=kHfg6XiqkD7AJ3SeXnsMHHrlj4q/cNfOMYsAhMaIWV/IXXt2EDScHPpLNcPXmMpU5R
         uB9yQ/pUGC5pnoq9VvxrrMfNzQlfsqyq7yZs502K1g75mZjXLBiXHcqbSK8eS0DnNkGC
         yznFPVSHeHA+TNHA6SIYUqwQ3Op8BHl/jtg3i017HCI07jaO4zHwVYsPI9rqoCkeQVJK
         w+7Ph+l08i2aaLGU3fJOpnsIumnmHj7y58WT3oh9GM8dpf/gHaNoqSCjTEr6n7MohZPu
         atyPGRQMNMvkS8o+SsJe5LAMHX86T7qFxk1iZrDX1MrKAUVcMPX07BxK8ZGtTuISm5qo
         3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736273335; x=1736878135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ses48oObRa/xC0inmVs0sVNcKOLmiM/3m76WwOoKMec=;
        b=U4kyIuSmtraiIL+RJjbKSorXTkbjOHRXQfKHETKGgRB2zugQ+2g2AnMPHZs/F+DSV0
         mdqGgyvWK3njLElElJB+OsQgvwHjVdHusXfE1ZqFfJw/xMPay3L/aHW5uvaxkgyk3egd
         iZNNkXU6SqOxMKzvILZiKkhxp4bQCzI1cWC9A8mOEXdnbEk1M4G0nuM+Mmw4lltYU6KJ
         wWh0YsI2P83yDd1I1tSdVbaFQVTufhZearYOtnv/se4fgsoAr6uT+x76KalDUhS/lO6q
         6NZaAgIl7g5lyyRt3paxmnYJk7ywd8Q7YiDXjYh2CMDs3tv99JCPM8MIthobgkSTKIv1
         7w0Q==
X-Gm-Message-State: AOJu0Yy3bzjG0gMIpI0AdrDe5mfuQ1hmja7/jxJOls8yzCAvjUy71e2v
	X5m3UcuKNq/CHPYKGh9w0a+mBk34nolpgG+K2f3IWwPWwWrabqaLxp4p9+w8/k1oi6KMLASzlUZ
	LGvo=
X-Gm-Gg: ASbGncuyl8iNnv+EIdMDB6r11T9QZ3sPH4R4sBg2dTrShl55hKmnBbJZdLDNmA+4l6r
	2VU6EIhMcfnDQeL8mW+64o92z1nE+BlJ+vXeCBT6NeUGS2c5xsTUqXUMfCXO0X1fwhhzkFbFyI5
	uORjfOl6bmz1h2WH/o1/Lsrm/F0nzI52wSQv5fbbG4Y9xEyNbKz4R/HBbv/WqGkBakg1DJhKHiA
	FuVGd08ysg9Uhx5NVQBlfcO47NnaILH/8OnD5NX4qdmOw==
X-Google-Smtp-Source: AGHT+IF3zjp7mBcq8BzdsAo4BN7b1e8EWWhFfhx7M+nJULDym+CeP4d9hB6IPPWZay+SbOh+2GO/5g==
X-Received: by 2002:a17:90b:5208:b0:2ee:dcf6:1c8f with SMTP id 98e67ed59e1d1-2f452e1814bmr99016954a91.16.1736273334716;
        Tue, 07 Jan 2025 10:08:54 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f4413sm314166335ad.172.2025.01.07.10.08.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 10:08:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/19] gstreamer1.0-plugins-good: Fix CVE-2024-47606
Date: Tue,  7 Jan 2025 10:08:24 -0800
Message-ID: <4c138c3c04f856b100ce2c8e8e96025edde4c841.1736273200.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736273200.git.steve@sakoman.com>
References: <cover.1736273200.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 18:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209487

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2024-47606.patch                      | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47606.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47606.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47606.patch
new file mode 100644
index 0000000000..fe4bdc8802
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2024-47606.patch
@@ -0,0 +1,44 @@
+From f8e398c46fc074f266edb3f20479c0ca31b52448 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Thu, 26 Sep 2024 22:16:06 +0300
+Subject: [PATCH] qtdemux: Avoid integer overflow when parsing Theora extension
+
+Thanks to Antonio Morales for finding and reporting the issue.
+
+Fixes GHSL-2024-166
+Fixes https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/3851
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/f8e398c46fc074f266edb3f20479c0ca31b52448]
+CVE: CVE-2024-47606
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ subprojects/gst-plugins-good/gst/isomp4/qtdemux.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c b/subprojects/gst-plugins-good/gst/isomp4/qtdemux.c
+index 5e3cb1b9e699..c2d8b5e0f134 100644
+--- a/gst/isomp4/qtdemux.c
++++ b/gst/isomp4/qtdemux.c
+@@ -8822,7 +8822,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+   end -= 8;
+ 
+   while (buf < end) {
+-    gint size;
++    guint32 size;
+     guint32 type;
+ 
+     size = QT_UINT32 (buf);
+@@ -8830,7 +8830,7 @@ qtdemux_parse_theora_extension (GstQTDemux * qtdemux, QtDemuxStream * stream,
+ 
+     GST_LOG_OBJECT (qtdemux, "%p %p", buf, end);
+ 
+-    if (buf + size > end || size <= 0)
++    if (end - buf < size || size < 8)
+       break;
+ 
+     buf += 8;
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
index f57797d236..ab14dea58d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://CVE-2024-47540_47601_47602_47603_47834-5.patch \
            file://CVE-2024-47540_47601_47602_47603_47834-6.patch \
            file://CVE-2024-47540_47601_47602_47603_47834-7.patch \
+           file://CVE-2024-47606.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.43.0


