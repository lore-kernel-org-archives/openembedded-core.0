Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.5302.1605279179843488239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vYvQHviA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id q5so7804793pfk.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3QwvFSOEAfeVFHwi5lICgj1S7mtnuvYodN7LHk5kiVc=;
        b=vYvQHviAxGnpgv1IRWhQqe/TyV6qz2fgneeTJOqDzyTI4qnECRwgRuu7AfhshrNfel
         WQNaVQP404oMpMUcbLpQm6mD3+65ZwxtVRY4Fo/85GyWQoj+kiMwOuqvhOWgAHRqC9Bg
         ffBlZhY9nkIILrFHf8yK6Rrw5noD3ziKplmLCJBesw/bjTtGeWegDzTpKvzeVhCAjWp3
         wP6wgINdU93ck0iymL6EFMXmrakZhsFqFAZ/adgNI+EEGQqxjJ8gSFG/jIrOQDg7DOu/
         Z4rCE+Xp1eiw0FJbt3tlgOGTw+GZ2E7kMLBhFWyxQ1N6iWf8fauPE8H7KX6wPlHn/L+y
         859Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3QwvFSOEAfeVFHwi5lICgj1S7mtnuvYodN7LHk5kiVc=;
        b=oHetmO/qscX2UgjEun5/K8IwhBcEl6RVxvHlfUChRXtI/Qp4DAvcmOSnlVlZ9wavzj
         XTi/foeWAecMJ0RNL1xuFSrZMnnpC9o/le7atyLjXOeHsJxwjHzZ7cPkv0Sar60/Z3ji
         9NtafBU9n+ZGM7AT/KKYfb9JnX13pKOSeUPcJ4xkQg+p5es/JFn4dcBdkPS04PZEv+5E
         042eXxN98xiCxKEQ2FefR7P22WeEO3+FZGxNYgl+LLj3K0NMNXIvgVZDwYXANnPJa1Nk
         vVnuW29jUS2RHyJ7JMHXdw3w9jNFCOymXEYGPFS0DIcT5mkJhzFLYe91wVLW1gyU97po
         XpSA==
X-Gm-Message-State: AOAM533badGT9VvTKW9GeoYLtwgYrvKptQlK1abnyViJTbC/dLzrNohK
	Igcf0AwSMVgWYHb/8i7DtAfH2finG/9WrUsA
X-Google-Smtp-Source: ABdhPJyNX4kiwJ9XjP+bDBpjy4csiu1PmToHpqdoofXnq7JIerz0QE0onA5Tb+98V4o+GuvPduX66Q==
X-Received: by 2002:a17:90b:154:: with SMTP id em20mr3422241pjb.114.1605279178890;
        Fri, 13 Nov 2020 06:52:58 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:58 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/18] gstreamer1.0: warn the user when something is wrong with GstBufferPool
Date: Fri, 13 Nov 2020 04:52:13 -1000
Message-Id: <2237b8a536c8c13ad59d7e93d96f6602881dc4f2.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

This is not a critical bug fix but it can be usefull in some BSP
with exotic drivers like on nvidia tegra bsp.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 66ad3e3381..7afe56cd7b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
+    file://0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.17.1

