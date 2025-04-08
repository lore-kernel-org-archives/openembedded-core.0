Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C74C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:51:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.6782.1744145487638089536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 13:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iffsyEq9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224191d92e4so57641445ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 13:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744145487; x=1744750287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tSVoUWwj8yZjrKHa1gy9/Ql4BN9AaKBR0PUj0FZYEY=;
        b=iffsyEq9g/bb6en1hI8vuYB/C/HqPObqJHUh/ROCz5Er8znSskZb6p2d3JouU+I5oK
         09bpKQgP0tGUzOYJnu2YQQ25OGsJ4WZzPm9B+sGJqYQTPuzCUfBbHWPF8I7QwB9B8rl9
         S/8ZEmXR2MybSGO40L1mxF1XRUmGlodMT2ABlnB7BcAJo2y1vXLkjCb62kzN361XN998
         CAWiDbBimLXowDed94n+H4yOaMVc8CnumlQHOldxIHPDN/hBUtGpv7xwbYWaRUtYWBqs
         ZoARK4y6krklXev3ipQ7pZznCDTRJzw3ZCZHq5+atHLhUR/wPtdutyfdjvNjBNJ4tz0K
         txCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744145487; x=1744750287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2tSVoUWwj8yZjrKHa1gy9/Ql4BN9AaKBR0PUj0FZYEY=;
        b=PJLs67GkCRy85t5lUSBAalV8l/urYcX4I2wSzNLb1adRNm1TjFmuS59zZjPnOzZOao
         x2xmLRSlzqXoiBw3Xc84mFz3JJqXzvzAFTq9VmhgGGB6obeskPvcUbA33GVgkndwqOwa
         gQseEGWdH9nmtbylQERX3T9EihsB816t7aXZaBs2nup0/E+EkkFYzJWEQNJ3atwbDf4s
         j2dqACSmTwDpZygGuh2zbC0G7J0T3B0EplQO1OjDRK9YRWnkXqGlp/8a3XmerXmtFYFv
         uKfblo7sa/FRMUaxO4bMBkLwvB09bP450DRJqHR72578rjsi5n/8HF7uTK6UE6d45chJ
         e1Pw==
X-Gm-Message-State: AOJu0YxYOSEkmnldQDhn8pv3Jj/KJgqW2USPl2pWZjOo9WLBsXTwar93
	vOXLsC4n3NKxbNEJogjTdg+TLt8XbXT8yIFMQ9MCrcmi1C7E2FH7/vX+xgZVT3uW8bbSLBC4IgF
	j
X-Gm-Gg: ASbGncv3xAqG43sIGGdW3TBU3KzVzVofaFpWeT79/KcHXjDDqLjQD5WWCRx/qG2oEdr
	LIKh7+sMta5VwFG+iGV0IP+lEJV426ThlHecNEFfQg0Iu3LghG6hwwyFbP9y4U70b1FZNRk7rCP
	cD9ubGRkJiqzup1nskUNCkE1TuUQaiakG5wke1MuZjQraGcWE1/SXkSy/jhEOgKW076pDOU2Y8y
	YTeihzTfCkH4PJEKHOBvARYQ2ic2nwVLIHbk6qozJip5z5pWgxyYM1KFcCVoY1phff/vT599PCR
	cCDKaD5DoCH6UKlVOCQ4bec+AQYyh6SYroTr
X-Google-Smtp-Source: AGHT+IGpXEkOl4WFBXNtvjvUMjnvNm+wt2ALIeH2K/afCTJal/yPmSoKGaP6a+OEHiBqRwhyNRA8vA==
X-Received: by 2002:a17:902:f60e:b0:223:faf5:c82 with SMTP id d9443c01a7336-22ac3f3222amr1991425ad.8.1744145486791;
        Tue, 08 Apr 2025 13:51:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:70d0:2b27:66e1:8cba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e242sm105497755ad.164.2025.04.08.13.51.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 13:51:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] ghostscript: Fix CVE-2025-27836
Date: Tue,  8 Apr 2025 13:51:04 -0700
Message-ID: <7399cf17590204f8289f356cce4575592d6e3536.1744145328.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744145328.git.steve@sakoman.com>
References: <cover.1744145328.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 20:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214563

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8b6d19b2b4079da6863ef25f2370f25d4b054919
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=d84efb73723384a8b7fb3989c824cfa218060085]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2025-27836-1.patch        | 64 +++++++++++++++++++
 .../ghostscript/CVE-2025-27836-2.patch        | 46 +++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-2.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-1.patch
