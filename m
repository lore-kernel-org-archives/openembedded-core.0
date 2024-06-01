Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B2CC41513
	for <webhook@archiver.kernel.org>; Sat,  1 Jun 2024 12:25:06 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.36153.1717244701018805677
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jun 2024 05:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=rEpm3aYr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1f65a3abd01so1774825ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1717244700; x=1717849500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNmHJ8ghS4KyE8+EYkuwnwIt1TAolfVhKWlq5d94kxQ=;
        b=rEpm3aYr/NUY2XQs1u6T9jnFS8l10JGwqC6PsXRtvtwLA+xzJSIS7KOD+1fQc2gPit
         WwO/Q6SHkMVnsL+5S6zLQmRIlkiE60iOZEjEWXkstwX8wxbKKNOE3h+n/c4o9wmCG5nT
         2t78z83eBnA/xpYAwSk8q18cXTUb2tFDt0jtfy7+6eXhOLneF3zkX2qn6wSTeGqZSi1z
         7QKAm/keG9gSDY6EG9z2zui7HOEX5IMeeyBuu5SJFrVwX+hpeHU3ho2acEyai+Jvdiuq
         L7vdCPdJ3o8+z9SznhQezHFR3h9Rat+N5qjwx0CzK0sOKM4Rvl1culV/wVNI9OwJTjfU
         Krmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717244700; x=1717849500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNmHJ8ghS4KyE8+EYkuwnwIt1TAolfVhKWlq5d94kxQ=;
        b=PicmDQz9QUSC/omTwycEkZ1ESFVgc8WhgVDmX0y7UmbH8ysuVAFHvypQwv37BaNhre
         ccELGc5Edphs58hizrj0liamHZ3qgfGzNDvuR9tTyDwNN5jkKwP6wzITmKaNPdk0nP9Y
         0PIAR0zZlyZwdr4SwRTqzA/OR5voT32TxVkhdm1GzHKVWqCsG80CtukvoAEaPrlZcsKl
         JyXCbqyweYHSeRFEEAEDsff3piX2uXxOQ4XWuU9ypzPoI0oH7xCFfyFderCxFs9YWUb4
         8FFQIOFm6oEo3rWqGzvb8B2Xuzlu1qbMm3Vvs9PdXcJF/Is6/IPkG/BwSWXO4M8hdLDC
         /n0Q==
X-Gm-Message-State: AOJu0YzNdn4Tq+u5IIUM8DeqvTcioIgh6Ti+wZAekS9rrL1X07ARRNNU
	9o/3JYnbhsKkj32+tQUcjFV4rfPsXrKp5VL2QMKliFq2mTkQI2stULY/8zOzHG70bqV9ziP3Ql5
	G
X-Google-Smtp-Source: AGHT+IE2u3EhuRPLQNeesPHmNf+ScisNYTnLrYZKqkIkuJ+p0/16n7KYzxiM/XMMmjZtyCA+uby5qw==
X-Received: by 2002:a17:902:d2d0:b0:1f4:af72:35da with SMTP id d9443c01a7336-1f6370b120bmr56531065ad.65.1717244700214;
        Sat, 01 Jun 2024 05:25:00 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f63241d4d9sm31804165ad.296.2024.06.01.05.24.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 05:24:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/21] ghostscript: fix CVE-2024-33870
Date: Sat,  1 Jun 2024 05:24:30 -0700
Message-Id: <b95a08ec9f70a0b21f5fc239eda1857cea54702f.1717243719.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717243719.git.steve@sakoman.com>
References: <cover.1717243719.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jun 2024 12:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200100

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-33870.patch          | 99 +++++++++++++++++++
 .../ghostscript/ghostscript_10.02.1.bb        |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
