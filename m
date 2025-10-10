Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BD3CCD18C
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:00 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.2338.1760064652977534882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TJGNr1pP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-793021f348fso1520717b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064652; x=1760669452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y90LQ2JHVFmB9zk6azx/OC0j4qEiUAhRSnfWxgYQtBk=;
        b=TJGNr1pPNeaErbcGV2bHd7xu//d0LpAEGlsTqfSphr6nXPJDPLlv8qwF93DOZT6MLz
         buzayiIJlvbFmz4CqA4nPjZwZTCZ4vHBSmZLhPmIjKhUfeSAAoI/Y9OaLdk16AKUP5aJ
         lA4vkQsDh3unIJfJ97SBcgXv3x3x9QjlJ+YXMoLISWLlnL/EnMQFcFcQd4x/4l77pX6x
         gRGVqqQOIH7cwfIz+5CaMEvJQw07Xjm0CJaTbldBUyIc/b4iv+Bq1Yz2Hzm1NP9D2u+X
         jTFaBmXtyt1vBUC7KS8YSp0i4UrVMWoZxG0EUNEsJdAbArinsVDYxc3b95mvVNiI/Ak/
         Y+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064652; x=1760669452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y90LQ2JHVFmB9zk6azx/OC0j4qEiUAhRSnfWxgYQtBk=;
        b=ASM6azu7q400d1ntOGxzEGAMEXmFi4fGz9cxLOeqv+isWlpIetyPnq3ydwfvzh5Vpv
         nNcPyEDe1RwS3giUI9ffYD0qFsWdd7/iJuT7IabiNBZhlyV5V2ArmUctGGN3f6qysGpe
         67pSiElh2a+E9/dPpleOd7nk8Az1K4N3cKMBIHY5v60ErBHDDM0KpqzXWtlo5xPEnurZ
         6ZdbDb1MjKGGBqq/uyBKIDJcyIbYmKOkIoZOuqhOODzaykT6aTfs1IRlanBhOqEBYbeS
         a4za+w+PkUeGOaKoSj945jTx+EyU4raiIlm1zxh8rhnasqfMgCUwiWhCiEpMeBdmfoba
         lBcA==
X-Gm-Message-State: AOJu0Yz67xNkc9UnG89NLeY0R/MWqgirtiCV6yxvlfukA6Wsui+o8Gu8
	5S5qvoDq3Otyfv0TXZxq0TcKXGkLbnAy4n1Kx79CsQbXNOoXsV7uI48bBJCR3KqGUAZ/GeV1JoS
	SSihX
X-Gm-Gg: ASbGnctFfruaSEwYQXYctRD9tZh5ZyOoBT+1zHKMvp3oNwCgkede5W9JrIerPIitqSQ
	MyFwYA1mVFNTSqrRhteAwHe3N6e2GpiTzrLTbPt0mWg1xjWVngb4rdp2H8vUc1zbfC3P1JZd8TG
	wCKZLNKS48hytbLYs0BS7TALyA6oSfbmVOaBm9OJa4ZOAqM6TQhRAl2NkSALsa16QSizxl5zotm
	gAMxO3DMQDqwlzd+xUtkPuqUaZgv2w4lBtwpHYACepJp343G5w1W6ix9QtqZZS5ZJhM++KoLhwa
	mEl8ZmeuhnOb3o+BKiSOzoKtD0f97Xzw/4t1MxIDPijVPg6hqRNY8N/G5exPo+SjBx8GIP3LZIo
	q5r6YtLaflq2NNjknI8ikrNGy6i5TnUWP
X-Google-Smtp-Source: AGHT+IGnl/FG6pBztWidAc/eWEm6J/IJ4j/GLMM2VFgfiH2Oc9f3v4EkRP/Rk7Qljr5zMmOlmRTWWw==
X-Received: by 2002:a05:6a00:a8f:b0:781:24ec:c8f4 with SMTP id d2e1a72fcca58-793857098bamr10407750b3a.3.1760064652111;
        Thu, 09 Oct 2025 19:50:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.50.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:50:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/18] ghostscript: patch CVE-2025-59798
Date: Thu,  9 Oct 2025 19:50:24 -0700
Message-ID: <4a2f47d9541d7a13da7a9ce16bd5088870c45ec4.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224649

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-59798.patch          | 134 ++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
new file mode 100644
index 0000000000..9432126e85
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
+@@ -703,7 +703,8 @@ static int
+ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
+                           const gs_cid_system_info_t *pcidsi, gs_id object_id)
+ {
+-    byte *Registry, *Ordering;
++    byte *Registry = NULL, *Ordering = NULL;
++    int code = 0;
+ 
+     Registry = gs_alloc_bytes(pdev->pdf_memory, pcidsi->Registry.size, "temporary buffer for Registry");
+     if (!Registry)
+@@ -734,14 +735,19 @@ pdf_write_cid_system_info_to_stream(gx_device_pdf *pdev, stream *s,
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
+@@ -786,31 +792,55 @@ pdf_write_cmap(gx_device_pdf *pdev, const gs_cmap_t *pcmap,
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index bd34058517..0ae939e780 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -25,6 +25,7 @@ def gs_verdir(v):
 SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
+           file://CVE-2025-59798.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"
-- 
2.43.0


