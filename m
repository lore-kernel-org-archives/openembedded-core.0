Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.519.1625524546709052550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KUN7bYLq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id x22-20020a9d6d960000b0290474a76f8bd4so18107550otp.5
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fNO68ia9CPHm9khPNaJi+3E9nboLR2WARVfel1EXjjo=;
        b=KUN7bYLqMdnD35k4BbnB9R4+lCLOafVQle+qXBqNDfOkBS4u/9GiH0aTnETvUEAdDO
         jMGIDbOpu+VesKfV/Mgsl+mwHM0I2TWDBmcevE3bRk3NqhcOCgNzGFkaoJU7UwOtwWB8
         Yz9LYb3rheu/VAAASM2UDQtFJl1VdhEKW3ulIOSBvPYFvSuliL7OE2N3mebWIHs8Rai+
         MmVUUkO0ERTAghPMxAyUMxn+48TIPl2GyY5rgMhyGaHN+pyINBx/9MZAjuszTCEjtrIu
         uP82QnxY4ussV3NOJS3s57pXzkQ0gQZb/ljuNiOhqqTiCvNA3dUCGF4fae9pzvUo5IKF
         swog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fNO68ia9CPHm9khPNaJi+3E9nboLR2WARVfel1EXjjo=;
        b=Bzwkk0SexbeWkDVqIiRbBngrDbu1/3aBhUD6v4200O04ftjxnIODcXGlQUrtr9Zynt
         F4cp4e8ELufJ8pPSD+XlblNeOrub6WJW92QRkf6MtOV/y/RxtrYSigOpB6P+PgGB7zQN
         WGw7Dj0L5GbwDdrATuMF3dpOXUMtJhAviFW51D8lNxbfiUKpVK5P0a1yO5r4xhaCbY5O
         31p2DS+4XO4i6TTEjB65/v8yd9zgWPrO9txpuTTWQ8e4fY8F2x/px+WBKWBpiB6ZjOh3
         MuPSpF8RoJcQaFGjsNCzGoGJOWEiGgPzHO48EMMp9WoSn2dJoWyKFyliAZG7sJxKMJCa
         kBiw==
X-Gm-Message-State: AOAM530vRL9QyqUoSnbyCc8ebuajqBmsc62sCGVFZ6AVA5+6/qAUQn7O
	3SsH/hMY4rryx222kgoTosSrXg+S+/b1eG1G
X-Google-Smtp-Source: ABdhPJz4XWuLOoMbjZ7UJIU40woq4kX7Nczk2t9WOhjSTKpOnopGHB32K7pRIq6L1MahyQkd7jWkkQ==
X-Received: by 2002:a9d:7547:: with SMTP id b7mr12640266otl.362.1625524545662;
        Mon, 05 Jul 2021 15:35:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/19] gstreamer-plugins-base: fix CVE-2021-3522
Date: Mon,  5 Jul 2021 12:34:41 -1000
Message-Id: <8cab9d3dd226e854d40e12df497456adc3d3f81d.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

Out-of-bounds read in ID3v2 tag parsing

reference:
https://gstreamer.freedesktop.org/security/sa-2021-0001.html
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2021-3522.patch                       | 36 +++++++++++++++++++
 .../gstreamer1.0-plugins-base_1.16.3.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch
new file mode 100644
index 0000000000..3717f0cf3a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch
@@ -0,0 +1,36 @@
+From 067e759136904b82bba9c6d1d781c4408dfecfe6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
+Date: Wed, 3 Mar 2021 01:08:25 +0000
+Subject: [PATCH] tag: id3v2: fix frame size check and potential invalid reads
+
+Check the right variable when checking if there's
+enough data left to read the frame size.
+
+Closes https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/issues/876
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gst-plugins-base/-/merge_requests/1066>
+
+Upstream-Status: Backport
+[https://gstreamer.freedesktop.org/security/sa-2021-0001.html]
+CVE: 	CVE-2021-3522
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ gst-libs/gst/tag/id3v2frames.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gst-libs/gst/tag/id3v2frames.c b/gst-libs/gst/tag/id3v2frames.c
+index 8e9f782..f39659b 100644
+--- a/gst-libs/gst/tag/id3v2frames.c
++++ b/gst-libs/gst/tag/id3v2frames.c
+@@ -109,7 +109,7 @@ id3v2_parse_frame (ID3TagsWorking * work)
+ 
+   if (work->frame_flags & (ID3V2_FRAME_FORMAT_COMPRESSION |
+           ID3V2_FRAME_FORMAT_DATA_LENGTH_INDICATOR)) {
+-    if (work->hdr.frame_data_size <= 4)
++    if (frame_data_size <= 4)
+       return FALSE;
+     if (ID3V2_VER_MAJOR (work->hdr.version) == 3) {
+       work->parse_size = GST_READ_UINT32_BE (frame_data);
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index f8f5caa94a..bcfdef3bbd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
             file://0003-ssaparse-enhance-SSA-text-lines-parsing.patch \
             file://0005-viv-fb-Make-sure-config.h-is-included.patch \
             file://0009-glimagesink-Downrank-to-marginal.patch \
+            file://CVE-2021-3522.patch \
             "
 SRC_URI[md5sum] = "e3ddb1bae9fb510b49a295f212f1e6e4"
 SRC_URI[sha256sum] = "9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c"
-- 
2.25.1

