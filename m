Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5C30CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:18:30 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69190.1781266706044966863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:18:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VAzfZcAv;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6720; q=dns/txt;
  s=iport01; t=1781266706; x=1782476306;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5ujPcgOnj+L6XU68CBYenXPiImoJFr7I/Z+k24w+iRs=;
  b=VAzfZcAvLSVCa4z+776etLM5xy2YpNAssyj62PUydD9cA9YzMtqzUUNv
   MbHIr+HHSos8amY/UtTwsmNLoQxVoE4NmKMHo9Tb62ggG8GVB6fHXJ+aT
   Ri+2lMlg5RrzycT/4pSNuktodLNuZvDEvJ01FPFfg0PLlRXYiI08iPjig
   i52iPgdPkF0TrIGF3ccPg2BdG71gQAmh8YJF35kZplefJNbNaXPE36kte
   D7lBLQkHUXTDa6H6QMF42llfIL0SsfhuhurhAEHcB4UCiQN7isGqYnkm3
   nVCvG9rYnlSVpGM1Hx27E6uaARiQcRoPYPScT63l7ptri/6VAkqt0O6BN
   A==;
X-CSE-ConnectionGUID: tvKobB38TXSczUD1GXu9iw==
X-CSE-MsgGUID: f9x4JK41QHeCJiubfOORtw==
X-IPAS-Result: =?us-ascii?q?A0BKAgDf9ytq/4r/Ja1aglmCGD90X0JJA4RUkXSLZ4Vmj?=
 =?us-ascii?q?FGBfg8BAQEPRA0EAQGFBgKNQAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaAQIBJgQLAUYZEwMBAgMCJgIiCyMYCYIqWAGCOgM2A?=
 =?us-ascii?q?gERl1Oacxo3en8zgQGDaAJDUNhJDYJWAQUGFAEFgQUuhT+CfCABhQJbGAGDX?=
 =?us-ascii?q?YEfJxsbgXKBFYNpgQWBGkIFgTQBhAOCagSCIoEMgV0eUoFcggqKM0iBAhwDW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBSoEraoEDhQ0jHwM5f4F0g?=
 =?us-ascii?q?ShnaRUwNYEBARESAwsYDUgRLDcUGwQ9AW4HjEIXD4FLc4EOAStPLIECFxg6k?=
 =?us-ascii?q?leSZaAecQoog3WMIY8+hXwaM6psC5h9jgqECZErTFCEaIFoPIFZcBWDIlMZD?=
 =?us-ascii?q?1aNVwsLg2CFE8J+JDULAy8BAQcCBw4DC4FokAABJ4FVAQE?=
IronPort-Data: A9a23:BpSUuK6fvHgmZ1rn9zrjQQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mccDGmEMviIZGb8eo1wPIq/oUIOvJLUxtE1HAo/qnhnZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxNsfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIZM7/exdWjFyx
 ccTOg0hNz+zmrO33+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYfUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIaEIYfaH5kIzi50o
 ErIrnSlIDJGbeW/xBGn82+miMjopz/kDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:dsif+KHT3/r/4IMNpLqEyseALOsnbusQ8zAXPo5KJiC9Ffbo8/
 xG/c5rsCMc5wxxZJhNo7290cq7MBHhHPxOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOkdK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:ZdVYKW7BRoTlA5ZAKNss6FA3HcoPKS3h/EzbMXKUUElZVeyUVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ALPFKzwwICrtyBzOrhJcSTLRUZfaaqKr/GBwvssl?=
 =?us-ascii?q?fgumJHg5xJj2TqxONXpByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493382458"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:18:25 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 19F55180001CD;
	Fri, 12 Jun 2026 12:18:25 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 7D0AACC1611; Fri, 12 Jun 2026 05:18:24 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/3] qemu: Fix CVE-2025-14876
Date: Fri, 12 Jun 2026 05:18:15 -0700
Message-ID: <20260612121820.2298565-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238611

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.8 stable backport for
CVE-2025-14876. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/e649201bb96ae7e91a69d57392c8907ec085111e
[2] https://access.redhat.com/security/cve/CVE-2025-14876

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         | 52 +++++++++++++++++
 .../qemu/qemu/CVE-2025-14876_p2.patch         | 56 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54644dd924..26d10991a7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-12464.patch \
            file://0001-python-backport-Remove-deprecated-get_event_loop-cal.patch \
            file://0002-python-backport-avoid-creating-additional-event-loop.patch \
+           file://CVE-2025-14876_p1.patch \
+           file://CVE-2025-14876_p2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
new file mode 100644
index 0000000000..1f47ff2ebc
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
index 0000000000..60432c8ebb
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
-- 
2.44.1


