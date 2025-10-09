Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D86FCCD190
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:39 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.9199.1760038293960516893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=14w2FU+i;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781db5068b8so1128440b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038293; x=1760643093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIpQ48BRe4XOSD8bCq/Mox4fu85/QmK+w/sE2nMPMmI=;
        b=14w2FU+isRIMC7sfYvQGXJ7nMDox3FOXsIELz0+ufnKwnsHHoWAN41mYLCdQS6wz+F
         7KSecJqUdDQFyjNsjSPkzbZm66PuHE6gaoXExndekfuDs5hiFa/sT3+lhEYCN9BAc7zK
         zAP1Oev+ByYhZFBFXCP2DpBJhJa0edB3ccWjBygTVymESO9Du/wxvETqK8Wvxrw5eGyv
         WjfQWyrdPI6xM+al2NPA3pTJ6iEtiPo97L6On9vKYXEXHwlWLdjZerfcVVlBLmuJKqNm
         nlswt0ztk4TC/pttsqo0CbgBSLNTQh5npARUzxzpeTkm0+q/OLwZ6jf6HHYSSwfLBmKK
         UgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038293; x=1760643093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIpQ48BRe4XOSD8bCq/Mox4fu85/QmK+w/sE2nMPMmI=;
        b=AXcQdYGlzIcjaFALZjK4qW7EmbZtnemlmn0zKgzH5idoQ8N8vQg2ajE5BhGzk6TlFX
         fw5eGs9KJufy8luKSBVaHL9l0sor7wrwxYYC23b0eTp9xDZOEdjcWd77bE4q5QP9kFQo
         wqP4fU+CWPKEvpet/wkNx+4xjypLIokXiGDaKVPVDovrkmwAjIpxoXcIoCve6/XNkCem
         YTCUi3AZfZhm2geIioD5a6DYbSFI3hMNNljaONpVxlwSLj7q6FCNR4zIbzyrBIOEdErN
         wGWyoP8SaO4o77fcWp8d75YCO8kHnChbkO6rJz2uwkueZVpAMWMwza8FWckLiTPZa+ra
         4VmA==
X-Gm-Message-State: AOJu0YzAnqGMYBzio9jlSR+wJSKgtewac5Z2HIHAqc6ZSnSVrxX8ZpHv
	QJOMMPwWSG3VsuZ+zdSG/rDBiET7nuGX+fkRItm9DamgKGR/XgKYA/84ekfMOpX79iiZLWtqIKr
	4xSSv
X-Gm-Gg: ASbGnctw4HYGCZxOls8h3UTuUvsMZu3l4L2q1NfUho4767kDkKQktbrNF9y1Yysb6Od
	FU3LN0GWPn21rZgbMmOI6aq5o4kZJQfZT9yr1h9HnWqO4xWAL7gVP6D8ZlEPLXVSgQAsfBJZfsv
	gsfkTYaWoaqKCnwRRY9MiF1Eg+TW5+4xaub3OE8wem9qr2kNNUp4CwhUFeqPPjVZi+GpdhEeTSz
	hHz6fm/K6hsDg4JRMT357Ehg6MMtGK0M27lub4NPH9JKIVzRp406PBD72kUKQJkPa0Gm4XvGbP3
	ruohAloLrTJz7/ILE3E4NsNGK7Ufl/tWqSYnn/DMoSbzloQCWpsYcQYOWapSj4z7XI/SBFXWjFU
	AZYvWRmAjxc3qESh+5DrK0AZ+4/QbM567HyE8pQ==
X-Google-Smtp-Source: AGHT+IG5pwkNiFd2+a2pNhpPhkdapK7Fd3NfmBEIhuV1gV5bGUn+D+z3vgH8C1ZrhjtifMcsMYX5+Q==
X-Received: by 2002:a05:6a00:1492:b0:772:4319:e7df with SMTP id d2e1a72fcca58-793883da697mr9044960b3a.30.1760038292899;
        Thu, 09 Oct 2025 12:31:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/24] ghostscript: patch CVE-2025-59798
Date: Thu,  9 Oct 2025 12:30:54 -0700
Message-ID: <dc65da274b26c1e7f4143154cd7639a93cc658be.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224629

From: Peter Marko <peter.marko@siemens.com>

Pick commit mentioned in the NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


