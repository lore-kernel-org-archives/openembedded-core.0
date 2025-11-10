Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24702CCFA1A
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 07:06:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42753.1762758377813208352
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Nov 2025 23:06:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JwbNULRQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29806bd47b5so5323445ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Nov 2025 23:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762758377; x=1763363177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsG6ZZigudpiDUqZ+zH24vOQKopwCl3Ru+ahzEo3wog=;
        b=JwbNULRQPBAnn9VEkPmf2Yf6qDCJOulLJHLFoqJ3jJIQFF0+6PRny1/pPU/JYZ4LJR
         Kw3t71oyUFJAPBdK92L1xqIrnkabeu3C7YvsQWrHtJPYe+msIvzmpbNWE1Q9oi5x69kx
         LPkj7qzHRwHK3+vnY/QXhe+ErrmeYwyYcVen8E/s5xC85BdIOKSf6e7wekBGL3vktYz2
         ge4mh7UeysB1veR5Y52cJgeKlI72r9unxppS8a+uQ9Juqj1QBUlRNFh8AVAiK26Blzzi
         o9ON7P0LbvaMP11f3CijrvcQa+NAHycVmyGW4g2QrtmJMhHsX3mgVlNmoZoRYwdEVfek
         t57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762758377; x=1763363177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bsG6ZZigudpiDUqZ+zH24vOQKopwCl3Ru+ahzEo3wog=;
        b=SvRsiKudTLYixcW6uq9JsIk/jINyubSxbZDt+yPv128AEDrrirDgAlFzq2J+Games1
         tOA4ol83ruj0GXyxm1juhuboZoaOcMFF8a4lf44L7dYNM5nkWWX95Btrn4PHnNpCsHSv
         DbXBH5eVmyhnhgaKnigPWUOtCvTXlV625mDLA9CNdwW8sMHOw+efO7JMlPgWQl60GDPK
         j8vxT5Pmp+vlaniByD1HFma3eHn6zRqgt/6nQ1FHlGcKiovp8KEKVQhpgPbWpx9UF3rm
         6uHO2M6nA2EuCzQPYRz9lgDR0Fm2I/ZQAzGLlzaQ1Oqly+ZVtp2oBOKddy+1Z3IIHFrf
         iOQg==
X-Gm-Message-State: AOJu0YwBGpSJFkkE929xvwAP3xG05cA+ZuDERjrFtt6J3ufTzw/Z9u7r
	vCS6AidktM6lXd/fdFPlfUebwXpmJyr7juqGyzALxaW6QIUK7GTs9g5uX2QjGw==
X-Gm-Gg: ASbGnctsVtkZXtdDJq0p+gqpY+fNiQPoSHNJ3dPE9RRri3KBFBtaoAqRlEusr/zzULs
	qqwXj0AHnHzYG5Qun2zLUGmgXzDG204Zt7Z6FeieGhn2f9PgloqmrsO3GkqmMDwSAvSOa5NvKTh
	OCbtktkJpatVwWjSpC57OyWEbr5rosiSquxmJE5Im2QevNsN3JF1Te/XKYDZNDZuulwo9S+1evP
	Iw/P6OwZRA79JBGDEtL+qNG7Oan3s7H4CMcd5wwqBycOtLCM18JWSyWy0jMnbOFUuoB7UbeM/0L
	+Kni8wOpf0s/A7qCsBuwpFvpQV5oNdLnBMk3dH0UAVFf6MBK8uaNMov+6roCaM5R69L7qzl8FnQ
	48B2JWqYkIKpLzEA+ekqav6FiNSe43Y80osD27TsYd5xT2yzxNwse1GKiGDsDClCoz2paLoMynC
	DEg6I0cmOg4b0CbQ==
X-Google-Smtp-Source: AGHT+IERLvk8eQ40QjAn1vz6fqjuhC4UC5UbMovNzO/Ddb2JzIxERNFgUaYiL4YAXZX9UFCP6OZ1Rg==
X-Received: by 2002:a17:902:e888:b0:295:8a21:155a with SMTP id d9443c01a7336-297e56d6144mr96160555ad.35.1762758376822;
        Sun, 09 Nov 2025 23:06:16 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba901c3817csm11511337a12.30.2025.11.09.23.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:06:16 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][walnascar][PATCH 3/3] ghostscript: patch CVE-2025-59800
Date: Mon, 10 Nov 2025 20:06:04 +1300
Message-ID: <20251110070604.444927-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110070604.444927-1-ankur.tyagi85@gmail.com>
References: <20251110070604.444927-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 07:06:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226102

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-59800

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ghostscript/CVE-2025-59800.patch          | 37 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
new file mode 100644
index 0000000000..1d0eca322d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
@@ -0,0 +1,37 @@
+From c7660900e280d55e86c842691a794911c671c30f Mon Sep 17 00:00:00 2001
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
+(cherry picked from commit 176cf0188a2294bc307b8caec876f39412e58350)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ devices/gdevpdfocr.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/devices/gdevpdfocr.c b/devices/gdevpdfocr.c
+index 1c1e8eab8..7c9c12f8c 100644
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
index a8347283be..57a1098521 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -27,6 +27,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://avoid-host-contamination.patch \
            file://CVE-2025-59798.patch \
            file://CVE-2025-59799.patch \
+           file://CVE-2025-59800.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"

