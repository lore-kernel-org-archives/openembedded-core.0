Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E1CCD192
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.9200.1760038296930530821
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xpKOEZKL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-791c287c10dso1285738b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038296; x=1760643096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qHhnjvs+02QskC0v/5XPDbhZzRBJF93lDl5I4oeqGXw=;
        b=xpKOEZKL1RXvVBd5/nwlMcuMjADgCxkcKg+vHWtgxKrBkOG4dcBwxG0leEDd1UsVYO
         PZXHoDTxN5jjehmYmafZN8YWwejwPfphkkPL5ztXvZAwMvC7dO43aHGwi5NzsxBJ5igT
         FIJke+6AUMt/kk0CrnJlYnSxR5fG4UItl6mSVklDPMVYdsJJW9fqxGz0t1I92Y8TSgVL
         wp+yL60weOnMi9/WPTaiFn/jCCK/f0SSTbbhT7cZejRThMYCuBr+tP9ibIbdzOgcRLPL
         uhin+r/6AxQbDv/Me78pF4r5CAhhAXKTsleJWl7clspJe+uUaft6DmRHfpfq5uOPhh9Y
         5Uzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038296; x=1760643096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHhnjvs+02QskC0v/5XPDbhZzRBJF93lDl5I4oeqGXw=;
        b=mytZSeKgFps/wnOQBQnf7VKLhCpL8YQ47wFm9g4w5q8HGec0PLHjwuO3opDxWtyKOg
         rNOL/cYceXdwCOvohE9CHGTvJ55Nu2vgJl+jwWHcRVR/SpXMSGws10u+OtltSAIEp9Bx
         BnUHRP403q7z+G3JT5hU7NjEQM4izuZqqSzvxMF3PbX92L9E336iZ4G5nmsB/ey797al
         GIsBKWC76P1r6dqd5ul+STQvH/fOTLJZEo0D8HEvZMNvgiXjw5kYi+eRuRfMrf+QSSKR
         YeTfV8XBumxbSgx1tNRu19TAoBZ8xczvJxW4RYDxOmp0hGPo+bsXZLY6OxNTChczLEue
         +EVA==
X-Gm-Message-State: AOJu0YyFQ/cXp8tpLKR8lY/jXKc6QGquu9Qy+8DDsWPdshV2KtQcDJ/E
	HSx0bqcA0dnGXFV+J0rvAZ21vLVD6ympEE9AKzNDnAmmGvcE4kij2KaHapr1oApZCPfAEepIELF
	SPFeD
X-Gm-Gg: ASbGncutdP7E3I+a51ICWnIh5o4GWL0Xv8lag0Kwg637hlxwA8/abyC5manVuQTjXLQ
	WoVpdIsJw3TscW8/Yvv+hp4mBNuT7cUk4Sl3+5zhHybpia8kOR7FUpMKIIi4M1HlKfF/T3SQYll
	B7lRnuMtIkGmY5NsI8koegbty9EDC9lrMdAlAi+mPSY/Q73KMDGxhnVomRmUbmlbKCiub0p3b+4
	Cmo+HCGnWAMsfUraqDYNU/hZU1qTHWUPdP1OZygH8cgvJYPe4dPsDFlKRYxlZDj5u3ThgkJlumU
	rIITYCpyr6zEOuudhrXP9CibsjJrueIRzXlUh0BQVHCnhK35+g7dBCfQgz4zpIVDF+A10ka8EfY
	aEWlxynpG3Dx83HP2262E6hrfhcwDJvdsNf++vA==
X-Google-Smtp-Source: AGHT+IFYmAKV/UeXtojNW33GgpqOF8tEd8G7dl9tJ0fwX04u1xTfc+bYYGHkvjZMsRvYAozrUR9g/Q==
X-Received: by 2002:a05:6a20:3d1c:b0:32b:83af:317 with SMTP id adf61e73a8af0-32da812f6edmr11342162637.15.1760038296107;
        Thu, 09 Oct 2025 12:31:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/24] ghostscript: patch CVE-2025-59800
Date: Thu,  9 Oct 2025 12:30:56 -0700
Message-ID: <5109fd6675b6782f10f86f774fe54b6ccecee415.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224631

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-59800.patch          | 36 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 349c007e94..b8195e3eff 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -78,6 +78,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-48708.patch \
                 file://CVE-2025-59798.patch \
                 file://CVE-2025-59799.patch \
+                file://CVE-2025-59800.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.43.0


