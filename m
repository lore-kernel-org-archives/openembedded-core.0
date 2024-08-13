Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD80EC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:12 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.70863.1723551423565589739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m8ZKHAUt;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso3635414a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551423; x=1724156223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/WoQNQwb6yJcaU/aDZTovrQh3AlbWu3JPGhP+z0AQuQ=;
        b=m8ZKHAUtF3tLn0SzsWf1H6UCVQmPXC1fOLf9bMXcs7ehvCh/iN1Y86BDq8JtvYL19S
         aHFt6LCuvBV7zO8rnqj38cAI03kGfIY9Bz6BPLEL9NuGAh7crEbespBXEzN2dcgE4efF
         Qa8Bub7y+PbpBD0U5vgdaU2rXP16JJ9kPPcDlnlM+9h0+HXbuvYNyL/qQnYNtsP9tQtN
         1rsHwGNefYsQbYWIMGKay1nxF/l71r8c+xMDXq4ypdZRk2jEVBUtsat14RshPHbNeQiK
         VsJ0YID9kzlL+QqzS/lJF4cJBHg78Okbd/jbKMTmBdemxHuXH1kYGVZJtx24VbyJmnGQ
         qs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551423; x=1724156223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WoQNQwb6yJcaU/aDZTovrQh3AlbWu3JPGhP+z0AQuQ=;
        b=fViJPlQnTrC8+/YvDNNbnFdWEcFQAyO5rumT7GMy5KglIxw7oXtIYTGrsGy7LG3YN3
         RRJDL8ROZSRd67tzP4JVIo0Gn+SiuOdcHpqp87RIbNwTq+HZ06ZTMEo3WXDZbgamKyuL
         1rNPJZnLdEy02sSngvyYaX7GDh2tN5d6yZmgSO8Q0mH2wczTqcrMp+NM0bLGYk5P02PS
         mI05tBS0Ve20wCh96S2MYIEAHo8Gy7y1YWH+Pn4TY+cxnNobhqxQ9khbRdljr1VOh681
         EslrwnhmeV2MhRzb24Fnjz5v2IzY4Kjbm7MOIZRfhHIr/HnDfbOp0rARD6wNtfPqRPKZ
         9tYA==
X-Gm-Message-State: AOJu0Yxx1FdHXZjEMQjEJOtPNrfQcj3j6jsKTO+WtXeFLadxfK9hPHbT
	h5E63XgAAWVtc9JJfS6MTTaqxBshvoaqgsNvr4ThHtiRhJ1VAWOUwR8GdHS4p2b4ZJHX6M6+wbY
	Cjow=
X-Google-Smtp-Source: AGHT+IEOAfY7Qyr6TabS/8k6sgkkJgHdgu7tPC4B3biy5MX4oTGDIIXSsUFLF9j/0R4s+13r5RGEPQ==
X-Received: by 2002:a17:90b:3b44:b0:2c8:4250:66a7 with SMTP id 98e67ed59e1d1-2d394228aa3mr4103350a91.1.1723551422744;
        Tue, 13 Aug 2024 05:17:02 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/11] ghostscript: fix CVE-2024-29506
Date: Tue, 13 Aug 2024 05:16:43 -0700
Message-Id: <fe38420cf065788befeef25a1cb127e95c3cc729.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203270

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-29506.patch          | 45 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29506.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29506.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29506.patch
new file mode 100644
index 0000000000..9f3f3e5da2
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29506.patch
@@ -0,0 +1,45 @@
+From 77dc7f699beba606937b7ea23b50cf5974fa64b1 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 25 Jan 2024 11:55:49 +0000
+Subject: [PATCH] Bug 707510 - don't allow PDF files with bad Filters to
+ overflow the debug buffer
+
+Item #2 of the report.
+
+Allocate a buffer to hold the filter name, instead of assuming it will
+fit in a fixed buffer.
+
+Reviewed all the other PDFDEBUG cases, no others use a fixed buffer like
+this.
+
+CVE: CVE-2024-29506
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=77dc7f699beba606937b7ea23b50cf5974fa64b1]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ pdf/pdf_file.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/pdf/pdf_file.c b/pdf/pdf_file.c
+index 214d448..93c2402 100644
+--- a/pdf/pdf_file.c
++++ b/pdf/pdf_file.c
+@@ -767,10 +767,14 @@ static int pdfi_apply_filter(pdf_context *ctx, pdf_dict *dict, pdf_name *n, pdf_
+
+     if (ctx->args.pdfdebug)
+     {
+-        char str[100];
++	char *str;
++        str = gs_alloc_bytes(ctx->memory, n->length + 1, "temp string for debug");
++        if (str == NULL)
++            return_error(gs_error_VMerror);
+         memcpy(str, (const char *)n->data, n->length);
+         str[n->length] = '\0';
+         dmprintf1(ctx->memory, "FILTER NAME:%s\n", str);
++	gs_free_object(ctx->memory, str, "temp string for debug");
+     }
+
+     if (pdfi_name_is(n, "RunLengthDecode")) {
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index f738b0133f..525086e2af 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -53,6 +53,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29511-0001.patch \
                 file://CVE-2024-29511-0002.patch \
                 file://CVE-2024-29509.patch \
+                file://CVE-2024-29506.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


