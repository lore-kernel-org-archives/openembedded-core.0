Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EB3C83F0B
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:29:08 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.14854.1751642944146892637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ilSOMlVJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7490702fc7cso697528b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751642943; x=1752247743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwY2tnW9pBDixL9msbdyPuY2Ns1nnrCCxP5JpeqW0Ek=;
        b=ilSOMlVJAxPICnlbgn+YLCdySqV3rCUFBjrbnvii3/fB+og0ZcfcLhfE8yVh16VeMQ
         dWupEmW1PCwEksYTw4F71KwzLg2dNvHeh9x4IBdANTIIm0u+NKGK32Ax7QohaWHuhR4S
         z7CKy5QDUr0dVGfwgvlZwEqW5J1q3rXoWySNU21QdpL4IN5fbXkKjz123mGi3YBtVa2Z
         J06rgGPCtY/D4ON1z7lzDVQuuenEoz18UceeVATu/caNCGu1jDrQopKPJ/rXq7AX+UNI
         LTJKiqCUHsgBszmzmjnYahciUk+NM02LT/DjCThYJpPDbs6TxTKn+EiK9WmXuy9sZIuu
         ZgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751642943; x=1752247743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwY2tnW9pBDixL9msbdyPuY2Ns1nnrCCxP5JpeqW0Ek=;
        b=mx4AUP0KxyqcVtCFH+xxN2aCKCwF9+YQJf6HPLqeoWOMFhe2Lk05rjb5/hX8L5QrHD
         N0AUeLwX/GE2O+vi1cfAEJfpECt6Z0643q8ddRsnIF3Rx/LXkbjhXqI5um/DXOIC6ZhC
         PXIh+wyvCi+BI4SOJcZfkLOTuSDO5fUXb+jR2nvPOBdaPg3LytYSnF7gqlHhGFFW7eSb
         a1mV+UgDkjnU641/khCxOa5G74G0zTiLpQQ20p8K08DqIowSlasziLlU1ca/eYYxRZQ+
         oWJhSCYwPcMzt+DJIcEVDIk2Vk915l4mC0iBBsLaAPKgMnqOJPlpdfkIRhDTQ9RyGqly
         a/Uw==
X-Gm-Message-State: AOJu0YzCzLseJZ4YAOvReqKC3km+9KafAjjj95DcuQKpEO0UXH51fiCp
	zZDcu5DKdRzK/D3O5vlca9opmNVnFbaXmusKzq/xoBuWiUR6B0mKsoeIUXgMCvx3DeBs6XwKlML
	Nm6mx
X-Gm-Gg: ASbGnctU58eZtPPqyCvP43jRLoWhfWwxyIv7a9MTRuhvzT6vBn+lwTJDT3ZMkhaAe2r
	mLm7D/Ns/fk/Oev2Xo7h9CdYUi8+vw/B3Xn/kDO2wLG9KOb4mIvW362Otmh2JSyeFijBvqC5IHY
	U9iKO0EryeR6U7RJyL7mZa0D9DMP9OiYmYzZ0FwyvKYb1KojCsCiMGiXRe5I9l4Bm+Yp5+6gffc
	VtTyEwkdWS77iB6nBtlKn878k4nrvhhu1w6jImjuSdl61CejM62522nbe5Z7hykm+daH5MoTC2U
	DUvnK6sVK1D8UpTRWQp7g8aGWKfGjlyXGAYjdtQM8fglVs9p2f8icA==
X-Google-Smtp-Source: AGHT+IHtRYnsz7S9wZbhWl0rik022xFbD9B/IibM3jUmZwBOW+fg95P/AmHj4UZCpfVDs9a7/rP9PA==
X-Received: by 2002:a05:6a21:699:b0:220:2caa:3018 with SMTP id adf61e73a8af0-225c06e84c9mr5088280637.24.1751642943284;
        Fri, 04 Jul 2025 08:29:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce42a1ca0sm2424232b3a.138.2025.07.04.08.29.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:29:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/9] libarchive: Fix CVE-2025-5914
Date: Fri,  4 Jul 2025 08:28:47 -0700
Message-ID: <4a4c6e0382834e03480e07f30ed5efa23f6c6fe2.1751641924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641924.git.steve@sakoman.com>
References: <cover.1751641924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219940

From: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Adds patch to backport fix for CVE-2025-5914.

Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5914.patch | 46 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
new file mode 100644
index 0000000000..5607420093
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
@@ -0,0 +1,46 @@
+From cb0d2b0c9a7f1672d4edaa4beacdd96e5b53ead1 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Sun, 11 May 2025 02:17:19 +0200
+Subject: [PATCH] rar: Fix double free with over 4 billion nodes (#2598)
+
+If a system is capable of handling 4 billion nodes in memory, a double
+free could occur because of an unsigned integer overflow leading to a
+realloc call with size argument of 0. Eventually, the client will
+release that memory again, triggering a double free.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5914
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/09685126fcec664e2b8ca595e1fc371bd494d209]
+Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
+---
+ libarchive/archive_read_support_format_rar.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 793e8e98..b9f5450d 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -335,8 +335,8 @@ struct rar
+   int found_first_header;
+   char has_endarc_header;
+   struct data_block_offsets *dbo;
+-  unsigned int cursor;
+-  unsigned int nodes;
++  size_t cursor;
++  size_t nodes;
+   char filename_must_match;
+ 
+   /* LZSS members */
+@@ -1186,7 +1186,7 @@ archive_read_format_rar_seek_data(struct archive_read *a, int64_t offset,
+     int whence)
+ {
+   int64_t client_offset, ret;
+-  unsigned int i;
++  size_t i;
+   struct rar *rar = (struct rar *)(a->format->data);
+ 
+   if (rar->compression_method == COMPRESS_METHOD_STORE)
+-- 
+2.49.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 87d3794ab7..4d0e3f7179 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -35,6 +35,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2024-48958.patch \
            file://CVE-2024-20696.patch \
            file://CVE-2025-25724.patch \
+           file://CVE-2025-5914.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


