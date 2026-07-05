Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1034C4450D
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:57 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139218.1783291376988489681
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=McOE4vm7;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b1710405so13659255e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291375; x=1783896175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnpgx0TFyiPEjNOXH9KMmTD+2UWmgjV2L2vHYu76g0s=;
        b=McOE4vm7KlkE8evFFUT5S7Wx/YO7aBGqupHU1+RWi2eKWbBlHSYpZgB78rqPwjmFA1
         xiwEjFS5CXENothVBvhscDFvyVpY7w3J7heVHEVyT7ytZn4lJmKLD7odBjbJfpP2d1WA
         AdU1f4gIHqjKs3jCbLrxYrRrpwWn0cfU17O54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291375; x=1783896175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gnpgx0TFyiPEjNOXH9KMmTD+2UWmgjV2L2vHYu76g0s=;
        b=Irdjsm2ahzyZkh3DaVnruy73tYMCwOD/5GCu5UMDKG03RCSDR0EgjI1PBrXWFHVrPO
         Rb8NrSanXGySEwy5wE42sIlDCer7jk8hfVVaJ8oIhljxNzHKnbuPxhR3d/9AJxJYCn5Y
         E2FMNAuUQgtN1171xUgFYLkBkiBKOVWnzXpsbFlj9PtY8wWlXEhGL1o/bETOuyaFbJL3
         PFmDGHBi1PDnK6GCa66ye/yce1WtTUU6oj5dTcdN5g9DSPM1HcDM/UKf10S3cOitN6UT
         CGc40cChlGXjKR7JveJl7UD5fMxCCWVb0ghwN5zGKmDqLkrjE0JHOBrE5M66mIRJCTx3
         vP4A==
X-Gm-Message-State: AOJu0YxOF/glOqSNcIMjuyznSWDI07SkkMrMO4Y9weOCcLHRsy7bEMaT
	ji4rD8Z20BUxRoMEwLpPkKUXk52SVArSFNpVkAZD9wA9lP4NZ41OVlOZiPgOiWZ4LQg6scifdqV
	63MwhK8s=
X-Gm-Gg: AfdE7cnhRmdCq82sTvJMT69qD1I53iRcaohbcG9iSR24zb1Vyu9R+Lg+l2nKeCFwYpi
	0ED44Hzg1IpoanHYrcnx/NabSNcy2FS5Op/uAyQn/Jl5tpAzAnJ8EjHXBZkhTo3CBWPzKSiUIJy
	Sr2i9vKabeQ4dsIgxMQTpEkg+tuPtXzDeSFHrsvxqQtuteR1KnhUx5oYQuAwhWic8PrtY8Nehse
	lD0BZESZXL7qJUFOF9NMu0KKmumS2upO3N2KXuD1M788jjshS7BCVEubErd2V919rHcSdmPswoD
	n4S+I8D1yLaTm4Ej+qBTKQ3DwCrRR+NR/Eh+tLUCwMTGHcuCGbT78KxW1/SZta+oQH6e31gQJ2X
	/jJPH4jI8pIHUIkYKLS6fvxp1hPOZZdcjmDr+3FWXOCewaJ871WMI2oMOARETqViFevUD764ZHq
	LjBIFbFyyZIXRRyc4N6m0nN8US/Zes6mG2OwEQ
X-Received: by 2002:a05:600c:6098:b0:493:ba69:4d67 with SMTP id 5b1f17b1804b1-493d11d6759mr93205625e9.12.1783291375134;
        Sun, 05 Jul 2026 15:42:55 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 22/55] qemu: Fix CVE-2025-14876
Date: Mon,  6 Jul 2026 00:41:12 +0200
Message-ID: <f88877e4b54231c8b54246ba7d8a4331ca6b7ea7.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240175

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2025-14876.
The upstream fix commits are referenced in [1] and [2], and the
public CVE advisory is referenced in [3].

[1] https://gitlab.com/qemu-project/qemu/-/commit/2ac11c1d9370423ccdc527f9159ddd2ba4a2ea77
[2] https://gitlab.com/qemu-project/qemu/-/commit/51514aa3c2f1e072c9728c975865e0b247b2619b
[3] https://github.com/advisories/GHSA-gq25-pccv-6q8j

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         | 52 +++++++++++++++++
 .../qemu/qemu/CVE-2025-14876_p2.patch         | 56 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 518ef69789d..60a5c62fe9f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -39,6 +39,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2024-6519.patch \
            file://CVE-2026-2243.patch \
            file://CVE-2026-0665.patch \
+           file://CVE-2025-14876_p1.patch \
+           file://CVE-2025-14876_p2.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
new file mode 100644
index 00000000000..44e0b0f1a98
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
@@ -0,0 +1,52 @@
+From 1a7c7a0066f2bdb4ddb0d4f689d4949ca70bb8c4 Mon Sep 17 00:00:00 2001
+From: zhenwei pi <pizhenwei@tensorfer.com>
+Date: Sun, 21 Dec 2025 10:43:20 +0800
+Subject: [PATCH] hw/virtio/virtio-crypto: verify asym request size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The total lenght of request is limited by cryptodev config, verify it
+to avoid unexpected request from guest.
+
+CVE: CVE-2025-14876
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/2ac11c1d9370423ccdc527f9159ddd2ba4a2ea77]
+
+Fixes: CVE-2025-14876
+Fixes: 0e660a6f90a ("crypto: Introduce RSA algorithm")
+Reported-by: 이재영 <nakamurajames123@gmail.com>
+Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20251221024321.143196-2-zhenwei.pi@linux.dev>
+(cherry picked from commit 91c6438caffc880e999a7312825479685d659b44)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 2ac11c1d9370423ccdc527f9159ddd2ba4a2ea77)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/virtio/virtio-crypto.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 517f2089c..b20f29993 100644
+--- a/hw/virtio/virtio-crypto.c
++++ b/hw/virtio/virtio-crypto.c
+@@ -767,11 +767,18 @@ virtio_crypto_handle_asym_req(VirtIOCrypto *vcrypto,
+     uint32_t len;
+     uint8_t *src = NULL;
+     uint8_t *dst = NULL;
++    uint64_t max_len;
+ 
+     asym_op_info = g_new0(CryptoDevBackendAsymOpInfo, 1);
+     src_len = ldl_le_p(&req->para.src_data_len);
+     dst_len = ldl_le_p(&req->para.dst_data_len);
+ 
++    max_len = (uint64_t)src_len + dst_len;
++    if (unlikely(max_len > vcrypto->conf.max_size)) {
++        virtio_error(vdev, "virtio-crypto asym request is too large");
++        goto err;
++    }
++
+     if (src_len > 0) {
+         src = g_malloc0(src_len);
+         len = iov_to_buf(iov, out_num, 0, src, src_len);
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
new file mode 100644
index 00000000000..580440f9002
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
@@ -0,0 +1,56 @@
+From baff597605a973ca92d57a1a728db98d9c2b680e Mon Sep 17 00:00:00 2001
+From: zhenwei pi <pizhenwei@tensorfer.com>
+Date: Sun, 21 Dec 2025 10:43:21 +0800
+Subject: [PATCH] cryptodev-builtin: Limit the maximum size
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This backend driver is used for demonstration purposes only, unlimited
+size leads QEMU OOM.
+
+CVE: CVE-2025-14876
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/51514aa3c2f1e072c9728c975865e0b247b2619b]
+
+Fixes: CVE-2025-14876
+Fixes: 1653a5f3fc7 ("cryptodev: introduce a new cryptodev backend")
+Reported-by: 이재영 <nakamurajames123@gmail.com>
+Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Message-Id: <20251221024321.143196-3-zhenwei.pi@linux.dev>
+(cherry picked from commit 7b913094c703641a0442bb1d1165323a019c591c)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 51514aa3c2f1e072c9728c975865e0b247b2619b)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ backends/cryptodev-builtin.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
+index 0414c01e0..55a3fbd27 100644
+--- a/backends/cryptodev-builtin.c
++++ b/backends/cryptodev-builtin.c
+@@ -53,6 +53,8 @@ typedef struct CryptoDevBackendBuiltinSession {
+ 
+ #define CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN    512
+ #define CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN  64
++/* demonstration purposes only, use a limited size to avoid QEMU OOM */
++#define CRYPTODEV_BUITLIN_MAX_REQUEST_SIZE  (1024 * 1024)
+ 
+ struct CryptoDevBackendBuiltin {
+     CryptoDevBackend parent_obj;
+@@ -98,12 +100,7 @@ static void cryptodev_builtin_init(
+                          1u << QCRYPTODEV_BACKEND_SERVICE_TYPE_MAC;
+     backend->conf.cipher_algo_l = 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
+     backend->conf.hash_algo = 1u << VIRTIO_CRYPTO_HASH_SHA1;
+-    /*
+-     * Set the Maximum length of crypto request.
+-     * Why this value? Just avoid to overflow when
+-     * memory allocation for each crypto request.
+-     */
+-    backend->conf.max_size = LONG_MAX - sizeof(CryptoDevBackendOpInfo);
++    backend->conf.max_size = CRYPTODEV_BUITLIN_MAX_REQUEST_SIZE;
+     backend->conf.max_cipher_key_len = CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN;
+     backend->conf.max_auth_key_len = CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN;
+     cryptodev_builtin_init_akcipher(backend);

