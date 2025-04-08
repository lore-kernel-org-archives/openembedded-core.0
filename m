Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3654C369A6
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:57:59 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.71925.1744109873727928169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Gx6Uhysp;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22928d629faso53540455ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109873; x=1744714673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xrKrlt0XLCs+xL/eWyDYAHXx/6z/RunVEje9WW9f1M=;
        b=Gx6Uhysph4jBZX5B3u9FMUD0lUlrZ1s1NJ2cDLZL5YGnnZBMz+RPkBt3+UpnLatWAi
         T+4BJGnpnpwXH6dJ898ln7WBAY46fnnbJojYbOIfwEoDMBnjZXyhpaufNpf8/eqrAh9T
         bHosxsF6LeqQWEdo4D9Lg3bbnOFxNUpnyJI8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109873; x=1744714673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xrKrlt0XLCs+xL/eWyDYAHXx/6z/RunVEje9WW9f1M=;
        b=K3rxLJXyGxYqnlpqJzw80kCRoV6FohQLdYdxYcgVGG4coJxdMwb9r+h2WsKAznLGl5
         BAydD9NBsaGExo3js/P5zq7jxVvwMTa+M65n/GtUhPE5JREtGRtjPq1ns/ciP6uGKEg0
         MfoSmLnzLPY3fvnwQtcgRPcVI48T6w059DhR9H2gaToOdNtkuOG3PJRLNjSg28x21mLt
         2HaRKyxNTfhU77rAJQ3pNuT7qFG12BkOZWw4mlisgvfKoAv0FXZ51CPKfGQQWtqqfwOz
         xttGb1wrSIIu+WEXI2dfz1SInqQUgamqgq+tCuch3pGlRCtY3FAjedhhePJeldkLzq1o
         jNiQ==
X-Gm-Message-State: AOJu0YyMO0fFJbdt7m9uC+vc2JXSH5xV3QD6gMoqcgiZB5IVeNU4gpWF
	Qqsc39V6tMGKL/jlxuXM26KrXHiE8S4QW4NhFUqUiyN4qJnbhHOHQI12DktWicUr9wrTnjTSIyC
	aVVY=
X-Gm-Gg: ASbGncunizoy4Z2oCaLR45/dPSEWS9cSeMflQRKjIoCXCFcFO/+G88OaIivBaNm+X9n
	YV/yr26Uld13eeid54ezlqdh/oaUpHuly51ocDxFb8v2mTq+7VMU/ZLfm5ad6Ul/oCa/F/1cL2o
	Rv2hHgV928dstqmKcuxe6sw+pefKZgz6QLmXL1B2dlfrPfJ4EM+yf03tgIy63Ch3hDXMv+MoKOs
	bVygrUByvZ7bx+KeAY+wCbXNuG5M97EFLy2wpDBTeKnMK6Q1j8TmCGz6SDQBNyveE3WNEn5Q3Bp
	lW5b4qX5BNI5uXpvNt7/iYBZ7NkLUCVeXx+EicVs4BonrjlCi6WpfzYz
X-Google-Smtp-Source: AGHT+IHog8IjfcUVNe8RIkDWYAdGJUNcM/jcSiTOR49cUWc706ZraLsBIgGD2hjUMHpTAWhrvzYr9g==
X-Received: by 2002:a17:902:db07:b0:223:4d7e:e523 with SMTP id d9443c01a7336-22a8a8e45a0mr194313625ad.50.1744109872636;
        Tue, 08 Apr 2025 03:57:52 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:57:52 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/6] ghostscript: Fix CVE-2025-27832
Date: Tue,  8 Apr 2025 16:27:18 +0530
Message-Id: <20250408105721.1798123-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408105721.1798123-1-vanusuri@mvista.com>
References: <20250408105721.1798123-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214528

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=57291c846334f1585552010faa42d7cb2cbd5c41]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


