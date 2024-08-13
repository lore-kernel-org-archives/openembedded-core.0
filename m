Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94C6C531DD
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:02 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.70859.1723551418388311335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=jlxQ+PKl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2d37e5b7b02so1201229a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551418; x=1724156218; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKUVVJ67JNicFiJX+eFys8XL/yicbm7iI2MkA2g6jf4=;
        b=jlxQ+PKlH00TMbe4dFjo3vAs9MrmuJYMS3A8jpmhPkq9vqj5VSCWfU0DbPtBr9QHNW
         cZXIldHmVputN+f6ys1XhLx6FxG9Fjy6SHaIO9SFG/MO0vcm3tXzxXTD78lBb1fKJLEX
         +fil2ENrnR+mCIBVZ3dSP8YFdiTkCmjipD4BB0gDo1Qv/Y8LEEYkv9cYEZkZemrOvyk8
         ZenaXWpLV2m7frL2bK2afUWcv9f+X1B/miawFIKA11zzW1b0r+6ZqrpJ5LuY2B6tdULb
         Ql3NBxHlPlJz/7k8owwhxDJT3Kwhj8DKunclJtSBCGODO/Dtfu8DtuhGxIXWBOPf+P7/
         i2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551418; x=1724156218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKUVVJ67JNicFiJX+eFys8XL/yicbm7iI2MkA2g6jf4=;
        b=brG+EV2dHeVd8tiMFzc9dBg3ymhigPly+q15rSZ44/bW+hBQqJ2Wr7mtOvy2MwpcFz
         uBQTtWwo0hvC0nFT9acYAGhUROXzzonefaCKZdf1U2bBQ64yX0UsRlGoP54sqxsCbtqc
         25WIr2nS9v7uzoDS+M3+RTIKjfrNNB3jjeWTQTFlpJfpMHCL/sV3nbnKxzwe/FjXjhsn
         Cs02q9UhYjfh799mHYhkUmvPNZPSZ5JJJYn3Z4dY/i8ZHEhA9THJQwsU2QG1d+GnLs6p
         +UhJIrzErg6Uzv1z8QGh8Ey2dPCqkAE4LofX+qUfBANsFKUntD5HoxIFTWIplIRVs0to
         QRNQ==
X-Gm-Message-State: AOJu0YxYQ40jfrC8fRN8ckEIHGbRl5DzbYwkIzyJScYdFJPKMeFcvwAF
	MtBYTV+zG5bOmLLBlitxYjJPtwUjOQmMVt1sqIIazWzWzjRekYYUPFHVObQtKuuZeueef3XS7V0
	9MXg=
X-Google-Smtp-Source: AGHT+IFuAGpOSp4r5IgIQXgj1w8vMAGD8hd0vqvaupp61WcbvWt9JnbLvg++/tfFt9qF8b1hJW/wuA==
X-Received: by 2002:a17:90b:281:b0:2c9:6cf4:8453 with SMTP id 98e67ed59e1d1-2d39261dd1amr3691259a91.31.1723551417336;
        Tue, 13 Aug 2024 05:16:57 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.16.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:16:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/11] ghostscript: fix CVE-2024-29511
Date: Tue, 13 Aug 2024 05:16:40 -0700
Message-Id: <76a33cc0e1967c24e760202947e6f4f80bcdb9cf.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203267

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-29511-0001.patch     | 100 ++++++++
 .../ghostscript/CVE-2024-29511-0002.patch     | 219 ++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 3 files changed, 321 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0002.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0001.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0001.patch
