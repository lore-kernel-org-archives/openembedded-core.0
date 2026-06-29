Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FBCC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:44:44 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91284.1782737079052694549
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AFqy93R/;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6694; q=dns/txt;
  s=iport01; t=1782737079; x=1783946679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XuOmZhhHLhEwRE1s7F9PGuC9jexV1ZGPQOkWxrnzd+w=;
  b=AFqy93R/oTPyiIjlNimJBh6PC6h9d1ODqglfVNwlR1gwqpntiW/4FR/I
   pk3peDLIUqs8JFAcqgReV8J3CJ88oP92zXM1mf+VJpL2Rd8MoCBVZsOis
   PLbd+LbNZnVxeFa40htOzc2AJ1q8+kBjzDTjfG+kWqgBpu9Ne/DC9v6uM
   pREwjAiZsTbULE+VcB/5rVdQZVt/dn20Cqy/HXurqiJJRZN2wJuVCLz2J
   QzrySo4tMm3/HN6M7pKFrzMNwzlt/Z4pw0NPBdp7v+FfDjxoK8nFUt/Mr
   LX0z8B+3HTkudu1UQatL+h/CKLk7ZLR+28DIcB7dOUOIJVXADdR6YnepX
   w==;
X-CSE-ConnectionGUID: jgB/4ZlAQ6mtWCPqqfK0AQ==
X-CSE-MsgGUID: M1ja/s26R+uiryMMaLeGfg==
X-IPAS-Result: =?us-ascii?q?A0BoAwC3Z0Jq/43/Ja1aglmDS19CSYRXkXQDi2SSN4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUGAo1LAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEDIwQLAUYQCRMDAQIDAiYCAiALIwgQCYMCAYI6AzYCA?=
 =?us-ascii?q?RGbQZpzGjd6fzOBAYR92EkNglcLFAEFgQUuhT+CfCABhQJbGAGDXYEfJxsbg?=
 =?us-ascii?q?XKBFYNpgQWBGkICA4E0AYQDgmoEgiKBDIFaHlCBKoIIgRiJd0iBAhwDWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XNFgbBwWBHYFpgQSEfSMfAzl/gTB1WGYVM?=
 =?us-ascii?q?DWBAgERHgqBUicDCxgNSBEsNxQbBD0BbgeMXhcPgj2BDgErIi2BRVKSV5Jlo?=
 =?us-ascii?q?B5xCiiDdYwhjz6FfBozhVulEQuYfY4KhAmRd1CEaIFoPIFZcBWDIglKGQ+OL?=
 =?us-ascii?q?QsLg2CFE8J3JDULMgEBBwIHDgMLgWiQAAEngVUBAQ?=
IronPort-Data: A9a23:yMvEAKrj9VR45eVM5AiPIMNf+wheBmJJZBIvgKrLsJaIsI4StFCzt
 garIBnVafeKZmL0c9EjaIqwphlVsZHdy9AwTFBvqC82RSgQo+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgPNNwJcaDpOtfrd8kM35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0uR4KyYSx
 /gxEW4Ici+ov/uvzpHjY9A506zPLOGzVG8ekmtrwTecCbMtRorOBv2Wo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUfrSn8/w7pX7WzRDsFuPoKMty2PS1wd2lrPqNbI5f/TXHZwMwBbF+
 DuuE2LRJ0gYPZuEk2S/sW+tnP7quCrfVa0cG+jtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:tcMINqGbvSJexgippLqENseALOsnbusQ8zAXPo5KJiC9Ffbo8f
 xG/c5rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAdGSS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jcjpy1iZNNXN77V1TLu
 vm2vZ6
X-Talos-CUID: 9a23:6gSTEmBQDbcDnrT6Eyto3glIKMQMSyPY0Ej7G1ahB0UxYYTAHA==
X-Talos-MUID: 9a23:CjYRGQQNaXPvL9emRXTJ3TNrc9wyvZ7tFUEXgLAjsu2JGiJ/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="501168561"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:44:38 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 05899180001A2;
	Mon, 29 Jun 2026 12:44:38 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id A1475CBF202; Mon, 29 Jun 2026 05:44:37 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/3] qemu: Fix CVE-2025-14876
Date: Mon, 29 Jun 2026 05:44:31 -0700
Message-Id: <20260629124431.2000781-3-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260629124431.2000781-1-asparmar@cisco.com>
References: <20260629124431.2000781-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239771

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2025-14876.
The upstream fix commits are referenced in [1] and [2], and the
public CVE advisory is referenced in [3].

[1] https://gitlab.com/qemu-project/qemu/-/commit/2ac11c1d9370423ccdc527f9159ddd2ba4a2ea77
[2] https://gitlab.com/qemu-project/qemu/-/commit/51514aa3c2f1e072c9728c975865e0b247b2619b
[3] https://github.com/advisories/GHSA-gq25-pccv-6q8j

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         | 52 +++++++++++++++++
 .../qemu/qemu/CVE-2025-14876_p2.patch         | 56 +++++++++++++++++++
 3 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 518ef69789..60a5c62fe9 100644
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
index 0000000000..44e0b0f1a9
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
index 0000000000..580440f900
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
-- 
2.35.6


