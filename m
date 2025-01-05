Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94528E77197
	for <webhook@archiver.kernel.org>; Sun,  5 Jan 2025 05:44:11 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.33635.1736055846077168849
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jan 2025 21:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=i5lSMKc6;
 spf=pass (domain: mvista.com, ip: 209.85.166.53, mailfrom: vanusuri@mvista.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844ee43460aso1077558639f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Jan 2025 21:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1736055845; x=1736660645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHM7+7VYhWmrU+Fr30wI1iBcjHaEbGdcyNiOItpD6Dk=;
        b=i5lSMKc6ISS3Q9H2RytREa9FcjzK2gNAiszXO+y2INXraEeArBZudneieuYNykw1jo
         7za3JsKWpuxcKJzEDeI/bZx2E9gskKmGflcRdC1Fmf74RjaZ1ndK7tw29GxuNspnwxEa
         6XbNACMsZ9U8O8wn3qC9v3upQujOHEk8wEzbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736055845; x=1736660645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHM7+7VYhWmrU+Fr30wI1iBcjHaEbGdcyNiOItpD6Dk=;
        b=Pnm001g6hZothQDT4LZ/4hqNigJTws0suHC/mLZdZkWxdMnmURbY/7JGWpqRGMRg3b
         HI9qXbu7hQNgN7mNstjnT8ltHznGxsei6D6lh9goSV3d979gZJsfbFj5N76zg6yCKpsS
         OX9GKdms6Vp8uC+ARQGubsOZSFDPkhFYFpgmY8e7hBGa4PmYVR5Gmaj43eo5d2W9/FlG
         eO8eOU/EqBUerNCBEX0p4vagr6s2Gsoqbla9cjai5rG71X+GaGugPnLiW3daSbP31WfV
         PaSkbQl6FcWKreEh/6z6L4e7vKtewhPL1GZ2eNtPJpEf93mospcHOwLPTe8FWlLhAkY/
         ersQ==
X-Gm-Message-State: AOJu0YxxedOMp1Xmfvl2IKtuigbZDdmzh488JUViNiT/anXuHotzhP0w
	DLQtvUA9DE66UWhcC+nsGBS0B2AUDU6nQ6hZ5ESmUrC4XojKmfgRE+5Wfo+PzsmUKrfqcnzdyNR
	lAm4=
X-Gm-Gg: ASbGncsm11hFToMQNLgJjF+3y7KVSyVlNg/sZxSsd6+eUFy5WC0raZpE3geTxlbpgxK
	zaijWGJJCBoC9pG1TNClq4GLt2Oa9EXdq+YOx++vIMOr9aNgqC2jrccAAJD2dfIxRf35EBaFwzP
	Iw07vfesk93ZhqAUeIV8Q8bbbi33YFxIl0OiwB4nIVFRSlD7HWuz3DXSN4+rDUPagRtNLIkqP6W
	EcBOMaHNs7Cz01/8pp70BIxb7zDWbYCyNkgOdMAn/dysRK/2UUVgFMOx3kDMT7O3W7EC5I=
X-Google-Smtp-Source: AGHT+IHw4qrJ5dV7EUAk4TINqQvIfVNglHW+uHtYwDvxY0n9D2wKzD0AFvPNvXwrbgxBNHGFM1vqZQ==
X-Received: by 2002:a05:6602:14d5:b0:83a:b500:3513 with SMTP id ca18e2360f4ac-8499e4ee9a6mr5139581439f.8.1736055844360;
        Sat, 04 Jan 2025 21:44:04 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882d:3521:fa4f:fd77:a73f:8749])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68bf66ed9sm8570467173.45.2025.01.04.21.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 21:44:03 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 6/9] gstreamer1.0-plugins-good: Fix CVE-2024-47606
Date: Sun,  5 Jan 2025 11:13:15 +0530
Message-Id: <20250105054318.222154-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250105054318.222154-1-vanusuri@mvista.com>
References: <20250105054318.222154-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jan 2025 05:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209411

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8032

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


