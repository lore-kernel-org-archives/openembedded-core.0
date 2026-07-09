Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C5CC44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5812.1783591634558706952
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cbS9Cn3W;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5714765e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591633; x=1784196433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=af+/Tbf8Qs3RqLH8XKB93IGvS/Db8nnRVUyXzrR3NSQ=;
        b=cbS9Cn3WK9IKQsSx/xyY96Bmu5yF89g2AeM+GyK2Yq+W6I59lZtwWaQTRSDcD9x+I1
         GKsJQrS6g1FBYOI86sXV4e4DSwJmd1GrvvEE3dBaB15EeI56uMGi+jePQMzLMe5yI3vI
         ekygcWzTXM8e3OMseulJowPzf4TT6gC0VtTGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591633; x=1784196433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=af+/Tbf8Qs3RqLH8XKB93IGvS/Db8nnRVUyXzrR3NSQ=;
        b=POTEPdJSTqhHBQdZMTjYaKovVK97+mAq5V2VD3SJps5tu/rKt/vaC2Duxa3EQThK4f
         8VGdkvGGnBhIAzVEPHTsM8TpPGFbF6uHcTFNa4SMQLkic/yBOLWlJwBII4jOJqeoCyA8
         zWbz/hr4fDbEGYEXeYbmBjg/EmZPtCR/mBV1zGRPy7CmbmMa9pdW2reztfqmueBqE+tT
         UDMCO08dO4wVonY3NEHYLZ1f92fC8L95IbfdZ1L8lzCquGhEjRlIFrTQFdKT1KH5xGOl
         KOCHM3Q1aCzIViplU72PrQAKq5u/U+4Y18HYvEKae+deQOsQ++B3ihfdizQg9MEeZpNl
         wdMA==
X-Gm-Message-State: AOJu0YxnQ0wB5YubpEc38E7gx875gYflhxjvlkdLazlXN9XVNtoAw3RG
	x8pT48CAlPlQPKguXUyBW9rTDGKovxNoH5NmHvAc/E6GZ0fR0XsuKMeGRbZ1BqTR8Ox+V7TzN1W
	L6JpGaB0=
X-Gm-Gg: AfdE7cmpviLhcEa3kzqXpnDUcZjhGKouvxQRp5HvWLIszfcttZWlf5xkIKofXZqTTf0
	AT2hq6Ri4bvXhcC/ae7ti8zw9XJ1EAwaCqbNaYH+e1mBdyVTpI98ZfuQowSNenM9wkc2jpu3b+Q
	wKDBcS5dPiiXlWAd0PGmt0WVk1edCFTCBxUk+2byLtHcy2tDtDg0CNrYrDZyyu4zduZwnnkq9Zm
	gwqaVsc3r5Qdht8fN4A2sV16GQl5T+Qsf/bAJF0Dxah+mQpmtDOi/F5Kc9LRvDx7qKp9Gd9e+P6
	n81PUdJPqzypxQmiB1KdJbdWISKgeYPjdqdPUHFFstntwbG5wFvAAox1/KPL6WSgWwOmwpnWbPq
	+eG8Rr25OXcRbl0L35QT9XCk1sSl8Ud5Fqi0Ueqeg/BzrTVo1appvY3bRqTjsfbuMTZKQflfMla
	LtMAGOt3FQxgvsa37fuln4K9itfn/lbwLoxfLqG+l6nD6o/Pbo36E8QekWTvAKEoXP35/BzO2ha
	rEbh3lur4uD9aRSRg==
X-Received: by 2002:a05:600d:8444:20b0:492:66fb:5dc5 with SMTP id 5b1f17b1804b1-493e68df9c2mr46269805e9.24.1783591632797;
        Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/25] qemu: Fix CVE-2026-2243
Date: Thu,  9 Jul 2026 12:06:36 +0200
Message-ID: <e1e719e9dfc6cf0b934e6f0057e2455e5e3b560c.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240567

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v10.0.9 stable backport for
CVE-2026-2243. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit links are recorded in the embedded patch headers
when the fix expands to multiple commits.

[1] https://gitlab.com/qemu-project/qemu/-/commit/37ff880a1252de304985c7e8493765014012ed2f
[2] https://access.redhat.com/security/cve/CVE-2026-2243

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-2243.patch             | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 73b2f3e6074..46cc7cb5cb0 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -51,6 +51,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-14876_p1.patch \
            file://CVE-2025-14876_p2.patch \
            file://CVE-2026-0665.patch \
+           file://CVE-2026-2243.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
new file mode 100644
index 00000000000..f67dae85dc9
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
@@ -0,0 +1,45 @@
+From 8480e4b3718302e7f63efb87e07720f70509c8c7 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/37ff880a1252de304985c7e8493765014012ed2f]
+
+Fixes: CVE-2026-2243
+Reported-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Signed-off-by: Halil Oktay (oblivionsage) <cookieandcream560@gmail.com>
+Reviewed-by: Kevin Wolf <kwolf@redhat.com>
+Signed-off-by: Kevin Wolf <kwolf@redhat.com>
+(cherry picked from commit cfda94eddb6c9c49b66461c950b22845a46a75c9)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+(cherry picked from commit 37ff880a1252de304985c7e8493765014012ed2f)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ block/vmdk.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/block/vmdk.c b/block/vmdk.c
+index d6971c706..7f63d0947 100644
+--- a/block/vmdk.c
++++ b/block/vmdk.c
+@@ -1949,10 +1949,10 @@ vmdk_read_extent(VmdkExtent *extent, int64_t cluster_offset,
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

