Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CB1CCD18E
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.2321.1760064655680145375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pcj6NEpG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f605f22easo1474119b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064655; x=1760669455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d21zjycU/xUT8v3gVMd0Abe+DbIDLVEAOUPDydRy++I=;
        b=pcj6NEpGRp1OGBvvKOn8XQzZEPR5+tecVXSvOUpoAFfBsonRZz+WeCJJ82XAkZ8HIA
         r+e3lUjW9E5a2kYQK4yKz/V+MoYHIX4uySOgAUdhyg+FRF3SFbv5vEvoz7kL0xWZ4dF5
         aoviA6bOpuKZv8vZBQY9eCv3dnpmzq4jBVHRVM+vcI2k5BiZZBSqeUe0mHbJ+/HKusNK
         8NdbxkFIeO6l62yKmP3Gt3rjvLd5BVvn9TZZbvH1N58gCjqo9wt/KJtiivWSNNDpxdMZ
         kxzUaxlpeoxYbv7gLKc0P6a28izbQZf6IPOBGK5ijEzp9M8MuShDFutbwh46Wl6Dqid7
         nMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064655; x=1760669455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d21zjycU/xUT8v3gVMd0Abe+DbIDLVEAOUPDydRy++I=;
        b=BcnqwMXzwUh7GJKmlcRqvOMMCQ5P5G/v9VH3Dl+wkR2Ld8nGlJcDoYAZ+3TbHGdkyY
         k17ozGDSmEwBGREf62ECPl49IbOfzbAaeHCoeRv60dnyPpmrNIj8ee56C6HlL0f4nDM9
         0GAAKHegGfFgA8zFj/XX+nILsiWWYGW2G+VBvyIqZj8STbIjGsjow7FRNuSE8vdtNW2Q
         zZF7b32+oMOG45+WJx+et1tZfSLu+eeghhpbVvxA1ay8/hOMUVaSQYXoAN+mCs0ztE7Z
         UV08wUw4m2qZMEJcZ+G0IZPFh1v6p2Jq3lL6yg5cMWdRDtrPcXeUsYsy+BkwvRWjulzJ
         QswA==
X-Gm-Message-State: AOJu0YzirYQQ8trgnpnLaTeiFhBY2t0A8tRjW2GPih6BAlwBWoZdKyvy
	f5HgK7ncbAJ2oOkgKEj1Y8LG3aHFk1sFgxX+rzidrd7MDtimqts0EctYhxJYZvyZhGFb9PZYt3K
	yaVVw
X-Gm-Gg: ASbGncuqkSiR33DelFJyZlpyWwYAGE4NWL3JslALpNB/xVV4xqMUAbwgOQ1tJ6lWfSy
	QRC4FI2NX3yaEpjB8mWcin5MdPAJZagGfBnhpKa39Af/IHohGvF2BKiMmsEwistdJq5wOiW4L+J
	uRU/FReOobwPf4clnoEmsCXC3iXAEDGwngrHC/EmJpcyhON0J9JzaPcuXVq5ju5tJlsdBU1rttx
	wy33mnLCbhHRzWaoLR30pDf/pRazu7RX6u93FjYBWv7B8NdLa3RijaMiwcrq+KK90Kts8ZiWgMy
	V4+G3b5po6KmuyXY2dAE/blM6zLReUP7vZIyrUnGTv5/Aym3+KLBI9xiTr40o5bHNXwPMKuMjtL
	fPSbOGDRnoRDZ7VpdkND5PIpt8Wl/lsKlh9Wp0g==
X-Google-Smtp-Source: AGHT+IE+92SxcmCsBfpnT42+MZE5IVaGOr0Ay6Z6BZ37VgadYixURafqdYQqLKYGtNSy4YDgB65NFg==
X-Received: by 2002:a05:6a20:938e:b0:309:99e3:c6f5 with SMTP id adf61e73a8af0-32da83e68a9mr13981192637.48.1760064654901;
        Thu, 09 Oct 2025 19:50:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/18] ghostscript: patch CVE-2025-59800
Date: Thu,  9 Oct 2025 19:50:26 -0700
Message-ID: <a63bb2ccc8294c8a97f5957f1ca9f0a4880713ac.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224651

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-59800.patch          | 36 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
new file mode 100644
index 0000000000..5d50865271
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
@@ -0,0 +1,36 @@
+From 176cf0188a2294bc307b8caec876f39412e58350 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 1 Jul 2025 10:31:17 +0100
+Subject: [PATCH] PDF OCR 8 bit device - avoid overflow
+
+Bug 708602 "Heap overflow in ocr_line8"
+
+Make sure the calculation of the required raster size does not overflow
+an int.
+
+CVE: CVE-2025-59800
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/176cf0188a2294bc307b8caec876f39412e58350]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/gdevpdfocr.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/devices/gdevpdfocr.c b/devices/gdevpdfocr.c
+index f27dc11db..6362f4104 100644
+--- a/devices/gdevpdfocr.c
++++ b/devices/gdevpdfocr.c
+@@ -521,9 +521,12 @@ ocr_line32(gx_device_pdf_image *dev, void *row)
+ static int
+ ocr_begin_page(gx_device_pdf_image *dev, int w, int h, int bpp)
+ {
+-    int raster = (w+3)&~3;
++    int64_t raster = (w + 3) & ~3;
+ 
+-    dev->ocr.data = gs_alloc_bytes(dev->memory, raster * h, "ocr_begin_page");
++    raster = raster * (int64_t)h;
++    if (raster < 0 || raster > max_size_t)
++        return gs_note_error(gs_error_VMerror);
++    dev->ocr.data = gs_alloc_bytes(dev->memory, raster, "ocr_begin_page");
+     if (dev->ocr.data == NULL)
+         return_error(gs_error_VMerror);
+     dev->ocr.w = w;
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 0f123d4899..a48ad671c7 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            file://CVE-2025-59798.patch \
            file://CVE-2025-59799.patch \
+           file://CVE-2025-59800.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
-- 
2.43.0


