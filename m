Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94920CD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 11:15:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4554.1781954121227837757
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 04:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uz8rOFxD;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49222fb062bso28844265e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781954119; x=1782558919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8UVcUHjJiv9guorJXIe+VpqxmSBBb1MaPYu4wfAn1g=;
        b=Uz8rOFxDYLCNtjhkUc2mMly1kMvrEbb7bCmZc/vQXFFf93pBhE81F5fbMPiGFtbtz+
         NZOh/wJ4I2/30o/cqTb5/l0wIXJMv2figeXDp9N9OYUJ9tXX7c9RSI0v7Ak+r6FF2jCG
         rX/8JX9UunWPU0cNUl38cjkzvqFYDB/8ADgVShlUpooQUC93JJHEgXdhJlETBUhvLfq7
         DwxwnjgUelWfOrlSDAAO/YGRNHfrBegw5UccdXQ221kHp3RhT6c6IUznTfO+2u1tAdUp
         GjSXQ/9nWwRn7vrj1nLLzrgyaWG0ilK0pXHtJCA1A1JJfZzkpoJGnRCXSAKLr8h3nzT+
         GisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781954119; x=1782558919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8UVcUHjJiv9guorJXIe+VpqxmSBBb1MaPYu4wfAn1g=;
        b=JhySetslM+3yog8g+P/S+FDcmNhJpKJInX2IpcIDxjVhyFcywijQt2Ar8GpzBbF+tb
         W2a5VPi5a1BZZF/2tQb4h8tATNO1RofEUQwZl0NbfO2S5dc9BykXCdLN2JQGI03O7E2i
         xM0GrcHZXuFT8VezddbED1FRKf7t28g2ECn5EfplVh00fCvzeBwS3mw9VLKnJnTKzMJA
         ki3NDUVsO/d6MZo43e9WE8qmEeJfer9vb6nWiuHaFIgpXIVRI4d5JlF8C96ta09ALz5z
         0RN8oIgNFdBco95Dn0AqOfKpXEwpgKlCF1DO7r6vMozBhnDKaAHwnZMC3mM1XLroxKuc
         aTYQ==
X-Gm-Message-State: AOJu0Yyrna2ZudfOaqjoIJAykAUznfHl6uhra13Sm9nFV+QIjA/iW4gz
	Fm34cXx0KWE3irr0jqcUmn/ZtroTN7uulmqAWTqT9LkZbQFqhoKLxfyGesT7KQiUJWQ=
X-Gm-Gg: AfdE7ckXD4zH4NecJjo4jRLGc19ygPP7zp18qRAT/87PdNIfRYpAipO6VEUFqY7ezNR
	tDD9RVmsrCeP1U5Lzu3cHPaRgJ1d8QOZZ6356R1RDptVGs9Jo10eS6hPG9w0m14wU8N9EIQ8xIu
	Jz5d9eWocQJI8j23VwaGJ72v1WmG7VuFHL6ER/k3KbsOdoBSgzEdYrXrStrc0ptkUTX0QcBT6yU
	8X408CZczE3XMhidseIAzWeRGEPt558SMT99WHuCaTd2XOPmd1QbpDZtDDa6nlDrUrRUrCxI80d
	x3X+WfIPsk2McloweTV+kXmtFPVK0KPZJjvx0LNrnWzylLEwJQziUVuYvn7M7EsBfVo/d5oJQPE
	PpwEJpCVmk8Zqnzj8sCpX2pu1WzZKIctQnXq70YX5aUqgf8DqSbzI0IGIVrVorTGy3s4kLqWVPK
	v85kJPHypbTk36wLelADETwI3N0ZKQLMCUBPK1G1+41CRtt00QACuuBzEHMiJSiram3rcd5Symc
	30B8TDSyC0kCJUrXYmQsQ/L+okUmxHbmsEe5zM7klvh/oVuLEUiEQ==
X-Received: by 2002:a7b:c308:0:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-49240e23b73mr83380905e9.3.1781954119462;
        Sat, 20 Jun 2026 04:15:19 -0700 (PDT)
Received: from jan.telenet.be (2a02-1812-512-2c00-98b7-aaed-b233-e195.ip6.access.telenet.be. [2a02:1812:512:2c00:98b7:aaed:b233:e195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788302sm6709093f8f.20.2026.06.20.04.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 04:15:17 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	Gerbrand De Laender <gdelaende@gmail.com>
Subject: [PATCH v2] u-dma-buf: new recipe at version 5.5.0
Date: Sat, 20 Jun 2026 13:15:01 +0200
Message-ID: <20260620111501.8465-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 11:15:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239205

Add a Yocto recipe for u-dma-buf, an out-of-tree driver that
provides userspace-mappable contiguous DMA buffers for FPGA
and other DMA-capable devices.

Signed-off-by: Gerbrand De Laender <gdelaende@gmail.com>
Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../u-dma-buf/u-dma-buf_5.5.0.bb              | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb

diff --git a/meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb b/meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb
new file mode 100644
index 0000000000..6dea825b31
--- /dev/null
+++ b/meta/recipes-kernel/u-dma-buf/u-dma-buf_5.5.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "u-dma-buf: User-space mappable DMA buffer (CMA-backed)"
+DESCRIPTION = "\
+    u-dma-buf is a Linux device driver that allocates contiguous memory blocks in the kernel space as DMA buffers \
+    and makes them available from the user space. It is intended that these memory blocks are used as DMA buffers \
+    when a user application implements device driver in user space using UIO (User space I/O). \
+    \
+    A DMA buffer allocated by u-dma-buf can be accessed from the user space by opening the device file (e.g. /dev/udmabuf0) \
+    and mapping to the user memory space, or using the read()/write() functions. \
+"
+
+HOMEPAGE = "https://github.com/ikwzm/udmabuf"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bebf0492502927bef0741aa04d1f35f5"
+
+PV = "5.5.0"
+
+SRC_URI = "git://github.com/ikwzm/udmabuf.git;protocol=https;branch=master"
+
+SRCREV = "15bcde3cb960321e99983e227aeacc5807888333"
+
+COMPATIBLE_HOST = '(arm|aarch64).*-linux'
+
+inherit module
+
+RPROVIDES:${PN} += "kernel-module-u-dma-buf"
-- 
2.47.3


