Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web10.4523.1627406686477312259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 10:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C8JTa++g;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id s21-20020a4ae5550000b02902667598672bso3256883oot.12
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 10:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5oEdrF+TkN9sL6wWYljVzHz9S0in22GgWTSzRU4K2es=;
        b=C8JTa++gxQV2cgPsQiBopVPbtgFLQVZUmVy1KAbKlh48Rdym5F85WnMKC7TKC3NLzn
         uUO5FDdGO9lg2L/qL6WxU9roa5TJJ5aN17zX6jWAYvyqP+GnilM2khu61JEoZaGIltcS
         qCVt5t1CRhtAmtBgqy0fgMeGytok+AaqbHkpVoVltChJRR1tjG7lH9Uptowtc7Y/yxAh
         QwjT2SgByKmIyGUiPHcAh7BWLK69v8QFerECQZPAwCtUhEQfIFbI3GPpq/dCoJAs4Gun
         t47rKlJyfKc1zdHjWd/4t5kSznAcAS09xu/8uD4MM3GjD5qrOeZsZ5u2QPSDZshVJ2Ol
         c7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5oEdrF+TkN9sL6wWYljVzHz9S0in22GgWTSzRU4K2es=;
        b=FEKyHVtiiBZsKA1QGuvr4NRfsWsL946D5KX1wyHnIR2+h9X9E1Ppl1HIQy4B8lFTLh
         WC4/t60iMyn929gsVYiCcOHECh0oS8aVCLnLBHBKzSGjVUE4qzpC0y9ayQfSaSypAzFj
         0nebejhVmi3XNS4gKImXjQ5VV3I7x+n1Cj53kiUmTuqxVP6w5Ul0mZ7kLH23cRBuPViT
         tY1C/hnKuHVIs+NvcOHus5CkjYoUNotWP1GlczXXGMfYfApJXARyviTO5g5dwc2smfw/
         //Lpgd5xFvKzcsEVXIHOQCnVAWJsf31AXnDy8mJcz9daSWQoHvYJpJrmk0aPfLKa0sbf
         rptA==
X-Gm-Message-State: AOAM533yscD2mEi8j9Y0iKdtT/+o5cAXjKKjpvnP/k+zcmNQUxbRQlOh
	+Sy4UqzfTcN/u3Im9elS+FKzSNGm4OLYhg==
X-Google-Smtp-Source: ABdhPJzM9Hj/6HCbn5FLK5Vcn+XRDfJX0c8rae/E+HEuIxijCbh52lYPMkXzFZT0Z70MjmcSIVJa3Q==
X-Received: by 2002:a4a:1804:: with SMTP id 4mr5630578ooo.54.1627406685589;
        Tue, 27 Jul 2021 10:24:45 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id a192sm577549ooc.10.2021.07.27.10.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:24:45 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] mesa: Fix v3d & vc4 dmabuf import
Date: Tue, 27 Jul 2021 12:24:43 -0500
Message-Id: <20210727172443.29972-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mesa would unnecessarily fail in the v3d and vc4 driver if a dmabuf
could not imported for scanout. In particular, this meant the
weston-simple-dmabuf-egl test program would fail on a Raspberry Pi.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 ...mabuf-import-for-non-scanout-buffers.patch | 72 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch b/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch
new file mode 100644
index 0000000000..1a8771028b
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch
@@ -0,0 +1,72 @@
+From 303c02a31df4e2b8f6090e75982922a9cba33e4c Mon Sep 17 00:00:00 2001
+From: Joshua Watt <JPEWhacker@gmail.com>
+Date: Tue, 27 Jul 2021 11:41:53 -0500
+Subject: [PATCH] v3d, vc4: Fix dmabuf import for non-scanout buffers
+
+Failure to create a buffer for scanout should not be fatal when
+importing a buffer. Buffers allocated from a render-only device may not
+be able to scanned out directly but can still be used for other
+rendering purposes (e.g. as a texture).
+
+Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12081]
+---
+ src/gallium/drivers/v3d/v3d_resource.c | 13 +++++--------
+ src/gallium/drivers/vc4/vc4_resource.c |  3 ---
+ 2 files changed, 5 insertions(+), 11 deletions(-)
+
+diff --git a/src/gallium/drivers/v3d/v3d_resource.c b/src/gallium/drivers/v3d/v3d_resource.c
+index 602ba6d8447..02dc29ae6a0 100644
+--- a/src/gallium/drivers/v3d/v3d_resource.c
++++ b/src/gallium/drivers/v3d/v3d_resource.c
+@@ -433,10 +433,11 @@ v3d_resource_get_handle(struct pipe_screen *pscreen,
+                 return v3d_bo_flink(bo, &whandle->handle);
+         case WINSYS_HANDLE_TYPE_KMS:
+                 if (screen->ro) {
+-                        assert(rsc->scanout);
+-                        bool ok = renderonly_get_handle(rsc->scanout, whandle);
+-                        whandle->stride = rsc->slices[0].stride;
+-                        return ok;
++                        if (renderonly_get_handle(rsc->scanout, whandle)) {
++                                whandle->stride = rsc->slices[0].stride;
++                                return true;
++                        }
++                        return false;
+                 }
+                 whandle->handle = bo->handle;
+                 return true;
+@@ -929,10 +930,6 @@ v3d_resource_from_handle(struct pipe_screen *pscreen,
+                         renderonly_create_gpu_import_for_resource(prsc,
+                                                                   screen->ro,
+                                                                   NULL);
+-                if (!rsc->scanout) {
+-                        fprintf(stderr, "Failed to create scanout resource.\n");
+-                        goto fail;
+-                }
+         }
+ 
+         if (rsc->tiled && whandle->stride != slice->stride) {
+diff --git a/src/gallium/drivers/vc4/vc4_resource.c b/src/gallium/drivers/vc4/vc4_resource.c
+index 61e5fd7e5a6..bf3f7656ff8 100644
+--- a/src/gallium/drivers/vc4/vc4_resource.c
++++ b/src/gallium/drivers/vc4/vc4_resource.c
+@@ -320,7 +320,6 @@ vc4_resource_get_handle(struct pipe_screen *pscreen,
+                 return vc4_bo_flink(rsc->bo, &whandle->handle);
+         case WINSYS_HANDLE_TYPE_KMS:
+                 if (screen->ro) {
+-                        assert(rsc->scanout);
+                         return renderonly_get_handle(rsc->scanout, whandle);
+                 }
+                 whandle->handle = rsc->bo->handle;
+@@ -689,8 +688,6 @@ vc4_resource_from_handle(struct pipe_screen *pscreen,
+                         renderonly_create_gpu_import_for_resource(prsc,
+                                                                   screen->ro,
+                                                                   NULL);
+-                if (!rsc->scanout)
+-                        goto fail;
+         }
+ 
+         if (rsc->tiled && whandle->stride != slice->stride) {
+-- 
+2.32.0
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 6a0df4fa2e..85a352f736 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,6 +19,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-v3d-vc4-Fix-dmabuf-import-for-non-scanout-buffers.patch \
            "
 
 SRC_URI[sha256sum] = "022c7293074aeeced2278c872db4fa693147c70f8595b076cf3f1ef81520766d"
-- 
2.32.0

