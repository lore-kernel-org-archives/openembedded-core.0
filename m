Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3383D3CC92
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 00:25:58 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25254.1768436751531926576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 16:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=GVa+tKwT;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260115002549bd8f83061a0002072e-ctbcvt@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260115002549bd8f83061a0002072e
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Jan 2026 01:25:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=r2i2HW2vylO06zEK2bu7/GOdduB1pur+vFZWzGp6XGU=;
 b=GVa+tKwTUVzMT3xzZpuQHjgCppSgQvWBmjPngSrkqtPVFLh8NIIf5138lRWfaM77YT7CQq
 H/WjBtyO8LBn/pnrm9IfYPPmc6zop3QmUv9cCjtuhe0jF2ztiTgHV2x4Bq/wFNDfzK/KDBBF
 AYadL6HJTVvVK5yb+tEA1zkwjt4rqaCiQEBqVKTPcZmNEyMTQNUjmFWlJT5Dc93PyScs/y0u
 53roNIQO0poxsj/oQ4veFlQfPd/Opz36E3kJyor9M6U1vD3FfVu6oRKmFMZpNVCPlNZGlmh6
 dmxFfwcATLA+f3tNVPQL7/8w9fOM5a2P9xW168u83U7hvvgqBHW30jjw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/2] libpng: patch CVE-2026-22695
Date: Thu, 15 Jan 2026 01:25:44 +0100
Message-Id: <20260115002545.49200-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229377

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
This CVE is regression of fix for CVE-2025-65018.

[1] https://security-tracker.debian.org/tracker/CVE-2026-22695

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpng/files/CVE-2026-22695.patch         | 77 +++++++++++++++++++
 .../libpng/libpng_1.6.39.bb                   |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch

diff --git a/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch b/meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
new file mode 100644
index 00000000000..673411eb341
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
+@@ -22,6 +22,7 @@ Authors, for copyright and licensing purposes.
+  * Mike Klein
+  * Pascal Massimino
+  * Paul Schmidt
++ * Petr Simecek
+  * Qiang Zhou
+  * Sam Bushell
+  * Samuel Williams
+diff --git a/pngread.c b/pngread.c
+index e3426292b..9d86b01dc 100644
+--- a/pngread.c
++++ b/pngread.c
+@@ -3268,9 +3268,11 @@ png_image_read_direct_scaled(png_voidp argument)
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
+@@ -3300,7 +3302,7 @@ png_image_read_direct_scaled(png_voidp argument)
+          png_read_row(png_ptr, local_row, NULL);
+ 
+          /* Copy from local_row to user buffer. */
+-         memcpy(output_row, local_row, (size_t)row_bytes);
++         memcpy(output_row, local_row, copy_bytes);
+          output_row += row_bytes;
+       }
+    }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
index 70685b68e7b..9ca68d9b8bc 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.39.bb
@@ -22,6 +22,7 @@ SRC_URI = "\
            file://CVE-2025-65018-02.patch \
            file://CVE-2025-66293-01.patch \
            file://CVE-2025-66293-02.patch \
+           file://CVE-2026-22695.patch \
 "
 
 SRC_URI[sha256sum] = "1f4696ce70b4ee5f85f1e1623dc1229b210029fa4b7aee573df3e2ba7b036937"

