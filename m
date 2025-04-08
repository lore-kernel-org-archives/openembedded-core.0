Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C67CCC369A9
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.6956.1744145484543633265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PQBPNmX3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-225477548e1so58021495ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145484; x=1744750284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xTwZplyy2tqD0rhWPNpBIBYQUiWnXuLwpzuXZX7Sc8=;
        b=PQBPNmX3hl1Fg+hckGK3RyDNha6Ieol8ZR3yLTwo5HKV52x050aJyfffwyeSE4LJQK
         HqGVpst/Z8DZrBnEXHL4O9am/G6ceaJLhTtYSvUPTRSxDyq9qZQSYd1Qk4aBgeHhk6Oq
         MAVlvOj/wRXb44taZgQ2DiC0jCy3qYX3Fi5XwyiqofX0rze9ADDMZiNdT1RwcBq5XSkx
         ziAb70Cv/gg+jnyC4h1sCDCw7425MJvIEs07dnA3Y1mSXb3pks3bweIBucSw6vVK6vYq
         zbhakOwToRDg4ocUguVtMMUUwvHvOz0fsHjthhOBhRbSCWay4miEdP2ZU5iruYTfTkvz
         7opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145484; x=1744750284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xTwZplyy2tqD0rhWPNpBIBYQUiWnXuLwpzuXZX7Sc8=;
        b=ZQ6nQZf9V4h++i7uRygBMHJ7aBoZKiFlgcc4ZgGBO2IG+S2NwhzPjv5lUlc7wgUrVl
         Y5tDpYA6q2gfMz2398smYVrxP+qPp4C0jEFNKmgaTxImUL7hlo0P4LVplvl9tR+mokoM
         lPAm0LB20Xp5ZQf+ms9bmbyBARX1MbblkBflv//5kJOikSnfN3/ieV6R4THHSYU+mb36
         gzNSGa4Es/xxZYaHamu0twiZb4p1IMVvIikdREm0nZk6vr+ePpv41uArO5z7Tr3iZ6Gd
         hPmsltBiRcr08A4VuUOHN9u5XfqCYksvLn7YvAx+Es9jQ1tl6txAYvzF4OxRxwmCTmMm
         Z5dw==
X-Gm-Message-State: AOJu0YwJ7m2VgB0ssWLiXHZjfJd7V/Z7bBbKkSa4pwuKXW2Jag5OlZKu
	ZOekkQ9aZ0db/RBTEx0t8pOnFoWhEpUXXhJ5WoeH1diXgcKLn/rVU95lu6/PaEOFHLTj4rfuNRF
	f
X-Gm-Gg: ASbGncvI9L7BFn0nHShIIKQuE/uLGPjkKBxXqsH4Kn3ZTF5r/BbKcTA9pWz4j9lDcRn
	RXwoch2gL/RfsYxoW8Geyzctnr7RuZ3FoVgaqQeu9/CfTEiGzSFd3Yvj6l6GxPk8RTTHfQPxV+V
	22epzN8ne4lOfCrH0YSknJLH769bITVQ44e071MK5uVyWBvjeTvxWSTMqSYXbcMfZxLXmcT33eN
	2ajq0cCyiyM0elEZnrm4y3hk2yqWdGtp69qRW+fst4yo12bjcL6RuQT/JmehXB644KQqQkeu68B
	ZVNJKqM3UQVtH+MctULcJ6eA788Lhvs9FY+6
X-Google-Smtp-Source: AGHT+IGUHe+XTuNmucAXUof0O71tPC5bOfSk9mCoSVBwNy+XQCmKlNNSYtRgiZgTUyfgu2XgNEFdwg==
X-Received: by 2002:a17:903:2384:b0:220:cb1a:da5 with SMTP id d9443c01a7336-22ac2a2a88bmr9806255ad.40.1744145483568;
        Tue, 08 Apr 2025 13:51:23 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/10] ghostscript: Fix CVE-2025-27834
Date: Tue,  8 Apr 2025 13:51:02 -0700
Message-ID: <06fb236cabf550ea7c92cda0a725dd3db8a8a38b.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214561

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ef42ff180a04926e187d40faea40d4a43e304e3b]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