new file mode 100644
index 0000000000..fa46f3429a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0001.patch
@@ -0,0 +1,100 @@
+From 638159c43dbb48425a187d244ec288d252d0ecf4 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 31 Jan 2024 14:08:18 +0000
+Subject: [PATCH 1/2] Bug 707510(5): Reject OCRLanguage changes after SAFER
+ enabled
+
+In the devices that support OCR, OCRLanguage really ought never to be set from
+PostScript, so reject attempts to change it if path_control_active is true.
+
+CVE: CVE-2024-29511
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=3d4cfdc1a44b1969a0f14c86673a372654d443c4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevocr.c         | 15 ++++++++++-----
+ devices/gdevpdfocr.c      | 15 ++++++++++-----
+ devices/vector/gdevpdfp.c | 15 ++++++++++-----
+ 3 files changed, 30 insertions(+), 15 deletions(-)
+
+diff --git a/devices/gdevocr.c b/devices/gdevocr.c
+index 88c759c..287b74b 100644
+--- a/devices/gdevocr.c
++++ b/devices/gdevocr.c
+@@ -187,11 +187,16 @@ ocr_put_params(gx_device *dev, gs_param_list *plist)
+
+     switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+         case 0:
+-            len = langstr.size;
+-            if (len >= sizeof(pdev->language))
+-                len = sizeof(pdev->language)-1;
+-            memcpy(pdev->language, langstr.data, len);
+-            pdev->language[len] = 0;
++            if (pdev->memory->gs_lib_ctx->core->path_control_active) {
++                return_error(gs_error_invalidaccess);
++            }
++            else {
++                len = langstr.size;
++                if (len >= sizeof(pdev->language))
++                    len = sizeof(pdev->language)-1;
++                memcpy(pdev->language, langstr.data, len);
++                pdev->language[len] = 0;
++            }
+             break;
+         case 1:
+             break;
+diff --git a/devices/gdevpdfocr.c b/devices/gdevpdfocr.c
+index 8dd5a59..4c694e3 100644
+--- a/devices/gdevpdfocr.c
++++ b/devices/gdevpdfocr.c
+@@ -50,11 +50,16 @@ pdfocr_put_some_params(gx_device * dev, gs_param_list * plist)
+
+     switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+         case 0:
+-            len = langstr.size;
+-            if (len >= sizeof(pdf_dev->ocr.language))
+-                len = sizeof(pdf_dev->ocr.language)-1;
+-            memcpy(pdf_dev->ocr.language, langstr.data, len);
+-            pdf_dev->ocr.language[len] = 0;
++            if (pdf_dev->memory->gs_lib_ctx->core->path_control_active) {
++                return_error(gs_error_invalidaccess);
++            }
++            else {
++                len = langstr.size;
++                if (len >= sizeof(pdf_dev->ocr.language))
++                    len = sizeof(pdf_dev->ocr.language)-1;
++                memcpy(pdf_dev->ocr.language, langstr.data, len);
++                pdf_dev->ocr.language[len] = 0;
++            }
+             break;
+         case 1:
+             break;
+diff --git a/devices/vector/gdevpdfp.c b/devices/vector/gdevpdfp.c
+index 42fa1c5..23e9bc8 100644
+--- a/devices/vector/gdevpdfp.c
++++ b/devices/vector/gdevpdfp.c
+@@ -458,11 +458,16 @@ gdev_pdf_put_params_impl(gx_device * dev, const gx_device_pdf * save_dev, gs_par
+         gs_param_string langstr;
+         switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+             case 0:
+-                len = langstr.size;
+-                if (len >= sizeof(pdev->ocr_language))
+-                    len = sizeof(pdev->ocr_language)-1;
+-                memcpy(pdev->ocr_language, langstr.data, len);
+-                pdev->ocr_language[len] = 0;
++                if (pdev->memory->gs_lib_ctx->core->path_control_active) {
++                    return_error(gs_error_invalidaccess);
++                }
++                else {
++                    len = langstr.size;
++                    if (len >= sizeof(pdev->ocr_language))
++                        len = sizeof(pdev->ocr_language)-1;
++                    memcpy(pdev->ocr_language, langstr.data, len);
++                    pdev->ocr_language[len] = 0;
++                }
+                 break;
+             case 1:
+                 break;
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0002.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0002.patch
new file mode 100644
index 0000000000..34f6d23e85
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0002.patch
@@ -0,0 +1,219 @@
+From 360153f3aa63c8fef0d507eccde75f46342c5264 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Wed, 31 Jan 2024 14:08:18 +0000
+Subject: [PATCH 2/2] Bug 707510(5)2: The original fix was overly aggressive
+
+The way the default OCRLanguage value was set was for the relevant get_params
+methods to check if the value had been set, and if not return a default value.
+This could result in the first time the put_params seeing that value being after
+path control has been enabled, meaning it would throw an invalidaccess error.
+
+This changes how we set the default: they now uses an init_device method, so
+the string is populated from the device's creation. This works correctly for
+both the default value, and for values set on the command line.
+
+CVE: CVE-2024-29511
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=638159c43dbb48425a187d244ec288d252d0ecf4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevocr.c         | 17 ++++++++++++++++-
+ devices/gdevpdfocr.c      | 28 ++++++++++++++++++++++------
+ devices/vector/gdevpdf.c  | 15 +++++++++++++++
+ devices/vector/gdevpdfp.c |  3 ++-
+ 4 files changed, 55 insertions(+), 8 deletions(-)
+
+diff --git a/devices/gdevocr.c b/devices/gdevocr.c
+index 287b74b..a616ef4 100644
+--- a/devices/gdevocr.c
++++ b/devices/gdevocr.c
+@@ -30,6 +30,7 @@
+ #define X_DPI 72
+ #define Y_DPI 72
+
++static dev_proc_initialize_device(ocr_initialize_device);
+ static dev_proc_print_page(ocr_print_page);
+ static dev_proc_print_page(hocr_print_page);
+ static dev_proc_get_params(ocr_get_params);
+@@ -55,6 +56,7 @@ ocr_initialize_device_procs(gx_device *dev)
+ {
+     gdev_prn_initialize_device_procs_gray_bg(dev);
+
++    set_dev_proc(dev, initialize_device, ocr_initialize_device);
+     set_dev_proc(dev, open_device, ocr_open);
+     set_dev_proc(dev, close_device, ocr_close);
+     set_dev_proc(dev, get_params, ocr_get_params);
+@@ -79,6 +81,7 @@ hocr_initialize_device_procs(gx_device *dev)
+ {
+     gdev_prn_initialize_device_procs_gray_bg(dev);
+
++    set_dev_proc(dev, initialize_device, ocr_initialize_device);
+     set_dev_proc(dev, open_device, ocr_open);
+     set_dev_proc(dev, close_device, hocr_close);
+     set_dev_proc(dev, get_params, ocr_get_params);
+@@ -102,6 +105,17 @@ const gx_device_ocr gs_hocr_device =
+ #define HOCR_HEADER "<html>\n <body>\n"
+ #define HOCR_TRAILER " </body>\n</html>\n"
+
++static int
++ocr_initialize_device(gx_device *dev)
++{
++    gx_device_ocr *odev = (gx_device_ocr *)dev;
++    const char *default_ocr_lang = "eng";
++
++    odev->language[0] = '\0';
++    strcpy(odev->language, default_ocr_lang);
++    return 0;
++}
++
+ static int
+ ocr_open(gx_device *pdev)
+ {
+@@ -187,7 +201,8 @@ ocr_put_params(gx_device *dev, gs_param_list *plist)
+
+     switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+         case 0:
+-            if (pdev->memory->gs_lib_ctx->core->path_control_active) {
++                if (pdev->memory->gs_lib_ctx->core->path_control_active
++                && (strlen(pdev->language) != langstr.size || memcmp(pdev->language, langstr.data, langstr.size) != 0)) {
+                 return_error(gs_error_invalidaccess);
+             }
+             else {
+diff --git a/devices/gdevpdfocr.c b/devices/gdevpdfocr.c
+index 4c694e3..e4f9862 100644
+--- a/devices/gdevpdfocr.c
++++ b/devices/gdevpdfocr.c
+@@ -33,9 +33,9 @@
+ #include "gdevpdfimg.h"
+ #include "tessocr.h"
+
+-int pdf_ocr_open(gx_device *pdev);
+-int pdf_ocr_close(gx_device *pdev);
+-
++static dev_proc_initialize_device(pdf_ocr_initialize_device);
++static dev_proc_open_device(pdf_ocr_open);
++static dev_proc_close_device(pdf_ocr_close);
+
+ static int
+ pdfocr_put_some_params(gx_device * dev, gs_param_list * plist)
+@@ -50,7 +50,8 @@ pdfocr_put_some_params(gx_device * dev, gs_param_list * plist)
+
+     switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+         case 0:
+-            if (pdf_dev->memory->gs_lib_ctx->core->path_control_active) {
++                if (pdf_dev->memory->gs_lib_ctx->core->path_control_active
++                && (strlen(pdf_dev->ocr.language) != langstr.size || memcmp(pdf_dev->ocr.language, langstr.data, langstr.size) != 0)) {
+                 return_error(gs_error_invalidaccess);
+             }
+             else {
+@@ -152,6 +153,8 @@ pdfocr8_initialize_device_procs(gx_device *dev)
+ {
+     gdev_prn_initialize_device_procs_gray(dev);
+
++    set_dev_proc(dev, initialize_device, pdf_ocr_initialize_device);
++    set_dev_proc(dev, initialize_device, pdf_ocr_initialize_device);
+     set_dev_proc(dev, open_device, pdf_ocr_open);
+     set_dev_proc(dev, output_page, gdev_prn_output_page_seekable);
+     set_dev_proc(dev, close_device, pdf_ocr_close);
+@@ -185,6 +188,7 @@ pdfocr24_initialize_device_procs(gx_device *dev)
+ {
+     gdev_prn_initialize_device_procs_rgb(dev);
+
++    set_dev_proc(dev, initialize_device, pdf_ocr_initialize_device);
+     set_dev_proc(dev, open_device, pdf_ocr_open);
+     set_dev_proc(dev, output_page, gdev_prn_output_page_seekable);
+     set_dev_proc(dev, close_device, pdf_ocr_close);
+@@ -216,6 +220,7 @@ pdfocr32_initialize_device_procs(gx_device *dev)
+ {
+     gdev_prn_initialize_device_procs_cmyk8(dev);
+
++    set_dev_proc(dev, initialize_device, pdf_ocr_initialize_device);
+     set_dev_proc(dev, open_device, pdf_ocr_open);
+     set_dev_proc(dev, output_page, gdev_prn_output_page_seekable);
+     set_dev_proc(dev, close_device, pdf_ocr_close);
+@@ -703,7 +708,18 @@ ocr_end_page(gx_device_pdf_image *dev)
+     return 0;
+ }
+
+-int
++static int
++pdf_ocr_initialize_device(gx_device *dev)
++{
++    gx_device_pdf_image *ppdev = (gx_device_pdf_image *)dev;
++    const char *default_ocr_lang = "eng";
++
++    ppdev->ocr.language[0] = '\0';
++    strcpy(ppdev->ocr.language, default_ocr_lang);
++    return 0;
++}
++
++static int
+ pdf_ocr_open(gx_device *pdev)
+ {
+     gx_device_pdf_image *ppdev;
+@@ -726,7 +742,7 @@ pdf_ocr_open(gx_device *pdev)
+     return 0;
+ }
+
+-int
++static int
+ pdf_ocr_close(gx_device *pdev)
+ {
+     gx_device_pdf_image *pdf_dev;
+diff --git a/devices/vector/gdevpdf.c b/devices/vector/gdevpdf.c
+index 9ab562c..5caabb8 100644
+--- a/devices/vector/gdevpdf.c
++++ b/devices/vector/gdevpdf.c
+@@ -206,6 +206,7 @@ device_pdfwrite_finalize(const gs_memory_t *cmem, void *vpdev)
+ }
+
+ /* Driver procedures */
++static dev_proc_initialize_device(pdfwrite_initialize_device);
+ static dev_proc_open_device(pdf_open);
+ static dev_proc_output_page(pdf_output_page);
+ static dev_proc_close_device(pdf_close);
+@@ -223,6 +224,7 @@ static dev_proc_close_device(pdf_close);
+ static void
+ pdfwrite_initialize_device_procs(gx_device *dev)
+ {
++    set_dev_proc(dev, initialize_device, pdfwrite_initialize_device);
+     set_dev_proc(dev, open_device, pdf_open);
+     set_dev_proc(dev, get_initial_matrix, gx_upright_get_initial_matrix);
+     set_dev_proc(dev, output_page, pdf_output_page);
+@@ -766,6 +768,19 @@ pdf_reset_text(gx_device_pdf * pdev)
+     pdf_reset_text_state(pdev->text);
+ }
+
++static int
++pdfwrite_initialize_device(gx_device *dev)
++{
++#if OCR_VERSION > 0
++    gx_device_pdf *pdev = (gx_device_pdf *) dev;
++    const char *default_ocr_lang = "eng";
++    pdev->ocr_language[0] = '\0';
++    strcpy(pdev->ocr_language, default_ocr_lang);
++#endif
++    return 0;
++}
++
++
+ /* Open the device. */
+ static int
+ pdf_open(gx_device * dev)
+diff --git a/devices/vector/gdevpdfp.c b/devices/vector/gdevpdfp.c
+index 23e9bc8..42a1794 100644
+--- a/devices/vector/gdevpdfp.c
++++ b/devices/vector/gdevpdfp.c
+@@ -458,7 +458,8 @@ gdev_pdf_put_params_impl(gx_device * dev, const gx_device_pdf * save_dev, gs_par
+         gs_param_string langstr;
+         switch (code = param_read_string(plist, (param_name = "OCRLanguage"), &langstr)) {
+             case 0:
+-                if (pdev->memory->gs_lib_ctx->core->path_control_active) {
++                if (pdev->memory->gs_lib_ctx->core->path_control_active
++                && (strlen(pdev->ocr_language) != langstr.size || memcmp(pdev->ocr_language, langstr.data, langstr.size) != 0)) {
+                     return_error(gs_error_invalidaccess);
+                 }
+                 else {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 2e332b1589..ab4a2def4c 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -50,6 +50,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-33871-0002.patch \
                 file://CVE-2024-29510.patch \
                 file://CVE-2023-52722.patch \
+                file://CVE-2024-29511-0001.patch \
+                file://CVE-2024-29511-0002.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


