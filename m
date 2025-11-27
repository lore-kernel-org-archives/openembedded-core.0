Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE64FD111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:04:03 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.717.1764266632193340866
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fcmXPLE6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20251127180354675f8ba0480002070f-sht2ai@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20251127180354675f8ba0480002070f
        for <openembedded-core@lists.openembedded.org>;
        Thu, 27 Nov 2025 19:03:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=tu9gm2mTL9ZKIFGwJvwLMV15/Dvw1hMdaYUDv45DXyA=;
 b=fcmXPLE6/k3P95+l5NgcKoHcGGhVes11daw/MR1gHMiATdRZBRG6QCOAunOA6uiW1fniPJ
 y1d7jJPo+rMODjWX+8woocgbRqpYYc671WfJqd44H5dM3LK6Qj6CfOofdl6bbh3IxifkXgAe
 ICOb7a00c98bZWVdL9OgE5JdwbAmQtwLFFK6CUYhztbj8py7M18S1T/+mziVB5Sp16mWs++l
 gPTQaK+2dKjNyiWiicWxv+dHYB+KcqEXx/gZINpaPHwYC3TxGsyTFAU5PLSepY4Jermk/I2s
 dcugNs/WZm7u0g8kmVMUrycBdTmcaFieNLDK+3T+Rt+nXb8ZdDFzoLEQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/4] libpng: patch CVE-2025-64506
Date: Thu, 27 Nov 2025 19:03:46 +0100
Message-Id: <20251127180348.3347694-2-peter.marko@siemens.com>
In-Reply-To: <20251127180348.3347694-1-peter.marko@siemens.com>
References: <20251127180348.3347694-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:04:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226861

From: Peter Marko <peter.marko@siemens.com>

Pick commit per NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2025-64506.patch         | 57 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
new file mode 100644
index 00000000000..696f4599717
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2025-64506.patch
@@ -0,0 +1,57 @@
+From 2bd84c019c300b78e811743fbcddb67c9d9bf821 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 7 Nov 2025 22:40:05 +0200
+Subject: [PATCH] Fix a heap buffer overflow in `png_write_image_8bit`
+
+The condition guarding the pre-transform path incorrectly allowed 8-bit
+input data to enter `png_write_image_8bit` which expects 16-bit input.
+This caused out-of-bounds reads when processing 8-bit grayscale+alpha
+images (GitHub #688), or 8-bit RGB or RGB+alpha images (GitHub #746),
+with the `convert_to_8bit` flag set (an invalid combination that should
+bypass the pre-transform path).
+
+The second part of the condition, i.e.
+
+    colormap == 0 && convert_to_8bit != 0
+
+failed to verify that input was 16-bit, i.e.
+
+    linear != 0
+
+contradicting the comment "This only applies when the input is 16-bit".
+
+The fix consists in restructuring the condition to ensure both the
+`alpha` path and the `convert_to_8bit` path require linear (16-bit)
+input. The corrected condition, i.e.
+
+    linear != 0 && (alpha != 0 || display->convert_to_8bit != 0)
+
+matches the expectation of the `png_write_image_8bit` function and
+prevents treating 8-bit buffers as 16-bit data.
+
+Reported-by: Samsung-PENTEST <Samsung-PENTEST@users.noreply.github.com>
+Reported-by: weijinjinnihao <weijinjinnihao@users.noreply.github.com>
+Analyzed-by: degrigis <degrigis@users.noreply.github.com>
+Reviewed-by: John Bowler <jbowler@acm.org>
+
+CVE: CVE-2025-64506
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/2bd84c019c300b78e811743fbcddb67c9d9bf821]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ pngwrite.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/pngwrite.c b/pngwrite.c
+index 35a5d17b6..83148960e 100644
+--- a/pngwrite.c
++++ b/pngwrite.c
+@@ -2129,8 +2129,7 @@ png_image_write_main(png_voidp argument)
+     * before it is written.  This only applies when the input is 16-bit and
+     * either there is an alpha channel or it is converted to 8-bit.
+     */
+-   if ((linear != 0 && alpha != 0 ) ||
+-       (colormap == 0 && display->convert_to_8bit != 0))
++   if (linear != 0 && (alpha != 0 || display->convert_to_8bit != 0))
+    {
+       png_bytep row = png_voidcast(png_bytep, png_malloc(png_ptr,
+           png_get_rowbytes(png_ptr, info_ptr)));
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 62e3e81b4f2..cc35e7a7253 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -16,6 +16,7 @@ SRC_URI = "\
            file://CVE-2025-64505-01.patch \
            file://CVE-2025-64505-02.patch \
            file://CVE-2025-64505-03.patch \
+           file://CVE-2025-64506.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

