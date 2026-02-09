Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAAFEE6B75
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44197.1770629366242271168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vxL81/O5;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so680420f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629364; x=1771234164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXbSrxVnwzgplsnL6FetcT1CSp/zsFFTgxF/GuwkoiE=;
        b=vxL81/O5B/xMiaGiApCMWXC+kg0eMJS45vkGAneoMnIeMuCr0t1l2pf8LRl/sJN3RD
         ZpiCPPhy2PGsBSToCOowfLCvaGmQemj1qkqolF434Zdqz053HUCasUPK2ulNSrthS3V7
         geod0SaLCP5UvqIOD8q/kCZc4Rhgo5Xc8bMMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629364; x=1771234164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UXbSrxVnwzgplsnL6FetcT1CSp/zsFFTgxF/GuwkoiE=;
        b=JXrC8QzAq2jCFBvE7B5VVWwKBQ43Rj/mgUbfCzZzQjZ+qPuDkWvLyBkrwgFUmgMnLg
         93pifiF3O+F+DFJkgCdKQZDsSk41ysV5KCflznhzQxAPXLHc08arj+/M6gYax3MncyZZ
         kwBE6G5rSInh5mnhF+YAfSa1QlH1bNrF8ofhYo41v683/+x7JCr+DlFWM9IuqVx6vyTS
         csI7y0Nu2z+7shDTRH+UDEQLbC5UmEj3NEsjMjuD3yPlVO1hx7EAa5PHjdTUlJSEgjX7
         5QWtNxzUeSV/4abjUpqsY8DgkrXmaJR9R4JFHFupJQlUf2+bR+MNr0nBKW5I0VVNQEGh
         4Z0A==
X-Gm-Message-State: AOJu0YyVLl35cJtIcKAwzU9Zrm6CEiY+ZPQXB07vfqQZGm7USkEoUekD
	BpqfjITOcWF+0mgcH4Y6cFA9lJ7eAXrJaCWjCH36Lskc34vMmtuCuIj4RcjRLbBM4D/Dy5K0VOZ
	OT73xUAI=
X-Gm-Gg: AZuq6aJv2eXvrg2Q3lDLkraMsIMp9oZ+UjEy3mCjLP395phRnAM58s2bzjcXhdDHQIw
	+XlHeZAJqQOIAv4GicuAQt+VxwU5q1IpAeVwLqXXqtvLCj31qxCN2tyiCtW2ElUFPCuFwGMemvv
	rYbwwCxYnS0U1aULKg/lGMCMVFrV5uQr0WdGHY8PasFoNa6pgo5/XZjkBsiJpUGmB3a6cIgfRiD
	4mz67vWt0mAEWB8VVfx0ABgNPmobupozWMtjiDo6+JFrsj4yIDtJGVVCDbgaoMFSQHeqaD4OOsn
	QCdOVmxvG9xPBFNuIvCAVYs7YNSocjfQJY1yhTuBc5kKPQL+LPgO6RPrM0GNKA+wtvxbGqupDAF
	Hxl8PodkhR4vt6XqVsyR0vHeqBmRyVm55z258+e+f9J3dhWUsknkfZPQ7CnhjK3BooPuVVBCxKZ
	OUkd0e+bebzD+jr7dfBEoBWVbb+v+BFPDgjbbpJpsFxhmYUTGGALk8MEL0gNSb12cXDv3xrE143
	VQsH5yopQxtGk4=
X-Received: by 2002:a05:6000:1889:b0:430:f790:99d7 with SMTP id ffacd0b85a97d-4362965faffmr17079757f8f.27.1770629364327;
        Mon, 09 Feb 2026 01:29:24 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/25] libpng: patch CVE-2026-22695
Date: Mon,  9 Feb 2026 10:28:50 +0100
Message-ID: <72567b765dd4818da56d470ae718d714ee0485dd.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230758

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1].
This CVE is regression of fix for CVE-2025-65018.

[1] https://security-tracker.debian.org/tracker/CVE-2026-22695

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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

