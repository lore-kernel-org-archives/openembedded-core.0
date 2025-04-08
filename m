Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D81EC369A5
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:57:59 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.71927.1744109877852696143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=eP6065aN;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2241053582dso67767015ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109877; x=1744714677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LJIZ9UoACqUpf1B5qaDBGQeyZFyoC0X07tD4xV9YyM=;
        b=eP6065aN8BiB1MxzMJgDzTEb6jZApLbntCjlx3J9Z+aymVdQOBSsFzUG8fFO/SzCXt
         /P4WOebvPzIvHmIWFN4m7joDS4fTy6w/hV6O/de/jZwmBML+fDe+bqcpvZeqZNpGpKO2
         ZlcWbQ1qGOaGr1v/L6EEk+Em76kwR2we1gK54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109877; x=1744714677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LJIZ9UoACqUpf1B5qaDBGQeyZFyoC0X07tD4xV9YyM=;
        b=t5qVIcWSb4O+xRtCoBHb5m+u+j0tqtD2SgURxW/7Ddem/2G4k/f2VgY+MPfvN2AoHK
         8yMz3YRu0s/8YuHGS9ToJLAf2AdJlnXGuydb/7F0oKOTm6ZUWqhIKkFL0xFW90QoYHFW
         82FpDqqaVC+k4TxrQY7v6Hs/HYNNeqwb5GoacFX+aPn363AIztOzxNcxWx/x03DBKIsc
         qBwKGhbAOz2zFzkMG15KKTOz50jn2x+tk3RtbPy1MC4iW75/LzYmsrSPDNfzYiHqdRGP
         41Q08ClL2rx3wa4ggOj2FoCQFBSg6m+c9a1eV7my8nns7ibM9Ab8hp1dKP+msbVciPr4
         xGTQ==
X-Gm-Message-State: AOJu0Yxis7ZIMBppyjiXP1Ia56nE1FiveHTZ4a8U/u+nS6SFyPerW7F8
	FFr8vXIi0UyYWtLkcHcsS7q9fzx6szmrTlxLX6fhZX62XsMa4Bj1kYI7elxIzyhIire1ng6W/1f
	sQKI=
X-Gm-Gg: ASbGncsTgfnPaPefqhtXdrQndj296v2EcMBhs46Cpd7k5g2OR06EQRlBxmIExz4YbUC
	k8aTuV8IwwA028veSg/dbmV4Miw6rMaA7mmXDJBqcf2ZdMPYLkeaWCFCsb2O/4CZpozreWabaMx
	amSjM5MNfpU+yV8ruRG2e07KlJyc4AJuYyhx+NmTcf8YOV9bF/yCr8ojD47JvHwYPGaWtJTiNIK
	s4Qv8Iv8m/UyyJSF30qfGqz018oKPqkjwTIqSWGUYb+2alnMd3eGg6Pp+OTN17ktBPeOjwrlpqL
	8yX3dqrT2hivCUdFt0Xe81UTKHLZNlCfsu4kF/LXwV1DNhFWlkBlljy4FnM4X4cinF8=
X-Google-Smtp-Source: AGHT+IEnVmboStCNJ1OU1rh5xmtc9PyBcGZpzVw500WuDW6X6NY2o2Q4Nt4xY9uXf2DAGGHFsKySow==
X-Received: by 2002:a17:902:d584:b0:223:f639:69df with SMTP id d9443c01a7336-22a8a0a3ab2mr242441745ad.41.1744109876879;
        Tue, 08 Apr 2025 03:57:56 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:57:56 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/6] ghostscript: Fix CVE-2025-27834
Date: Tue,  8 Apr 2025 16:27:19 +0530
Message-Id: <20250408105721.1798123-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408105721.1798123-1-vanusuri@mvista.com>
References: <20250408105721.1798123-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214529

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ef42ff180a04926e187d40faea40d4a43e304e3b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../ghostscript/CVE-2025-27834.patch          | 57 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27834.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27834.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27834.patch
new file mode 100644
index 0000000000..66e13ca729
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27834.patch
@@ -0,0 +1,57 @@
+From ef42ff180a04926e187d40faea40d4a43e304e3b Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 20 Jan 2025 16:13:46 +0000
+Subject: [PATCH] PDF interpreter - Guard against unsigned int overflow
+
+Bug #708253 - see bug report for details.
+
+CVE-2025-27834
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ef42ff180a04926e187d40faea40d4a43e304e3b]
+CVE: CVE-2025-27834
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pdf/pdf_func.c | 13 +++++++++++++
+ 1 file changed, 13 insertions(+)
+
+diff --git a/pdf/pdf_func.c b/pdf/pdf_func.c
+index 9b7d5bb..423e544 100644
+--- a/pdf/pdf_func.c
++++ b/pdf/pdf_func.c
+@@ -153,6 +153,9 @@ pdfi_parse_type4_func_stream(pdf_context *ctx, pdf_c_stream *function_stream, in
+     byte *p = (ops ? ops + *size : NULL);
+ 
+     do {
++	if (*size > max_uint / 2)
++	    return gs_note_error(gs_error_VMerror);
++
+         code = pdfi_read_bytes(ctx, &c, 1, 1, function_stream);
+         if (code < 0)
+             break;
+@@ -318,6 +321,11 @@ pdfi_build_function_4(pdf_context *ctx, gs_function_params_t * mnDR,
+     if (code < 0)
+         goto function_4_error;
+ 
++    if (size > max_uint - 1) {
++	code = gs_note_error(gs_error_VMerror);
++	goto function_4_error;
++    }
++
+     ops = gs_alloc_string(ctx->memory, size + 1, "pdfi_build_function_4(ops)");
+     if (ops == NULL) {
+         code = gs_error_VMerror;
+@@ -816,6 +824,11 @@ int pdfi_build_halftone_function(pdf_context *ctx, gs_function_t ** ppfn, byte *
+     if (code < 0)
+         goto halftone_function_error;
+ 
++    if (size > max_uint - 1) {
++	code = gs_note_error(gs_error_VMerror);
++	goto halftone_function_error;
++    }
++
+     ops = gs_alloc_string(ctx->memory, size + 1, "pdfi_build_halftone_function(ops)");
+     if (ops == NULL) {
+         code = gs_error_VMerror;
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 284ae3a28e..376d4a300e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -66,6 +66,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27831-pre1.patch \
                 file://CVE-2025-27831.patch \
                 file://CVE-2025-27832.patch \
+                file://CVE-2025-27834.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


