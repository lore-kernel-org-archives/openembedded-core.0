Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.75.1616341556264979874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 08:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZEOXZxIj;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 12so8099083wmf.5
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 08:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uLNkwt0AT7OV5aiXeEIqfubV37kV/FBNNXAjtHtBDc8=;
        b=ZEOXZxIjsjp7KfWdqGcrreZ30F2HSQ6zRGwE0WCOIWuWQ71h5B+ADO5/I5G7mRoGu0
         6expvHE1UXfBeITmQF+Y9kJ4XhI8tKAtlCfTDI1omByIscQNrAwPrVnVKMLzXqLUJkBB
         CCndSnPGckoRj7xvrbL3NtNMRQOG42t0Z+4yOJhqXGUBUOSzmQB6VfXP8eb6dZ1dthmY
         4wXQXpCOnwCHt5dvGLHPZo8mN2zti+P3l5sOZIM2vNMuozi39yiQoXKhQbBuR4eyGVZZ
         hJG2J9SDrjW+/evi8qqpdF10OfHbRN3xbCy89HlwsKQG/rqskOmoWNqPBUFw1bLvwVuF
         0jFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uLNkwt0AT7OV5aiXeEIqfubV37kV/FBNNXAjtHtBDc8=;
        b=QMvMNxsNQ5f/GkUgB67ipHr40TbzSX62I2xRDFdtdM0AB/6gCv6SkCF/31ydDQKmmU
         VmramFT00bgE42fKCT7TS6xPiTEICMYOuk3/LHWuU/XOfayHLcaOyi4oevfaPAtWy5g6
         c7MQZb8iC0oRb5FRCsbDkCKg/EDc+uIOtWqbQp/P8dYUMaiQkU5pMTPJwrvfGkVrIcXW
         3SmcEDtqZTPxLE5zRGothbiwwscqvOrTL3RR3abY1ZwVvLh3EHbEldT14GrE0G4yKHWx
         w+vVrUWSttilaJXuhaOBzChDmEeqcPgZ/XydmnuCIxQ/Z4EFJgxxbl+1XlhGWJiFclGU
         2xxw==
X-Gm-Message-State: AOAM531WMeDZ+UkVcYAULcYz7Hq02no1lmLwKFUdk5adabiLJdfLTFsJ
	Akl11gNRFAkE2HXewhzmXrKnirF5nmrMyA==
X-Google-Smtp-Source: ABdhPJweAH2rJ2IlatxUC35Jq4hs3C84U1rNsHMfwMWF6SsBPK8NwIWAo0xdneU29xwc52pH+XGgTg==
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr11843815wmi.183.1616341554788;
        Sun, 21 Mar 2021 08:45:54 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan ([2001:818:e32f:d200:8e8c:aaff:fe9f:1141])
        by smtp.gmail.com with ESMTPSA id g9sm17169946wrp.14.2021.03.21.08.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 08:45:54 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-plugins-good: fix rtpjitterbuffer regression
Date: Sun, 21 Mar 2021 15:46:04 +0000
Message-Id: <20210321154604.818098-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210321154604.818098-1-quaresma.jose@gmail.com>
References: <20210321154604.818098-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to an off-by-one when parsing the string, the most significant digit
or the clock offset was skipped when parsing the offset.

https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/910

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...Fix-parsing-of-the-mediaclk-direct-f.patch | 33 +++++++++++++++++++
 .../gstreamer1.0-plugins-good_1.18.4.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
new file mode 100644
index 0000000000..14a9fe23aa
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch
@@ -0,0 +1,33 @@
+From ec1949dffd931d0ec7e4f67108a08ab1e2af0cfe Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 16 Mar 2021 19:25:36 +0200
+Subject: [PATCH] rtpjitterbuffer: Fix parsing of the mediaclk:direct= field
+
+Due to an off-by-one when parsing the string, the most significant digit
+or the clock offset was skipped when parsing the offset.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/merge_requests/910>
+
+Upstream-Status: Backport [b5bb4ede3a42273fafc1054f9cf106ca527e3c26]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ gst/rtpmanager/gstrtpjitterbuffer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst/rtpmanager/gstrtpjitterbuffer.c b/gst/rtpmanager/gstrtpjitterbuffer.c
+index 60d8ad875..02fe15adc 100644
+--- a/gst/rtpmanager/gstrtpjitterbuffer.c
++++ b/gst/rtpmanager/gstrtpjitterbuffer.c
+@@ -1534,7 +1534,7 @@ gst_jitter_buffer_sink_parse_caps (GstRtpJitterBuffer * jitterbuffer,
+       GST_DEBUG_OBJECT (jitterbuffer, "Got media clock %s", mediaclk);
+ 
+       if (!g_str_has_prefix (mediaclk, "direct=") ||
+-          !g_ascii_string_to_unsigned (&mediaclk[8], 10, 0, G_MAXUINT64,
++          !g_ascii_string_to_unsigned (&mediaclk[7], 10, 0, G_MAXUINT64,
+               &clock_offset, NULL))
+         GST_FIXME_OBJECT (jitterbuffer, "Unsupported media clock");
+       if (strstr (mediaclk, "rate=") != NULL) {
+-- 
+2.31.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
index 9fdc31549f..07cacdc68a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.18.4.bb
@@ -6,6 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz \
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
+           file://0002-rtpjitterbuffer-Fix-parsing-of-the-mediaclk-direct-f.patch \
            "
 
 SRC_URI[sha256sum] = "b6e50e3a9bbcd56ee6ec71c33aa8332cc9c926b0c1fae995aac8b3040ebe39b0"
-- 
2.31.0

