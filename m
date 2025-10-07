Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4C9CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 22:12:09 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.2543.1759875128042327718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 15:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=ekQsjltS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202510072212023cae50e91c000207f4-qwp1ax@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202510072212023cae50e91c000207f4
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 00:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=+XIzqKPKcmWRrGqfgClTf1UHpa3s8+RssP3z83VkonE=;
 b=ekQsjltSA9f/4R2B5c789VQwvSMMHLzvjKJ2jvpUQ+fnIfcnzQIYjVuLvQzIwlB3mfkM7P
 /dz2oqboLEz2p5pLNu2EgPaHX0QbnmJiFjdI653heVVlCratbgrkHT+2un0JcLdU7p5PdY/A
 MspyvZUrRJgouSxcROQGJfXx1qdAu4KYh4+VDratJyFlOCP/iNof6DLvTRIx0wSKkMs063eL
 TkXBrYOHDMX9Yk/X2AwVjNJE9DYUYTp3qA+OqJd+fFbXK1TSifrevJZtSGh+Sasn+yXzg6ae
 7/ecNuHks4b4GJwUOcdg1RyuU/PUkqSTXcF+bqyLy+FoJkag2ukTZGNA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] ghostscript: patch CVE-2025-59800
Date: Wed,  8 Oct 2025 00:11:42 +0200
Message-Id: <20251007221142.2772021-3-peter.marko@siemens.com>
In-Reply-To: <20251007221142.2772021-1-peter.marko@siemens.com>
References: <20251007221142.2772021-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 22:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224573

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ghostscript/CVE-2025-59800.patch          | 36 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
new file mode 100644
index 0000000000..5d50865271
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
@@ -0,0 +1,36 @@
+From 176cf0188a2294bc307b8caec876f39412e58350 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 1 Jul 2025 10:31:17 +0100
+Subject: [PATCH] PDF OCR 8 bit device - avoid overflow
+
+Bug 708602 "Heap overflow in ocr_line8"
+
+Make sure the calculation of the required raster size does not overflow
+an int.
+
+CVE: CVE-2025-59800
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/176cf0188a2294bc307b8caec876f39412e58350]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/gdevpdfocr.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/devices/gdevpdfocr.c b/devices/gdevpdfocr.c
+index f27dc11db..6362f4104 100644
+--- a/devices/gdevpdfocr.c
++++ b/devices/gdevpdfocr.c
+@@ -521,9 +521,12 @@ ocr_line32(gx_device_pdf_image *dev, void *row)
+ static int
+ ocr_begin_page(gx_device_pdf_image *dev, int w, int h, int bpp)
+ {
+-    int raster = (w+3)&~3;
++    int64_t raster = (w + 3) & ~3;
+ 
+-    dev->ocr.data = gs_alloc_bytes(dev->memory, raster * h, "ocr_begin_page");
++    raster = raster * (int64_t)h;
++    if (raster < 0 || raster > max_size_t)
++        return gs_note_error(gs_error_VMerror);
++    dev->ocr.data = gs_alloc_bytes(dev->memory, raster, "ocr_begin_page");
+     if (dev->ocr.data == NULL)
+         return_error(gs_error_VMerror);
+     dev->ocr.w = w;
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 349c007e94..b8195e3eff 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -78,6 +78,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-48708.patch \
                 file://CVE-2025-59798.patch \
                 file://CVE-2025-59799.patch \
+                file://CVE-2025-59800.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \

