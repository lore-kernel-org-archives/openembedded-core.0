Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01BFC4450D
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5811.1783591633340939278
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o02V65Ww;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b779003fso3741055e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591631; x=1784196431; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJ83YOfjsYRmWhQ8EXfPiORsqBU5IdpoU9XMHSdoXNo=;
        b=o02V65WwuE2U0KaEBfJbcPa4vXuF6uaHpKEzScHgxgPn5Ud+dt2yh3q8zHR77HByJf
         XmRpIPgOJTKLhJxX9J7asIJVMsk0HiPWqIJDrY3ifXSnaOO5w3GndWaQJ5JrmdDjqFRu
         rfrBY4QoXuyd8GmaiM7tL5zHbQ3kD7o4vWrH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591631; x=1784196431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJ83YOfjsYRmWhQ8EXfPiORsqBU5IdpoU9XMHSdoXNo=;
        b=exHd2WWoPFmh6SFUAWHJ3gqvIv/aYz5G8ke7f0fVhkyBdosNfBnmu0gjM6Fy2Ia7ot
         zqZgQt6upW+lW1aGFHe4ENWHIwLvbi6fOThgtbtyC6G7+25goXp5d/NNrNKvmfCe0LpD
         OxY1ohOULBKljdu/CFH3+TpWh9Zr5/dCRp5ZvBgeJh0RyMdL221v1BiUnUFTgOqZC1Px
         HYjE4+c57IcpyuMI7SWFaXRnvuUtr1gw1dedI0TDWZX8sCyoc++pCk8MrjAAfnVr/4Mr
         kaSPrIWqr97wIi059dS51blT8Tcv3YVr6X3kdLO9AdhAxzyLfpNAYRBOyjf7PWuKgOMN
         79nA==
X-Gm-Message-State: AOJu0YwDuvLK8Xtkn9hg/Dea0ABg0W1PhOoAuRITASl9Niu8AhdufbEI
	Fihm6EtCj7wP0C02KWQtrVsH2vXNMIzrI86o2WaUCB+XflxL0rcv0JSlu9//XSb4Hmr20BwwZ9f
	2qqK7iGQ=
X-Gm-Gg: AfdE7cmIFK2u84AmOVoPTjG6/BJ20OvHd+iMKMgVC/dxsWrz2OfuBwU4hNEBYU+sXfi
	Uw1jToEXiyMdx7onlLVEU2VlBRXC+deJH29qYl1oMsVkynGxUKWNPlg77E3/DVWtd66N/n6QF51
	RBCJs8FEmcSww3ODjcwh+gAYFtN3P5K3bKnBd7NmQRGX6cSQMfMMErKT7CcylEbAfFcMCnBigVZ
	UftKfakSVHjGBnzxh5qxwZ18OBjTsSXMPz3SthjcmROquDdNhJ+gvf+86oYOdJOEORVrGtaeP/K
	47MRiS8FEq6Ph4v6yudX4xJXWPGmcH+41COlhldmMcs9hZRFTem1tBYW8+l4yrk+GuF6gZD6mTc
	UyK51UxDHww4Ri8S8D3kxjA80Cr7tmriKkfPV7m8G3MZG9av9BNLTuDKhMk2f5jVwBsSAJx54gA
	rRHwY8goM4VXsrm/fGzMiWaUtAU1nJj/fEy0xBPkMpbmbNAfNU6buWg6JeCluIkP3sJpbAoFXHa
	Dmpu1uBdbslmbBQYQ==
X-Received: by 2002:a05:600d:8496:20b0:493:ae5d:8c40 with SMTP id 5b1f17b1804b1-493e68e9ff7mr43205745e9.27.1783591631522;
        Thu, 09 Jul 2026 03:07:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:10 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/25] qemu: Fix CVE-2025-14876
Date: Thu,  9 Jul 2026 12:06:34 +0200
Message-ID: <04fae4fb45022104757c7f36b3bae9978d7c1265.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240564

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.8 stable backport for
CVE-2025-14876. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/e649201bb96ae7e91a69d57392c8907ec085111e
[2] https://access.redhat.com/security/cve/CVE-2025-14876

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
index ff8877e54b7..f973c0a8d1e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -48,6 +48,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-11234-01.patch \
            file://CVE-2025-11234-02.patch \
            file://CVE-2024-6519.patch \
+           file://CVE-2025-14876_p1.patch \
+           file://CVE-2025-14876_p2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
new file mode 100644
index 00000000000..1f47ff2ebcc
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
@@ -0,0 +1,52 @@
+From 96ac1b4f958287776ec2199749beaaad60148a85 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/e649201bb96ae7e91a69d57392c8907ec085111e]
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
+(cherry picked from commit e649201bb96ae7e91a69d57392c8907ec085111e)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ hw/virtio/virtio-crypto.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
+index 4aaced74b..6927f7d1a 100644
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
index 00000000000..60432c8ebb9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
@@ -0,0 +1,56 @@
+From 17f89320724d16437a26a250c82b1649777387f1 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/3464e88bc98d72acc3a9674054b9ed0c3d4e9b90]
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
+(cherry picked from commit 3464e88bc98d72acc3a9674054b9ed0c3d4e9b90)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ backends/cryptodev-builtin.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
+index 940104ee5..a4c544b6d 100644
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
+                          1u << QCRYPTODEV_BACKEND_SERVICE_MAC;
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

