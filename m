Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.2630.1604746828868926235
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 03:00:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XFCUc6Bl;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id p22so3773429wmg.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPzhgFnsGMoC9BJ0X1Ii8Jb7eYcd9IeyAxLs4FyPV8c=;
        b=XFCUc6BlIeVBeSklbO2abkpRs0FS5+DzVdw8kvM/Nwy2Qyst0aZPvYY3tZxaLtQs/3
         VpKo+wcuzflnxYdgBdX5rJj39dtILKsUeX1afoG5Ar+KVNZKuVIETFTuUFyV2WJtkhvp
         FOM2mOAzcFaQuTley4Fapmm6ECTLLvCa5sWLB4bvMt4wMqnMVSp60NCm/2h4PB4eEfh2
         +KTme7VhwiDsOwjttA/PKiW30e365vxqwY8IdcFgqefcj5qdR7W/u97qztZ2XwyWchCx
         EgOQZenJkz83jI5jJnaKZyTfScCCb9yFhP281Usjfkw02SZLREwxxS8jvt8M1rZ2L/7G
         8rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XPzhgFnsGMoC9BJ0X1Ii8Jb7eYcd9IeyAxLs4FyPV8c=;
        b=ktG7w6oyGBDGrtu52FwUQTx7ZcA+/gFk4l+UZdVzgtsMCuHpTBwYb7Y07+VsV+V7rJ
         VqeSvFF41QC0d4KaDeubjDaq2LyakWDfLkiCaQtJWXwVmFXMGxVWPH5wgyRb4fTw+96o
         iM+RHvOv6S3xHsYpTniHeg6+2HZnYZ9vO6wccVPlt/atXwTMUyKCdNSaL2GeavRV/Bqw
         JVkvy8P7d+fdnhyD+mrs/vmTBv0ZRvwxgNT+frJQGhnPeaDMnDXOvOQ0SORhuh8rWK5k
         aoAaIOmx3CeyEivaLPnDywtV6zNz7XD57/wHu9mBPixzYvgZBXpZCKpGKeGp+hib14lz
         fufQ==
X-Gm-Message-State: AOAM530HQoWoXu8yEEKV5jvKMZ7I8q/bEKs2x5xNJ6B+0QBuM/1gSdZd
	WxcwBu5vVoE/2nxkEqXHPyJEl+9966Lrag==
X-Google-Smtp-Source: ABdhPJxH9vmcI6NBkjeO0+88zmgd5L2NfU5vUlpMLCT8aBD45dTYs4aLwEtR4O0kXxBOiZbzxUWnsw==
X-Received: by 2002:a1c:6654:: with SMTP id a81mr4493889wmc.104.1604746827025;
        Sat, 07 Nov 2020 03:00:27 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id s8sm1601099wrn.33.2020.11.07.03.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 03:00:26 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell] gstreamer1.0: warn the user when something is wrong with GstBufferPool
Date: Sat,  7 Nov 2020 11:00:05 +0000
Message-Id: <20201107110005.851748-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not a critical bug fix but it can be usefull in some BSP
with exotic drivers like on nvidia tegra bsp.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...size-in-reset-when-maxsize-is-larger.patch | 49 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch
new file mode 100644
index 0000000000..dacc399d28
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch
@@ -0,0 +1,49 @@
+From a1b41b2b2493069365a8274c6a544e6799a5a8df Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Mon, 20 Jul 2020 17:08:32 +1000
+Subject: [PATCH] gst/bufferpool: only resize in reset when maxsize is larger
+
+Only resize the buffer if the maxsize is larger then the configued pool
+size.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/570>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a1b41b2b2493069365a8274c6a544e6799a5a8df]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ gst/gstbufferpool.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/gst/gstbufferpool.c b/gst/gstbufferpool.c
+index 8ae868cf2c7..a8167d017d6 100644
+--- a/gst/gstbufferpool.c
++++ b/gst/gstbufferpool.c
+@@ -1223,9 +1223,21 @@ default_reset_buffer (GstBufferPool * pool, GstBuffer * buffer)
+ 
+   /* if the memory is intact reset the size to the full size */
+   if (!GST_BUFFER_FLAG_IS_SET (buffer, GST_BUFFER_FLAG_TAG_MEMORY)) {
+-    gsize offset;
+-    gst_buffer_get_sizes (buffer, &offset, NULL);
+-    gst_buffer_resize (buffer, -offset, pool->priv->size);
++    gsize offset, maxsize;
++    gst_buffer_get_sizes (buffer, &offset, &maxsize);
++    /* check if we can resize to at least the pool configured size.  If not,
++     * then this will fail internally in gst_buffer_resize().
++     * default_release_buffer() will drop the buffer from the pool if the
++     * sizes don't match */
++    if (maxsize >= pool->priv->size) {
++      gst_buffer_resize (buffer, -offset, pool->priv->size);
++    } else {
++      GST_WARNING_OBJECT (pool, "Buffer %p without the memory tag has "
++          "maxsize (%" G_GSIZE_FORMAT ") that is smaller than the "
++          "configured buffer pool size (%u). The buffer will be not be "
++          "reused. This is most likely a bug in this GstBufferPool subclass",
++          buffer, maxsize, pool->priv->size);
++    }
+   }
+ 
+   /* remove all metadata without the POOLED flag */
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 66ad3e3381..7c802422b5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
+    file://0005-gstreamer1.0-gst-bufferpool-only-resize-in-reset-whe.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.29.2

