Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4265CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 22:11:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.2612.1759875109502243723
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 15:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OjWcVmMI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202510072211478c2e1a887500020705-en0vuo@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202510072211478c2e1a887500020705
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 00:11:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=mhDJ7g8miOrOvt7C+pUVfpIlWvAUif6OZojftgizrKg=;
 b=OjWcVmMI5d0jO8WnuEmwrHXh7R5NM3Ry2FW7LyIgFpJLvdSno88WGs0WBvlSbigAFRUmgR
 PudX4JOlQrfBfsHpLLD39GSXfgGTLgK33Naz167Qx1P6nCD5NcMQpMtoOYv0BU9axLbQqMqA
 nGWaQSFgN/cCjREwplPg8M4Ixr+aoGGUrIAqsZMdgCxHldvmfVDGt5GTcAbxEp0bMvQGG2UQ
 PbKdaVHSCoIimQR6oJ0usNp3NLz3/3D82ZTiX4+hgBqOrPjyZhVAVtHLtenPPxSBSA7i/Nt0
 21kh58iJc68wlP3in6UkOXg3+T0Df2HmHVoPJKe+dCKArDNfyeRPrfMQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 1/3] ghostscript: patch CVE-2025-59798
Date: Wed,  8 Oct 2025 00:11:40 +0200
Message-Id: <20251007221142.2772021-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 22:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224571

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../ghostscript/CVE-2025-59798.patch          | 134 ++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
new file mode 100644
index 0000000000..2520e698b5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
@@ -0,0 +1,134 @@
+From 0cae41b23a9669e801211dd4cf97b6dadd6dbdd7 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 22 May 2025 12:25:41 +0100
+Subject: [PATCH] pdfwrite - avoid buffer overrun
+
+Bug #708539 "Buffer overflow in pdf_write_cmap"
+
+The proposed fix in the report solves the buffer overrun, but does not
+tackle a number of other problems.
+
+This commit checks the result of stream_puts() in
+pdf_write_cid_system_info_to_stream() and correctly signals an error to
+the caller if that fails.
+
+In pdf_write_cid_system_info we replace a (rather small!) fixed size
+buffer with a dynamically allocated one using the lengths of the strings
+which pdf_write_cid_system_info_to_stream() will write, and a small
+fixed overhead to deal with the keys and initial byte '/'.
+
+Because 'buf' is used in the stream 's', if it is too small to hold all
+the CIDSystemInfo then we would get an error which was simply discarded
+previously.
+
+We now should avoid the potential error by ensuring the buffer is large
+enough for all the information, and if we do get an error we no longer
+silently ignore it, which would write an invalid PDF file.
+
+CVE: CVE-2025-59798
+Upstream-Status: Backport [https://github.com/ArtifexSoftware/ghostpdl/commit/0cae41b23a9669e801211dd4cf97b6dadd6dbdd7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ devices/vector/gdevpdtw.c | 52 ++++++++++++++++++++++++++++++---------
+ 1 file changed, 41 insertions(+), 11 deletions(-)
+
+diff --git a/devices/vector/gdevpdtw.c b/devices/vector/gdevpdtw.c
+index ced15c9b2..fe24dd73a 100644
+--- a/devices/vector/gdevpdtw.c
++++ b/devices/vector/gdevpdtw.c
+@@ -694,7 +694,8 @@ static int
+ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
+                           const gs_cid_system_info_t *pcidsi, gs_id object_id)
+ {
+-    byte *Registry, *Ordering;
++    byte *Registry = NULL, *Ordering = NULL;
++    int code = 0;
+ 
+     Registry = gs_alloc_bytes(pdev->pdf_memory, pcidsi->Registry.size, "temporary buffer for Registry");
+     if (!Registry)
+@@ -725,14 +726,19 @@ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
+         }
+         s_arcfour_process_buffer(&sarc4, Ordering, pcidsi->Ordering.size);
+     }
+-    stream_puts(s, "<<\n/Registry");
++    code = stream_puts(s, "<<\n/Registry");
++    if (code < 0)
++        goto error;
+     s_write_ps_string(s, Registry, pcidsi->Registry.size, PRINT_HEX_NOT_OK);
+-    stream_puts(s, "\n/Ordering");
++    code = stream_puts(s, "\n/Ordering");
++    if(code < 0)
++        goto error;
+     s_write_ps_string(s, Ordering, pcidsi->Ordering.size, PRINT_HEX_NOT_OK);
++error:
+     pprintd1(s, "\n/Supplement %d\n>>\n", pcidsi->Supplement);
+     gs_free_object(pdev->pdf_memory, Registry, "free temporary Registry buffer");
+     gs_free_object(pdev->pdf_memory, Ordering, "free temporary Ordering buffer");
+-    return 0;
++    return code;
+ }
+ 
+ int
+@@ -777,31 +783,55 @@ pdf_write_cmap(gx_device_pdf *pdev, const gs_cmap_t *pcmap,
+     *ppres = writer.pres;
+     writer.pres->where_used = 0; /* CMap isn't a PDF resource. */
+     if (!pcmap->ToUnicode) {
+-        byte buf[200];
++        byte *buf = NULL;
++        uint64_t buflen = 0;
+         cos_dict_t *pcd = (cos_dict_t *)writer.pres->object;
+         stream s;
+ 
++        /* We use 'buf' for the stream 's' below and that needs to have some extra
++         * space for the CIDSystemInfo. We also need an extra byte for the leading '/'
++         * 100 bytes is ample for the overhead.
++         */
++        buflen = pcmap->CIDSystemInfo->Registry.size + pcmap->CIDSystemInfo->Ordering.size + pcmap->CMapName.size + 100;
++        if (buflen > max_uint)
++            return_error(gs_error_limitcheck);
++
++        buf = gs_alloc_bytes(pdev->memory, buflen, "pdf_write_cmap");
++        if (buf == NULL)
++            return_error(gs_error_VMerror);
++
+         code = cos_dict_put_c_key_int(pcd, "/WMode", pcmap->WMode);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         buf[0] = '/';
+         memcpy(buf + 1, pcmap->CMapName.data, pcmap->CMapName.size);
+         code = cos_dict_put_c_key_string(pcd, "/CMapName",
+                         buf, pcmap->CMapName.size + 1);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         s_init(&s, pdev->memory);
+-        swrite_string(&s, buf, sizeof(buf));
++        swrite_string(&s, buf, buflen);
+         code = pdf_write_cid_system_info_to_stream(pdev, &s, pcmap->CIDSystemInfo, 0);
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         code = cos_dict_put_c_key_string(pcd, "/CIDSystemInfo",
+                         buf, stell(&s));
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
+         code = cos_dict_put_string_copy(pcd, "/Type", "/CMap");
+-        if (code < 0)
++        if (code < 0) {
++            gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+             return code;
++        }
++        gs_free_object(pdev->memory, buf, "pdf_write_cmap");
+     }
+     if (pcmap->CMapName.size == 0) {
+         /* Create an arbitrary name (for ToUnicode CMap). */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 4d696159e0..c9fcaa7a16 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -76,6 +76,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27836-1.patch \
                 file://CVE-2025-27836-2.patch \
                 file://CVE-2025-48708.patch \
+                file://CVE-2025-59798.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \

