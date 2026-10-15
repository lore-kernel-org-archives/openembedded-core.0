Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA81CC6B3D
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:51 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32434.1792040626879075343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TT8U754z;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10416665e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040625; x=1792645425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k91KfJ0wbhI03nb6UeIKe9ucn/GRfTFZ+SNVA40zVQ4=;
        b=TT8U754zyI19PsmAvOGbByj7I/53G/wHQ2xgSq0jb2ZqeN0H5BM8Dfp5OsJKjd2WFj
         NwScmUOdm+d/kXHNuy/UT5n0G1mNAY6t6DsiyEHZ1OF5BdTrUqHuMjlam9bI0zuHDOra
         2mxGv4oRC8FS5bTyccf9DYFnc9D820FNBfHP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040625; x=1792645425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k91KfJ0wbhI03nb6UeIKe9ucn/GRfTFZ+SNVA40zVQ4=;
        b=sgPSucCp/Y79Uo39IKO9N1OuuieCjU71LPhoyJj+6XslD7n/sWFYD3xh+dtKMoJCDf
         MweiyK1uTbJxVsG5MeTFwAP0h6IAQxMfQSER6tFoD0ZAEroL8myqHMK20HVKT/h5V9N4
         ZHhiU3sBVBL96G+WOyhokriLokSzUbcsgb/RvVd+mG6OS+xX/OCWneq4VNGtW7B1F/cN
         0DnytwJAVkiKGRnNEVSOmpNfHQXW8D6FbJd9lTnRywfhuVygD210I6BpS9dqHq0iVEIh
         23A4DUjlWrCAvv5U6jNtwb6rgI99ELOYooXTkXrU2J67pqizQx7gpRCLyf7L4Xltc5y1
         9gfQ==
X-Gm-Message-State: AFq9FYLTZno/BMruInmoaPKMcMKSXlG6X5ZmE7xbmt2dTwxulbE8FRND
	X1O9oocFurDRfnXhVwx9LmIfagwgIhKT3G0jnxU1KY1BtDQIslZ8Ms3abQjuSCSWNK/D8X9zeJx
	nPrDpZ9Y=
X-Gm-Gg: AYBFou1F+ERAPOYaJ0DLGQapeKlXtoK7ohJ65bCeDjZA3S+sdZKZO1Df/UmniQucqAd
	tiX2NkMvszFmeGNfzs36VL9gb0WwE9qCtPT7vjTwhA6pAAHcdo2nsgFj5Q7y2eUH2G2BWZoFNWx
	ac20LqruAxqDr6wM9u91MDyL6UGUfwHirbcjZlp6HC6SzIAiptTJAKwxb7qeFRdc/8M2lgRLINJ
	Q8+OeIF78hsucyWf7v6cbtRF8URidSVX4Pt4RJqnRcxJe/9OpwPp2OGwoXRo8eAhmESNzzH6M/i
	g3x9pS0njek/1jUP+qtcHKKXE+bzYj7yTU7i6GvMGQuQailViIzPoteFgI9+cOvilXyCqco6G2A
	F3WF84K+GVds+mRu5iQIqV9xfgKKji277J4u88aVIllVAOx1PrktMLB5AeBhz2HlWmJXK/PtPJy
	EOr0p3BfcUCh5eenoovSSQJm+8AAvtVaSfdy0ZHHpCRxKCxeXHhNU+LkLA1RtMtHGgmbDerK16G
	Ds6am9AooRgt1eXGECJM/6BY4srpARVJfWCJPkExD/sBWyZpl7zhfSzcHubNr0u+p6dqxsgMQ==
X-Received: by 2002:a05:600c:8509:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a18e47a8cdmr335992075e9.5.1792040624961;
        Wed, 14 Oct 2026 22:03:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:44 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/55] libpng: patch CVE-2026-33416 regression
Date: Thu, 15 Oct 2026 07:02:33 +0200
Message-ID: <333878e97547b6aeaa69691e4827af54ac838045.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247808

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-33416

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/files/CVE-2026-33416-05.patch      | 58 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-33416-05.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-33416-05.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-05.patch
new file mode 100644
index 00000000000..c42f2213b35
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-33416-05.patch
@@ -0,0 +1,58 @@
+From d4c4e49eb5c8981075ec2cd946428758c0cda6ac Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Wed, 15 Apr 2026 14:58:35 +0300
+Subject: [PATCH] fix: Sync `info_ptr->palette` unconditionally after in-place
+ transforms
+
+The palette sync in `png_read_transform_info` was guarded by
+`if (transformations != 0)`, but the palette-modifying transforms clear
+their own bits before this function gets to run. When one of these was
+the sole transform, the guard was false and the sync was skipped, which
+caused `png_get_PLTE` to return stale palette data.
+
+Drop this guard.
+
+This was a regression from commit c1b0318b39 (version 1.6.56).
+
+Reported-by: ralfjunker <ralfjunker@users.noreply.github.com>
+Resolves: https://github.com/pnggroup/libpng/issues/848
+
+CVE: CVE-2026-33416
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/d4c4e49eb5c8981075ec2cd946428758c0cda6ac]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngrtran.c | 20 ++++++++------------
+ 1 file changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/pngrtran.c b/pngrtran.c
+index 1b04cafa5..0ac8df749 100644
+--- a/pngrtran.c
++++ b/pngrtran.c
+@@ -1984,19 +1984,15 @@ png_read_transform_info(png_structrp png_ptr, png_inforp info_ptr)
+ {
+    png_debug(1, "in png_read_transform_info");
+ 
+-   if (png_ptr->transformations != 0)
++   if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE &&
++       info_ptr->palette != NULL && png_ptr->palette != NULL)
+    {
+-      if (info_ptr->color_type == PNG_COLOR_TYPE_PALETTE &&
+-          info_ptr->palette != NULL && png_ptr->palette != NULL)
+-      {
+-         /* Sync info_ptr->palette with png_ptr->palette.
+-          * The function png_init_read_transformations may have modified
+-          * png_ptr->palette in place (e.g. for gamma correction or for
+-          * background compositing).
+-          */
+-         memcpy(info_ptr->palette, png_ptr->palette,
+-             PNG_MAX_PALETTE_LENGTH * (sizeof (png_color)));
+-      }
++      /* Sync info_ptr->palette with png_ptr->palette, which may
++       * have been modified by png_init_read_transformations
++       * (e.g. for gamma correction or background compositing).
++       */
++      memcpy(info_ptr->palette, png_ptr->palette,
++          PNG_MAX_PALETTE_LENGTH * (sizeof (png_color)));
+    }
+ 
+ #ifdef PNG_READ_EXPAND_SUPPORTED
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index b226e327b64..f375aa5f4e9 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -31,6 +31,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2026-33416-04.patch \
            file://CVE-2026-34757_p1.patch \
            file://CVE-2026-34757_p2.patch \
+           file://CVE-2026-33416-05.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

