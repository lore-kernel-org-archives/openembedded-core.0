Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9112ACD4F26
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 10:46:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4221.1781952377394646809
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 03:46:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=E6CJFmZQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20991005e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781952375; x=1782557175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WaM+5KetZGJRf1ZtK/4gr557KqIP7F9rQqr62Qg4LkQ=;
        b=E6CJFmZQsknbVapdWOkgGj70Gsfd2fTuWKftmEE08y2+DLEzLeogB/UlC6k79kWPsJ
         CRxyJ5a/wej4odXcHSY99IM3D4CxRzfFm3jBooCvtB1aiuwl0om19ZAovBK+A7wy5uvC
         IuxejkBDiZzXv9pbTrdIVFsowiGR1y6zktnyGTHdDc5hJvOY7X0Vp7SeMJtc6t+8BG6s
         mvvElK2IcHlFUMIskAvEqb0ZojdqLR7xgt+EN8yzSO3Lj/Bo47RohnkuGvCH4rUWj0ym
         otsY4S8WwKyvaCNiS/fodJvldV5HhCPjwl7fpOq5q9HPqxBkyXeSHF7Tfn+5BA9uZr/u
         kjbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781952375; x=1782557175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WaM+5KetZGJRf1ZtK/4gr557KqIP7F9rQqr62Qg4LkQ=;
        b=bJ0E1dlQfE6K/+6flz7jdIbmrb4GAF6x3C38mE8koSwHjm5486yp3W3VhmbIWEJjs6
         TbMZ0bWmBW5DTYOogeKoMRKIoZ3G7BjAYK1SgjcSCuLFfPNKtAmSsE6ZJUaUodmXO9UG
         J/CqRRyyi3TaSv5mHxyi2swVJ9YgzPBVAHW87J+DpB3T2jQEnQOuzPG6BwD3eLB76uWt
         c8u2FxtqDoWFfPErx0E4Y0tGYwkAGD4bdmBhJ9F/DqN6g2ruLt0QYbLgJ0tLHQ5ZitJR
         kLN63ccJ9D/UUNY8u4WDbhAIdBAWLd/2/gvfNwDqmhP+iHUbPH8m0nT/Rwv8/RY/dRYC
         cpjg==
X-Gm-Message-State: AOJu0YxVIFDWBi70IH7/P/9EDBrPTVnkr52swPP+k8ZKnd+/whfKnYsm
	bQtlSNuH5gz+YKP/yfSdOFUTmm9O/jdRZqLEz35k4yfSTRjToDmIQ1O8mRbfvF5t6lU=
X-Gm-Gg: AfdE7cmYTzHG1Soxq1IiFiY6kIYSox3rbUFLAheGNEsDqOsz62rpov6DjJ3jc68VyI6
	qrBuuYItlmq2nRfpuZ+Ed4utCD/owcf44cZ8+764F6qCIZ72Mh+fJZ01bHoq9MH0clDmSzisMSS
	dLCYO0xDsg+nz+/He4sSyJ/K5SIcwWNC1IsNk69/+7auk4WA3VXwRnCfEOq0ODWOu43pqdmOX5a
	47nI2t6a+2v3dQiQoKedeGgceXKu1+VkC6q/pFKs8qPWX1WV3rNhjckJ82Z+JiX6a1OyKtPWnMV
	ka8D1sk7iPReojjJ4jHJztVD8SWnB9nX72JDx91MOT41bP+7qNopp5ehMohWhSSSQLjHFI+2G09
	sDRcmZA9GMkZn+07KCJ8G+A5OUI3M7izebmufeGbX3dVyHPh0MZ4DhNcMWpgjtSfAL4CR8FDzdC
	4ER5Dm3Evr4kgrYnbMxos4hcJHh/+kAjQTMO4+PqsoaQGSJv5IqlnltZH4xfiWf3Jawt748hrgK
	YS0U7WGIcHw49+IjSziVUJtex8A5Z/Tu1roOD20hRp52wO2H0ldYLx9KNP1SlaV
X-Received: by 2002:a05:600c:3b05:b0:492:4a70:faaa with SMTP id 5b1f17b1804b1-4924a7101b5mr33439045e9.11.1781952375278;
        Sat, 20 Jun 2026 03:46:15 -0700 (PDT)
Received: from jan.telenet.be (2a02-1812-512-2c00-98b7-aaed-b233-e195.ip6.access.telenet.be. [2a02:1812:512:2c00:98b7:aaed:b233:e195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57902sm7103257f8f.25.2026.06.20.03.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 03:46:14 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: ichiro_k@ca2.so-net.ne.jp,
	Jan Vermaete <jan.vermaete@gmail.com>,
	Gerbrand De Laender <gdelaende@gmail.com>
Subject: [PATCH] u-dma-buf: new recipe at version 5.5.0
Date: Sat, 20 Jun 2026 12:46:03 +0200
Message-ID: <20260620104603.7194-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 10:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239203

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