new file mode 100644
index 0000000000..9c2b9dcfa2
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-33870.patch
@@ -0,0 +1,99 @@
+From 79aef19c685984dc3da2dc090450407d9fbcff80 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Tue, 26 Mar 2024 12:00:14 +0000
+Subject: [PATCH 1/5] Bug #707686
+
+See bug thread for details
+
+In addition to the noted bug; an error path (return from
+gp_file_name_reduce not successful) could elad to a memory leak as we
+did not free 'bufferfull'. Fix that too.
+
+This addresses CVE-2024-33870
+
+CVE: CVE-2024-33870
+
+Upstream-Status: Backport [https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=79aef19c685984dc]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ base/gpmisc.c | 36 ++++++++++++++++++++++++++++++++----
+ 1 file changed, 32 insertions(+), 4 deletions(-)
+
+diff --git a/base/gpmisc.c b/base/gpmisc.c
+index 2b0064b..c4a69b0 100644
+--- a/base/gpmisc.c
++++ b/base/gpmisc.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2024 Artifex Software, Inc.
+    All Rights Reserved.
+
+    This software is provided AS-IS with no warranty, either express or
+@@ -1042,7 +1042,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                      const uint         len,
+                      const char        *mode)
+ {
+-    char *buffer, *bufferfull;
++    char *buffer, *bufferfull = NULL;
+     uint rlen;
+     int code = 0;
+     const char *cdirstr = gp_file_name_current();
+@@ -1096,8 +1096,10 @@ gp_validate_path_len(const gs_memory_t *mem,
+             return gs_error_VMerror;
+
+         buffer = bufferfull + prefix_len;
+-        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success)
+-            return gs_error_invalidfileaccess;
++        if (gp_file_name_reduce(path, (uint)len, buffer, &rlen) != gp_combine_success) {
++            code = gs_note_error(gs_error_invalidfileaccess);
++            goto exit;
++        }
+         buffer[rlen] = 0;
+     }
+     while (1) {
+@@ -1132,9 +1134,34 @@ gp_validate_path_len(const gs_memory_t *mem,
+             code = gs_note_error(gs_error_invalidfileaccess);
+         }
+         if (code < 0 && prefix_len > 0 && buffer > bufferfull) {
++            uint newlen = rlen + cdirstrl + dirsepstrl;
++            char *newbuffer;
++            int code;
++
+             buffer = bufferfull;
+             memcpy(buffer, cdirstr, cdirstrl);
+             memcpy(buffer + cdirstrl, dirsepstr, dirsepstrl);
++
++            /* We've prepended a './' or similar for the current working directory. We need
++             * to execute file_name_reduce on that, to eliminate any '../' or similar from
++             * the (new) full path.
++             */
++            newbuffer = (char *)gs_alloc_bytes(mem->thread_safe_memory, newlen + 1, "gp_validate_path");
++            if (newbuffer == NULL) {
++                code = gs_note_error(gs_error_VMerror);
++                goto exit;
++            }
++
++            memcpy(newbuffer, buffer, rlen + cdirstrl + dirsepstrl);
++            newbuffer[newlen] = 0x00;
++
++            code = gp_file_name_reduce(newbuffer, (uint)newlen, buffer, &newlen);
++            gs_free_object(mem->thread_safe_memory, newbuffer, "gp_validate_path");
++            if (code != gp_combine_success) {
++                code = gs_note_error(gs_error_invalidfileaccess);
++                goto exit;
++            }
++
+             continue;
+         }
+         else if (code < 0 && cdirstrl > 0 && prefix_len == 0 && buffer == bufferfull) {
+@@ -1153,6 +1180,7 @@ gp_validate_path_len(const gs_memory_t *mem,
+                                            gs_path_control_flag_is_scratch_file);
+     }
+
++exit:
+     gs_free_object(mem->thread_safe_memory, bufferfull, "gp_validate_path");
+ #ifdef EACCES
+     if (code == gs_error_invalidfileaccess)
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
index 3dff16eec2..ca6f628f38 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.02.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://ghostscript-9.16-Werror-return-type.patch \
            file://avoid-host-contamination.patch \
            file://configure.ac-add-option-to-explicitly-disable-neon.patch \
+           file://CVE-2024-33870.patch \
            "
 
 SRC_URI[sha256sum] = "e429e4f5b01615a4f0f93a4128e8a1a4d932dff983b1774174c79c0630717ad9"
-- 
2.34.1


