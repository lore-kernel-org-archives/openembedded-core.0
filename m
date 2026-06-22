Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A385CDB470
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 13:36:26 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43342.1782135377702316164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 06:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JFAscUgY;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so2827779f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782135376; x=1782740176; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qm7oeB0h3qUd/CW4jUx2NpBaDvisYF49K5CRSN3LFk=;
        b=JFAscUgY7zhesyvePwqwWtu0S3Gq7LAz147M4Uh7RY/ugKw8K5i1djzpNcwgUIsIVW
         dCrRc77AfesMfId67ZVcfbvuMUdFhMKa3GUJWrfwrMqMMkNeXFiMVhaE2roRnNRQtaE/
         BgEyNWM7hrnsCB/l2nqWXUShBf/+pCcWgzfoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782135376; x=1782740176;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3qm7oeB0h3qUd/CW4jUx2NpBaDvisYF49K5CRSN3LFk=;
        b=KfMCH861bjXKKBKlDGeTvdbQlpHkJ5bwgP5DkzlKpGT8ijIg67rsm8t8y+g7YEevwp
         bHNHhI7QSQ1qk1nNfDjZq77e0hgJEFwVUJLYaMZ8YBfTnXqXHBBCgcAD+esU3dak49gI
         cYm1bVDCj0Am/Zjv+B9rfJ7sVUFsPyWoB3uc1naTy3jmK1KcB9vbIYkSLzBovTjCZmEc
         7SSQV1Y+NhCugKDtY5xDgagWFjcQxmcYP+4QxH7L/y9srzP/g7CZFvM3Lz6sOLeUQbH2
         AW3G7qAHUn5+SFHHXCBOBIuJRKleBIPEANJGIy7D1G3ldZhOzgHsXQt/pyd4XH9Mhg6A
         nT0g==
X-Forwarded-Encrypted: i=1; AHgh+Roy6i3xNg0DxsgFBVnytQT+YCpZVxRwo3+rYIEFq/vj6lvAf1/AmFbAyUal2xVdcvZnbYhN2wxCNLp2eKIYLKpc2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWrRQjL4Sv2eoKQauQwVzeinKxu0gjePD1Vr4j8PhFC09PuSwF
	FMXqVBIvc8EigVYvvLAHsBDfUVtMyfEryAMkzQAPLiNlUegZ5vPMBww/UOMmHgMObiE=
X-Gm-Gg: AfdE7cnh/ODkRJUIHUeGZMNi9FuyJZM2lTAb5/VpXmCGEkgLEESdvmQpEYdLd8dJx0n
	fjygZ/kWs5krKuWCeWAPgTjFqsAraq4XNSAU5OLZ5oSG7tBwFLTiKqDSNu9qU5cgzqFM4yrMZGQ
	oI7hHu6sXH6TTCJPKVDDnWFL/e24x9frOdL3OEh/ZZ7ecdtZXkbPPc7DwIppfOTzZW5Ag+WyZdg
	aHD8ZeJk/uaH8p/Pt71s34miDP2HI8VtExtmMhMvQdh+ZGF0AOvfHQ2org5+yT8vJhHqR+gBxfB
	2tQs8ZIQCgMKGJ4y8A2yYZzJizRsbd9NDSxKgAIybEhT92x7nGwuYUsZycLXEha5gdmugw1oA3i
	5n51DHeT7eW6Ien5JLuzMQaW6NofF6eYlhyWYrLqIxJA87lal8jgVam2IR2Eeap6KT/U4DnhqkL
	nYpHJcLkO6JRAvCZ2Xn/DZHnFA8p+kFqGvKUlP9Zf7HRLacPjvnx2/jaWlyO+t/4bGKdjJXTrSF
	KJe
X-Received: by 2002:a5d:5d01:0:b0:45e:73eb:5119 with SMTP id ffacd0b85a97d-465097867cfmr27542277f8f.22.1782135375822;
        Mon, 22 Jun 2026 06:36:15 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57b8asm26958037f8f.26.2026.06.22.06.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 06:36:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 15:36:15 +0200
