Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103FFCD3427
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 19:53:27 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23681.1777924396846334661
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 12:53:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ckdLyoJg;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026050419531423618f36bf0002073d-ddtltj@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026050419531423618f36bf0002073d
        for <openembedded-core@lists.openembedded.org>;
        Mon, 04 May 2026 21:53:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=+W8G/ehp9wWBo7IwZu8iuQJhp/nTnWGQcuCimqrIenc=;
 b=ckdLyoJg44yppB5yImXwlpK4IRzPwowAdSme27onHuvc8S+SuGyYKf6gUusxsd5TPWIVT5
 SiqIsG6pcpuVzMtbCLkG8HOkhfHCi/RZ1LNZy7SWXQN2h7KiOBLrOfljACWzwwnSrrBnWk6o
 lXVpLEeQJyC0uBUDjm5Vaf/8ux1eG6EwJiHfSlnlP8E1PPwO+l968eKz6PwBP3LiVqHaXG8A
 PZ09h5D+1LKXQpZJ+0BanmkGNZc23V45BduMqgZN2WFCQzgAxgPfTaahjWAy0YcP43zSlejC
 yfqhqd3rbmoHXHVLTEje/YWNZ+QVg10dEuNPmn8k2cG/3XBVfrCTdNVw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 1/5] tiff: patch CVE-2026-4775
Date: Mon,  4 May 2026 21:52:42 +0200
Message-ID: <20260504195246.1190112-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 19:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236453

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-4775

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libtiff/tiff/CVE-2026-4775.patch          | 55 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.7.1.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
new file mode 100644
index 0000000000..1f3c026b28
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch
@@ -0,0 +1,55 @@
+From 782a11d6b5b61c6dc21e714950a4af5bf89f023c Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 22 Feb 2026 23:32:47 +0100
+Subject: [PATCH] TIFFReadRGBAImage(): prevent integer overflow and later heap
+ overflow on images with huge width in YCbCr tile decoding functions
+
+Fixes https://gitlab.com/libtiff/libtiff/-/issues/787
+
+CVE: CVE-2026-4775
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/782a11d6b5b61c6dc21e714950a4af5bf89f023c]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 4543ddda..fa82d091 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -2216,7 +2216,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+     uint32_t *cp1 = cp + w + toskew;
+     uint32_t *cp2 = cp1 + w + toskew;
+     uint32_t *cp3 = cp2 + w + toskew;
+-    int32_t incr = 3 * w + 4 * toskew;
++    const tmsize_t incr = 3 * (tmsize_t)w + 4 * (tmsize_t)toskew;
+ 
+     (void)y;
+     /* adjust fromskew */
+@@ -2356,7 +2356,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr44tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr42tile)
+ {
+     uint32_t *cp1 = cp + w + toskew;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+ 
+     (void)y;
+     fromskew = (fromskew / 4) * (4 * 2 + 2);
+@@ -2512,7 +2512,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr41tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr22tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 2) * (2 * 2 + 2);
+     cp2 = cp + w + toskew;
+@@ -2615,7 +2615,7 @@ DECLAREContigPutFunc(putcontig8bitYCbCr21tile)
+ DECLAREContigPutFunc(putcontig8bitYCbCr12tile)
+ {
+     uint32_t *cp2;
+-    int32_t incr = 2 * toskew + w;
++    const tmsize_t incr = 2 * (tmsize_t)toskew + w;
+     (void)y;
+     fromskew = (fromskew / 1) * (1 * 2 + 2);
+     cp2 = cp + w + toskew;
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
index 0d4b3a4abd..750565e11c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ab490c3088a0acff254eb2f8c577547"
 CVE_PRODUCT = "libtiff"
 
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
+        file://CVE-2026-4775.patch \
 	   "
 
 SRC_URI[sha256sum] = "f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69"

