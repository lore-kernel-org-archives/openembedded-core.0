Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB482C43458
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:56 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140021.1783291375748382712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nAN2XsZW;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-470174001a0so1066995f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291374; x=1783896174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldeoBLJWi8V3x5pjYZVgd3KaRTFT0tIHnaanI4mdT+A=;
        b=nAN2XsZWqKa3jjLILOy70DCJm7Y9rogX5QSc4OwpEYD6K63avp64qhQuREt4QxH/Y9
         xhml6m0/pT1loTHK+mREOBGv14vK+BOir723McnjLznfLCWzO/efYbcA4nI6WfLsoc1i
         UEeJJ3wOOzvBGrMwgjV43aasOc6xx1gQslw6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291374; x=1783896174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldeoBLJWi8V3x5pjYZVgd3KaRTFT0tIHnaanI4mdT+A=;
        b=MAYOXrkJZlJIdhoDHZX33dCnPxb0GWFit+fNNRQea2Czg4mrXsoqYC2MVOaC8p4ISw
         JcBNhcKkfsRfJvjmg1IUM933iPZV99Sf+caiY7bLKJhONtwaivFl9n7hQaKeo7R6Zy+l
         /uP5+6Gvj5b3NVi/WNeXJ0lvrXOrydcO08OuF2zAgN9CCP17Ue/9ZCvZmSqr7HSVvrUl
         P36XjXbmhb6eOAG4Mc0OZFmYJN6F/pugCC5fZ5tXFZmgunUeAr0QJDq3XGYwOkVDGH4T
         LCIYtqvLeCf2cpbYdwWZIMW6r9XLZleOcLXNaGrly5KvPE+VQS6+d93BrpxjDRIRGyCq
         jUOQ==
X-Gm-Message-State: AOJu0YydnQrFKhvezEnOeKSk51MBA87mBZMN6bhlcg+70QIxiXmfKhbR
	bT8WaEbvSmu+gHD3unTJSwgqHn8ccu+EYNLVYQwUXQ86xAJjo6lfhiMQvR/7tGsz9wngZYn/K4W
	JdeKhl+M=
X-Gm-Gg: AfdE7cky85KyxkIYEGqdW74MkR8g0+7pHQexAf63yQWk8xOi5EMWAf0DGDHd78X+tWd
	FTlxZpyb0NJP6NyYGZ53XiG5S8jSjwq3qhNtPi4tx3MAH9FNYHBWjZdY63+L+EDfQFOehRFOBH9
	gp5JFN+3JqrIof/nwGnINkilvcpUuaa3kBYe8AYw7gWYSCPZgSDRC4IkYSzCtyPotzUL91lAHSj
	BKRDfsumy66RWSNypLmaydgDYuAa7DaVW1L/1oFc48XFXIZH9nXtHNoAz7NDrvn6JXIvd8OghH5
	mz/F+qQPf0HBVdDrPSy8E0lYNpxWe5L9cTiE634cGeYEkEmcq1ccST8raplfnYhZQvkJthyC2R9
	MPNWggiaPb1qxUqFfxoEkwwz9kKdIapMmMZszclK+TFbEEtE0+oDriFItSIeMiKkaJ37pvxMG0n
	p+mAmHPbO2tVYici7B5Wdm6vaXwQ==
X-Received: by 2002:a05:6000:2408:b0:45e:eaed:afd2 with SMTP id ffacd0b85a97d-47aa7ca8972mr9487586f8f.0.1783291374009;
        Sun, 05 Jul 2026 15:42:54 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:53 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/55] qemu: Fix CVE-2026-2243
Date: Mon,  6 Jul 2026 00:41:10 +0200
Message-ID: <af29a0da6edf8c7586745213244905b0dbfb69d5.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240173

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream stable-10.2 backport for CVE-2026-2243.
The upstream fix commit is referenced in [1], and the public CVE advisory
is referenced in [2].

[1] https://gitlab.com/qemu-project/qemu/-/commit/86b5130fefbe476f3c0a85b9e136f9e3fd518689
[2] https://github.com/advisories/GHSA-cw9w-w7fx-35q6

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2026-2243.patch             | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4b6c2252b7f..1d493ee1a32 100644
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
index 00000000000..bb2cb63b915
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