Message-Id: <DJFM9L0LTPH9.YF725UG8S9KX@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/3] qemu: Fix CVE-2025-14876
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260612121820.2298565-1-asparmar@cisco.com>
In-Reply-To: <20260612121820.2298565-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 13:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239299

On Fri Jun 12, 2026 at 2:18 PM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This patch applies the upstream v10.0.8 stable backport for
> CVE-2025-14876. The upstream fix commit is referenced in [1],
> and the public CVE advisory is referenced in [2]. The individual
> backported commit links are recorded in the embedded patch headers
> when the fix expands to multiple commits.
>
> [1] https://gitlab.com/qemu-project/qemu/-/commit/e649201bb96ae7e91a69d57=
392c8907ec085111e
> [2] https://access.redhat.com/security/cve/CVE-2025-14876
>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---

If I'm not mistaken, the 3 patches of this series where introduced after
the 10.2.0 version on the 10.2.x branch of QEMU. In that case, they are
missing for wrynose.

Can you send the fix for wrynose, and then, ping back here?

Thanks!

>  meta/recipes-devtools/qemu/qemu.inc           |  2 +
>  .../qemu/qemu/CVE-2025-14876_p1.patch         | 52 +++++++++++++++++
>  .../qemu/qemu/CVE-2025-14876_p2.patch         | 56 +++++++++++++++++++
>  3 files changed, 110 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.pat=
ch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.pat=
ch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 54644dd924..26d10991a7 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -45,6 +45,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
>             file://CVE-2025-12464.patch \
>             file://0001-python-backport-Remove-deprecated-get_event_loop-=
cal.patch \
>             file://0002-python-backport-avoid-creating-additional-event-l=
oop.patch \
> +           file://CVE-2025-14876_p1.patch \
> +           file://CVE-2025-14876_p2.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
> =20
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
> new file mode 100644
> index 0000000000..1f47ff2ebc
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
> @@ -0,0 +1,52 @@
> +From 96ac1b4f958287776ec2199749beaaad60148a85 Mon Sep 17 00:00:00 2001
> +From: zhenwei pi <pizhenwei@tensorfer.com>
> +Date: Sun, 21 Dec 2025 10:43:20 +0800
> +Subject: [PATCH] hw/virtio/virtio-crypto: verify asym request size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +The total lenght of request is limited by cryptodev config, verify it
> +to avoid unexpected request from guest.
> +
> +CVE: CVE-2025-14876
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/e649201bb96ae7e91a69d57392c8907ec085111e]
> +
> +Fixes: CVE-2025-14876
> +Fixes: 0e660a6f90a ("crypto: Introduce RSA algorithm")
> +Reported-by: =EC=9D=B4=EC=9E=AC=EC=98=81 <nakamurajames123@gmail.com>
> +Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +Message-Id: <20251221024321.143196-2-zhenwei.pi@linux.dev>
> +(cherry picked from commit 91c6438caffc880e999a7312825479685d659b44)
> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> +(cherry picked from commit e649201bb96ae7e91a69d57392c8907ec085111e)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + hw/virtio/virtio-crypto.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> +index 4aaced74b..6927f7d1a 100644
> +--- a/hw/virtio/virtio-crypto.c
> ++++ b/hw/virtio/virtio-crypto.c
> +@@ -767,11 +767,18 @@ virtio_crypto_handle_asym_req(VirtIOCrypto *vcrypt=
o,
> +     uint32_t len;
> +     uint8_t *src =3D NULL;
> +     uint8_t *dst =3D NULL;
> ++    uint64_t max_len;
> +=20
> +     asym_op_info =3D g_new0(CryptoDevBackendAsymOpInfo, 1);
> +     src_len =3D ldl_le_p(&req->para.src_data_len);
> +     dst_len =3D ldl_le_p(&req->para.dst_data_len);
> +=20
> ++    max_len =3D (uint64_t)src_len + dst_len;
> ++    if (unlikely(max_len > vcrypto->conf.max_size)) {
> ++        virtio_error(vdev, "virtio-crypto asym request is too large");
> ++        goto err;
> ++    }
> ++
> +     if (src_len > 0) {
> +         src =3D g_malloc0(src_len);
> +         len =3D iov_to_buf(iov, out_num, 0, src, src_len);
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch b/me=
ta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
> new file mode 100644
> index 0000000000..60432c8ebb
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
> @@ -0,0 +1,56 @@
> +From 17f89320724d16437a26a250c82b1649777387f1 Mon Sep 17 00:00:00 2001
> +From: zhenwei pi <pizhenwei@tensorfer.com>
> +Date: Sun, 21 Dec 2025 10:43:21 +0800
> +Subject: [PATCH] cryptodev-builtin: Limit the maximum size
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +This backend driver is used for demonstration purposes only, unlimited
> +size leads QEMU OOM.
> +
> +CVE: CVE-2025-14876
> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit=
/3464e88bc98d72acc3a9674054b9ed0c3d4e9b90]
> +
> +Fixes: CVE-2025-14876
> +Fixes: 1653a5f3fc7 ("cryptodev: introduce a new cryptodev backend")
> +Reported-by: =EC=9D=B4=EC=9E=AC=EC=98=81 <nakamurajames123@gmail.com>
> +Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +Message-Id: <20251221024321.143196-3-zhenwei.pi@linux.dev>
> +(cherry picked from commit 7b913094c703641a0442bb1d1165323a019c591c)
> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> +(cherry picked from commit 3464e88bc98d72acc3a9674054b9ed0c3d4e9b90)
> +Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> +---
> + backends/cryptodev-builtin.c | 9 +++------
> + 1 file changed, 3 insertions(+), 6 deletions(-)
> +
> +diff --git a/backends/cryptodev-builtin.c b/backends/cryptodev-builtin.c
> +index 940104ee5..a4c544b6d 100644
> +--- a/backends/cryptodev-builtin.c
> ++++ b/backends/cryptodev-builtin.c
> +@@ -53,6 +53,8 @@ typedef struct CryptoDevBackendBuiltinSession {
> +=20
> + #define CRYPTODEV_BUITLIN_MAX_AUTH_KEY_LEN    512
> + #define CRYPTODEV_BUITLIN_MAX_CIPHER_KEY_LEN  64
> ++/* demonstration purposes only, use a limited size to avoid QEMU OOM */
> ++#define CRYPTODEV_BUITLIN_MAX_REQUEST_SIZE  (1024 * 1024)
> +=20
> + struct CryptoDevBackendBuiltin {
> +     CryptoDevBackend parent_obj;
> +@@ -98,12 +100,7 @@ static void cryptodev_builtin_init(
> +                          1u << QCRYPTODEV_BACKEND_SERVICE_MAC;
> +     backend->conf.cipher_algo_l =3D 1u << VIRTIO_CRYPTO_CIPHER_AES_CBC;
> +     backend->conf.hash_algo =3D 1u << VIRTIO_CRYPTO_HASH_SHA1;
> +-    /*
> +-     * Set the Maximum length of crypto request.
> +-     * Why this value? Just avoid to overflow when
> +-     * memory allocation for each crypto request.
> +-     */
> +-    backend->conf.max_size =3D LONG_MAX - sizeof(CryptoDevBackendOpInfo=
);
> ++    backend->conf.max_size =3D CRYPTODEV_BUITLIN_MAX_REQUEST_SIZE;
> +     backend->conf.max_cipher_key_len =3D CRYPTODEV_BUITLIN_MAX_CIPHER_K=
EY_LEN;
> +     backend->conf.max_auth_key_len =3D CRYPTODEV_BUITLIN_MAX_AUTH_KEY_L=
EN;
> +     cryptodev_builtin_init_akcipher(backend);


--=20
Yoann Congal
Smile ECS


