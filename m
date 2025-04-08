Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0856C369A7
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6777.1744145482628633063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Aodkik39;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224191d92e4so57641045ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145482; x=1744750282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NApTa1aDCmWxQoPAXAMuu0ah98gCDaW6cQHYbjbbERk=;
        b=Aodkik39LGp116Q2f/Qg8cV37/KMPX4aiVY0q3TET4Q4F4aUPNK/y4DCGUZ91weRwr
         hLMgZdWBko6QcEx0UQKT02B1qmGAqkwHID9zkxNOlB5RPsmTIKdsIFxHcEV43qpsbuNE
         648QnoY7lMKCLm7OzWeGtK+Xpjw/s2A4WHqODPQ5Dx8J4Focbf1Vr9c19nipJXgcvt2h
         3mWM5oBHQOTiA0HtHvRZFqQRDNdnh+ZXv4KWj03V6HWpjaRlMoEVy8eagzUh878YPnF/
         q61x+su7tGIKtl5UWVpQvZzwU0XhHAZdpmUSaA/rNV6YGtXJgJFVlDY1ZeongIKPNRNu
         ADJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145482; x=1744750282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NApTa1aDCmWxQoPAXAMuu0ah98gCDaW6cQHYbjbbERk=;
        b=V88x135+rywFvuFsko7wPcOmIrH2EYjJkeUms6u0pXF7YMfNQMCTw/liTVrEpyKZfz
         ERtjzZQ02W0Jh0rYOKcqvoNvk+6FFanNIWF1daYfGw9LRnuZcCyO5b/PgX2v96SN6XdF
         Bqdmi0d4jDXZqgbi4vtT2N7qxbDAF7PFCz0U6SO5gxI5wJ2srU+QtObSentxW5P9GU4u
         U3xziQnN7AJNAf72caeWkdQluLi7j4VDPehmhQvgIs4aj75qOCGbZdinYfwItWS7Wzio
         ts1iOJYJfsx3olDO0fK+QP1ui7vyPhptAhoGKlNy6uGDaLKq2QNJi/M99j8b61L/xYqz
         1z9A==
X-Gm-Message-State: AOJu0YzrR2vMWwkoAsMPMg20tpnecJ4REuObhEtGHEuCvB07n8+BKZDo
	qmX4k/D5oJ9OZKpup9Znt2iExXt1NvKxZs/VgXW8EzXI5QqTEKo6IEgUxOB3b2z6nipjHPhAkjd
	z
X-Gm-Gg: ASbGncsRSR6GwL7DqdV+g4zsa2OXYW9RXkFWbMAIDdj2rsO9uE54VEmCsBR8UmPvnmQ
	jHWTJjgFbiwxFdUq+gmPu5xSXI4c9ZDUpoH/yQmeVRdQbMVzleh86moLLx2j+LH5F6rIa43tcLS
	l+uQot85nPqMo2IbhT4uZTaxQGJUSkv0Z/f7Z/XXgp2gWM1mk8YKGFelOXaY//oKwQqnxCpyVqQ
	igTrms02IZ7DDIitUVKfQcUBNFkWPRGDoMaIZkvIPVTWFP7N/mDdwJDhfqARpRXku4avHrWzc13
	IyH9eY31P/SDdnttRHkSMdxvXMK9brYFbCjb
X-Google-Smtp-Source: AGHT+IFugtXTCNHlHtqzz+u57GMrJudgEtYp9ebb1N52e9p4Ri1hXuOYIUo5cC2Rdipx/5q56tKKyA==
X-Received: by 2002:a17:902:ce89:b0:223:4b8d:32f1 with SMTP id d9443c01a7336-22ac3f3186amr2527355ad.1.1744145481656;
        Tue, 08 Apr 2025 13:51:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/10] ghostscript: Fix CVE-2025-27832
Date: Tue,  8 Apr 2025 13:51:01 -0700
Message-ID: <a1cd1e6275cc5ae3c100a3259e24d03937a4b78d.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214560

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=57291c846334f1585552010faa42d7cb2cbd5c41]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-27832.patch          | 45 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27832.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27832.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27832.patch
new file mode 100644
index 0000000000..c3a328bcc9
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27832.patch
@@ -0,0 +1,45 @@
+From 57291c846334f1585552010faa42d7cb2cbd5c41 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Wed, 20 Nov 2024 11:42:31 +0000
+Subject: Bug 708133: Avoid integer overflow leading to buffer overflow
+
+The calculation of the buffer size was being done with int values, and
+overflowing that data type. By leaving the total size calculation to the
+memory manager, the calculation ends up being done in size_t values, and
+avoiding the overflow in this case, but also meaning the memory manager
+overflow protection will be effective.
+
+CVE-2025-27832
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=57291c846334f1585552010faa42d7cb2cbd5c41]
+CVE: CVE-2025-27832
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ contrib/japanese/gdevnpdl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/contrib/japanese/gdevnpdl.c b/contrib/japanese/gdevnpdl.c
+index 60065bacf..4967282bd 100644
+--- a/contrib/japanese/gdevnpdl.c
++++ b/contrib/japanese/gdevnpdl.c
+@@ -587,7 +587,7 @@ npdl_print_page_copies(gx_device_printer * pdev, gp_file * prn_stream, int num_c
+     int code;
+     int maxY = lprn->BlockLine / lprn->nBh * lprn->nBh;
+ 
+-    if (!(lprn->CompBuf = gs_malloc(pdev->memory->non_gc_memory, line_size * maxY, sizeof(byte), "npdl_print_page_copies(CompBuf)")))
++    if (!(lprn->CompBuf = gs_malloc(pdev->memory->non_gc_memory, line_size, maxY, "npdl_print_page_copies(CompBuf)")))
+         return_error(gs_error_VMerror);
+ 
+         /* Initialize printer */
+@@ -683,7 +683,7 @@ npdl_print_page_copies(gx_device_printer * pdev, gp_file * prn_stream, int num_c
+     /* Form Feed */
+     gp_fputs("\014", prn_stream);
+ 
+-    gs_free(pdev->memory->non_gc_memory, lprn->CompBuf, line_size * maxY, sizeof(byte), "npdl_print_page_copies(CompBuf)");
++    gs_free(pdev->memory->non_gc_memory, lprn->CompBuf, line_size, maxY, "npdl_print_page_copies(CompBuf)");
+     return 0;
+ }
+ 
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 94a21d1dce..284ae3a28e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -65,6 +65,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27830.patch \
                 file://CVE-2025-27831-pre1.patch \
                 file://CVE-2025-27831.patch \
+                file://CVE-2025-27832.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.43.0


