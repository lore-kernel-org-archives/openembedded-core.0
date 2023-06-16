Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26004EB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:29 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.248.1686926246707671185
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3ytSdGRL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b52e55f45bso5118205ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926246; x=1689518246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuWFSOoTMrd3sbyRARheru8XtajYoW+LWV6ZPoWjwuU=;
        b=3ytSdGRLPuml5YI4cAuKC6zrRL1POd/VYAwOLyK1yplz1gq8p9+eW/JXI94AVFcKOb
         1s6cseWHbGexvKhFaeXmG1KQFR6jO2UVZH8zptJVtfCsb1bUUwMCPGjL9GuaXTgOqyV2
         aJ51zB6hjdEVWt3MBL4JnDY9pBy8H+DZuhBnJNGybBJv5VLFtCY+Z44HGIu0bsQxs5tk
         ii/So9JOu9Grur0kMwTXenTROyMIcpffrhQBMK4KXXcgO+TfCRxPrmV91QVAW8FS+Rbg
         I+FlO1bbibLQc/TnqMUDt2SAgF3HSHPUVFdcaEdCRZDStCXbaH4k+BoUcP5HUKFXe5gw
         6VCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926246; x=1689518246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zuWFSOoTMrd3sbyRARheru8XtajYoW+LWV6ZPoWjwuU=;
        b=kalhXFDv7MMJmoT9/6bT5Vslibjz6Cbogoidk76hBq9Isehgb1SjnLBr3sSmJQRnlZ
         hws9VSRhOieAgEyfRIl1hcFrgxqKLUiR4+S547rJPQpR4kUd8Fy5S8ah5+9JeJFt5nvC
         7XAyJcUGZvq5lb/9gqapBTV0hHdU3llZBdBGnIIDkwcuzPpz/syGdqaBbC3lj7dts66K
         n4tZJdI9L27gVhewr/AEfIbZIFY3c64tnR23aqZ2CHzAR01MiURA/SMwoE7u1xlsgasf
         EFQc7viHHLA6J4rSsYqx69eVVOV+naGBw3LBsd+LXVsNCu/RvJ3zOs8+/nzARd0P+yfp
         10YQ==
X-Gm-Message-State: AC+VfDx3RXDf5GbDP2FFCol5IyebjwPCa0CmnftNPv5idK/Kj5ye/91Q
	T7Xl4FguhwbyJzEelwkNg74o30vmHt+uGb/fB+Q=
X-Google-Smtp-Source: ACHHUZ6tRpqCArjiBevxkdSvwCmhhs5Yx+m0YxNzBVS1xed0Ruw1D8+21QgTbV5eEmUP36LLOkXlfQ==
X-Received: by 2002:a17:902:c1ca:b0:1af:fe12:4e18 with SMTP id c10-20020a170902c1ca00b001affe124e18mr1969023plc.20.1686926245711;
        Fri, 16 Jun 2023 07:37:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/24] tiff: backport a fix for CVE-2023-2731
Date: Fri, 16 Jun 2023 04:36:53 -1000
Message-Id: <1430f2f7aa774c3deb54dca8b8252d31ab5a513c.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183023

From: Natasha Bailey <nat.bailey@windriver.com>

This patch fixes an issue in libtiff's LZWDecode function which could cause a null pointer dereference.

Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7da5abf23232f61bf8009b4b8e97632768867e07)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/files/CVE-2023-2731.patch         | 39 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  4 +-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
new file mode 100644
index 0000000000..7db0a35f72
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
@@ -0,0 +1,39 @@
+From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 29 Apr 2023 12:20:46 +0200
+Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from a
+ strip whith a missing end-of-information marker (fixes #548)
+
+CVE: CVE-2023-2731
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b]
+
+---
+ libtiff/tif_lzw.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
+index ba75a07e..d631fa10 100644
+--- a/libtiff/tif_lzw.c
++++ b/libtiff/tif_lzw.c
+@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsize_t occ0, uint16_t s)
+ 
+     if (sp->read_error)
+     {
++        TIFFErrorExtR(tif, module,
++                      "LZWDecode: Scanline %" PRIu32 " cannot be read due to "
++                      "previous error",
++                      tif->tif_row);
+         return 0;
+     }
+ 
+@@ -742,6 +746,7 @@ after_loop:
+     return (1);
+ 
+ no_eoi:
++    sp->read_error = 1;
+     TIFFErrorExtR(tif, module,
+                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI code",
+                   tif->tif_curstrip);
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
index f8a2482a84..ca4a3eff91 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2022-48281.patch"
+           file://CVE-2022-48281.patch \
+           file://CVE-2023-2731.patch \
+"
 
 SRC_URI[sha256sum] = "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb622727b5b08c423464"
 
-- 
2.34.1


