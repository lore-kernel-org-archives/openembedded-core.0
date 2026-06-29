Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8244BC43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:44:44 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36700.1782737079026797088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iz8fP2jZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3314; q=dns/txt;
  s=iport01; t=1782737079; x=1783946679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xpJmEdHeWbCEndKx61xjty1JKEXwSAsupop1yyxVIbQ=;
  b=iz8fP2jZLNnOClx1tOHoQYfM7TlEz6WqmVBrH8F23K71FYEPRGJ9qu79
   Bg3H1k1pnr1kPtQh53KJy8yD0Xz9imOLnpyl/MFPyXIHki6C+dr19umRH
   9/H0eLp8dfijBCb7u1BnEJk22yxNxs2An9hW12QMEjie9SambO23GGLtH
   lqIhzJPKZ4dFxJ00v34yLeKAmY1m7whgEjjm6I6utL6H4Xk2d0xocUNJs
   EPyCGGnoDr1YFqUZ1WCrnzhDH4ChJC6hJzdt652uQ4JUinpApixcc2zf/
   xUDBxWhlS74sq6HONr/DJ0Oxh8cbUk8SgUmOaecvizv0qcnch6wuYZxCF
   A==;
X-CSE-ConnectionGUID: z0LJuR+xRL+03Lph4GucCg==
X-CSE-MsgGUID: Zm+lRIn8RMqlDOuZUFc29w==
X-IPAS-Result: =?us-ascii?q?A0BFAgA6aEJq/4z/Ja1aglmCV3RfQkmWS4tnkjcUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhQaNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBKgsBRiwDAQIWOQsjIYMCAYI6AzYCARG2Kho3gXkzgQGEf?=
 =?us-ascii?q?dhJDYJWAQsUAQWBM4U/gnyFI1sYAYR8JxsbgXKBFYNpgQWBGkICA4EWgQaGB?=
 =?us-ascii?q?gSCIoEMgVoegXqCCIEYiXdIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?QwbBwWBHYFpgQSEfSMfAzl/gTB1WGYVMDWBAgERHgqBUicDCxgNSBEsNxQbB?=
 =?us-ascii?q?D5uB4xeFw+CHSABgQ0BKyKBcqYOoB5xCiiDdYwhjz6FfBozhASBV5JAklGZC?=
 =?us-ascii?q?I4KhAmSR4RogWg8gVlwFYMiCUoZD444g2uFE8J3JDULMgEBBwIHDgMLgWiRf?=
 =?us-ascii?q?QEB?=
IronPort-Data: A9a23:7kiLT6v/iEjud0ISeTw/XCDQL+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKT3UP/6NYzf2fo10O9y3/UgG7JaByNM1SgdkqioyFCsUgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zZ+Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw6L5TI3x0t
 uwiDHNVNTSbh76Z3bmQRbw57igjBJGD0II3oHpsy3TdSP0hW52GG/6M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtPYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoHSH5gIxBnD/
 goq+UzLB1IeDv2ZmQCg63aAofL9oA3wAtMNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YaLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:8htFVq+bRx5AoFTB7tluk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:kM1PXG4guxg66tvSMtss5hYwON0fMW3n6DSIeGugCTpGVba+RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AKShrQQ5hot4JzoO/X99KQT+oxoxa5ueqMmELwa8?=
 =?us-ascii?q?jos2oEjFCBhmW1mWoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502552730"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:44:38 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 00989180005A1;
	Mon, 29 Jun 2026 12:44:38 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 9D1DFCC124B; Mon, 29 Jun 2026 05:44:37 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/3] qemu: Fix CVE-2026-2243
Date: Mon, 29 Jun 2026 05:44:29 -0700
Message-Id: <20260629124431.2000781-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239769

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-2243.
The upstream fix commit is referenced in [1], and the public CVE advisory
is referenced in [2].

[1] https://gitlab.com/qemu-project/qemu/-/commit/86b5130fefbe476f3c0a85b9e136f9e3fd518689
[2] https://github.com/advisories/GHSA-cw9w-w7fx-35q6

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-2243.patch             | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4b6c2252b7..1d493ee1a3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://CVE-2024-6519.patch \
+           file://CVE-2026-2243.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
new file mode 100644
index 0000000000..bb2cb63b91
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
@@ -0,0 +1,45 @@
+From 1633b8cd69483ed6c481aa596d3c760c09257c27 Mon Sep 17 00:00:00 2001
+From: "Halil Oktay (oblivionsage)" <cookieandcream560@gmail.com>
+Date: Tue, 10 Feb 2026 13:33:25 +0100
+Subject: [PATCH] block/vmdk: fix OOB read in vmdk_read_extent()
+
+Bounds check for marker.size doesn't account for the 12-byte marker
+header, allowing zlib to read past the allocated buffer.
+
+Move the check inside the has_marker block and subtract the marker size.
+
+CVE: CVE-2026-2243
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/86b5130fefbe476f3c0a85b9e136f9e3fd518689]
+
+Fixes: CVE-2026-2243
+Reported-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Signed-off-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+(cherry picked from commit cfda94eddb6c9c49b66461c950b22845a46a75c9)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 86b5130fefbe476f3c0a85b9e136f9e3fd518689)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ block/vmdk.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/block/vmdk.c b/block/vmdk.c
+index 89e89cd10..cd8b4ec7c 100644
+--- a/block/vmdk.c
++++ b/block/vmdk.c
+@@ -1951,10 +1951,10 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
+         marker = (VmdkGrainMarker *)cluster_buf;
+         compressed_data = marker->data;
+         data_len = le32_to_cpu(marker->size);
+-    }
+-    if (!data_len || data_len > buf_bytes) {
+-        ret = -EINVAL;
+-        goto out;
++        if (!data_len || data_len > buf_bytes - sizeof(VmdkGrainMarker)) {
++            ret = -EINVAL;
++            goto out;
++        }
+     }
+     ret = uncompress(uncomp_buf, &buf_len, compressed_data, data_len);
+     if (ret != Z_OK) {
-- 
2.35.6


