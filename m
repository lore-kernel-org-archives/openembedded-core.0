Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E21C531DC
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:02 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.70597.1723551421964458765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=poNi7ISq;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso4202145a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551421; x=1724156221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jpt3ur/JHBbrOhMAKL498vRc5RfvQp8jtdkvuxcMsmQ=;
        b=poNi7ISqBmYhgpmYY+v0bIJP57sg8f6vl5ps3NlW5JPsx8jwKN3YyEjBXhogIVVQ+R
         MCF6QmVjvhvFl5tyaXQNeUfd+BB3/+FPVz8Fz3Z+eZNB9to0gpKGjhqIMRXNR5jRUXK0
         adANQFnd7ClQA/VXMOO4upv5nBYdhfjMQoaVQrIqd9mzvf/OOghjcb8mtWfKTGW/Dssv
         NMGIuD80OTmfdWlFadSdnWzh/gACINDKNWsPf0GBCqgmj/FxIV0ZnDWjX0QY3OHKehHQ
         R2oWT3Hy1YOr21oC8sF8TvBiYfgBfKJiVSocLsup5dYgx1fiHZ/cXDf7FHJg4pz7vIOo
         E1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551421; x=1724156221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jpt3ur/JHBbrOhMAKL498vRc5RfvQp8jtdkvuxcMsmQ=;
        b=aZkbbYBXHQPbXh5K6AXmafTJxR9G0fgK5pIkskaGvjcAIq3TYBRT/YhMKzX0jveg2O
         DACDjNGILdFSryXWBgY4AODXZDLu1MdteMazBPHBXLt1BOhuqnz4tT+Kk518Bqf5HPfX
         0n/fRYF/Urng2d2vnriR7YVJvoIKXxwQqgbtOVXJdUMzpzgq1Un9FgtRHi5vYKXlFGtY
         ttolygMfs329WiOfzpqLrTQr4mebh/UBYa+kMFnvqh8occ7Op9hwjKsAxTbUCewJNJpC
         HYwWGwltm/Tf5j19GKp6Hd1Z07w5700I3s35ooSSByi2dkvR0Zop75ltA6Hn2935i6Gh
         Us0Q==
X-Gm-Message-State: AOJu0YwpJxMV/vqI1LZR8HnTIZs/+VfymfX2+wpJvjPi4nX6lBQTpSUg
	GeYoeqTCcXTDvewklW7EjcnIS2B+RYdaCmvqunRLolOh5v4T7RkiwtAdGIDO8DS7uZV0kwDNgns
	L/+k=
X-Google-Smtp-Source: AGHT+IExbIvm9bcupqdT3zku9MT5F1U9+k6etqawIZTvRQc/S0St6iRR4bgUjxkvFz2THvVW8eU9BA==
X-Received: by 2002:a17:90b:4c4c:b0:2c9:7f3d:6aea with SMTP id 98e67ed59e1d1-2d3926547b0mr3566565a91.32.1723551421002;
        Tue, 13 Aug 2024 05:17:01 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/11] ghostscript: fix CVE-2024-29509
Date: Tue, 13 Aug 2024 05:16:42 -0700
Message-Id: <545c6d11ddd707099d40c947934addbdcbd20e8f.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203269

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-29509.patch          | 45 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch
new file mode 100644
index 0000000000..8de97f91a0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch
@@ -0,0 +1,45 @@
+From 917b3a71fb20748965254631199ad98210d6c2fb Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 25 Jan 2024 11:58:22 +0000
+Subject: [PATCH] Bug 707510 - don't use strlen on passwords
+
+Item #1 of the report. This looks like an oversight when first coding
+the routine. We should use the PostScript string length, because
+PostScript strings may not be NULL terminated (and as here may contain
+internal NULL characters).
+
+Fix the R6 handler which has the same problem too.
+
+CVE: CVE-2024-29509
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=917b3a71fb20748965254631199ad98210d6c2fb]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pdf/pdf_sec.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pdf/pdf_sec.c b/pdf/pdf_sec.c
+index ff60805..2bb59e1 100644
+--- a/pdf/pdf_sec.c
++++ b/pdf/pdf_sec.c
+@@ -1250,7 +1250,7 @@ static int check_password_R5(pdf_context *ctx, char *Password, int PasswordLen,
+         if (code < 0) {
+             pdf_string *P = NULL, *P_UTF8 = NULL;
+
+-            code = pdfi_object_alloc(ctx, PDF_STRING, strlen(ctx->encryption.Password), (pdf_obj **)&P);
++	    code = pdfi_object_alloc(ctx, PDF_STRING, PasswordLen, (pdf_obj **)&P);
+             if (code < 0) {
+                 return code;
+             }
+@@ -1300,7 +1300,7 @@ static int check_password_R6(pdf_context *ctx, char *Password, int PasswordLen,
+         if (code < 0) {
+             pdf_string *P = NULL, *P_UTF8 = NULL;
+
+-            code = pdfi_object_alloc(ctx, PDF_STRING, strlen(ctx->encryption.Password), (pdf_obj **)&P);
++	    code = pdfi_object_alloc(ctx, PDF_STRING, PasswordLen, (pdf_obj **)&P);
+             if (code < 0)
+                 return code;
+             memcpy(P->data, Password, PasswordLen);
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index ab4a2def4c..f738b0133f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -52,6 +52,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-52722.patch \
                 file://CVE-2024-29511-0001.patch \
                 file://CVE-2024-29511-0002.patch \
+                file://CVE-2024-29509.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


