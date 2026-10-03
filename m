Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A1ECA5FDD
	for <webhook@archiver.kernel.org>; Sat,  3 Oct 2026 10:01:14 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2977.1791021666221333554
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Oct 2026 03:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DQ50th7U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2026100310010425d7d48fa900020762-5v9qwj@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2026100310010425d7d48fa900020762
        for <openembedded-core@lists.openembedded.org>;
        Sat, 03 Oct 2026 12:01:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=q3BvBWkrgNFZyUrKDT9ZyswYux6rv3LOUKbPHmu2rRo=;
 b=DQ50th7UbimExw1Gg8DqdARykVYjsQeS/fDoOlmFK/WDnVWOfT2IsBFnLbOC9eVBcKlaO7
 SAgZTI+QTmBcs9qulWm7xfi9kXVcOdEIX0t3ovIHWcLZ0/heIgENcFQD8Q/SRnnXftCYgt31
 O4vX3G8BifZlwA2BOrraHzJ374zOc3nfjvWt0P2+uh4Ml5odPhjXkA3nFXAFODn6oFLM+6tf
 +w1ILqAdpTs/tY89YL9bSaCu3Sxc4U9J6HpzxMQd1Q/QbGpiGHxdcV1UL1pUnFdlb6wUB2tT
 LjEK5XIxbht9jIWRlSa7I2G3CGrGEW4iPcSlSk5A9+/9UA/FfWmT538g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/2] libpng: patch CVE-2026-33416 regression
Date: Sat,  3 Oct 2026 12:00:43 +0200
Message-ID: <20261003100044.3979222-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Oct 2026 10:01:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247155

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-33416

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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

