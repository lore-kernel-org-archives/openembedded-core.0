Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D24E9B272
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:10 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21277.1771943110110657629
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AbaId6uH;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371bb515eso69453555e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943108; x=1772547908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9OMzyLcuYyE25bOhbW3KVsZv3JzqWCLTgZJb4XncVo8=;
        b=AbaId6uHCHDzL9eMZFmbTC/nNbVJZL3YI7n9uVLaAX9gXEcE0CpuK0EPawsfaF3sVE
         tiWuxWhOgpnMtez+flZdG701ROXFskQKVfNMl8RME8is6fOaoD61S59G5KyveFaw7EGf
         obmlgsCBPu/t5GbKnBF/CZRHZp0RboBFix3kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943108; x=1772547908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9OMzyLcuYyE25bOhbW3KVsZv3JzqWCLTgZJb4XncVo8=;
        b=C6U71GsClKrJ5NA6kuFiIvry3+pN/vsIXhJjU8LKrp2XSR60ro+z0/YNaJGnLq5Frz
         GvqkZ28lcxeezuLa4wDMjNTK9qfm2ycfIObWTD0Ok3ZoZv/ZZEJUT2GvMxU/runDjjjm
         sgj6lEJYjyZvcPT0w/HKxoTZzo7Pr2eJioFy4BQcTDuAK4Dm3SdNm6YRZ/qJUP67VGMv
         8RKOyGpMt3eFla+8+kXebeIWt8grVBPRIjgsbIROXYg9j74kxdBQK5dzqPoTZkQwLjo+
         a2kKdvTwyJjPolEctSCOrYzALvzOk3aoAAXZsideGSRQTAxOhRcb3BrtitZuwa33s7ft
         ZiaA==
X-Gm-Message-State: AOJu0YyAqhQSKc7lgK6MPFb14E2OuMwWIuxjPc0ILwblTQXAvKzRhfM8
	HrVV43L+dbZJy1XxYLlJLusPdzpXCdGkw0Y3oLtLKeonPTdZmPs3kVQLfpfWnUoS0RGGbMp5g6+
	7IYt8
X-Gm-Gg: AZuq6aLIa3cFIXWV1M+vDRx5PebPTWBS4dhTsMfj01w1lpw8Ugb4kkn8ub1qiWi0Q6V
	0QSA7begleaOlJqe1Arcs0vjPQCX5tvC9Ln986i7OuxiKZvpM68sKQ5Bo7QXUy07sJJLx8c6rbe
	RLQBfN/YRlhXv/NSVls6GVUIri/9LKsy5WbG2w/AoRzTSj9rGdlnECTyhhynGlB1Txy/HZEeBli
	ysqe4YcklERAVcX4ZumXNuME4Eimh0dqo9uPL1W/x0CVR9MW68SoTUuLU3FLZ2SX2Nqn8Xz2PoX
	+rMeGEeYkQGC5zmnobrdtmvf74iXgPABJuqGQARVHGLLTVpRinoFkTrnpYicLapFb+2ow+gcsxi
	e3DsgtXc1tISDAFNedJgO4EpOQoNYbF0mh8eosXSdpocUJV01ZiPg10v5AUFzRoViXYRyvRUMuF
	y6XHf5MUq67baRNszI/1YUK8+KXT+5QJ8/d/B9GsY0CNRdJBInvIYhMertyIvUbDi1jeDg7eW63
	qhrURFowe6VF/90PgLvTduyAtj3RvmMBA==
X-Received: by 2002:a05:600d:640f:20b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483a9607e3cmr175514625e9.14.1771943107798;
        Tue, 24 Feb 2026 06:25:07 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.25.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:25:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/38] libpng: patch CVE-2026-22695
Date: Tue, 24 Feb 2026 15:24:10 +0100
Message-ID: <488b2c249576e9a933ab5dfb1badad3a8a56491e.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771942869.git.yoann.congal@smile.fr>
References: <cover.1771942869.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231784

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
This CVE is regression of fix for CVE-2025-65018.

[1] https://security-tracker.debian.org/tracker/CVE-2026-22695

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

