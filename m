Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2189D3CC91
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 00:25:38 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25191.1768436730803735444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 16:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IuXmXV3X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260115002528ab252e3f7d00020786-an6og_@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260115002528ab252e3f7d00020786
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Jan 2026 01:25:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xr1r+VZ76pzFWj1ZBJnW5rbuY2GSgpyhTUM2i5dgXo0=;
 b=IuXmXV3XjgDTQVe1tZ5Zp2zSKkT2p34akz1rUQJ3IoU+p5GRm2dxG8mV0fqFcXl7QtmQEp
 bMb6f/jtC0pzkeObL6+CiENuBcahBABdlTAJ5xtPKlg3hS4czQ+5G0ZAktjv2AImsMwxUc3u
 1OKtWYQwEXPGhjSMcZxSo+k3Zc5Gi7DTo7YJZelEEN68Wd37y0lgQ9vUw1lir238b4MejMzt
 sWi1qrGtl/88ng/EEEJWcYhIKeZycJRKl0YJIpK96OW4QO8ruZnoq7LlJKiTwvYgx7Iq5A4w
 LQc1PCTUoVKpFEehiS6qh6nc0FcNXB8iqzvhpzDmL609V0AsDkr2WH6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH 1/2] libpng: patch CVE-2026-22695
Date: Thu, 15 Jan 2026 01:25:23 +0100
Message-Id: <20260115002524.49177-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229375

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
This CVE is regression of fix for CVE-2025-65018.

[1] https://security-tracker.debian.org/tracker/CVE-2026-22695

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2026-22695.patch         | 77 +++++++++++++++++++
 .../libpng/libpng_1.6.42.bb                   |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
new file mode 100644
index 00000000000..6456b6c4917
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
@@ -0,0 +1,77 @@
+From e4f7ad4ea2a471776c81dda4846b7691925d9786 Mon Sep 17 00:00:00 2001
+From: Cosmin Truta <ctruta@gmail.com>
+Date: Fri, 9 Jan 2026 20:51:53 +0200
+Subject: [PATCH] Fix a heap buffer over-read in `png_image_read_direct_scaled`
+
+Fix a regression from commit 218612ddd6b17944e21eda56caf8b4bf7779d1ea.
+
+The function `png_image_read_direct_scaled`, introduced by the fix for
+CVE-2025-65018, copies transformed row data from an intermediate buffer
+(`local_row`) to the user's output buffer. The copy incorrectly used
+`row_bytes` (the caller's stride) as the size parameter to memcpy, even
+though `local_row` is only `png_get_rowbytes()` bytes long.
+
+This causes a heap buffer over-read when:
+
+1. The caller provides a padded stride (e.g., for memory alignment):
+   memcpy reads past the end of `local_row` by `stride - row_width`
+   bytes.
+
+2. The caller provides a negative stride (for bottom-up layouts):
+   casting ptrdiff_t to size_t produces ~2^64, causing memcpy to
+   attempt reading exabytes, resulting in an immediate crash.
+
+The fix consists in using the size of the row buffer for the copy and
+using the stride for pointer advancement only.
+
+Reported-by: Petr Simecek <simecek@users.noreply.github.com>
+Analyzed-by: Stanislav Fort
+Analyzed-by: Pavel Kohout
+Co-authored-by: Petr Simecek <simecek@users.noreply.github.com>
+Signed-off-by: Cosmin Truta <ctruta@gmail.com>
+
+CVE: CVE-2026-22695
+Upstream-Status: Backport [https://github.com/pnggroup/libpng/commit/e4f7ad4ea2a471776c81dda4846b7691925d9786]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ AUTHORS   | 1 +
+ pngread.c | 4 +++-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/AUTHORS b/AUTHORS
+index 26b7bb50f..b9c0fffcf 100644
+--- a/AUTHORS
++++ b/AUTHORS
+@@ -23,6 +23,7 @@ Authors, for copyright and licensing purposes.
+  * Mike Klein
+  * Pascal Massimino
+  * Paul Schmidt
++ * Petr Simecek
+  * Philippe Antoine
+  * Qiang Zhou
+  * Sam Bushell
+diff --git a/pngread.c b/pngread.c
+index e3426292b..9d86b01dc 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -3270,9 +3270,11 @@ png_image_read_direct_scaled(png_voidp argument)
+        argument);
+    png_imagep image = display->image;
+    png_structrp png_ptr = image->opaque->png_ptr;
++   png_inforp info_ptr = image->opaque->info_ptr;
+    png_bytep local_row = png_voidcast(png_bytep, display->local_row);
+    png_bytep first_row = png_voidcast(png_bytep, display->first_row);
+    ptrdiff_t row_bytes = display->row_bytes;
++   size_t copy_bytes = png_get_rowbytes(png_ptr, info_ptr);
+    int passes;
+ 
+    /* Handle interlacing. */
+@@ -3302,7 +3304,7 @@ png_image_read_direct_scaled(png_voidp argument)
+          png_read_row(png_ptr, local_row, NULL);
+ 
+          /* Copy from local_row to user buffer. */
+-         memcpy(output_row, local_row, (size_t)row_bytes);
++         memcpy(output_row, local_row, copy_bytes);
+          output_row += row_bytes;
+       }
+    }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
index 6dc7ffe2722..fe99e5df092 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.42.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz
            file://CVE-2025-65018-02.patch \
            file://CVE-2025-66293-01.patch \
            file://CVE-2025-66293-02.patch \
+           file://CVE-2026-22695.patch \
 "
 
 SRC_URI[sha256sum] = "c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450"

