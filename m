Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90375C3600C
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:58:09 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.72380.1744109887451373770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=SCyaCN+2;
 spf=pass (domain: mvista.com, ip: 209.85.214.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2241053582dso67768505ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 03:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744109886; x=1744714686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZib1ookCcGDpjNEkPvtgbSXDS7RL4Re5WtCX7rtgNg=;
        b=SCyaCN+2oP7coWpkRQuQBJD/RbnQktE44FngOZApTza/6IcYXxS0PPEUfvfKo8SRrR
         S38MXupo+zblakAUgcUZz/wuNN7553qNfvyEVUIl+k6R0jREOXGKneoygsUmi6TSy2z0
         NFYJPXSDbK+yZdAqm3onPtVP0SF8pbxYmolic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109886; x=1744714686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZib1ookCcGDpjNEkPvtgbSXDS7RL4Re5WtCX7rtgNg=;
        b=JgSryZ7PXWDuoWSyVS6yYi8RaV3SqyCo7VeEPPStJa7Rs9YsV2ZxERu58cvmhC+cTz
         jAnLQxTJVN2tL/KYPTu0EUmDY4HBOTP83BBIKe0io77nf+nG+zKa9ZqTFzaCZsdN61tq
         WGIZezo3CvuzGwTho2LbTi0mE54x2Szas4lAvzsWAra4I0tkMY5iFSyQW0xS9t36+kXI
         q5/9VT7oyjCs/OgY+krUVwwKz9ckKMZBL8EOJ2NoUwc40yEOD8FbuPZQZCYY8rGSSPU6
         UZ93wnurncE7k1MskHi0dS38YPV4juNBsyRrRWSL+othH+M4qEcPpfuRFrJK9thSNysc
         /dJg==
X-Gm-Message-State: AOJu0Yx9mLsOh0QYN1gUsNUXBZTfQF8OGAIlC+eNF9WzsxGjDm6XsBd6
	RqW14LXif0vwzA+wQQz8emuX+kuMBTDCpMM/vzSq/Qm+5to8CA0Um/CoRFGHxM3S0fAXaUxcwaC
	uWS8=
X-Gm-Gg: ASbGnctTmi3xMOfq4LQE+WD5PlV8YyQcygJr/EQ3YYOu4R3yfhirMo9v5eXuhvCWDpN
	ovhDCENndos3pPrVEsl5LH+xHvh5l0AVsIPjhQL5J1J41a+GzQ1shFPLsLyXLUjIaLG0fdTbWPd
	9roViXoR+O/Nz5YXjU9x1d9R2qAx7tKKZ1rrR4e4NqfkN92VHbwDLtGGagk5ihncs5Ehr3uZM+s
	b/TT+hUEGH4/6FWtkFTnHnH8QYg00xPtENQyT7nugrpHu9PoCTW/PBlfhjouwfGT4LRZhjQexFZ
	yj5mtdrQexq4esgb91blKNhpnBLhBJpC6gia7pqB//QDgWgvHOON0nJ3
X-Google-Smtp-Source: AGHT+IE95CwITunaROV8s2kSyIgjRp55WgKIKSODCHRrTnqrEycvI2xeRhfwnPqPpYmI6P5BLVjNig==
X-Received: by 2002:a17:903:8c7:b0:21f:71b4:d2aa with SMTP id d9443c01a7336-22a8a042b20mr235977095ad.5.1744109886259;
        Tue, 08 Apr 2025 03:58:06 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe34sm97696255ad.67.2025.04.08.03.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:58:05 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 6/6] ghostscript: Fix CVE-2025-27836
Date: Tue,  8 Apr 2025 16:27:21 +0530
Message-Id: <20250408105721.1798123-6-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250408105721.1798123-1-vanusuri@mvista.com>
References: <20250408105721.1798123-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:58:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214531

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=8b6d19b2b4079da6863ef25f2370f25d4b054919
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=d84efb73723384a8b7fb3989c824cfa218060085]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


