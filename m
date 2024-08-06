Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9303BC3DA64
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 06:36:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1301.1722926166788777641
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Aug 2024 23:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=894872e6a1=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4765Cu7s022240
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Aug 2024 06:36:06 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40s9ry2gnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:36:05 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 23:36:03 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] ghostscript: fix CVE-2024-29511
Date: Tue, 6 Aug 2024 06:35:51 +0000
Message-ID: <20240806063551.771825-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: mckrVl-eFxa6s84M8ytJ8TLTaQ9dUyxd
X-Proofpoint-GUID: mckrVl-eFxa6s84M8ytJ8TLTaQ9dUyxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_05,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408060046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203013

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


