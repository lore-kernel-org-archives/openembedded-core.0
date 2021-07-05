Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.8601.1625478094737303622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 02:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XJ/a2hNz;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: flowergom@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id h1-20020a17090a3d01b0290172d33bb8bcso1987851pjc.0
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 02:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KyWB4drtz5NXq3lxZYSTgul4FNKvikVn5RZ5rlTbATE=;
        b=XJ/a2hNz68fgk329/PesZeZKidC8z5eXEp6IOzHrr5qexJieiILnDcgBte2P59t95e
         n05SRz0nkG4KC8BbZIvHWqoodJXDfF1cx1kH/JDoImSK8mZzUyNXMKCkqhZfOkamgJOS
         NfX+JEGNp0xgeTb9H5/6eHvFAJ1hj8tNf1+aSYT7yLr6nCaFMPVIRqsiZqhTDSPBBgxC
         3vZj29I5HndkPN/7eYExH1oMEN4ocvkbuHCr1ie+h+ae8ML9uNMVfW+aFsdTRGluU0vL
         sgwF7BBW7FKwTEH9sSq9Xz7a0kL2v++6yr/Ben/Au/ouL8tACCpV1IRwCvWXen2MeVcg
         Ip6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KyWB4drtz5NXq3lxZYSTgul4FNKvikVn5RZ5rlTbATE=;
        b=Uv4d/T0zxeJXsUxVLDvfZKgGnE+9vF+SoFlT94IkS2ZR4IVxXKbsgu6BLK8OafERCo
         337iNp8fEAoj8JnYcMtf+M+t5A3BDT7+DYl1yKU3QS68R4IJAhhdvSYKaSGPaXNDJm9W
         SeAxaN8PIrNuk0wshLa67P9U+RwPJ7TFzRRdyT+tSm1zoyQqPwW7k3/5UExSq3dgetYk
         4TZQ1GtgWHZxVgsL056c0CMTXaLtv9QW13EF5PIInc8mvfaAgsfCJyrGgKG1aPg1Fhab
         CsbN+FAQ5tVDzbSIv0114DBhRNRpO5OCSnKTHw57a9wByfKF8lAQu36CYn7Yf7r1Vdvz
         nVPw==
X-Gm-Message-State: AOAM532DS8wqqR0H0OuWMCfuFkHOhz/2NnTZFWdsxQDGxieL/Qnvix53
	sBYsq+kVbGXgcA2lL7KoyftbDApT7yGZrtf/
X-Google-Smtp-Source: ABdhPJxu1Yg1PKKPTBKSm1fVGQzh8Q8GAOsLOxYLoahVEHl86HG4ieWURoJ2020dvFP7X+fhxEkCuQ==
X-Received: by 2002:a17:90a:c28a:: with SMTP id f10mr14963933pjt.15.1625478093993;
        Mon, 05 Jul 2021 02:41:33 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id bx12sm10850302pjb.22.2021.07.05.02.41.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jul 2021 02:41:33 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] gstreamer-plugins-base: fix CVE-2021-3522
Date: Mon,  5 Jul 2021 18:41:13 +0900
Message-Id: <20210705094113.1053-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Out-of-bounds read in ID3v2 tag parsing

reference:
https://gstreamer.freedesktop.org/security/sa-2021-0001.html
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
2.24.3 (Apple Git-128)

