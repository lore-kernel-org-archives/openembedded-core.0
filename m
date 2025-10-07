Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06F6CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 22:11:39 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.2532.1759875097703704832
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 15:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Un4HwHQe;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20251007221135ac6add9df400020719-dy8qyb@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20251007221135ac6add9df400020719
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 00:11:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=4PauHkOSBSB2eqpQ7bkZfULGmEhDWEGDJX/p/DIsB3s=;
 b=Un4HwHQeOLY0hea6auoW6qS+4HWtVx7KLaU2XKsi2sgvkckc5Vb/c9pYGq+LkvgU2vz0tg
 6o14+vg17QQfTwteiidDu42/UcQXY7rPvEGw7nYpOEk3COc1FVefmKBlArGDY9B+3UqFNYfU
 BKbpzm17gfoL24DS/bgGxfTaCfAivKZnuX9MxexRjpscesYn+qwVy/yzvmo0GDMGfbfx5zQE
 /+pwzGMtJ3Sm0r9RKHns8rrCJ6csoOdvZTfkkWBISvNEShVm8vU9O9whDZkkbMADH06XviA5
 ju24M9kgMsoAXNyKlJ8Z3vxL1fhm1H6gqp5lanTJhqn/8e5dly6vOEsQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 3/3] ghostscript: patch CVE-2025-59800
Date: Wed,  8 Oct 2025 00:11:12 +0200
Message-Id: <20251007221112.2761326-3-peter.marko@siemens.com>
In-Reply-To: <20251007221112.2761326-1-peter.marko@siemens.com>
References: <20251007221112.2761326-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 22:11:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224570

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ghostscript/CVE-2025-59800.patch          | 36 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
new file mode 100644
index 00000000000..5d50865271a
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 0f123d48991..a48ad671c76 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            file://CVE-2025-59798.patch \
            file://CVE-2025-59799.patch \
+           file://CVE-2025-59800.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"

