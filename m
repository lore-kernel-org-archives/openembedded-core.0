Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B406E77188
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 13:33:59 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.7796.1735824836364694921
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 05:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KytkRkhm;
 spf=pass (domain: mvista.com, ip: 209.85.166.43, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844e161a8b4so346290839f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 05:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1735824835; x=1736429635; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AjDXvwT1gCtlmK3L1awdH9Y3uAh0UKikyktYxK9qM4=;
        b=KytkRkhmcb4hED01jvzjIbKvOn869oqVh8+/8R3CfuQs9XguUG+7IyC0H0TCAajZWV
         VOqdsP0g1wyVXlObiI21urOB1ydIVJQvbMa07iY985lp5iwxF/4vKaq+Qh3We4yUHbEX
         bMTmR3hADE//LMFGH6NEWdz+FHzWlG7rymxyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735824835; x=1736429635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AjDXvwT1gCtlmK3L1awdH9Y3uAh0UKikyktYxK9qM4=;
        b=WSk4Sm53aj7KA9bVACv1HxLY2b3q3uksz9NhEiQfGQS2IRTgA7+qXUhOvWXms+jyy9
         6bJ5tL4AeJBItcoBVAfZEzb1iT0/7+rXpPu2rgDRIBNYfQfD22uuevMmj2c7pTgnheX4
         EZhRCIqpRVLhzTIrgV2fx7zWASJPb1y6UTmqCCJ2Gc0lRazIm1vn+s+plpeQiwe/xILn
         hTD3eLobaIQvkZASuV4qdQkyVYWqzhsDsWewgPalpvYC0eFeSkHnV6bH7EZZhFeZwZw+
         AeAELD9aGpeYH4pOTxMlPDKW5HRwos5RW0TosAUf5io8pHtvVpqe9mgiok+S86aqzwSI
         PokA==
X-Gm-Message-State: AOJu0YztZ5gaV6JPyRXHLzQTKfyt+fEQVY7SArOJz8SbaHtKD1fjmrjo
	3ucxVAcA7VEnPT73Jk8eouEhOhoD1MqNStF//f6pNqeQ0r6YmP66qfF9rotdbydRC5rulkEwaAZ
	33g8=
X-Gm-Gg: ASbGnctMhxaK1Lcctv9WmUIdr+C4/pT52bekXO2UPQ0P1dTIMqVjnp0iQXi3TBWgmhD
	CoJzy9YFTHIL25ptSs81wPEzIzEUlKb6EYs8peRbJIgkyluYKKPr6U5lO6PqSqt6B+DQWBYB+9a
	ZGAJG7jqh6GVb8r3csukvf58ofd6ZdKH3HU3Le3tks7PcJNfDfOx40oILLIbVh/SEs2JHZ7CKyV
	UGKhyduX0IXWDkAr5PPbhGfO7Xos9sIYoZu+6faWGONPYShoeu4bywQOfbXd/tyUVB1KuI=
X-Google-Smtp-Source: AGHT+IHO9p7m+nY0VNz6GyEUTjsK/yy+ZsJcEfTl/RPxtUISVZp6bor4/JIKPY246RgLZxPKzvwi0w==
X-Received: by 2002:a05:6602:3fd5:b0:843:eb5b:5293 with SMTP id ca18e2360f4ac-8499e4d79c9mr4011829739f.2.1735824835181;
        Thu, 02 Jan 2025 05:33:55 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:79d6:d2bf:f7c6:a6fe:8968])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8498d8aa81bsm685493139f.36.2025.01.02.05.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 05:33:53 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/7] gstreamer1.0-plugins-good: Fix CVE-2024-47606
Date: Thu,  2 Jan 2025 19:03:15 +0530
Message-Id: <20250102133318.642859-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102133318.642859-1-vanusuri@mvista.com>
References: <20250102133318.642859-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 13:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209306

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...teger-overflow-when-parsing-Theora-e.patch | 44 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.20.7.bb       |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
new file mode 100644
index 0000000000..fe4bdc8802
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch
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
index deea4f8bce..8b9354aec2 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.7.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0019-matroskademux-Skip-over-laces-directly-when-postproc.patch \
            file://0020-matroskademux-Skip-over-zero-sized-Xiph-stream-heade.patch \
            file://0021-matroskademux-Put-a-copy-of-the-codec-data-into-the-.patch \
+           file://0022-qtdemux-Avoid-integer-overflow-when-parsing-Theora-e.patch \
            "
 
 SRC_URI[sha256sum] = "599f093cc833a1e346939ab6e78a3f8046855b6da13520aae80dd385434f4ab2"
-- 
2.25.1


