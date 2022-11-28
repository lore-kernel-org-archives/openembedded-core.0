Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B25C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:02:02 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.127127.1669662120245817481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 11:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gmD2jtQL;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id z4so18511060wrr.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y30jK6v1VS+5jYvRZJCWfeLFtDmyuIVhO7R8XUacuy4=;
        b=gmD2jtQLzvJ8tAF2B9CYLJ73PLT9hGZ+LaT0MBYt0DefPkvT+31g+7SiVekgTpjDSQ
         DE+jUyq4cflUFlFaHQGrAlygAb9MLWkcO4XzqEZKZblOjwtukL9n/d39sN9v0SFldBLi
         kIpGYK2r5y/+rz1Aqv6P+7C9lkbrgMF9u0hKl3faiSunUM9wEWJRy4yJODGOql4on7dS
         OBCCOT/gV9Gb0OIbX0N89fNQ01u/UX5r/FJvZEJODvzECk0l6xWK3NmDrcF3TfqpxjU1
         9vf/ue42KKg5ix/sjpROZNb6jLrQ/0kJ976bCEHYZCkjCvUFajGlqmD0kQcY5Cqibuxj
         6kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y30jK6v1VS+5jYvRZJCWfeLFtDmyuIVhO7R8XUacuy4=;
        b=tvJyCS181riwSP4vWFY6Gdwx8SPnjkUd6LKDjgn1XlyFXwxTW6xlbgTCeGcqmlWVbl
         5trZvCYZjILFMLtJrqe53aYI0DfJWFjbnxJPFUYvOMrtcQ+4NKcbqgBhN2ey7R1glQcF
         TPcYfzmsQvZNUg11XoXI/iFp5rDQD4NUHepbm34kzAY/w/BJ4+2Jlw+p/hpbep5olWvB
         4DKDWc2VgSydmD0McAV3cZUKZrMnkR+U5mjeMJPbcP0uHIpHhbnttm9hdu06LXfmZoTf
         AzyZAHSfDbhDcl8SN7VIrk8pXITBLH6maru0MSaUCug3JnEVAGZZy44+qu1IfXE5Gy0s
         cnFg==
X-Gm-Message-State: ANoB5plNfnxaV84EFj9XAH6MjG7+h7F6QvAeSPCELXPDzvHF8WBk6ew9
	QwNpXfWP3xHRYa7EUTqGwW4wdwo8bB4=
X-Google-Smtp-Source: AA0mqf5eWfyilsq/bbApWOsqos+5JCzZzpA6OqXSNbOcXOB8UkXmh6g8MDmwPnlkw8qgs2IeMRtnmQ==
X-Received: by 2002:a5d:52d0:0:b0:241:c340:d1ea with SMTP id r16-20020a5d52d0000000b00241c340d1eamr25690662wrv.434.1669662118466;
        Mon, 28 Nov 2022 11:01:58 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003c83465ccbfsm20097361wmb.35.2022.11.28.11.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:01:58 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	"Qiu, Zheng" <Zheng.Qiu@windriver.com>,
	Zheng Qiu <zheng.qiu@windriver.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone 3/3] tiff: Security fix for CVE-2022-3970
Date: Mon, 28 Nov 2022 20:01:53 +0100
Message-Id: <20221128190153.2155592-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128190153.2155592-1-Martin.Jansa@gmail.com>
References: <20221128190153.2155592-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173941

From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
new file mode 100644
index 0000000000..3779ebf646
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 11c8026913e190b02266c1247e7a770e488d925e Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+Upstream-Status: Accepted
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a1b6570b..9a2e0c59 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3058,15 +3058,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index af9bdcfbde..b3737f962e 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
            file://CVE-2022-2953.patch \
+           file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.38.1