new file mode 100644
index 0000000000..bd32456b99
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-1.patch
@@ -0,0 +1,64 @@
+From 8b6d19b2b4079da6863ef25f2370f25d4b054919 Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 13 Jan 2025 09:07:57 +0000
+Subject: Bug 708192: Fix potential print buffer overflow
+
+CVE-2025-27836
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8b6d19b2b4079da6863ef25f2370f25d4b054919]
+CVE: CVE-2025-27836
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ contrib/japanese/gdev10v.c | 22 ++++++++++++++++------
+ 1 file changed, 16 insertions(+), 6 deletions(-)
+
+diff --git a/contrib/japanese/gdev10v.c b/contrib/japanese/gdev10v.c
+index 0bd3cec02..9d27573dc 100644
+--- a/contrib/japanese/gdev10v.c
++++ b/contrib/japanese/gdev10v.c
+@@ -199,17 +199,25 @@ bj10v_print_page(gx_device_printer *pdev, gp_file *prn_stream)
+         int bytes_per_column = bits_per_column / 8;
+         int x_skip_unit = bytes_per_column * (xres / 180);
+         int y_skip_unit = (yres / 180);
+-        byte *in = (byte *)gs_malloc(pdev->memory->non_gc_memory, 8, line_size, "bj10v_print_page(in)");
+-        /* We need one extra byte in <out> for our sentinel. */
+-        byte *out = (byte *)gs_malloc(pdev->memory->non_gc_memory, bits_per_column * line_size + 1, 1, "bj10v_print_page(out)");
++        byte *in, *out;
+         int lnum = 0;
+         int y_skip = 0;
+         int code = 0;
+         int blank_lines = 0;
+         int bytes_per_data = ((xres == 360) && (yres == 360)) ? 1 : 3;
+ 
+-        if ( in == 0 || out == 0 )
+-                return -1;
++        if (bits_per_column == 0 || line_size > (max_int - 1) / bits_per_column) {
++            code = gs_note_error(gs_error_rangecheck);
++            goto error;
++        }
++
++        in = (byte *)gs_malloc(pdev->memory->non_gc_memory, 8, line_size, "bj10v_print_page(in)");
++        /* We need one extra byte in <out> for our sentinel. */
++        out = (byte *)gs_malloc(pdev->memory->non_gc_memory, bits_per_column * line_size + 1, 1, "bj10v_print_page(out)");
++        if ( in == NULL || out == NULL ) {
++            code = gs_note_error(gs_error_VMerror);
++            goto error;
++        }
+ 
+         /* Initialize the printer. */
+         prn_puts(pdev, "\033@");
+@@ -320,8 +328,10 @@ notz:
+            }
+ 
+         /* Eject the page */
+-xit:	prn_putc(pdev, 014);	/* form feed */
++xit:
++        prn_putc(pdev, 014); /* form feed */
+         prn_flush(pdev);
++error:
+         gs_free(pdev->memory->non_gc_memory, (char *)out, bits_per_column, line_size, "bj10v_print_page(out)");
+         gs_free(pdev->memory->non_gc_memory, (char *)in, 8, line_size, "bj10v_print_page(in)");
+         return code;
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-2.patch
new file mode 100644
index 0000000000..2e3817bdae
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2025-27836-2.patch
@@ -0,0 +1,46 @@
+From d84efb73723384a8b7fb3989c824cfa218060085 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 13 Mar 2025 11:01:16 +0000
+Subject: Fix Coverity IDs 457699 and 457700
+
+Not sure if Coverity has been updated, this is ancient contrib code
+which has not changed for a long time.
+
+However, fix the warning by initialising the pointers to NULL, and then
+avoid trying to free them if they are NULL.
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=d84efb73723384a8b7fb3989c824cfa218060085]
+CVE: CVE-2025-27836
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ contrib/japanese/gdev10v.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/contrib/japanese/gdev10v.c b/contrib/japanese/gdev10v.c
+index 9d27573dc..4d47200e5 100644
+--- a/contrib/japanese/gdev10v.c
++++ b/contrib/japanese/gdev10v.c
+@@ -199,7 +199,7 @@ bj10v_print_page(gx_device_printer *pdev, gp_file *prn_stream)
+         int bytes_per_column = bits_per_column / 8;
+         int x_skip_unit = bytes_per_column * (xres / 180);
+         int y_skip_unit = (yres / 180);
+-        byte *in, *out;
++        byte *in = NULL, *out = NULL;
+         int lnum = 0;
+         int y_skip = 0;
+         int code = 0;
+@@ -332,7 +332,9 @@ xit:
+         prn_putc(pdev, 014); /* form feed */
+         prn_flush(pdev);
+ error:
+-        gs_free(pdev->memory->non_gc_memory, (char *)out, bits_per_column, line_size, "bj10v_print_page(out)");
+-        gs_free(pdev->memory->non_gc_memory, (char *)in, 8, line_size, "bj10v_print_page(in)");
++        if (out != NULL)
++            gs_free(pdev->memory->non_gc_memory, (char *)out, bits_per_column, line_size, "bj10v_print_page(out)");
++        if (in != NULL)
++            gs_free(pdev->memory->non_gc_memory, (char *)in, 8, line_size, "bj10v_print_page(in)");
+         return code;
+ }
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index abc0238ddc..8499bb3676 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -68,6 +68,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2025-27832.patch \
                 file://CVE-2025-27834.patch \
                 file://CVE-2025-27835.patch \
+                file://CVE-2025-27836-1.patch \
+                file://CVE-2025-27836-2.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.43.0


